from django.urls import path

from news import views

urlpatterns = [
    path("ithaca/", views.get_ithaca),
    path("global/", views.get_global)
]