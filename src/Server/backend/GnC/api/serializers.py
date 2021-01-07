from rest_framework import serializers
from ..models import *

from django.db.models import Sum

from ...Profile.api.serializers import ShortProfileSerializer


class GoalCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = GoalCategory
        fields = "__all__"


class CompetencyCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = CompetencyCategory
        fields = "__all__"


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


class GoalSerializer(serializers.ModelSerializer):
    class Meta:
        model = Goals
        fields = "__all__"


class DepartmentGoalSerializer(serializers.ModelSerializer):
    manager = serializers.PrimaryKeyRelatedField(read_only=True)
    department = serializers.PrimaryKeyRelatedField(
        read_only=True,
    )

    class Meta:
        model = DepartmentalGoals
        fields = "__all__"

        extra_kwargs = {
            "manager": {
                "read_only": True,
            },
            "department": {
                "read_only": True,
            },
        }


class DetailDepartmentGoalSerializer(serializers.ModelSerializer):
    class Meta:
        model = DepartmentalGoals
        fields = "__all__"
        extra_kwargs = {
            "manager": {
                "read_only": True,
            },
            "department": {
                "read_only": True,
            },
        }


class CompetenciesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Competencies
        fields = "__all__"


class DepartmentCompetenciesSerializer(serializers.ModelSerializer):
    manager = serializers.PrimaryKeyRelatedField(read_only=True)
    department = serializers.PrimaryKeyRelatedField(read_only=True)

    class Meta:
        model = DepartmentalCompetencies
        fields = "__all__"


class DetailDepartmentCompetenciesSerializer(serializers.ModelSerializer):
    manager = ShortProfileSerializer()
    competency_category = CompetencyCategorySerializer()

    class Meta:
        model = DepartmentalCompetencies
        fields = "__all__"


class KPISerializer(serializers.ModelSerializer):
    class Meta:
        model = KPI
        fields = "__all__"


class GoalCommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = GoalComment
        fields = "__all__"


class CompetencyCommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = CompetencyComment
        fields = "__all__"


class DetailCompetenciesSerializer(serializers.ModelSerializer):
    competencycomment_set = CompetencyCommentSerializer(many=True)

    class Meta:
        model = Competencies
        fields = "__all__"


class MidYrCommentBoxSerializer(serializers.ModelSerializer):
    class Meta:
        model = MidYrCommentBox
        fields = "__all__"


class EndYrCommentBoxSerializer(serializers.ModelSerializer):
    class Meta:
        model = EndYrCommentBox
        fields = "__all__"


class CommentBoxSerializer(serializers.ModelSerializer):
    class Meta:
        model = CommentBox
        fields = "__all__"


class DetailGoalSerializer(serializers.ModelSerializer):
    kpi_set = KPISerializer(many=True)
    goal_category = GoalCategorySerializer()

    class Meta:
        model = Goals
        fields = "__all__"
