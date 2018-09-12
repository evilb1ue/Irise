from django.contrib import admin

from .models import CodeSearchInfo, Tag, Language, CodeLib

# Register your models here.


class CodeLibInline(admin.StackedInline):
    model = CodeLib
    extra = 0


class CodeSearchInfoAdmin(admin.ModelAdmin):
    # 控制显示的字段列表
    list_display = ('custom_keyword', 'join_tags', 'code_language', 'code_description', 'relation_info',
                    'extra_file_view','create_date', 'last_modified_date',)
    # 控制字段可以link到当前行对象的修改界面
    list_display_links = ('custom_keyword',)
    # list_editable 控制行中的Cell是否可编辑，不可同时与list_display_links中出现的字段重复，会冲突
    # list_editable = ('code_description',)
    # 右侧过滤
    list_filter = ('tag__tag_text', 'code_language', 'create_date', 'last_modified_date',)
    # 搜索框 default use icontains %key%
    # if search_fields is set to ['first_name', 'last_name'] and a user searches for john lennon,
    # Django will do the equivalent of this SQL WHERE clause:
    # WHERE (first_name ILIKE '%john%' OR last_name ILIKE '%john%')
    # AND (first_name ILIKE '%lennon%' OR last_name ILIKE '%lennon%')
    search_fields = ['custom_keyword']
    # 设置分页大小 default 100
    # list_per_page = 1
    # Set list_max_show_all to control how many items can appear on a “Show all” admin change list page.
    # The admin will display a “Show all” link on the change list only if the total result count is less than or equal
    # to this setting. By default, this is set to 200.
    # list_max_show_all = 2
    # 设置内联的外键模型，使其可以编辑
    inlines = [CodeLibInline]


admin.site.register(CodeSearchInfo, CodeSearchInfoAdmin)
# admin.site.register(CodeLib)
# admin.site.register(ExtraInfo)
admin.site.register(Tag)
admin.site.register(Language)
