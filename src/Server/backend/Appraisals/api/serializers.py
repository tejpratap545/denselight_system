from rest_framework import serializers
from ..models import *

from backend.Profile.api.serializers import ShortProfileSerializer


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
