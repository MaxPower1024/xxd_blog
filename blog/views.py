from django.shortcuts import render, get_object_or_404
from .models import Post, Category, Tag
import markdown
from comments.forms import CommentForm
from django.views.generic import ListView, DeleteView
from markdown.extensions.toc import TocExtension
from django.utils.text import slugify
from django.core.paginator import Paginator


class IndexView(ListView):
    model = Post
    template_name = 'blog/index.html'
    context_object_name = 'post_list'
    
    paginate_by = 4
    
    def get_context_data(self, **kwargs):
        # 得到父类生成的传递给模板的字典
        # context此时为字典，具有paginator、page_obj、is_paginated 这三个模板变量
        context = super().get_context_data(**kwargs)
        
        paginator = context.get('paginator')
        page = context.get('page_obj')
        is_paginated = context.get('is_paginated')
        
        pagination_data = self.pagination_data(paginator, page, is_paginated)
        context.update(pagination_data)
        
        return context
    
    def pagination_data(self, paginator, page, is_paginated):
        if not is_paginated:
            # 若没有分页，就不需要分页分页导航调的数据因此返回一个空的字典
            return {}
        # 当前页左右两边连续的页码号，初始值为空
        left = []
        right = []
        
        left_has_more = False
        right_has_more = False
        
        # 标示是否需要显示第 1 页的页码号。
        # 因为如果当前页左边的连续页码号中已经含有第 1 页的页码号，此时就无需再显示第 1 页的页码号，
        # 其它情况下第一页的页码是始终需要显示的。
        # 初始值为 False
        
        first = False
        last = False
        # 获得当前请求的页码号
        page_number = page.number
        # 获取分页后的总页数
        total_pages = paginator.num_pages
        # 获取整个分页页码的列表
        page_range = paginator.page_range
        
        if page_number == 1:
            # 用户请求的是第一页的数据，那么当前页的左边不需要数据，因此left=[](已经默认为空)
            # 此时只要获取当前页右边的连续页码就可以了
            right = page_range[page_number:page_number + 2]
            if right[-1] < total_pages - 1:
                right_has_more = True
            if right[-1] < total_pages:
                last = True
        elif page_number == total_pages:
            left = page_range[(page_number - 3) if (page_number - 3) > 0 else 0:page_number - 1]
            if left[0] > 2:
                left_has_more = True
            if left[0] > 1:
                first = True
        else:
            left = page_range[(page_number - 3) if (page_number - 3) > 0 else 0:page_number - 1]
            right = page_range[page_number:page_number + 2]
            if right[-1] < total_pages - 1:
                right_has_more = True
            if right[-1] < total_pages:
                last = True
            if left[0] > 2:
                left_has_more = True
            if left[0] > 1:
                first = True
        data = {
            'left': left,
            'right': right,
            'left_has_more': left_has_more,
            'right_has_more': right_has_more,
            'first': first,
            'last': last,
        }
        return data


class ArticleView(ListView):
    model = Post
    template_name = 'blog/article.html'
    context_object_name = 'post_list'

class PostDetailView(DeleteView):
    model = Post
    template_name = 'blog/detail.html'
    context_object_name = 'post'
    
    def get(self, request, *args, **kwargs):
        response = super(PostDetailView, self).get(request, *args, **kwargs)
        self.object.increase_views()
        return response
    
    def get_object(self, queryset=None):
        # 覆写 get_object 方法的目的是因为需要对 post 的 body 值进行渲染
        post = super(PostDetailView, self).get_object(queryset=None)
        md = markdown.Markdown(extensions=[
            'markdown.extensions.extra',
            'markdown.extensions.codehilite',
            TocExtension(slugify=slugify)
        ])
        post.body = md.convert(post.body)
        post.toc = md.toc
        return post
    
    def get_context_data(self, **kwargs):
        context = super(PostDetailView, self).get_context_data(**kwargs)
        form = CommentForm()
        comment_list = self.object.comment_set.all()
        context.update({
            'form': form,
            'comment_list': comment_list
        })
        return context


class CategoryView(ListView):
    model = Post
    template_name = 'blog/index.html'
    context_object_name = 'post_list'
    
    def get_queryset(self):
        cate = get_object_or_404(Category, pk=self.kwargs.get('pk'))
        return super(CategoryView, self).get_queryset().filter(category=cate)


class TagView(ListView):
    model = Post
    template_name = 'blog/index.html'
    context_object_name = 'post_list'
    
    def get_queryset(self):
        tag = get_object_or_404(Tag, pk=self.kwargs.get('pk'))
        return super(TagView, self).get_queryset().filter(tags=tag)
