import json

from django.core.cache import cache
from django.db.models import Count, Q
from django.http import HttpResponse
from django.utils.decorators import method_decorator
from django.views.decorators.cache import cache_page
from rest_framework import generics, status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.generics import get_object_or_404
from rest_framework.pagination import PageNumberPagination
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from backend.Profile.permissions import IsHrManager
from .serializers import *
from ..permissions import IsOwner
from rest_framework.viewsets import ModelViewSet

from ...Appraisals.models import User_Appraisal_List, peerAppraisal


class ProfileInfoView(generics.RetrieveAPIView):
    permission_classes = [IsOwner]
    serializer_class = ProfileInfoSerializer

    def get_object(self):
        return cache.get_or_set(
            self.request.user.email,
            get_object_or_404(Profile, user=self.request.user),
            100,
        )


class DepartmentViewSet(ModelViewSet):
    permission_classes = [IsAuthenticated]
    serializer_class = DepartmentSerializer
    queryset = Departments.objects.all()

    @method_decorator(cache_page(60 * 2))
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)


class ListEmployees(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = EmployeeSerializer
    queryset = Profile.objects.prefetch_related(
        "first_Reporting_Manager", "department", "first_Reporting_Manager__department"
    ).only(
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
    )

    @method_decorator(cache_page(60 * 5))
    def dispatch(self, *args, **kwargs):
        return super(ListEmployees, self).dispatch(*args, **kwargs)


class ShortListEmployees(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = ShortEmployeeSerializer
    queryset = Profile.objects.only(
        "id",
        "name",
        "email",
    )

    @method_decorator(cache_page(60 * 5))
    def dispatch(self, *args, **kwargs):
        return super(ShortListEmployees, self).dispatch(*args, **kwargs)


class CreateProfile(generics.CreateAPIView):
    permission_classes = [IsHrManager]
    serializer_class = ProfileCreateSerializer
    queryset = Profile.objects.all()


class ProfileView(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsHrManager]
    serializer_class = ProfileSerializer
    queryset = Profile.objects.all()


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

    @method_decorator(cache_page(15))
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)


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
