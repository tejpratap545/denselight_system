from django.utils.decorators import method_decorator
from django.views.decorators.cache import cache_page
from rest_framework import generics, status
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet

from backend.Trainings.api.serializers import (
    SkillCategorySerializer,
    SkillsSerializer,
    CreateSkillsSerializer,
)
from backend.Trainings.models import SkillCategory, Skills


class SkillsCategoryViewSet(ModelViewSet):
    serializer_class = SkillCategorySerializer
    queryset = SkillCategory.objects.all()

    @method_decorator(cache_page(60 * 2))
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)


class SkillsApiView(generics.RetrieveUpdateDestroyAPIView):

    queryset = Skills.objects.all()

    def get_serializer_class(self):
        if self.request.method == "POST":
            return CreateSkillsSerializer
        return SkillsSerializer


class CreateSkillsApiView(generics.CreateAPIView):

    serializer_class = CreateSkillsSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid(raise_exception=True):
            serializer.save(employee=request.user.profile)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
