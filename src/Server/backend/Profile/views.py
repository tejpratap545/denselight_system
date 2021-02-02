from .backend import decode_jwt_token, encode_jwt_token
from .models import AccessToken, Profile, RefreshToken, User
from backend.Appraisals.models import User_Appraisal_List
from datetime import timedelta
from django.db.models import Count, F, Q, Window
from django.http import HttpResponse
from django.shortcuts import get_list_or_404, render
from django.utils import timezone
from rest_framework import status
from rest_framework.decorators import api_view

# Create your views here.
from rest_framework.generics import get_object_or_404
from rest_framework.response import Response
from rest_framework.views import APIView

import io
import secrets
import xlsxwriter


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


def download_report(request):
    data = User_Appraisal_List.objects.prefetch_related(
        "employee__department", "employee"
    )

    output = io.BytesIO()
    workbook = xlsxwriter.Workbook(output)

    # for row_num, columns in enumerate(data):
    #     for col_num, cell_data in enumerate(columns):
    #         worksheet.write(row_num, col_num, cell_data)

    #
    try:

        p = (
            data.filter(status="Employee")
            .order_by("employee__second_Reporting_Manager")
            .annotate(
                total1=Window(
                    expression=Count("*"),
                    partition_by=[
                        F("employee__second_Reporting_Manager"),
                        F("employee__department"),
                    ],
                ),
                total2=Window(
                    expression=Count("*"),
                    partition_by=[F("employee__second_Reporting_Manager")],
                ),
            )
        )
        p1 = list(p)

        name = "Goal Pending Employee's Input"
        worksheet1 = workbook.add_worksheet(name)
        row = 3
        col = 3
        bold = workbook.add_format({"bold": True})
        text12 = workbook.add_format({"font_size": 12, "bold": True})
        worksheet1.write(1, 4, name, text12)
        worksheet1.write(2, 3, "HOD", text12)
        worksheet1.write(2, 4, "Department", text12)
        worksheet1.write(2, 5, "Employees", text12)
        worksheet1.write(2, 6, "Employees Count", text12)
        for row_num, obj in enumerate(p1):
            if row_num == 0:
                worksheet1.write(
                    row, col, obj.employee.second_Reporting_Manager.name, bold
                )
                col += 1
                row += 1
                worksheet1.write(row, col, obj.employee.department.name)
                col += 2
                worksheet1.write(row, col, obj.total1, bold)
                col -= 1
                row += 1
                worksheet1.write(row, col, obj.employee.name)
                row -= 2
                col += 1
                worksheet1.write(row, col, obj.total2, text12)
                row += 3

            else:
                if (
                    p1[row_num - 1].employee.second_Reporting_Manager
                    == p1[row_num].employee.second_Reporting_Manager
                ):
                    worksheet1.write(row, col, "")
                    row, col = row + 1, col + 1
                    if (
                        p1[row_num - 1].employee.department.name
                        == p1[row_num].employee.department.name
                    ):
                        worksheet1.write(row, col, "")
                        col = col + 1
                        worksheet1.write(row, col, obj.employee.name)
                    else:
                        row += 1
                        worksheet1.write(row, col, obj.employee.department.name)
                        row += 1
                        col = col + 1
                        worksheet1.write(row, col, obj.employee.name)
                        row -= 1
                        col = col + 1
                        worksheet1.write(row, col, obj.total1, bold)
                else:
                    row += 3
                    worksheet1.write(
                        row, col, obj.employee.second_Reporting_Manager.name, bold
                    )
                    col += 1
                    row += 2
                    worksheet1.write(row, col, obj.employee.department.name)
                    col += 2
                    worksheet1.write(row, col, obj.total1, bold)
                    col -= 1
                    row += 1
                    worksheet1.write(row, col, obj.employee.name)
                    row -= 3
                    col += 1
                    worksheet1.write(row, col, obj.total2, text12)
                    row += 2
            col = 3
        worksheet1.write(row + 2, 3, "Grand Total", text12)
        worksheet1.write(row + 2, 6, len(p1), text12)

    except:
        pass

    try:

        p = (
            data.filter(status="Manager")
            .order_by("employee__second_Reporting_Manager")
            .annotate(
                total1=Window(
                    expression=Count("*"),
                    partition_by=[
                        F("employee__second_Reporting_Manager"),
                        F("employee__department"),
                    ],
                ),
                total2=Window(
                    expression=Count("*"),
                    partition_by=[F("employee__second_Reporting_Manager")],
                ),
            )
        )
        p1 = list(p)

        name = "Goal Pending Manager Approval"
        worksheet1 = workbook.add_worksheet(name)
        row = 3
        col = 3
        bold = workbook.add_format({"bold": True})
        text12 = workbook.add_format({"font_size": 12, "bold": True})
        worksheet1.write(1, 4, name, text12)
        worksheet1.write(2, 3, "HOD", text12)
        worksheet1.write(2, 4, "Department", text12)
        worksheet1.write(2, 5, "Employees", text12)
        worksheet1.write(2, 6, "Employees Count", text12)
        for row_num, obj in enumerate(p1):
            if row_num == 0:
                worksheet1.write(
                    row, col, obj.employee.second_Reporting_Manager.name, bold
                )
                col += 1
                row += 1
                worksheet1.write(row, col, obj.employee.department.name)
                col += 2
                worksheet1.write(row, col, obj.total1, bold)
                col -= 1
                row += 1
                worksheet1.write(row, col, obj.employee.name)
                row -= 2
                col += 1
                worksheet1.write(row, col, obj.total2, text12)
                row += 3

            else:
                if (
                    p1[row_num - 1].employee.second_Reporting_Manager
                    == p1[row_num].employee.second_Reporting_Manager
                ):
                    worksheet1.write(row, col, "")
                    row, col = row + 1, col + 1
                    if (
                        p1[row_num - 1].employee.department.name
                        == p1[row_num].employee.department.name
                    ):
                        worksheet1.write(row, col, "")
                        col = col + 1
                        worksheet1.write(row, col, obj.employee.name)
                    else:
                        row += 1
                        worksheet1.write(row, col, obj.employee.department.name)
                        row += 1
                        col = col + 1
                        worksheet1.write(row, col, obj.employee.name)
                        row -= 1
                        col = col + 1
                        worksheet1.write(row, col, obj.total1, bold)
                else:
                    row += 3
                    worksheet1.write(
                        row, col, obj.employee.second_Reporting_Manager.name, bold
                    )
                    col += 1
                    row += 2
                    worksheet1.write(row, col, obj.employee.department.name)
                    col += 2
                    worksheet1.write(row, col, obj.total1, bold)
                    col -= 1
                    row += 1
                    worksheet1.write(row, col, obj.employee.name)
                    row -= 3
                    col += 1
                    worksheet1.write(row, col, obj.total2, text12)
                    row += 2
            col = 3
        worksheet1.write(row + 2, 3, "Grand Total", text12)
        worksheet1.write(row + 2, 6, len(p1), text12)

    except:
        pass

    try:

        p = (
            data.filter(status="S1BEmployee")
            .order_by("employee__second_Reporting_Manager")
            .annotate(
                total1=Window(
                    expression=Count("*"),
                    partition_by=[
                        F("employee__second_Reporting_Manager"),
                        F("employee__department"),
                    ],
                ),
                total2=Window(
                    expression=Count("*"),
                    partition_by=[F("employee__second_Reporting_Manager")],
                ),
            )
        )
        p1 = list(p)
        name = "Mid year Pending Employee's Input"
        worksheet1 = workbook.add_worksheet("Mid year Pending Employee")
        row = 3
        col = 3
        bold = workbook.add_format({"bold": True})
        text12 = workbook.add_format({"font_size": 12, "bold": True})
        worksheet1.write(1, 4, name, text12)
        worksheet1.write(2, 3, "HOD", text12)
        worksheet1.write(2, 4, "Department", text12)
        worksheet1.write(2, 5, "Employees", text12)
        worksheet1.write(2, 6, "Employees Count", text12)
        for row_num, obj in enumerate(p1):
            if row_num == 0:
                worksheet1.write(
                    row, col, obj.employee.second_Reporting_Manager.name, bold
                )
                col += 1
                row += 1
                worksheet1.write(row, col, obj.employee.department.name)
                col += 2
                worksheet1.write(row, col, obj.total1, bold)
                col -= 1
                row += 1
                worksheet1.write(row, col, obj.employee.name)
                row -= 2
                col += 1
                worksheet1.write(row, col, obj.total2, text12)
                row += 3

            else:
                if (
                    p1[row_num - 1].employee.second_Reporting_Manager
                    == p1[row_num].employee.second_Reporting_Manager
                ):
                    worksheet1.write(row, col, "")
                    row, col = row + 1, col + 1
                    if (
                        p1[row_num - 1].employee.department.name
                        == p1[row_num].employee.department.name
                    ):
                        worksheet1.write(row, col, "")
                        col = col + 1
                        worksheet1.write(row, col, obj.employee.name)
                    else:
                        row += 1
                        worksheet1.write(row, col, obj.employee.department.name)
                        row += 1
                        col = col + 1
                        worksheet1.write(row, col, obj.employee.name)
                        row -= 1
                        col = col + 1
                        worksheet1.write(row, col, obj.total1, bold)
                else:
                    row += 3
                    worksheet1.write(
                        row, col, obj.employee.second_Reporting_Manager.name, bold
                    )
                    col += 1
                    row += 2
                    worksheet1.write(row, col, obj.employee.department.name)
                    col += 2
                    worksheet1.write(row, col, obj.total1, bold)
                    col -= 1
                    row += 1
                    worksheet1.write(row, col, obj.employee.name)
                    row -= 3
                    col += 1
                    worksheet1.write(row, col, obj.total2, text12)
                    row += 2
            col = 3
        worksheet1.write(row + 2, 3, "Grand Total", text12)
        worksheet1.write(row + 2, 6, len(p1), text12)

    except:
        pass

    try:

        p = (
            data.filter(status="S1BReview")
            .order_by("employee__second_Reporting_Manager")
            .annotate(
                total1=Window(
                    expression=Count("*"),
                    partition_by=[
                        F("employee__second_Reporting_Manager"),
                        F("employee__department"),
                    ],
                ),
                total2=Window(
                    expression=Count("*"),
                    partition_by=[F("employee__second_Reporting_Manager")],
                ),
            )
        )
        p1 = list(p)
        name = "Pending Mid year Employee's Review"
        worksheet1 = workbook.add_worksheet("Mid year Employee's Review")
        row = 3
        col = 3
        bold = workbook.add_format({"bold": True})
        text12 = workbook.add_format({"font_size": 12, "bold": True})
        worksheet1.write(1, 4, name, text12)
        worksheet1.write(2, 3, "HOD", text12)
        worksheet1.write(2, 4, "Department", text12)
        worksheet1.write(2, 5, "Employees", text12)
        worksheet1.write(2, 6, "Employees Count", text12)
        for row_num, obj in enumerate(p1):
            if row_num == 0:
                worksheet1.write(
                    row, col, obj.employee.second_Reporting_Manager.name, bold
                )
                col += 1
                row += 1
                worksheet1.write(row, col, obj.employee.department.name)
                col += 2
                worksheet1.write(row, col, obj.total1, bold)
                col -= 1
                row += 1
                worksheet1.write(row, col, obj.employee.name)
                row -= 2
                col += 1
                worksheet1.write(row, col, obj.total2, text12)
                row += 3

            else:
                if (
                    p1[row_num - 1].employee.second_Reporting_Manager
                    == p1[row_num].employee.second_Reporting_Manager
                ):
                    worksheet1.write(row, col, "")
                    row, col = row + 1, col + 1
                    if (
                        p1[row_num - 1].employee.department.name
                        == p1[row_num].employee.department.name
                    ):
                        worksheet1.write(row, col, "")
                        col = col + 1
                        worksheet1.write(row, col, obj.employee.name)
                    else:
                        row += 1
                        worksheet1.write(row, col, obj.employee.department.name)
                        row += 1
                        col = col + 1
                        worksheet1.write(row, col, obj.employee.name)
                        row -= 1
                        col = col + 1
                        worksheet1.write(row, col, obj.total1, bold)
                else:
                    row += 3
                    worksheet1.write(
                        row, col, obj.employee.second_Reporting_Manager.name, bold
                    )
                    col += 1
                    row += 2
                    worksheet1.write(row, col, obj.employee.department.name)
                    col += 2
                    worksheet1.write(row, col, obj.total1, bold)
                    col -= 1
                    row += 1
                    worksheet1.write(row, col, obj.employee.name)
                    row -= 3
                    col += 1
                    worksheet1.write(row, col, obj.total2, text12)
                    row += 2
            col = 3
        worksheet1.write(row + 2, 3, "Grand Total", text12)
        worksheet1.write(row + 2, 6, len(p1), text12)

    except:
        pass

    try:

        p = (
            data.filter(status="S1BManager", mid_year_completion="Completed")
            .order_by("employee__second_Reporting_Manager")
            .annotate(
                total1=Window(
                    expression=Count("*"),
                    partition_by=[
                        F("employee__second_Reporting_Manager"),
                        F("employee__department"),
                    ],
                ),
                total2=Window(
                    expression=Count("*"),
                    partition_by=[F("employee__second_Reporting_Manager")],
                ),
            )
        )
        p1 = list(p)
        name = "Mid year Completed"
        worksheet1 = workbook.add_worksheet(name)
        row = 3
        col = 3
        bold = workbook.add_format({"bold": True})
        text12 = workbook.add_format({"font_size": 12, "bold": True})
        worksheet1.write(1, 4, name, text12)
        worksheet1.write(2, 3, "HOD", text12)
        worksheet1.write(2, 4, "Department", text12)
        worksheet1.write(2, 5, "Employees", text12)
        worksheet1.write(2, 6, "Employees Count", text12)
        for row_num, obj in enumerate(p1):
            if row_num == 0:
                worksheet1.write(
                    row, col, obj.employee.second_Reporting_Manager.name, bold
                )
                col += 1
                row += 1
                worksheet1.write(row, col, obj.employee.department.name)
                col += 2
                worksheet1.write(row, col, obj.total1, bold)
                col -= 1
                row += 1
                worksheet1.write(row, col, obj.employee.name)
                row -= 2
                col += 1
                worksheet1.write(row, col, obj.total2, text12)
                row += 3

            else:
                if (
                    p1[row_num - 1].employee.second_Reporting_Manager
                    == p1[row_num].employee.second_Reporting_Manager
                ):
                    worksheet1.write(row, col, "")
                    row, col = row + 1, col + 1
                    if (
                        p1[row_num - 1].employee.department.name
                        == p1[row_num].employee.department.name
                    ):
                        worksheet1.write(row, col, "")
                        col = col + 1
                        worksheet1.write(row, col, obj.employee.name)
                    else:
                        row += 1
                        worksheet1.write(row, col, obj.employee.department.name)
                        row += 1
                        col = col + 1
                        worksheet1.write(row, col, obj.employee.name)
                        row -= 1
                        col = col + 1
                        worksheet1.write(row, col, obj.total1, bold)
                else:
                    row += 3
                    worksheet1.write(
                        row, col, obj.employee.second_Reporting_Manager.name, bold
                    )
                    col += 1
                    row += 2
                    worksheet1.write(row, col, obj.employee.department.name)
                    col += 2
                    worksheet1.write(row, col, obj.total1, bold)
                    col -= 1
                    row += 1
                    worksheet1.write(row, col, obj.employee.name)
                    row -= 3
                    col += 1
                    worksheet1.write(row, col, obj.total2, text12)
                    row += 2
            col = 3
        worksheet1.write(row + 2, 3, "Grand Total", text12)
        worksheet1.write(row + 2, 6, len(p1), text12)

    except:
        pass

    try:

        p = (
            data.filter(status="S1BManager", completion="null")
            .order_by("employee__second_Reporting_Manager")
            .annotate(
                total1=Window(
                    expression=Count("*"),
                    partition_by=[
                        F("employee__second_Reporting_Manager"),
                        F("employee__department"),
                    ],
                ),
                total2=Window(
                    expression=Count("*"),
                    partition_by=[F("employee__second_Reporting_Manager")],
                ),
            )
        )
        p1 = list(p)

        name = "End year Pending Employee's Inputs"
        worksheet1 = workbook.add_worksheet("End year Employee Inputs")
        row = 3
        col = 3
        bold = workbook.add_format({"bold": True})
        text12 = workbook.add_format({"font_size": 12, "bold": True})
        worksheet1.write(1, 4, name, text12)
        worksheet1.write(2, 3, "HOD", text12)
        worksheet1.write(2, 4, "Department", text12)
        worksheet1.write(2, 5, "Employees", text12)
        worksheet1.write(2, 6, "Employees Count", text12)
        for row_num, obj in enumerate(p1):
            if row_num == 0:
                worksheet1.write(
                    row, col, obj.employee.second_Reporting_Manager.name, bold
                )
                col += 1
                row += 1
                worksheet1.write(row, col, obj.employee.department.name)
                col += 2
                worksheet1.write(row, col, obj.total1, bold)
                col -= 1
                row += 1
                worksheet1.write(row, col, obj.employee.name)
                row -= 2
                col += 1
                worksheet1.write(row, col, obj.total2, text12)
                row += 3

            else:
                if (
                    p1[row_num - 1].employee.second_Reporting_Manager
                    == p1[row_num].employee.second_Reporting_Manager
                ):
                    worksheet1.write(row, col, "")
                    row, col = row + 1, col + 1
                    if (
                        p1[row_num - 1].employee.department.name
                        == p1[row_num].employee.department.name
                    ):
                        worksheet1.write(row, col, "")
                        col = col + 1
                        worksheet1.write(row, col, obj.employee.name)
                    else:
                        row += 1
                        worksheet1.write(row, col, obj.employee.department.name)
                        row += 1
                        col = col + 1
                        worksheet1.write(row, col, obj.employee.name)
                        row -= 1
                        col = col + 1
                        worksheet1.write(row, col, obj.total1, bold)
                else:
                    row += 3
                    worksheet1.write(
                        row, col, obj.employee.second_Reporting_Manager.name, bold
                    )
                    col += 1
                    row += 2
                    worksheet1.write(row, col, obj.employee.department.name)
                    col += 2
                    worksheet1.write(row, col, obj.total1, bold)
                    col -= 1
                    row += 1
                    worksheet1.write(row, col, obj.employee.name)
                    row -= 3
                    col += 1
                    worksheet1.write(row, col, obj.total2, text12)
                    row += 2
            col = 3
        worksheet1.write(row + 2, 3, "Grand Total", text12)
        worksheet1.write(row + 2, 6, len(p1), text12)

    except:
        pass

    try:

        p = (
            data.filter(status="S2Employee", completion="Ecompleted")
            .order_by("employee__second_Reporting_Manager")
            .annotate(
                total1=Window(
                    expression=Count("*"),
                    partition_by=[
                        F("employee__second_Reporting_Manager"),
                        F("employee__department"),
                    ],
                ),
                total2=Window(
                    expression=Count("*"),
                    partition_by=[F("employee__second_Reporting_Manager")],
                ),
            )
        )
        p1 = list(p)
        name = "End year Pending Employee's Submission"
        worksheet1 = workbook.add_worksheet("End year Employee's Submission")
        row = 3
        col = 3
        bold = workbook.add_format({"bold": True})
        text12 = workbook.add_format({"font_size": 12, "bold": True})
        worksheet1.write(1, 4, name, text12)
        worksheet1.write(2, 3, "HOD", text12)
        worksheet1.write(2, 4, "Department", text12)
        worksheet1.write(2, 5, "Employees", text12)
        worksheet1.write(2, 6, "Employees Count", text12)
        for row_num, obj in enumerate(p1):
            if row_num == 0:
                worksheet1.write(
                    row, col, obj.employee.second_Reporting_Manager.name, bold
                )
                col += 1
                row += 1
                worksheet1.write(row, col, obj.employee.department.name)
                col += 2
                worksheet1.write(row, col, obj.total1, bold)
                col -= 1
                row += 1
                worksheet1.write(row, col, obj.employee.name)
                row -= 2
                col += 1
                worksheet1.write(row, col, obj.total2, text12)
                row += 3

            else:
                if (
                    p1[row_num - 1].employee.second_Reporting_Manager
                    == p1[row_num].employee.second_Reporting_Manager
                ):
                    worksheet1.write(row, col, "")
                    row, col = row + 1, col + 1
                    if (
                        p1[row_num - 1].employee.department.name
                        == p1[row_num].employee.department.name
                    ):
                        worksheet1.write(row, col, "")
                        col = col + 1
                        worksheet1.write(row, col, obj.employee.name)
                    else:
                        row += 1
                        worksheet1.write(row, col, obj.employee.department.name)
                        row += 1
                        col = col + 1
                        worksheet1.write(row, col, obj.employee.name)
                        row -= 1
                        col = col + 1
                        worksheet1.write(row, col, obj.total1, bold)
                else:
                    row += 3
                    worksheet1.write(
                        row, col, obj.employee.second_Reporting_Manager.name, bold
                    )
                    col += 1
                    row += 2
                    worksheet1.write(row, col, obj.employee.department.name)
                    col += 2
                    worksheet1.write(row, col, obj.total1, bold)
                    col -= 1
                    row += 1
                    worksheet1.write(row, col, obj.employee.name)
                    row -= 3
                    col += 1
                    worksheet1.write(row, col, obj.total2, text12)
                    row += 2
            col = 3
        worksheet1.write(row + 2, 3, "Grand Total", text12)
        worksheet1.write(row + 2, 6, len(p1), text12)

    except:
        pass

    try:

        p = (
            data.filter(status="S2Manager", completion="MCompleted")
            .order_by("employee__second_Reporting_Manager")
            .annotate(
                total1=Window(
                    expression=Count("*"),
                    partition_by=[
                        F("employee__second_Reporting_Manager"),
                        F("employee__department"),
                    ],
                ),
                total2=Window(
                    expression=Count("*"),
                    partition_by=[F("employee__second_Reporting_Manager")],
                ),
            )
        )
        p1 = list(p)
        name = "End year Employee's Submit Review"
        worksheet1 = workbook.add_worksheet("End year Employee's Submit Review")
        row = 3
        col = 3
        bold = workbook.add_format({"bold": True})
        text12 = workbook.add_format({"font_size": 12, "bold": True})
        worksheet1.write(1, 4, name, text12)
        worksheet1.write(2, 3, "HOD", text12)
        worksheet1.write(2, 4, "Department", text12)
        worksheet1.write(2, 5, "Employees", text12)
        worksheet1.write(2, 6, "Employees Count", text12)
        for row_num, obj in enumerate(p1):
            if row_num == 0:
                worksheet1.write(
                    row, col, obj.employee.second_Reporting_Manager.name, bold
                )
                col += 1
                row += 1
                worksheet1.write(row, col, obj.employee.department.name)
                col += 2
                worksheet1.write(row, col, obj.total1, bold)
                col -= 1
                row += 1
                worksheet1.write(row, col, obj.employee.name)
                row -= 2
                col += 1
                worksheet1.write(row, col, obj.total2, text12)
                row += 3

            else:
                if (
                    p1[row_num - 1].employee.second_Reporting_Manager
                    == p1[row_num].employee.second_Reporting_Manager
                ):
                    worksheet1.write(row, col, "")
                    row, col = row + 1, col + 1
                    if (
                        p1[row_num - 1].employee.department.name
                        == p1[row_num].employee.department.name
                    ):
                        worksheet1.write(row, col, "")
                        col = col + 1
                        worksheet1.write(row, col, obj.employee.name)
                    else:
                        row += 1
                        worksheet1.write(row, col, obj.employee.department.name)
                        row += 1
                        col = col + 1
                        worksheet1.write(row, col, obj.employee.name)
                        row -= 1
                        col = col + 1
                        worksheet1.write(row, col, obj.total1, bold)
                else:
                    row += 3
                    worksheet1.write(
                        row, col, obj.employee.second_Reporting_Manager.name, bold
                    )
                    col += 1
                    row += 2
                    worksheet1.write(row, col, obj.employee.department.name)
                    col += 2
                    worksheet1.write(row, col, obj.total1, bold)
                    col -= 1
                    row += 1
                    worksheet1.write(row, col, obj.employee.name)
                    row -= 3
                    col += 1
                    worksheet1.write(row, col, obj.total2, text12)
                    row += 2
            col = 3
        worksheet1.write(row + 2, 3, "Grand Total", text12)
        worksheet1.write(row + 2, 6, len(p1), text12)

    except:
        pass

    try:

        p = (
            data.filter(status="Approved", completion="Approved")
            .order_by("employee__second_Reporting_Manager")
            .annotate(
                total1=Window(
                    expression=Count("*"),
                    partition_by=[
                        F("employee__second_Reporting_Manager"),
                        F("employee__department"),
                    ],
                ),
                total2=Window(
                    expression=Count("*"),
                    partition_by=[F("employee__second_Reporting_Manager")],
                ),
            )
        )
        p1 = list(p)
        name = "End year Approved"
        worksheet1 = workbook.add_worksheet("End year Approved")
        row = 3
        col = 3
        bold = workbook.add_format({"bold": True})
        text12 = workbook.add_format({"font_size": 12, "bold": True})
        worksheet1.write(1, 4, name, text12)
        worksheet1.write(2, 3, "HOD", text12)
        worksheet1.write(2, 4, "Department", text12)
        worksheet1.write(2, 5, "Employees", text12)
        worksheet1.write(2, 6, "Employees Count", text12)
        for row_num, obj in enumerate(p1):
            if row_num == 0:
                worksheet1.write(
                    row, col, obj.employee.second_Reporting_Manager.name, bold
                )
                col += 1
                row += 1
                worksheet1.write(row, col, obj.employee.department.name)
                col += 2
                worksheet1.write(row, col, obj.total1, bold)
                col -= 1
                row += 1
                worksheet1.write(row, col, obj.employee.name)
                row -= 2
                col += 1
                worksheet1.write(row, col, obj.total2, text12)
                row += 3

            else:
                if (
                    p1[row_num - 1].employee.second_Reporting_Manager
                    == p1[row_num].employee.second_Reporting_Manager
                ):
                    worksheet1.write(row, col, "")
                    row, col = row + 1, col + 1
                    if (
                        p1[row_num - 1].employee.department.name
                        == p1[row_num].employee.department.name
                    ):
                        worksheet1.write(row, col, "")
                        col = col + 1
                        worksheet1.write(row, col, obj.employee.name)
                    else:
                        row += 1
                        worksheet1.write(row, col, obj.employee.department.name)
                        row += 1
                        col = col + 1
                        worksheet1.write(row, col, obj.employee.name)
                        row -= 1
                        col = col + 1
                        worksheet1.write(row, col, obj.total1, bold)
                else:
                    row += 3
                    worksheet1.write(
                        row, col, obj.employee.second_Reporting_Manager.name, bold
                    )
                    col += 1
                    row += 2
                    worksheet1.write(row, col, obj.employee.department.name)
                    col += 2
                    worksheet1.write(row, col, obj.total1, bold)
                    col -= 1
                    row += 1
                    worksheet1.write(row, col, obj.employee.name)
                    row -= 3
                    col += 1
                    worksheet1.write(row, col, obj.total2, text12)
                    row += 2
            col = 3
        worksheet1.write(row + 2, 3, "Grand Total", text12)
        worksheet1.write(row + 2, 6, len(p1), text12)

    except:
        pass

    # obj.employee.department.name, obj.employee.name)

    workbook.close()
    output.seek(0)
    filename = "report.xlsx"
    response = HttpResponse(
        output,
        content_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    )
    response["Content-Disposition"] = "attachment; filename=%s" % filename

    return response
