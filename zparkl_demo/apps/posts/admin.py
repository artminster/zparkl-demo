from django.contrib import admin
from models import *

class CommentsInline(admin.TabularInline):
	model = Comment
class PostAdmin(admin.ModelAdmin):
	list_display = ('title', 'category', 'total_comments', 'total_likes')
	inlines = [CommentsInline]
admin.site.register(Post, PostAdmin)
