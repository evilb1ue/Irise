from django.urls import path

from cviews import views

app_name = 'cviews'
urlpatterns = [
    path('', views.index, name='index'),
    path('tools/', views.tools, name='tools'),
    path('page_rows/', views.page_rows, name='page_rows'),
    path('selected_page_row/', views.selected_page_row, name='selected_page_row'),
    path('update_page_and_fetch_content/', views.update_page_and_fetch_content, name='update_page_and_fetch_content'),
]
