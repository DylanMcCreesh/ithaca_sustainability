from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
import requests

from django.http import JsonResponse

from news.constants import GLOBAL_NEWS_URL, ITHACA_NEWS_URL


@api_view(['GET'])
def get_global_api(request):
    try:
        response = requests.get(GLOBAL_NEWS_URL)
    except Exception as e:
        raise e 
    return Response(response.json(), status=status.HTTP_200_OK)

@api_view(['GET'])
def get_ithaca_api(request):
    try:
        response = requests.get(ITHACA_NEWS_URL)
    except Exception as e:
        raise e 
    return Response(response.json(), status=status.HTTP_200_OK)