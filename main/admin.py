from django.contrib import admin
from  .models import Product, Category

class ProductAdmin(admin.ModelAdmin):
    #list_display: ['price', 'category', 'status']
    list_filter = ['price', 'category', 'status']
    search_fields = ['title', 'description']

admin.site.register(Product)
admin.site.register(Category, ProductAdmin)
