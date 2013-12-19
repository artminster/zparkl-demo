from django import template
from apps.posts.models import *
import random

register = template.Library()

@register.assignment_tag
def get_post():
    print Post.objects.latest('id').get_comments()
    return random.choice(list(Post.objects.all()))

