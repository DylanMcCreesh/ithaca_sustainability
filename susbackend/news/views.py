from pickle import GLOBAL
from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
import requests
import time

from news.constants import ITHACA_URL, GLOBAL_URL

class db: 
    ithaca_articles = None
    global_articles = None
    time_since_ithaca = 0
    time_since_global = 0

@api_view(['GET'])
def get_ithaca(request):
    if db.time_since_ithaca > time.time() - 1799:
        return db.ithaca_articles

    try:
        response = requests.get(ITHACA_URL)
    except Exception as e:
        raise e 

    db.ithaca_articles = response.json()
    db.time_since_ithaca = time.time()

    return Response(db.ithaca_articles, status=status.HTTP_200_OK)

@api_view(['GET'])
def get_global(request):
    if db.time_since_global > time.time() - 1799:
        return db.global_articles

    try:
        response = requests.get(GLOBAL_URL)
    except Exception as e:
        raise e 

    db.global_articles = response.json()
    db.time_since_global = time.time()

    return Response(db.global_articles, status=status.HTTP_200_OK)
