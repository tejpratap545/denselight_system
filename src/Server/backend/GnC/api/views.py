from django.utils.decorators import method_decorator
from django.views.decorators.cache import cache_page
from rest_framework.decorators import api_view, permission_classes
from rest_framework.generics import get_object_or_404
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet

from ..models import *
from .serializers import *
from rest_framework import generics, status
from rest_framework.permissions import IsAuthenticated


class CreateGoalView(generics.CreateAPIView):
    # queryset = Goals.objects.all()
    serializer_class = CreateGoalSerializer

    def perform_create(self, serializer):
        if serializer.is_valid(raise_exception=True):
            validated_data = serializer.validated_data

            weightage_sum = Goals.objects.filter(
                appraisal=validated_data.get("appraisal")
            ).aggregate(Sum("weightage"))
            if weightage_sum["weightage__sum"] is None:

                appraisal = validated_data.get("appraisal")
                appraisal.status = "Employee"
                appraisal.save()
                serializer.save(employee=self.request.user.profile)
                return serializer.data
            elif (
                int(validated_data.get("weightage"))
                + int(weightage_sum["weightage__sum"])
                > 100
            ):
                raise ValueError("Total weightage should be less then 100")
            else:
                appraisal = validated_data.get("appraisal")
                appraisal.status = "Employee"
                appraisal.save()
                serializer.save(employee=self.request.user.profile)
                return serializer.data

        raise ValueError("error in serializer data")


class CreateCompetenciesView(generics.CreateAPIView):
    serializer_class = CreateCompetenciesSerializer

    def perform_create(self, serializer):

        if serializer.is_valid(raise_exception=True):
            validated_data = serializer.validated_data

            weightage_sum = Competencies.objects.filter(
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


class CreateKPI(generics.CreateAPIView):

    serializer_class = CreateKPISerializer
    queryset = KPI.objects.all()


class GoalApiView(generics.RetrieveUpdateDestroyAPIView):

    queryset = Goals.objects.all()

    def get_serializer_class(self):
        if self.request.method == "POST":
            return CreateGoalSerializer
        return GoalSerializer


class KPIApiView(generics.RetrieveUpdateDestroyAPIView):

    queryset = KPI.objects.all()

    def get_serializer_class(self):
        if self.request.method == "POST":
            return CreateKPISerializer
        return KPISerializer


class CompetenciesAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Competencies.objects.all()

    def get_serializer_class(self):
        if self.request.method == "POST":
            return CompetenciesSerializer
        return CreateCompetenciesSerializer


class GoalCategoryViewSet(ModelViewSet):
    serializer_class = GoalCategorySerializer
    queryset = GoalCategory.objects.all()

    @method_decorator(cache_page(60 * 2))
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)


class CompetencyCategoryViewSet(ModelViewSet):
    serializer_class = CompetencyCategorySerializer
    queryset = CompetencyCategory.objects.all()

    @method_decorator(cache_page(60 * 2))
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)


class GoalCommentViewSet(ModelViewSet):
    serializer_class = GoalCommentSerializer
    queryset = GoalComment.objects.all()

    @method_decorator(cache_page(60 * 2))
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)


class MidYrCommentBoxViewSet(ModelViewSet):
    serializer_class = MidYrCommentBoxSerializer
    queryset = MidYrCommentBox.objects.all()

    @method_decorator(cache_page(60 * 2))
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)


class EndYrCommentBoxViewSet(ModelViewSet):
    serializer_class = EndYrCommentBoxSerializer
    queryset = EndYrCommentBox.objects.all()

    @method_decorator(cache_page(60 * 2))
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)


class DepartmentalGoalsVieSet(ModelViewSet):
    serializer_class = DepartmentGoalSerializer()
    queryset = DepartmentalGoals.objects.all()

    def perform_create(self, serializer):
        serializer.save(
            manager=self.request.user.profile,
            department=self.request.user.profile.department,
        )


class DepartmentalCompetenciesVieSet(ModelViewSet):
    serializer_class = DepartmentCompetenciesSerializer()
    queryset = DepartmentalCompetencies.objects.all()

    def perform_create(self, serializer):
        serializer.save(
            manager=self.request.user.profile,
            department=self.request.user.profile.department,
        )


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def approved_goal(request, *args, **kwargs):

    goal = get_object_or_404(Goals, id=kwargs.get("pk"))
    if goal.appraisal.manager == request.user.profile:
        goal.status = "APPROVED"
        goal.save()
        return Response(
            {"msg": "Your goal is successfully approved"}, status=status.HTTP_200_OK
        )
    return Response(status=status.HTTP_401_UNAUTHORIZED)


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def reject_goal(request, *args, **kwargs):

    goal = get_object_or_404(Goals, id=kwargs.get("pk"))
    if goal.appraisal.manager == request.user.profile:
        goal.status = "REJECTED"
        goal.save()
        return Response(
            {"msg": "Your goal is successfully rejected"}, status=status.HTTP_200_OK
        )
    return Response(status=status.HTTP_401_UNAUTHORIZED)
