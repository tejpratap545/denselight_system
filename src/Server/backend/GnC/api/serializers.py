from rest_framework import serializers
from ..models import *

from django.db.models import Sum


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


class CompetenciesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Competencies
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
    goalcomment_set = GoalCommentSerializer(many=True)
    commentbox_set = CommentBoxSerializer(many=True)
    midyrcommentbox_set = MidYrCommentBoxSerializer(many=True)
    endyrcommentbox_set = EndYrCommentBoxSerializer(many=True)

    class Meta:
        model = Goals
        fields = "__all__"
