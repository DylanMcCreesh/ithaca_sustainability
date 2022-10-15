from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.views import APIViews
from rest_framework import status
from rest_framework.decorators import api_view


from serializers import CommentSerializer, PostSerializer, PostSubSerializer
from .models import Comment, Post

"""
Create new post.
"""
@api_view(['POST'])
def create_post(request):
    serializer = PostSubSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()

        return JsonResponse(serializer.data, status=status.HTTP_201_CREATED)
    return JsonResponse(serializer.error, status=status.HTTP_400_BAD_REQUEST)

"""
View all posts.
"""
@api_view(['GET'])
def get_all_posts(request):
    queryset = Post.objects.all()
    serializer = PostSerializer(queryset, many=True)
    return JsonResponse(serializer.data, status=status.HTTP_200_OK)

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