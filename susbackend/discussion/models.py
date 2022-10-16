from django.db import models

"""
Define Post model.
"""
class Post(models.Model):
    author = models.CharField(max_length = 250)
    title = models.CharField(max_length = 250)
    text = models.TextField()


"""
Define Comment model.
Many-to-one relationship with itself (HOT! SEXY!)
"""

class Comment(models.Model):
    author = models.CharField(max_length = 250) 
    text = models.TextField()
    post_id = models.ForeignKey(Post, related_name='comments', on_delete = models.CASCADE)


