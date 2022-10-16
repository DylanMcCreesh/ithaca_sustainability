from .models.post_model import Post
from .models.comment_model import Comment
from .models.user_model import User

from rest_framework import serializers 

class UserSubSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=False)

    class Meta:
        model = User
        fields = ["id", "name"]

    def create(self, validated_data):
        return User.objects.create(**validated_data)

    def get_validation_exclusions(self):
        exclusions = super(UserSubSerializer, self).get_validation_exclusions()
        return exclusions + ['id']

class UserSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField()

    class Meta:
        model = User
        fields = ["id", "name"]


class CommentSubSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=False)
    class Meta:
        model = Comment
        fields = "__all__"

    def create(self, validated_data):
        return Comment.objects.create(**validated_data)

    def get_validation_exclusions(self):
        exclusions = super(CommentSubSerializer, self).get_validation_exclusions()
        return exclusions + ['id']

class CommentSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField()
    class Meta:
        model = Comment
        fields = ['post_id', 'id', 'author', 'text']


class PostSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField()
    comments = CommentSerializer(many=True)

    class Meta: 
        model = Post
        fields = ['id', 'author', 'title', 'text', 'comments']



class PostSubSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=False)

    class Meta:
        model = Post
        fields = ['id', 'author', 'title', 'text']


    def create(self, validated_data):
        return Post.objects.create(**validated_data)

    def get_validation_exclusions(self):
        exclusions = super(PostSubSerializer, self).get_validation_exclusions()
        return exclusions + ['id']


