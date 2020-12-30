from django.utils.decorators import method_decorator
from django.views.decorators.cache import cache_page
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet

from ..models import *
from .serializers import *
from rest_framework import generics, status
from rest_framework.permissions import IsAuthenticated


class CreateGoalView(generics.CreateAPIView):
    # queryset = Goals.objects.all()
    serializer_class = CreateGoalSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid(raise_exception=True):
            validated_data = serializer.data

            weightage_sum = Goals.objects.filter(
                appraisal=validated_data.get("appraisal")
            ).aggregate(Sum("weightage"))
            if (
                int(validated_data.get("weightage"))
                + int(weightage_sum["weightage__sum"])
                > 100
            ):
                return Response(
                    {"msg": "Total weightage should be less then 100"},
                    status=status.HTTP_406_NOT_ACCEPTABLE,
                )
            else:
                appraisal = validated_data.get("appraisal")
                appraisal.status = "Employee"
                appraisal.save()
                serializer.save(employee=request.user.profile)
                return Response(serializer.data, status=status.HTTP_201_CREATED)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class CreateCompetenciesView(generics.CreateAPIView):
    serializer_class = CreateCompetenciesSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid(raise_exception=True):
            serializer.save(employee=request.user.profile)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


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
    serializer_class = CommentBoxSerializer
    queryset = CommentBox.objects.all()

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
