# Generated by Django 3.1.2 on 2021-02-10 21:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Appraisals', '0006_auto_20210204_0223'),
    ]

    operations = [
        migrations.AddField(
            model_name='user_appraisal_list',
            name='end_year_employee_file',
            field=models.FileField(null=True, upload_to='endyear/file/employee'),
        ),
    ]
