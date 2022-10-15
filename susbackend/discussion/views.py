from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.views import APIViews
from rest_framework import status
from rest_framework.decorators import api_view


from serializers import CommentSerializer, PostSerializer
from .models import Comment, Post

"""
Create new post.
"""

"""
View all posts.
"""

"""
Get post by id.
"""

"""
Create comment on a post.
Given post id
"""

"""
Create comment on another comment.
Given parent comment id.
"""

"""
Delete comment / post
"""

"""
Patch comment / post 
"""