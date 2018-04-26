from ..models import Post, Category, Tag
from django import template
from django.db.models.aggregates import Count

register = template.Library()


@register.simple_tag
def get_recent_posts(num=10):
    return Post.objects.all().order_by('-created_time')[:num]


@register.simple_tag
def get_categories():
    return Category.objects.annotate(num_posts=Count('post')).filter(num_posts__gt=0)


@register.simple_tag
def get_tags():
    return Tag.objects.annotate(num_posts=Count('post')).filter(num_posts__gt=0)


@register.assignment_tag
def pagination(current_page, paginator, num_of_displaypages=10, num_of_backpages=4):
    #  current_page is a django.core.paginator.Page 's instance
    #  paginator is a django.core.paginator.Paginator 's instance
    #
    num_of_frontpages = num_of_displaypages - num_of_backpages - 3
    html = ''
    
    if paginator.num_pages <= num_of_displaypages:
        for i in range(1, paginator.num_pages + 1):
            html += '<li ><a href="?page=%s">%s </a></li>' % (i, i)
        return html
    
    elif current_page.number <= num_of_displaypages - num_of_backpages:
        for i in range(1, num_of_displaypages + 1):
            html += '<li ><a href="?page=%s">%s </a></li>' % (i, i)
        return html
    
    elif num_of_displaypages - num_of_frontpages <= current_page.number <= paginator.num_pages - num_of_backpages:
        html = '''
            <li><a href="?page=1">1</a></la>
            <li class="disabled"><a href="?page=1">...</a></la>
        '''
        for i in range(current_page.number - num_of_frontpages, current_page.number + num_of_backpages + 1):
            html += '<li><a href="?page=%s">%s</a></la>' % (i, i)
        return html
    
    else:
        html = '''
            <li><a href="?page=1">1</a></la>
            <li class="disabled"><a href="?page=1">...</a></la>

        '''
        for i in range(paginator.num_pages - num_of_backpages - num_of_frontpages, paginator.num_pages + 1):
            html += '<li><a href="?page=%s">%s</a></la>' % (i, i)
        return html
