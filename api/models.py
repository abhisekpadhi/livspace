from django.db import models
from django.core.validators import RegexValidator
from django.core.validators import URLValidator

class User(models.Model):
    email = models.EmailField(null=False)
    created_at = models.DateTimeField(auto_now=True)
    status = models.TextField(null=True)

# class TreeNode(models.Model):
#     title = models.CharField(max_length=255, null=False)
#     is_leaf = models.BooleanField(default=False)
#     is_root = models.BooleanField(default=False)
#     parent_node = models.BigIntegerField(null=True)
#     prompt_text = models.TextField(null=True, blank=True)
#     action_template = models.CharField(max_length=1024, null=True)
#     created_at = models.DateTimeField(auto_now=True)
#     ack_text = models.CharField(max_length=1024, null=True)                 #Reserved for future use
#     priority = models.BigIntegerField(null=True)                            #Reserved for future use

class Question(models.Model):
    text = models.TextField(null=False)
    type_for_customer = models.CharField(max_length=1024, null=True)
    name = models.CharField(max_length=1024, null=False)
    type_for_designer = models.CharField(max_length=1024, null=True)

class Choice(models.Model):
    question = models.ForeignKey('Question', on_delete=models.CASCADE, null=True)
    text = models.CharField(max_length=1024, null=False)
    is_inactive = models.BooleanField(default=False)

class Tag(models.Model):
    question = models.ForeignKey('Question', on_delete=models.CASCADE, null=True)
    choice = models.ForeignKey('Choice', on_delete=models.CASCADE, null=True)

class Design(models.Model):
    image_url = models.TextField(validators=[URLValidator()], null=False)
    # image_file = models.FileField(upload_to='static/images/', null=True)

class DesignTagMapping(models.Model):
    design = models.ForeignKey('Design', on_delete=models.CASCADE, null=True)
    tag = models.ForeignKey('Tag', on_delete=models.CASCADE, null=True)

class RelatedTagMap(models.Model):
    tag_1 = models.ForeignKey('Tag', on_delete=models.CASCADE, null=True, related_name='%(class)s')
    tag_2 = models.ForeignKey('Tag', on_delete=models.CASCADE, null=True, related_name='%(class)s_related')
