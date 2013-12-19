from django.core.urlresolvers import reverse
from django.contrib import messages
from django.contrib.auth.models import User
from django.views.generic import TemplateView, FormView
from django.views.generic.detail import DetailView
from django.views.generic.edit import CreateView, UpdateView, DeleteView

from models import *
from forms import *
from utils import *

"""
Base post views 
"""
class CommentCreateView(PostItemMixin, CreateView):
    model = Comment
    form_class = CommentForm
    
    def get_form_kwargs(self):
        """
        For this demo version I'm adding a random user instead request.user
        """
        kwargs = super(CommentCreateView, self).get_form_kwargs()
        kwargs.update({'user': User.objects.latest('id'), 'post': self.parent })
        return kwargs
    
    def form_valid(self, form):
        comment = form.save()
        return http.HttpResponse(comment.get_json(), content_type='application/json')

