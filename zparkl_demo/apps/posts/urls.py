from django.conf.urls.defaults import patterns, include, url
from django.contrib.auth.decorators import login_required, permission_required
from django.conf import settings

from views import *
urlpatterns = patterns('',
    url(r"^(?P<post_id>\d+)/post-new-comment/$", CommentCreateView.as_view(),  name="post_new_comment"),
)
