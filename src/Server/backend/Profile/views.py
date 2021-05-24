from .backend import decode_jwt_token, encode_jwt_token
from .models import AccessToken, Profile, RefreshToken, User
from backend.Appraisals.models import Overall_Appraisal, User_Appraisal_List
from datetime import timedelta
from django.db.models import Count, F, Prefetch, Q, Window
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
import json
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
                user = User.objects.get(
                    Q(username=username) & Q(email=email) & Q(is_active=True)
                )
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


@api_view(["POST"])
def get_curve_data(request):
    overall_appraisals = request.data.get("appraisal_list")
    departments = request.data.get("department_list")

    data = Overall_Appraisal.objects.filter(id__in=overall_appraisals)
    if departments is not []:
        data = data.prefetch_related(
            Prefetch(
                "user_appraisal_list_set",
                queryset=User_Appraisal_List.objects.filter(
                    employee__departments__in=departments
                ),
            ),
        )

    return Response(
        {
            "a1": data.filter(user_appraisal_list__final_manager_rating=1).count(),
            "a2": data.filter(user_appraisal_list__final_manager_rating=2).count(),
            "a3": data.filter(user_appraisal_list__final_manager_rating=3).count(),
            "a4": data.filter(user_appraisal_list__final_manager_rating=4).count(),
            "a5": data.filter(user_appraisal_list__final_manager_rating=5).count(),
            "b1": data.filter(user_appraisal_list__board_rating=1).count(),
            "b2": data.filter(user_appraisal_list__board_rating=2).count(),
            "b3": data.filter(user_appraisal_list__board_rating=3).count(),
            "b4": data.filter(user_appraisal_list__board_rating=4).count(),
            "b5": data.filter(user_appraisal_list__board_rating=5).count(),
        }
    )


@api_view(["POST"])
def download_bell_curve(request):
    overall_appraisals = request.data.get("appraisal_list")
    departments = request.data.get("department_list")

    data = Overall_Appraisal.objects.filter(id__in=overall_appraisals)
    if departments is not []:
        data = data.prefetch_related(
            Prefetch(
                "user_appraisal_list_set",
                queryset=User_Appraisal_List.objects.filter(
                    employee__departments__in=departments
                ),
            ),
        )

    # data.values('user_appraisal_list__board_rating').annotate(total=Count('user_appraisal_list__board_rating'))

    a1 = data.filter(user_appraisal_list__final_manager_rating=1).count()
    a2 = data.filter(user_appraisal_list__final_manager_rating=2).count()
    a3 = data.filter(user_appraisal_list__final_manager_rating=3).count()
    a4 = data.filter(user_appraisal_list__final_manager_rating=4).count()
    a5 = data.filter(user_appraisal_list__final_manager_rating=5).count()
    total = total1 = a1 + a2 + a3 + a4 + a5
    if total is 0 or None:
        total = 1

    b1 = data.filter(user_appraisal_list__board_rating=1).count()
    b2 = data.filter(user_appraisal_list__board_rating=2).count()
    b3 = data.filter(user_appraisal_list__board_rating=3).count()
    b4 = data.filter(user_appraisal_list__board_rating=4).count()
    b5 = data.filter(user_appraisal_list__board_rating=5).count()

    output = io.BytesIO()
    workbook = xlsxwriter.Workbook(output)
    worksheet1 = workbook.add_worksheet("Sheet")

    bold = workbook.add_format({"bold": True})
    text12 = workbook.add_format({"font_size": 12, "bold": True})

    worksheet1.write(2, 2, "Performance Rating", text12)
    worksheet1.write(2, 3, "No. Of Employee", text12)
    worksheet1.write(2, 4, "% Of Pop", text12)

    worksheet1.write(3, 2, "CM", text12)
    worksheet1.write(3, 3, a1, text12)
    worksheet1.write(3, 4, (a1 * 100) / total)

    worksheet1.write(4, 2, "CT+", text12)
    worksheet1.write(4, 3, a2, text12)
    worksheet1.write(4, 4, (a2 * 100) / total)

    worksheet1.write(5, 2, "CT", text12)
    worksheet1.write(5, 3, a3, text12)
    worksheet1.write(5, 4, (a3 * 100) / total)

    worksheet1.write(6, 2, "CT-", text12)
    worksheet1.write(6, 3, a4, text12)
    worksheet1.write(6, 4, (a4 * 100) / total)

    worksheet1.write(7, 2, "RI", text12)
    worksheet1.write(7, 3, a5, text12)
    worksheet1.write(7, 4, (a5 * 100) / total)

    worksheet1.write(8, 2, "Grand Total", text12)
    worksheet1.write(8, 3, total1, text12)

    workbook.close()
    output.seek(0)
    filename = "bell-curve.xlsx"
    response = HttpResponse(
        output,
        content_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    )
    response["Content-Disposition"] = "attachment; filename=%s" % filename

    return response


@api_view(["GET"])
def download_report(request):
    department_list = []
    appraisal_list = []
    for i in request.query_params.get("department_list", "").split("_")[:-1]:
        if i:
            try:
                department_list.append(int(i))
            except:
                pass
    for i in request.query_params.get("appraisal_list", "").split("_")[:-1]:
        if i:
            try:
                appraisal_list.append(int(i))
            except:
                pass

    data = User_Appraisal_List.objects.prefetch_related(
        "employee__department", "employee","employee__user"
    ).exclude(employee__user__is_active=False)

    if appraisal_list is not None or appraisal_list is not []:
        data = data.filter(overall_appraisal_id__in=appraisal_list)

    if department_list != []:
        data = data.filter(employee__department_id__in=department_list)

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

        name = "Goal pend EE submit"
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
                        col += 2
                        worksheet1.write(row, col, obj.total1, bold)
                        col -= 1
                        row += 1
                        worksheet1.write(row, col, obj.employee.name)
                else:
                    row += 3
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
                        col += 2
                        worksheet1.write(row, col, obj.total1, bold)
                        col -= 1
                        row += 1
                        worksheet1.write(row, col, obj.employee.name)
                else:
                    row += 3
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
        name = "Mid year pend EE input"
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
                        col += 2
                        worksheet1.write(row, col, obj.total1, bold)
                        col -= 1
                        row += 1
                        worksheet1.write(row, col, obj.employee.name)
                else:
                    row += 3
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
        name = "Mid Year pend EE submit"
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
                        col += 2
                        worksheet1.write(row, col, obj.total1, bold)
                        col -= 1
                        row += 1
                        worksheet1.write(row, col, obj.employee.name)
                else:
                    row += 3
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
                    row += 2
            col = 3

        worksheet1.write(row + 2, 3, "Grand Total", text12)
        worksheet1.write(row + 2, 6, len(p1), text12)

    except:
        pass

    try:

        p = (
            data.filter(
                status="S1BManager", mid_year_completion="Completed", completion="null"
            )
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
                        col += 2
                        worksheet1.write(row, col, obj.total1, bold)
                        col -= 1
                        row += 1
                        worksheet1.write(row, col, obj.employee.name)
                else:
                    row += 3
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
                    row += 2
            col = 3

        worksheet1.write(row + 2, 3, "Grand Total", text12)
        worksheet1.write(row + 2, 6, len(p1), text12)

    except:
        pass

    try:

        p = (
            data.filter(status="S1BManager", completion="Ecompleted")
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

        name = "End year Goal pend EE input"
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
                        col += 2
                        worksheet1.write(row, col, obj.total1, bold)
                        col -= 1
                        row += 1
                        worksheet1.write(row, col, obj.employee.name)
                else:
                    row += 3
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
        name = "End year pend EE submit"
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
                        col += 2
                        worksheet1.write(row, col, obj.total1, bold)
                        col -= 1
                        row += 1
                        worksheet1.write(row, col, obj.employee.name)
                else:
                    row += 3
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
                    row += 2
            col = 3

        worksheet1.write(row + 2, 3, "Grand Total", text12)
        worksheet1.write(row + 2, 6, len(p1), text12)

    except:
        pass

    try:

        p = (
            data.filter(status="S2Manager", completion="ECompleted")
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
                        col += 2
                        worksheet1.write(row, col, obj.total1, bold)
                        col -= 1
                        row += 1
                        worksheet1.write(row, col, obj.employee.name)
                else:
                    row += 3
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
                    row += 2
            col = 3

        worksheet1.write(row + 2, 3, "Grand Total", text12)
        worksheet1.write(row + 2, 6, len(p1), text12)

    except:
        pass

    try:

        p = (
            data.filter(status="Approved", completion="MCompleted")
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
                        col += 2
                        worksheet1.write(row, col, obj.total1, bold)
                        col -= 1
                        row += 1
                        worksheet1.write(row, col, obj.employee.name)
                else:
                    row += 3
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
                    row += 2
            col = 3

        worksheet1.write(row + 2, 3, "Grand Total", text12)
        worksheet1.write(row + 2, 6, len(p1), text12)

    except:
        pass

    try:

        p = (
            data.filter(status="Approved", completion="BCompleted")
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
        name = "Board Approved"
        worksheet1 = workbook.add_worksheet("Board Approved")
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
                        col += 2
                        worksheet1.write(row, col, obj.total1, bold)
                        col -= 1
                        row += 1
                        worksheet1.write(row, col, obj.employee.name)
                else:
                    row += 3
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


from backend.Profile.api.serializers import ShortProfileSerializer
from rest_framework.serializers import ModelSerializer


class ReportDataSerializers(ModelSerializer):
    employee = ShortProfileSerializer()

    class Meta:
        model = User_Appraisal_List

        fields = (
            "id",
            "appraisal_name",
            "employee",
        )


@api_view(["GET"])
def get_report_data(request):
    department_list = list(
        map(int, request.query_params.get("department_list", "").split("_")[:-1])
    )
    appraisal_list = list(
        map(int, request.query_params.get("appraisal_list", "").split("_")[:-1])
    )

    data = (
        User_Appraisal_List.objects.prefetch_related("employee__department", "employee")
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

    if appraisal_list is not None or appraisal_list is not []:
        data = data.filter(overall_appraisal_id__in=appraisal_list)

    if department_list != []:
        data = data.filter(employee__department_id__in=department_list)

    return Response(
        data=ReportDataSerializers(data.filter(status="Employee"), many=True).data
    )
