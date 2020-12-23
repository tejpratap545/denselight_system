from django.urls import re_path
from django.urls.conf import include, path

from backend.Profile.api.views import ProfileView, ListEmployees
from backend.Appraisals.api.views import ManagerAppraisal, UserAppraisal

urlpatterns = [
    path(
        "user/me/",
        ProfileView.as_view(),
    ),
    path("employee/list/", ListEmployees.as_view()),
    path(
        "appraisals/list/manager",
        ManagerAppraisal.as_view(),
    ),
    path(
        "appraisals/list/me",
        UserAppraisal.as_view(),
    ),
]
