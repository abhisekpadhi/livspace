from django import forms

class DesignersForm(forms.Form):
    user_id = forms.IntegerField(label='user_id')
    tags = forms.CharField(label='tags', max_length=1024)
    image_file = forms.FileField(label='image_file')
