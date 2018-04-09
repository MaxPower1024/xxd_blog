# coding:utf-8
from django.db import models
from django.contrib.auth.models import User
from django.utils.six import python_2_unicode_compatible
from django.urls import reverse
# 分类
@python_2_unicode_compatible
class Category(models.Model):
    name = models.CharField(max_length=100)
    
    def __str__(self):
        return self.name

# 标签
@python_2_unicode_compatible
class Tag(models.Model):
    name = models.CharField(max_length=100)
    
    def __str__(self):
        return self.name
    

# 文章
@python_2_unicode_compatible
class Post(models.Model):
    # 标题
    title = models.CharField(max_length=100)

    # 正文
    body = models.TextField()
    # 创建时间
    created_time = models.DateField()
    
    category = models.ForeignKey(Category)
    tags = models.ManyToManyField(Tag, blank=True)
    # 自己的blog，不用创建作者模型
    def __str__(self):
        return self.title
    
    def get_absolute_url(self):
        return reverse('blog:detail',kwargs={'pk':self.pk})
    
    