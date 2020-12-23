from rest_framework import serializers
from ..models import *

from django.db.models import Sum


class CreateGoalSerializer(serializers.ModelSerializer):
    class Meta:
        model = Goals
        fields = (
            "goal_category",
            "summary",
            "description",
            "metrics_Used",
            "weightage",
            "due",
            "metrics_evidence",
            "appraisal",
        )


class CreateCompetenciesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Competencies
        fields = [
            "competency_category",
            "summary",
            "description",
            "weightage",
            "appraisal",
        ]


class CreateKPISerializer(serializers.ModelSerializer):
    class Meta:
        model = KPI
        fields = [
            "description",
            "due",
            "goal",
        ]
