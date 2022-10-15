from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
import requests

from django.http import JsonResponse

from news.constants import NEWS_API_URL


@api_view(['GET'])
def get_api(request):
    try:
        response = requests.get(NEWS_API_URL)
    except Exception as e:
        raise e 

    return Response(response.json(), status=status.HTTP_200_OK)
    #return JsonResponse(response, status=status.HTTP_200_OK, safe=False)