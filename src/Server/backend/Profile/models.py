# Create your models here.
from backend.Profile.backend import check_password_strength
from backend.Profile.manager import UserManager
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.core.validators import MaxValueValidator, MinValueValidator
from django.db import models, transaction
from django.utils import timezone
from typing import Optional

import secrets
import uuid


class PasswordTooWeakError(Exception):
    pass


class User(AbstractBaseUser, PermissionsMixin):

    ROLE_TYPE = (
        ("HRManager", "HRManager"),
        ("Hr", "Hr"),
        ("Manager", "Manager"),
        ("Employee", "Employee"),
        ("Admin", "Admin"),
    )
    first_name = models.CharField(max_length=50, blank=True, null=True)
    username = models.CharField(max_length=50, unique=True, null=False)
    last_name = models.CharField(max_length=50, blank=True, null=True)
    email = models.EmailField(
        blank=False,
        null=False,
    )
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    is_email_verified = models.BooleanField(default=False, null=True)
    date_joined = models.DateTimeField(auto_now_add=True)
    dummy_password = models.CharField(max_length=10, blank=True, null=True)
    role = models.CharField(
        max_length=20, blank=True, null=True, choices=ROLE_TYPE, default="Employee"
    )

    USERNAME_FIELD = "username"
    objects = UserManager()

    @property
    def is_staff(self):
        return self.is_admin

    def __str__(self):
        return self.email

    def set_password(self, password: Optional[str]) -> None:
        """
        set the password of user
        if password is none then set it to unusable otherwise first check the password strength and the set
        """
        if password is None:
            self.set_unusable_password()
            return

        if not check_password_strength(password):
            raise PasswordTooWeakError

        super().set_password(password)


class Qualifications(models.Model):
    employee = models.ForeignKey(
        "Profile", blank=False, null=True, on_delete=models.CASCADE
    )
    institution = models.CharField(max_length=150, blank=True, null=True)
    name = models.CharField(max_length=150, blank=False, null=False)
    graduation_year = models.IntegerField(
        validators=[MinValueValidator(1920), MaxValueValidator(2200)],
        blank=True,
        null=True,
    )

    def __str__(self):
        return self.name


class DiscardSkills(models.Model):
    name = models.CharField(max_length=150, blank=False, null=False)
    course_Attended = models.CharField(max_length=150, blank=True, null=True)

    def __str__(self):
        return self.name


class Departments(models.Model):
    name = models.CharField(max_length=100, blank=False, null=True)

    manager = models.ForeignKey(
        "Profile", blank=True, null=True, on_delete=models.CASCADE
    )

    def __str__(self):
        return self.name


class Profile(models.Model):
    EMPLOYMENT_TYPE_CHOICE = (
        ("Contractor", "CONTRACTOR"),
        ("Full-time", "FULL-TIME"),
        ("Part-time", "PART-TIME"),
        ("Internship", "INTERN"),
    )

    GENDER_CHOICE = (
        ("Male", "MALE"),
        ("Female", "FEMALE"),
    )

    MARITAL_STATUS_CHOICE = (
        ("Single", "SINGLE"),
        ("Married", "MARRIED"),
        ("Divorced", "DIVORCED"),
        ("Separated", "SEPARATED"),
        ("Widowed", "WIDOWED"),
    )

    DIRECT_CHOICES = (
        ("DIRECT", "DIRECT"),
        ("INDIRECT", "INDIRECT"),
    )

    user = models.OneToOneField(User, null=True, on_delete=models.CASCADE)

    profile_Picture = models.ImageField(upload_to="profile", blank=True, null=True)
    name = models.CharField(max_length=200, blank=True, null=False)

    employee_ID = models.CharField(
        max_length=15, blank=True, null=True, default="S123456D"
    )

    nric = models.CharField(max_length=20, blank=True, null=True)

    typeOfEmployee = models.CharField(
        max_length=50, blank=True, null=True, choices=DIRECT_CHOICES, default="DIRECT"
    )

    email = models.EmailField(blank=True, null=True)

    department = models.ForeignKey(
        Departments, blank=True, null=True, on_delete=models.SET_NULL
    )

    gender = models.CharField(
        max_length=6, choices=GENDER_CHOICE, blank=True, null=True
    )

    address_1 = models.CharField(max_length=250, blank=True, null=True)
    address_2 = models.CharField(max_length=250, blank=True, null=True)

    date_Of_Passport_Expiry = models.DateField(blank=True, null=True)

    citizenship_Status = models.CharField(
        max_length=70, blank=True, null=False, default="-"
    )

    date_Of_Hire = models.DateField(blank=True, null=True)

    job_Title = models.CharField(max_length=100, blank=True, null=True)

    employment_Type = models.CharField(
        max_length=30, choices=EMPLOYMENT_TYPE_CHOICE, default="Full-time"
    )

    skill1 = models.CharField(max_length=50, blank=True, null=True)
    skill2 = models.CharField(max_length=50, blank=True, null=True)
    skill3 = models.CharField(max_length=50, blank=True, null=True)

    first_Reporting_Manager = models.ForeignKey(
        "self", blank=True, null=True, on_delete=models.SET_NULL
    )

    # second_Reporting_Manager = models.CharField(max_length=200, blank=True, null=True)
    second_Reporting_Manager = models.ForeignKey(
        "self",
        blank=True,
        null=True,
        on_delete=models.SET_NULL,
        related_name="second_reporting_manager",
    )
    resign_date = models.DateField(null=True,blank=True)

    division_Centre = models.CharField(max_length=150, blank=True, null=True)

    phone = models.CharField(max_length=50, blank=True, null=True)

    def __str__(self):
        return self.name


class AccessToken(models.Model):
    token = models.CharField(max_length=128, blank=True, unique=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    expires = models.DateTimeField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def is_valid(self):
        return not self.is_expired()

    def is_expired(self):
        if not self.expires:
            return True

        return timezone.now() >= self.expires

    def revoke(self):
        self.delete()

    class Meta:
        db_table = '"auth_access_token"'


class RefreshToken(models.Model):
    user = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name="user_refresh_token", null=True
    )
    token = models.CharField(max_length=255)

    access_token = models.OneToOneField(
        AccessToken,
        on_delete=models.SET_NULL,
        blank=True,
        null=True,
        related_name="refresh_token",
    )

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    revoked = models.DateTimeField(null=True)

    def revoke(self):

        with transaction.atomic():
            try:
                AccessToken.objects.get(id=self.access_token_id).revoke()
            except AccessToken.DoesNotExist:
                pass
            self.access_token = None
            self.revoked = timezone.now()
            self.save()

    def __str__(self):
        return self.token

    class Meta:
        db_table = '"auth_refresh_token"'
        unique_together = (
            "token",
            "revoked",
        )


class Notification(models.Model):
    COLOR_CHOICES = (
        ("info", "info"),
        ("error", "error"),
        ("success", "success"),
    )
    user = models.ForeignKey(Profile, on_delete=models.CASCADE)
    title = models.CharField(max_length=100, blank=True, null=True)
    description = models.TextField(null=True, blank=True)
    color = models.CharField(
        max_length=20, blank=True, null=True, choices=COLOR_CHOICES
    )
    seen = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)


class Guide(models.Model):
    title = models.CharField(max_length=300)
    thumbnail = models.ImageField(upload_to="guide/thumbnail", blank=True, null=True)
    video = models.FileField(upload_to="guide/video", blank=True, null=True)
    description = models.TextField(blank=True, null=True)


class ResetPasswordToken(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    token = models.CharField(max_length=10)
    created_at = models.DateTimeField(auto_now_add=True)
