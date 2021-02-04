from backend.Appraisals.api.views import *
from backend.GnC.api.views import (
    AdminCreateCompetenciesView,
    AdminCreateGoalView,
    approved_goal,
    CompetenciesAPIView,
    CreateCompetenciesView,
    CreateGoalView,
    CreateKPI,
    GoalApiView,
    KPIApiView,
    reject_goal,
)
from backend.Profile.api.views import (
    change_role,
    ChangePassword,
    CreateProfile,
    get_supervisor,
    get_token,
    ListEmployees,
    ProfileInfoView,
    ProfileView,
    ReginListEmployees,
    reset_password,
    resign_employee,
    set_profile_picture,
    SetPassword,
    ShortListEmployees,
    StatusView,
)
from backend.Profile.views import download_report
from backend.Trainings.api.views import AdminCreateSkillsApiView, CreateSkillsApiView, SkillsApiView
from django.urls.conf import path


urlpatterns = [
    path("user/me/", ProfileInfoView.as_view()),
    path("status", StatusView.as_view()),
    path("get_supervisor", get_supervisor),
    path("profile/<int:pk>", ProfileView.as_view()),
    path("profile/changerole", change_role),
    path("profile/change_profile_picture", set_profile_picture),
    path("profile/create", CreateProfile.as_view()),
    path("profile/changepassword", ChangePassword.as_view()),
    path("profile/setpassword", SetPassword.as_view()),
    path("employee/list/", ListEmployees.as_view()),
    path("overallAppraisal/list", OverallAppraisal.as_view()),
    path("employee/short/list", ShortListEmployees.as_view()),
    path("appraisals/list/manager", ManagerAppraisal.as_view()),
    path("appraisals/list/admin", AllAppraisalView.as_view()),
    path("appraisals/list/short/manager", ShortManagerAppraisal.as_view()),
    path("appraisals/list/short/hod", ShortHodAppraisal.as_view()),
    path(
        "appraisals/list/short/manager/completed",
        CompletedShortManagerAppraisal.as_view(),
    ),
    path("appraisals/list/short/hod/completed", CompletedShortHodAppraisal.as_view()),
    path("appraisals/list/me", UserAppraisal.as_view()),
    path("appraisals/list/me/completed", CompletedUserAppraisal.as_view()),
    path("appraisals/list/detail/me", DetailUserAppraisal.as_view()),
    path("goal/create", CreateGoalView.as_view(), name="create_goal"),
    path("KPI/create", CreateKPI.as_view(), name="create_KPI"),
    path("competencies/create", CreateCompetenciesView.as_view()),
    path("admin/goal/create", AdminCreateGoalView.as_view(), name="create_ADMIN_goal"),
    path("admin/competencies/create", AdminCreateCompetenciesView.as_view()),
    path("admin/skill/create", AdminCreateSkillsApiView.as_view()),
    path("goal/<int:pk>", GoalApiView.as_view()),
    path("KPI/<int:pk>", KPIApiView.as_view()),
    path("competencies/<int:pk>", CompetenciesAPIView.as_view()),
    path("skill/<int:pk>", SkillsApiView.as_view()),
    path("appraisals/detail/<int:pk>", DetailAppraisal.as_view()),
    # goal setting stage
    path("submit/employee/goal/<int:pk>", submit_goals),
    path("approve/goal/<int:pk>", approved_goal),
    path("reject/goal/<int:pk>", reject_goal),
    path("approve/manager/goal/<int:pk>", approve_goal),
    path("reject/manager/goal/<int:pk>", RejectGoals.as_view()),
    #
    # mid year stage
    path("input/employee/midyear/<int:pk>", input_midyear_employee),
    path("submit/employee/midyear/<int:pk>", submit_midyear_employee),
    path("input/manager/midyear/<int:pk>", input_midyear_manager),
    path("reject/manager/midyear/<int:pk>", MidYearRejection.as_view()),
    path("approve/manager/midyear/<int:pk>", approve_midyear_manager),
    #
    # end year stage
    path("input/employee/endyear/<int:pk>", input_endyear_employee),
    path("submit/employee/endyear/<int:pk>", submit_endyear_employee),
    path("input/manager/endyear/<int:pk>", input_endyear_manager),
    path("reject/manager/endyear/<int:pk>", EndYearRejection.as_view()),
    path("approve/manager/endyear/<int:pk>", approve_endyear_manager),
    path("peerappraisal/create", CreatePeerAppraisal.as_view()),
    path("peerappraisal/me", EmployeePeerAppraisal.as_view()),
    path("peerappraisal/manager", ManagerPeerAppraisal.as_view()),
    path("peerappraisal/<int:pk>", PeerAppraisal.as_view()),
    path("reset_password", reset_password),
    path("get_token", get_token),
    path("download/report", download_report),
    path("resign/employee", resign_employee),
    path("resign/employee/list", ReginListEmployees.as_view()),
    path("resign/employee/list/appraisals", ClosedAllAppraisalView.as_view()),
]
