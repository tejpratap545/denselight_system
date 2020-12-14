from django.conf import settings
from rest_framework.routers import DefaultRouter, SimpleRouter


if settings.DEBUG:
    router = DefaultRouter()
else:
    router = SimpleRouter()

# router.register("user/me", UserViewSet)
app_name = "denselight"
urlpatterns = router.urls