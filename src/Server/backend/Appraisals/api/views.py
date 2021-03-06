from ...Profile.models import Notification
from ..models import *
from .pagination import StandardResultsSetPagination
from .serializers import *
from backend.GnC.models import (
    CascadedGoals,
    DepartmentalCompetencies,
    DepartmentalGoals,
    Goals,
)
from backend.Profile.permissions import IsHr, IsHrManager
from django.conf import settings
from django.core.mail import send_mail
from django.db.models import Count, Prefetch, Q, Sum, Window
from django.utils.decorators import method_decorator
from django.views.decorators.cache import cache_page
from django.views.decorators.vary import vary_on_cookie
from rest_framework import generics, status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.generics import get_object_or_404
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet


class ManagerAppraisal(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = UserAppraisalListSerializer

    def get_queryset(self):

        return (
            User_Appraisal_List.objects.prefetch_related(
                "overall_appraisal",
                "employee",
                "employee__department",
                "manager__department",
                "manager",
                "overall_appraisal__appraisal_category",
                "appraisal_category",
            )
            .filter(
                manager=self.request.user.profile,
                is_closed=False,
            )
            .exclude(overall_appraisal__status="Completed")
            .order_by()
            .annotate(
                goals_count=Count("goals", distinct=True),
                core_values_competencies_count=Count("competencies", distinct=True),
                skills_count=Count("skills", distinct=True),
            )
        )


class AllAppraisalView(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = UserAppraisalListSerializer
    pagination_class = StandardResultsSetPagination
    filterset_fields = ["overall_appraisal__status"]

    def get_queryset(self):

        return (
            User_Appraisal_List.objects.prefetch_related(
                "overall_appraisal",
                "employee",
                "employee__department",
                "manager",
                "manager__department",
                "overall_appraisal__appraisal_category",
                "appraisal_category",
            )
            .order_by()
            .annotate(
                goals_count=Count("goals", distinct=True),
                core_values_competencies_count=Count("competencies", distinct=True),
                skills_count=Count("skills", distinct=True),
            )
        )


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def filter_appraisal(request):

    appraisal = request.data.get("appraisal", "")
    employee_list = request.data.get("employee_list", [])
    manager_list = request.data.get("manager_list", [])
    department_list = request.data.get("department_list", [])
    if appraisal is 0 or appraisal is None:
        data = (
            User_Appraisal_List.objects.prefetch_related(
                "overall_appraisal",
                "employee",
                "employee__department",
                "manager",
                "manager__department",
                "overall_appraisal__appraisal_category",
                "appraisal_category",
            )
            .filter(
                Q(employee__in=employee_list)
                | Q(manager__in=manager_list)
                | Q(employee__department__in=department_list),
            )
            .exclude(overall_appraisal__status="Completed")
        )

    else:
        data = (
            User_Appraisal_List.objects.prefetch_related(
                "overall_appraisal",
                "employee",
                "employee__department",
                "manager",
                "manager__department",
                "overall_appraisal__appraisal_category",
                "appraisal_category",
            )
            .filter(overall_appraisal=appraisal)
            .exclude(overall_appraisal__status="Completed")
        )
        if employee_list is not []:
            data.filter(employee__in=employee_list)
        if manager_list is not []:
            data.filter(manager__in=manager_list)
        if department_list is not []:
            data.filter(employee__department__in=department_list)

    serializer = UserAppraisalListSerializer(data, many=True)
    return Response(serializer.data)


class ClosedAllAppraisalView(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = UserAppraisalListSerializer

    def get_queryset(self):

        return (
            User_Appraisal_List.objects.prefetch_related(
                "overall_appraisal",
                "employee",
                "employee__department",
                "manager",
                "manager__department",
                "overall_appraisal__appraisal_category",
                "appraisal_category",
            )
            .order_by()
            .annotate(
                goals_count=Count("goals", distinct=True),
                core_values_competencies_count=Count("competencies", distinct=True),
                skills_count=Count("skills", distinct=True),
            )
            .filter(is_closed=True)
        )


class AppraisalViewSet(ModelViewSet):
    serializer_class = UserAppraisalSerializer
    permission_classes = [IsAuthenticated]
    queryset = User_Appraisal_List.objects.all()


class OverallAppraisal(generics.ListAPIView):
    permission_classes = [IsAuthenticated]

    def get_queryset(self):

        queryset = Overall_Appraisal.objects.prefetch_related(
            "appraisal_category",
            "departmentalgoals_set",
            "departmentalgoals_set__goal_category",
            "departmentalgoals_set__manager",
            "departmentalgoals_set__manager__department",
            "departmentalcompetencies_set",
            "departmentalcompetencies_set__competency_category",
            Prefetch(
                "cascadedgoals_set",
                queryset=CascadedGoals.objects.filter(
                    manager=self.request.user.profile
                ),
            ),
            "cascadedgoals_set__goal_category",
            "cascadedgoals_set__manager",
            "cascadedgoals_set__emaployees",
            "cascadedgoals_set__emaployees__department",
            "cascadedgoals_set__manager__department",
        ).filter(Q(status="Stage 1") | Q(status="Stage 2"))
        return queryset

    serializer_class = DetailOverallAppraisalSerializer


class UserAppraisal(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = UserAppraisalListSerializer

    def get_queryset(self):
        return (
            User_Appraisal_List.objects.prefetch_related(
                "overall_appraisal",
                "employee",
                "manager",
                "manager__department",
                "employee__department",
                "overall_appraisal__appraisal_category",
                "appraisal_category",
            )
            .filter(employee=self.request.user.profile, is_closed=False)
            .exclude(overall_appraisal__status="Completed")
            .order_by()
            .annotate(
                goals_count=Count("goals", distinct=True),
                core_values_competencies_count=Count("competencies", distinct=True),
                skills_count=Count("skills", distinct=True),
            )
        )


class CompletedUserAppraisal(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = UserAppraisalListSerializer

    def get_queryset(self):
        return (
            User_Appraisal_List.objects.prefetch_related(
                "overall_appraisal",
                "employee",
                "manager",
                "manager__department",
                "employee__department",
                "overall_appraisal__appraisal_category",
                "appraisal_category",
            )
            .filter(
                employee=self.request.user.profile,
                is_closed=False,
                overall_appraisal__status="Completed",
            )
            .order_by()
            .annotate(
                goals_count=Count("goals", distinct=True),
                core_values_competencies_count=Count("competencies", distinct=True),
                skills_count=Count("skills", distinct=True),
            )
        )


class DetailUserAppraisal(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = DetailAppraisalSerializer

    def get_queryset(self):
        return (
            User_Appraisal_List.objects.prefetch_related(
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
                "competencies_set__competencycomment_set",
                "skills_set",
                "skills_set__skill_category",
                "goals_set__goal_category",
                "competencies_set__competency_category",
                Prefetch(
                    "overall_appraisal__departmentalgoals_set",
                    queryset=DepartmentalGoals.objects.filter(
                        department=self.request.user.profile.department
                    ),
                ),
                Prefetch(
                    "overall_appraisal__cascadedgoals_set",
                    queryset=CascadedGoals.objects.filter(
                        emaployees__id=self.request.user.profile.id
                    ),
                ),
                "overall_appraisal__cascadedgoals_set__goal_category",
                "overall_appraisal__cascadedgoals_set__manager",
                "overall_appraisal__cascadedgoals_set__emaployees",
                "overall_appraisal__cascadedgoals_set__emaployees__department",
                "overall_appraisal__cascadedgoals_set__manager__department",
                "overall_appraisal__departmentalcompetencies_set",
                "overall_appraisal__departmentalcompetencies_set__competency_category",
            )
            .filter(employee=self.request.user.profile, is_closed=False)
            .exclude(overall_appraisal__status="Completed")
        )


class AppraisalCategoryViewSet(ModelViewSet):
    serializer_class = AppraisalCategorySerializer
    permission_classes = [IsAuthenticated]
    queryset = Appraisal_Category.objects.all()


class OverallAppraisalViewSet(ModelViewSet):
    serializer_class = OverallAppraisalSerializer
    permission_classes = [IsAuthenticated]
    queryset = (
        Overall_Appraisal.objects.prefetch_related("appraisal_category")
        .all()
        .annotate(employee_count=Count("user_appraisal_list"))
    )


class DetailAppraisal(generics.RetrieveAPIView):
    serializer_class = DetailAppraisalSerializer
    permission_classes = [IsAuthenticated]

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
            "competencies_set__competencycomment_set",
            "skills_set",
            "skills_set__skill_category",
            "goals_set__goal_category",
            Prefetch(
                "overall_appraisal__departmentalgoals_set",
                queryset=DepartmentalGoals.objects.filter(
                    department=self.request.user.profile.department
                ),
            ),
            "overall_appraisal__departmentalcompetencies_set",
            "overall_appraisal__departmentalcompetencies_set__competency_category",
        )
        return get_object_or_404(queryset, id=self.kwargs["pk"])


class DetailOverAllAppraisal(generics.ListAPIView):
    serializer_class = DetailAppraisalSerializer
    permission_classes = [IsAuthenticated]

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
            "competencies_set__competencycomment_set",
            "skills_set",
            "skills_set__skill_category",
            "goals_set__goal_category",
            Prefetch(
                "overall_appraisal__departmentalgoals_set",
                queryset=DepartmentalGoals.objects.filter(
                    department=self.request.user.profile.department
                ),
            ),
            "overall_appraisal__departmentalcompetencies_set",
            "overall_appraisal__departmentalcompetencies_set__competency_category",
        ).filter(overall_appraisal=self.kwargs["pk"])


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def submit_goals(request, *args, **kwargs):
    id = kwargs.get("pk")
    app = get_object_or_404(User_Appraisal_List, id=id)
    if (
        app.overall_appraisal.status == "Stage 1"
        and app.employee == request.user.profile
    ) and (app.status == "Employee"):

        weightage_sum = Goals.objects.filter(appraisal=app).aggregate(Sum("weightage"))
        if weightage_sum["weightage__sum"] == 100:
            app.status = "Manager"
            app.save()
            title = f"{app.employee.name} submit goals of {app.appraisal_name}"
            description = (
                f"Hi {app.manager.name} Employee {app.employee.name} submit goals of {app.appraisal_name} . "
                f"Please approve all goals and then approve appraisal "
            )
            Notification.objects.create(
                user=app.manager, title=title, description=description, color="info"
            )
            try:
                send_mail(
                    title, description, settings.OFFICIAL_MAIL, [app.manager.email]
                )
            except:
                pass
            return Response(
                {"msg": "Goal are successfully submitted to manager/supervisor"},
                status=status.HTTP_202_ACCEPTED,
            )
    return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def approve_goal(request, *args, **kwargs):
    id = kwargs.get("pk")
    app = get_object_or_404(User_Appraisal_List, id=id)
    if (
        app.overall_appraisal.status == "Stage 1"
        and app.manager == request.user.profile
    ) and app.status == "Manager":
        if app.goals_set.filter(status="APPROVED").count() == app.goals_set.count():
            weightage_sum = Goals.objects.filter(appraisal=app).aggregate(
                Sum("weightage")
            )
            if weightage_sum["weightage__sum"] == 100:
                app.status = "S1BEmployee"
                app.save()
                title = f"{app.manager.name} approve goals of {app.appraisal_name}"
                description = f"Hi {app.employee.name} Manager {app.manager.name} approve goals of {app.appraisal_name} . "
                Notification.objects.create(
                    user=app.employee,
                    title=title,
                    description=description,
                    color="success",
                )
                try:
                    send_mail(
                        title, description, settings.OFFICIAL_MAIL, [app.employee.email]
                    )
                except:
                    pass
                return Response(
                    {"msg": "Goal are successfully approves by manager/supervisor"},
                    status=status.HTTP_202_ACCEPTED,
                )
        return Response(
            {"msg": "Approved all goals then approves appraisal"},
            status=status.HTTP_400_BAD_REQUEST,
        )

    return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def input_midyear_employee(request, *args, **kwargs):
    id = kwargs.get("pk")
    app = get_object_or_404(User_Appraisal_List, id=id)
    if (
        app.overall_appraisal.status == "Stage 1B"
        and app.employee == request.user.profile
    ) and (app.status == "S1BEmployee" or app.status == "S2BEmployee"):
        app.status = "S2BEmployee"
        app.save()
        return Response(
            {"msg": "Goal are successfully approves by manager/supervisor"},
            status=status.HTTP_202_ACCEPTED,
        )
    return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def submit_midyear_employee(request, *args, **kwargs):
    id = kwargs.get("pk")
    app = get_object_or_404(User_Appraisal_List, id=id)
    if (
        app.overall_appraisal.status == "Stage 1B"
        and app.employee == request.user.profile
    ) and app.status == "S2BEmployee":
        app.status = "S1BReview"
        app.save()
        title = f"{app.employee.name} submit mid year review of {app.appraisal_name}"
        description = (
            f"Hi {app.manager.name} Employee {app.employee.name} submit mid year review of {app.appraisal_name} . "
            f"Please approve or reject mid year review . "
        )
        Notification.objects.create(
            user=app.manager, title=title, description=description, color="info"
        )
        try:
            send_mail(title, description, settings.OFFICIAL_MAIL, [app.manager.email])
        except:
            pass
        return Response(
            {"msg": "Goal are successfully approves by manager/supervisor"},
            status=status.HTTP_202_ACCEPTED,
        )
    return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def input_midyear_manager(request, *args, **kwargs):
    id = kwargs.get("pk")
    app = get_object_or_404(User_Appraisal_List, id=id)
    if (
        app.overall_appraisal.status == "Stage 1B"
        and app.manager == request.user.profile
    ) and (app.status == "S1BReview" or app.status == "S1BManager"):
        app.status = "S1BManager"
        app.save()
        return Response(
            {"msg": "Goal are successfully approves by manager/supervisor"},
            status=status.HTTP_202_ACCEPTED,
        )
    return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def approve_midyear_manager(request, *args, **kwargs):
    id = kwargs.get("pk")
    app = get_object_or_404(User_Appraisal_List, id=id)
    if (
        app.overall_appraisal.status == "Stage 1B"
        and app.manager == request.user.profile
    ) and app.status == "S1BManager":
        app.status = "S1BManager"
        app.mid_year_completion = "Completed"
        app.save()
        title = f"{app.manager.name} approve midyear review of {app.appraisal_name}"
        description = f"Hi {app.employee.name} Manager {app.manager.name} approve midyear review of{app.appraisal_name} . "
        Notification.objects.create(
            user=app.employee, title=title, description=description, color="success"
        )
        try:
            send_mail(title, description, settings.OFFICIAL_MAIL, [app.employee.email])
        except:
            pass
        return Response(
            {"msg": "Goal are successfully approves by manager/supervisor"},
            status=status.HTTP_202_ACCEPTED,
        )
    return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def input_endyear_employee(request, *args, **kwargs):
    id = kwargs.get("pk")
    app = get_object_or_404(User_Appraisal_List, id=id)
    if (
        app.overall_appraisal.status == "Stage 2"
        and app.employee == request.user.profile
    ) and (
        (app.status == "S1BManager" or app.status == "S2Employee")
        and app.mid_year_completion == "Completed"
    ):
        app.status = "S2Employee"
        app.completion = "Ecompleted"
        app.save()
        return Response(
            {"msg": "Goal are successfully approves by manager/supervisor"},
            status=status.HTTP_202_ACCEPTED,
        )
    return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def submit_endyear_employee(request, *args, **kwargs):
    id = kwargs.get("pk")
    app = get_object_or_404(User_Appraisal_List, id=id)
    if (
        app.overall_appraisal.status == "Stage 2"
        and app.employee == request.user.profile
    ) and (app.status == "S2Employee" and app.completion == "Ecompleted"):
        app.status = "S2Manager"
        app.completion = "Ecompleted"

        app.save()
        title = f"{app.employee.name} submit end year review of {app.appraisal_name}"
        description = (
            f"Hi {app.manager.name} Employee {app.employee.name} submit end year review of {app.appraisal_name} . "
            f"Please approve or reject end year review . "
        )
        Notification.objects.create(
            user=app.manager, title=title, description=description, color="info"
        )
        try:
            send_mail(title, description, settings.OFFICIAL_MAIL, [app.manager.email])
        except:
            pass
        return Response(
            {"msg": "Goal are successfully approves by manager/supervisor"},
            status=status.HTTP_202_ACCEPTED,
        )
    return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def input_endyear_manager(request, *args, **kwargs):
    id = kwargs.get("pk")
    app = get_object_or_404(User_Appraisal_List, id=id)
    if (
        app.overall_appraisal.status == "Stage 2"
        and app.manager == request.user.profile
    ) and (
        app.status == "S2Manager"
        and (app.completion == "Ecompleted" or app.completion == "MCompleted")
    ):
        app.status = "S2Manager"
        app.completion = "MCompleted"
        app.save()
        return Response(
            {"msg": "Goal are successfully approves by manager/supervisor"},
            status=status.HTTP_202_ACCEPTED,
        )

    return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def approve_endyear_manager(request, *args, **kwargs):
    id = kwargs.get("pk")
    app = get_object_or_404(User_Appraisal_List, id=id)
    if (
        app.overall_appraisal.status == "Stage 2"
        and app.manager == request.user.profile
    ) and (app.status == "S2Manager" and app.completion == "MCompleted"):
        app.status = "Approved"
        app.completion = "MCompleted"
        app.save()
        title = f"{app.manager.name} approve endyear review of {app.appraisal_name}"
        description = f"Hi {app.employee.name} Manager {app.manager.name} approve endyear review of{app.appraisal_name} . "
        Notification.objects.create(
            user=app.employee, title=title, description=description, color="success"
        )
        try:
            send_mail(title, description, settings.OFFICIAL_MAIL, [app.employee.email])
        except:
            pass
        return Response(
            {"msg": "Goal are successfully approves by manager/supervisor"},
            status=status.HTTP_202_ACCEPTED,
        )

    return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def submit_endyear_board(request, *args, **kwargs):
    id = kwargs.get("pk")
    app = get_object_or_404(User_Appraisal_List, id=id)
    if (
        app.overall_appraisal.status == "Stage 2"
        and (
            app.employee.second_Reporting_Manager == request.user.profile
            or request.user.profile.role == "Admin"
        )
    ) and (app.status == "Approved" and app.completion == "MCompleted"):
        app.status = "Approved"
        app.completion = "BCompleted"
        app.save()
        title = f"{request.user.profile.name} approve endyear Moderation commitee rating(final) review of {app.appraisal_name}"
        description = f"Hi {app.employee.name} HOD {request.user.profile.name} approve endyear  Moderation commitee rating(final) review of{app.appraisal_name} . "
        Notification.objects.create(
            user=app.employee, title=title, description=description, color="success"
        )
        try:
            send_mail(title, description, settings.OFFICIAL_MAIL, [app.employee.email])
        except:
            pass
        return Response(
            {"msg": "Goal are successfully approves by manager/supervisor"},
            status=status.HTTP_202_ACCEPTED,
        )

    return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)


class RejectGoals(generics.UpdateAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = GoalsSettingRejectionSerializer
    queryset = User_Appraisal_List.objects.all()


class MidYearRejection(generics.UpdateAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = MidYearRejectionSerializer
    queryset = User_Appraisal_List.objects.all()


class EndYearRejection(generics.UpdateAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = EndRejectionSerializer
    queryset = User_Appraisal_List.objects.all()


class CreatePeerAppraisal(generics.CreateAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = CreatePeerAppraisalSerializer

    def post(self, request, *args, **kwargs):
        serializer = CreatePeerAppraisalSerializer(data=request.data)
        if serializer.is_valid():
            validated_data = serializer.validated_data
            employee = validated_data.get("employee_list")
            for profile in Profile.objects.filter(id__in=employee):
                peerAppraisal.objects.create(
                    appraisal=validated_data.get("appraisal"),
                    manager=request.user.profile,
                    viewer=profile,
                    title1=validated_data.get("title1"),
                    title2=validated_data.get("title2"),
                    title3=validated_data.get("title3"),
                    created_by=request.user.profile,
                )
                title = "invitation for peerAppraisal"
                description = f"Hi {profile.name} {self.request.user.profile.name} invited you  for peer appraisal review  . "
                Notification.objects.create(
                    user=profile,
                    title=title,
                    description=description,
                    color="info",
                )
                try:
                    send_mail(
                        title, description, settings.OFFICIAL_MAIL, [profile.email]
                    )
                except:
                    pass

            return Response(employee, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class EmployeePeerAppraisal(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = ShortPeerSerializer

    def get_queryset(self):
        return peerAppraisal.objects.filter(viewer=self.request.user.profile)


class ManagerPeerAppraisal(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = ShortPeerSerializer

    def get_queryset(self):
        return peerAppraisal.objects.filter(created_by=self.request.user.profile)


class ShortManagerAppraisal(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = ShortAppraisal2HodSerializer

    def get_queryset(self):
        return Profile.objects.prefetch_related(
            Prefetch(
                "user_appraisal_list_set",
                queryset=User_Appraisal_List.objects.exclude(
                    overall_appraisal__status="Completed"
                ).prefetch_related("overall_appraisal"),
            ),
        ).filter(first_Reporting_Manager=self.request.user.profile)


class ShortHodAppraisal(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = ShortAppraisal2HodSerializer

    def get_queryset(self):
        return Profile.objects.prefetch_related(
            Prefetch(
                "user_appraisal_list_set",
                queryset=User_Appraisal_List.objects.exclude(
                    overall_appraisal__status="Completed"
                ).prefetch_related("overall_appraisal"),
            ),
        ).filter(second_Reporting_Manager=self.request.user.profile)


class CompletedShortManagerAppraisal(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = ShortAppraisal2HodSerializer

    def get_queryset(self):
        return Profile.objects.prefetch_related(
            Prefetch(
                "user_appraisal_list_set",
                queryset=User_Appraisal_List.objects.filter(
                    overall_appraisal__status="Completed"
                ).prefetch_related("overall_appraisal"),
            ),
        ).filter(first_Reporting_Manager=self.request.user.profile)


class CompletedShortHodAppraisal(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = ShortAppraisal2HodSerializer

    def get_queryset(self):
        return Profile.objects.prefetch_related(
            Prefetch(
                "user_appraisal_list_set",
                queryset=User_Appraisal_List.objects.filter(
                    overall_appraisal__status="Completed"
                ).prefetch_related("overall_appraisal"),
            ),
        ).filter(second_Reporting_Manager=self.request.user.profile)


class PeerAppraisal(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = PeerAppraisalSerializer
    queryset = peerAppraisal.objects.all()
