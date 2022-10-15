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


class PostSubSerializer(serializers.ModelSerializer):
    date_created = serializers.DateTimeField(required=False)
    id = serializers.IntegerField(required=False)

    class Meta:
        model = Post
        fields = "__all__"

    def create(self, validated_data):
        return Post.objects.create(**validated_data)

    def get_validation_exclusions(self):
        exclusions = super(PostSubSerializer, self).get_validation_exclusions()
        return exclusions + ['id', 'date_created']


