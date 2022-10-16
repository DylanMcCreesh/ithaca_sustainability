from django.db import models
from .user_model import User


"""
Define Post model.
"""

class Post(models.Model):
    author =  models.ForeignKey(User, on_delete=models.DO_NOTHING) 
    title = models.CharField(max_length = 250)
    text = models.TextField()

