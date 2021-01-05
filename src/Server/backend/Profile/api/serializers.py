from rest_framework import serializers
from ..models import Profile, User, Departments, Notification


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


class ShortEmployeeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = (
            "id",
            "name",
            "email",
        )


class ShortProfileSerializer(serializers.ModelSerializer):
    department = DepartmentSerializer()

    class Meta:
        model = Profile
        fields = (
            "id",
            "name",
            "email",
            "department",
            "date_Of_Hire",
        )


class ProfileInfoSerializer(serializers.ModelSerializer):
    user = UserSerializer()
    department = DepartmentSerializer()
    first_Reporting_Manager = ShortProfileSerializer()
    second_Reporting_Manager = ShortProfileSerializer()

    class Meta:
        model = Profile
        fields = "__all__"


class ProfileCreateSerializer(serializers.ModelSerializer):
    username = serializers.CharField(max_length=20, write_only=True)
    password = serializers.CharField(max_length=20, write_only=True)
    ROLE_CHOICES = (
        ("HRManager", "HRManager"),
        ("Hr", "Hr"),
        ("Manager", "Manager"),
        ("Employee", "Employee"),
    )
    role = serializers.ChoiceField(choices=ROLE_CHOICES, write_only=True)

    class Meta:
        model = Profile
        fields = "__all__"

    def create(self, validated_data):
        email = validated_data.get("email")
        password = validated_data.get("password")
        username = validated_data.get("username")
        role = validated_data.get("role")
        user = User.objects.create_user(
            username=username, email=email, password=password, role=role
        )
        return Profile.objects.create(user=user, **validated_data)


class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = "__all__"


class EmployeeSerializer(serializers.ModelSerializer):
    first_Reporting_Manager = ShortProfileSerializer()
    second_Reporting_Manager = ShortProfileSerializer()
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


class ChangePasswordSerializer(serializers.Serializer):
    password1 = serializers.CharField(max_length=50, write_only=True)
    password2 = serializers.CharField(max_length=50, write_only=True)
    old_password = serializers.CharField(max_length=50, write_only=True)
    profile = serializers.PrimaryKeyRelatedField(
        queryset=Profile.objects.all(),
    )

    def create(self, validated_data):
        user = validated_data.get("profile").user
        if user.check_password(validated_data.get("old_password")):
            user.set_password(validated_data.get("password2"))
            user.save()

            return {"profile": validated_data.get("profile")}
        raise serializers.ValidationError("password should be match")

    def validate(self, data):
        if data["password1"] != data["password2"]:
            raise serializers.ValidationError("Both password should be match")
        if (
            self.context["request"].user.profile == data["profile"]
            or self.context["request"].user.role == "HRManager"
        ):
            return data
        raise serializers.ValidationError("Not authenticate")


class SetPasswordSerializer(serializers.Serializer):

    password1 = serializers.CharField(max_length=50, write_only=True)
    password2 = serializers.CharField(max_length=50, write_only=True)
    profile = serializers.PrimaryKeyRelatedField(
        queryset=Profile.objects.all(),
    )

    def create(self, validated_data):
        user = validated_data.get("profile").user
        user.set_password(validated_data.get("password2"))
        user.save()
        return {"profile": validated_data.get("profile")}

    def validate(self, data):
        if data["password1"] != data["password2"]:
            raise serializers.ValidationError("Both password should be match")
        return data


class NotificationSerializer(serializers.ModelSerializer):
    unseen = serializers.IntegerField(read_only=True, required=False)

    class Meta:
        model = Notification
        fields = "__all__"
