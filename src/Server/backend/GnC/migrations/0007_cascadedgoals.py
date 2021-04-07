# Generated by Django 3.1.2 on 2021-04-07 10:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Profile', '0022_careeraspiration'),
        ('Appraisals', '0011_auto_20210407_1612'),
        ('GnC', '0006_auto_20210309_2236'),
    ]

    operations = [
        migrations.CreateModel(
            name='CascadedGoals',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('summary', models.TextField(blank=True, null=True)),
                ('description', models.TextField(blank=True, null=True)),
                ('due', models.DateField()),
                ('appraisal', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='Appraisals.overall_appraisal')),
                ('employee', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='emaployees', to='Profile.profile')),
                ('goal_category', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='GnC.goalcategory')),
                ('manager', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='Profile.profile')),
            ],
        ),
    ]
