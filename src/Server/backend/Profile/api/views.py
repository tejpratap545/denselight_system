from ...Appraisals.models import peerAppraisal, User_Appraisal_List
from ..permissions import IsOwner
from .serializers import *
from backend.Profile.models import ResetPasswordToken
from backend.Profile.permissions import IsHrManager
from django.core.cache import cache
from django.db.models import Count, Q
from django.http import HttpResponse
from rest_framework import generics, status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.generics import get_object_or_404
from rest_framework.pagination import PageNumberPagination
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet

import json


class ProfileInfoView(generics.RetrieveAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = ProfileInfoSerializer

    def get_object(self):
        return self.request.user.profile


class DepartmentViewSet(ModelViewSet):
    permission_classes = [IsAuthenticated]
    serializer_class = DepartmentSerializer
    queryset = Departments.objects.all()


class ListEmployees(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = EmployeeSerializer
    queryset = (
        Profile.objects.prefetch_related(
            "first_Reporting_Manager",
            "department",
            "first_Reporting_Manager__department",
            "second_Reporting_Manager",
            "second_Reporting_Manager__department",
        )
        .only(
            "id",
            "name",
            "email",
            "typeOfEmployee",
            "second_Reporting_Manager",
            "first_Reporting_Manager",
            "gender",
            "department",
            "job_Title",
            "date_Of_Hire",
            "resign_date",
        )
        .filter(user__is_active=True)
    )


class ReginListEmployees(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = EmployeeSerializer
    queryset = (
        Profile.objects.prefetch_related(
            "first_Reporting_Manager",
            "department",
            "first_Reporting_Manager__department",
            "second_Reporting_Manager",
            "second_Reporting_Manager__department",
        )
        .only(
            "id",
            "name",
            "email",
            "typeOfEmployee",
            "second_Reporting_Manager",
            "first_Reporting_Manager",
            "gender",
            "department",
            "job_Title",
            "date_Of_Hire",
            "resign_date",
        )
        .filter(user__is_active=False)
    )


class ShortListEmployees(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = ShortEmployeeSerializer
    queryset = Profile.objects.only(
        "id",
        "name",
        "email",
    ).filter(user__is_active=True)


class CreateProfile(generics.CreateAPIView):
    permission_classes = [IsHrManager]
    serializer_class = ProfileCreateSerializer
    queryset = Profile.objects.all()


class ProfileView(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsHrManager]

    queryset = Profile.objects.prefetch_related(
        "user",
        "department",
        "first_Reporting_Manager",
        "second_Reporting_Manager",
        "first_Reporting_Manager__department",
        "second_Reporting_Manager__department",
    )

    def get_serializer_class(self):
        if self.request.method == "GET":
            return ProfileInfoSerializer
        return ProfileSerializer


class ChangePassword(generics.CreateAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = ChangePasswordSerializer


class SetPassword(generics.CreateAPIView):
    permission_classes = [IsHrManager]
    serializer_class = SetPasswordSerializer


class NotificationViewSet(ModelViewSet):
    permission_classes = [IsAuthenticated]
    serializer_class = NotificationSerializer
    pagination_class = PageNumberPagination

    def get_queryset(self):
        return (
            Notification.objects.filter(user=self.request.user.profile)
            .order_by("-created_at")
            .annotate(unseen=Count("seen", filter=Q(seen=False)))
        )


class StatusView(generics.RetrieveAPIView):
    serializer_class = StatusSerializer
    permission_classes = [IsAuthenticated]

    def get_object(self):
        return {
            "a1": User_Appraisal_List.objects.filter(
                employee=self.request.user.profile, overall_appraisal__status="Stage 1"
            ).count(),
            "a2": User_Appraisal_List.objects.filter(
                employee=self.request.user.profile, overall_appraisal__status="Stage 1B"
            ).count(),
            "a3": User_Appraisal_List.objects.filter(
                employee=self.request.user.profile, overall_appraisal__status="Stage 2"
            ).count(),
            "a4": peerAppraisal.objects.filter(
                manager=self.request.user.profile, completion="Uncompleted"
            ).count(),
        }


@api_view(["POST"])
@permission_classes([IsHrManager])
def change_role(request):
    try:

        User.objects.filter(profile__id=request.data.get("id")).update(
            role=request.data.get("role")
        )
        return Response("Success")
    except:
        return Response("Errors", status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def set_profile_picture(request):
    try:
        request.user.profile.profile_Picture = request.FILES["profilePicture"]
        request.user.profile.save()
        return Response("Success")
    except:
        return Response("Errors", status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
def get_supervisor(request):
    profile = get_object_or_404(Profile, user__username=request.data.get("username"))
    return Response({"Supervisor": profile.first_Reporting_Manager.name})


class GuideView(ModelViewSet):
    permission_classes = [IsAuthenticated]
    serializer_class = GuideSerializer
    queryset = Guide.objects.all()


from django.conf import settings
from django.core.mail import send_mail

import secrets


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def get_token(request):
    email = request.data.get("email", "")
    if email != "" or email is not None:
        token = secrets.token_hex(3)
        user = get_object_or_404(User, email=email)

        ResetPasswordToken.objects.create(user=user, token=token)

        send_mail(
            "Password reset token",
            f"Hi {user.username} your one time token for reset password is {token} ",
            settings.OFFICIAL_MAIL,
            [user.email],
        )

        return Response({"msg": "Sucessfully send token "})

    return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
@permission_classes([IsHrManager])
def reset_password(request):
    token = request.data.get("token", "")
    password1 = request.data.get("password1", "")
    password2 = request.data.get("password2", "")
    email = request.data.get("email", "")
    if (
        token != ""
        and password1 != ""
        and password2 != ""
        and password1 == password2
        and email != ""
    ):
        try:
            user = get_object_or_404(User, email=email)
            ResetPasswordToken.objects.filter(token=token, user=user).delete()
            user.set_password(password1)
            user.save()
            return Response("Success")
        except:
            return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)

    return Response({"msg": "Errors"}, status=status.HTTP_400_BAD_REQUEST)


from django.utils import timezone


@api_view(["POST"])
@permission_classes([IsHrManager])
def resign_employee(request):
    try:
        id = request.data.get("id")
        profile = get_object_or_404(Profile, id=id)
        profile.resign_date = timezone.now().date()
        profile.user.is_active = False
        profile.save()
        profile.user.save()
        profile.user_appraisal_list_set.update(is_closed=True)
        return Response("User is successfully resignd")

    except:
        return Response("An error accured", status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
@permission_classes([IsHrManager])
def check_username(request):
    try:
        username = request.data.get("username")
        if not User.objects.filter(username=username).exists():
            return Response("username is available")
        return Response("username not is available", status=status.HTTP_400_BAD_REQUEST)
    except:
        return Response("username not is available", status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
@permission_classes([IsHrManager])
def check_email(request):
    try:
        email = request.data.get("email")
        if not User.objects.filter(email=email).exists():
            return Response("email is available")
        return Response("email not is available", status=status.HTTP_400_BAD_REQUEST)
    except:
        return Response("email not is available", status=status.HTTP_400_BAD_REQUEST)
