from django.contrib import admin

# Register your models here.
from cviews.models import Page, PageRow, Task

admin.site.register(Page)
admin.site.register(PageRow)
admin.site.register(Task)