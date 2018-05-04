from django.contrib import admin
from .models import Post, Category, Tag
# from django_summernote.admin import SummernoteInlineModelAdmin


class PostAdmin(admin.ModelAdmin):
    list_display = ['title', 'created_time', 'category', ]


admin.site.register(Post, PostAdmin)
admin.site.register(Category)
admin.site.register(Tag)
