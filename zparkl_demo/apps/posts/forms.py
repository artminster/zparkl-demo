from django import forms
from django.conf import settings
from django.contrib.auth.models import User
from django.utils.translation import ugettext as _
from django.core.urlresolvers import reverse

from models import *

class CommentForm(forms.ModelForm):
	class Meta:
		model = Comment
		fields = ('text',)

	def __init__(self, *args, **kwargs):
		self.user = kwargs.pop('user')
		self.post = kwargs.pop('post')
		super(CommentForm, self).__init__(*args, **kwargs)
		
	def save(self, commit=True):
		comment = super(CommentForm, self).save(commit=False)
		comment.user = self.user
		comment.post = self.post
		if commit:
			comment.save()
		return comment