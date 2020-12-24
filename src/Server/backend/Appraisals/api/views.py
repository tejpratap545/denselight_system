from django.utils.decorators import method_decorator
from django.views.decorators.cache import cache_page
from django.views.decorators.vary import vary_on_cookie
from rest_framework.generics import get_object_or_404
from rest_framework.viewsets import ModelViewSet
from django.db.models import Window, Count
from ..models import *
from .serializers import *
from rest_framework import generics
from rest_framework.permissions import IsAuthenticated


class ManagerAppraisal(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = UserAppraisalListSerializer

    def get_queryset(self):
        return User_Appraisal_List.objects.prefetch_related(
            "overall_appraisal",
            "employee",
            "manager",
            "overall_appraisal__appraisal_category",
            "appraisal_category",
        ).filter(manager=self.request.user.profile)

    @method_decorator(cache_page(60 * 2))
    @method_decorator(vary_on_cookie)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)


class UserAppraisal(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = UserAppraisalListSerializer

    def get_queryset(self):
        return User_Appraisal_List.objects.prefetch_related(
            "overall_appraisal",
            "employee",
            "manager",
            "overall_appraisal__appraisal_category",
            "appraisal_category",
        ).filter(employee=self.request.user.profile)

    @method_decorator(cache_page(60 * 2))
    @method_decorator(vary_on_cookie)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)


class AppraisalCategoryViewSet(ModelViewSet):
    serializer_class = AppraisalCategorySerializer
    queryset = Appraisal_Category.objects.all()

    @method_decorator(cache_page(60 * 2))
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)


class OverallAppraisalViewSet(ModelViewSet):
    serializer_class = OverallAppraisalSerializer
    queryset = (
        Overall_Appraisal.objects.prefetch_related("appraisal_category")
        .all()
        .annotate(employee_count=Count("user_appraisal_list"))
    )

    @method_decorator(cache_page(60 * 3))
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)


class DetailAppraisal(generics.RetrieveAPIView):
    serializer_class = DetailAppraisalSerializer

    def get_object(self):
        queryset = User_Appraisal_List.objects.prefetch_related(
            "manager",
            "employee",
            "manager__department",
            "employee__department",
            "overall_appraisal",
            "overall_appraisal__appraisal_category",
            "appraisal_category",
            "goals_set",
            "competencies_set",
            "goals_set__kpi_set",
            "goals_set__goalcomment_set",
            "competencies_set__competencycomment_set",
        )
        return get_object_or_404(queryset, id=self.kwargs["pk"])

    @method_decorator(cache_page(60 * 3))
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
