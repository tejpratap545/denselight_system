from django.shortcuts import render

# Create your views here.
from rest_framework.generics import get_object_or_404

from .backend import decode_jwt_token, encode_jwt_token
from .models import AccessToken, RefreshToken, User, Profile
from datetime import timedelta
from django.db.models import Q
from django.utils import timezone
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.views import APIView

import secrets


class TokenView(APIView):
    def _invalid_grant_response(self):
        return Response(
            data={
                "msg": "Ivalid Grant",
            },
            status=status.HTTP_400_BAD_REQUEST,
        )

    def _generate_token_response(self, user, grant_type):
        access_token = AccessToken.objects.create(
            user=user,
            token=secrets.token_urlsafe(),
            expires=timezone.now() + timedelta(seconds=172800),
        )
        refresh_token = RefreshToken.objects.create(
            user=user,
            access_token=access_token,
            token=secrets.token_urlsafe(),
        )
        return Response(
            data={
                "access_token": encode_jwt_token(
                    expires_in=172800,
                    token_id=access_token.id,
                    token_provider="password",
                    grant_type="access_token",
                    user_id=user.id,
                ),
                "refresh_token": encode_jwt_token(
                    expires_in=31449600,
                    token_id=refresh_token.id,
                    token_provider="password",
                    grant_type="refresh_token",
                    user_id=user.id,
                ),
                "expire": 172800,
                "grant_type": grant_type,
            },
            status=status.HTTP_200_OK,
        )

    def post(self, request):
        grant_type = request.data.get("grant_type", "access_token")
        if grant_type == "access_token":
            username = request.data.get("username")
            email = request.data.get("email")
            password = request.data.get("password")
            typeOfEmployee = request.data.get("typeOfEmployee", "INDIRECT")

            try:
                user = User.objects.get(Q(username=username) & Q(email=email))
                profile = get_object_or_404(
                    Profile, user=user, typeOfEmployee=typeOfEmployee
                )
                if user.check_password(password):
                    return self._generate_token_response(user, grant_type)
                return self._invalid_grant_response()

            except User.DoesNotExist:
                return self._invalid_grant_response()

        elif grant_type == "refresh_token":
            refresh_token = decode_jwt_token(request.data.get("refresh_token"))
            token = RefreshToken.objects.get(id=refresh_token["token_id"])
            if token.revoked is None:
                token.revoke()
                return self._generate_token_response(token.user, grant_type)

            else:
                return self._invalid_grant_response()

        else:
            return self._invalid_grant_response()