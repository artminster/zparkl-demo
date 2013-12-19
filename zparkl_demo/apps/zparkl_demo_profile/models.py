from django.db import models
from django.conf import settings
from django.contrib.auth.models import User
from django.utils.translation import ugettext_lazy as _
from django.db.models.signals import pre_delete, post_save, pre_save
from django.dispatch import receiver
from django.core.mail import EmailMessage
from django.template import loader, Context
from django.core.urlresolvers import reverse
from django.template.loader import render_to_string
import re, unicodedata
import datetime

from filebrowser.functions import version_generator
from artminster.core.utils.fields import AutoOneToOneField
from artminster.core.utils.abstract_models import BaseModel
from artminster.core.utils.model_utils import get_upload_to, get_namedtuple_choices
from artminster.core.apps.profile.models import UserProfile as _UserProfile  

class UserProfile(_UserProfile):
	"""
	Profile and configurations for a user
	"""
	def _get_upload_to(instance, filename):
		return get_upload_to(instance, 'uploads/profiles/images', filename)
	
	bio = models.TextField(null=True, blank=True)
	profile_image = models.ImageField(upload_to=_get_upload_to, default=settings.DEFAULT_PROFILE_IMAGE)

def natural_key(self):
	profile = self.profile
	return {
		'name': self.get_full_name() if self.first_name else self.username,
		'profile_image': version_generator(profile.profile_image.path, 'profile-image-thumb').replace(settings.MEDIA_ROOT, settings.MEDIA_URL),
	}
User.natural_key = natural_key