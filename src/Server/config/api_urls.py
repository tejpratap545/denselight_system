from django.urls.conf import path

from backend.GnC.api.views import (
    CreateGoalView,
    CreateKPI,
    CreateCompetenciesView,
    GoalApiView,
    KPIApiView,
    CompetenciesAPIView,
)
from backend.Profile.api.views import ProfileView, ListEmployees
from backend.Appraisals.api.views import (
    ManagerAppraisal,
    UserAppraisal,
    DetailAppraisal,
    DetailUserAppraisal,
)
from backend.Trainings.api.views import SkillsApiView, CreateSkillsApiView

urlpatterns = [
    path("user/me/", ProfileView.as_view(), name="get_user_info"),
    path(
        "employee/list/", ListEmployees.as_view(), name="retrieve_employee_appraisals"
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
]
