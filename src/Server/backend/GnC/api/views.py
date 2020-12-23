from rest_framework.response import Response

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

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid(raise_exception=True):
            serializer.save(employee=request.user.profile)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class GoalApiView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = CreateGoalSerializer
    queryset = Goals.objects.all()


class KPIApiView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = CreateKPISerializer
    queryset = KPI.objects.all()


class CompetenciesAPIView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = CreateCompetenciesSerializer
    queryset = Competencies.objects.all()
