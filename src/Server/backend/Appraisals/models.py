from backend.Profile.models import Profile
from datetime import date
from django.contrib.auth.models import auth, Group, User
from django.core.validators import MaxValueValidator, MinValueValidator
from django.db import models


# Create your models here.


def GRADING_SYSTEM(x):
    if x >= 5:
        return "Far Exceed Expectations"

    elif x >= 4:
        return "Exceeds Expectations"

    elif x >= 3:
        return "Meets Expectations"

    elif x >= 2:
        return "Needs Improvement"

    elif x >= 1:
        return "Major Improvement needed"

    else:
        return "Ungraded"


class Appraisal_Category(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name


class Overall_Appraisal(models.Model):
    STAGES_CHOICES = (
        ("Stage 1", "Goals Setting"),
        ("Stage 1B", "Mid-Year Review"),
        ("Stage 2", "Year-End Review"),
        ("Stage 3", "Reports"),
        ("Stage 4", "Calibration"),
        ("Completed", "Completed"),
    )

    RATING_CHOICES = (("Denselight System", "Denselight System"), ("MiRXes", "MiRXes"))

    name = models.CharField(max_length=50, blank=True, null=True)
    appraisal_category = models.ForeignKey(
        Appraisal_Category, null=True, blank=True, on_delete=models.SET_NULL
    )

    goal_weightage = models.IntegerField(
        validators=[MinValueValidator(0), MaxValueValidator(100)],
        blank=True,
        null=True,
    )
    competency_weightage = models.IntegerField(
        validators=[MinValueValidator(0), MaxValueValidator(100)],
        blank=True,
        null=True,
    )
    skill_weightage = models.IntegerField(
        validators=[MinValueValidator(0), MaxValueValidator(100)],
        blank=True,
        null=True,
    )

    start_date = models.DateField(default=date.today)
    goals_setting_end_date = models.DateField(default=date.today)

    mid_year_start_date = models.DateField(default=date.today)
    mid_year_end_date = models.DateField(default=date.today)

    end_year_start_date = models.DateField(default=date.today)
    appraisal_end_date = models.DateField(default=date.today)
    reports_end_date = models.DateField(default=date.today)
    calibration_end_date = models.DateField(default=date.today)

    # Temporary no foreignkey
    rating_scale = models.CharField(
        max_length=50,
        blank=True,
        null=True,
        choices=RATING_CHOICES,
        default="Denselight System",
    )

    status = models.CharField(
        max_length=100, choices=STAGES_CHOICES, blank=True, null=True
    )

    def __str__(self):
        return "{}: {}".format(self.appraisal_category, self.name)


class Rating_Scale(models.Model):
    name = models.CharField(max_length=50, blank=True, null=False)
    description = models.CharField(max_length=5000, blank=True, null=False)
    limiter = models.IntegerField(blank=False, null=False)

    def __str__(self):
        return self.name


class User_Appraisal_List(models.Model):
    RATING_CHOICES = [
        (1, "1 - Major Improvement Needed"),
        (2, "2 - Needs Improvement"),
        (3, "3 - Meets Expectations"),
        (4, "4 - Exceeds Expectations"),
        (5, "5 - Far Exceed Expectations"),
    ]

    STATUS_CHOICE = (
        ("Employee", "Employee"),
        ("Manager", "Manager"),
        ("S1BEmployee", "S1BEmployee"),
        ("S1BManager", "S1BManager"),
        ("S1BReview", "S1BReview"),
        ("S2Employee", "S2Employee"),
        ("S2Manager", "S2Manager"),
        ("Approved", "Approved"),
    )

    COMPLETION_CHOICE = (
        ("null", "null"),
        ("Ecompleted", "Ecompleted"),
        ("MCompleted", "MCompleted"),
        ("BCompleted", "BCompleted"),
        ("Review", "Review"),
        ("ReviewCompleted", "ReviewCompleted"),
    )

    MID_YEAR_COMPLETION_CHOICE = (
        ("Uncompleted", "Uncompleted"),
        ("Completed", "Completed"),
    )
    is_closed = models.BooleanField(default=False)

    employee = models.ForeignKey(
        Profile, blank=True, null=True, on_delete=models.CASCADE
    )
    manager = models.ForeignKey(
        Profile,
        blank=True,
        null=True,
        related_name="manager",
        on_delete=models.CASCADE,
    )
    overall_appraisal = models.ForeignKey(
        Overall_Appraisal, blank=True, null=True, on_delete=models.CASCADE
    )

    status = models.CharField(
        max_length=30, blank=True, null=False, choices=STATUS_CHOICE
    )
    appraisal_name = models.CharField(max_length=50, blank=True, null=True)
    appraisal_category = models.ForeignKey(
        Appraisal_Category, blank=True, null=True, on_delete=models.SET_NULL
    )

    overall_board_comments = models.CharField(
        max_length=5000, blank=True, null=True, default="No Comments"
    )

    start_date = models.DateField(null=True)
    end_date = models.DateField(null=True)
    completion = models.CharField(
        max_length=50, blank=True, null=True, default="null", choices=COMPLETION_CHOICE
    )

    goals_settingM_rejection = models.CharField(
        max_length=3000, blank=True, null=False, default="NIL"
    )
    mid_yearM_rejection = models.CharField(
        max_length=3000, blank=True, null=False, default="NIL"
    )
    end_yearM_rejection = models.CharField(
        max_length=3000, blank=True, null=False, default="NIL"
    )
    appraisalHR_rejection = models.CharField(
        max_length=3000, blank=True, null=False, default="NIL"
    )
    mid_year_completion = models.CharField(
        max_length=15,
        choices=MID_YEAR_COMPLETION_CHOICE,
        blank=True,
        null=False,
        default="Uncompleted",
    )

    incrementRecommendation = models.IntegerField(
        validators=[MinValueValidator(0), MaxValueValidator(100)],
        blank=True,
        null=False,
        default=0,
    )
    bonusRecommendation = models.CharField(
        max_length=1000, blank=True, null=False, default="NIL"
    )
    recommendationComments = models.CharField(
        max_length=1000, blank=True, null=False, default="NIL"
    )

    final_employee_rating = models.IntegerField(blank=True, null=True)
    final_manager_rating = models.IntegerField(blank=True, null=True)
    final_board_rating = models.IntegerField(blank=True, null=True)
    end_year_employee_file = models.FileField(
        upload_to="endyear/file/employee", null=True
    )

    board_comments = models.CharField(
        max_length=2000, blank=True, null=True, default="NIL"
    )
    board_rating = models.IntegerField(
        choices=RATING_CHOICES,
        blank=True,
        null=True,
    )

    career_aspiration_employee = models.CharField(
        max_length=2000, blank=True, null=True, default="NIL"
    )

    career_aspiration_manager = models.CharField(
        max_length=2000, blank=True, null=True, default="NIL"
    )

    def __str__(self):
        return "{}:'s Appraisal".format(self.employee.name)


class Appraisal(models.Model):
    STATUS_CHOICE = (("Employee", "Employee"), ("Manager", "Manager"), ("HR", "HR"))
    employee_list = models.OneToOneField(
        User_Appraisal_List, blank=True, null=True, on_delete=models.SET_NULL
    )
    user = models.ForeignKey(
        Profile, blank=True, related_name="userA", null=True, on_delete=models.CASCADE
    )
    manager = models.ForeignKey(
        Profile,
        blank=True,
        related_name="managersA",
        null=True,
        on_delete=models.CASCADE,
    )

    status = models.CharField(
        max_length=30, blank=True, null=False, choices=STATUS_CHOICE
    )
    created_by = models.ForeignKey(
        Profile,
        blank=True,
        related_name="creatorA",
        null=True,
        on_delete=models.CASCADE,
    )
    rating_scale = models.ForeignKey(
        Rating_Scale, null=True, blank=True, on_delete=models.SET_NULL
    )

    def __str__(self):
        return "{}'s Appraisal".format(self.employee_list)


class peerAppraisal(models.Model):
    COMPLETION_CHOICE = (("Uncompleted", "Uncompleted"), ("Completed", "Completed"))
    appraisal = models.ForeignKey(
        User_Appraisal_List, blank=True, null=True, on_delete=models.CASCADE
    )
    manager = models.ForeignKey(
        Profile,
        blank=True,
        related_name="managersPA",
        null=True,
        on_delete=models.CASCADE,
    )
    viewer = models.ForeignKey(
        Profile, blank=True, related_name="viewer", null=True, on_delete=models.CASCADE
    )

    title1 = models.CharField(max_length=200, blank=True, null=False)
    strength1 = models.CharField(max_length=3000, blank=True, null=True)
    weaknessdevelopment1 = models.CharField(max_length=3000, blank=True, null=True)

    title2 = models.CharField(max_length=200, blank=True, null=False, default="NIL")
    strength2 = models.CharField(max_length=3000, blank=True, null=True)
    weaknessdevelopment2 = models.CharField(max_length=3000, blank=True, null=True)

    title3 = models.CharField(max_length=200, blank=True, null=False, default="NIL")
    strength3 = models.CharField(max_length=3000, blank=True, null=True)
    weaknessdevelopment3 = models.CharField(max_length=3000, blank=True, null=True)

    completion = models.CharField(
        max_length=20,
        default="Uncompleted",
        blank=True,
        null=True,
        choices=COMPLETION_CHOICE,
    )
    created_by = models.ForeignKey(
        Profile,
        blank=True,
        related_name="creatorPA",
        null=True,
        on_delete=models.CASCADE,
    )

    def __str__(self):
        return "{}'s Peer Appraisal".format(self.appraisal)


class peerAppraisalQuestion(models.Model):
    COMPLETION_CHOICE = (("Uncompleted", "Uncompleted"), ("Completed", "Completed"))

    appraisal = models.ForeignKey(
        peerAppraisal, blank=True, null=True, on_delete=models.CASCADE
    )
    title = models.CharField(max_length=200, blank=True, null=True)
    answer = models.CharField(max_length=1000, blank=True, null=True)
    completed = models.CharField(
        max_length=20,
        default="Uncompleted",
        blank=True,
        null=True,
        choices=COMPLETION_CHOICE,
    )
