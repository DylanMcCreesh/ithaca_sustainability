from django.db import models
from django.contrib.auth.models import User
from .post_model import Post
from django.utils import timezone

"""
Define Comment model.
Many-to-one relationship with itself (HOT! SEXY!)
"""

class Comment(models.Model):
    author = models.ForeignKey(User, on_delete=models.DO_NOTHING) #do nothing vs cascade?
    text = models.TextField()
    date_created = models.DateTimeField(default=timezone.now)

    comment_id = models.IntegerField(primary_key = True)
    parent_id = models.ForeignKey('self', on_delete=models.DO_NOTHING)
    post_id = models.ForeignKey(Post, related_name='comments', on_delete = models.CASCADE)
