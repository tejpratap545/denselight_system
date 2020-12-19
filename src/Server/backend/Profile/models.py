import secrets
import uuid
from typing import Optional

from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.core.validators import MaxValueValidator, MinValueValidator
from django.db import models


# Create your models here.
from backend.Profile.backend import check_password_strength


class PasswordTooWeakError(Exception):
    pass


class User(AbstractBaseUser, PermissionsMixin):

    ROLE_TYPE = (
        ("HRManager", "HRManager"),
        ("HR", "HR"),
        ("Manager", "Manager"),
        ("Employee", "Employee"),
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
    name = models.CharField(max_length=200, blank=False, null=False)

    employee_ID = models.CharField(
        max_length=15, blank=False, null=False, default="S123456D"
    )

    nric = models.CharField(max_length=20, blank=False, null=True)

    typeOfEmployee = models.CharField(
        max_length=50, blank=False, null=False, choices=DIRECT_CHOICES, default="DIRECT"
    )

    email = models.EmailField(blank=False, null=False)

    department = models.ForeignKey(
        Departments, blank=False, null=True, on_delete=models.SET_NULL
    )

    gender = models.CharField(
        max_length=6, choices=GENDER_CHOICE, blank=False, null=False
    )

    address_1 = models.CharField(max_length=250, blank=True, null=True)
    address_2 = models.CharField(max_length=250, blank=True, null=True)

    date_Of_Passport_Expiry = models.DateField(blank=True, null=True)

    citizenship_Status = models.CharField(
        max_length=70, blank=False, null=False, default="-"
    )

    date_Of_Hire = models.DateField(blank=False, null=False)

    job_Title = models.CharField(max_length=100, blank=False, null=False)

    employment_Type = models.CharField(
        max_length=30, choices=EMPLOYMENT_TYPE_CHOICE, default="Full-time"
    )

    skill1 = models.CharField(max_length=50, blank=True, null=True)
    skill2 = models.CharField(max_length=50, blank=True, null=True)
    skill3 = models.CharField(max_length=50, blank=True, null=True)

    first_Reporting_Manager = models.ForeignKey(
        "self", blank=True, null=True, on_delete=models.SET_NULL
    )

    second_Reporting_Manager = models.CharField(max_length=200, blank=True, null=True)

    division_Centre = models.CharField(max_length=150, blank=True, null=True)

    phone = models.CharField(max_length=50, blank=True, null=True)

    def __str__(self):
        return self.name


class EmailConfirmation(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    token = models.CharField(
        max_length=250, default=secrets.token_urlsafe(), editable=False
    )
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.user.email


class PasswordReset(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    url_token = models.CharField(
        max_length=250, default=secrets.token_urlsafe(), editable=False
    )
    success_token = models.CharField(
        max_length=250, blank=True, null=True, editable=False
    )
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.user.email
