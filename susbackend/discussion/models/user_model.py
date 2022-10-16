from django.db import models

"""
Define User model.
"""

class User(models.Model):
    name = models.CharField(max_length=250)
    password = models.CharField(max_length=250)

    def __str__(self):
        return self.username