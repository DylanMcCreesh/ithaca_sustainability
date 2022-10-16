from django.db import models
from .post_model import Post
from .user_model import User

"""
Define Comment model.
Many-to-one relationship with itself (HOT! SEXY!)
"""

class Comment(models.Model):
    author = models.ForeignKey(User, on_delete=models.DO_NOTHING) #do nothing vs cascade?
    text = models.TextField()
    post_id = models.ForeignKey(Post, related_name='comments', on_delete = models.CASCADE)
