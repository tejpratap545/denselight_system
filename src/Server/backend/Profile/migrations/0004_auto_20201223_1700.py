# Generated by Django 3.1.2 on 2020-12-23 11:30

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Profile', '0003_auto_20201221_1408'),
    ]

    operations = [
        migrations.AddField(
            model_name='profile',
            name='second_Reporting_Manager_Link',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='second_reporting_manager', to='Profile.profile'),
        ),
        migrations.AlterField(
            model_name='emailconfirmation',
            name='token',
            field=models.CharField(default='4izWq_igfiELXM4pPjmL2h2HCx8f9aO64fY6W2bqrRE', editable=False, max_length=250),
        ),
        migrations.AlterField(
            model_name='passwordreset',
            name='url_token',
            field=models.CharField(default='3k1OCZ7wCFRXwq1F8elUHDs83ZoOCDP_l3g3r2n47AE', editable=False, max_length=250),
        ),
    ]
