from .models import Category, Brand
from rest_framework import serializers

"""
Declare serializers.

Serializers allow large, complex datasets to be rendered into
native Python datatypes, which can be easily converted into JSON, XML,
or other types we might need.
"""
class BrandSerializer(serializers.ModelSerializer):
    class Meta:
        model = Brand
        fields = ["name", "website", "category_id"]

class BrandSubSerializer(serializers.ModelSerializer):
    class Meta:
        model = Brand
        fields = ["name", "website"]

class CategorySerializer(serializers.ModelSerializer):
    id = serializers.IntegerField()
    brands = BrandSubSerializer(many=True)

    class Meta:
        model = Category
        fields = ['id', 'title', 'brands']


class CategorySubSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=False)
    class Meta:
        model = Category
        fields = ["id", "title"]
        
    def create(self, validated_data):
        return Category.objects.create(**validated_data)



