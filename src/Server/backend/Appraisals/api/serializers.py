from rest_framework import serializers
from ..models import *
from django.db import transaction
from backend.Profile.api.serializers import ShortProfileSerializer, DepartmentSerializer
from ...GnC.api.serializers import (
    DetailGoalSerializer,
    CompetenciesSerializer,
    DetailCompetenciesSerializer,
    DetailDepartmentGoalSerializer,
    DepartmentCompetenciesSerializer,
)
from backend.Trainings.api.serializers import SkillsSerializer


class AppraisalCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Appraisal_Category
        fields = "__all__"


class DetailOverallAppraisalSerializer(serializers.ModelSerializer):
    employee_count = serializers.IntegerField(read_only=True)
    individual_employees = serializers.ListField(write_only=True, required=False)
    departments = serializers.ListField(write_only=True, required=False)
    is_company = serializers.BooleanField(default=False)
    departmentalgoals_set = DetailDepartmentGoalSerializer(many=True)
    departmentalcompetencies_set = DepartmentCompetenciesSerializer(many=True)
    appraisal_category = AppraisalCategorySerializer()

    class Meta:
        model = Overall_Appraisal
        fields = "__all__"


def int_status(a):
    if a == "Stage 1":
        return 0
    elif a == "Stage 1B":
        return 1
    elif a == "Stage 2":
        return 2
    elif a == "Stage 3":
        return 3
    elif a == "Stage 4":
        return 4
    else:
        return 5


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
            overall_appraisal = Overall_Appraisal.objects.create(
                **validated_data,
                status="Stage 1",
            )
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

    def update(self, instance, validated_data):
        super(OverallAppraisalSerializer, self).update(instance, validated_data)
        a = int_status(validated_data.get("status"))
        b = int_status(instance.status)
        if a < b:
            if a == 0:
                User_Appraisal_List.objects.filter(Overall_Appraisal=instance).update(
                    status="Employee",
                    completion="null",
                    mid_year_completion="Uncompleted",
                )
            if a == 1:
                User_Appraisal_List.objects.filter(Overall_Appraisal=instance).update(
                    status="S1BEmployee",
                    completion="null",
                    mid_year_completion="Uncompleted",
                )
            if a == 2:
                User_Appraisal_List.objects.filter(Overall_Appraisal=instance).update(
                    status="S2Employee",
                    completion="null",
                )

        return instance


class ShortOverallAppraisalSerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Overall_Appraisal
        fields = (
            "id",
            "name",
            "status",
            "calibration_end_date",
        )


class ShortAppraisal2Serializer(serializers.ModelSerializer):
    overall_appraisal = ShortOverallAppraisalSerSerializer()

    class Meta:
        model = User_Appraisal_List

        fields = (
            "id",
            "appraisal_name",
            "overall_appraisal",
            "status",
        )


class ShortAppraisalSerializer(serializers.ModelSerializer):
    overall_appraisal = ShortOverallAppraisalSerSerializer()

    class Meta:
        model = User_Appraisal_List

        fields = (
            "id",
            "appraisal_name",
            "status",
            "overall_appraisal",
            "completion",
        )


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
    overall_appraisal = DetailOverallAppraisalSerializer()
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
        super(GoalsSettingRejectionSerializer, self).update(instance, validated_data)
        instance.status = "Employee"
        instance.save()
        return instance


class MidYearRejectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = User_Appraisal_List
        fields = ("mid_yearM_rejection",)

    def update(self, instance, validated_data):
        super(MidYearRejectionSerializer, self).update(instance, validated_data)
        instance.status = "S1BReview"
        instance.save()
        return instance


class EndRejectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = User_Appraisal_List
        fields = ("end_yearM_rejection",)

    def update(self, instance, validated_data):
        super(EndRejectionSerializer, self).update(instance, validated_data)
        instance.status = "S2Employee"
        instance.completion = "null"
        instance.save()
        return instance


class AppraisalRejectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = User_Appraisal_List
        fields = ("appraisalHR_rejection",)

    def update(self, instance, validated_data):
        super(AppraisalRejectionSerializer, self).update(instance, validated_data)
        instance.status = "Employee"
        instance.save()
        return instance


class CreatePeerAppraisalSerializer(serializers.ModelSerializer):
    employee_list = serializers.ListField(required=True)

    class Meta:
        model = peerAppraisal
        fields = (
            "appraisal",
            "title1",
            "title2",
            "title3",
            "employee_list",
        )


class ShortPeerSerializer(serializers.ModelSerializer):
    appraisal = ShortAppraisalSerializer()
    viewer = ShortProfileSerializer()
    created_by = ShortProfileSerializer()

    class Meta:
        model = peerAppraisal
        fields = (
            "id",
            "appraisal",
            "completion",
            "viewer",
            "created_by",
        )


class SubmitPeerAppraisalSerializer(serializers.ModelSerializer):
    class Meta:
        model = peerAppraisal
        fields = (
            "strength1",
            "strength2",
            "strength3",
        )

    def update(self, instance, validated_data):
        super(SubmitPeerAppraisalSerializer, self).update(instance, validated_data)
        instance.completion = "Completed"
        instance.save()


class PeerAppraisalSerializer(serializers.ModelSerializer):
    class Meta:
        model = peerAppraisal
        fields = "__all__"


class ShortAppraisal2HodSerializer(serializers.ModelSerializer):
    department = DepartmentSerializer()
    user_appraisal_list_set = ShortAppraisal2Serializer(many=True)

    # manager = ShortProfileSerializer()

    class Meta:
        model = Profile
        fields = (
            "id",
            "name",
            "email",
            "department",
            "user_appraisal_list_set",
        )
