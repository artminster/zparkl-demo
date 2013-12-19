# -*- coding: utf-8 -*-
from django.db import models
from django.conf import settings
from django.contrib.auth.models import User
from django.utils.translation import ugettext_lazy as _
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes import generic
from django.core import serializers

from cms.models.pluginmodel import CMSPlugin
from artminster.core.utils.abstract_models import BaseModel, TitleAndSlugModel
from artminster.core.utils.model_utils import get_upload_to, get_namedtuple_choices
import os, random, string

### POSTS #################################################
###########################################################
class Post(BaseModel):
    """
    This simple model has been created to simulate a post from a user
    """
    CATEGORIES = get_namedtuple_choices('POST_CATEGORIES', (
        (1, 'GENERIC', _(u'Generic')),
        (1, 'SPORTS', _(u'Sports')),
        (2, 'MUSIC', _(u'Music')),
        (3, 'HEALTH', _(u'HEALTH')),
    ))

    def _get_upload_to(instance, filename):
        return get_upload_to(instance, 'uploads/posts/images', filename)

    # attributes
    title = models.CharField(max_length=255)
    text = models.TextField()
    image = models.ImageField(upload_to=_get_upload_to)
    category = models.PositiveSmallIntegerField(choices=CATEGORIES.get_choices(), 
                                                default=CATEGORIES.GENERIC)
    
    # shortcuts
    total_comments = models.PositiveIntegerField(default=0)
    total_likes = models.PositiveIntegerField(default=0)

    def __unicode__(self):
        return self.text

    def update_total_likes(self):
        self.total_likes = Like.count_for_object(self)
        super(self.__class__, self).save()

    def update_total_comments(self):
        self.total_comments = self.comments.count()
        super(self.__class__, self).save()
    
    def get_comments(self, json=True):
        comments = self.comments.all()
        return serializers.serialize('json', comments, use_natural_keys=True) if json else comments
    

### COMMENTS ##############################################
###########################################################
class Comment(BaseModel):
    """
    This module is used to simulate a comment
    """
    post = models.ForeignKey(Post, related_name='comments')
    user = models.ForeignKey(User, related_name='post_comments')
    text = models.TextField()
    
    # shortcuts
    total_likes = models.PositiveIntegerField(default=0)

    def save(self, *args, **kwargs):
        super(self.__class__, self).save(*args, **kwargs)
        self.post.update_total_comments()
    
    def delete(self):
        post = self.post
        super(self.__class__, self).delete()
        post.update_total_comments()

    def update_total_likes(self):
        self.total_likes = Like.count_for_object(self)
        super(self.__class__, self).save()

    def get_json(self):
        return serializers.serialize('json', [self], use_natural_keys=True)

    def __unicode__(self):
        return self.text


### LIKES #################################################
###########################################################
class Like(BaseModel):
    """
    This is a generic like module to save the unique likes
    from the posts and comments
    """
    class Meta:
        unique_together = ('content_type', 'object_id', 'user')
    
    content_type = models.ForeignKey(ContentType)
    object_id = models.PositiveIntegerField()
    content_object = generic.GenericForeignKey('content_type', 'object_id')
    user = models.ForeignKey(User, related_name='likes')
    
    @staticmethod
    def count_for_object(obj):
        obj_type = ContentType.objects.get_for_model(obj)
        return Like.objects.filter(content_type__id=obj_type.id, 
                                   object_id=obj.id).count()
    
    def save(self, *args, **kwargs):
        super(self.__class__, self).save(*args, **kwargs)
        self.content_object.update_total_likes()
    
    def delete(self):
        content_object = self.content_object
        super(self.__class__, self).delete()
        content_object.update_total_likes()
    
    def __unicode__(self):
        return u'%s likes %s' % (self.post, self.user)
