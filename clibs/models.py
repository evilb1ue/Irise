from django.db import models

# Create your models here.
# 1. vi models.py 修改模型 2. python manage.py makemigrations 为模型改变生成迁移文件 3. python manage.py migrate 应用数据迁移
# option: python manage.py sqlmigrate clibs 0001 查看Django认为需要执行的SQL语句


class Tag(models.Model):
    tag_text = models.CharField(max_length=32, verbose_name='标签')
    # auto_now_add 在第一次创建时自动赋值为当前时间，具有强制性，以后修改对象时，字段值不会再更新，在admin中为只读，适用创建时间
    # auto_now 类似，在每次修改model时都会自动更新，无法手动赋值，强制性，在admin中为只读，适用最后更新时间
    create_date = models.DateField(verbose_name='创建时间', auto_now_add=True)


class Language(models.Model):
    lang = models.CharField(max_length=32, verbose_name='语言', primary_key=True)


class CodeSearchInfo(models.Model):
    tag = models.ManyToManyField(Tag, verbose_name='标签')
    custom_keyword = models.CharField(max_length=32, verbose_name='关键字')
    code_language = models.ForeignKey(Language, on_delete=models.CASCADE, verbose_name='语言')
    code_description = models.CharField(max_length=256, verbose_name='描述', blank=True)
    create_date = models.DateField(verbose_name='创建时间', auto_now_add=True)
    last_modified_date = models.DateField(verbose_name='最近修改', auto_now=True)
    relation_info = models.CharField(max_length=256, verbose_name='关联信息', blank=True)

    class Meta:
        verbose_name = '代码库记录'
        verbose_name_plural = '代码库记录'


class CodeLib(models.Model):
    search_info = models.ForeignKey(CodeSearchInfo, on_delete=models.CASCADE)
    code_name = models.CharField(max_length=32, verbose_name='名称')
    code_content = models.TextField(max_length=1024*128, verbose_name="代码", blank=True)
    order = models.IntegerField(verbose_name='顺序', default=1)


class ExtraInfo(models.Model):
    searchInfo = models.OneToOneField(CodeSearchInfo, on_delete=models.CASCADE, primary_key=True),
    tar_gz = models.BinaryField(max_length=50*1024*1024, verbose_name="ExtraTarGz", null=True, blank=True)