# Generated by Django 3.1.2 on 2021-01-02 14:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('GnC', '0002_auto_20201227_0343'),
    ]

    operations = [
        migrations.AddField(
            model_name='goals',
            name='status',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
    ]
