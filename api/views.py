# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.views import View
from django.shortcuts import redirect, render
from django.urls import reverse
from django.http import JsonResponse
from django.forms import model_to_dict
from api.models import *
import json
# from api.tree import Node
# from api.decision import Decider
from pprint import pprint
import collections


class Home(View):
    def get(self, request):
        response = {
            "status": "success"
        }
        return JsonResponse(response)


class UserView(View):
    def get(self, request):
        '''
        Retrieves a user.
        :param request: django request object
        :return: JsonResponse
        '''
        queryset = User.objects.filter(email=request.GET.get('email', None))
        if queryset:
            response = [model_to_dict(user) for user in queryset]
            HTTP_STATUS = 200
        else:
            response = {
                "status": "failed",
                "message": "No email provided/User does not exists."
            }
            HTTP_STATUS = 404
        return JsonResponse(response, safe=False, status=HTTP_STATUS)

    def post(self, request):
        '''
        Creates a user.
        Notes:
        Date format: %d-%m-%Y

        :param request: django request object
        :return: JsonResponse
        '''
        jsonData = json.loads(request.body)
        print(jsonData)
        if 'email' not in jsonData.keys():
            status = "failed"
            status_message = "Missing email field."
        elif not User.objects.filter(email=jsonData['email']).exists():
            User(
                email=jsonData['email']
            ).save()
            status = "success"
            status_message = "User created."
        else:
            status = "success"
            status_message = "User already exists."
        # Build response
        response = {
            "status": status,
            "status_message": status_message
        }
        return JsonResponse(response)

    def put(self, request):
        '''
        Updates a user.
        :param request: django request object
        :return: JsonResponse
        '''
        jsonData = json.loads(request.body)
        print(jsonData)
        if 'email' not in jsonData.keys():
            status = "failed"
            status_message = "Email is required to update user."
            HTTP_STATUS = 400
        elif not User.objects.filter(email=jsonData['email']).exists():
            status = "failed"
            status_message = "User does not exists."
            HTTP_STATUS = 404
        else:
            User.objects.filter(email=jsonData['email']).update(
                phone_number=jsonData['phone_number'] if 'phone_number' in jsonData.keys() else None,
                permanent_addr=jsonData['permanent_addr'] if 'permanent_addr' in jsonData.keys() else None,
                current_addr=jsonData['current_addr'] if 'current_addr' in jsonData.keys() else None,
                aadhar_number=jsonData['aadhar_number'] if 'aadhar_number' in jsonData.keys() else None,
                dl_number=jsonData['dl_number'] if 'dl_number' in jsonData.keys() else None,
                birth_certificate_serial=jsonData['birth_certificate_serial'] if 'birth_certificate_serial' in jsonData.keys() else None,
                date_of_birth=jsonData['date_of_birth'] if 'date_of_birth' in jsonData.keys() else None
            )
            status = "success"
            status_message = "User updated."
            HTTP_STATUS = 200
        response = {
            "status": status,
            "status_message": status_message
        }
        return JsonResponse(response, status=HTTP_STATUS)

    def delete(self, request):
        '''
        Deletes a user
        :param request: django request obj
        :return: JsonResponse
        '''
        jsonData = json.loads(request.body)
        print(jsonData)
        if 'email' not in jsonData.keys():
            status = "failed"
            status_message = "Email is required to delete user."
            HTTP_STATUS = 400
        elif not User.objects.filter(email=jsonData['email']).exists():
            status = "failed"
            status_message = "User does not exists."
            HTTP_STATUS = 404
        else:
            User.objects.filter(email=jsonData['email']).delete()
            status = "success"
            status_message = "User deleted."
            HTTP_STATUS = 200
        response = {
            "status": status,
            "status_message": status_message
        }
        return JsonResponse(response, status=HTTP_STATUS)


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
        :return: Design objects
        '''
        request_json = json.loads(request.body)
        purchase_profile = (request_json['user_id'], self.retrieve_tags_ids(request_json['tags']))
        designs = [model_to_dict(design) for design in self.recommend_designs(purchase_profile)]
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
        tags = []
        if RelatedTagMap.objects.filter(tag_1=tag).exists():
            tags.append([tag.id for tag in RelatedTagMap.objects.filter(tag_1=tag)])

        if RelatedTagMap.objects.filter(tag_2=tag).exists():
            tags.append([tag.id for tag in RelatedTagMap.objects.filter(tag_2=tag)])

        return set(tags)


    def recommend_designs(self, purchase_profile=collections.namedtuple('purchase_profile', ['user_id', 'tags'])):
        '''
        Returns recommended designs for a purchase_profile.
        :param purchase_profile: set containing user_id and list of tags
        :return: list of design objects
        '''
        selected_tags = []
        designs = []

        for tag in purchase_profile.tags:
            selected_tags.append([Tag.objects.get(id=tag) for tag in self.get_related_tags_ids(tag)])

        for tag in selected_tags:
            designs.append([design_tag.design for design_tag in DesignTagMapping.objects.filter(tag=tag)])

        return designs