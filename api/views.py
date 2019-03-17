# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.views import View
from django.shortcuts import redirect, render
from django.urls import reverse
from django.http import JsonResponse
from django.forms import model_to_dict
from api.models import *
import json
from django.core.files.storage import FileSystemStorage
from pprint import pprint


class Home(View):
    def get(self, request):
        response = {
            "status": "success"
        }
        return JsonResponse(response)

class QuestionApi(View):
    def get(self, request):
        '''
        Retrieves Questions and Answers.
        :param request: django request object
        :return: JsonResponse
        '''
        queryset = Question.objects.all()
        if queryset:
            questions = []
            for query in queryset:
                questions.append({
                    "question": [model_to_dict(query)],
                    "choice": [model_to_dict(choice) for choice in Choice.objects.filter(question=query)]
                })

            response = {
                "status": "success",
                "message": {
                    "questions": questions
                }
            }
            HTTP_STATUS = 200
        else:
            response = {
                "status": "success",
                "message": {
                    "questions": None
                }
            }
            HTTP_STATUS = 200
        return JsonResponse(response, safe=False, status=HTTP_STATUS)

    def post(self, request):
        '''
        Receives choices of user.
        Req. body example:
        {'tags': [{'choice': 2, 'question': 1}], 'user_id': 1}
        :param request: django request object
        :return: django response object
        '''
        request_json = json.loads(request.body)
        purchase_profile = (request_json['user_id'], self.retrieve_tags_ids(request_json['tags']))
        designs = [model_to_dict(design) for design in self.recommend_designs(purchase_profile)]
        for design in designs:
            design['image_url'] = request.build_absolute_uri(design['image_url'])
        response = {
            "status": "success",
            "message": {
                "designs": designs
            }
        }
        HTTP_STATUS = 200
        return JsonResponse(response, safe=False, status=HTTP_STATUS)


    def retrieve_tags_ids(self, tags):
        '''
        Replace tags with Tag objects in purchase_profile.
        example of `tags`:
        [{'choice': 2, 'question': 1}]
        :param tags: list of dictionary of question_id and choice_id
        :return: set containing user_id and list of tag_ids
        '''
        return [Tag.objects.get(question=tag['question'], choice=tag['choice']) for tag in tags]

    def get_related_tags_ids(self, tag):
        '''
        Returns unique list of related tag_ids.
        :param tag: Tag object
        :return: list of related tag_ids
        '''
        tags = [tag.id]
        if RelatedTagMap.objects.filter(tag_1_id=tag.id).exists():
            for tag in RelatedTagMap.objects.filter(tag_1_id=tag.id):
                tags.append(tag.tag_2_id)

        if RelatedTagMap.objects.filter(tag_2_id=tag.id).exists():
            for tag in RelatedTagMap.objects.filter(tag_2_id=tag.id):
                tags.append(tag.tag_1_id)

        return set(tags)


    def recommend_designs(self, purchase_profile):
        '''
        Returns recommended designs for a purchase_profile.
        :param purchase_profile: set containing user_id and list of tags
        :return: list of design objects
        '''
        selected_tags = []
        designs = []
        designs_ids = []
        for tag in purchase_profile[1]:
            for tag in self.get_related_tags_ids(tag):
                selected_tags.append(Tag.objects.get(id=tag))

        for tag in selected_tags:
            for design_tag in DesignTagMapping.objects.filter(tag=tag):
                if design_tag.design.id not in designs_ids:
                    designs.append(design_tag.design)
                    designs_ids.append(design_tag.design.id)

        return designs

class DesginerApi(View):
    def post(self, request):
        '''
        Receives choices of designer.
        :param request: django request object
        :return: django response object
        '''
        question_api = QuestionApi()
        user_id = request.POST.get('user_id')
        tags = question_api.retrieve_tags_ids([json.loads(tag) for tag in request.POST.getlist('tags[]')])
        designer_profile = (user_id, tags)

        image_file = request.FILES.get('image_file')
        if image_file and user_id and tags:
            fs = FileSystemStorage()
            filename = fs.save(image_file.name, image_file)
            uploaded_file_url = fs.url(filename)            # /static/images/X_217c5312.jpg

            '''Create design'''
            design = self.create_design(uploaded_file_url)

            '''Create_design_tag_mapping'''
            mappings = self.create_design_tag_mapping(designer_profile[1], design)

            response = {
                "status": "success",
                "message": "Updated design tag mapping."
            }
            HTTP_STATUS = 200
        else:
            response = {
                "status": "failed",
                "message": "Bad request."
            }
            HTTP_STATUS = 400
        return JsonResponse(response, safe=False, status=HTTP_STATUS)

    def create_design(self, image_url):
        design = Design(image_url=image_url)
        design.save()
        return design

    def create_design_tag_mapping(self, tags, design):
        mappings = []
        for tag in tags:
            design_tag_mapping = DesignTagMapping(
                design=design,
                tag=tag
            )
            design_tag_mapping.save()
            mappings.append(design_tag_mapping)
        return mappings