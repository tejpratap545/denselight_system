from django.urls import re_path
from django.urls.conf import include, path

from backend.Profile.api.views import ProfileView, ListEmployees

urlpatterns = [
    path(
        "user/me/",
        ProfileView.as_view(),
    ),
    path("employee/list/", ListEmployees.as_view()),
]
