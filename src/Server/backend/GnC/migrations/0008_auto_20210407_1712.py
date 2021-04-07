# Generated by Django 3.1.2 on 2021-04-07 11:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Profile', '0022_careeraspiration'),
        ('GnC', '0007_cascadedgoals'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='cascadedgoals',
            name='employee',
        ),
        migrations.AddField(
            model_name='cascadedgoals',
            name='employee',
            field=models.ManyToManyField(blank=True, null=True, related_name='emaployees', to='Profile.Profile'),
        ),
    ]
