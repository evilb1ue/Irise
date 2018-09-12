from django.db import models

# Create your models here.
# 1. vi models.py 修改模型 2. python manage.py makemigrations 为模型改变生成迁移文件 3. python manage.py migrate 应用数据迁移
# option: python manage.py sqlmigrate clibs 0001 查看Django认为需要执行的SQL语句
from django.utils.html import format_html


class Tag(models.Model):
    tag_text = models.CharField(max_length=32, verbose_name='标签')
    # auto_now_add 在第一次创建时自动赋值为当前时间，具有强制性，以后修改对象时，字段值不会再更新，在admin中为只读，适用创建时间
    # auto_now 类似，在每次修改model时都会自动更新，无法手动赋值，强制性，在admin中为只读，适用最后更新时间
    create_date = models.DateField(verbose_name='创建时间', auto_now_add=True)

    def __str__(self):
        return self.tag_text

    class Meta:
        verbose_name = '标签'
        verbose_name_plural = '标签集'


class Language(models.Model):
    lang = models.CharField(max_length=32, verbose_name='语言', primary_key=True)

    def __str__(self):
        return self.lang

    class Meta:
        verbose_name = '语言'
        verbose_name_plural = '语言集'


class CodeSearchInfo(models.Model):
    custom_keyword = models.CharField(max_length=32, verbose_name='关键字')
    tag = models.ManyToManyField(Tag, verbose_name='标签')
    code_language = models.ForeignKey(Language, on_delete=models.CASCADE, verbose_name='语言')
    code_description = models.CharField(max_length=256, verbose_name='描述', blank=True)
    relation_info = models.CharField(max_length=256, verbose_name='关联信息', blank=True)
    extra_file = models.FileField(verbose_name='附件', upload_to='uploads/clibs/%Y/%m/', null=True, blank=True)
    create_date = models.DateTimeField(verbose_name='创建时间', auto_now_add=True)
    last_modified_date = models.DateTimeField(verbose_name='最近修改', auto_now=True)

    def extra_file_view(self):
        if self.extra_file:
            return format_html('<a href="{}">{}</a>', self.extra_file.url,
                               self.extra_file.name[self.extra_file.name.__str__().rindex('/')+1:])
        else:
            return format_html('')
    extra_file_view.short_description = '附件'
    extra_file_view.admin_order_field = 'extra_file'

    def join_tags(self):
        return ','.join(self.tag.values_list('tag_text', flat=True))
    # without flat=True <QuerySet[(1,), (2,), (3,), ...]>
    # with flat=True <QuerySet [1, 2, 3, ...]>
    # If True, this will mean the returned results are single values, rather than one-tuples.
    join_tags.admin_order_field = 'last_modified_date'
    join_tags.short_description = '标签'

    def __str__(self):
        return self.custom_keyword

    class Meta:
        verbose_name = '代码搜索记录'
        verbose_name_plural = '代码搜索库'


class CodeLib(models.Model):
    search_info = models.ForeignKey(CodeSearchInfo, on_delete=models.CASCADE)
    code_name = models.CharField(max_length=32, verbose_name='名称')
    code_content = models.TextField(max_length=1024*128, verbose_name="代码", blank=True)
    order = models.IntegerField(verbose_name='顺序', default=1)

    def __str__(self):
        return self.code_name

    class Meta:
        verbose_name = '代码'
        verbose_name_plural = '代码存放库'
        ordering = ['order']


# class ExtraInfo(models.Model):
#     searchInfo = models.OneToOneField(CodeSearchInfo, on_delete=models.CASCADE, primary_key=True),
#     tar_gz = models.BinaryField(max_length=50*1024*1024, verbose_name="ExtraTarGz", null=True, blank=True)
#     # null
#     # If True, Django will store empty values as NULL in the database. Default is False.
#     # blank
#     # If True, the field is allowed to be blank. Default is False.
#     # Note that this is different than null. null is purely database-related,
#     # whereas blank is validation-related. If a field has blank=True,
#     # form validation will allow entry of an empty value. If a field has blank=False, the field will be required
#
#     class Meta:
#         verbose_name = '代码附件'
#         verbose_name_plural = '代码附件库'
