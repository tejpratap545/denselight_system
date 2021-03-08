from backend.Profile.models import Profile
from django.db.models import Q
from rest_framework import permissions


class IsOwner(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        return obj.email == request.user.email or request.user.role == "Admin"


class IsEmployee(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        return request.user.role == "Employee" or request.user.role == "Admin"


class IsManager(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        return request.user.role == "Manager" or request.user.role == "Admin"


class IsHr(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        return request.user.role == "Hr" or request.user.role == "Admin"


class IsHrManager(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        return request.user.role == "HRManager" or request.user.role == "Admin"
