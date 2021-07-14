from ...Profile.models import Notification
from ..models import *
from .serializers import *
from django.core.mail import send_mail
from django.utils.decorators import method_decorator
from django.views.decorators.cache import cache_page
from rest_framework import generics, status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.generics import get_object_or_404
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet


class CreateGoalView(generics.CreateAPIView):
    # queryset = Goals.objects.all()
    serializer_class = CreateGoalSerializer
    permission_classes = [IsAuthenticated]

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


class AdminCreateGoalView(generics.CreateAPIView):
    # queryset = Goals.objects.all()
    serializer_class = CreateGoalSerializer
    permission_classes = [IsAuthenticated]

    def perform_create(self, serializer):
        if serializer.is_valid(raise_exception=True):
            validated_data = serializer.validated_data

            weightage_sum = Goals.objects.filter(
                appraisal=validated_data.get("appraisal")
            ).aggregate(Sum("weightage"))
            if weightage_sum["weightage__sum"] is None:

                appraisal = validated_data.get("appraisal")
                serializer.save(employee=appraisal.employee)
                return serializer.data
            elif (
                int(validated_data.get("weightage"))
                + int(weightage_sum["weightage__sum"])
                > 100
            ):
                raise ValueError("Total weightage should be less then 100")
            else:
                appraisal = validated_data.get("appraisal")
                serializer.save(employee=appraisal.employee, status="APPROVED")
                return serializer.data

        raise ValueError("error in serializer data")


class CreateCompetenciesView(generics.CreateAPIView):
    serializer_class = CreateCompetenciesSerializer
    permission_classes = [IsAuthenticated]

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


class AdminCreateCompetenciesView(generics.CreateAPIView):
    serializer_class = CreateCompetenciesSerializer
    permission_classes = [IsAuthenticated]

    def perform_create(self, serializer):

        if serializer.is_valid(raise_exception=True):
            validated_data = serializer.validated_data

            weightage_sum = Competencies.objects.filter(
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


class CreateKPI(generics.CreateAPIView):
    permission_classes = [IsAuthenticated]

    serializer_class = CreateKPISerializer
    queryset = KPI.objects.all()


class GoalApiView(generics.RetrieveUpdateDestroyAPIView):

    queryset = Goals.objects.all()
    permission_classes = [IsAuthenticated]

    def get_serializer_class(self):
        if self.request.method == "POST":
            return CreateGoalSerializer
        return GoalSerializer

    def perform_update(self, serializer, *args, **kwargs):

        if serializer.is_valid(raise_exception=True):
            validated_data = serializer.validated_data
            if validated_data.get("weightage"):
                weightage_sum = self.get_object().appraisal.goals_set.aggregate(
                    Sum("weightage")
                )
                if weightage_sum["weightage__sum"] is None:

                    return super().perform_update(serializer)
                elif (
                    int(validated_data.get("weightage"))
                    + int(weightage_sum["weightage__sum"])
                    - self.get_object().weightage
                    > 100
                ):
                    raise ValueError("Total weightage should be less then 100")
                else:
                    super().perform_update(serializer)
          
            return super().perform_update(serializer)

        raise ValueError("error in serializer data")


class KPIApiView(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    queryset = KPI.objects.all()

    def get_serializer_class(self):
        if self.request.method == "POST":
            return CreateKPISerializer
        return KPISerializer


class GetCascadedgoals(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = DetailCascadedGoalsSerializer

    def get_queryset(self):
        return CascadedGoals.objects.filter(manager=self.request.user.profile)


class CompetenciesAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Competencies.objects.all()
    permission_classes = [IsAuthenticated]

    def get_serializer_class(self):
        if self.request.method == "POST":
            return CreateCompetenciesSerializer
        return CompetenciesSerializer

    def perform_update(self, serializer):
        if serializer.is_valid(raise_exception=True):
            validated_data = serializer.validated_data
            if validated_data.get("weightage"):

                weightage_sum = self.get_object().appraisal.competencies_set.aggregate(
                    Sum("weightage")
                )
                if weightage_sum["weightage__sum"] is None:

                    return super().perform_update(serializer)

                elif (
                    int(validated_data.get("weightage"))
                    + int(weightage_sum["weightage__sum"])
                    - self.get_object().weightage
                    > 100
                ):
                    raise ValueError("Total weightage should be less then 100")
                else:
                    return super().perform_update(serializer)
            return super().perform_update(serializer)

        raise ValueError("error in serializer data")


class GoalCategoryViewSet(ModelViewSet):
    serializer_class = GoalCategorySerializer
    queryset = GoalCategory.objects.all()
    permission_classes = [IsAuthenticated]


class CascadedGoalsViewSet(ModelViewSet):

    queryset = CascadedGoals.objects.all()
    permission_classes = [IsAuthenticated]

    def get_serializer_class(self):
        if self.request.method == "GET":
            return DetailCascadedGoalsSerializer
        return CascadedGoalsSerializer


@api_view(["POST"])
def create_cascadedgoals(request):
    return "hello"


class CompetencyCategoryViewSet(ModelViewSet):
    serializer_class = CompetencyCategorySerializer
    queryset = CompetencyCategory.objects.all()
    permission_classes = [IsAuthenticated]


class GoalCommentViewSet(ModelViewSet):
    serializer_class = GoalCommentSerializer
    queryset = GoalComment.objects.all()
    permission_classes = [IsAuthenticated]


class MidYrCommentBoxViewSet(ModelViewSet):
    serializer_class = MidYrCommentBoxSerializer
    queryset = MidYrCommentBox.objects.all()
    permission_classes = [IsAuthenticated]


class EndYrCommentBoxViewSet(ModelViewSet):
    serializer_class = EndYrCommentBoxSerializer
    queryset = EndYrCommentBox.objects.all()
    permission_classes = [IsAuthenticated]


class DepartmentalGoalsVieSet(ModelViewSet):
    serializer_class = DepartmentGoalSerializer
    queryset = DepartmentalGoals.objects.all()
    permission_classes = [IsAuthenticated]

    def perform_create(self, serializer):
        serializer.save(
            manager=self.request.user.profile,
            department=self.request.user.profile.department,
        )
        return serializer.data


class DepartmentalCompetenciesVieSet(ModelViewSet):
    serializer_class = DepartmentCompetenciesSerializer()
    queryset = DepartmentalCompetencies.objects.all()
    permission_classes = [IsAuthenticated]

    def perform_create(self, serializer):
        serializer.save(
            manager=self.request.user.profile,
            department=self.request.user.profile.department,
        )


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def approved_goal(request, *args, **kwargs):

    goal = get_object_or_404(Goals, id=kwargs.get("pk"))
    app = goal.appraisal
    if goal.appraisal.manager == request.user.profile:
        if goal.kpi_set.count() != 0:
            goal.status = "APPROVED"

            goal.save()
            title = f"{app.manager.name} approve goal  of  {app.appraisal_name}"
            description = f"Hi {app.employee.name} Manager {app.manager.name} approve goal  {goal.summary}  of{app.appraisal_name} . "
            Notification.objects.create(
                user=app.employee, title=title, description=description, color="success"
            )

            return Response(
                {"msg": "Your goal is successfully approved"}, status=status.HTTP_200_OK
            )
        return Response(status=status.HTTP_400_BAD_REQUEST)

    return Response(status=status.HTTP_401_UNAUTHORIZED)


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def reject_goal(request, *args, **kwargs):

    goal = get_object_or_404(Goals, id=kwargs.get("pk"))
    app = goal.appraisal
    if goal.appraisal.manager == request.user.profile:
        goal.status = "REJECTED"
        goal.save()
        title = f"{app.manager.name} reject goal  of  {app.appraisal_name}"
        description = f"Hi {app.employee.name} Manager {app.manager.name} reject goal  {goal.summary}  of{app.appraisal_name} . "
        Notification.objects.create(
            user=app.employee, title=title, description=description, color="success"
        )
        try:
            send_mail(title, description, settings.OFFICIAL_MAIL, [app.employee.email])
        except:
            pass

        return Response(
            {"msg": "Your goal is successfully rejected"}, status=status.HTTP_200_OK
        )
    return Response(status=status.HTTP_401_UNAUTHORIZED)
