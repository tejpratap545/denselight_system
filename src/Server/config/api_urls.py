from django.urls.conf import path

from backend.GnC.api.views import (
    CreateGoalView,
    CreateKPI,
    CreateCompetenciesView,
    GoalApiView,
    KPIApiView,
    CompetenciesAPIView,
    approved_goal,
    reject_goal,
)
from backend.Profile.api.views import (
    ProfileInfoView,
    ListEmployees,
    ShortListEmployees,
    ProfileView,
    CreateProfile,
    ChangePassword,
    SetPassword,
    StatusView,
    change_role,
    set_profile_picture,
    get_supervisor,
)
from backend.Appraisals.api.views import (
    ManagerAppraisal,
    UserAppraisal,
    DetailAppraisal,
    DetailUserAppraisal,
    approve_goal,
    submit_goals,
    RejectGoals,
    input_endyear_employee,
    submit_endyear_employee,
    input_endyear_manager,
    approve_endyear_manager,
    input_midyear_employee,
    submit_midyear_employee,
    input_midyear_manager,
    CreatePeerAppraisal,
    EmployeePeerAppraisal,
    ManagerPeerAppraisal,
    ShortManagerAppraisal,
    PeerAppraisal,
    approve_midyear_manager,
    OverallAppraisal,
    MidYearRejection,
    ShortHodAppraisal,
    EndYearRejection,
)
from backend.Trainings.api.views import SkillsApiView, CreateSkillsApiView

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
    path("appraisals/list/short/manager", ShortManagerAppraisal.as_view()),
    path("appraisals/list/short/hod", ShortHodAppraisal.as_view()),
    path("appraisals/list/me", UserAppraisal.as_view()),
    path("appraisals/list/detail/me", DetailUserAppraisal.as_view()),
    path("goal/create", CreateGoalView.as_view(), name="create_goal"),
    path("KPI/create", CreateKPI.as_view(), name="create_KPI"),
    path("competencies/create", CreateCompetenciesView.as_view()),
    path("skill/create", CreateSkillsApiView.as_view()),
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
]
