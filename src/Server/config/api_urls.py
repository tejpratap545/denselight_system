from django.urls.conf import path

from backend.GnC.api.views import (
    CreateGoalView,
    CreateKPI,
    CreateCompetenciesView,
    GoalApiView,
    KPIApiView,
    CompetenciesAPIView,
)
from backend.Profile.api.views import ProfileView, ListEmployees, ShortListEmployees
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
    submit_endyear_manager,
    input_midyear_employee,
    submit_midyear_employee,
    input_midyear_manager,
    approve_endyear_manager,
    CreatePeerAppraisal,
    EmployeePeerAppraisal,
    ManagerPeerAppraisal,
)
from backend.Trainings.api.views import SkillsApiView, CreateSkillsApiView

urlpatterns = [
    path("user/me/", ProfileView.as_view(), name="get_user_info"),
    path(
        "employee/list/", ListEmployees.as_view(), name="retrieve_employee_appraisals"
    ),
    path(
        "employee/short/list",
        ShortListEmployees.as_view(),
        name="retrieve_short_employee_appraisals",
    ),
    path(
        "appraisals/list/manager",
        ManagerAppraisal.as_view(),
        name="retrieve_manager_appraisals",
    ),
    path(
        "appraisals/list/me",
        UserAppraisal.as_view(),
        name="retrieve_employee_appraisals",
    ),
    path(
        "appraisals/list/detail/me",
        DetailUserAppraisal.as_view(),
        name="detail_employee_appraisals",
    ),
    path("goal/create", CreateGoalView.as_view(), name="create_goal"),
    path("KPI/create", CreateKPI.as_view(), name="create_KPI"),
    path("competencies/create", CreateCompetenciesView.as_view()),
    path("skill/create", CreateSkillsApiView.as_view()),
    path("goal/<int:pk>", GoalApiView.as_view()),
    path("KPI/<int:pk>", KPIApiView.as_view()),
    path("competencies/<int:pk>", CompetenciesAPIView.as_view()),
    path("skill/<int:pk>", SkillsApiView.as_view()),
    path("appraisals/detail/<int:pk>", DetailAppraisal.as_view()),
    path("submit/employee/goal/<int:pk>", submit_goals),
    path("approve/manager/goal/<int:pk>", approve_goal),
    path("reject/manager/goal/<int:pk>", RejectGoals.as_view()),
    #
    path("input/employee/midyear/<int:pk>", input_midyear_employee),
    path("submit/employee/midyear/<int:pk>", submit_midyear_employee),
    path("input/manager/midyear/<int:pk>", input_midyear_manager),
    path("approve/manager/midyear/<int:pk>", approve_endyear_manager),
    #
    #
    path(
        "input/employee/endyear/<int:pk>",
        input_endyear_employee,
    ),
    path("submit/employee/endyear/<int:pk>", submit_endyear_employee),
    path("input/manager/endyear/<int:pk>", input_endyear_manager),
    path("submit/manager/endyear/<int:pk>", submit_endyear_manager),
    path("peerappraisal/create", CreatePeerAppraisal.as_view()),
    path("peerappraisal/me", EmployeePeerAppraisal.as_view()),
    path("peerappraisal/manager", ManagerPeerAppraisal.as_view())
    # path("approve/manager/endyear/<int:pk>",input_endyear_employee)
    # path("reject/manager/endyear/<int:pk>",input_endyear_employee)
]
