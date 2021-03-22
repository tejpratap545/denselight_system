# Generated by Django 3.1.2 on 2021-03-09 17:06

import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Profile', '0021_auto_20210309_2236'),
        ('Appraisals', '0009_auto_20210309_2235'),
        ('GnC', '0005_auto_20210123_2114'),
    ]

    operations = [
        migrations.AlterField(
            model_name='commentbox',
            name='created_by',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='Profile.profile'),
        ),
        migrations.AlterField(
            model_name='commentbox',
            name='goal',
            field=models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, to='GnC.goals'),
        ),
        migrations.AlterField(
            model_name='competencies',
            name='appraisal',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='Appraisals.user_appraisal_list'),
        ),
        migrations.AlterField(
            model_name='competencies',
            name='board_comments',
            field=models.CharField(blank=True, default='NIL', max_length=2000),
        ),
        migrations.AlterField(
            model_name='competencies',
            name='board_rating',
            field=models.IntegerField(blank=True, choices=[(1, '1 - Major Improvement Needed'), (2, '2 - Needs Improvement'), (3, '3 - Meets Expectations'), (4, '4 - Exceeds Expectations'), (5, '5 - Far Exceed Expectations')], default=1),
        ),
        migrations.AlterField(
            model_name='competencies',
            name='competency_category',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='GnC.competencycategory'),
        ),
        migrations.AlterField(
            model_name='competencies',
            name='employee',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='Profile.profile'),
        ),
        migrations.AlterField(
            model_name='competencies',
            name='manager_comments',
            field=models.CharField(blank=True, default='NIL', max_length=2000),
        ),
        migrations.AlterField(
            model_name='competencies',
            name='manager_rating',
            field=models.IntegerField(blank=True, choices=[(1, '1 - Major Improvement Needed'), (2, '2 - Needs Improvement'), (3, '3 - Meets Expectations'), (4, '4 - Exceeds Expectations'), (5, '5 - Far Exceed Expectations')], default=1),
        ),
        migrations.AlterField(
            model_name='competencies',
            name='summary',
            field=models.CharField(blank=True, max_length=1500),
        ),
        migrations.AlterField(
            model_name='competencies',
            name='user_comments',
            field=models.CharField(blank=True, default='NIL', max_length=2000),
        ),
        migrations.AlterField(
            model_name='competencies',
            name='user_rating',
            field=models.IntegerField(blank=True, choices=[(1, '1 - Major Improvement Needed'), (2, '2 - Needs Improvement'), (3, '3 - Meets Expectations'), (4, '4 - Exceeds Expectations'), (5, '5 - Far Exceed Expectations')], default=1),
        ),
        migrations.AlterField(
            model_name='competencies',
            name='weightage',
            field=models.IntegerField(blank=True, validators=[django.core.validators.MinValueValidator(1), django.core.validators.MaxValueValidator(100)]),
        ),
        migrations.AlterField(
            model_name='competencycomment',
            name='competency',
            field=models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, to='GnC.competencies'),
        ),
        migrations.AlterField(
            model_name='competencycomment',
            name='created_by',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='Profile.profile'),
        ),
        migrations.AlterField(
            model_name='departmentalcompetencies',
            name='appraisal',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='Appraisals.overall_appraisal'),
        ),
        migrations.AlterField(
            model_name='departmentalcompetencies',
            name='competency_category',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='GnC.competencycategory'),
        ),
        migrations.AlterField(
            model_name='departmentalcompetencies',
            name='manager',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='Profile.profile'),
        ),
        migrations.AlterField(
            model_name='departmentalcompetenciescomment',
            name='created_by',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='Profile.profile'),
        ),
        migrations.AlterField(
            model_name='departmentalcompetenciescomment',
            name='departmental_competencies',
            field=models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, to='GnC.departmentalcompetencies'),
        ),
        migrations.AlterField(
            model_name='departmentalgoalcomment',
            name='created_by',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='Profile.profile'),
        ),
        migrations.AlterField(
            model_name='departmentalgoalcomment',
            name='departmental_goal',
            field=models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, to='GnC.departmentalgoals'),
        ),
        migrations.AlterField(
            model_name='departmentalgoals',
            name='appraisal',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='Appraisals.overall_appraisal'),
        ),
        migrations.AlterField(
            model_name='departmentalgoals',
            name='goal_category',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='GnC.goalcategory'),
        ),
        migrations.AlterField(
            model_name='departmentalgoals',
            name='manager',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='Profile.profile'),
        ),
        migrations.AlterField(
            model_name='endyrcommentbox',
            name='created_by',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='Profile.profile'),
        ),
        migrations.AlterField(
            model_name='endyrcommentbox',
            name='goal',
            field=models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, to='GnC.goals'),
        ),
        migrations.AlterField(
            model_name='goalcategory',
            name='name',
            field=models.CharField(blank=True, max_length=70),
        ),
        migrations.AlterField(
            model_name='goalcomment',
            name='created_by',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='Profile.profile'),
        ),
        migrations.AlterField(
            model_name='goalcomment',
            name='goal',
            field=models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, to='GnC.goals'),
        ),
        migrations.AlterField(
            model_name='goals',
            name='MID_manager_comments',
            field=models.TextField(blank=True, default='NIL', max_length=2000),
        ),
        migrations.AlterField(
            model_name='goals',
            name='MID_user_comments',
            field=models.TextField(blank=True, default='NIL', max_length=2000),
        ),
        migrations.AlterField(
            model_name='goals',
            name='appraisal',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='Appraisals.user_appraisal_list'),
        ),
        migrations.AlterField(
            model_name='goals',
            name='board_comments',
            field=models.CharField(blank=True, default='NIL', max_length=2000),
        ),
        migrations.AlterField(
            model_name='goals',
            name='board_rating',
            field=models.IntegerField(blank=True, choices=[(1, '1 - Major Improvement Needed'), (2, '2 - Needs Improvement'), (3, '3 - Meets Expectations'), (4, '4 - Exceeds Expectations'), (5, '5 - Far Exceed Expectations')], default=1),
        ),
        migrations.AlterField(
            model_name='goals',
            name='employee',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='Profile.profile'),
        ),
        migrations.AlterField(
            model_name='goals',
            name='goal_category',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='GnC.goalcategory'),
        ),
        migrations.AlterField(
            model_name='goals',
            name='manager_comments',
            field=models.CharField(blank=True, default='NIL', max_length=2000),
        ),
        migrations.AlterField(
            model_name='goals',
            name='manager_rating',
            field=models.IntegerField(blank=True, choices=[(1, '1 - Major Improvement Needed'), (2, '2 - Needs Improvement'), (3, '3 - Meets Expectations'), (4, '4 - Exceeds Expectations'), (5, '5 - Far Exceed Expectations')], default=1),
        ),
        migrations.AlterField(
            model_name='goals',
            name='tracking_status',
            field=models.CharField(blank=True, choices=[('null', 'null'), ('On Track', 'On Track'), ('Not On Track', 'Not On Track')], default='null', max_length=50, null=True),
        ),
        migrations.AlterField(
            model_name='goals',
            name='user_comments',
            field=models.CharField(blank=True, default='NIL', max_length=2000),
        ),
        migrations.AlterField(
            model_name='goals',
            name='user_rating',
            field=models.IntegerField(blank=True, choices=[(1, '1 - Major Improvement Needed'), (2, '2 - Needs Improvement'), (3, '3 - Meets Expectations'), (4, '4 - Exceeds Expectations'), (5, '5 - Far Exceed Expectations')], default=1),
        ),
        migrations.AlterField(
            model_name='goals',
            name='weightage',
            field=models.IntegerField(blank=True, validators=[django.core.validators.MinValueValidator(1), django.core.validators.MaxValueValidator(100)]),
        ),
        migrations.AlterField(
            model_name='kpi',
            name='progress',
            field=models.CharField(blank=True, choices=[('Working', 'Working'), ('Completed', 'Completed')], default='Working', max_length=20),
        ),
        migrations.AlterField(
            model_name='midyrcommentbox',
            name='created_by',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='Profile.profile'),
        ),
        migrations.AlterField(
            model_name='midyrcommentbox',
            name='goal',
            field=models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, to='GnC.goals'),
        ),
    ]