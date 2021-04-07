from backend.Appraisals.api.views import (
    AppraisalCategoryViewSet,
    AppraisalViewSet,
    OverallAppraisalViewSet,
)
from backend.GnC.api.views import (
    CascadedGoalsViewSet,
    CompetencyCategoryViewSet,
    DepartmentalCompetenciesVieSet,
    DepartmentalGoalsVieSet,
    EndYrCommentBoxViewSet,
    GoalCategoryViewSet,
    GoalCommentViewSet,
    MidYrCommentBoxViewSet,
)
from backend.Profile.api.views import DepartmentViewSet, GuideView, NotificationViewSet
from backend.Trainings.api.views import SkillsCategoryViewSet
from django.conf import settings
from rest_framework.routers import DefaultRouter, SimpleRouter


if settings.DEBUG:
    router = DefaultRouter()
else:
    router = SimpleRouter()


router.register(r"department", DepartmentViewSet)
# router.register(r"appraisal", AppraisalView, basename="appraisal")
router.register(r"notification", NotificationViewSet, basename="Notification")
router.register(r"category/appraisal", AppraisalCategoryViewSet)
router.register(r"category/goal", GoalCategoryViewSet)
router.register(r"category/skill", SkillsCategoryViewSet)
router.register(r"category/competency", CompetencyCategoryViewSet)
router.register(r"overallAppraisal", OverallAppraisalViewSet)
router.register(r"comment/goals", GoalCommentViewSet, basename="CommentBox")
router.register(r"comment/midyear", MidYrCommentBoxViewSet, basename="MidYrCommentBox")
router.register(
    r"comment/endyear", EndYrCommentBoxViewSet, basename="EndYrCommentBoxViewSet"
)
router.register(r"departmentalgoal", DepartmentalGoalsVieSet)
router.register(r"departmentalcompetencies", DepartmentalCompetenciesVieSet)
router.register(r"comment/goals/endyear", EndYrCommentBoxViewSet)
router.register(r"appraisals/admin", AppraisalViewSet),
router.register(r"guide", GuideView),
router.register(r"cascadedgoal", CascadedGoalsViewSet),

app_name = "denselight"
urlpatterns = router.urls
