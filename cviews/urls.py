from django.urls import path

from cviews import views

app_name = 'cviews'
urlpatterns = [
    path('', views.index, name='index'),
    path('tools/', views.tools, name='tools'),
    path('page_rows/', views.page_rows, name='page_rows'),
    path('selected_page_row/', views.selected_page_row, name='selected_page_row'),
    path('update_page_and_fetch_view/', views.update_page_and_fetch_view, name='update_page_and_fetch_view'),
    path('fetch_config_and_content/', views.fetch_config_and_content, name='fetch_config_and_content'),
    path('new_task/', views.new_task, name='new_task'),
    path('save_task/', views.save_task, name='save_task'),
    path('change_task/', views.change_task, name='change_task'),
    path('excute_task/', views.excute_task, name='excute_task'),
    path('clear_task/', views.clear_task, name='clear_task'),
]
