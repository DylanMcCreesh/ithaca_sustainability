from django.shortcuts import render
from django.http import JsonResponse
from rest_framework import status
from rest_framework.decorators import api_view

from .serializers import CategorySerializer, BrandSerializer, CategorySubSerializer
from .models import Category, Brand


# [POST] create a category
@api_view(["POST"])
def create_category(request):
    """
    Endpoint for creating a new category
    """
    serializer = CategorySubSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return JsonResponse(serializer.data, status=status.HTTP_201_CREATED)
    return JsonResponse(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# [GET] category by id


@api_view(['GET'])
def get_category_by_id(request, category_id):
    try:
        queryset = Category.objects.get(id=category_id)
    except Category.DoesNotExist:
        return JsonResponse({"error": "does not exist"}, status=status.HTTP_404_NOT_FOUND)

    serializer = CategorySerializer(queryset)
    return JsonResponse(serializer.data, status=status.HTTP_200_OK)

# [GET] get all categories


@api_view(["GET"])
def get_all_categories(request):
    """
    Endpoint for getting all the categories
    """
    queryset = Category.objects.all()
    serializer = CategorySubSerializer(queryset, many=True)
    return JsonResponse(serializer.data, safe=False)

# [POST] Add brand to category


@api_view(['POST'])
def add_brand(request):
    """
    Endpoint for adding a brand to a category
    """
    serializer = BrandSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return JsonResponse(serializer.data, status=status.HTTP_201_CREATED)
    return JsonResponse(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
