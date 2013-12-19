from django import http

from models import Post
class PostItemMixin(object):
    client = None
    
    def dispatch(self, request, *args, **kwargs):
        try:
            self.parent = Post.objects.get(id=kwargs.get('post_id', 0))
        except Post.DoesNotExist:
            raise http.Http404()
        return super(PostItemMixin, self).dispatch(request, *args, **kwargs)
