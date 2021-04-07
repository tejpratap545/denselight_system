from backend.Appraisals.models import Appraisal, Overall_Appraisal, User_Appraisal_List
from backend.Profile.models import Departments, Profile
from datetime import date, datetime
from django.conf import settings
from django.core.validators import MaxValueValidator, MinValueValidator
from django.db import models


class GoalComment(models.Model):
    goal = models.ForeignKey("Goals", blank=True, null=False, on_delete=models.CASCADE)
    comments = models.TextField(blank=False, null=True)
    created_on = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(
        Profile, blank=True, null=True, on_delete=models.CASCADE
    )

    def __str__(self):
        return self.created_by.name + ": " + self.comments


class CompetencyComment(models.Model):
    competency = models.ForeignKey(
        "Competencies", blank=True, null=False, on_delete=models.CASCADE
    )
    comments = models.TextField(blank=False, null=True)
    created_on = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(
        Profile, blank=True, null=True, on_delete=models.CASCADE
    )

    def __str__(self):
        return self.created_by.name + ": " + self.comments


class DepartmentalGoalComment(models.Model):
    departmental_goal = models.ForeignKey(
        "DepartmentalGoals",
        blank=True,
        null=False,
        on_delete=models.CASCADE,
    )
    comments = models.TextField(blank=False, null=True)
    created_on = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(
        Profile, blank=True, null=True, on_delete=models.CASCADE
    )

    def __str__(self):
        return self.created_by.name + ": " + self.comments


class DepartmentalCompetenciesComment(models.Model):
    departmental_competencies = models.ForeignKey(
        "DepartmentalCompetencies",
        blank=True,
        null=False,
        on_delete=models.CASCADE,
    )
    comments = models.TextField(blank=False, null=True)
    created_on = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(
        Profile, blank=True, null=True, on_delete=models.CASCADE
    )

    def __str__(self):
        return self.created_by.name + ": " + self.comments


class KPI(models.Model):
    PROGRESS_CHOICES = (("Working", "Working"), ("Completed", "Completed"))
    goal = models.ForeignKey("Goals", on_delete=models.CASCADE)
    description = models.TextField(blank=True, null=True)
    due = models.DateField(blank=True, null=True)
    date_created = models.DateField(null=True, default=date.today)
    progress = models.CharField(
        max_length=20,
        blank=True,
        null=False,
        choices=PROGRESS_CHOICES,
        default="Working",
    )

    def __str__(self):
        return self.description


class GoalCategory(models.Model):
    name = models.CharField(max_length=70, blank=True, null=False)

    def __str__(self):
        return self.name


class Goals(models.Model):
    RATING_CHOICES = [
        (1, "1 - Major Improvement Needed"),
        (2, "2 - Needs Improvement"),
        (3, "3 - Meets Expectations"),
        (4, "4 - Exceeds Expectations"),
        (5, "5 - Far Exceed Expectations"),
    ]

    TRACKING_CHOICES = [
        ("null", "null"),
        ("On Track", "On Track"),
        ("Not On Track", "Not On Track"),
    ]
    appraisal = models.ForeignKey(
        User_Appraisal_List, blank=True, null=True, on_delete=models.SET_NULL
    )
    employee = models.ForeignKey(
        Profile, blank=True, null=True, on_delete=models.SET_NULL
    )
    summary = models.TextField(blank=True, null=True)
    goal_category = models.ForeignKey(
        GoalCategory, blank=True, null=True, on_delete=models.CASCADE
    )
    description = models.TextField(blank=True, null=True)
    due = models.DateField()
    weightage = models.IntegerField(
        validators=[MinValueValidator(1), MaxValueValidator(100)],
        blank=True,
        null=False,
    )
    metrics_Used = models.TextField(blank=True, null=True)
    goal_employees_comment = models.TextField(null=True)
    goal_manager_comment = models.TextField(null=True)
    MID_user_comments = models.TextField(
        max_length=2000, blank=True, null=False, default="NIL"
    )
    MID_manager_comments = models.TextField(
        max_length=2000, blank=True, null=False, default="NIL"
    )

    user_rating = models.IntegerField(
        choices=RATING_CHOICES, blank=True, null=False, default=1
    )
    manager_rating = models.IntegerField(
        choices=RATING_CHOICES, blank=True, null=False, default=1
    )
    board_rating = models.IntegerField(
        choices=RATING_CHOICES, blank=True, null=False, default=1
    )

    user_comments = models.CharField(
        max_length=2000, blank=True, null=False, default="NIL"
    )
    manager_comments = models.CharField(
        max_length=2000, blank=True, null=False, default="NIL"
    )
    board_comments = models.CharField(
        max_length=2000, blank=True, null=False, default="NIL"
    )
    tracking_status = models.CharField(
        max_length=50, blank=True, null=True, default="null", choices=TRACKING_CHOICES
    )
    metrics_evidence = models.ImageField(blank=True, null=True)
    STATUS_CHOICE = (
        ("APPROVED", "APPROVED"),
        ("REJECTED", "REJECTED"),
    )
    status = models.CharField(
        max_length=100, blank=True, null=True, choices=STATUS_CHOICE
    )

    def __str__(self):
        return self.summary

    def get_kpi_filtered_completed(self):
        return self.kpi_set.filter(progress="Completed")

    def get_kpi_percentage(self):
        total = self.kpi_set.all().count()
        cnt = self.kpi_set.filter(progress="Completed").count()
        if total <= 0:
            return -1
        elif total >= cnt:
            perc = int(cnt * 100 / total)
            return perc
        else:
            return 0


class CompetencyCategory(models.Model):
    name = models.CharField(max_length=1000, blank=True, null=True)
    description = models.TextField(blank=True, null=True)

    def __str__(self):
        return "{} - {}".format(self.name, self.description)


class Competencies(models.Model):
    RATING_CHOICES = [
        (1, "1 - Major Improvement Needed"),
        (2, "2 - Needs Improvement"),
        (3, "3 - Meets Expectations"),
        (4, "4 - Exceeds Expectations"),
        (5, "5 - Far Exceed Expectations"),
    ]

    appraisal = models.ForeignKey(
        User_Appraisal_List, blank=True, null=True, on_delete=models.SET_NULL
    )
    employee = models.ForeignKey(
        Profile, blank=True, null=True, on_delete=models.SET_NULL
    )
    competency_category = models.ForeignKey(
        CompetencyCategory, blank=True, null=True, on_delete=models.CASCADE
    )
    summary = models.CharField(max_length=1500, blank=True, null=False)
    description = models.TextField(blank=True, null=True)
    weightage = models.IntegerField(
        validators=[MinValueValidator(1), MaxValueValidator(100)],
        blank=True,
        null=False,
    )

    user_rating = models.IntegerField(
        choices=RATING_CHOICES, blank=True, null=False, default=1
    )
    manager_rating = models.IntegerField(
        choices=RATING_CHOICES, blank=True, null=False, default=1
    )
    board_rating = models.IntegerField(
        choices=RATING_CHOICES, blank=True, null=False, default=1
    )

    user_comments = models.CharField(
        max_length=2000, blank=True, null=False, default="NIL"
    )
    manager_comments = models.CharField(
        max_length=2000, blank=True, null=False, default="NIL"
    )
    board_comments = models.CharField(
        max_length=2000, blank=True, null=False, default="NIL"
    )

    def __str__(self):
        return self.summary


class DepartmentalGoals(models.Model):
    manager = models.ForeignKey(
        Profile, blank=True, null=True, on_delete=models.SET_NULL
    )
    appraisal = models.ForeignKey(
        Overall_Appraisal, blank=True, null=True, on_delete=models.CASCADE
    )
    department = models.ForeignKey(Departments, null=True, on_delete=models.CASCADE)
    summary = models.TextField(blank=True, null=True)
    goal_category = models.ForeignKey(
        GoalCategory, blank=True, null=True, on_delete=models.CASCADE
    )
    description = models.TextField(blank=True, null=True)
    due = models.DateField()

    def __str__(self):
        return self.summary


class CascadedGoals(models.Model):
    manager = models.ForeignKey(
        Profile, blank=True, null=True, on_delete=models.SET_NULL
    )
    emaployees = models.ManyToManyField(
        Profile,
        blank=True,
        null=True,
        related_name="emaployees",
    )
    appraisal = models.ForeignKey(
        Overall_Appraisal, blank=True, null=True, on_delete=models.CASCADE
    )

    goal_category = models.ForeignKey(
        GoalCategory, blank=True, null=True, on_delete=models.CASCADE
    )

    summary = models.TextField(blank=True, null=True)

    description = models.TextField(blank=True, null=True)
    due = models.DateField()

    def __str__(self):
        return self.summary


class DepartmentalCompetencies(models.Model):
    manager = models.ForeignKey(
        Profile, blank=True, null=True, on_delete=models.SET_NULL
    )
    appraisal = models.ForeignKey(
        Overall_Appraisal, blank=True, null=True, on_delete=models.CASCADE
    )
    department = models.ForeignKey(Departments, null=True, on_delete=models.CASCADE)
    summary = models.TextField(blank=True, null=True)
    competency_category = models.ForeignKey(
        CompetencyCategory, blank=True, null=True, on_delete=models.CASCADE
    )
    description = models.TextField(blank=True, null=True)

    def __str__(self):
        return self.summary


######
class CommentBox(models.Model):
    goal = models.ForeignKey("Goals", blank=True, null=False, on_delete=models.CASCADE)
    comment = models.TextField(blank=False, null=True)
    created_on = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(
        Profile, blank=True, null=True, on_delete=models.CASCADE
    )

    def __str__(self):
        return self.comment


class MidYrCommentBox(models.Model):
    id = models.AutoField(primary_key=True)
    goal = models.ForeignKey("Goals", blank=True, null=False, on_delete=models.CASCADE)
    comment = models.TextField(blank=False, null=True)
    created_on = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(
        Profile, blank=True, null=True, on_delete=models.CASCADE
    )

    def __str__(self):
        return self.comment


class EndYrCommentBox(models.Model):
    id = models.AutoField(primary_key=True)
    goal = models.ForeignKey("Goals", blank=True, null=False, on_delete=models.CASCADE)
    comment = models.TextField(blank=False, null=True)
    created_on = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(
        Profile, blank=True, null=True, on_delete=models.CASCADE
    )

    def __str__(self):
        return self.comment
