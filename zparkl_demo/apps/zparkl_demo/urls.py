from django.conf.urls.defaults import patterns, include, url
from django.contrib.auth.decorators import login_required, permission_required
from django.conf import settings

from views import *
urlpatterns = patterns('',
	url(r"^$", Home.as_view(),  name="home"),
)
