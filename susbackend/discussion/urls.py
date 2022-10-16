from django.urls import path
from discussion import views 

urlpatterns = [
    path("post/", views.create_post),
    path("", views.get_all_posts),
    path("post/<int:post_id>", views.get_post_by_id),
    path("post/<int:post_id>/comment/", views.create_comment_on_post)
]