import json

from django.core.cache import cache
from django.http import HttpResponse
from django.utils.decorators import method_decorator
from django.views.decorators.cache import cache_page
from rest_framework import generics
from rest_framework.decorators import api_view
from rest_framework.generics import get_object_or_404
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from .serializers import *
from ..permissions import IsOwner
from rest_framework.viewsets import ModelViewSet


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
    permission_classes = [IsAuthenticated]
    serializer_class = ProfileCreateSerializer
    queryset = Profile.objects.all()


class ProfileView(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = ProfileInfoSerializer
    queryset = Profile.objects.all()


class ChangePassword(generics.CreateAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = ChangePasswordSerializer
