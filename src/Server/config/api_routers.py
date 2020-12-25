from django.conf import settings
from rest_framework.routers import DefaultRouter, SimpleRouter

from backend.Appraisals.api.views import (
    AppraisalCategoryViewSet,
    OverallAppraisalViewSet,
)
from backend.GnC.api.views import GoalCategoryViewSet, CompetencyCategoryViewSet
from backend.Profile.api.views import DepartmentViewSet
from backend.Trainings.api.views import SkillsCategoryViewSet

if settings.DEBUG:
    router = DefaultRouter()
else:
    router = SimpleRouter()


router.register(r"department", DepartmentViewSet)
router.register(r"category/appraisal", AppraisalCategoryViewSet)
router.register(r"category/goal", GoalCategoryViewSet)
router.register(r"category/skill", SkillsCategoryViewSet)
router.register(r"category/competency", CompetencyCategoryViewSet)
router.register(r"overallAppraisal", OverallAppraisalViewSet)

app_name = "denselight"
urlpatterns = router.urls
