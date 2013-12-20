from django import forms
from django.conf import settings
from django.contrib.auth.models import User
from django.utils.translation import ugettext as _
from django.core.urlresolvers import reverse

from artminster.core.apps.profile.forms import UserProfileForm as _UserProfileForm

class UserProfileForm(_UserProfileForm):
	pass
