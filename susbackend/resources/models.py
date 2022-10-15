from django.db import models


class Category(models.Model):
    """
    Define Category Model:
    A Category model groups brands based on a category.
    Ex: The "clothing" category model holds all sustainable clothing brands

    Has a one-to-many relationship with brands
    """
    title = models.CharField(max_length=250)


class Brand(models.Model):
    """
    Define a Brand model. 
    A brand is a sustainable company who is stored under a category according 
    to what they sell.
    """
    name = models.CharField(max_length=250)
    website = models.URLField(max_length=250)
    category_id = models.ForeignKey(
        Category, related_name='brands', on_delete=models.CASCADE
    )

    def __str__(self):
        return '%s' % (self.name)
