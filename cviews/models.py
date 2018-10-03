from django.db import models

# Create your models here.
from clibs.models import CodeSearchInfo


class Page(models.Model):
    # 该模型对应一个页

    name = models.CharField(max_length=128, blank=True, verbose_name='名称')
    order = models.IntegerField(verbose_name='顺序')
    # -1代表未选择任何页行
    prid = models.IntegerField(verbose_name='页行相关ID', default=-1)

    def __str__(self):
        if self.name == "":
            return self.order.__str__()
        else:
            return self.name

    class Meta:
        verbose_name = '页'
        verbose_name_plural = '页集'


class PageRow(models.Model):
    # 该模型对应页中的一行

    pid = models.ForeignKey(Page, verbose_name='页ID', on_delete=models.CASCADE)
    cid = models.IntegerField(verbose_name='代码相关ID')
    # -1 代表没创建任何任务
    tid = models.IntegerField(verbose_name='任务相关ID', default=-1)
    name = models.CharField(max_length=128, blank=True, verbose_name='名称')
    order = models.IntegerField(verbose_name='顺序')

    def __str__(self):
        if self.name == "":
            return self.order.__str__()
        else:
            return self.name

    class Meta:
        verbose_name = '页行'
        verbose_name_plural = '页行集'


class Task(models.Model):
    # 该模型对应一个任务

    prid = models.ForeignKey(PageRow, verbose_name='页行ID', on_delete=models.CASCADE)
    create_time = models.DateField(verbose_name='创建时间', auto_now_add=True)
    # 0-100
    task_progress = models.IntegerField(verbose_name='进度', default=0)
    # task_description = models.CharField(max_length=128, verbose_name='任务描述', blank=True)

    def task_info(self):
        return self.create_time.strftime('%Y-%m-%d %H:%M:%S ') + self.task_progress.__str__()

    def __str__(self):
        return self.create_time.__str__() + " progress:" + self.task_progress.__str__()

    class Meta:
        verbose_name = '任务'
        verbose_name_plural = '任务集'


class CmdHistory(models.Model):
    # 该模型对应一个命令历史

    tid = models.ForeignKey(Task, verbose_name='任务ID', on_delete=models.CASCADE)
    key = models.CharField(max_length=128, verbose_name='关键字')
    value = models.TextField(verbose_name='数据')


class InputHistory(models.Model):
    # 该模型对应一个输入历史

    tid = models.ForeignKey(Task, verbose_name='任务ID', on_delete=models.CASCADE)
    key = models.CharField(max_length=128, verbose_name='关键字')
    value = models.TextField(verbose_name='数据')


class OutputHistory(models.Model):
    # 该模型对应一个输出历史

    tid = models.ForeignKey(Task, verbose_name='任务ID', on_delete=models.CASCADE)
    key = models.CharField(max_length=128, verbose_name='关键字')
    value = models.TextField(verbose_name='数据')



