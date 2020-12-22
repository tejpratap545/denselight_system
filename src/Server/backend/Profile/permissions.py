from backend.Profile.models import Profile
from django.db.models import Q
from rest_framework import permissions


class IsOwner(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        return obj.email == request.user.email


class IsEmployee(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        return request.user.ROLE_TYPE == "Employee"


class IsManager(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        return request.user.ROLE_TYPE == "Manager"


class IsHr(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        return request.user.ROLE_TYPE == "Hr"


class IsHrManager(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        return request.user.ROLE_TYPE == "HRManager"
