from backend.Trainings.api.serializers import (
    CreateSkillsSerializer,
    ShortSkillSerializer,
    SkillCategorySerializer,
    SkillsSerializer,
)
from backend.Trainings.models import SkillCategory, Skills
from django.db.models import Sum
from django.utils.decorators import method_decorator
from django.views.decorators.cache import cache_page
from rest_framework import generics, status
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet


class SkillsCategoryViewSet(ModelViewSet):
    serializer_class = SkillCategorySerializer
    queryset = SkillCategory.objects.all()


class SkillsApiView(generics.RetrieveUpdateDestroyAPIView):

    queryset = Skills.objects.all()

    def get_serializer_class(self):
        if self.request.method == "POST":
            return CreateSkillsSerializer
        return ShortSkillSerializer


class CreateSkillsApiView(generics.CreateAPIView):

    serializer_class = CreateSkillsSerializer

    def perform_create(self, serializer):

        if serializer.is_valid(raise_exception=True):
            validated_data = serializer.validated_data

            weightage_sum = Skills.objects.filter(
                appraisal=validated_data.get("appraisal")
            ).aggregate(Sum("weightage"))
            if weightage_sum["weightage__sum"] is None:

                serializer.save(employee=self.request.user.profile)
                return serializer.data

            elif (
                int(validated_data.get("weightage"))
                + int(weightage_sum["weightage__sum"])
                > 100
            ):
                raise ValueError("Total weightage should be less then 100")
            else:
                serializer.save(employee=self.request.user.profile)
                return serializer.data

        raise ValueError("error in serializer data")


class AdminCreateSkillsApiView(generics.CreateAPIView):

    serializer_class = CreateSkillsSerializer

    def perform_create(self, serializer):

        if serializer.is_valid(raise_exception=True):
            validated_data = serializer.validated_data

            weightage_sum = Skills.objects.filter(
                appraisal=validated_data.get("appraisal")
            ).aggregate(Sum("weightage"))
            if weightage_sum["weightage__sum"] is None:

                serializer.save(employee=validated_data.get("appraisal").employee)
                return serializer.data

            elif (
                int(validated_data.get("weightage"))
                + int(weightage_sum["weightage__sum"])
                > 100
            ):
                raise ValueError("Total weightage should be less then 100")
            else:
                serializer.save(employee=validated_data.get("appraisal").employee)
                return serializer.data

        raise ValueError("error in serializer data")
