from django.conf import settings
from rest_framework.routers import DefaultRouter, SimpleRouter

from backend.Appraisals.api.views import (
    AppraisalCategoryViewSet,
    OverallAppraisalViewSet,
)
from backend.Profile.api.views import DepartmentViewSet

if settings.DEBUG:
    router = DefaultRouter()
else:
    router = SimpleRouter()


router.register(r"department", DepartmentViewSet)
router.register(r"appraisal/category", AppraisalCategoryViewSet)
router.register(r"overallAppraisal", OverallAppraisalViewSet)

app_name = "denselight"
urlpatterns = router.urls
