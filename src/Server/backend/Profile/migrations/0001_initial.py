# Generated by Django 3.1.2 on 2020-12-19 17:51

from django.conf import settings
import django.core.validators
from django.db import migrations, models
import django.db.models.deletion
import uuid


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='Departments',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='DiscardSkills',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=150)),
                ('course_Attended', models.CharField(blank=True, max_length=150, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('profile_Picture', models.ImageField(blank=True, null=True, upload_to='profile')),
                ('name', models.CharField(max_length=200)),
                ('employee_ID', models.CharField(default='S123456D', max_length=15)),
                ('nric', models.CharField(max_length=20, null=True)),
                ('typeOfEmployee', models.CharField(choices=[('DIRECT', 'DIRECT'), ('INDIRECT', 'INDIRECT')], default='DIRECT', max_length=50)),
                ('email', models.EmailField(max_length=254)),
                ('gender', models.CharField(choices=[('Male', 'MALE'), ('Female', 'FEMALE')], max_length=6)),
                ('address_1', models.CharField(blank=True, max_length=250, null=True)),
                ('address_2', models.CharField(blank=True, max_length=250, null=True)),
                ('date_Of_Passport_Expiry', models.DateField(blank=True, null=True)),
                ('citizenship_Status', models.CharField(default='-', max_length=70)),
                ('date_Of_Hire', models.DateField()),
                ('job_Title', models.CharField(max_length=100)),
                ('employment_Type', models.CharField(choices=[('Contractor', 'CONTRACTOR'), ('Full-time', 'FULL-TIME'), ('Part-time', 'PART-TIME'), ('Internship', 'INTERN')], default='Full-time', max_length=30)),
                ('skill1', models.CharField(blank=True, max_length=50, null=True)),
                ('skill2', models.CharField(blank=True, max_length=50, null=True)),
                ('skill3', models.CharField(blank=True, max_length=50, null=True)),
                ('division_Centre', models.CharField(blank=True, max_length=150, null=True)),
                ('phone', models.CharField(blank=True, max_length=50, null=True)),
                ('department', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='Profile.departments')),
                ('first_Reporting_Manager', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='Profile.profile')),
                ('second_Reporting_Manager', models.CharField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('first_name', models.CharField(blank=True, max_length=50, null=True)),
                ('username', models.CharField(max_length=50, unique=True)),
                ('last_name', models.CharField(blank=True, max_length=50, null=True)),
                ('email', models.EmailField(max_length=254, unique=True)),
                ('is_active', models.BooleanField(default=True)),
                ('is_admin', models.BooleanField(default=False)),
                ('is_superuser', models.BooleanField(default=False)),
                ('is_email_verified', models.BooleanField(default=False)),
                ('date_joined', models.DateTimeField(auto_now_add=True)),
                ('dummy_password', models.CharField(blank=True, max_length=10, null=True)),
                ('role', models.CharField(blank=True, choices=[('HR manager', 'HR manager'), ('HR', 'HR'), ('Manager', 'Manager'), ('Employee', 'Employee')], max_length=20)),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Qualifications',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('institution', models.CharField(blank=True, max_length=150, null=True)),
                ('name', models.CharField(max_length=150)),
                ('graduation_year', models.IntegerField(blank=True, null=True, validators=[django.core.validators.MinValueValidator(1920), django.core.validators.MaxValueValidator(2200)])),
                ('employee', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='Profile.profile')),
            ],
        ),
        migrations.AddField(
            model_name='profile',
            name='user',
            field=models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
        migrations.CreateModel(
            name='PasswordReset',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('url_token', models.CharField(default='z8iT3eBJtf1eCijYSaqv0r3x4I3cvnsDV3DmN4zspUk', editable=False, max_length=250)),
                ('success_token', models.CharField(blank=True, editable=False, max_length=250, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='EmailConfirmation',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('token', models.CharField(default='325D1QZW_HelhylYQXHW6s8kuLksjFmAFDPp2Fxkhlc', editable=False, max_length=250)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AddField(
            model_name='departments',
            name='manager',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='Profile.profile'),
        ),
    ]