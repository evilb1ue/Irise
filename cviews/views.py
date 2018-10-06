import re
import json
import threading
import time

from django.db import transaction
from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
from django.views.decorators.csrf import csrf_exempt

from clibs.models import CodeSearchInfo, CodeLib
from cviews.cview_logic import excute_task_logic
from cviews.models import Page, PageRow, Task, CmdHistory, InputHistory, OutputHistory


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
def update_page_and_fetch_view(request):
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

                # print(config)

                return render(request, 'cviews/content_area.html',
                              context={'config': config, 'page_row_task': page_row_task, 'tasks': tasks})
            else:
                return HttpResponse("页ID或页行ID数据出现问题！")


@csrf_exempt
def fetch_config_and_content(request):
    # 获取config和任务对应的内容

    if request.is_ajax():
        if request.method == 'POST':
            page_row_id = request.POST.get('page_row_id', -1)
            page_row_tid = request.POST.get('page_row_tid', -1)
            if page_row_id != -1 and page_row_tid != -1:

                # 1.依据cid获取config
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

                # 2.获取任务对应的数据
                cmds = CmdHistory.objects.filter(tid=int(page_row_tid))
                inputs = InputHistory.objects.filter(tid=int(page_row_tid))
                outputs = OutputHistory.objects.filter(tid=int(page_row_tid))

                cmd_dict = {}
                input_dict = {}
                output_dict = {}

                for c in cmds:
                    cmd_dict[c.key] = c.value
                for i in inputs:
                    input_dict[i.key] = i.value
                for o in outputs:
                    output_dict[o.key] = o.value

                cmd_json = json.dumps(cmd_dict)
                input_json = json.dumps(input_dict)
                output_json = json.dumps(output_dict)

                return render(request, 'cviews/config_and_content.html',
                              context={'config': config, 'cmd': cmd_json, 'input': input_json, 'output': output_json})

            else:
                return HttpResponse("{}")

@csrf_exempt
@transaction.atomic # 开启事务
def new_task(request):
    # 依据page_row_id创建新的任务，并使page_row指向该任务

    if request.is_ajax():
        if request.method == 'POST':
            page_row_id = request.POST.get('page_row_id', -1)
            if page_row_id != -1:

                # 1.依据cid获取config
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

                # 2.创建新任务,并依据config初始化任务
                task = Task(prid=page_row)
                task.save()

                # print(config['Cmd'])

                for k, v in config['Cmd'].items():
                    CmdHistory(tid=task, key=k, value=v['View']['Default'].__str__()).save()

                for k, v in config['Input'].items():
                    InputHistory(tid=task, key=k, value=v['View']['Default'].__str__()).save()

                for k, v in config['Output'].items():
                    OutputHistory(tid=task, key=k, value=v['View']['Default'].__str__()).save()

                # 3.将创建的任务赋值给page_row
                page_row.tid = task.id
                page_row.save()

                return HttpResponse("")
            else:
                return HttpResponse("page_row_id=-1")


@csrf_exempt
@transaction.atomic # 开启事务
def save_task(request):
    # 只保存准备状态的数据
    if request.is_ajax():
        if request.method == 'POST':
            task_id = request.POST.get('task_id', -1)
            json_data =  request.POST.get('json_data', 'None')
            if task_id != -1 and json_data != 'None':

                try:
                    task = Task.objects.get(pk=int(task_id))
                except Task.DoesNotExist:
                    # 任务可能已经被删除，正常返回即可
                    return HttpResponse("")

                if task.task_progress == 0:
                    # 准备状态，进行保存
                    json_data = json.loads(json_data)

                    # print(json_data)

                    cmd_history = CmdHistory.objects.filter(tid=task)
                    input_history = InputHistory.objects.filter(tid=task)
                    output_history = OutputHistory.objects.filter(tid=task)

                    # 赋值并进行保存
                    for cmd in cmd_history:
                        cmd.value = json_data['Cmd'][cmd.key]
                        cmd.save()
                    for input in input_history:
                        input.value = json_data['Input'][input.key]
                        input.save()
                    for output in output_history:
                        output.value = json_data['Output'][output.key]
                        output.save()

                    # 保存成功，正常返回
                    return HttpResponse("")
                else:
                    # 如果不是准备状态，不执行任何保存动作，直接返回即可
                    return HttpResponse("")
            else:
                return HttpResponse("task_id 或者 json_data不存在")


@csrf_exempt
def change_task(request):
    # 改变页行指向的任务
    if request.is_ajax():
        if request.method == 'POST':
            task_id = request.POST.get('task_id', -1)
            if task_id != -1:
                try:
                    task = Task.objects.get(pk=int(task_id))
                except Task.DoesNotExist:
                    # 任务不存在，说明出现了问题
                    return HttpResponse("task_id对应的任务不存在")

                # 修改page_row 指向的任务
                task.prid.tid = task.id
                # page_row.save()
                task.prid.save()

                return HttpResponse("")
            else:
                return HttpResponse("task_id不存在")


@csrf_exempt
def excute_task(request):
    # 执行任务

    if request.is_ajax():
        if request.method == 'POST':
            task_id = request.POST.get('task_id', -1)
            if task_id != -1:
                # 1. 获取任务
                try:
                    task = Task.objects.get(pk=int(task_id))
                except Task.DoesNotExist:
                    # 任务不存在，说明出现了问题
                    return HttpResponse("task_id对应的任务不存在")

                # 2. 获取执行代码
                page_row_cid = task.prid.cid
                clib = CodeLib.objects.filter(search_info=int(page_row_cid))[0]
                code_content = clib.code_content

                pat = '"""\r?\n\{.*\}\r?\n"""'
                config = re.search(pat, code_content, re.S).group(0).replace('"""', '')
                config = json.loads(config)

                # 3. 启动一个新线程执行代码，暂时只处理python3的代码，随缘再去扩展吧
                t = threading.Thread(target=excute_task_logic, args=(task, config, code_content))
                t.setDaemon(True)
                t.start()
                return HttpResponse("")
            else:
                return HttpResponse("task_id不存在")


@csrf_exempt
@transaction.atomic
def clear_task(request):
    # 删除任务

    if request.is_ajax():
        if request.method == 'POST':
            task_id = request.POST.get('task_id', -1)
            way = request.POST.get('way', '')
            if task_id != -1 and way != '':

                try:
                    task = Task.objects.get(pk=int(task_id))
                except Task.DoesNotExist:
                    # 任务不存在，说明出现了问题
                    return HttpResponse("task_id对应的任务不存在")

                pr = task.prid
                page_row_id = pr.id

                print(way)
                if way == 'clear_finished':
                    tasks = Task.objects.filter(prid=pr, task_progress=2)
                else:
                    tasks = Task.objects.filter(prid=pr)

                tasks.delete()

                # 查看之前的任务是否被删除
                try:
                    task = Task.objects.get(pk=int(task_id))
                except Task.DoesNotExist:
                    task = None

                pr = PageRow.objects.get(pk=page_row_id)
                if task is None:
                    # 说明当前任务已经被删除

                    count = Task.objects.filter(prid=pr).count()
                    if count == 0:
                        # 设置pr对应的任务为-1  未选择
                        pr.tid = -1
                        pr.save()
                    elif count > 0:
                        # 选择最新的一个任务
                        pr.tid = Task.objects.filter(prid=pr).order_by('-create_time')[0].id
                        pr.save()
                else:
                    # 说明当前任务未被删除，什么也不做
                    pass

                return HttpResponse("")
            else:
                return HttpResponse("task_id不存在 或者 way 未选择")