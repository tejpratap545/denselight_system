from rest_framework import serializers
from ..models import *
from django.db import transaction
from backend.Profile.api.serializers import ShortProfileSerializer
from ...GnC.api.serializers import (
    DetailGoalSerializer,
    CompetenciesSerializer,
    DetailCompetenciesSerializer,
)
from backend.Trainings.api.serializers import SkillsSerializer


class AppraisalCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Appraisal_Category
        fields = "__all__"


class OverallAppraisalSerializer(serializers.ModelSerializer):
    employee_count = serializers.IntegerField(read_only=True)
    individual_employees = serializers.ListField(write_only=True, required=False)
    departments = serializers.ListField(write_only=True, required=False)
    is_company = serializers.BooleanField(default=False)

    class Meta:
        model = Overall_Appraisal
        fields = "__all__"

    def create(self, validated_data):
        with transaction.atomic():
            is_company = validated_data.pop("is_company", False)
            individual_employees = validated_data.pop("individual_employees", [])
            departments = validated_data.pop("departments", [])
            overall_appraisal = Overall_Appraisal.objects.create(**validated_data)
            if is_company:
                for profile in Profile.objects.all():
                    User_Appraisal_List.objects.get_or_create(
                        employee=profile,
                        manager=profile.first_Reporting_Manager,
                        overall_appraisal=overall_appraisal,
                        status="Employee",
                        appraisal_name=overall_appraisal.name,
                        appraisal_category=overall_appraisal.appraisal_category,
                        start_date=overall_appraisal.start_date,
                        end_date=overall_appraisal.calibration_end_date,
                        completion="null",
                    )
                return overall_appraisal

            elif len(departments) > 0:
                for profile in Profile.objects.filter(department__in=departments):
                    User_Appraisal_List.objects.create(
                        employee=profile,
                        manager=profile.first_Reporting_Manager,
                        overall_appraisal=overall_appraisal,
                        status="Employee",
                        appraisal_name=overall_appraisal.name,
                        appraisal_category=overall_appraisal.appraisal_category,
                        start_date=overall_appraisal.start_date,
                        end_date=overall_appraisal.calibration_end_date,
                        completion="null",
                    )
                return overall_appraisal

            elif len(individual_employees) > 0:
                for profile in Profile.objects.filter(id__in=individual_employees):
                    User_Appraisal_List.objects.create(
                        employee=profile,
                        manager=profile.first_Reporting_Manager,
                        overall_appraisal=overall_appraisal,
                        status="Employee",
                        appraisal_name=overall_appraisal.name,
                        appraisal_category=overall_appraisal.appraisal_category,
                        start_date=overall_appraisal.start_date,
                        end_date=overall_appraisal.calibration_end_date,
                        completion="null",
                    )
                return overall_appraisal

            else:
                return serializers.ValidationError("Something went wrong")


class UserAppraisalListSerializer(serializers.ModelSerializer):
    manager = ShortProfileSerializer()
    employee = ShortProfileSerializer()
    overall_appraisal = OverallAppraisalSerializer()
    appraisal_category = AppraisalCategorySerializer()
    goals_count = serializers.IntegerField(read_only=True, default=0)
    core_values_competencies_count = serializers.IntegerField(read_only=True, default=0)
    skills_count = serializers.IntegerField(read_only=True, default=0)

    class Meta:
        model = User_Appraisal_List
        fields = "__all__"


class DetailAppraisalSerializer(serializers.ModelSerializer):
    manager = ShortProfileSerializer()
    employee = ShortProfileSerializer()
    overall_appraisal = OverallAppraisalSerializer()
    appraisal_category = AppraisalCategorySerializer()
    goals_set = DetailGoalSerializer(many=True)
    competencies_set = DetailCompetenciesSerializer(many=True)
    skills_set = SkillsSerializer(many=True)

    class Meta:
        model = User_Appraisal_List
        fields = "__all__"


class GoalsSettingRejectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = User_Appraisal_List
        fields = ("goals_settingM_rejection",)

    def update(self, instance, validated_data):
        super(GoalsSettingRejectionSerializer, self).update()
        instance.status = "Employee"
        instance.save()


class MidYearRejectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = User_Appraisal_List
        fields = ("mid_yearM_rejection",)

    def update(self, instance, validated_data):
        super(MidYearRejectionSerializer, self).update()
        instance.status = "S1BReview"
        instance.save()


class AppraisalRejectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = User_Appraisal_List
        fields = ("appraisalHR_rejection",)

    def update(self, instance, validated_data):
        super(AppraisalRejectionSerializer, self).update()
        instance.status = "Employee"
        instance.save()
