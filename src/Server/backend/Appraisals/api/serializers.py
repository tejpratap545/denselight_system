from rest_framework import serializers
from ..models import *
from django.db import transaction
from backend.Profile.api.serializers import ShortProfileSerializer
from ...GnC.api.serializers import (
    DetailGoalSerializer,
    CompetenciesSerializer,
    DetailCompetenciesSerializer,
)


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

    class Meta:
        model = User_Appraisal_List
        fields = "__all__"

        #
        # (
        #     "employee",
        #     "manager",
        #     "overall_appraisal",
        #     "status",
        #     "appraisal_name",
        #     "appraisal_category",
        #     "overall_board_comments",
        #     "start_date",
        #     "end_date",
        #     "completion",
        #     "goals_settingM_rejection",
        #     "mid_yearM_rejection",
        #     "appraisalHR_rejection",
        #     "mid_year_completion",
        #     "incrementRecommendation",
        #     "bonusRecommendation",
        #     "recommendationComments",
        #     "final_employee_rating",
        #     "final_manager_rating",
        #     "final_board_rating",
        #     "goals_set",
        #     "competencies_set",
        # )
