# Generated by Django 2.1 on 2018-09-25 21:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cviews', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='page',
            name='prid',
            field=models.IntegerField(default=-1, verbose_name='页行相关ID'),
        ),
    ]
