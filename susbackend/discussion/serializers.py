from .models.post_model import Post
from .models.comment_model import Comment
#from .models.user_model import User

from rest_framework import serializers 

class CommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = "__all__"

class PostSerializer(serializers.ModelSerializer):
    class Meta:
        model = Post
        fields = "__all__"


