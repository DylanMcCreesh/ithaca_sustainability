from django.urls import path

from news import views

urlpatterns = [
    path("ithaca/", views.get_ithaca_api),
    path("global/", views.get_global_api),
    path("", views.test)
]