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
        ).filter(manager=self.request.user.profile)
