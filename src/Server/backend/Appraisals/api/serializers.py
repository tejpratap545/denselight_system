from ...GnC.api.serializers import (
    CompetenciesSerializer,
    DepartmentCompetenciesSerializer,
    DetailCascadedGoalsSerializer,
    DetailCompetenciesSerializer,
    DetailDepartmentGoalSerializer,
    DetailGoalSerializer,
)
from ...Profile.models import Notification
from ..models import *
from backend.Profile.api.serializers import DepartmentSerializer, ShortProfileSerializer
from backend.Trainings.api.serializers import SkillsSerializer
from django.conf import settings
from django.core.mail import send_mail
from django.db import transaction
from rest_framework import serializers


class AppraisalCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Appraisal_Category
        fields = "__all__"


class DetailOverallAppraisalSerializer(serializers.ModelSerializer):
    employee_count = serializers.IntegerField(read_only=True)
    individual_employees = serializers.ListField(write_only=True, required=False)
    departments = serializers.ListField(write_only=True, required=False)
    is_company = serializers.BooleanField(default=False)
    departmentalgoals_set = DetailDepartmentGoalSerializer(many=True)
    cascadedgoals_set = DetailCascadedGoalsSerializer(many=True)

    departmentalcompetencies_set = DepartmentCompetenciesSerializer(many=True)
    appraisal_category = AppraisalCategorySerializer()

    class Meta:
        model = Overall_Appraisal
        fields = "__all__"


def int_status(a):
    if a == "Stage 1":
        return 0
    elif a == "Stage 1B":
        return 1
    elif a == "Stage 2":
        return 2
    elif a == "Stage 3":
        return 3
    elif a == "Stage 4":
        return 4
    else:
        return 5


from backend.GnC.models import DepartmentalCompetencies


STAGE1_EMAIL = """"Dear employees {employee_name}, \n \n
The Year {{appraisal_name}}  E-PMP (Performance Management Program) has started. \n  Stage 1: Goal setting is now launched from {{goal_start_date}} to {{goal_end_date}}. \n  Kindly speak to your supervisor on your goals and Key Performance Indicators (KPI) and enter that in the Denselight E-PMP system by the due date as stated above. \n \n \n
Thank you.
"""
STAGE2_EMAIL = """Dear employees {employee_name}, \n \n
The {{appraisal_name}} Year’s Mid Year review for the E-PMP (Performance Management Program) has started. \n   Stage 2 is now launched from {{mid_start_date}} to {{mid_end_date}}.  \n  Kindly in-put your status of each of your goals by reviewing the Key Performance Indicators (KPI) and enter the updates into the Denselight E-PMP system by the due date as stated above. \n \n \n
Thank you.
"""

STAGE3_EMAIL = """Dear employees {employee_name}, \n \n
The {{appraisal_name}} Year’s Final Year review for the E-PMP (Performance Management Program) has started. \n  Stage 3 is now launched from {{end_start_date}} to {{end_end_date}}.  \n  Kindly in-put your status of each of your goals by reviewing the Key Performance Indicators (KPI) and enter the updates into the Denselight E-PMP system by the due date as stated above.  After you have updated your performance for each goal, you need to self-rate on your overall performance. \n  Do note after this, your supervisor will also give his rating of his performance. \n  The final rating will be decided at the moderated committee meeting and your final rating will be updated in your e-PMP after the discussion.  \n \n \n
Thank you
"""


class OverallAppraisalSerializer(serializers.ModelSerializer):
    employee_count = serializers.IntegerField(read_only=True)
    individual_employees = serializers.ListField(write_only=True, required=False)
    departments = serializers.ListField(write_only=True, required=False)
    is_company = serializers.BooleanField(default=False)

    class Meta:
        model = Overall_Appraisal
        fields = "__all__"

    def create(self, validated_data):
        with transaction.atomic():
            is_company = validated_data.pop("is_company", False)
            individual_employees = validated_data.pop("individual_employees", [])
            departments = validated_data.pop("departments", [])
            overall_appraisal = Overall_Appraisal.objects.create(
                **validated_data,
                status="Stage 1",
            )
            DepartmentalCompetencies.objects.bulk_create(
                [
                    DepartmentalCompetencies(
                        appraisal=overall_appraisal,
                        summary="DenseLight Core Values",
                        description="""Our core values are the foundation to making DenseLight a successful company. It is our way of life and inbuilt into our DNA.""",
                    ),
                    DepartmentalCompetencies(
                        appraisal=overall_appraisal,
                        summary="Customer First Mindset",
                        description="""Our customers, come first. We will strive to provide them with superior innovative products and will continuously improve their quality that will in turn see us win in our end markets.""",
                    ),
                    DepartmentalCompetencies(
                        appraisal=overall_appraisal,
                        summary="Commitment to You",
                        description="""We are accountable in our commitment to achieve excellence.  We do what we say and behave with integrity at all time. We will uphold the ethical standards of the company always.  We respect each other and value every employee’s contribution.  Collaboration as a team is our motto and we celebrate small and big wins with appreciation.""",
                    ),
                    DepartmentalCompetencies(
                        appraisal=overall_appraisal,
                        summary="Integrity with Passion & Tenacity",
                        description="""At DenseLight, we take pride in every job that we do by having the highest level of honesty and openness. We cultivate our entrepreneurial drive as a means to remain flexible, agile and willingness to change. We are passionate about DenseLight and have a never-say-die attitude! """,
                    ),
                ]
            )

            if is_company:
                for profile in Profile.objects.all():
                    app = User_Appraisal_List.objects.get_or_create(
                        employee=profile,
                        manager=profile.first_Reporting_Manager,
                        overall_appraisal=overall_appraisal,
                        status="Employee",
                        appraisal_name=overall_appraisal.name,
                        appraisal_category=overall_appraisal.appraisal_category,
                        start_date=overall_appraisal.start_date,
                        end_date=overall_appraisal.calibration_end_date,
                        completion="null",
                    )
                    title = f"{overall_appraisal.name} appraisal created"
                    description = (
                        f"Hi {profile.name}  {self.context['request'].user.profile.name} created "
                        f"{overall_appraisal.name} "
                        f"Please go to dashboard and then add goals , kpis , core values and skills and then "
                        f"submitted to manager "
                    )
                    Notification.objects.create(
                        user=profile,
                        title=title,
                        description=description,
                        color="info",
                    )
                    try:
                        send_mail(
                            title,
                            STAGE1_EMAIL.format(
                                employee_name=profile.name,
                                appraisal_name=overall_appraisal.name,
                                goal_start_date=overall_appraisal.start_date,
                                goal_end_date=overall_appraisal.goals_setting_end_date,
                            ),
                            settings.OFFICIAL_MAIL,
                            [profile.email],
                        )
                    except:
                        pass
                return overall_appraisal

            elif len(departments) > 0:
                for profile in Profile.objects.filter(department__in=departments):
                    app = User_Appraisal_List.objects.create(
                        employee=profile,
                        manager=profile.first_Reporting_Manager,
                        overall_appraisal=overall_appraisal,
                        status="Employee",
                        appraisal_name=overall_appraisal.name,
                        appraisal_category=overall_appraisal.appraisal_category,
                        start_date=overall_appraisal.start_date,
                        end_date=overall_appraisal.calibration_end_date,
                        completion="null",
                    )
                    title = f"{overall_appraisal.name} appraisal created"
                    description = (
                        f"Hi {profile.name}  {self.context['request'].user.profile.name} created "
                        f"{overall_appraisal.name} "
                        f"Please go to dashboard and then add goals , kpis , core values and skills and then "
                        f"submitted to manager "
                    )
                    Notification.objects.create(
                        user=profile,
                        title=title,
                        description=description,
                        color="info",
                    )
                    try:
                        send_mail(
                            title,
                            STAGE1_EMAIL.format(
                                employee_name=profile.name,
                                appraisal_name=overall_appraisal.name,
                                goal_start_date=overall_appraisal.start_date,
                                goal_end_date=overall_appraisal.goals_setting_end_date,
                            ),
                            settings.OFFICIAL_MAIL,
                            [profile.email],
                        )
                    except:
                        pass
                return overall_appraisal

            elif len(individual_employees) > 0:
                for profile in Profile.objects.filter(id__in=individual_employees):
                    app = User_Appraisal_List.objects.create(
                        employee=profile,
                        manager=profile.first_Reporting_Manager,
                        overall_appraisal=overall_appraisal,
                        status="Employee",
                        appraisal_name=overall_appraisal.name,
                        appraisal_category=overall_appraisal.appraisal_category,
                        start_date=overall_appraisal.start_date,
                        end_date=overall_appraisal.calibration_end_date,
                        completion="null",
                    )
                    title = f"{overall_appraisal.name} appraisal created"
                    description = (
                        f"Hi {app.employee.name}  {self.context['request'].user.profile.name} created "
                        f"{overall_appraisal.name} "
                        f"Please go to dashboard and then add goals , kpis , core values and skills and then "
                        f"submitted to manager "
                    )
                    Notification.objects.create(
                        user=profile,
                        title=title,
                        description=description,
                        color="info",
                    )
                    try:
                        send_mail(
                            title,
                            STAGE1_EMAIL.format(
                                employee_name=profile.name,
                                appraisal_name=overall_appraisal.name,
                                goal_start_date=overall_appraisal.start_date,
                                goal_end_date=overall_appraisal.goals_setting_end_date,
                            ),
                            settings.OFFICIAL_MAIL,
                            [app.profile.email],
                        )
                    except:
                        pass
                return overall_appraisal

            else:
                return serializers.ValidationError("Something went wrong")

    def update(self, instance, validated_data):

        a = int_status(validated_data.get("status"))
        b = int_status(instance.status)
        if a < b:
            if a == 0:
                User_Appraisal_List.objects.filter(overall_appraisal=instance).update(
                    status="Employee",
                    completion="null",
                    mid_year_completion="Uncompleted",
                )
                for app in instance.user_appraisal_list_set.all():
                    title = f"{app.appraisal_name} shifted back to goal settings stage "
                    description = (
                        f"Hi {app.employee.name}  {self.context['request'].user.profile.name} shifted  {app.appraisal_name}  "
                        f"goal back to goal settings stage "
                        f"Please resubmit goals to manager"
                    )
                    Notification.objects.create(
                        user=app.employee,
                        title=title,
                        description=description,
                        color="info",
                    )
                    try:
                        send_mail(
                            title,
                            STAGE1_EMAIL.format(
                                employee_name=app.employee.name,
                                appraisal_name=app.appraisal_name,
                                goal_start_date=app.overall_appraisal.start_date,
                                goal_end_date=app.overall_appraisal.goals_setting_end_date,
                            ),
                            settings.OFFICIAL_MAIL,
                            [app.employee.email],
                        )
                    except:
                        pass
            if a == 1:
                User_Appraisal_List.objects.filter(overall_appraisal=instance).update(
                    status="S1BEmployee",
                    completion="null",
                    mid_year_completion="Uncompleted",
                )
                for app in instance.user_appraisal_list_set.all():
                    title = f"{app.appraisal_name} shifted back to mid year review settings stage "
                    description = (
                        f"Hi {app.employee.name}  {self.context['request'].user.profile.name} shifted  {app.appraisal_name}  "
                        f"goal back to mid year review stage  "
                        f"Please resubmit mid year review to manager"
                    )
                    Notification.objects.create(
                        user=app.employee,
                        title=title,
                        description=description,
                        color="info",
                    )
                    try:
                        send_mail(
                            title,
                            STAGE2_EMAIL.format(
                                employee_name=app.employee.name,
                                appraisal_name=app.appraisal_name,
                                mid_start_date=app.overall_appraisal.mid_year_start_date,
                                mid_end_date=app.overall_appraisal.mid_year_end_date,
                            ),
                            settings.OFFICIAL_MAIL,
                            [app.employee.email],
                        )
                    except:
                        pass
            if a == 2:
                User_Appraisal_List.objects.filter(overall_appraisal=instance).update(
                    status="S2Employee",
                    completion="null",
                )
                for app in instance.user_appraisal_list_set.all():
                    title = f"{app.appraisal_name} shifted back to end year review settings stage "
                    description = (
                        f"Hi {app.employee.name}  {self.context['request'].user.profile.name} shifted  {app.appraisal_name}  "
                        f"goal back to end year review stage  "
                        f"Please resubmit end year review to manager"
                    )
                    Notification.objects.create(
                        user=app.employee,
                        title=title,
                        description=description,
                        color="info",
                    )
                    try:
                        send_mail(
                            title,
                            STAGE3_EMAIL.format(
                                employee_name=app.employee.name,
                                appraisal_name=app.appraisal_name,
                                end_start_date=app.overall_appraisal.end_year_start_date,
                                end_end_date=app.overall_appraisal.appraisal_end_date,
                            ),
                            settings.OFFICIAL_MAIL,
                            [app.employee.email],
                        )
                    except:
                        pass
        else:
            if a == 1:
                for app in instance.user_appraisal_list_set.all():
                    title = f"{app.appraisal_name} shifted from goal settings stage to mid year review"
                    description = (
                        f"Hi {app.employee.name}  {self.context['request'].user.profile.name} shifted  {app.appraisal_name}  "
                        f"goal settings stage to mid year review"
                        f"If your goals approved then please fill mid year review then submitted to manager"
                    )
                    Notification.objects.create(
                        user=app.employee,
                        title=title,
                        description=description,
                        color="info",
                    )
                    try:
                        send_mail(
                            title,
                            STAGE2_EMAIL.format(
                                employee_name=app.employee.name,
                                appraisal_name=app.appraisal_name,
                                mid_start_date=app.overall_appraisal.mid_year_start_date,
                                mid_end_date=app.overall_appraisal.mid_year_end_date,
                            ),
                            settings.OFFICIAL_MAIL,
                            [app.employee.email],
                        )
                    except:
                        pass
            if a == 2:
                for app in instance.user_appraisal_list_set.all():
                    title = f"{app.appraisal_name} shifted from mid year review to end  year review"
                    description = (
                        f"Hi {app.employee.name}  {self.context['request'].user.profile.name} shifted  {app.appraisal_name}  "
                        f"from mid year review to end  year review"
                        f"If your  mid year review  approved then please fill end year review then submitted to "
                        f"manager "
                    )
                    Notification.objects.create(
                        user=app.employee,
                        title=title,
                        description=description,
                        color="info",
                    )
                    try:
                        send_mail(
                            title,
                            STAGE3_EMAIL.format(
                                employee_name=app.employee.name,
                                appraisal_name=app.appraisal_name,
                                end_start_date=app.overall_appraisal.end_year_start_date,
                                end_end_date=app.overall_appraisal.appraisal_end_date,
                            ),
                            settings.OFFICIAL_MAIL,
                            [app.employee.email],
                        )
                    except:
                        pass

        super(OverallAppraisalSerializer, self).update(instance, validated_data)
        instance.save()

        return instance


class ShortOverallAppraisalSerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Overall_Appraisal
        fields = (
            "id",
            "name",
            "status",
            "calibration_end_date",
        )


class ShortAppraisal2Serializer(serializers.ModelSerializer):
    overall_appraisal = ShortOverallAppraisalSerSerializer()

    class Meta:
        model = User_Appraisal_List

        fields = (
            "id",
            "appraisal_name",
            "overall_appraisal",
            "status",
        )


class UserAppraisalSerializer(serializers.ModelSerializer):
    class Meta:
        model = User_Appraisal_List
        fields = "__all__"


class ShortAppraisalSerializer(serializers.ModelSerializer):
    overall_appraisal = ShortOverallAppraisalSerSerializer()

    class Meta:
        model = User_Appraisal_List

        fields = (
            "id",
            "appraisal_name",
            "status",
            "overall_appraisal",
            "completion",
        )


class UserAppraisalListSerializer(serializers.ModelSerializer):
    manager = ShortProfileSerializer()
    employee = ShortProfileSerializer()
    overall_appraisal = OverallAppraisalSerializer()
    appraisal_category = AppraisalCategorySerializer()
    goals_count = serializers.IntegerField(read_only=True, default=0)
    core_values_competencies_count = serializers.IntegerField(read_only=True, default=0)
    skills_count = serializers.IntegerField(read_only=True, default=0)

    class Meta:
        model = User_Appraisal_List
        fields = "__all__"


class DetailAppraisalSerializer(serializers.ModelSerializer):
    manager = ShortProfileSerializer()
    employee = ShortProfileSerializer()
    overall_appraisal = DetailOverallAppraisalSerializer()
    appraisal_category = AppraisalCategorySerializer()
    goals_set = DetailGoalSerializer(many=True)
    competencies_set = DetailCompetenciesSerializer(many=True)
    skills_set = SkillsSerializer(many=True)

    class Meta:
        model = User_Appraisal_List
        fields = "__all__"


class GoalsSettingRejectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = User_Appraisal_List
        fields = ("goals_settingM_rejection",)

    def update(self, instance, validated_data):
        super(GoalsSettingRejectionSerializer, self).update(instance, validated_data)
        instance.status = "Employee"
        instance.save()

        title = f"{instance.manager.name} reject goal settings stage  of  {instance.appraisal_name}"
        description = f"Hi {instance.employee.name} Manager {instance.manager.name} reject goal settings stage   of{instance.appraisal_name} . Manager goal settings stage rejection comment is {instance.goals_settingM_rejection} "
        Notification.objects.create(
            user=instance.employee,
            title=title,
            description=description,
            color="error",
        )
        try:
            send_mail(
                title, description, settings.OFFICIAL_MAIL, [instance.employee.email]
            )
        except:
            pass
        return instance


class MidYearRejectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = User_Appraisal_List
        fields = ("mid_yearM_rejection",)

    def update(self, instance, validated_data):
        super(MidYearRejectionSerializer, self).update(instance, validated_data)
        instance.status = "S1BEmployee"
        instance.mid_year_completion= "Uncompleted"
        instance.save()
        title = f"{instance.manager.name} reject mid year review  of  {instance.appraisal_name}"
        description = f"Hi {instance.employee.name} Manager {instance.manager.name} reject mid year review  of{instance.appraisal_name} . Manager mid year rejection comment is {instance.mid_yearM_rejection} "
        Notification.objects.create(
            user=instance.employee,
            title=title,
            description=description,
            color="error",
        )
        try:
            send_mail(
                title, description, settings.OFFICIAL_MAIL, [instance.employee.email]
            )
        except:
            pass
        return instance


class EndRejectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = User_Appraisal_List
        fields = ("end_yearM_rejection",)

    def update(self, instance, validated_data):
        super(EndRejectionSerializer, self).update(instance, validated_data)
        instance.status = "S2Employee"
        instance.completion = "null"
        instance.save()
        title = f"{instance.manager.name} reject end year review  of  {instance.appraisal_name}"
        description = f"Hi {instance.employee.name} Manager {instance.manager.name} reject end year review  of{instance.appraisal_name} . Manager end year rejection comment is {instance.end_yearM_rejection} "
        Notification.objects.create(
            user=instance.employee,
            title=title,
            description=description,
            color="error",
        )
        try:
            send_mail(
                title, description, settings.OFFICIAL_MAIL, [instance.employee.email]
            )
        except:
            pass
        instance.save()
        return instance


class AppraisalRejectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = User_Appraisal_List
        fields = ("appraisalHR_rejection",)

    def update(self, instance, validated_data):
        super(AppraisalRejectionSerializer, self).update(instance, validated_data)
        instance.status = "Employee"
        instance.save()
        return instance


class CreatePeerAppraisalSerializer(serializers.ModelSerializer):
    employee_list = serializers.ListField(required=True)

    class Meta:
        model = peerAppraisal
        fields = (
            "appraisal",
            "title1",
            "title2",
            "title3",
            "employee_list",
        )


class ShortPeerSerializer(serializers.ModelSerializer):
    appraisal = ShortAppraisalSerializer()
    viewer = ShortProfileSerializer()
    created_by = ShortProfileSerializer()

    class Meta:
        model = peerAppraisal
        fields = (
            "id",
            "appraisal",
            "completion",
            "viewer",
            "created_by",
        )


class SubmitPeerAppraisalSerializer(serializers.ModelSerializer):
    class Meta:
        model = peerAppraisal
        fields = (
            "strength1",
            "strength2",
            "strength3",
        )

    def update(self, instance, validated_data):
        super(SubmitPeerAppraisalSerializer, self).update(instance, validated_data)
        instance.completion = "Completed"
        instance.save()


class PeerAppraisalSerializer(serializers.ModelSerializer):
    class Meta:
        model = peerAppraisal
        fields = "__all__"


class ShortAppraisal2HodSerializer(serializers.ModelSerializer):
    department = DepartmentSerializer()
    user_appraisal_list_set = ShortAppraisal2Serializer(many=True)

    # manager = ShortProfileSerializer()

    class Meta:
        model = Profile
        fields = (
            "id",
            "name",
            "email",
            "department",
            "user_appraisal_list_set",
        )
