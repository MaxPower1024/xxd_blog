# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2018-04-12 11:21
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0003_auto_20180411_2131'),
    ]

    operations = [
        migrations.AddField(
            model_name='post',
            name='excerpt',
            field=models.CharField(default=True, max_length=200),
        ),
    ]