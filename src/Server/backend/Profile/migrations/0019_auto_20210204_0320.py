# Generated by Django 3.1.2 on 2021-02-03 21:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Profile', '0018_profile_resign_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='resign_date',
            field=models.DateField(null=True),
        ),
    ]