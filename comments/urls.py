from django.conf.urls import url
from . import views

app_name = 'comments'
urlpattern=[
    url(r'^comment/post/(?P<post_pk>[0-9]+)/$', views.post_comment, name='post_comment')
]
