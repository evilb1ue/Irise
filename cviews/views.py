import time

from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
from django.views.decorators.csrf import csrf_exempt

from cviews.models import Page, PageRow


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
    if request.is_ajax():
        if request.method == 'POST':
            # 第二个参数是默认值, -1获取的页行为空，会返回空内容
            page_id = request.POST.get('page_id', -1)
            page = Page.objects.get(id=int(page_id))
            return HttpResponse(page.prid.__str__())


