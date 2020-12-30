SELECT pg_catalog.setval('public."Appraisals_appraisal_category_id_seq"', (SELECT MAX(id) FROM "Appraisals_appraisal_category"));
SELECT pg_catalog.setval('public."Appraisals_appraisal_id_seq"',  (SELECT MAX(id) FROM "Appraisals_appraisal"));
SELECT pg_catalog.setval('public."Appraisals_overall_appraisal_id_seq"', (SELECT MAX(id) FROM "Appraisals_overall_appraisal"));
SELECT pg_catalog.setval('public."Appraisals_peerappraisal_id_seq"', (SELECT MAX(id) FROM "Appraisals_peerappraisal"));
SELECT pg_catalog.setval('public."Appraisals_peerappraisalquestion_id_seq"', (SELECT MAX(id) FROM "Appraisals_peerappraisalquestion"));
SELECT pg_catalog.setval('public."Appraisals_rating_scale_id_seq"', (SELECT MAX(id) FROM "Appraisals_rating_scale"));
SELECT pg_catalog.setval('public."Appraisals_user_appraisal_list_id_seq"', (SELECT MAX(id) FROM "Appraisals_user_appraisal_list"));
SELECT pg_catalog.setval('public."GnC_commentbox_id_seq"', (SELECT MAX(id) FROM "GnC_commentbox"));
SELECT pg_catalog.setval('public."GnC_competencies_id_seq"', (SELECT MAX(id) FROM "GnC_competencies"));
SELECT pg_catalog.setval('public."GnC_competencycategory_id_seq"',(SELECT MAX(id) FROM "GnC_competencycategory"));
SELECT pg_catalog.setval('public."GnC_competencycomment_id_seq"', (SELECT MAX(id) FROM "GnC_competencycomment"));
SELECT pg_catalog.setval('public."GnC_departmentalcompetencies_id_seq"', (SELECT MAX(id) FROM "GnC_departmentalcompetencies"));
SELECT pg_catalog.setval('public."GnC_departmentalcompetenciescomment_id_seq"', (SELECT MAX(id) FROM "GnC_departmentalcompetenciescomment"));
SELECT pg_catalog.setval('public."GnC_departmentalgoalcomment_id_seq"', (SELECT MAX(id) FROM "GnC_departmentalgoalcomment"));
SELECT pg_catalog.setval('public."GnC_departmentalgoals_id_seq"', (SELECT MAX(id) FROM "GnC_departmentalgoals"));
SELECT pg_catalog.setval('public."GnC_goalcategory_id_seq"', (SELECT MAX(id) FROM "GnC_goalcategory"));
SELECT pg_catalog.setval('public."GnC_goalcomment_id_seq"', (SELECT MAX(id) FROM "GnC_goalcomment"));
SELECT pg_catalog.setval('public."GnC_goals_id_seq"',(SELECT MAX(id) FROM "GnC_goals"));
SELECT pg_catalog.setval('public."GnC_kpi_id_seq"', (SELECT MAX(id) FROM "GnC_kpi"));
SELECT pg_catalog.setval('public."GnC_midyrcommentbox_id_seq"', (SELECT MAX(id) FROM "GnC_midyrcommentbox"));
SELECT pg_catalog.setval('public."Profile_departments_id_seq"', (SELECT MAX(id) FROM "Profile_departments"));
SELECT pg_catalog.setval('public."Profile_discard_skills_id_seq"', (SELECT MAX(id) FROM "Profile_discard_skills"));
SELECT pg_catalog.setval('public."Profile_profile_id_seq"', (SELECT MAX(id) FROM "Profile_profile"));
SELECT pg_catalog.setval('public."Profile_qualifications_id_seq"',(SELECT MAX(id) FROM "Profile_qualifications"));
SELECT pg_catalog.setval('public."Profile_user_groups_id_seq"', (SELECT MAX(id) FROM "Profile_user_groups"));
SELECT pg_catalog.setval('public."Profile_user_id_seq"', (SELECT MAX(id) FROM "Profile_user"));
SELECT pg_catalog.setval('public."Profile_user_user_permissions_id_seq"', (SELECT MAX(id) FROM "Profile_user_user_permissions"));
SELECT pg_catalog.setval('public."Ticketing_ticket_comments_id_seq"', (SELECT MAX(id) FROM "Ticketing_ticketcomments"));
SELECT pg_catalog.setval('public."Ticketing_ticket_id_seq"', (SELECT MAX(id) FROM "Ticketing_ticket"));
SELECT pg_catalog.setval('public."Trainings_applytrainings_id_seq"', (SELECT MAX(id) FROM "Trainings_applytrainings"));
SELECT pg_catalog.setval('public."Trainings_careerdiscussion_id_seq"', (SELECT MAX(id) FROM "Trainings_careerdiscussion"));
SELECT pg_catalog.setval('public."Trainings_skillcategory_id_seq"', (SELECT MAX(id) FROM "Trainings_skillcategory"));
SELECT pg_catalog.setval('public."Trainings_skills_id_seq"', (SELECT MAX(id) FROM "Trainings_skills"));
SELECT pg_catalog.setval('public."Trainings_surveytrainings_id_seq"', (SELECT MAX(id) FROM "Trainings_surveytrainings"));
SELECT pg_catalog.setval('public."Trainings_trainingcourses_id_seq"', (SELECT MAX(id) FROM "Trainings_trainingcourses"));
SELECT pg_catalog.setval('public."Trainings_trainings_id_seq"', (SELECT MAX(id) FROM "Trainings_trainings"));
SELECT pg_catalog.setval('public.auth_access_token_id_seq', (SELECT MAX(id) FROM "auth_access_token"));
SELECT pg_catalog.setval('public.auth_group_id_seq', (SELECT MAX(id) FROM "auth_group"));
SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', (SELECT MAX(id) FROM "auth_group_permissions"));
SELECT pg_catalog.setval('public.auth_permission_id_seq', (SELECT MAX(id) FROM "auth_permission"));
SELECT pg_catalog.setval('public.auth_refresh_token_id_seq',(SELECT MAX(id) FROM "auth_refresh_token"));
SELECT pg_catalog.setval('public.django_admin_log_id_seq',(SELECT MAX(id) FROM "django_admin_log"));
SELECT pg_catalog.setval('public.django_celery_beat_clockedschedule_id_seq', (SELECT MAX(id) FROM "django_celery_beat_clockedschedule"));
SELECT pg_catalog.setval('public.django_celery_beat_crontabschedule_id_seq', (SELECT MAX(id) FROM "django_celery_beat_crontabschedule"));
SELECT pg_catalog.setval('public.django_celery_beat_intervalschedule_id_seq', (SELECT MAX(id) FROM "django_celery_beat_intervalschedule"));
SELECT pg_catalog.setval('public.django_celery_beat_periodictask_id_seq', (SELECT MAX(id) FROM "django_celery_beat_periodictask"));
SELECT pg_catalog.setval('public.django_celery_beat_solarschedule_id_seq', (SELECT MAX(id) FROM "django_celery_beat_solarschedule"));
SELECT pg_catalog.setval('public.django_content_type_id_seq',(SELECT MAX(id) FROM "django_content_type"));
SELECT pg_catalog.setval('public.django_migrations_id_seq', (SELECT MAX(id) FROM "django_migrations"));
SELECT pg_catalog.setval('public.django_site_id_seq', (SELECT MAX(id) FROM "django_site"));



































