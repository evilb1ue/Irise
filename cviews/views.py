import re
import json
import time

from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
from django.views.decorators.csrf import csrf_exempt

from clibs.models import CodeSearchInfo, CodeLib
from cviews.models import Page, PageRow, Task


def index(request):
    return HttpResponse('Hello, cviews index!')


def tools(request):
    pages = Page.objects.all().order_by('order')
    return render(request, 'cviews/tools.html', context={'pages': pages})


# @csrf_exempt 不进行csrf检查
@csrf_exempt
def page_rows(request):
    if request.is_ajax():
        if request.method == 'POST':
            # 第二个参数是默认值, -1获取的页行为空，会返回空内容
            page_id = request.POST.get('page_id', -1)
            prows = PageRow.objects.filter(pid=int(page_id)).order_by('order')
            return render(request, 'cviews/page_rows.html', context={'page_rows': prows})


@csrf_exempt
def selected_page_row(request):
    # 获取Page所指向的行

    if request.is_ajax():
        if request.method == 'POST':
            # 第二个参数是默认值, -1获取的页行为空，会返回空内容
            page_id = request.POST.get('page_id', -1)
            page = Page.objects.get(id=int(page_id))
            return HttpResponse(page.prid.__str__())


@csrf_exempt
def update_page_and_fetch_content(request):
    # 更新page所指向的行，并获取相关内容，单人使用没必要启用事务

    if request.is_ajax():
        if request.method == 'POST':
            page_id = request.POST.get('page_id', -1)
            page_row_id = request.POST.get('page_row_id', -1)
            if page_id != -1 and page_row_id != -1:
                # 1.更新页所指向的页行ID
                # 正常情况下，必然能获取到page对象
                page = Page.objects.get(pk=int(page_id))
                page.prid=int(page_row_id)
                page.save()

                # 2.获取依据cid获取代码内容
                # 正常情况下cid是存在的
                page_row = PageRow.objects.get(pk=int(page_row_id))
                page_row_cid = page_row.cid
                # 正常情况下必然有且只有一个代码
                clib = CodeLib.objects.filter(search_info=int(page_row_cid))[0]
                code_content = clib.code_content
                # print(code_content)
                # re.S使 . 匹配包括换行在内的所有字符
                pat = '"""\r?\n\{.*\}\r?\n"""'
                config = re.search(pat, code_content, re.S).group(0).replace('"""', '')
                config = json.loads(config)

                # 获取当前页行对应的所有任务
                tasks = Task.objects.filter(prid=page_row_id).order_by('-create_time')

                # 获取当前页行对应的任务id， -1代表未指定任何任务
                page_row_tid = page_row.tid
                if page_row_tid == -1:
                    page_row_task = None
                else:
                    page_row_task = tasks.get(pk=page_row_tid)

                print(config)

                return render(request, 'cviews/content_area.html',
                              context={'config': config, 'page_row_task': page_row_task, 'tasks': tasks})
            else:
                return HttpResponse("页ID或页行ID数据出现问题！")