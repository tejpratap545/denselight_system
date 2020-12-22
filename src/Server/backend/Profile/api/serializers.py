from rest_framework import serializers
from ..models import Profile, User, Departments


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = [
            "username",
            "is_active",
            "is_admin",
            "is_email_verified",
            "date_joined",
            "role",
        ]


class DepartmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Departments
        fields = "__all__"


class ShortProfileSerializer(serializers.ModelSerializer):
    department = DepartmentSerializer()

    class Meta:
        model = Profile
        fields = (
            "name",
            "email",
            "department",
        )


class ProfileSerializer(serializers.ModelSerializer):
    user = UserSerializer()
    department = DepartmentSerializer()
    first_Reporting_Manager = ShortProfileSerializer()

    class Meta:
        model = Profile
        fields = "__all__"


class EmployeeSerializer(serializers.ModelSerializer):
    first_Reporting_Manager = ShortProfileSerializer()
    department = DepartmentSerializer()

    class Meta:
        model = Profile
        fields = (
            "id",
            "name",
            "email",
            "typeOfEmployee",
            "first_Reporting_Manager",
            "second_Reporting_Manager",
            "gender",
            "department",
            "job_Title",
            "date_Of_Hire",
        )
