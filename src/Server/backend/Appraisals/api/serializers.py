from rest_framework import serializers
from ..models import *

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
    appraisal_category = AppraisalCategorySerializer()
    employee_count = serializers.IntegerField(read_only=True)

    class Meta:
        model = Overall_Appraisal
        fields = "__all__"


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
