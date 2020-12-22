from django.conf import settings
from rest_framework.routers import DefaultRouter, SimpleRouter

from backend.Profile.api.views import DepartmentViewSet

if settings.DEBUG:
    router = DefaultRouter()
else:
    router = SimpleRouter()


router.register(r"department", DepartmentViewSet)
app_name = "denselight"
urlpatterns = router.urls
