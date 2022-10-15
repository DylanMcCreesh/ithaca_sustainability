from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone

"""
Define Post model.
"""

class Post(models.Model):
    author = models.ForeignKey(User, on_delete=models.DO_NOTHING) #do nothing vs cascade?
    title = models.CharField(max_length = 250)
    text = models.TextField()
    date_created = models.DateTimeField(default=timezone.now)
