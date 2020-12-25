from rest_framework import serializers
from ..models import *


class SkillCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = SkillCategory
        fields = "__all__"


class SkillsSerializer(serializers.ModelSerializer):
    skill_category = SkillCategorySerializer()

    class Meta:
        model = Skills
        fields = "__all__"


class CreateSkillsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Skills
        fields = (
            "skill_category",
            "weightage",
            "description",
            "appraisal",
        )
