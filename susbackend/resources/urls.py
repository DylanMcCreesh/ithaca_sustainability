from django.urls import path
from resources import views

urlpatterns = [
    path("category/", views.create_category),
    path("category/<int:category_id>", views.get_category_by_id),
    path("categories/", views.get_all_categories),
    path("brand/", views.add_brand)
]
