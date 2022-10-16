from django.shortcuts import render
from django.http import JsonResponse
from rest_framework import status
from rest_framework.decorators import api_view

from discussion.serializers import CommentSerializer, PostSerializer, PostSubSerializer, CommentSubSerializer
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
    return JsonResponse(serializer.data, status=status.HTTP_400_BAD_REQUEST)

"""
View all posts.
"""
@api_view(['GET'])
def get_all_posts(request):
    queryset = Post.objects.all()
    serializer = PostSerializer(queryset, many=True)
    return JsonResponse(serializer.data, status=status.HTTP_200_OK, safe = False)

"""
Get post by id.
"""
@api_view(['GET'])
def get_post_by_id(request, post_id):
    try:
        queryset = Post.objects.get(id=post_id)
    except Post.DoesNotExist:
        return JsonResponse({"error":"does not exist"}, status=status.HTTP_404_NOT_FOUND)

    serializer = PostSerializer(queryset)
    return JsonResponse(serializer.data, status=status.HTTP_200_OK)

"""
Create comment on a post.
"""
@api_view(['POST'])
def create_comment_on_post(request, post_id):
    try:
        queryset = Post.objects.get(id=post_id)
    except Post.DoesNotExist:
        return JsonResponse({"error":"does not exist"}, status=status.HTTP_404_NOT_FOUND)

    serializer = CommentSubSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return JsonResponse(serializer.data, status=status.HTTP_201_CREATED)
    return JsonResponse(serializer.error, status=status.HTTP_400_BAD_REQUEST)


"""
STRETCH GOAL: Create comment on another comment.
Given parent comment id.
"""

"""
Delete comment / post
"""

"""
Patch comment / post 
"""