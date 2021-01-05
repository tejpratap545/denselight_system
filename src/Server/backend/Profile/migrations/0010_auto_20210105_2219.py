# Generated by Django 3.1.2 on 2021-01-05 16:49

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Profile', '0009_auto_20210102_1931'),
    ]

    operations = [
        migrations.AlterField(
            model_name='emailconfirmation',
            name='token',
            field=models.CharField(default='LkRaAhdwSiOVcrFJz2fnzZi0ad5GvKxqoojY7H7AXPI', editable=False, max_length=250),
        ),
        migrations.AlterField(
            model_name='passwordreset',
            name='url_token',
            field=models.CharField(default='8zE-Yi6nE2lYJtfRUy32LcPI9Y9C3oTZ3iIR3kdHm3c', editable=False, max_length=250),
        ),
        migrations.CreateModel(
            name='Notification',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(blank=True, max_length=100, null=True)),
                ('description', models.TextField(blank=True, null=True)),
                ('color', models.CharField(blank=True, max_length=20, null=True)),
                ('seen', models.BooleanField(default=False)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Profile.profile')),
            ],
        ),
    ]