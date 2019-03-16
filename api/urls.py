from django.conf.urls import include, url
from . import views
from django.views.generic.base import RedirectView

urlpatterns = [
    url(r'^$', views.Home.as_view(), name='Home'),
    url(r'users/', views.UserView.as_view(), name='UsersView'),
    url(r'questions/', views.QuestionApi.as_view(), name='QuestionApi')
    # url(r'chats/', views.ChatView.as_view(), name='ChatView')
]