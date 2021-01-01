from django.utils.decorators import method_decorator
from django.views.decorators.cache import cache_page
from django.views.decorators.vary import vary_on_cookie
from rest_framework.decorators import api_view
from rest_framework.generics import get_object_or_404
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet
from django.db.models import Window, Count
from ..models import *
from .serializers import *
from rest_framework import generics, status
from rest_framework.permissions import IsAuthenticated


class ManagerAppraisal(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = UserAppraisalListSerializer

    def get_queryset(self):
        # if self.request.user.role == "HRManager":
        #     return User_Appraisal_List.objects.prefetch_related(
        #         "overall_appraisal",
        #         "employee",
        #         "manager",
        #         "overall_appraisal__appraisal_category",
        #         "appraisal_category",
        #     ).annotate(
        #         goals_count=Count("goals"),
        #         core_values_competencies_count=Count("competencies"),
        #         skills_count=Count("skills"),
        #     )
        return (
            User_Appraisal_List.objects.prefetch_related(
                "overall_appraisal",
                "employee",
                "manager",
                "overall_appraisal__appraisal_category",
                "appraisal_category",
            )
            .filter(manager=self.request.user.profile)
            .annotate(
                goals_count=Count("goals"),
                core_values_competencies_count=Count("competencies"),
                skills_count=Count("skills"),
            )
        )

    @method_decorator(cache_page(60 * 2))
    @method_decorator(vary_on_cookie)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)


class UserAppraisal(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = UserAppraisalListSerializer

    def get_queryset(self):
        return (
            User_Appraisal_List.objects.prefetch_related(
                "overall_appraisal",
                "employee",
                "manager",
                "overall_appraisal__appraisal_category",
                "appraisal_category",
            )
            .filter(employee=self.request.user.profile)
            .annotate(
                goals_count=Count("goals"),
                core_values_competencies_count=Count("competencies"),
                skills_count=Count("skills"),
            )
        )

    @method_decorator(cache_page(60 * 2))
    @method_decorator(vary_on_cookie)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)


class DetailUserAppraisal(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = DetailAppraisalSerializer

    def get_queryset(self):
        return User_Appraisal_List.objects.prefetch_related(
            "manager",
            "employee",
            "manager__department",
            "employee__department",
            "overall_appraisal",
            "overall_appraisal__appraisal_category",
            "appraisal_category",
            "goals_set",
            "competencies_set",
            "goals_set__kpi_set",
            "goals_set__goalcomment_set",
            "goals_set__midyrcommentbox_set",
            "goals_set__commentbox_set",
            "goals_set__endyrcommentbox_set",
            "competencies_set__competencycomment_set",
            "skills_set",
            "skills_set__skill_category",
        ).filter(employee=self.request.user.profile)

    @method_decorator(cache_page(60 * 2))
    @method_decorator(vary_on_cookie)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)


class AppraisalCategoryViewSet(ModelViewSet):
    serializer_class = AppraisalCategorySerializer
    queryset = Appraisal_Category.objects.all()

    @method_decorator(cache_page(60 * 2))
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)


class OverallAppraisalViewSet(ModelViewSet):
    serializer_class = OverallAppraisalSerializer
    queryset = (
        Overall_Appraisal.objects.prefetch_related("appraisal_category")
        .all()
        .annotate(employee_count=Count("user_appraisal_list"))
    )

    @method_decorator(cache_page(60 * 3))
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)


class DetailAppraisal(generics.RetrieveAPIView):
    serializer_class = DetailAppraisalSerializer

    def get_object(self):
        queryset = User_Appraisal_List.objects.prefetch_related(
            "manager",
            "employee",
            "manager__department",
            "employee__department",
            "overall_appraisal",
            "overall_appraisal__appraisal_category",
            "appraisal_category",
            "goals_set",
            "competencies_set",
            "goals_set__kpi_set",
            "goals_set__goalcomment_set",
            "goals_set__midyrcommentbox_set",
            "goals_set__commentbox_set",
            "goals_set__endyrcommentbox_set",
            "competencies_set__competencycomment_set",
            "skills_set",
            "skills_set__skill_category",
        )
        return get_object_or_404(queryset, id=self.kwargs["pk"])

    @method_decorator(cache_page(60 * 3))
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)


@api_view(["POST"])
def submit_goals(request, *args, **kwargs):
    id = kwargs.get("pk")
    app = get_object_or_404(User_Appraisal_List, id=id)
    if app.overall_appraisal.status == "Stage 1":
        app.status = "Manager"
        app.save()
        return Response(
            {"msg": "Goal are successfully submitted to manager/supervisor"},
            status=status.HTTP_202_ACCEPTED,
        )
    return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
def approve_goal(request, *args, **kwargs):
    id = kwargs.get("pk")
    app = get_object_or_404(User_Appraisal_List, id=id)
    if app.overall_appraisal.status == "Stage 1":
        app.status = "S1BEmployee"
        app.save()
        return Response(
            {"msg": "Goal are successfully approves by manager/supervisor"},
            status=status.HTTP_202_ACCEPTED,
        )
    return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
def input_midyear_employee(request, *args, **kwargs):
    id = kwargs.get("pk")
    app = get_object_or_404(User_Appraisal_List, id=id)
    if app.overall_appraisal.status == "Stage 1B":
        app.status = "S1BManager"
        app.save()
        return Response(
            {"msg": "Goal are successfully approves by manager/supervisor"},
            status=status.HTTP_202_ACCEPTED,
        )
    return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
def submit_midyear_employee(request, *args, **kwargs):
    id = kwargs.get("pk")
    app = get_object_or_404(User_Appraisal_List, id=id)
    if app.overall_appraisal.status == "Stage 1B":
        app.status = "S1BReview"
        app.save()
        return Response(
            {"msg": "Goal are successfully approves by manager/supervisor"},
            status=status.HTTP_202_ACCEPTED,
        )
    return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
def input_midyear_manager(request, *args, **kwargs):
    id = kwargs.get("pk")
    app = get_object_or_404(User_Appraisal_List, id=id)
    if app.overall_appraisal.status == "Stage 1B":
        app.status = "S1BManager"
        app.save()
        return Response(
            {"msg": "Goal are successfully approves by manager/supervisor"},
            status=status.HTTP_202_ACCEPTED,
        )
    return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
def approve_endyear_manager(request, *args, **kwargs):
    id = kwargs.get("pk")
    app = get_object_or_404(User_Appraisal_List, id=id)
    if app.overall_appraisal.status == "Stage 1B":
        app.status = "S1BManager"
        app.mid_year_completion = "Completed"
        app.save()
        return Response(
            {"msg": "Goal are successfully approves by manager/supervisor"},
            status=status.HTTP_202_ACCEPTED,
        )
    return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
def input_endyear_employee(request, *args, **kwargs):
    id = kwargs.get("pk")
    app = get_object_or_404(User_Appraisal_List, id=id)
    if app.overall_appraisal.status == "Stage 2":
        app.status = "S2Employee"
        app.completion = "Ecompleted"
        app.save()
        return Response(
            {"msg": "Goal are successfully approves by manager/supervisor"},
            status=status.HTTP_202_ACCEPTED,
        )
    return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
def submit_endyear_employee(request, *args, **kwargs):
    id = kwargs.get("pk")
    app = get_object_or_404(User_Appraisal_List, id=id)
    if app.overall_appraisal.status == "Stage 2":
        app.status = "S2Manager"
        app.completion = "Ecompleted"
        app.save()
        return Response(
            {"msg": "Goal are successfully approves by manager/supervisor"},
            status=status.HTTP_202_ACCEPTED,
        )
    return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
def input_endyear_manager(request, *args, **kwargs):
    id = kwargs.get("pk")
    app = get_object_or_404(User_Appraisal_List, id=id)
    if app.overall_appraisal.status == "Stage 2":
        app.status = "S2Manager"
        app.completion = "MCompleted"
        app.save()
        return Response(
            {"msg": "Goal are successfully approves by manager/supervisor"},
            status=status.HTTP_202_ACCEPTED,
        )

    return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
def submit_endyear_manager(request, *args, **kwargs):
    id = kwargs.get("pk")
    app = get_object_or_404(User_Appraisal_List, id=id)
    if app.overall_appraisal.status == "Stage 2":
        app.status = "Approved"
        app.completion = "MCompleted"
        app.save()
        return Response(
            {"msg": "Goal are successfully approves by manager/supervisor"},
            status=status.HTTP_202_ACCEPTED,
        )

    return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)


class RejectGoals(generics.UpdateAPIView):
    serializer_class = GoalsSettingRejectionSerializer
    queryset = User_Appraisal_List.objects.all()
