--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1 (Debian 13.1-1.pgdg100+1)
-- Dumped by pg_dump version 13.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Appraisals_appraisal; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Appraisals_appraisal" (
    id integer NOT NULL,
    status character varying(30) NOT NULL,
    created_by_id integer,
    employee_list_id integer,
    manager_id integer,
    rating_scale_id integer,
    user_id integer
);


ALTER TABLE public."Appraisals_appraisal" OWNER TO denselight;

--
-- Name: Appraisals_appraisal_category; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Appraisals_appraisal_category" (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public."Appraisals_appraisal_category" OWNER TO denselight;

--
-- Name: Appraisals_appraisal_category_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Appraisals_appraisal_category_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Appraisals_appraisal_category_id_seq" OWNER TO denselight;

--
-- Name: Appraisals_appraisal_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Appraisals_appraisal_category_id_seq" OWNED BY public."Appraisals_appraisal_category".id;


--
-- Name: Appraisals_appraisal_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Appraisals_appraisal_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Appraisals_appraisal_id_seq" OWNER TO denselight;

--
-- Name: Appraisals_appraisal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Appraisals_appraisal_id_seq" OWNED BY public."Appraisals_appraisal".id;


--
-- Name: Appraisals_overall_appraisal; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Appraisals_overall_appraisal" (
    id integer NOT NULL,
    name character varying(50),
    goal_weightage integer,
    competency_weightage integer,
    skill_weightage integer,
    start_date date NOT NULL,
    goals_setting_end_date date NOT NULL,
    mid_year_start_date date NOT NULL,
    mid_year_end_date date NOT NULL,
    end_year_start_date date NOT NULL,
    appraisal_end_date date NOT NULL,
    reports_end_date date NOT NULL,
    calibration_end_date date NOT NULL,
    rating_scale character varying(50),
    status character varying(100),
    appraisal_category_id integer
);


ALTER TABLE public."Appraisals_overall_appraisal" OWNER TO denselight;

--
-- Name: Appraisals_overall_appraisal_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Appraisals_overall_appraisal_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Appraisals_overall_appraisal_id_seq" OWNER TO denselight;

--
-- Name: Appraisals_overall_appraisal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Appraisals_overall_appraisal_id_seq" OWNED BY public."Appraisals_overall_appraisal".id;


--
-- Name: Appraisals_peerappraisal; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Appraisals_peerappraisal" (
    id integer NOT NULL,
    title1 character varying(200) NOT NULL,
    strength1 character varying(3000),
    weaknessdevelopment1 character varying(3000),
    title2 character varying(200) NOT NULL,
    strength2 character varying(3000),
    weaknessdevelopment2 character varying(3000),
    title3 character varying(200) NOT NULL,
    strength3 character varying(3000),
    weaknessdevelopment3 character varying(3000),
    completion character varying(20),
    appraisal_id integer,
    created_by_id integer,
    manager_id integer,
    viewer_id integer
);


ALTER TABLE public."Appraisals_peerappraisal" OWNER TO denselight;

--
-- Name: Appraisals_peerappraisal_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Appraisals_peerappraisal_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Appraisals_peerappraisal_id_seq" OWNER TO denselight;

--
-- Name: Appraisals_peerappraisal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Appraisals_peerappraisal_id_seq" OWNED BY public."Appraisals_peerappraisal".id;


--
-- Name: Appraisals_peerappraisalquestion; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Appraisals_peerappraisalquestion" (
    id integer NOT NULL,
    title character varying(200),
    answer character varying(1000),
    completed character varying(20),
    appraisal_id integer
);


ALTER TABLE public."Appraisals_peerappraisalquestion" OWNER TO denselight;

--
-- Name: Appraisals_peerappraisalquestion_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Appraisals_peerappraisalquestion_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Appraisals_peerappraisalquestion_id_seq" OWNER TO denselight;

--
-- Name: Appraisals_peerappraisalquestion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Appraisals_peerappraisalquestion_id_seq" OWNED BY public."Appraisals_peerappraisalquestion".id;


--
-- Name: Appraisals_rating_scale; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Appraisals_rating_scale" (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(5000) NOT NULL,
    limiter integer NOT NULL
);


ALTER TABLE public."Appraisals_rating_scale" OWNER TO denselight;

--
-- Name: Appraisals_rating_scale_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Appraisals_rating_scale_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Appraisals_rating_scale_id_seq" OWNER TO denselight;

--
-- Name: Appraisals_rating_scale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Appraisals_rating_scale_id_seq" OWNED BY public."Appraisals_rating_scale".id;


--
-- Name: Appraisals_user_appraisal_list; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Appraisals_user_appraisal_list" (
    id integer NOT NULL,
    status character varying(30) NOT NULL,
    appraisal_name character varying(50),
    overall_board_comments character varying(5000),
    start_date date,
    end_date date,
    completion character varying(50),
    "goals_settingM_rejection" character varying(3000) NOT NULL,
    "mid_yearM_rejection" character varying(3000) NOT NULL,
    "appraisalHR_rejection" character varying(3000) NOT NULL,
    mid_year_completion character varying(15) NOT NULL,
    "incrementRecommendation" integer NOT NULL,
    "bonusRecommendation" character varying(1000) NOT NULL,
    "recommendationComments" character varying(1000) NOT NULL,
    final_employee_rating integer,
    final_manager_rating integer,
    final_board_rating integer,
    appraisal_category_id integer,
    employee_id integer,
    manager_id integer,
    overall_appraisal_id integer,
    "end_yearM_rejection" character varying(3000) DEFAULT 'end year  rejection'::character varying NOT NULL
);


ALTER TABLE public."Appraisals_user_appraisal_list" OWNER TO denselight;

--
-- Name: Appraisals_user_appraisal_list_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Appraisals_user_appraisal_list_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Appraisals_user_appraisal_list_id_seq" OWNER TO denselight;

--
-- Name: Appraisals_user_appraisal_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Appraisals_user_appraisal_list_id_seq" OWNED BY public."Appraisals_user_appraisal_list".id;


--
-- Name: GnC_commentbox; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."GnC_commentbox" (
    id integer NOT NULL,
    comment text,
    created_on timestamp with time zone NOT NULL,
    created_by_id integer,
    goal_id integer NOT NULL
);


ALTER TABLE public."GnC_commentbox" OWNER TO denselight;

--
-- Name: GnC_commentbox_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."GnC_commentbox_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GnC_commentbox_id_seq" OWNER TO denselight;

--
-- Name: GnC_commentbox_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."GnC_commentbox_id_seq" OWNED BY public."GnC_commentbox".id;


--
-- Name: GnC_competencies; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."GnC_competencies" (
    id integer NOT NULL,
    summary character varying(1500) NOT NULL,
    description text,
    weightage integer NOT NULL,
    user_rating integer NOT NULL,
    manager_rating integer NOT NULL,
    board_rating integer NOT NULL,
    user_comments character varying(2000) NOT NULL,
    manager_comments character varying(2000) NOT NULL,
    board_comments character varying(2000) NOT NULL,
    appraisal_id integer,
    competency_category_id integer,
    employee_id integer
);


ALTER TABLE public."GnC_competencies" OWNER TO denselight;

--
-- Name: GnC_competencies_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."GnC_competencies_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GnC_competencies_id_seq" OWNER TO denselight;

--
-- Name: GnC_competencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."GnC_competencies_id_seq" OWNED BY public."GnC_competencies".id;


--
-- Name: GnC_competencycategory; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."GnC_competencycategory" (
    id integer NOT NULL,
    name character varying(1000),
    description text
);


ALTER TABLE public."GnC_competencycategory" OWNER TO denselight;

--
-- Name: GnC_competencycategory_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."GnC_competencycategory_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GnC_competencycategory_id_seq" OWNER TO denselight;

--
-- Name: GnC_competencycategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."GnC_competencycategory_id_seq" OWNED BY public."GnC_competencycategory".id;


--
-- Name: GnC_competencycomment; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."GnC_competencycomment" (
    id integer NOT NULL,
    comments text,
    created_on timestamp with time zone NOT NULL,
    competency_id integer NOT NULL,
    created_by_id integer
);


ALTER TABLE public."GnC_competencycomment" OWNER TO denselight;

--
-- Name: GnC_competencycomment_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."GnC_competencycomment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GnC_competencycomment_id_seq" OWNER TO denselight;

--
-- Name: GnC_competencycomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."GnC_competencycomment_id_seq" OWNED BY public."GnC_competencycomment".id;


--
-- Name: GnC_departmentalcompetencies; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."GnC_departmentalcompetencies" (
    id integer NOT NULL,
    summary text,
    description text,
    appraisal_id integer,
    competency_category_id integer,
    department_id integer,
    manager_id integer
);


ALTER TABLE public."GnC_departmentalcompetencies" OWNER TO denselight;

--
-- Name: GnC_departmentalcompetencies_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."GnC_departmentalcompetencies_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GnC_departmentalcompetencies_id_seq" OWNER TO denselight;

--
-- Name: GnC_departmentalcompetencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."GnC_departmentalcompetencies_id_seq" OWNED BY public."GnC_departmentalcompetencies".id;


--
-- Name: GnC_departmentalcompetenciescomment; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."GnC_departmentalcompetenciescomment" (
    id integer NOT NULL,
    comments text,
    created_on timestamp with time zone NOT NULL,
    created_by_id integer,
    departmental_competencies_id integer NOT NULL
);


ALTER TABLE public."GnC_departmentalcompetenciescomment" OWNER TO denselight;

--
-- Name: GnC_departmentalcompetenciescomment_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."GnC_departmentalcompetenciescomment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GnC_departmentalcompetenciescomment_id_seq" OWNER TO denselight;

--
-- Name: GnC_departmentalcompetenciescomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."GnC_departmentalcompetenciescomment_id_seq" OWNED BY public."GnC_departmentalcompetenciescomment".id;


--
-- Name: GnC_departmentalgoalcomment; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."GnC_departmentalgoalcomment" (
    id integer NOT NULL,
    comments text,
    created_on timestamp with time zone NOT NULL,
    created_by_id integer,
    departmental_goal_id integer NOT NULL
);


ALTER TABLE public."GnC_departmentalgoalcomment" OWNER TO denselight;

--
-- Name: GnC_departmentalgoalcomment_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."GnC_departmentalgoalcomment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GnC_departmentalgoalcomment_id_seq" OWNER TO denselight;

--
-- Name: GnC_departmentalgoalcomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."GnC_departmentalgoalcomment_id_seq" OWNED BY public."GnC_departmentalgoalcomment".id;


--
-- Name: GnC_departmentalgoals; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."GnC_departmentalgoals" (
    id integer NOT NULL,
    summary text,
    description text,
    due date NOT NULL,
    appraisal_id integer,
    department_id integer,
    goal_category_id integer,
    manager_id integer
);


ALTER TABLE public."GnC_departmentalgoals" OWNER TO denselight;

--
-- Name: GnC_departmentalgoals_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."GnC_departmentalgoals_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GnC_departmentalgoals_id_seq" OWNER TO denselight;

--
-- Name: GnC_departmentalgoals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."GnC_departmentalgoals_id_seq" OWNED BY public."GnC_departmentalgoals".id;


--
-- Name: GnC_endyrcommentbox; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."GnC_endyrcommentbox" (
    id integer NOT NULL,
    comment text,
    created_on timestamp with time zone NOT NULL,
    created_by_id integer,
    goal_id integer NOT NULL
);


ALTER TABLE public."GnC_endyrcommentbox" OWNER TO denselight;

--
-- Name: GnC_endyrcommentbox_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."GnC_endyrcommentbox_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GnC_endyrcommentbox_id_seq" OWNER TO denselight;

--
-- Name: GnC_endyrcommentbox_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."GnC_endyrcommentbox_id_seq" OWNED BY public."GnC_endyrcommentbox".id;


--
-- Name: GnC_goalcategory; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."GnC_goalcategory" (
    id integer NOT NULL,
    name character varying(70) NOT NULL
);


ALTER TABLE public."GnC_goalcategory" OWNER TO denselight;

--
-- Name: GnC_goalcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."GnC_goalcategory_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GnC_goalcategory_id_seq" OWNER TO denselight;

--
-- Name: GnC_goalcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."GnC_goalcategory_id_seq" OWNED BY public."GnC_goalcategory".id;


--
-- Name: GnC_goalcomment; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."GnC_goalcomment" (
    id integer NOT NULL,
    comments text,
    created_on timestamp with time zone NOT NULL,
    created_by_id integer,
    goal_id integer NOT NULL
);


ALTER TABLE public."GnC_goalcomment" OWNER TO denselight;

--
-- Name: GnC_goalcomment_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."GnC_goalcomment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GnC_goalcomment_id_seq" OWNER TO denselight;

--
-- Name: GnC_goalcomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."GnC_goalcomment_id_seq" OWNED BY public."GnC_goalcomment".id;


--
-- Name: GnC_goals; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."GnC_goals" (
    id integer NOT NULL,
    summary text,
    description text,
    due date NOT NULL,
    weightage integer NOT NULL,
    "metrics_Used" text,
    "MID_user_comments" text NOT NULL,
    "MID_manager_comments" text NOT NULL,
    user_rating integer NOT NULL,
    manager_rating integer NOT NULL,
    board_rating integer NOT NULL,
    user_comments character varying(2000) NOT NULL,
    manager_comments character varying(2000) NOT NULL,
    board_comments character varying(2000) NOT NULL,
    tracking_status character varying(50),
    metrics_evidence character varying(100),
    appraisal_id integer,
    employee_id integer,
    goal_category_id integer,
    status character varying(100),
    goal_employees_comment text,
    goal_manager_comment text
);


ALTER TABLE public."GnC_goals" OWNER TO denselight;

--
-- Name: GnC_goals_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."GnC_goals_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GnC_goals_id_seq" OWNER TO denselight;

--
-- Name: GnC_goals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."GnC_goals_id_seq" OWNED BY public."GnC_goals".id;


--
-- Name: GnC_kpi; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."GnC_kpi" (
    id integer NOT NULL,
    description text,
    due date,
    date_created date,
    progress character varying(20) NOT NULL,
    goal_id integer NOT NULL
);


ALTER TABLE public."GnC_kpi" OWNER TO denselight;

--
-- Name: GnC_kpi_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."GnC_kpi_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GnC_kpi_id_seq" OWNER TO denselight;

--
-- Name: GnC_kpi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."GnC_kpi_id_seq" OWNED BY public."GnC_kpi".id;


--
-- Name: GnC_midyrcommentbox; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."GnC_midyrcommentbox" (
    id integer NOT NULL,
    comment text,
    created_on timestamp with time zone NOT NULL,
    created_by_id integer,
    goal_id integer NOT NULL
);


ALTER TABLE public."GnC_midyrcommentbox" OWNER TO denselight;

--
-- Name: GnC_midyrcommentbox_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."GnC_midyrcommentbox_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GnC_midyrcommentbox_id_seq" OWNER TO denselight;

--
-- Name: GnC_midyrcommentbox_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."GnC_midyrcommentbox_id_seq" OWNED BY public."GnC_midyrcommentbox".id;


--
-- Name: Profile_departments; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Profile_departments" (
    id integer NOT NULL,
    name character varying(100),
    manager_id integer
);


ALTER TABLE public."Profile_departments" OWNER TO denselight;

--
-- Name: Profile_departments_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Profile_departments_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Profile_departments_id_seq" OWNER TO denselight;

--
-- Name: Profile_departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Profile_departments_id_seq" OWNED BY public."Profile_departments".id;


--
-- Name: Profile_discard_skills; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Profile_discard_skills" (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    "course_Attended" character varying(150)
);


ALTER TABLE public."Profile_discard_skills" OWNER TO denselight;

--
-- Name: Profile_discard_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Profile_discard_skills_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Profile_discard_skills_id_seq" OWNER TO denselight;

--
-- Name: Profile_discard_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Profile_discard_skills_id_seq" OWNED BY public."Profile_discard_skills".id;


--
-- Name: Profile_guide; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Profile_guide" (
    id integer NOT NULL,
    title character varying(300) NOT NULL,
    thumbnail character varying(100),
    video character varying(100),
    description text
);


ALTER TABLE public."Profile_guide" OWNER TO denselight;

--
-- Name: Profile_guide_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Profile_guide_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Profile_guide_id_seq" OWNER TO denselight;

--
-- Name: Profile_guide_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Profile_guide_id_seq" OWNED BY public."Profile_guide".id;


--
-- Name: Profile_notification; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Profile_notification" (
    id integer NOT NULL,
    title character varying(100),
    description text,
    color character varying(20),
    seen boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public."Profile_notification" OWNER TO denselight;

--
-- Name: Profile_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Profile_notification_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Profile_notification_id_seq" OWNER TO denselight;

--
-- Name: Profile_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Profile_notification_id_seq" OWNED BY public."Profile_notification".id;


--
-- Name: Profile_profile; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Profile_profile" (
    id integer NOT NULL,
    "profile_Picture" character varying(100),
    name character varying(200) NOT NULL,
    "employee_ID" character varying(15) NOT NULL,
    nric character varying(20),
    "typeOfEmployee" character varying(50) NOT NULL,
    email character varying(254) NOT NULL,
    gender character varying(6) NOT NULL,
    address_1 character varying(250),
    address_2 character varying(250),
    "date_Of_Passport_Expiry" date,
    "citizenship_Status" character varying(70) NOT NULL,
    "date_Of_Hire" date NOT NULL,
    "job_Title" character varying(100) NOT NULL,
    "employment_Type" character varying(30) NOT NULL,
    skill1 character varying(50),
    skill2 character varying(50),
    skill3 character varying(50),
    "division_Centre" character varying(150),
    phone character varying(50),
    department_id integer,
    "first_Reporting_Manager_id" integer,
    user_id integer,
    "second_Reporting_Manager_id" integer
);


ALTER TABLE public."Profile_profile" OWNER TO denselight;

--
-- Name: Profile_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Profile_profile_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Profile_profile_id_seq" OWNER TO denselight;

--
-- Name: Profile_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Profile_profile_id_seq" OWNED BY public."Profile_profile".id;


--
-- Name: Profile_qualifications; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Profile_qualifications" (
    id integer NOT NULL,
    institution character varying(150),
    name character varying(150) NOT NULL,
    graduation_year integer,
    employee_id integer
);


ALTER TABLE public."Profile_qualifications" OWNER TO denselight;

--
-- Name: Profile_qualifications_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Profile_qualifications_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Profile_qualifications_id_seq" OWNER TO denselight;

--
-- Name: Profile_qualifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Profile_qualifications_id_seq" OWNED BY public."Profile_qualifications".id;


--
-- Name: Profile_resetpasswordtoken; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Profile_resetpasswordtoken" (
    id integer NOT NULL,
    token character varying(10) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public."Profile_resetpasswordtoken" OWNER TO denselight;

--
-- Name: Profile_resetpasswordtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Profile_resetpasswordtoken_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Profile_resetpasswordtoken_id_seq" OWNER TO denselight;

--
-- Name: Profile_resetpasswordtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Profile_resetpasswordtoken_id_seq" OWNED BY public."Profile_resetpasswordtoken".id;


--
-- Name: Profile_user; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Profile_user" (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    first_name character varying(50),
    username character varying(50) NOT NULL,
    last_name character varying(50),
    email character varying(254) NOT NULL,
    is_active boolean NOT NULL,
    is_admin boolean NOT NULL,
    is_superuser boolean NOT NULL,
    is_email_verified boolean DEFAULT false,
    date_joined timestamp with time zone NOT NULL,
    dummy_password character varying(10),
    role character varying(20)
);


ALTER TABLE public."Profile_user" OWNER TO denselight;

--
-- Name: Profile_user_groups; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Profile_user_groups" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public."Profile_user_groups" OWNER TO denselight;

--
-- Name: Profile_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Profile_user_groups_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Profile_user_groups_id_seq" OWNER TO denselight;

--
-- Name: Profile_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Profile_user_groups_id_seq" OWNED BY public."Profile_user_groups".id;


--
-- Name: Profile_user_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Profile_user_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Profile_user_id_seq" OWNER TO denselight;

--
-- Name: Profile_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Profile_user_id_seq" OWNED BY public."Profile_user".id;


--
-- Name: Profile_user_user_permissions; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Profile_user_user_permissions" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public."Profile_user_user_permissions" OWNER TO denselight;

--
-- Name: Profile_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Profile_user_user_permissions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Profile_user_user_permissions_id_seq" OWNER TO denselight;

--
-- Name: Profile_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Profile_user_user_permissions_id_seq" OWNED BY public."Profile_user_user_permissions".id;


--
-- Name: Ticketing_ticket; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Ticketing_ticket" (
    id integer NOT NULL,
    category character varying(30) NOT NULL,
    title character varying(50) NOT NULL,
    description character varying(5000),
    status character varying(50) NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public."Ticketing_ticket" OWNER TO denselight;

--
-- Name: Ticketing_ticketcomments; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Ticketing_ticketcomments" (
    id integer NOT NULL,
    comment character varying(500) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    ticket_id integer,
    user_id integer NOT NULL
);


ALTER TABLE public."Ticketing_ticketcomments" OWNER TO denselight;

--
-- Name: Ticketing_ticket_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Ticketing_ticket_comments_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ticketing_ticket_comments_id_seq" OWNER TO denselight;

--
-- Name: Ticketing_ticket_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Ticketing_ticket_comments_id_seq" OWNED BY public."Ticketing_ticketcomments".id;


--
-- Name: Ticketing_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Ticketing_ticket_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ticketing_ticket_id_seq" OWNER TO denselight;

--
-- Name: Ticketing_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Ticketing_ticket_id_seq" OWNED BY public."Ticketing_ticket".id;


--
-- Name: Trainings_applytrainings; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Trainings_applytrainings" (
    id integer NOT NULL,
    status character varying(50) NOT NULL,
    date_start date,
    date_end date,
    approved_by character varying(200),
    employee_id integer,
    training_id integer
);


ALTER TABLE public."Trainings_applytrainings" OWNER TO denselight;

--
-- Name: Trainings_applytrainings_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Trainings_applytrainings_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Trainings_applytrainings_id_seq" OWNER TO denselight;

--
-- Name: Trainings_applytrainings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Trainings_applytrainings_id_seq" OWNED BY public."Trainings_applytrainings".id;


--
-- Name: Trainings_careerdiscussion; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Trainings_careerdiscussion" (
    id integer NOT NULL,
    "Q1" character varying(5000) NOT NULL,
    "Q2" character varying(5000) NOT NULL,
    "Q3" character varying(5000) NOT NULL,
    "Q4" character varying(5000) NOT NULL,
    "Q5" character varying(5000) NOT NULL,
    "Q6" character varying(5000) NOT NULL,
    "Q7" character varying(5000) NOT NULL,
    "Q8" character varying(5000) NOT NULL,
    employee_id integer NOT NULL,
    user_appraisal_id integer NOT NULL
);


ALTER TABLE public."Trainings_careerdiscussion" OWNER TO denselight;

--
-- Name: Trainings_careerdiscussion_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Trainings_careerdiscussion_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Trainings_careerdiscussion_id_seq" OWNER TO denselight;

--
-- Name: Trainings_careerdiscussion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Trainings_careerdiscussion_id_seq" OWNED BY public."Trainings_careerdiscussion".id;


--
-- Name: Trainings_skillcategory; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Trainings_skillcategory" (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public."Trainings_skillcategory" OWNER TO denselight;

--
-- Name: Trainings_skillcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Trainings_skillcategory_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Trainings_skillcategory_id_seq" OWNER TO denselight;

--
-- Name: Trainings_skillcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Trainings_skillcategory_id_seq" OWNED BY public."Trainings_skillcategory".id;


--
-- Name: Trainings_skills; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Trainings_skills" (
    id integer NOT NULL,
    description character varying(1000),
    weightage integer NOT NULL,
    "recommended_Trainings_user" character varying(1000) NOT NULL,
    "recommended_Trainings_manager" character varying(1000) NOT NULL,
    "recommended_Trainings_board" character varying(1000) NOT NULL,
    user_rating integer NOT NULL,
    manager_rating integer NOT NULL,
    board_rating integer NOT NULL,
    user_comments character varying(2000) NOT NULL,
    manager_comments character varying(2000) NOT NULL,
    board_comments character varying(2000) NOT NULL,
    appraisal_id integer,
    employee_id integer,
    skill_category_id integer
);


ALTER TABLE public."Trainings_skills" OWNER TO denselight;

--
-- Name: Trainings_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Trainings_skills_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Trainings_skills_id_seq" OWNER TO denselight;

--
-- Name: Trainings_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Trainings_skills_id_seq" OWNED BY public."Trainings_skills".id;


--
-- Name: Trainings_surveytrainings; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Trainings_surveytrainings" (
    id integer NOT NULL,
    objectives_met integer NOT NULL,
    content_design integer NOT NULL,
    trainer_knowledge integer NOT NULL,
    training_relevance integer NOT NULL,
    recommend_training integer NOT NULL,
    training_id integer
);


ALTER TABLE public."Trainings_surveytrainings" OWNER TO denselight;

--
-- Name: Trainings_surveytrainings_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Trainings_surveytrainings_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Trainings_surveytrainings_id_seq" OWNER TO denselight;

--
-- Name: Trainings_surveytrainings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Trainings_surveytrainings_id_seq" OWNED BY public."Trainings_surveytrainings".id;


--
-- Name: Trainings_trainingcourses; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Trainings_trainingcourses" (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    provider character varying(150),
    cost double precision,
    ratings double precision,
    skill_category_id integer
);


ALTER TABLE public."Trainings_trainingcourses" OWNER TO denselight;

--
-- Name: Trainings_trainingcourses_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Trainings_trainingcourses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Trainings_trainingcourses_id_seq" OWNER TO denselight;

--
-- Name: Trainings_trainingcourses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Trainings_trainingcourses_id_seq" OWNED BY public."Trainings_trainingcourses".id;


--
-- Name: Trainings_trainings; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public."Trainings_trainings" (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    provider character varying(150),
    cost double precision,
    ratings double precision,
    skill_category_id integer
);


ALTER TABLE public."Trainings_trainings" OWNER TO denselight;

--
-- Name: Trainings_trainings_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public."Trainings_trainings_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Trainings_trainings_id_seq" OWNER TO denselight;

--
-- Name: Trainings_trainings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public."Trainings_trainings_id_seq" OWNED BY public."Trainings_trainings".id;


--
-- Name: auth_access_token; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public.auth_access_token (
    id integer NOT NULL,
    token character varying(128) NOT NULL,
    expires timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer
);


ALTER TABLE public.auth_access_token OWNER TO denselight;

--
-- Name: auth_access_token_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public.auth_access_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_access_token_id_seq OWNER TO denselight;

--
-- Name: auth_access_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public.auth_access_token_id_seq OWNED BY public.auth_access_token.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO denselight;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO denselight;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO denselight;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO denselight;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO denselight;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO denselight;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_refresh_token; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public.auth_refresh_token (
    id integer NOT NULL,
    token character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    revoked timestamp with time zone,
    access_token_id integer,
    user_id integer
);


ALTER TABLE public.auth_refresh_token OWNER TO denselight;

--
-- Name: auth_refresh_token_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public.auth_refresh_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_refresh_token_id_seq OWNER TO denselight;

--
-- Name: auth_refresh_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public.auth_refresh_token_id_seq OWNED BY public.auth_refresh_token.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO denselight;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO denselight;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_celery_beat_clockedschedule; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public.django_celery_beat_clockedschedule (
    id integer NOT NULL,
    clocked_time timestamp with time zone NOT NULL,
    enabled boolean NOT NULL
);


ALTER TABLE public.django_celery_beat_clockedschedule OWNER TO denselight;

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public.django_celery_beat_clockedschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_clockedschedule_id_seq OWNER TO denselight;

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public.django_celery_beat_clockedschedule_id_seq OWNED BY public.django_celery_beat_clockedschedule.id;


--
-- Name: django_celery_beat_crontabschedule; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public.django_celery_beat_crontabschedule (
    id integer NOT NULL,
    minute character varying(240) NOT NULL,
    hour character varying(96) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(124) NOT NULL,
    month_of_year character varying(64) NOT NULL,
    timezone character varying(63) NOT NULL
);


ALTER TABLE public.django_celery_beat_crontabschedule OWNER TO denselight;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public.django_celery_beat_crontabschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_crontabschedule_id_seq OWNER TO denselight;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public.django_celery_beat_crontabschedule_id_seq OWNED BY public.django_celery_beat_crontabschedule.id;


--
-- Name: django_celery_beat_intervalschedule; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public.django_celery_beat_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);


ALTER TABLE public.django_celery_beat_intervalschedule OWNER TO denselight;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public.django_celery_beat_intervalschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_intervalschedule_id_seq OWNER TO denselight;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public.django_celery_beat_intervalschedule_id_seq OWNED BY public.django_celery_beat_intervalschedule.id;


--
-- Name: django_celery_beat_periodictask; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public.django_celery_beat_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    crontab_id integer,
    interval_id integer,
    solar_id integer,
    one_off boolean NOT NULL,
    start_time timestamp with time zone,
    priority integer,
    headers text NOT NULL,
    clocked_id integer,
    expire_seconds integer,
    CONSTRAINT django_celery_beat_periodictask_expire_seconds_check CHECK ((expire_seconds >= 0)),
    CONSTRAINT django_celery_beat_periodictask_priority_check CHECK ((priority >= 0)),
    CONSTRAINT django_celery_beat_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);


ALTER TABLE public.django_celery_beat_periodictask OWNER TO denselight;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public.django_celery_beat_periodictask_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_periodictask_id_seq OWNER TO denselight;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public.django_celery_beat_periodictask_id_seq OWNED BY public.django_celery_beat_periodictask.id;


--
-- Name: django_celery_beat_periodictasks; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public.django_celery_beat_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_periodictasks OWNER TO denselight;

--
-- Name: django_celery_beat_solarschedule; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public.django_celery_beat_solarschedule (
    id integer NOT NULL,
    event character varying(24) NOT NULL,
    latitude numeric(9,6) NOT NULL,
    longitude numeric(9,6) NOT NULL
);


ALTER TABLE public.django_celery_beat_solarschedule OWNER TO denselight;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public.django_celery_beat_solarschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_solarschedule_id_seq OWNER TO denselight;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public.django_celery_beat_solarschedule_id_seq OWNED BY public.django_celery_beat_solarschedule.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO denselight;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO denselight;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO denselight;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO denselight;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO denselight;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: denselight
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO denselight;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: denselight
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO denselight;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denselight
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: Appraisals_appraisal id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_appraisal" ALTER COLUMN id SET DEFAULT nextval('public."Appraisals_appraisal_id_seq"'::regclass);


--
-- Name: Appraisals_appraisal_category id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_appraisal_category" ALTER COLUMN id SET DEFAULT nextval('public."Appraisals_appraisal_category_id_seq"'::regclass);


--
-- Name: Appraisals_overall_appraisal id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_overall_appraisal" ALTER COLUMN id SET DEFAULT nextval('public."Appraisals_overall_appraisal_id_seq"'::regclass);


--
-- Name: Appraisals_peerappraisal id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_peerappraisal" ALTER COLUMN id SET DEFAULT nextval('public."Appraisals_peerappraisal_id_seq"'::regclass);


--
-- Name: Appraisals_peerappraisalquestion id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_peerappraisalquestion" ALTER COLUMN id SET DEFAULT nextval('public."Appraisals_peerappraisalquestion_id_seq"'::regclass);


--
-- Name: Appraisals_rating_scale id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_rating_scale" ALTER COLUMN id SET DEFAULT nextval('public."Appraisals_rating_scale_id_seq"'::regclass);


--
-- Name: Appraisals_user_appraisal_list id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_user_appraisal_list" ALTER COLUMN id SET DEFAULT nextval('public."Appraisals_user_appraisal_list_id_seq"'::regclass);


--
-- Name: GnC_commentbox id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_commentbox" ALTER COLUMN id SET DEFAULT nextval('public."GnC_commentbox_id_seq"'::regclass);


--
-- Name: GnC_competencies id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_competencies" ALTER COLUMN id SET DEFAULT nextval('public."GnC_competencies_id_seq"'::regclass);


--
-- Name: GnC_competencycategory id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_competencycategory" ALTER COLUMN id SET DEFAULT nextval('public."GnC_competencycategory_id_seq"'::regclass);


--
-- Name: GnC_competencycomment id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_competencycomment" ALTER COLUMN id SET DEFAULT nextval('public."GnC_competencycomment_id_seq"'::regclass);


--
-- Name: GnC_departmentalcompetencies id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_departmentalcompetencies" ALTER COLUMN id SET DEFAULT nextval('public."GnC_departmentalcompetencies_id_seq"'::regclass);


--
-- Name: GnC_departmentalcompetenciescomment id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_departmentalcompetenciescomment" ALTER COLUMN id SET DEFAULT nextval('public."GnC_departmentalcompetenciescomment_id_seq"'::regclass);


--
-- Name: GnC_departmentalgoalcomment id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_departmentalgoalcomment" ALTER COLUMN id SET DEFAULT nextval('public."GnC_departmentalgoalcomment_id_seq"'::regclass);


--
-- Name: GnC_departmentalgoals id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_departmentalgoals" ALTER COLUMN id SET DEFAULT nextval('public."GnC_departmentalgoals_id_seq"'::regclass);


--
-- Name: GnC_endyrcommentbox id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_endyrcommentbox" ALTER COLUMN id SET DEFAULT nextval('public."GnC_endyrcommentbox_id_seq"'::regclass);


--
-- Name: GnC_goalcategory id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_goalcategory" ALTER COLUMN id SET DEFAULT nextval('public."GnC_goalcategory_id_seq"'::regclass);


--
-- Name: GnC_goalcomment id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_goalcomment" ALTER COLUMN id SET DEFAULT nextval('public."GnC_goalcomment_id_seq"'::regclass);


--
-- Name: GnC_goals id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_goals" ALTER COLUMN id SET DEFAULT nextval('public."GnC_goals_id_seq"'::regclass);


--
-- Name: GnC_kpi id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_kpi" ALTER COLUMN id SET DEFAULT nextval('public."GnC_kpi_id_seq"'::regclass);


--
-- Name: GnC_midyrcommentbox id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_midyrcommentbox" ALTER COLUMN id SET DEFAULT nextval('public."GnC_midyrcommentbox_id_seq"'::regclass);


--
-- Name: Profile_departments id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_departments" ALTER COLUMN id SET DEFAULT nextval('public."Profile_departments_id_seq"'::regclass);


--
-- Name: Profile_discard_skills id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_discard_skills" ALTER COLUMN id SET DEFAULT nextval('public."Profile_discard_skills_id_seq"'::regclass);


--
-- Name: Profile_guide id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_guide" ALTER COLUMN id SET DEFAULT nextval('public."Profile_guide_id_seq"'::regclass);


--
-- Name: Profile_notification id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_notification" ALTER COLUMN id SET DEFAULT nextval('public."Profile_notification_id_seq"'::regclass);


--
-- Name: Profile_profile id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_profile" ALTER COLUMN id SET DEFAULT nextval('public."Profile_profile_id_seq"'::regclass);


--
-- Name: Profile_qualifications id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_qualifications" ALTER COLUMN id SET DEFAULT nextval('public."Profile_qualifications_id_seq"'::regclass);


--
-- Name: Profile_resetpasswordtoken id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_resetpasswordtoken" ALTER COLUMN id SET DEFAULT nextval('public."Profile_resetpasswordtoken_id_seq"'::regclass);


--
-- Name: Profile_user id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_user" ALTER COLUMN id SET DEFAULT nextval('public."Profile_user_id_seq"'::regclass);


--
-- Name: Profile_user_groups id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_user_groups" ALTER COLUMN id SET DEFAULT nextval('public."Profile_user_groups_id_seq"'::regclass);


--
-- Name: Profile_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_user_user_permissions" ALTER COLUMN id SET DEFAULT nextval('public."Profile_user_user_permissions_id_seq"'::regclass);


--
-- Name: Ticketing_ticket id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Ticketing_ticket" ALTER COLUMN id SET DEFAULT nextval('public."Ticketing_ticket_id_seq"'::regclass);


--
-- Name: Ticketing_ticketcomments id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Ticketing_ticketcomments" ALTER COLUMN id SET DEFAULT nextval('public."Ticketing_ticket_comments_id_seq"'::regclass);


--
-- Name: Trainings_applytrainings id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_applytrainings" ALTER COLUMN id SET DEFAULT nextval('public."Trainings_applytrainings_id_seq"'::regclass);


--
-- Name: Trainings_careerdiscussion id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_careerdiscussion" ALTER COLUMN id SET DEFAULT nextval('public."Trainings_careerdiscussion_id_seq"'::regclass);


--
-- Name: Trainings_skillcategory id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_skillcategory" ALTER COLUMN id SET DEFAULT nextval('public."Trainings_skillcategory_id_seq"'::regclass);


--
-- Name: Trainings_skills id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_skills" ALTER COLUMN id SET DEFAULT nextval('public."Trainings_skills_id_seq"'::regclass);


--
-- Name: Trainings_surveytrainings id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_surveytrainings" ALTER COLUMN id SET DEFAULT nextval('public."Trainings_surveytrainings_id_seq"'::regclass);


--
-- Name: Trainings_trainingcourses id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_trainingcourses" ALTER COLUMN id SET DEFAULT nextval('public."Trainings_trainingcourses_id_seq"'::regclass);


--
-- Name: Trainings_trainings id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_trainings" ALTER COLUMN id SET DEFAULT nextval('public."Trainings_trainings_id_seq"'::regclass);


--
-- Name: auth_access_token id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.auth_access_token ALTER COLUMN id SET DEFAULT nextval('public.auth_access_token_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_refresh_token id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.auth_refresh_token ALTER COLUMN id SET DEFAULT nextval('public.auth_refresh_token_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_celery_beat_clockedschedule id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_clockedschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_crontabschedule id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_crontabschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_intervalschedule id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_intervalschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_periodictask id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_celery_beat_periodictask ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_periodictask_id_seq'::regclass);


--
-- Name: django_celery_beat_solarschedule id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_solarschedule_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Data for Name: Appraisals_appraisal; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Appraisals_appraisal" (id, status, created_by_id, employee_list_id, manager_id, rating_scale_id, user_id) FROM stdin;
\.


--
-- Data for Name: Appraisals_appraisal_category; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Appraisals_appraisal_category" (id, name) FROM stdin;
1	1st Quarter
2	2nd Quarter
3	3rd Quarter
4	4th Quarter
5	Start Of Year
6	End Of Year
\.


--
-- Data for Name: Appraisals_overall_appraisal; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Appraisals_overall_appraisal" (id, name, goal_weightage, competency_weightage, skill_weightage, start_date, goals_setting_end_date, mid_year_start_date, mid_year_end_date, end_year_start_date, appraisal_end_date, reports_end_date, calibration_end_date, rating_scale, status, appraisal_category_id) FROM stdin;
56	ads	\N	\N	\N	2020-12-21	2020-12-21	2020-12-21	2020-12-21	2020-12-21	2020-12-21	2020-12-21	2020-12-21	Denselight System	\N	5
32	2020 Performance Appraisal - David Chin	100	0	0	2020-09-01	2020-09-30	2020-10-01	2020-10-31	2021-01-01	2021-01-31	2021-02-01	2021-02-05	Denselight System	Stage 1B	3
29	2020 Performance Appraisal - Lam Yee Loy	100	0	0	2020-09-01	2020-09-30	2020-10-01	2020-10-31	2021-01-01	2021-01-31	2021-02-01	2021-02-05	Denselight System	Stage 1B	3
33	2020 Performance Appraisal - Andy Piper	100	0	0	2020-09-01	2020-09-30	2020-10-01	2020-10-31	2021-01-01	2021-01-31	2021-02-01	2021-02-05	Denselight System	Stage 1B	3
35	2020 Performance Appraisal - Chan TK	100	0	0	2020-09-01	2020-09-30	2020-10-01	2020-10-31	2021-01-01	2021-01-31	2021-02-01	2021-02-05	Denselight System	Stage 1B	3
30	2020 Performance Appraisal - Chan Bor Shen	100	0	0	2020-09-01	2020-09-30	2020-10-01	2020-10-31	2021-01-01	2021-01-31	2021-02-01	2021-02-05	Denselight System	Stage 1B	3
31	2020 Performance Appraisal - Soma Sankaran	100	0	0	2020-09-01	2020-09-30	2020-10-01	2020-10-31	2021-01-01	2021-01-31	2021-02-01	2021-02-05	Denselight System	Stage 1B	3
50	doo	100	0	0	2020-11-27	2020-11-27	2020-11-27	2020-11-27	2020-11-27	2020-11-27	2020-11-27	2020-11-27	Denselight System	Stage 1	1
51	dense	100	0	0	2020-11-27	2020-11-27	2020-11-27	2020-11-27	2020-11-27	2020-11-27	2020-11-27	2020-11-27	Denselight System	Stage 1B	1
21	2020 Performance Appraisal	100	0	0	2020-09-01	2020-09-30	2020-11-30	2020-12-15	2021-01-01	2021-01-31	2021-02-15	2021-03-01	Denselight System	Stage 1B	3
36	2020 Performance Appraisal - Kevin Yang	100	0	0	2020-09-01	2020-09-30	2020-10-01	2020-10-31	2021-01-01	2021-01-31	2021-02-01	2021-02-05	Denselight System	Stage 1	3
49	goodone	100	0	0	2020-11-27	2020-11-27	2020-11-27	2020-11-27	2020-11-27	2020-11-27	2020-11-27	2020-11-27	Denselight System	Stage 1B	1
34	2020 Performance Appraisal - Chivukula Subrahmanya	100	0	0	2020-09-01	2020-09-30	2020-10-01	2020-10-31	2021-01-01	2021-01-31	2021-02-01	2021-02-05	Denselight System	Stage 1B	3
23	HR only	25	25	50	2020-09-23	2020-09-23	2020-09-23	2020-09-23	2020-09-23	2020-09-23	2020-09-23	2020-09-23	Denselight System	Stage 1	1
54	appraisal new	100	0	0	2020-12-11	2020-12-11	2020-12-11	2020-12-11	2020-12-11	2020-12-11	2020-12-11	2020-12-11	Denselight System	Stage 2	5
26	2020 Performance Appraisal	100	0	0	2020-09-01	2020-09-30	2020-10-07	2020-10-31	2020-10-07	2020-10-07	2020-10-07	2020-10-07	Denselight System	Stage 1B	3
27	2020 Performance Appraisal - Helen Vincent	100	0	0	2020-09-01	2020-09-30	2020-10-01	2020-10-31	2021-01-01	2021-01-31	2021-02-01	2021-02-05	Denselight System	Stage 1B	3
55	hunet test 4	50	25	25	2020-12-21	2020-12-21	2020-12-21	2020-12-21	2020-12-21	2020-12-21	2020-12-21	2020-12-21	Denselight System	Stage 2	5
\.


--
-- Data for Name: Appraisals_peerappraisal; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Appraisals_peerappraisal" (id, title1, strength1, weaknessdevelopment1, title2, strength2, weaknessdevelopment2, title3, strength3, weaknessdevelopment3, completion, appraisal_id, created_by_id, manager_id, viewer_id) FROM stdin;
\.


--
-- Data for Name: Appraisals_peerappraisalquestion; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Appraisals_peerappraisalquestion" (id, title, answer, completed, appraisal_id) FROM stdin;
\.


--
-- Data for Name: Appraisals_rating_scale; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Appraisals_rating_scale" (id, name, description, limiter) FROM stdin;
\.


--
-- Data for Name: Appraisals_user_appraisal_list; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Appraisals_user_appraisal_list" (id, status, appraisal_name, overall_board_comments, start_date, end_date, completion, "goals_settingM_rejection", "mid_yearM_rejection", "appraisalHR_rejection", mid_year_completion, "incrementRecommendation", "bonusRecommendation", "recommendationComments", final_employee_rating, final_manager_rating, final_board_rating, appraisal_category_id, employee_id, manager_id, overall_appraisal_id, "end_yearM_rejection") FROM stdin;
171	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	9327697	1611091001	21	end year  rejection
161	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	861437177	324340084	21	end year  rejection
174	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	1904933651	759336758	21	end year  rejection
192	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	206959734	1776097184	21	end year  rejection
150	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	1557152765	430837474	21	end year  rejection
162	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	1982477965	759336758	21	end year  rejection
179	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1906914592	430837474	21	end year  rejection
145	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Hi Kamal,\r\n\r\n1. you need to add the KPIs in the objectives\r\n2. where is the 40mW FBGL project\r\n3. What about the 10kHz NLW project (you can include that you hit the 30kHz and 50kHz goals)?	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1813039923	430837474	21	end year  rejection
194	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	290990818	439847763	21	end year  rejection
169	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1352141850	861437177	21	end year  rejection
183	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	711389827	1616831965	21	end year  rejection
166	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	2107825133	430837474	21	end year  rejection
146	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	1616831965	1813039923	21	end year  rejection
144	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	430837474	1813823810	21	end year  rejection
165	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Please add core value goals.	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	985791817	1813823810	21	end year  rejection
180	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Please provide KPI	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1611091001	1224448967	21	end year  rejection
148	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	135493917	1813823810	21	end year  rejection
154	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	534558467	1813823810	21	end year  rejection
160	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	52374544	135493917	21	end year  rejection
152	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	No KPI's. Please resubmit with KPI's	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	324340084	1813823810	21	end year  rejection
149	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Address clear objective and KPI's.	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	759336758	1813823810	21	end year  rejection
189	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	All in your hard copy PMP information must input	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1087181548	135493917	21	end year  rejection
178	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1776097184	324340084	21	end year  rejection
168	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	2051658454	52374544	21	end year  rejection
190	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1598293097	645448974	21	end year  rejection
177	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1913240580	973701598	21	end year  rejection
158	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Need to input KPI's.	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1135328161	1813823810	21	end year  rejection
153	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	253052978	759336758	21	end year  rejection
157	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Please add KPI's to each goal and add core value goals	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	25957709	1813823810	21	end year  rejection
167	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	973701598	759336758	21	end year  rejection
195	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Please add KPI of the goals.	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1369735000	25957709	21	end year  rejection
188	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	50985924	759336758	21	end year  rejection
181	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Need to add in the smart goals	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	1536568573	973701598	21	end year  rejection
155	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	already spoken	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	931345185	430837474	21	end year  rejection
164	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Please inlcude KPI	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1428738048	1224448967	21	end year  rejection
211	S2Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	After get back from maternity leave, Uma work hard to improve herself to understand the equipment, epi design and MOCVD growth better to improve in the performance. She finished her tasks well.	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	1510925941	1373136557	21	end year  rejection
213	S2Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	426739617	253052978	21	end year  rejection
215	S2Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	161961016	253052978	21	end year  rejection
207	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Need to add KPI into each goal so it can be tracked. Also add core value goals	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1779366736	1813823810	21	end year  rejection
238	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Need target and deliverable in KPI	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	539619816	430837474	21	end year  rejection
197	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	pls see me this is quite different from the paper PMP	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1017729787	135493917	21	end year  rejection
200	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1777433913	1135328161	21	end year  rejection
220	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Need to add KPI. Please look at the sample i provided	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	231731743	973701598	21	end year  rejection
236	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	850138976	135493917	21	end year  rejection
196	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	2047523461	135493917	21	end year  rejection
199	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	520727285	973701598	21	end year  rejection
208	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1921197435	135493917	21	end year  rejection
198	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	pls include the PMP	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1941685512	135493917	21	end year  rejection
237	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	pls include the core value	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	22592094	135493917	21	end year  rejection
214	S2Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	1608216415	1428738048	21	end year  rejection
212	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	305986913	52374544	21	end year  rejection
234	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	2076006951	539619816	21	end year  rejection
205	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1602769597	2107825133	21	end year  rejection
255	S1BReview	2020 Performance Appraisal	No Comments	2020-10-07	2020-10-07	null	NIL	Please re-submit as I'm testing yours with balvinder	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	163946503	534558467	26	end year  rejection
201	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	As mentioned, please amend the categories, some of the due dates and also add the sub-categories  for 'Improve Standard Recruitment process'	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	163946503	534558467	21	end year  rejection
159	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Please remove the KFA from your PMP. I don't think you are involve in them.	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	689543953	759336758	21	end year  rejection
218	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Please write Goals properly. Same project appearing in 2 categories	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	673813648	439847763	21	end year  rejection
206	S1BReview	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	The mid-year review of Aayush is approved.	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	31853750	1557152765	21	end year  rejection
209	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Please re-submit goals	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1723530200	1776097184	21	end year  rejection
227	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Please insert core value	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	104959828	988735390	21	end year  rejection
217	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1484926575	861437177	21	end year  rejection
156	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Did not fill up core values competencies category. Please fill up	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1224448967	324340084	21	end year  rejection
151	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	No KPI's or core value goals	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	988735390	1813823810	21	end year  rejection
147	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Hi Ashish,\r\n\r\nGood attempt. But for KPI, i need you to include targets you want to hit for all KPIs. I need targets to score against.\r\n\r\nFor example, something like for 3" wafer growth improvement, maybe you can say you will improve PL control to < 5nm within edge exclusion .	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	645448974	430837474	21	end year  rejection
219	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Did not fill up core values competencies category. Need to fill up. Please fill and re-submit	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	439847763	324340084	21	end year  rejection
250	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Please insert core value	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	6	988735390	21	end year  rejection
184	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Please fill up core values and competencies category	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	249343659	324340084	21	end year  rejection
210	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1436222314	689543953	21	end year  rejection
261	S2Employee	2020 Performance Appraisal - David Chin	No Comments	2020-10-14	2020-10-14	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	988735390	1813823810	32	end year  rejection
256	S2Employee	2020 Performance Appraisal - Helen Vincent	No Comments	2020-10-14	2020-10-14	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	534558467	1813823810	27	end year  rejection
263	S2Employee	2020 Performance Appraisal - Chivukula Subrahmanya	No Comments	2020-10-14	2020-10-14	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	324340084	1813823810	34	end year  rejection
258	S2Employee	2020 Performance Appraisal - Lam Yee Loy	No Comments	2020-10-14	2020-10-14	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	1135328161	1813823810	29	end year  rejection
260	S2Employee	2020 Performance Appraisal - Soma Sankaran	No Comments	2020-10-14	2020-10-14	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	985791817	1813823810	31	end year  rejection
262	S1BEmployee	2020 Performance Appraisal - Andy Piper	No Comments	2020-10-14	2020-10-14	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	430837474	1813823810	33	end year  rejection
265	S1BEmployee	2020 Performance Appraisal - Kevin Yang	No Comments	2020-10-14	2020-10-14	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	25957709	1813823810	36	end year  rejection
259	S2Employee	2020 Performance Appraisal - Chan Bor Shen	No Comments	2020-10-14	2020-10-14	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	135493917	1813823810	30	end year  rejection
264	S1BManager	2020 Performance Appraisal - Chan TK	No Comments	2020-10-14	2020-10-14	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	759336758	1813823810	35	end year  rejection
163	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Hi Sang,\r\n\r\nFor KPIs, they need to be tangible.\r\n\r\n1. For example, for how many products are you going to have the SPC chart and process control?\r\n\r\n2. How many % of the tool SPC you are creating?\r\n\r\n3. How many product growth recipe  will you align with PE team ?	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	1373136557	430837474	21	end year  rejection
222	S2Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	To include Wip Visibility thru ODOO for Fab A and APT in appraisal goals and measurement should have started in July 2020 onwards.  This is the biggest value of the projects driven by Syrex and shared at Rajan's level.	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	1014312820	1982477965	21	end year  rejection
223	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	708482014	689543953	21	end year  rejection
221	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	726826699	52374544	21	end year  rejection
249	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	5	135493917	21	end year  rejection
216	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	397620336	534558467	21	end year  rejection
291	S1BEmployee	ads	No Comments	2020-12-21	2020-12-21	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	5	16	430837474	56	end year  rejection
193	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1887544512	689543953	21	end year  rejection
204	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	480020115	931345185	21	end year  rejection
202	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	249507857	689543953	21	end year  rejection
246	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	781280338	52374544	21	end year  rejection
247	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1916964989	689543953	21	end year  rejection
245	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	620999160	689543953	21	end year  rejection
242	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	148988561	689543953	21	end year  rejection
243	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1575722891	52374544	21	end year  rejection
240	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1536649866	689543953	21	end year  rejection
241	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	2125149271	1776097184	21	end year  rejection
251	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1813823810	\N	21	end year  rejection
248	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1106999016	534558467	21	end year  rejection
182	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	864267076	52374544	21	end year  rejection
230	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	619517776	52374544	21	end year  rejection
231	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	29738722	689543953	21	end year  rejection
228	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1539913308	52374544	21	end year  rejection
229	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	410233054	52374544	21	end year  rejection
226	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	418560939	689543953	21	end year  rejection
176	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	610693885	861437177	21	end year  rejection
224	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1710250857	985791817	21	end year  rejection
225	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1256890838	861437177	21	end year  rejection
239	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	2035253683	52374544	21	end year  rejection
186	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1523161462	2107825133	21	end year  rejection
235	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	313243524	52374544	21	end year  rejection
185	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1854222316	689543953	21	end year  rejection
233	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1233462141	689543953	21	end year  rejection
232	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1798521118	1616831965	21	end year  rejection
175	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1634575202	52374544	21	end year  rejection
172	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	364472470	931345185	21	end year  rejection
252	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	proceed to fill in the competency and skills	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	10	861437177	21	end year  rejection
244	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1002214209	985791817	21	end year  rejection
170	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1207021661	931345185	21	end year  rejection
\.


--
-- Data for Name: GnC_commentbox; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."GnC_commentbox" (id, comment, created_on, created_by_id, goal_id) FROM stdin;
\.


--
-- Data for Name: GnC_competencies; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."GnC_competencies" (id, summary, description, weightage, user_rating, manager_rating, board_rating, user_comments, manager_comments, board_comments, appraisal_id, competency_category_id, employee_id) FROM stdin;
\.


--
-- Data for Name: GnC_competencycategory; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."GnC_competencycategory" (id, name, description) FROM stdin;
6	Customer First Mindset	Our customers, come first. We will strive to provide them with superior innovative products and will continuously improve their quality that will in turn see us win in our end markets.
8	Integrity with Passion & Tenacity	At DenseLight, we take pride in every job that we do by having the highest level of honesty and openness. We cultivate our entrepreneurial drive as a means to remain flexible, agile and willingness to change. We are passionate about DenseLight and have a never-say-die attitude!
9	People Development	Ability to transfer expertise and build the long-term leadership capability of others by teaching, coaching and/or mentoring
10	Demonstrate Leadership	Ensures that the team is focused, motivated and inspired to achieve organizational objectives
\.


--
-- Data for Name: GnC_competencycomment; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."GnC_competencycomment" (id, comments, created_on, competency_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: GnC_departmentalcompetencies; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."GnC_departmentalcompetencies" (id, summary, description, appraisal_id, competency_category_id, department_id, manager_id) FROM stdin;
\.


--
-- Data for Name: GnC_departmentalcompetenciescomment; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."GnC_departmentalcompetenciescomment" (id, comments, created_on, created_by_id, departmental_competencies_id) FROM stdin;
\.


--
-- Data for Name: GnC_departmentalgoalcomment; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."GnC_departmentalgoalcomment" (id, comments, created_on, created_by_id, departmental_goal_id) FROM stdin;
\.


--
-- Data for Name: GnC_departmentalgoals; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."GnC_departmentalgoals" (id, summary, description, due, appraisal_id, department_id, goal_category_id, manager_id) FROM stdin;
12	CTO Role: Direct company technology strategy	Under the personal responsibility of CTO	2020-12-31	21	10	5	1224448967
14	Advancing DPHI Platform solutions offering	a) DPhi and Optical Engine solutions Technical Directions\r\nb) DLS-AMF MOU and POC1&2\r\nc) DPHI implementation, including HIPP to OE solutions engineering	2020-12-31	21	13	3	1135328161
17	Providing development support on packaging integration & test engineering	Identifying and proactively provide technology development engineering support to NRE programs, NPI projects, Product Engineering, and APT, in the area of advanced packaging integration & related test engineering	2020-12-31	21	13	3	1135328161
18	Monthly closing within 4 working days	Ensure monthly closing by 4th working days	2021-01-06	21	6	5	988735390
19	Supply Chain Department Goals	Revenue - Meet shipment target\r\n\r\nOrganization - Reduce attrition by 50%, identify and fill all 2020 budgeted positions and review of KFA’s.\r\n\r\nCustomer Engagement - Secure capacity and capability for DFB at the subcons\r\n\r\nOps Efficiency / Cost Reduction - Achieve yield of 90% at the subcons, implement auto work order for APT and achieve $250k of cost savings.\r\n\r\nNPI - Qualify new subcons to support new products like 25G.	2020-12-31	21	5	6	759336758
\.


--
-- Data for Name: GnC_endyrcommentbox; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."GnC_endyrcommentbox" (id, comment, created_on, created_by_id, goal_id) FROM stdin;
\.


--
-- Data for Name: GnC_goalcategory; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."GnC_goalcategory" (id, name) FROM stdin;
1	Customer Engagement
3	New Product Introduction
4	Operation Efficiency/Cost Reduction
5	Organization Effectivness
6	Others
\.


--
-- Data for Name: GnC_goalcomment; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."GnC_goalcomment" (id, comments, created_on, created_by_id, goal_id) FROM stdin;
\.


--
-- Data for Name: GnC_goals; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."GnC_goals" (id, summary, description, due, weightage, "metrics_Used", "MID_user_comments", "MID_manager_comments", user_rating, manager_rating, board_rating, user_comments, manager_comments, board_comments, tracking_status, metrics_evidence, appraisal_id, employee_id, goal_category_id, status, goal_employees_comment, goal_manager_comment) FROM stdin;
141	Support key customer programs(CISCO, Almae, Huawei, Bandwidth 10, othere Laser and Quad PIN projects) As per time lines & deliverables	i) Litho process margin improvement, reduce defocus, resist footing, misalignment[Q2] \r\nLitho defocus/ resist footing reduced after optimize low vacuum contact procedure. Misalignment reduced through operators training\r\nii) SPR220 bonding process stabilization[Q2]\r\nFully implemented SPR220 smoothly with enough process margin. Engineering report: ER #: 20-WP-ER-0006	2020-06-30	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		178	1776097184	1	\N	\N	\N
28	Achieve yield target for ELED/SLED/DFB16xx	To achieve the respective yield target set for ELED/SLED/DFB16xx to ensure timely released product revenue shipment and cost effectiveness	2020-12-31	30	weekly yield report (ELED/SLED) in weekly yield meeting and weekly yield update in DFB meeting	NIL	NIL	1	1	1	NIL	NIL	NIL	null		161	861437177	4	\N	\N	\N
23	Application Support & Technical Marketing	1. Deliver 3 app notes or videos that show cases DenseLight’s expertise in the respecting markets.\r\n2. Work with the internal teams to deliver 2 Technical Marketing reports\r\n-template and organize ppt	2020-12-31	20	1.Publish app notes on web 2. Publish 2 technical marketing reports&organize seminar for team	NIL	NIL	1	1	1	NIL	NIL	NIL	null		244	1002214209	5	\N	\N	\N
328	Production/cost improvement		2020-12-31	40		NIL	NIL	1	1	1	NIL	NIL	NIL	null		199	520727285	4	\N	\N	\N
186	New Design in	Get at least 4 design win in 16xx DFB，10G/25GD or SOA	2020-12-31	25	new orders.	NIL	NIL	1	1	1	NIL	NIL	NIL	null		157	25957709	3	\N	\N	\N
16	Revenue	Meet Revenue Target of $1.5 Million	2020-12-20	50	Financial Report	Comment 1	Well done for being on track...!	3	5	1	I meet expectations	I think you did better than you think.	NIL	On Track		\N	\N	1	\N	\N	\N
504	Test 5 Nov	Objective 1	2020-12-31	100	N/A	Mid Year Employee Comments	ABCD	1	2	1	NIL	ABCD	NIL	On Track		\N	17	1	\N	\N	\N
37	Assist in monthly closing within 4 working days	assist to close month end accounts within 4 working days	2020-12-31	15	NIL	NIL	Agreed	1	1	1	NIL	NIL	NIL	On Track		227	104959828	6	\N	\N	\N
35	Personnel Development	File atleast one patent or paper or  trade secret from Process and Product groups per year , Cross training on another tool , Mentor ship by senior engineers to IA students	2020-12-31	15	patents, training, mentorship	NIL	NIL	1	1	1	NIL	NIL	NIL	null		152	324340084	5	\N	\N	\N
298	Projects	Driving performance management	2020-12-31	20	Dashboards	Done research and benchmarking on other renowned semiconductor companies around the globe to understand and more importantly, execute the Kaizen projects with results. \r\nThe mainframe has been created and presented to management during the Operational Excellence reviews. However, due to lack of intern or a 3rd headcount to establish and ensure continuity of this system, the project was placed on hold. There was no or very low application for an IE internship when it was posted. Next steps was to build a Job Description for a full time junior IE/IT role. The justification for this needs more thoughts to fill up the executive time fruitfully for 40-45 hrs a work week, and building more projects to accommodate this will be the key next step.\r\n                                              \r\nKFA 4.1 - WIP management thru ODOO was a success story and though there are many nicks along the way, it was overcame diligently. This road to fully cross between APT (Assy) to Fab B (Coating) back to APT (Assy and Test) right thru SubCon and back again to APT in various product form takes time to be developed inside the Odoo system. Traveller sheet has been re-designed, the sun-con invoice details is underway plus a few more milestones needs to be established before this goes life. A lot of time and resources has been used as a concerted effort to get this going, and once system wise ready, the journey will be to internalize the the new way of going things which is inline with the i4.0 where productivity thru automation replaces manual way of executing non value added jobs. \r\n\r\nKFA4.3 - Led by Nee Shiuan and he's on track with all his automation projects which by and large needs the expertise of PE\r\n\r\nBi Weekly Meeting has been setup with the President and CEO with the Head of Supply Chain to run thru the key projects and the deliverables in line with the company's objectives.	Navin is making good progress on this project.	1	1	1	NIL	NIL	NIL	On Track		162	1982477965	4	\N	\N	\N
17	Title 2	Objective 2	2020-12-20	20	Source 2	Comments 2	You should try to speed up !	4	2	1	I did quite well	You need improvement.	NIL	Not On Track		\N	\N	4	\N	\N	\N
18	Goal 3	Objective 3	2020-12-20	30	Source 3	No Comments	Noted.	2	3	1	I may need more training	I think you are ok.	NIL	On Track		\N	\N	3	\N	\N	\N
11	Increase Revenue by 100%	Increase revenue during all runs	2020-09-01	100	Monthly Financial Report	Covid struck at February, cannot visit clients	I agree	4	3	5	I think I am good :)	I dont think so	I think you are too good	Not On Track		\N	\N	6	\N	\N	\N
15	Product Costing	Prepare product costing\r\n1)May20_FBGL\r\n2)July20_DFB(Sensing & Datacom)\r\n3)Sep20_SLED/ELED\r\n4)Nov20_COS/ILM	2020-12-31	25	Costing excel worksheet	NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	988735390	5	\N	\N	\N
14	Sharing PNL and Costs	Ensure PNL and costs (Fab A, Fab B and ATP) is share with the staff, target not less than 12 times in 2020	2021-01-15	25	PPT presentation	NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	988735390	5	\N	\N	\N
13	Monthly BOD Report	Ensure BOD receive the monthly/quarterly report by 2nd week of the following month	2021-01-15	25	PPT presentation	NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	988735390	4	\N	\N	\N
12	Monthly Closing Dateline	Ensure the monthly closing /report is close at the 4th working day	2021-01-06	25	Date of closing and email out	NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	988735390	4	\N	\N	\N
30	Follow PDM procedure to achieve new product release	Work with NPD to achieve the new product release on:\r\n1.DFB (Sicoya 1310nm) \r\n2.25G DML DFB \r\n3.OSI 1310nm & 1550nm - NRE\r\n4.1650nm pulse PF laser\r\n5.Eloira SLED 1550nm - NRE\r\n6.Panwoo low DOP SLED	2020-12-31	20	PDM documents of each project	NIL	NIL	1	1	1	NIL	NIL	NIL	null		161	861437177	3	\N	\N	\N
21	NEW PRODUCT WINs	To support design-wins in \r\n- ILM, \r\n- 16XX, \r\n- High poer DFB\r\n- Gain Chip / SOA	2020-12-31	20	1.PPT Presentation on ILM strategy, with list of customers, status; 2.Revenue report for design wins	NIL	NIL	1	1	1	NIL	NIL	NIL	null		244	1002214209	3	\N	\N	\N
20	Revenue	1.Help sales team meet overall revenue goal\r\n2.Help sales team meet quarterly goals\r\n3.Meet 1 of the following:\r\nI. total $1M in ILM revenue ILM (WW) or\r\nII. $500K DFB (WW 16xx) or\r\nIII. $300K SOA/GC	2020-12-31	40	Revenue Report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		244	1002214209	1	\N	\N	\N
31	Quality/Cost reduction/Operational support	To set quality goal to ensure timely support on production inline issues & customer quality issues; cost reduction goals to improve PE team resource efficiency and achieve operating cost reduction.	2020-12-31	20	RMA and NCMR tracking report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		161	861437177	4	\N	\N	\N
29	Establish various system for PE team	System setup for PE team KPI tracking & org. effectiveness improvement	2020-12-31	30	Yield tracking report, yield dashboard, SPC	NIL	NIL	1	1	1	NIL	NIL	NIL	null		161	861437177	5	\N	\N	\N
25	Business Operations	Odoo sample request improvement and support DenseLight’s web page enhancement	2020-12-31	20	1.\tPublish updated sample request process playbook 2.\tUpdate of web page	NIL	NIL	1	1	1	NIL	NIL	NIL	null		244	1002214209	4	\N	\N	\N
128	3 inch wafer convention	The whole production line is ready for 3inch wafers run	2020-12-30	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		192	206959734	4	\N	\N	\N
144	Operations	- 100% SOP on backlap area[Done]\r\n- Certification of operators[Done for the lapping new operator]\r\n- Measure current productivity & improve by 10%\r\n- Audit finding closure[Done for lapping area]	2020-06-30	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		178	1776097184	4	\N	\N	\N
44	Reduce Cost of Non-conformance (CoNC)	To reduce Cost of Non-conformance (CoNC) by <5% with respect to the total cost of goods sold (COGS)	2020-12-31	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		156	1224448967	4	\N	\N	\N
46	Improvement to Process compliance	Reestablish Monthly Quality Patrol Audit to counter check process and manufacturing process compliance to requirement and standard.	2020-12-31	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		156	1224448967	4	\N	\N	\N
47	Improvement to In-coming Quality Assurance	To centralize documentation and acceptance for incoming material inspection by creating google shared drive for all department incoming material documentations and approval	2020-12-31	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		156	1224448967	4	\N	\N	\N
39	Accounts Receivable Management	DSO less than 45 days.	2020-12-31	15	NIL	NIL	Agreed, except 2 long o/s AR	1	1	1	NIL	NIL	NIL	On Track		227	104959828	6	\N	\N	\N
49	Establish DenseLight Manufacturing Execution System (DMES)	To complete the DMES in Q4, 2020	2020-12-31	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		156	1224448967	4	\N	\N	\N
50	Involvement of QA function to new product development	To establish QA gates for each New Product Development Phases	2020-12-31	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		156	1224448967	3	\N	\N	\N
51	Improve and Centralize Documented Information	To Automate DCC utilizing Google Shared drive and/or Odoo System	2020-12-31	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		156	1224448967	5	\N	\N	\N
52	Completion of ISO 9001:2015 QMS Surveillance Audit for year 2020	To pass the Third-party ISO 9001:2015 QMS Surveillance Audit	2020-12-31	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		156	1224448967	5	\N	\N	\N
45	Improvement of External Manufacturing Performance	Monitor (baseline gathering) Ext. Mfg. performance by;\r\na) Reduce Reject/Scrap rate by 2%\r\nb) Reduce Vendor CoNC by 2% from previous year (2019)\r\nc) Improve response time to quality issue	2020-12-31	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		156	1224448967	4	\N	\N	\N
43	Reduction RMA closure cycle time (CAPA submission)	To respond faster to customer feedback	2020-12-31	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		156	1224448967	1	\N	\N	\N
55	Project	1. Understand different laser process\r\n2. Able to dispose wafers independently\r\n3. Prepare FA report for the issues caught in the line	2020-09-30	15	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		184	249343659	4	\N	\N	\N
56	Quality	1. Maintain Internal FA TAT to 1 day\r\n2. Maintain and ensure External FA TAT to 3 days\r\n3. Reduce wafer disposition time to 4 hours\r\n4. Organize internal and external FA data folder	2021-01-31	15	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		184	249343659	4	\N	\N	\N
57	Operation	1. Maintain housekeeping/5S at all times\r\n2. Maintain machine handle in good condition\r\n3. Monitor FA consumables	2020-09-30	5	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		184	249343659	4	\N	\N	\N
58	Operation	1. To support all types of FA request\r\n2. To support wafer fab process and other related works	2020-09-30	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		184	249343659	4	\N	\N	\N
59	Personal Development	1. Familiarize and continue to learn various laser processes in the wafer fab process.\r\n2. Develop decision making on process related.	2020-09-30	15	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		184	249343659	6	\N	\N	\N
40	Fixed Asset Tagging	Tidy up and tagging fixed asset using excel worksheet	2020-10-31	10	NIL	NIL	Not done	1	1	1	NIL	NIL	NIL	On Track		227	104959828	6	\N	\N	\N
53	Expand the use of DenseLight network for remote access connection	Deployment of Virtual PC server to all indirect staff to be able to work from home	2020-12-31	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		156	1224448967	5	\N	\N	\N
349	Production process control set up	1.1\tCreate a system for production wafer growth control that align with SPC charts build by Uma	2020-12-31	15		NIL	Need to complete it for all products including engineering growths.	1	1	1	NIL	NIL	NIL	On Track		163	1373136557	4	\N	\N	\N
63	Support Revenue Thru Critical Program Execution (25G DML-Santosh)	Develop process flow and module for 25G DML with FC (POET) and without FC (DLS) capability	2020-12-31	10	Produce 25G DML dies meeting program specification	NIL	NIL	1	1	1	NIL	NIL	NIL	null		219	439847763	3	\N	\N	\N
61	Support Revenue Thru Critical Program Execution (BH)	Develop Buried Heterostructure (BH) Process	2020-12-31	10	Produce BH dies meeting program expectations	NIL	NIL	1	1	1	NIL	NIL	NIL	null		219	439847763	3	\N	\N	\N
65	Support Revenue Thru Critical Program Execution (SOA-Simon)	Develop process flow and module for SOA	2020-12-31	10	Produce SOA dies meeting program specification	NIL	NIL	1	1	1	NIL	NIL	NIL	null		219	439847763	3	\N	\N	\N
64	Support Revenue Thru Critical Program Execution (Low DOP-Simon)	Provide wafer fab process support on Panwoo low DOP wafers	2020-12-31	10	Produce Low DOP dies meeting program specification	NIL	NIL	1	1	1	NIL	NIL	NIL	null		219	439847763	3	\N	\N	\N
66	Support Conversion of 2" to 3" Wafer Processing (Simon)	Support 3" wafer processing to help operations with capacity ramp	2020-12-31	10	3” wafer fabrication successful with same/better  yield as 2"	NIL	NIL	1	1	1	NIL	NIL	NIL	null		219	439847763	4	\N	\N	\N
67	Operator Certification on Wafer Process	Setup procedure for operator training and certification to reduce human error on wafer processing	2020-12-31	10	Operators properly trained and certified with regular recertification	NIL	NIL	1	1	1	NIL	NIL	NIL	null		219	439847763	5	\N	\N	\N
68	Support Runsheet Conversion to DMES (Simon)	Support IT and production team in implementation of DMES	2020-09-30	10	Transfer all runsheets to DMES	NIL	NIL	1	1	1	NIL	NIL	NIL	null		219	439847763	4	\N	\N	\N
329	Data management for all NPD Lab Tester	\tCentralized storage of all data\r\n\tData backup\r\n\tEase of data query	2020-04-30	25	Task1_Gantt.xlsx	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track	Task1_Gantt.jpg	146	1616831965	3	\N	\N	\N
69	Quality: Process FMEA and Window Checks	Implement FMEA/Delta FMEA assessment of new processes and all new modules with "window checks" based on Product Development Model (PDM) guidelines.	2021-06-30	10	Implement FMEA and "window checks" based on PDM guidelines	NIL	NIL	1	1	1	NIL	NIL	NIL	null		219	439847763	6	\N	\N	\N
27	Organization/ Culture Change	•\tDevelop and improve standard recruitment process to reduce attrition by 50%. \r\n•\tIdentify and fill all 2020 budgeted positions. \r\n•\tContinue review of KFA’s and execution of DLS 2.0	2020-12-31	15	HR attrition report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		148	135493917	5	\N	\N	\N
42	OPS Eff/Cost Reduction	•\tImplement in-house process runsheet software for production use by 1Q2020\r\n•\tTo ensure the production CT and OTD mean the 15 days for the standard product and the OTD given by the PC.	2020-12-31	15	MFG Operation reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		148	135493917	4	\N	\N	\N
70	Quality: Process Integration Bluebook	Create Bluebook template and implement for process integration	2021-12-31	10	Implement bluebook for process integration	NIL	NIL	1	1	1	NIL	NIL	NIL	null		219	439847763	6	\N	\N	\N
62	Support Revenue Thru Critical Program Execution (BH FC DFB-Santosh)	Develop process flow and module for Almae BH FC DFB	2020-12-31	10	Fabricate BH DFB with wafer level VI and IV yield at >90%	NIL	NIL	1	1	1	NIL	NIL	NIL	null		219	439847763	3	\N	\N	\N
142	Quality(SPC)	i) Tool level SPC: Lapping tool SPC setup ok\r\nii) Product level, Product SPC setup ok\r\niii) Metrology level\r\n- CpK >1.33, OOC investigation\r\n- NCMR closure within 1 month\r\n- No recurrence of same issues\r\n- ECN SPR220 / BCB for Lapping[done]\r\n- DI GUIDELINE[done]\r\n- 15nXT negative resist evaluation[Q4]\r\n- Vernier mask for grating layer[Done]\r\n- Defect scan machine purchase[Q4]\r\n- Auto CD measurement software implementation[Done]\r\n- Mask & wafer solvent cleaner[Q4]\r\n- Combo tool for bond/debond[Q4]	2020-12-30	30		NIL	NIL	1	1	1	NIL	NIL	NIL	null		178	1776097184	4	\N	\N	\N
90	Branding & Marketing	To implement a branding and marketing strategy to enhance DenseLight's branding image	2020-12-31	15	Presentation of branding activities	NIL	NIL	1	1	1	NIL	NIL	NIL	null		165	985791817	6	\N	\N	\N
341	SOA Automation using Sigmakoki	Lead the development and release of SOA automation using Sigmakoki to support SOA prodution ramp.	2020-12-31	40		NIL	NIL	1	1	1	NIL	NIL	NIL	null		204	480020115	4	\N	\N	\N
79	Monthly BOD report to be send out by 2nd week	Ensure Board will be update at the regular interval and progress of the company	2021-01-15	25	Date BOD ppt report email out	NIL	NIL	1	1	1	NIL	NIL	NIL	null	Finance_KPI_2_202009.JPG	151	988735390	5	\N	\N	\N
511	Goal 2	test 2	2020-12-31	50		Mid Year Employee's Comments2	Mid Year Manager's Comments2	2	1	1	End Year Employee's Comments2	NIL	NIL	On Track		\N	17	1	\N	\N	\N
80	Sharing of PNL with analysis and cost review - 12 times in 2020	To analysis and share with staff, Fab A, Fab B and ATP the costing related to the respective areas and progress therein.	2021-01-15	25	Data (costing) in excel	NIL	NIL	1	1	1	NIL	NIL	NIL	null	Finance_KPI_3_202009.JPG	151	988735390	4	\N	\N	\N
317	Shipment and Revenue Support.	Review current OEE on APT test equipment and define actions to improve OEE – Q4	2020-12-31	30		NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		181	1536568573	4	\N	\N	\N
84	Prepare product costing	Prepare product costing:\r\n1) May'20 - FBGL\r\n2) July'20 - DFB(Sensing & Datacom)\r\n3) Sept'20 - SLED/ELED\r\n4) Nov'20 - COS/ILM	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		250	6	6	\N	\N	\N
77	Advancing DPHI Platform solutions offering	a)\tDPhi and Optical Engine solutions Technical Directions\r\nb)\tDLS-AMF MOU and POC1&2\r\nc)\tDPHI implementation, including HIPP to OE solutions engineering	2020-12-31	30	Presentations, reports, meetings pptx and minutes	3a) \tDPhi and Optical Engine solutions Technical Directions\r\n•\tDeveloping technical directions for Providing Turnkey Optical Engine Solutions (POC, OE1 & OE2) \r\n•\tDPhi trademark registration filed\r\n•\tContribution to DPhi collaterals and marketing effort\r\n\r\n\r\n3b) DLS-AMF MOU and POC1&2\r\n•\tMOU signing done on 24Aug2020\r\n•\tDeveloped POC1 & POC2 program directions, DLS POC team formed and POC work in progress \r\n \r\n3c)\tDPHI implementation, including HIPP to OE solutions engineering  \r\n•\tDiscussion in progress with Hisense and HGTech for 400G Intra-DCI FR4 OE	NIL	1	1	1	NIL	NIL	NIL	On Track		158	1135328161	3	\N	\N	\N
81	Prepare product costing from May to Nov 2020	Prepare product costing for pricing and reference cover FBGL to ILM	2020-12-31	25	Costing excel worksheet	NIL	NIL	1	1	1	NIL	NIL	NIL	null	Finance_KPI_4_202009.JPG	151	988735390	4	\N	\N	\N
82	Monthly closing within 4 working days	Monthly closing within 4 working days	2021-01-15	50		NIL	Agreed	1	1	1	NIL	NIL	NIL	On Track		250	6	6	\N	\N	\N
85	Make sure a smooth year end financial audit- YE2019	Make sure a smooth year end financial audit- YE2019	2020-05-31	30		NIL	Agreed	1	1	1	NIL	NIL	NIL	On Track		250	6	6	\N	\N	\N
300	Production Planning (Inventory & Materials/Forecast)		2020-12-31	20	Inventory and Forecast Files	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		215	161961016	4	\N	\N	\N
83	Tidy up & Tagging fixed assets	Tidy up & Tagging fixed assets - Using Excel worksheet by Dec'20	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		250	6	6	\N	\N	\N
87	Channel Growth	Drive business through Channels, and grow DenseLight revenue in US	2020-12-31	20	Channel Growth (US)	NIL	NIL	1	1	1	NIL	NIL	NIL	null		165	985791817	5	\N	\N	\N
88	New Product Design Wins	Win designs with new product	2020-12-31	20	Order from customer	NIL	NIL	1	1	1	NIL	NIL	NIL	null		165	985791817	3	\N	\N	\N
86	Revenue	Meet company revenue goals for 2020	2020-12-31	30		NIL	NIL	1	1	1	NIL	NIL	NIL	null		165	985791817	1	\N	\N	\N
89	Operational Efficiecy	To implement programs and or processes that enable sales to increase operational efficiency	2020-04-30	15	Presentation of system/s that increase efficiency	NIL	NIL	1	1	1	NIL	NIL	NIL	null		165	985791817	4	\N	\N	\N
92	Sales KPI	Meet the following Sales KPI:\r\n1.  PO conversion rate of +12% (no of RFQs quoted versus no of PO received from customers not in forecast)\r\n2.  RFQ TAT – 48 hrs from request received to quote\r\n3.  Initiate and drive quarterly forecast review with ROW distributors: to be done 1x before the quarter starts and 1x middle of the quarter	2020-12-31	20	Sales & Marketing report or Accounting report, Distribution meeting minutes & emails	NIL	NIL	1	1	1	NIL	NIL	NIL	null		224	1710250857	1	\N	\N	\N
93	RMA & Customer Returns	Attend weekly QA meetings and ensure:\r\nI.\tCustomer RMAs complains are acknowledge in time: within 1 working day\r\nII.\tWork with QA team to disposition on complaint, help them get the RMA questionnaire form, and work with QA team to come out with an 8D report where applicable\r\nIII.\tAttend the weekly QA meetings and be the voice of the customer for quality issues internally	2020-12-31	10	RMA report from QA Customer Survey report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		224	1710250857	1	\N	\N	\N
54	Revenue Goal	To support WW Sales Team to meet:\r\n1. Denselight's overall  FY20 goal of $12.1m\r\n2. Meet Denselight's quarterly goal:\r\n      Q1 = $1.24m\r\n      Q2 = $2.04m\r\n      Q3 = $3.87m\r\n      Q4 = $4.59m	2020-12-31	40	Sales Revenue report or Accounts revenue report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		224	1710250857	5	\N	\N	\N
524	objective 1	objective 2	2020-12-11	100	NIL	NIL	manager comments	2	4	1	NIL	NIL	NIL	On Track		\N	17	1	\N	\N	\N
91	Operational Efficiency	Lead the effort to improve sales efficiency in order & revenue management. \r\nFeatures of the system\r\na)\tImplement an automated system that links \r\ni.\tQuote\r\nii.\torder entry\r\niii.\torder acknowledgement\r\niv.\torder shipment\r\nv.\tinvoicing\r\nb)\tAutomatically generate sales reports that can give month to date, quarter to date & year to date revenue, give open backlog at any point\r\nc)\tTrack conversion rates of POs.	2020-12-31	30	New system implementation,  System operating manual	NIL	NIL	1	1	1	NIL	NIL	NIL	null		224	1710250857	5	\N	\N	\N
94	Team management for MFG, Fab B & MOCVD  Equip and Facility	•\tEnsure all my team members always align to the company goals.  \r\n•\tMaintain employee work schedules including assignments, job rotation, training, vacations and paid time off, good team communication, coverage for absenteeism, and all other work related scheduling. Goal is to ensure there is always good equipment support to the MFG need.\r\n•\tEmpower employees to take responsibility for their jobs and goals. Delegate responsibility and expect accountability and regular feedback.\r\n•\tFoster a spirit of teamwork and unity among equip and other departments (MFG, Process, facility), allows for disagreement over ideas, conflict and expeditious conflict resolution, and the appreciation of diversity as well as cohesiveness, supportiveness , and working effectively together to enable each team members, other departments and company to succeed.	2020-12-31	10	Better team work and productivity	NIL	NIL	1	1	1	NIL	NIL	NIL	null		148	135493917	5	\N	\N	\N
127	Back up tools qualification	ICP-02 TRION dielectric etcher release to product	2021-03-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		192	206959734	4	\N	\N	\N
106	Talent Succession Planning via Functional Reviews	Ensure sufficient Benchstrength	2020-09-30	20	Functional Reviews Minutes	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		154	534558467	5	\N	\N	\N
111	Administrative support for COVID-19	Ensure compliance with government's regulations and advisories	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		201	163946503	6	\N	\N	\N
510	Hunet test	test	2020-12-31	50		Mid Year Employee's Comments	Mid Year Manager's Comments1	2	1	1	End Year Employee's Comments1	NIL	NIL	On Track		\N	17	1	\N	\N	\N
299	Production Planning (Achieve Target Revenue 2020)		2020-12-31	50	Revenue File	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		215	161961016	1	\N	\N	\N
102	Develop & Improve standard Recruitment Process to Reduce Attrition	1.  Set up a more robust KFA no.1 teams to lead by new energized leaders\r\n2. Look at Selection Assesmen tool to check for culture fit and commitment from final 2 candidates to 'Hire Right'.	2020-12-31	20	KFA Monthly meetings	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		154	534558467	5	\N	\N	\N
512	Goal 1	Objective 1	2021-01-31	50		Mid Year very good	Ok I agree	1	1	1	NIL	NIL	NIL	On Track		\N	17	6	\N	\N	\N
103	Reduce Turnover	Retain effective employees and motivate them to higher productivity	2020-12-31	20	KFA 1.3 monthly report	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		154	534558467	4	\N	\N	\N
104	Benefit Reviews	To continue ensure the benefits for the employees are competitive with the market for retention and motivation	2020-12-31	20	Programs developed	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		154	534558467	6	\N	\N	\N
105	Improve Company's Branding	Improve company’s image for better hiring sourcing and overall reputation of Denselight	2020-09-30	20	Implementation of the E-PMP and E-OT on schedule	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		154	534558467	5	\N	\N	\N
117	Improvements of soft skills	1. Improve team's execution\r\n2. Motivate team's responsibility and ownership\r\n3. Alignment of reporting and communication\r\n4. Guidance of Team Managers\r\n5. Better tracking of team's task	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		144	430837474	6	\N	\N	\N
107	Increase recruitment efficiency	Improve standard recruitment process and fill up 2020 budgeted positions	2020-12-31	20	Monthly AOP actual hiring vs budget	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		201	163946503	4	\N	\N	\N
108	Reduce Turnover	Reduce turnover against targeted turnover rate	2020-12-31	20	Monthly turnover rate	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		201	163946503	4	\N	\N	\N
96	Training	•\tTake ownership for the team training needs and attendance. \r\n•\tEnsure MFG Engineer and Equip SM assigned training for team member are follow through closely.\r\n•\tEnsure training received by team members are aligned and help in the execution of their work responsibility.\r\n•\tResponsible to ensure OJT for new comers to address their working needs	2020-12-31	10	Skill and training record	NIL	NIL	1	1	1	NIL	NIL	NIL	null		148	135493917	5	\N	\N	\N
122	Cycle time and rework reductions, Cost reductions for ebeam	1) Improve cycle time by reducing as less holds in the run sheets as possible\r\n2) Develop the process by which low rework rate will be achieved\r\n3) eBeam passes reduction and convergence	2020-12-31	20	Cycle time, rework and cost reductions	NIL	NIL	1	1	1	NIL	NIL	NIL	null		218	673813648	4	\N	\N	\N
125	A. Support Key Customer Programs	a.  Develop and Optimize Etch Process for key customers (Almae BH, 25G DML, PanWoo Low DOP, Renesas )\r\n- Dielectric etch new recipe characterization for higher selectivity of SiO2 to resist for BH process\r\n- SAMCO InP etch no trench new recipe characterization for BH process.	2020-12-30	15	FA	NIL	NIL	1	1	1	NIL	NIL	NIL	null		192	206959734	3	\N	\N	\N
129	To complete qualification of chemical Remover 1165 to replace ACT410	To complete qualification of Remover 1165 for the replacement of ACT410 to achieve cost saving by 40%	2020-12-30	15		NIL	NIL	1	1	1	NIL	NIL	NIL	null		192	206959734	4	\N	\N	\N
109	Benefits Reviews	Review employees' benefits benchmark against market practices	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		201	163946503	4	\N	\N	\N
110	Improve Company’s Branding	a. Attend at least 4 job fairs/talks to represent DLS (Total no. of attended by year end)	2020-12-31	20	Number of job fairs/talks held	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		201	163946503	1	\N	\N	\N
308	APT Manufacturing	Complete cross training for the production\r\nteam to support APT operation.	2020-12-31	25	To complete operators cross training by end of the year	1) Quarterly and Monthly shipment target are always behind at last month of the quarter.  Especially ILM shipment most of the time are behind the schedule, Production will provide full OT support.\r\n2) Plan Operator Multi-skill training must complete in time to full support APT operation\r\n2) Tester OEE (Machine utilization) : for auto bar and Manual stn 4 testers both testers machine utilization are above 60%, will continue monitor these two testers performance. For Manual tester stn 1 collecting the data since w50 ( w50 close to 60% utilization) now daily close monitor it performance.	NIL	1	1	1	NIL	NIL	NIL	On Track		159	689543953	4	\N	\N	\N
330	Equipment Management	\tRegular Calibration\r\n\tRegular Repair/Maintenance\r\n\tUpdated NPD equipment inventory/list\r\n\tConversion of DIV Matlab Software to C# application	2020-12-30	25	Task2_Gantt.xlsx	NIL	NIL	1	1	1	NIL	NIL	NIL	Not On Track	Task2_Gantt.jpg	146	1616831965	3	\N	\N	\N
112	New Products for Sensing	1. 10KHz 1550nm NLW for Wind LIDAR and DAS \r\n\r\n2. 40mW High Power 200kHz 1550nm NLW for Auto LIDAR \r\n\r\n3. 1310nm Broadband (120nm at 10dB) SLED\r\n\r\n4. 1310nm Low DOP SLED for China FOG (> 1mW @ 100mA 8 pin BTF)	2021-03-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		144	430837474	3	\N	\N	\N
319	Production Planning (Achieve Target Revenue 2020)		2020-12-30	50	Revenue File	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		213	426739617	1	\N	\N	\N
113	New Products for Datacoms and Telecoms	1. High Power CWDM DFB 70mW@75C\r\n\r\n2. 10G CWDM DML c-temp and i-temp\r\n\r\n3. 25G CWDM DML c-temp and i-temp\r\n\r\n4. 25G CWDM6 DML e-temp and i-temp\r\n\r\n5. Standard High DOP SOA 1550nm - Single and 5-array \r\n\r\n6. Low DOP SOA 1310nm for 100ZR	2021-03-30	20	Weekly update reports by team and monthly updates to CEO for BOD	NIL	NIL	1	1	1	NIL	NIL	NIL	null		144	430837474	3	\N	\N	\N
95	6S, Housekeeping and Safety	•\tTake ownership for the housekeeping compliance for the team and drive the team to achieve Zero NC due to housekeeping and Zero non-conformance for Safety\r\n•\tConstantly communicate with the team and align them on housekeeping and safety protocol\r\n•\tDrive the team for the ability to detect safety gaps and resolve them.\r\n•\tNeed to take ownership and responsibility for all safety related issues.\r\n•\tInform supervisor immediately for serious incidents. Need to ensure execution of preventive and corrective actions so that there is no reoccurrence of similar issues.\r\n•\tNeed to inform SM and above for Fab Evacuation and any Line Down issues	2020-12-31	10	Better 6S with reduced safety incident	NIL	NIL	1	1	1	NIL	NIL	NIL	null		148	135493917	5	\N	\N	\N
119	Support Key customer programs to meet Revenue targets for 2020	POET Projects for revenue:\r\n1) Provide alpha wafers for 25G DML flip chip process \r\n2) Provide beta wafers for Almae BH process	2020-12-31	10	Wafer acceptance by POET	NIL	NIL	1	1	1	NIL	NIL	NIL	null		218	673813648	3	\N	\N	\N
514	Goal 1	Objective 1	2021-12-31	50		I followed everything as per instructed	Actually you did not follow my comments during Goal Settings	1	1	1	NIL	NIL	NIL	Not On Track		\N	17	6	\N	\N	\N
121	Yield	Improve Wafer yield after fixing the process issues	2020-12-31	30	Eliminate the issues	NIL	NIL	1	1	1	NIL	NIL	NIL	null		218	673813648	6	\N	\N	\N
123	Personal development	1) Mentor new hires to bring them into working level\r\n2) Professional conversion program (PCP) for new employees\r\n3) Leadership skill development to lead the team	2020-12-31	10	Mentoring and PCP	NIL	NIL	1	1	1	NIL	NIL	NIL	null		218	673813648	5	\N	\N	\N
118	NRE	1. POET (Almae BH wafer and 25G DML for interposer)\r\n\r\n2. Acacia (1550nm racetrack SOA) \r\n\r\n3. Hitachi 1550nm SOA with 50nm bandwidth and P down.\r\n \r\n4. ZTE 1550nm Gain Chip and SOA with Psat of 21dBm \r\n\r\n5. Huawei 1550 High DOP SOA with Flip Chip	2020-12-31	15	Weekly update reports by team	NIL	NIL	1	1	1	NIL	NIL	NIL	null		144	430837474	3	\N	\N	\N
513	Goal 2	Objective 2	2021-01-31	50		Covid 19 is bad	Ok Very Good	1	1	1	NIL	NIL	NIL	Not On Track		\N	17	6	\N	\N	\N
397	Revenue	Meet company revenue goals for 2020	2020-12-31	30		NIL	Must meet new AOP targets in 2020	1	1	1	NIL	NIL	NIL	On Track		260	985791817	1	\N	\N	\N
34	Yield	DFB yield improvement to 70% and Others (SLED & ELED) to ~ 90%, Mechanical yield > 90%, Fix marginality issues (ripple issues, peeling, process consistency), 3 inch wafer demonstration,	2020-12-31	20	Yields, yield sigma	NIL	NIL	1	1	1	NIL	NIL	NIL	null		152	324340084	6	\N	\N	\N
164	Aging WIP reduction and Establish Utilization tracking	1. To reduce the Aging WIP in both manual station and autobar station based on the PPC plan by fully utilizing the equipment usage. \r\n2. To establish utilization tracking to track operations performance.\r\n3. To establish OEE and achieve a target of 60%, using Auk solutions software.\r\n4. Achieving cleaving CT 95% percentile 5 days.\r\n\r\nTracking Source/Documents:\r\n * email and weekly presentation report in the ops meeting\r\n1. G:\\Shared drives\\APT Team Folder\\APT Reports and Tracking\\Aging WO Tracking\r\n2. G:\\Shared drives\\APT Team Folder\\APT Reports and Tracking\\Machine Utilization\r\n3. The program was on-hold after the pilot phase. It is found that it still require another set of sensor and AI to calculate the true OEE considering the 3 components such as Availability x Peformance x Quality.\r\n4. G:\\Shared drives\\APT Team Folder\\APT Reports and Tracking\\WO CT_excel	2020-05-13	50	1.) G:\\Shared drives\\APT Team Folder\\APT Reports and Tracking	NIL	Tracking of excel manually is being presented by APT supervisor on the Aging WIP and Utilization although data accuracy is really in question during the 1H of 2020. 2H of 2020 of further automating the various typical semiconductor WIP reports with data accuracy thru W/O automation in ODOO is pivotal for measurement of success. A lot of time and effort from various department has been consumed as a concerted effort and this needs to be delivered. This needs to be driven and well communicated , and must Go-Live after cleaning up the pathway and road-blocks faced by the end users. \r\nThe utilization tracking using IoT sensors is a success as the AutoBar and Manual Station reports are validated to be accurate. The plan is to have the utilization reports fully accurate and validated before 2H of 2020 ends.	1	1	1	NIL	NIL	NIL	On Track		222	1014312820	4	\N	\N	\N
172	Achieve Revenue Target	Q Target        = Actual Revenue\r\nQ1: 1.2M       = 1.1M\r\nQ2: 2.2M       = 1M\r\nQ3: 4.2M       = 1.9M\r\nQ4: 3.4M       =	2020-12-31	15		NIL	To deliver any revenue goals, the contribution from Operational Excellence will come from ingenuity to deliver productivity improvement tools for the end user to use as a tool to improve their overall KPIs deliverables. Building accurate dashboards (Eg OTD Dashboards), Kaizen boards on the shop-floor, WIP management thru automation (Odoo) and thruput tracking thru automation (Odoo and in house sensors) becomes a key for this deliverable.	1	1	1	NIL	NIL	NIL	On Track		222	1014312820	6	\N	\N	\N
177	Identify and Fill all 2020 budgeted positions	1. Hire technicians and operators to fill the vacant positions, a total of 3 headcounts to hired. Provide training to operators.\r\n- Hired technicians were stuck in Malaysia due to pandemic.\r\n\r\n2. Reduce Attrition rate by 50%\r\n- This is data driven. Must understand the reasons behind attrition rate. Secondly, need to determine which department is the main contributor of the attrition rate. \r\n-If related to APT and mainly because of the training. The data must be tabulated to prove the hypothesis. Besides, all the apt operators were trained and certified which the document is keep by HR.	2020-12-31	2		NIL	Supervisor has changed and this becomes not applicable	1	1	1	NIL	NIL	NIL	On Track		222	1014312820	5	\N	\N	\N
445	Development of low PDG SOA devices	a) Develop low PDG SOA chips for 1310nm and 1550nm\r\n    - mid-year: samples of 1310nm low PDG SOA chip (p-side up)\r\n    - year-end: samples of 1550nm low PDG SOA chip (p-side up)\r\nb) Develop chip for p-down flip-chip assembly onto SiPh platform (Huawei delivery)\r\nc) Develop test methodology for low PDG SOA to meet spec and throughput requirement\r\nd) Oversee reliability qualification and product transfer from NPD to manufacturing\r\ne) Provide subject-matter engineering support for SOA device	2020-12-31	35	1) Product design file documents, 2) test reports, 3) manufacturing transfer doc	NIL	Great job producing Alpha samples. However concern about reliability, repeatability and supply. Need to establish production readiness.	1	1	1	NIL	NIL	NIL	On Track		150	1557152765	3	\N	\N	\N
146	Personal development	- File a patent / trade secret/publish technical paper\r\n- Cross training on each tools to have complete coverage\r\n- Mentor ship to IA students\r\n- Leadership participation from module side in 1 project that helps in revenue achievement.	2020-12-30	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		178	1776097184	6	\N	\N	\N
333	Efficient facility operation	- Daily monitoring of facility equipment & machines to ensure it is working smoothly. \r\n- Regular preventive maintenance and servicing to prevent unscheduled downtime or breakdown.\r\n- Utilize internal capabilities to repair or service of breakdown machines or equipment to avoid unnecessary costs.\r\n- Source out parts and services that offer value for money. \r\n- Review any under-contract services to cut down costs. \r\n- Energy saving initiatives.	2020-12-30	20	Checklist, weekly reports and PM reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		196	2047523461	4	\N	\N	\N
331	NPD Test Lab Operation	\tImplementation of tester SPC\r\n\tAutomate PER Test\r\n\tAutomate SOA Test\r\n\tDocumentation of new Tester Setup (SOA/PER/S21/RIN)	2020-12-30	25	Task3_Gantt.xlsx	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track	Task3_Gantt.jpg	146	1616831965	3	\N	\N	\N
198	New tools identification and purchase	For DL ramp up, quality improvement and cost reduction.	2020-12-30	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		178	1776097184	6	\N	\N	\N
202	Back up tools qualification	Ridge etch in SAMCO qualification	2020-10-30	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		192	206959734	4	\N	\N	\N
200	SLED production maintenance		2020-12-31	10	Produce SLED dies meeting program specification	NIL	NIL	1	1	1	NIL	NIL	NIL	null		194	290990818	4	\N	\N	\N
205	Reduction of CoNC		2020-12-31	15	Achieve >50% reduction	NIL	NIL	1	1	1	NIL	NIL	NIL	null		194	290990818	4	\N	\N	\N
136	TIBCO databased enhancement project	Kickoff TIBCO databased enhancement project by creating different scripts to extract data from different stations, and then consolidate together for better data accuracy, data traceability & fault investigation.	2020-12-31	40	MySQL Database	NIL	NIL	1	1	1	NIL	NIL	NIL	null		225	1256890838	4	\N	\N	\N
137	Yield System Setup	Yield System Setup: \r\n1. Establish weekly yield meeting report structure & driving system\r\n1.1 Establish weekly yield reporting framework\r\n1.2 Clean up the data source to ensure data accuracy\r\n1.3 Establish & align cum yield calculation methodology and list of criterias for yield calculation. \r\n1.4 Based on 75% cum yield goal, breakdown & establish individual goals for test/APT/Coating with clear ownership	2020-12-31	30	Tracking File	NIL	NIL	1	1	1	NIL	NIL	NIL	null		225	1256890838	5	\N	\N	\N
138	Procurement	Drive for cost savings with the suppliers and ensure supply assurance.	2020-12-31	25	Reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		149	759336758	4	\N	\N	\N
145	Cost reduction	- Identify cost reduction opportunities \r\ni) Litho rework reduction[On track, current performance at <7%]\r\nii) Resist coverage(DUV to i-line)\r\niii) 3" process readiness[Done for litho area, 3" chuck and coating recipe]	2020-12-30	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		178	1776097184	4	\N	\N	\N
163	COST: Cost saving	Cost saving\r\nReduce the cost of consumables\r\n1.Au in E-beam, sputter & Plating\r\n2. Pt in E-Beam	2020-12-15	10	SOP	NIL	NIL	1	1	1	NIL	NIL	NIL	null		209	1723530200	6	\N	\N	\N
398	Branding & Marketing	To implement a branding and marketing strategy to enhance DenseLight's branding image	2020-12-31	15	Presentation of branding activities	NIL	Great work in improving brand image of DLS.	1	1	1	NIL	NIL	NIL	On Track		260	985791817	6	\N	\N	\N
521	objective 1	description 1	2020-12-11	100	goal 2	NIL	NIL	3	1	1	NIL	NIL	NIL	On Track		\N	17	1	\N	\N	\N
60	Production Planning (Achieve Target Revenue 2020)	Achieve US$7.6M revenue in 2020 as per AOP	2020-12-30	50	Revenue File	NIL	NIL	1	1	1	NIL	NIL	NIL	null		153	253052978	1	\N	\N	\N
32	Revenue goal - Achieve > US$ 12.1M revenue in 2020 as per AOP	1) Support POET, 25G DML, Huawei SOA, Panwoo, Almae BH, BW10 and other Laser projects. 2) Help achieve 2 design wins for 1653DFB 10G i-temp & 25G DML or High power DFB c-temp, 3) Back up tools qual	2020-12-31	25	Revenue, design wins, back up tools	NIL	NIL	1	1	1	NIL	NIL	NIL	null		152	324340084	6	\N	\N	\N
188	Support Revenue Thru Critical Program Execution (SOA)		2020-12-31	15	Produce SOA dies meeting program specification	NIL	NIL	1	1	1	NIL	NIL	NIL	null		194	290990818	3	\N	\N	\N
301	Production Planning System Improvement(Odoo)		2020-12-31	30	Odoo System	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		215	161961016	5	\N	\N	\N
139	APT	Achieve shipment goals and hit key metrics for APT	2020-12-31	25	Reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		149	759336758	4	\N	\N	\N
342	Revenue Support	Recover CBT yield back to 85.6% (Q4) through baseline yield improvement breakthrough.\r\n\r\nQ3 Status:\r\nQ1 = 13 wafers tested, avg yield = 64.1%\r\nQ2 = 17 wafers tested, avg yield = 74.4%\r\nQ3 = 18 wafers tested, avg yield = 70.0%\r\nNo record of miss-shipment for first half of 2020.	2020-12-31	15	ELED Yield Improvement	NIL	NIL	1	1	1	NIL	NIL	NIL	null		169	1352141850	6	\N	\N	\N
140	Projects	Drive KFA projects to conclusion	2020-12-31	25	Reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		149	759336758	6	\N	\N	\N
229	KFA5.3	Efficient / effective integration between light source and agnostic platform (DPhi / optical interposer / fiber) for photonic integrated device application.	2021-01-01	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		234	2076006951	3	\N	\N	\N
130	External Manufacturing	Improve and manage business relationship and KPIs with the subcons.	2020-12-31	25	Subcon Reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		149	759336758	4	\N	\N	\N
173	Subcon Operational Management	To manage yield and cycle time of subcons	2020-12-31	25	QBR reports, SOWs	NIL	NIL	1	1	1	NIL	NIL	NIL	null		188	50985924	5	\N	\N	\N
515	Goal 2	Objective 2	2021-12-31	50		Due to Covid	OK noted	1	1	1	NIL	NIL	NIL	Not On Track		\N	17	6	\N	\N	\N
372	IT Management	Denselight’s Website on Google Analytics for Sales Department	2020-03-31	10	Configure automatically email to Sales Department for Analytics report monthly	NIL	NIL	1	1	1	NIL	NIL	NIL	null		164	1428738048	4	\N	\N	\N
401	Monthly BOD report to be send out by 2nd week	Ensure Board will be update at the regular interval and progress of the company	2021-01-15	25	Date BOD ppt report email out	NIL	Good work here to send report on time.	1	1	1	NIL	NIL	NIL	On Track		261	988735390	5	\N	\N	\N
402	Monthly closing within 4 working days	Financial reporting effectively close on the 4 working days after month end	2021-01-15	25	Date of closing and email out	NIL	Good job by the team here	1	1	1	NIL	NIL	NIL	On Track		261	988735390	5	\N	\N	\N
302	Maintain PRF system (TRX) and PO system (Quickbook). Ensure all POs are issued timely and track the status.	Maintain PRF system (TRX) and PO system (Quickbook). Ensure all POs are issued timely and track the status.	2020-12-31	30	PO Master data sheet	NIL	This is on track.	1	1	1	NIL	NIL	NIL	On Track		174	1904933651	4	\N	\N	\N
332	Manpower Management	\tContinuous training of new Process\r\n\tTransparent & Regular communication\r\n\tAutonomy in known work routine\r\n\tOpen for suggestion in improving the testing process	2020-12-30	25	Task4_Gantt.xlsx	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track	Task4_Gantt.jpg	146	1616831965	3	\N	\N	\N
516	adi	aditya	2020-12-11	20	aishwary	NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	18	3	\N	\N	\N
351	DFB 16xx: CBT yield goal	To achieve 75% of SMSR Yield for Almae wafer and 60% for Eulitha.	2020-12-31	20	To find out the best grating design for 16xx DFB	NIL	NIL	1	1	1	NIL	NIL	NIL	null	SMSR_vs_Kappa-L.JPG	252	10	3	\N	\N	\N
364	Talent Succession Planning via Functional Reviews	Ensure sufficient Benchstrength	2020-09-30	20	Functional Reviews Minutes	We have finished the Functional Reviews for Operations, Process/Prod Engr, Supply Chain, Sales and we have identified 2 additional section managers - Aaron, Chuan Ye in Subbu's team.  We have also conducted 3 out of 6 leadership training to help the new leaders/supervisor improve their managerial knowledge.	Need to do annual talent ranking excercise	1	1	1	NIL	NIL	NIL	On Track		256	534558467	5	\N	\N	\N
412	Quality	1) CONC, NCMR, RMA, SPC, Bin level SPC, Audits, PRM/ORT set up	2020-12-31	25	quality indices	NIL	Progress made on PRM/ORT, Bin Level SPC, audits, CONC	1	1	1	NIL	NIL	NIL	On Track		263	324340084	6	\N	\N	\N
184	Revenue	target to reach US$5M above revenue from Greater China in 2020	2020-12-31	50		NIL	NIL	1	1	1	NIL	NIL	NIL	null		157	25957709	6	\N	\N	\N
323	Production Cost Improvement	Process Yield Improvement/Scrap Reduction:	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		181	1536568573	4	\N	\N	\N
199	ELED production maintenance		2020-12-31	10	Produce ELED dies meeting program specification	NIL	NIL	1	1	1	NIL	NIL	NIL	null		194	290990818	4	\N	\N	\N
201	FBGL production maintenance		2020-12-31	10	Produce FBGL dies meeting program specification	NIL	NIL	1	1	1	NIL	NIL	NIL	null		194	290990818	4	\N	\N	\N
382	Team management for MFG, Fab B & MOCVD Equip and Facility	• Ensure all my team members always align to the company goals. • Maintain employee work schedules including assignments, job rotation, training, vacations and paid time off, good team communication, coverage for absenteeism, and all other work related scheduling. Goal is to ensure there is always good equipment support to the MFG need. • Empower employees to take responsibility for their jobs and goals. Delegate responsibility and expect accountability and regular feedback. • Foster a spirit of teamwork and unity among equip and other departments (MFG, Process, facility), allows for disagreement over ideas, conflict and expeditious conflict resolution, and the appreciation of diversity as well as cohesiveness, supportiveness , and working effectively together to enable each team members, other departments and company to succeed.	2020-12-31	10	Better team work and productivity	NIL	BS is a good manager but attrition rate is high for direct staff	1	1	1	NIL	NIL	NIL	On Track		259	135493917	5	\N	\N	\N
522	goal 1	objective 1	2020-12-11	100	goal 1	NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	17	1	\N	\N	\N
335	Customer oriented, impartiality and honesty	- Serve internal customers at high satisfaction to meet performance expectations.  \r\n- Engage external customers with professionalism, fairness and honesty when doing activities and services.	2020-12-30	20	Checklist, Reports and documents	NIL	NIL	1	1	1	NIL	NIL	NIL	null		196	2047523461	1	\N	\N	\N
392	DMES Phase 2 - Fab B Automation	Original Objective:\r\nDevelop/Write a program application using Microsoft Visual studio and C# Language with Maria DB Server\r\n1a. Operation Tool\r\n1b. Engineering Tool \r\n1c. Dashboard Tool \r\n1d. Production Scheduler\r\n\r\nNew Objective:\r\nTo improvise the DenseSoft system into new face with advanced features. DenseSoft is changed to DMES and divided to several Phases. \r\nPhase 1:\r\n1a) Operation Tool \r\n- Wafer Execution with separate functionality for each steps\r\n  > Generic\r\n  > QC Parameter Insertion\r\n  > Litho\r\n  > Litho Cleaning Procedure\r\n  > Transaction History\r\n  > Rework\r\n  > Event Log\r\n  > Rework History\r\n1b) Engineering Tool with advanced features\r\n- Enable Engineer to update and maintain Fab B Registry\r\n  > Mask\r\n  > Product Code\r\n  > Equipment\r\n  > Recipe\r\n  > Module\r\n  > Stage\r\n  > Block\r\n- Enable Engineer to Create Runsheet Template \r\n  > Modify Runsheet template using form view\r\n  > Modify Runsheet Template using Excel - Download and Upload\r\n- Enable Engineer to create Runsheet for Wafer Release\r\n  > Production Runsheet\r\n  > Engineering Runsheet\r\n  > Formula Selection\r\n  > Hold\r\n  > Skip	2020-05-01	35	DMES Phase 2	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track	Capture.PNG	214	1608216415	3	\N	\N	\N
320	Production Planning (Inventory & Materials/Forecast)		2020-12-31	20	Inventory and Forecast Files	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		213	426739617	4	\N	\N	\N
33	Quality	1) CONC, NCMR, RMA, SPC, Bin level SPC, Audits, PRM/ORT set up	2020-12-31	25	quality indices	NIL	NIL	1	1	1	NIL	NIL	NIL	null		152	324340084	6	\N	\N	\N
36	Operational efficiency	Denton I29 qual, Back up tools, Cost reduction activity, SOP implementation, SPS systems set up, Process control and monitoring,	2020-12-31	15	indices	NIL	NIL	1	1	1	NIL	NIL	NIL	null		152	324340084	4	\N	\N	\N
373	IT Management	Implementation Sales module in Odoo – Intranet for Sales Department	2020-09-30	10	Modify Sales Module as per Sales Department requirements	NIL	NIL	1	1	1	NIL	NIL	NIL	null		164	1428738048	4	\N	\N	\N
379	Software Management	Synchronization from Odoo – Intranet Sales to Quickbook on new Customer Account creation. Currently sales team still have to do double work to create a customer account in Odoo – Intranet and Quickbook	2020-12-31	10	Follow up with external 3rd party Odoo vendor (Pragmatic - India) to fix the issues on synchronization from Odoo to Quickbook or find other work around solutions	NIL	NIL	1	1	1	NIL	NIL	NIL	null		164	1428738048	4	\N	\N	\N
303	Achieve cost savings of >$250k for 2020	Achieve cost savings of >$250k for 2020	2020-12-31	30	PO Master data sheet	NIL	This is on track.	1	1	1	NIL	NIL	NIL	On Track		174	1904933651	4	\N	\N	\N
380	6S, Housekeeping and Safety	• Take ownership for the housekeeping compliance for the team and drive the team to achieve Zero NC due to housekeeping and Zero non-conformance for Safety • Constantly communicate with the team and align them on housekeeping and safety protocol • Drive the team for the ability to detect safety gaps and resolve them. • Need to take ownership and responsibility for all safety related issues. • Inform supervisor immediately for serious incidents. Need to ensure execution of preventive and corrective actions so that there is no reoccurrence of similar issues. • Need to inform SM and above for Fab Evacuation and any Line Down issues	2020-12-31	10	Better 6S with reduced safety incident	NIL	Good safety record	1	1	1	NIL	NIL	NIL	On Track		259	135493917	5	\N	\N	\N
196	Facilty Project and repair	installation Of NEW new water cooling chiller system.\r\n\r\nRepair and install 13 new FFU for the clean room APT and FAB B.\r\n\r\nImplement at least 5 improvement projects by Dec 2020\r\n\r\nImplement 10 new SOP to improve the facility equipment’s reliability, be it hardware of system improvement.\r\n\r\nImprove Facilities maintenance program to zero out the facility breakdown. \r\n\r\nImprove the factory facility for better safety and work environment.	2020-12-30	35		NIL	NIL	1	1	1	NIL	NIL	NIL	null		197	1017729787	4	\N	\N	\N
230	SOA	To assist in checking the device capability which meets the customer requirements.	2021-01-01	5		NIL	NIL	1	1	1	NIL	NIL	NIL	null		234	2076006951	3	\N	\N	\N
295	NPD and NRE	To assist NPD in the process development samples execution to improve Time to Market	2020-12-31	10	NA	NIL	NIL	1	1	1	NIL	NIL	NIL	null		167	973701598	3	\N	\N	\N
336	EHS improvement & compliance	- Implement DSL EHS policies.\r\n- Ensure DSL is a safe place to work.    \r\n- Comply with authorities requirements, such as permits, licenses, medical checks and safety measures. \r\n- Implement and improve existing EHS procedures and guidelines. \r\n- Ensure effective ERT (Emergency Response Team) organization\r\n- Review and improve ERP (Emergency Response Plan)\r\n- Regular EHS audit to monitor  effectiveness and performance.\r\n- Assist all departments to comply with the Risk Assessment, so as to identify and evaluate risks in their area and that the proper control measures are in place.	2021-12-30	40	Checklist, reports and EHS documents.	NIL	NIL	1	1	1	NIL	NIL	NIL	null		196	2047523461	6	\N	\N	\N
517	fff	fff	2020-12-11	100	ff	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		\N	17	3	\N	\N	\N
314	ILM engineering and manufacturing processes and systems	ILM engineering and manufacturing processes and systems\r\n•\tPlan and Support on ILM engineering and manufacturing for production line.\r\nA lot of things to learn at same time, run for production to meet shipping date.\r\nQuality VS Time	2020-10-30	10	Meet Q3 for Yield of boxes	NIL	NIL	1	1	1	NIL	NIL	NIL	null		220	231731743	6	\N	\N	\N
307	Achieve and Revenue	Achieve US$ 7.5M  Revenue in 2020 as per base AOP.  Stretch goal is $3.4M\r\nOperations for Q4\r\nKey measures:\r\n1)\tMeet monthly and quarterly target.\r\n2)\tMaintain 90% Box yield for box assembly on Q3\r\n3)\tEnsure and maintain supply of raw materials in follow up and estimate of based on Q4.	2020-09-30	70	Meet Q3 for Yield of boxes	NIL	NIL	1	1	1	NIL	NIL	NIL	null		220	231731743	1	\N	\N	\N
204	Support Runsheet Conversion to DMES		2020-09-30	10	Transfer all runsheets to DMES	NIL	NIL	1	1	1	NIL	NIL	NIL	null		194	290990818	4	\N	\N	\N
126	Back up tools qualification	Release Grating etch recipe in SAMCO tool	2021-03-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		192	206959734	4	\N	\N	\N
381	Training	• Take ownership for the team training needs and attendance. • Ensure MFG Engineer and Equip SM assigned training for team member are follow through closely. • Ensure training received by team members are aligned and help in the execution of their work responsibility. • Responsible to ensure OJT for new comers to address their working needs	2020-12-31	10	Skill and training record	NIL	Need to improve operator training in Fab B	1	1	1	NIL	NIL	NIL	On Track		259	135493917	5	\N	\N	\N
374	IT Management	Implementation Manufacturing Order module in Odoo – Intranet for APT - Operation Department	2020-09-30	10	Modify Manufacturing Order Module as per APT - Operation Department requirements	NIL	NIL	1	1	1	NIL	NIL	NIL	null		164	1428738048	4	\N	\N	\N
321	Production Planning System Improvement(Odoo)		2020-12-31	30	Odoo System	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		213	426739617	5	\N	\N	\N
523	goal 1	objective 1	2020-12-11	100		NIL	NIL	3	4	1	NIL	NIL	NIL	On Track		\N	17	1	\N	\N	\N
304	Drive Subcon on time delivery and shorten lead time		2020-12-31	30	SUBCON WIP EXCEL TRACKING SHEET	NIL	Chen Yan has done a great job to drive the subcons to meet our requested deliveries and lead time has also improved.	1	1	1	NIL	NIL	NIL	On Track		174	1904933651	4	\N	\N	\N
369	NLW Laser / FBGL	To support sales and achieve the revenue for the NLW laser product	2020-12-31	16	To support sales and achieve the revenue for ILM product	NIL	NIL	1	1	1	NIL	NIL	NIL	null		252	10	1	\N	\N	\N
355	ILM	To support sales and achieve the revenue for ILM product	2020-12-31	16	To support sales and achieve the revenue for ILM product	NIL	NIL	1	1	1	NIL	NIL	NIL	null		252	10	1	\N	\N	\N
452	DMES Phase 3 - Fab B Automation	Original Objective:\r\nDevelop/Write a program application using Microsoft Visual studio and C# Language with Maria DB Server\r\n2a. Analysis\r\n2b. Planning\r\n2c. Design\r\n2d. Execution\r\n2e. Testing (User Acceptance)\r\n2f. Deployment\r\n\r\nNew Objective:\r\nDue to Project reprioritization, objective is changed from GATR to DMES Phase 3.\r\n2a) Engineering Tool with advanced features\r\n - Enable engineers to modify the Runsheet after the runsheet is released to Production\r\n - Code QC Formula for all types of Runsheets \r\n - Enable Engineer to set \r\n2b) Implement all Fab B technologies in DMES\r\n  > FBGL\r\n  > DFB\r\n2c) Modify DMES Wafer Execution\r\n- DMES will compute the formula based on runsheet type\r\n- Enable Manufacturing team to select Equipment on certain steps	2020-09-30	35	DMES Phase 3	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track	2.PNG	214	1608216415	3	\N	\N	\N
365	IT Management	Preparing Virtual Machine for 7 Virtual PC to hold 1 License of Windows 10 Pro, Ms Office 2019, JMP and Quickbook.	2020-03-31	10	Purchased Synology RS1619XS+	NIL	NIL	1	1	1	NIL	NIL	NIL	null		164	1428738048	4	\N	\N	\N
377	Software Management	Tibco Spotfire and JMP implementation on Virtual PC	2020-09-30	10	Purchased 2 Virtual Machine (12 Virtual PC) to host 2 JMP licenses and also Tibco Spotfire installed on all VPC	NIL	NIL	1	1	1	NIL	NIL	NIL	null		164	1428738048	4	\N	\N	\N
344	New Product Development	To add new product line-up in addition to company's existing product portfolio.	2020-12-31	15	Customer Engagement	NIL	NIL	1	1	1	NIL	NIL	NIL	null		169	1352141850	3	\N	\N	\N
168	PDMS Data Migration	Continuously support the team to complete the PDMS Data Migration to the its  Database by \r\n1. Establishing a folder structure and naming convention.\r\n2. Rectifying issues found in the test folders.	2020-12-31	3	http://pdfwin.denselight.com:8080/spotfire/library?guid=3b65dd09-212a-47b7-9ebf-71d860a42337	NIL	Achieved goal in the 1H chipping in to validate structure driven by PE	1	1	1	NIL	NIL	NIL	On Track		222	1014312820	4	\N	\N	\N
167	KFA 3.6 Timely Capacity Expansion for Revenue Ramp	To fulfill the goal of the KFA by \r\n1.) Establishing a capacity model, compute existing and forecasted volume.\r\n2.) Re-layout APT and ILM to improve efficiency	2020-12-31	20	G:\\Shared drives\\SBP Team Drive\\KFA 2020\\KFA 3 (Subbu and BS)\\KFA 3.6 (Syrex)	NIL	1) Need to fine tune the capacity model which has to be interactive with dynamic demand forecast , and the industrial parameters/ assumptions needs to refine - The weakness of the model is the UPH where there's no check and balance and accuracy is in question. Will need to improve this further as a overall capacity model in the 2H \r\n2) Re-Lay out underway by the APT team in the 2H.	1	1	1	NIL	NIL	NIL	On Track		222	1014312820	4	\N	\N	\N
170	Supply Chain - Goods Receiving	a. Ensure 100% goods received are processed in QuickBooks in a timely and accurate manner\r\nb. Process Improvement on Goods Received Flow	2020-12-31	10		-\tExamines Good Received procedure effectiveness and seeks better procedures by collaborating with Finance, QA and procurement team to derive a written procedure on Goods Receiving.\r\n-\tEnsure orders are closed timely in system after goods received and keep documents (DO, service report) organized in the Google drive.	NIL	1	1	1	NIL	NIL	NIL	On Track		207	1779366736	6	\N	\N	\N
171	Sales & Marketing	a. Project completion on revamping the website\r\nb. Work with PE and PPC team to clean up all Product lists and remove the obsolete ones. Also, to understand from them which products are difficult to build\r\n-\tUpdate all Product Brochures with up-to date Product list\r\n-\tMaintain the website with up-to date Product list\r\nc. Improve DenseLight branding through social media. Create social media contents and post it twice a month in LinkedIn\r\nd. Provide Customer Service support for USA region \r\n-\tQuote within 48hours after receive an inquiry\r\n-\tEnter Sales Order and then send Order confirmation to Customer within 48hours after PO receive.\r\n-\tSupport after-Sales support such as chase for payment and provide shipping document to Customer after shipment has shipped.	2020-12-31	55		-\tStarted the Sales operation function in May’2020 and working with Sales to get a total of U$256K POs (excluded POET) from the USA region. \r\n-\tRecognizes the needs of support for Marketing and reaches out to lend a helping hand on the branding activities which included working with vendor and internal team on the new website, designing the graphics, creating videos, content management for 5 social media platforms and company website, participating the virtual exhibition and setting up the virtual booth – 2xEPIC webinars, OIDA, SSIA, SGUnited, CIOE, ITAP, Luxmux @PhotonicSG conference.	NIL	1	1	1	NIL	NIL	NIL	On Track		207	1779366736	6	\N	\N	\N
176	KFAs	To ensure objectives of participating KFAs are achieved	2020-12-31	25	KFA Reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		188	50985924	5	\N	\N	\N
165	KFA 1.3 People's Development and KFA 4.3 Automation in APT	To support and fulfill the goal of KFA 1.3 and KFA 4.3	2020-12-31	10	G:\\Shared drives\\SBP Team Drive\\KFA 2020	NIL	Early Participation achieved in the KFA 1.3 , not much contribution on KFA 4.3 although both KFA's been led well by their leaders with some results.	1	1	1	NIL	NIL	NIL	On Track		222	1014312820	4	\N	\N	\N
518	sss	ss	2020-12-11	100	ss	NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	17	3	\N	\N	\N
185	sale channels/distributors	Sign two or more distributors in Greater China	2020-12-31	25	Distribution contract documents	NIL	NIL	1	1	1	NIL	NIL	NIL	null		157	25957709	1	\N	\N	\N
175	APT operational improvements	To commision and complete buy-off of new APT equipment and to create new recipes, if required.	2020-12-31	25	Buyoff reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		188	50985924	4	\N	\N	\N
174	Development of new products at subcons	To develop new engineering products at various subcons	2020-12-31	25	SOWs, ATRs	NIL	NIL	1	1	1	NIL	NIL	NIL	null		188	50985924	3	\N	\N	\N
322	Cost Reduction/Capex Avoidance	Yelo Burn-in Machine Qualification to COS – Q2\r\nILX Module Burn-in Capacity Improvement – Q3\r\nReview the gap between ST1 and ST4. Define actions that we can take to bring up ST1 to be as capable as ST4. Provide proposal to management.	2020-12-31	30		NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		181	1536568573	4	\N	\N	\N
305	Reporting of Expense and Savings		2020-12-31	10	PO Master data sheet	NIL	Chen Yan has a database that she created and she is updating this regularly.	1	1	1	NIL	NIL	NIL	On Track		174	1904933651	4	\N	\N	\N
337	Development of Instrument class libraries for automation	To develop and maintain class modules and libraries for various hardware/instrument/devices available in lab and that procured for use in future projects.	2020-12-31	50	Kanban Board	NIL	Able to deploy the coexistence of ANDO & Yokogawa OSA.	1	1	1	NIL	NIL	NIL	On Track		183	711389827	4	\N	\N	\N
310	Capacity Improvement	Implement Set-up for BFs Coil winding. Done\r\n\r\nBut I put addition foam to prevent from wobbly and also install holder fiber tool so that your hand can be brake for spool\r\n\r\nIt can work on FOS4X coil, I would like to experiment on it later or soon.	2020-10-30	10	Upgrade modify	NIL	NIL	1	1	1	NIL	NIL	NIL	null	Coil.jpeg	220	231731743	4	\N	\N	\N
475	40mW FBGL module		2020-12-31	15		NIL	NIL	1	1	1	NIL	NIL	NIL	null		145	1813039923	3	\N	\N	\N
166	Executive Assistant	a. Manage CEO’s calendar, advise on conflicting events and carry out multiple rescheduling as necessary.\r\nb. Prepare and compile monthly Townhall presentation decks\r\nc. Manage the Travel bookings timely, accurate and represent good value for money.	2020-12-31	10		- Initiates creative ideas to create new communication template for Townhall that's bring fresh new look to the employees. \r\n- Prepared the townhall presentation slides monthly and timely.\r\n- Responds quickly to new instructions, situations to assist the CEO.	NIL	1	1	1	NIL	NIL	NIL	On Track		207	1779366736	6	\N	\N	\N
345	MOPA development	Develop 200mW MOPA prototype for WindLidar applications	2020-11-30	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		145	1813039923	3	\N	\N	\N
505	Hunet Test	Hunet Test	2020-09-09	100		NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		\N	17	1	\N	\N	\N
182	DPHI implementation, including HIPP to OE solutions engineering	Design of OE solutions based on DPhi technology. \r\n- Optical Engine\r\n- Optical Transceiver\r\n- Narrow Linewidth Engine	2021-03-01	20	Patents/Design documents/Technical reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		200	1777433913	3	\N	\N	\N
181	DLS-AMF MOU and POC1&2	To successfully complete collaborative project with AMF for \r\n1) POC1 - Demonstration and analysis of optical coupling between Mode field adapter (MFA) devices and edge coupler on AMF Silicon Photonics platform.\r\n \r\n2) POC2 - Deliver a Flip-chip solution for InP devices on Silicon photonics platform and demonstration of Flip-chip coupling on AMF Silicon Photonics platform.	2021-03-01	30	Design documents/Technical reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		200	1777433913	3	\N	\N	\N
180	DPhi and Optical Engine solutions Technical Directions	To develop and contribute to the collective technology and know-how of DPhi which provides Denselight with the competitive edge in the integrated photonics market.	2021-03-01	30	Patents/Design documents/Technical reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		200	1777433913	3	\N	\N	\N
183	Denselight Semiconductor Optical Amplifier (SOA) development program	Identifying and proactively provide technology development engineering support to NRE programs, NPI projects, Product Engineering, and APT, in the area of advanced packaging integration & related test engineering	2021-03-01	20	Design documents/Drawings/Technical reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		200	1777433913	3	\N	\N	\N
38	Accounts Payable Management	Accounts payable e-payment to be done when term due or fund available, monitor closely of advance payment and accounts payable balance, notify vendor when payment made.	2020-12-31	60	NIL	NIL	Agreed within cash flow allow	1	1	1	NIL	NIL	NIL	On Track		227	104959828	6	\N	\N	\N
203	Support Conversion of 2" to 3" Wafer Processing		2020-12-31	15	3" wafer fabrication successful with comparable yield as 2"	NIL	NIL	1	1	1	NIL	NIL	NIL	null		194	290990818	4	\N	\N	\N
189	pico track qualification	1.already finished all coating recipe qualification and 1 develop recipe qualification at July-2020\r\n2.will finish other develop recipe qualification before Nov-30th-2020"	2020-11-30	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	589561367	5	\N	\N	\N
519	dd	dd	2020-12-11	100	dd	NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	18	3	\N	\N	\N
207	Meet revenue target	To achieve revenue target in 2020. Revenue target is , for 16xx DFB US$1857K and for other products US$3285K in China market( Company's annual sales revenue is US$13440K).	2020-12-31	50		NIL	NIL	1	1	1	NIL	NIL	NIL	null		195	1369735000	1	\N	\N	\N
206	To promote new products to customers	Promote new products( 25G CWDM4 DFB, 1550nm gain chip and SOA etc) to telecom customers, such as tranceiver makers, Huawei, ZTE etc.	2020-12-31	40		NIL	NIL	1	1	1	NIL	NIL	NIL	null		195	1369735000	3	\N	\N	\N
394	Operational Efficiency	To implement programs and or processes that enable sales to increase operational efficiency	2020-04-30	15	Presentation of system/s that increase efficiency	NIL	Good job on the SOA, CRM implementation in Odoo.	1	1	1	NIL	NIL	NIL	On Track		260	985791817	4	\N	\N	\N
338	DITA Platform Build	To develop, maintain and enhance DITA to cater to everyday needs of Test Automation.	2020-12-31	50	Kanban Board	NIL	Combination of SOA/PER/LIV/OSA test panel were done.	1	1	1	NIL	NIL	NIL	On Track		183	711389827	4	\N	\N	\N
187	Support Revenue Thru Critical Program Execution (Low DOP)		2020-12-31	15	Produce Low DOP dies meeting program specification	NIL	NIL	1	1	1	NIL	NIL	NIL	null		194	290990818	3	\N	\N	\N
208	Routine work	Routine work, such as to join weekly revenue call, invite R&D engineer to introduce our new products to customers and provide forecast to factory etc	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		195	1369735000	6	\N	\N	\N
354	KFA 3.2	To establish centralized database for Denselight starting from fab A to APT	2020-12-31	16	To establish centralized database for Denselight starting from Fab A to APT	NIL	NIL	1	1	1	NIL	NIL	NIL	null		252	10	4	\N	\N	\N
375	IT Management	Implementation Inventory Planning module in Odoo – Intranet for PPC Department	2020-09-30	10	Modify Inventory Module as per PPC Department requirements	NIL	NIL	1	1	1	NIL	NIL	NIL	null		164	1428738048	4	\N	\N	\N
506	Hunet Test	hunet test	2020-09-09	100		hunet test	Hunet Test Manager	1	1	1	NIL	NIL	NIL	On Track		\N	17	1	\N	\N	\N
370	IT Management	Telephone line upgrade, Starhub Telephone Lines configuration and tracing lines points	2020-03-31	10	Prepare rack for Starhub Gateway and lines hubs	NIL	NIL	1	1	1	NIL	NIL	NIL	null		164	1428738048	4	\N	\N	\N
234	01) DPHI HIPP Process Engineering Optical Engine Development Documentation	Process capability development by implementation of HIPP packaging process technology for Silicon Photonics (SiPh) based optical engine products. HIPP process definition, process execution, technical analysis, reporting, and documentation.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		171	9327697	3	\N	\N	\N
228	High Power DFB	To develop a disruptive, high power performance from CW DFB for the telecom/datacom/CWDM applications according to customer's requirements.	2021-01-01	80		NIL	NIL	1	1	1	NIL	NIL	NIL	null		234	2076006951	3	\N	\N	\N
240	07) Quality System Audit	Support QA and External Manufacturing teams on Supplier & Customer Quality Audit and ISO9000 Internal Quality Audit.	2020-12-31	8		NIL	NIL	1	1	1	NIL	NIL	NIL	null		171	9327697	4	\N	\N	\N
241	08) DenseLight Manufacturing Execution System (DMES) support	Support QA and IT teams in validating the changes in the runsheet to ensure no bugs and no issue will be encountered when production use the runsheet.	2020-12-31	2		NIL	NIL	1	1	1	NIL	NIL	NIL	null		171	9327697	4	\N	\N	\N
242	Customer Quality: RMA/Customer Complaints and Feedback	1.\tReduction of customer Valid RMA\r\n-\tReduce customer RMA to 30% from the previous year (2019)\r\n2.\tReduction RMA closure cycle time (CAPA submission)\r\n-\tReduce RMA Interim report submission to 30days (upon received of complete information or RMA units)\r\n-\tReduce RMA Final CAPA closure time to 60days (upon received of complete information or RMA units)	2020-12-31	30	Customer Complaint/RMA Record	NIL	NIL	1	1	1	NIL	NIL	NIL	null		180	1611091001	1	\N	\N	\N
346	1560nm Module	Develop 1560nm FBGL module	2020-12-31	15		NIL	NIL	1	1	1	NIL	NIL	NIL	null		145	1813039923	3	\N	\N	\N
277	Equipment maintenance, CIPs and mindset change	•\tPerform at least 10 improvement to the machine for better productivities or machine reliability. \r\n•\tTo ensure the team login and update the Equipment status properly into the daily equipment status tracking file.   \r\n•\tTo be able make logical and decisive decision to safe guard the company need. \r\n•\tGood to raise concern, but always come up the work around solutions to get things moving.	2020-12-30	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		237	22592094	4	\N	\N	\N
399	Prepare product costing from May to Nov 2020	Prepare product costing for pricing and reference cover FBGL to ILM	2020-12-31	25	Costing excel worksheet	NIL	David has done well in understanding the product costing	1	1	1	NIL	NIL	NIL	On Track		261	988735390	4	\N	\N	\N
160	QUALITY: Documentation for Processes & Tools, Training of Operators and Asses them, NCMR closure	Documentation for all processes & tools\r\n\r\nTraining of Operators and Asses them\r\n\r\nNCMR closure on time	2021-03-01	10	No undocumented processes & tools- SOP, WI, ECN	NIL	NIL	1	1	1	NIL	NIL	NIL	null		209	1723530200	6	\N	\N	\N
179	NPD: 25G coating Qual (Alu DFB) in Denton I29, Low stress SiO2 film for 25G projects, Low Stress SION recipe in Oxford for 25G products/ Renesas projects, KFA 5.2 : BH development	25G Qualification in Denton I29\r\n 1. DOE for the Ar ablation \r\n 2. AR & HR coating stacks for Alu containing QWs in Denton I29\r\n 3. Coating Jig for 150um CL\r\n 4. Develop Ar sputter recipe and show no Al at interface\r\n 5. AR coating for Hermetic devices- HTOL + TS + ESD pass\r\n 6. AR/HR coating for non-Hermetic devices- Pass HTOL, TS, ESD & USDH\r\n\r\nLow stress SiO2 film for 25G projects\r\nSiO2 Film analysis: \r\n1. RI\r\n2. uniformity\r\n3. Stress\r\n4. Etch rate\r\n\r\nLow Stress SION recipe in Oxford for 25G products/ Renesas projects\r\nProcess optimization for SION recipe in Oxford\r\n\r\nKFA 5.2 : BH development	2021-03-01	30	Need to pass Qual criteria (HTOL, Thermal shock & UDH). Documentation for the processes in the tool	NIL	NIL	1	1	1	NIL	NIL	NIL	null		209	1723530200	3	\N	\N	\N
178	OPERATIONS: Denton I29 complete Qualification ( Tool Qual & Product Qual),  AR & HR coating Jigs, Productivity improvement in Oxford and Trion, Back up tool, Oxford AR coating back up for Trion, Daitron Bar stacker Qual & Jig Duplication, Filmetrics F40-ERX Qual, Cary 5000 Spectrophotometer Qual	Denton I29 Tool qualification\r\n 1. Tool Installation: \r\n 2. Process development: calculate n and k values, TF, Recipe developments, \r\n 3. Coating designs for AR & HR\r\n 4. Deposition & spectral measurement for the stacks\r\n 5. Tool Qual: SLED & DFBs\r\n      ( Process development, Deposition ) \r\n      ( Pass- CBT, HTOL, TS & ESD )\r\n\r\nProduct Qual in Denton I29\r\n 1. ELEDs:  CBT & HTOl 2000Hrs Qual\r\n 2. SOA High Psat-  CBT & HTOl 2000Hrs Qual\r\n\r\nAR & HR coating Jigs\r\n\r\nProductivity improvement in Oxford and Trion\r\n\r\nBackup tool readiness\r\n\r\nOxford AR coating back up for Trion\r\n\r\nDaitron Bar stacker Qual & Jig Duplication\r\n\r\nFilmetrics F40 ERX new tool Qual and release for production\r\n\r\nCary 5000 Spectrophotometer Qualification	2021-03-01	50	Need to pass Qual criteria (HTOL, Thermal shock & UDH). Documentation for the processes in the tool	NIL	NIL	1	1	1	NIL	NIL	NIL	null		209	1723530200	4	\N	\N	\N
225	Support activities focused on improvements of the workflow in Fab A	-Set up SPC for Fab A tools as well as various products to monitor and analyze process input parameters and output characteristics which affects the quality of epilayer growth\r\n-Work on monthly KPI reports and send it on time\r\n-Create/Revise procedures for measurement as well as preventive maintenance for various equipment in Fab A\r\n-Provide actual information about grown wafers to Fab B engineers	2020-12-31	30		NIL	Agree	1	1	1	NIL	NIL	NIL	On Track		211	1510925941	4	\N	\N	\N
116	KFA 5.1 - Product Development System	1. Improvement and Implementation PRA and RFC\r\n\r\n2. Improvement and Implementation of PDM\r\n\r\n3. Develop Benchmarking method \r\n \r\n4. Implement ROI template	2020-12-31	5	Monthly KFA 5 update to management	NIL	NIL	1	1	1	NIL	NIL	NIL	null		144	430837474	5	\N	\N	\N
520	cc	cc	2020-12-11	100	cc	hello	NIL	1	1	1	NIL	NIL	NIL	On Track		\N	17	3	\N	\N	\N
224	Perform In house ECV measurements on InP-InGaAsP layers	-Perform ECV measurements to check the doping level\r\n-Verify DLS measurements with that of CSDC measurements\r\n-Make sure ECV hardware is operational\r\n-Design a calibration procedure to maintain the accuracy of dopant profiles	2020-12-31	30	ECV Doping profile document	NIL	Agree	1	1	1	NIL	NIL	NIL	On Track		211	1510925941	6	\N	\N	\N
235	02) DPHI HIPP Process Engineering Optical Engine Suppliers Management	Develops engineering process capabilities of external outsource partners to execute HIPP for both prototyping and production phases. Establish outsourcing partners; qualified modular process building blocks, technical specifications, drawings, scope-of-work, reports and lots-compliance requirements.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		171	9327697	3	\N	\N	\N
239	06) Technical Documentation (QA DCC)	Gap analysis to verify technical documents. Sales datasheet creation. Product Data Management Systems (PDMS) product specification QA support.  Product development model (PDM) documentation compliance for every phase gate before phase exit until production transfer.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		171	9327697	4	\N	\N	\N
236	03) DPHI AMF(POC1&2) HIPP Process Engineering Support	Provide HIPP Process Engineering support for DPHI Silicon Wafer Backend Processing (POC2.3) and DPHI Flip Chip Assembly (POC2.4) activities.	2020-12-31	8		NIL	NIL	1	1	1	NIL	NIL	NIL	null		171	9327697	3	\N	\N	\N
237	04) KFA5.3 HIPP Process Engineering Support	Development of new HIPP roadmap capabilities, processes and engineering advancements.	2020-12-31	2		NIL	NIL	1	1	1	NIL	NIL	NIL	null		171	9327697	3	\N	\N	\N
238	05) Quality Management System (QMS)	QMS documentation gap analysis and document control centre QMS documentation reviews. Keep and control all document and data pertaining to QMS documentation procedure, work instructions and manufacturing specs.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		171	9327697	4	\N	\N	\N
120	Operations	Create back up tool run path for one of a kind tools	2020-12-31	20	Wafer acceptance by NPD and pass reliability (2000hrs HTOL pass)	NIL	NIL	1	1	1	NIL	NIL	NIL	null		218	673813648	6	\N	\N	\N
243	In-Process Quality Assurance Improvement Activities	1.\tImprovement to In-coming Quality Assurance\r\n-\tEstablish Incoming Process Control for direct materials (substrates, mask plates, chemicals, gases, others,) using the COC of these materials\r\n-\tCreate incoming inspection request google form and deploy to PPC for any materials required incoming inspection\r\n-\tCentralize documentation and acceptance for incoming material inspection by creating google shared drive for all department incoming material documentations and approval\r\n2.\tImprovement to Process compliance\r\n-\tRe-establish Monthly Quality Patrol Audit to counter check process and manufacturing process compliance to requirement and standard. To check Recipe, Runsheet, GATR, WAT and Test data & results (FMEA, Control Plan and SPC check included)\r\n-\tInclude 6S in the audit checklist to support the 6S program\r\n3.\tRe-institutionalize good housekeeping such as 6S program\r\n-\tConduct 6S orientation/training to all employee. \r\n-\tReward and commendation every townhall for best department 5S performance	2020-12-31	30	Incoming Record, Incident Notice Report, Audit Report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		180	1611091001	4	\N	\N	\N
244	Supplier Quality and CoNC Improvement	1.\tReduction Cost of Non-conformance (CoNC)\r\n-\tReduce Cost of Non-conformance (CoNC) by <5% with respect to the total cost of goods sold (COGS)\r\n2.\tImprovement of External Manufacturing Performance\r\n-\ta)\tReduce Reject/Scrap rate by 2%\r\n-\tb)\tReduce Vendor CoNC by 2% from previous year (2019)\r\n-\tImprove response time to quality issue\r\no\tInterim Report submission 7 days\r\no\tFinal closure 30 days\r\n3.\tImprovement of external manufacturing change management\r\n-\tConduct on-site periodic audit for Ext. Mfg. to ensure change management is being practice\r\n-\tEstablish remote audit system for top tier (or with high quality issues) raw materials supplier	2020-12-31	30	CoNC Report, SCAR, Audit	NIL	NIL	1	1	1	NIL	NIL	NIL	null		180	1611091001	4	\N	\N	\N
245	New Product Development (NPD) / Product Quality Engineering (PQE) / Quality System	1.\tInvolvement of QA function to new product development\r\n-\tEstablish QA gates for each New Product Development Phases\r\n\r\n2.\tEstablish a groundwork for Quality Management System align with automotive standard (TS16949)\r\n-\tAttend (if required) Automotive Industry Standard course/training\r\n-\tAssist QA Manager to prepare system documentations and system	2020-12-31	10	Updated PDM Procedure, QMS gap analysis	NIL	NIL	1	1	1	NIL	NIL	NIL	null		180	1611091001	5	\N	\N	\N
250	Regrowth recipe optimization in G4 MOCVD	RG recipe development in G4 MOCVD on grating written wafers\r\n- Bottom grating optimization (Grating optimization before active growth) \r\n- Top grating optimization (Grating RG on top of the Quantum wells)	2020-12-31	10	Qualification report	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		147	645448974	6	\N	\N	\N
252	Bottom grating optimization	Renesas growth development\r\nStep1A: bottom grating layer growth optimization	2020-06-30	10	Submitted report during Project with Renesas	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		147	645448974	3	\N	\N	\N
253	Growth uniformity improvement	Evaluation and improve growth uniformity W2W and R2R for all 11 slots in G4 MOCVD	2020-12-31	5	Report	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		147	645448974	3	\N	\N	\N
275	Equipment maintenance, CIPs and mindset change	•\tComplete all schedule PM and critical equipment PM by Q420, ensure that the integrity of the checklist is upheld and error free.\r\n•\tNew Equipment Hookups onsite by End Dec 2020\r\n•\tOxford PECVD and ICP PLC Upgrading work by End Nov2020 \r\n•\tReduce unplanned down-time by 5 % compare to 2019 for 2020	2020-12-30	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		237	22592094	4	\N	\N	\N
288	Achieve US$ 12.1M revenue in 2020 as per base AOP.  Stretch goal is $14.1M	Key measures:\r\n1)\tMeet 100% forecast for FY20.\r\n2)\tMaintain 90% Box yield for box assembly.\r\n3)\tMaintain zero safety incidents per month\r\n4)\tEnsure and maintain supply of raw materials or COGS.\r\n5)\tDefine PM/Calibration schedule for all equipment used for ILM and ensure all machines are calibrated on time.	2020-12-31	1		NIL	NIL	1	1	1	NIL	NIL	NIL	null		177	1913240580	6	\N	\N	\N
420	Revenue	target to reach US$5M above revenue from Greater China in 2020	2020-12-31	50		NIL	NIL	1	1	1	NIL	NIL	NIL	null		265	25957709	6	\N	\N	\N
421	New Design in	Get at least 4 design win in 16xx DFB，10G/25GD or SOA	2020-12-31	25	new orders.	NIL	NIL	1	1	1	NIL	NIL	NIL	null		265	25957709	3	\N	\N	\N
422	AXT Wafer Substrate/Almae Grating/Regrowth Qual	1. ESD\r\n\r\n2. 2000hrs HTOL	2020-04-09	1		NIL	NIL	1	1	1	NIL	NIL	NIL	null		155	931345185	3	\N	\N	\N
425	Yelo System Set-Up/Acceptance	1. System delivered\r\n\r\n2. System buy-off	2020-02-07	1		NIL	NIL	1	1	1	NIL	NIL	NIL	null		155	931345185	5	\N	\N	\N
426	Low DOP SLED Development	1. Panwoo 5000 parts delivery	2020-06-30	1		NIL	NIL	1	1	1	NIL	NIL	NIL	null		155	931345185	3	\N	\N	\N
477	1310nm Broadband SLED Development	Successful development of a SLED with 3dB BW 115nm, Power 6mW	2021-07-01	1		NIL	NIL	1	1	1	NIL	NIL	NIL	null		155	931345185	3	\N	\N	\N
395	New Product Design Wins	Win designs with new product	2020-12-31	20	Order from customer	NIL	27 new customer wins in Q1-Q3 in 2020. Good job.	1	1	1	NIL	NIL	NIL	On Track		260	985791817	3	\N	\N	\N
415	Projects	Drive KFA projects to conclusion	2020-12-31	25	Reports	KFA1.4 (Improve communication amongst team)- In progress. Launched Google Chat and next steps is to introduce the entire google ecosystem to improve the collaboration amongst all Denselighters.\r\nKFA3.1 (Cost effective External Manufacturing Strategy) - Subcon strategy is defined. Qualifying new subcons to meet and deliver 25G products to our customers. 2nd source in AFR for FBGL.\r\nKFA4 (Lead KFA 4 Build and deliver effective and\r\nefficient business process’ and systems.) - Overall progress is good.	NIL	1	1	1	NIL	NIL	NIL	On Track		264	759336758	6	\N	\N	\N
417	Procurement	Drive for cost savings with the suppliers and ensure supply assurance.	2020-12-31	25	Reports	2020 CAPEX is managed well and below AOP.\r\nSourced and selected FCM (Travel Management Company) that offer the lowest cost of travel.\r\nOn target to achieve cost savings target >$250k for 2020.\r\nDeveloped the mechanism to track cost savings with Finance.\r\nAll POs are issued timely to suppliers. \r\nGoods flow has been semi-automated to improve efficiency.	NIL	1	1	1	NIL	NIL	NIL	On Track		264	759336758	4	\N	\N	\N
231	Test Setup Familiarity	Familiarisation of different device requirements by understanding different test setup and program-respective critical parameters.	2021-01-01	5		NIL	NIL	1	1	1	NIL	NIL	NIL	null		234	2076006951	3	\N	\N	\N
256	Design and Realization Flip-Chip-Capable MFA Integrated CW-DFB-LD for AMF-Denselight Collaboration :	Design and Realization Flip-Chip Capable MFA Integrated CW-DFB-LD for AMF-Denselight Collaboration :\r\n\r\nObjectives:\r\nPOC1:\r\n1.\tDelivery of LD chip mount on CoS with 50um protrusion\r\n2.\tOptical coupling measurement of LD+TWG and Si-Ph Edge-Coupler\r\n3.\tCoupling simulation of LD+TWG and Edge-Coupler\r\nPOC2:\r\n4.\tPropose and execute InGaAsP and AlGaInAs MQW’s based epi structures for high power FC CW-DFB-LD \r\n5.\tDesign and realization of MFA integrated InGaAsP and AlGaInAs MQW based CW-DFB with Lcav=1mm, \r\n5.1) Determination of grating InP-spacer\r\n5.2) Overall device integration\r\n6.\tFurther simulation of MFA with modal analysis of ridge on TWG devices\r\n7.\tOverall design consideration of the Z-Stop for LD+TWG and BH based CW-DFB-LD for Si-Photonic Platform	2020-12-31	30	1POC1 :  -Joint POC1 Report Generation  POC2: -Mask tape-out of MFA-integrated CW-DFB-LD  -Delivery of a flip-chip capable TWG-integrated Lcav=1mm CW-DFB-LD	NIL	NIL	1	1	1	NIL	NIL	NIL	null		205	1602769597	3	\N	\N	\N
254	25G(CWDM4) and 10G Direct Modulation DFB LD NPD	1.\t10G c-Temp & 10G i-Temp DML NPI\r\n-\tCompletion of alpha-phase\r\n-\tCompletion of gamma-phase\r\n \r\n2.\t25G c-Temp DML NPI \r\n-\tCompletion of alpha/beta-phase\r\n-\tCompletion of gamma-phase\r\n\r\n3.\tDemo of BH based 25G DML for i-Temp\r\n-\tIth < 10mA @ 25°C\r\n-\tS21 > 17GHz @ 85°C, for 55~70 mA	2020-09-30	30	1. Lean Six Sigma Report on the 0.5um-SiO2 Spacer 25G DML report. 2. Completion of 25G c-Temp DML Design Review 3. Device demo of DLS-G4 AlQ based25G DML (BH version)	NIL	NIL	1	1	1	NIL	NIL	NIL	null	link2.JPG	205	1602769597	3	\N	\N	\N
257	Strategic InP-PIC Platform (KFA5.4) Contribution:	1. Lead the Review of Strategic Building Blocks toward Photonic Integration on InP\r\n2. Evaluate Strength/weakness for the various techniques to Photonic Integration\r\n3. Evaluate if MFA can be implemented using the various PIC techniques\r\n4. Lead Strategic Plan of Development of Building Blocks for InP-PIC for Application in IoT and Next-Gen Transmit Lasers, using :\r\n- EML (DFB/EAM Integration)\r\n- Tunable LD (DBRs/PS Integration\r\n- SLED/PIN PIC Transceiver for FOG\r\n5. Provide the Work-Packages and the High-Level Strategy to Realize EML base on Selective-Area Epitaxy and Butt-Joint Approach	2020-12-31	10	1. Consolidated Report of PIC work-packages development	NIL	NIL	1	1	1	NIL	NIL	NIL	null		205	1602769597	3	\N	\N	\N
324	NPI/ Engineering build	On-time set-up of critical EWO and no issues on machines - Q2\r\nOn-time machine/fixture qual and buy-off to be use on new products- Q3\r\nWork with PE, Production and Fab to create EWO monitoring and disposition to avoid aging. Q3-Q4	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		181	1536568573	3	\N	\N	\N
261	Operational Cost Management	- Cost Saving Project  - to reduce the operation cost by 5%\r\n- To source for 2nd source material supplier and certify by process engineer\r\n- Collaborate with supplier for bulk purchase to avoid high freight / delivery charge\r\n- Reduce wastage by proper planning and batching wafers processing	2020-12-31	20	Weekly Operation report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		160	52374544	4	\N	\N	\N
306	Facilty Team works	Expected behaviors traits for quality excellence \r\n•        Need to have initiative to learn, apply and improve\r\n•        Need to have Self-discipline in the works undertaken, this is to ensure max level of passion and pride, hunger and want.\r\n•        Adaptability - Continuously learning to adapt to changes in environmental factors and manage the given priorities and stay engage to allow moving in the same company’s direction to achieve the needed goals.\r\n•        Work with Urgency and Correct Priority - Continuously managing job priorities and working with urgency to match management priority\r\n•        Ability to Multi-Task - Constantly working and juggling between multiple tasks and people to deliver max results. \r\n•        Contribute to Team Success - Continuously providing service to equip, process and manufacturing team members to help them succeed in their	2021-01-30	35	Facilty Team works	NIL	NIL	1	1	1	NIL	NIL	NIL	null		197	1017729787	6	\N	\N	\N
262	Equipment maintenance, CIPs and mindset change	•\tComplete all schedule PM and critical equipment PM by Q420, ensure that the integrity of the checklist is upheld and error free.\r\n•\tNew Equipment Hookups onsite by End Dec 2020\r\n•\tOxford PECVD and ICP PLC Upgrading work by End Nov2020 \r\n•\tReduce unplanned down-time by 5 % compare to 2019 for 2020\r\n•\tspare part tracking continuing plan by Q4 2020\r\n•\tPerform at least 10 improvement to the machine for better productivities or machine reliability. \r\n•\tTo ensure the team login and update the Equipment status properly into the daily equipment status tracking file.   \r\n•\tTo be able make logical and decisive decision to safe guard the company need. \r\n•\tGood to raise concern, but always come up the work around solutions to get things moving.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		249	5	4	\N	\N	\N
260	Quality Improvement Management	•\tReduce wafer breakage and human error to <10% of total processed wafers, (>17% in 2019).\r\n•\tEnsure all SPC files updated daily (RID, PML/NML Evap, sputtering, AR/HR).\r\n•\tImplement at least 5 improvement projects for better MFG efficiency.\r\n•\t Create systems to eliminate operator’s related Human errors in wafer handling breakage\r\n•\t Ensure all operators are certified with in two months after they are on board.	2020-12-31	20	Weekly Operation report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		160	52374544	5	\N	\N	\N
313	Track daily Non stop	1) Material Inventory every end of month with new ID number within only ILM dept. Done\r\n2) ILM activity by product boxes (Incoming and Outcoming). Done\r\n3) Implement every Work Instructions (10/ 18 WIs)\r\n4) New looks of Travelers for box. Done\r\n5) Update the whiteboard based on urgent box. Done	2020-11-30	10	Track daily	NIL	NIL	1	1	1	NIL	NIL	NIL	null		220	231731743	5	\N	\N	\N
334	Sustainable support & commitment	- Full support of DSL goals and targets.\r\n- Engagement with other departments to assist in meeting performance.   \r\n- Continuous communication with facility & EHS team and other departments so as to work as one team.	2021-12-30	20	Checklist, reports and records	NIL	NIL	1	1	1	NIL	NIL	NIL	null		196	2047523461	5	\N	\N	\N
339	GTM for 1310nm SLED design & development	Lead development team to successfully develop and ready go-to-market 1310nm SLED product	2020-12-31	30		NIL	NIL	1	1	1	NIL	NIL	NIL	null		204	480020115	3	\N	\N	\N
265	Training	•\tTake ownership for the team training needs and attendance. \r\n•\tEnsure assigned training for team member are follow thoroughly closely.\r\n•\tEnsure training received by team members are aligned and help in the execution of their work responsibility.\r\n•\tResponsible to ensure OJT for new comers to address their working needs.	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		249	5	6	\N	\N	\N
462	Eloira SLED 1550nm	Accomplish the Eloira module evaluation based on customer request (-40C/25C/85C), find the potential risk and find the solution. Provide qualified and competitive products to customer.	2020-12-31	15	Eloira test results and evaluation report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		176	610693885	3	\N	\N	\N
266	Expected behaviors traits for quality excellence	•\tNeed to have initiative to learn, apply and improve\r\n•\tNeed to have Self-discipline in the works undertaken, this is to ensure max level of passion and pride, hunger and want.\r\n•\tAdaptability - Continuously learning to adapt to changes in environmental factors and manage the given priorities and stay engage to allow moving in the same company’s direction to achieve the needed goals .\r\n•\tWork with Urgency and Correct Priority - Continuously managing job priorities and working with urgency to match management priority\r\n•\tAbility to Multi-Task - Constantly working and juggling between multiple tasks and people to deliver max results. \r\n•\tContribute to Team Success - Continuously providing service to equip, process and manufacturing team members to help them succeed in their works.	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		249	5	5	\N	\N	\N
264	6S, Housekeeping and Safety	•\tTake ownership for the housekeeping compliance for the team and drive the team to achieve Zero NC due to housekeeping an safety.\r\n•\tConstantly communicate with the team and align them on housekeeping and safety protocol\r\n•\tTake ownership to ensure Zero non-conformance for Safety violations within the team\r\n•\tAbility to detect safety gaps and resolve them.\r\n•\tEnsure that the newcomers are briefed on the safety specs and the document needs to be signed off.\r\n•\tNeed to take ownership and responsibility for all safety related issues.\r\n•\tInform SM and above immediately for serious incidents. Need to ensure execution of preventive and corrective actions so that there is no reoccurrence of similar issues.\r\n•\tNeed to inform SM and above for Fab Evacuation and any Line Down issues	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		249	5	5	\N	\N	\N
273	6S Housekeeping and Safety Management	•\tTake ownership for the housekeeping compliance for the team and drive the team to achieve Zero NC due to housekeeping and safety.\r\n•\tConstantly communicate with the team and align them on housekeeping and safety protocol\r\n•\tTake ownership to ensure Zero non-conformance for Safety violations within the team\r\n•\tAbility to detect safety gaps and resolve them.\r\n•\tEnsure that the newcomers are briefed on the safety specs and the document needs to be signed off.\r\n•\tTo take ownership and responsibility for all safety related issues.\r\n•\tInform SM and above immediately for serious incidents. Need to ensure execution of preventive and corrective actions so that there is no recurrence of similar issues.\r\n•\tNeed to inform SM and above for Fab Evacuation and any Line Down issues	2020-12-31	10	Weekly Operation report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		160	52374544	5	\N	\N	\N
279	Equipment maintenance, CIPs and mindset change	•\tPECVD-02 powder flakes issue while run SiON recipe- clean shower head with below 10 Degree Celsius of H2O of soaking process. It can remove over 90% of debris faster than IPA and Acetone method. Under observation..,, \r\n•\tPLAT-01 convert to 3inch wafer test in progress..,,\r\n•\tRTP-02 convert to 3inch wafer test in progress..,\r\n•\tTRACK-01 machine back up for standalone DEVE-01 and DEVE-02- modification in progress..,,\r\n•\tRTP-02 3inch wafer test in progress..,,\r\n•\tPDS-01 machine to fix external ATM switch in progress..,,\r\n•\tMAL-03 Halogen lamp power OEM spec power extend to 750W, cost saving under observation..,,\r\n•\tFab-B machines that using MFC, to reduce cost all machine MFC consolidated into 5 spare MFC.	2020-12-30	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		237	22592094	4	\N	\N	\N
276	6S, Housekeeping and Safety	•\tTake ownership for the housekeeping compliance for the team and drive the team to achieve Zero NC due to housekeeping a safety.\r\n•\tConstantly communicate with the team and align them on housekeeping and safety protocol\r\n•\tTake ownership to ensure Zero non-conformance for Safety violations within the team\r\n•\tAbility to detect safety gaps and resolve them.\r\n•\tEnsure that the newcomers are briefed on the safety specs and the document needs to be signed off.\r\n•\tNeed to take ownership and responsibility for all safety related issues.\r\n•\tInform SM and above immediately for serious incidents. Need to ensure execution of preventive and corrective actions so that there is no reoccurrence of similar issues.\r\n•\tNeed to inform SM and above for Fab Evacuation and any Line Down issues	2020-12-30	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		237	22592094	6	\N	\N	\N
278	Expected behaviors traits for quality excellence	•\tNeed to have initiative to learn, apply and improve\r\n•\tNeed to have Self-discipline in the works undertaken, this is to ensure max level of passion and pride, hunger and want.\r\n•\tAdaptability - Continuously learning to adapt to changes in environmental factors and manage the given priorities and stay engage to allow moving in the same company’s direction to achieve the needed goals.\r\n•\tWork with Urgency and Correct Priority - Continuously managing job priorities and working with urgency to match management priority\r\n•\tAbility to Multi-Task - Constantly working and juggling between multiple tasks and people to deliver max results. \r\n•\tContribute to Team Success - Continuously providing service to equip, process and manufacturing team members to help them succeed in their works.	2020-12-30	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		237	22592094	4	\N	\N	\N
290	Product Improvement	•\tIntroduce 10kHz ILM box for DAS market\r\n•\tSupport KFA5.5 Initiate capability development of System-in-box ILM solutions for key applications over (2- 3  year) mid-term roadmap.\r\n\r\nProduct Improvement\r\nKey measures:\r\n1)\tTroubleshoot, finalise and produce 10kHz ILM box for production	2020-12-31	1		NIL	NIL	1	1	1	NIL	NIL	NIL	null		177	1913240580	3	\N	\N	\N
190	EBR process set-up and qualification	1.already finished dummy wafer single layer testing and result showed wafer edge cleanliness improved\r\n2.full loop wafer is running with every layer implement EBR. Pending the final result"	2020-10-20	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	589561367	5	\N	\N	\N
272	Equipment maintenance, CIPs and mindset change	•\tComplete all schedule PM and critical equipment PM by Q420, ensure that \r\n         the integrity of the checklist is upheld and error free.\r\n•\tNew Equipment Hookups onsite by End Dec 2020\r\n•\tOxford PECVD and ICP PLC Upgrading work by End Nov2020 \r\n•\tReduce unplanned down-time by 5 % compare to 2019 for 2020	2020-12-31	25		NIL	NIL	1	1	1	NIL	NIL	NIL	null		189	1087181548	4	\N	\N	\N
325	Meet Target Revenue of 7.6M		2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		199	520727285	1	\N	\N	\N
291	Training for Siti	•\tTrain Siti on ILM engineering and manufacturing processes and systems. \r\n•\tDefine plans for Siti to support Yu Xiang on ILM engineering and manufacturing. \r\n\r\nKey measures:\r\n1)\tHand over management of materials to Siti\r\n2)\tHand over preparation of OGR for boxes\r\n3)\tHave Siti handle tracking of WIP	2020-12-31	1		NIL	NIL	1	1	1	NIL	NIL	NIL	null		177	1913240580	5	\N	\N	\N
191	Ulitha tool move in and qualification	1.Acceptance criteria set-up\r\n2.PO raise\r\n3. tool qualification and release	2021-11-30	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	589561367	5	\N	\N	\N
263	Team management	•\tMaintain employee work schedules including assignments, job rotation, training, vacations and paid time off, good team communication, coverage for absenteeism, and all other work-related scheduling. Goal is to ensure there is always good equipment support to the MFG need. \r\n•\tEmpower employees to take responsibility for their jobs and goals. Delegate responsibility and expect accountability and regular feedback.\r\n•\tFoster a spirit of teamwork and unity among equip and other departments (MFG, Process, facility), allows for disagreement over ideas, conflict and expeditious conflict resolution, and the appreciation of diversity as well as cohesiveness, supportiveness, and working effectively together to enable each team members, other departments and company to succeed.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		249	5	5	\N	\N	\N
267	Managerial behavior:	1.\tTo manage align the operation requirement between the Equipment Process and Manufacturing teams to ultimately foster long term sustainability in terms of Morale and Synergy.  \r\n2.\tTo take the lead by being fair and sensitive to the other team’s needs and indices. This will foster trust and improved co-operation. The subordinates will see and learn that win-win situations can be achieve, thereby following suit. \r\n3.\tTo increase contact with the process and MFG engineers, to have balanced points of views. This will enhance the working relationships with understanding each other's problems and concerns. \r\n4.\tTo increase the contact with his engineers to listen to their feedback and problems. Avoid finger pointing to them unnecessary to foster trust. This gives the engineers the feeling that they are being heard and that their feedback is of value, which will encourage them to speak up and uplifts the engineer’s  self worth and foster ownership. \r\n5.\t Carry out individual conversation. Understand their issues and problems, but at the same time truthfully tell them their standing, strengths and weaknesses. Tell them on which areas to improve on. \r\n6.\tMet out punishments and rewards appropriately. This will create role models and also real life examples of wrong-doings. In managing the team, being firm and fair is the key. \r\n7.\tFollow up closely on feedbacks and suggestions, ensure you are on top of all of them, this will make the engineers feel engaged and important. \r\n8.\tCultivate and Demand consistent quality awareness and vigilance, put up sequence of events for every incidents to ensure a good coverage of CA/ PA.\r\n9.\tUnderstand and implement better methods in recovering tools from failure \r\n10.\tIdentification of Chronic Equipment issues and constraint and solving them in the faster possible time.\r\n11.\tNeed to ensure zero incident of part shortage to ensure will not run into capacity issue at all time	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		249	5	1	\N	\N	\N
268	Managing Cost	1.\tAssign an Engineer to look at the cost, for the purpose of knowing real time if the purchase of a part or service will exceed the allocated budget. This is to determine the go ahead for the purchase or non-purchase of a part or service. \r\n2.\tPlan out a list of parts that are required, rank them in order of importance and plan the purchase over a period of time. \r\n3.\tEnsure prompt payment to vendors and keep outstanding PRPO to a low percentage. This will allow leverage in times of need.\r\n4.\tTo educate the Engineers on the affordability, we  need to spend within the given allocation. \r\n5.\t Support all the cost initiative with proper risk assessment and Speed, give solution instead of create obstacles.	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		249	5	4	\N	\N	\N
326	NPD & NRE		2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		199	520727285	3	\N	\N	\N
315	Production Planning (Inventory & Materials/Forecast)	Inventory & Materials/Forecast	2020-12-31	20	Inventory and Forecast Files	NIL	NIL	1	1	1	NIL	NIL	NIL	null		153	253052978	4	\N	\N	\N
274	Training and Team Management	•\tMaintain employee work schedules including assignments, job rotation, training, vacations and paid time off, good team communication, coverage for absenteeism, and all other work-related scheduling. Goal is to ensure there is always good manpower support to the daily MFG need. \r\n•\tEmpower employees to take responsibility for their jobs and goals. Delegate responsibility and expect accountability and regular feedback.\r\n•\tFoster a spirit of teamwork and unity among MFG personnel and other departments (Equip, Process, facility), allows for disagreement over ideas, conflict and expeditious conflict resolution, and the appreciation of diversity as well as cohesiveness, support, and working effectively together to enable each team members, other departments and company to succeed.\r\n•\tPeople Engagement - Through continuous engagement to achieved more support and initiatives from operators and technician to provide feedback for all kinds of improvement opportunity and closure.\r\n•\tInstill good Behaviors traits for quality excellence to the entire MFG team members\r\n•\t Create systems to eliminate operator’s related Human errors in wafer handling breakage\r\n•\t Ensure all operators are certified with in two months after they are on board.\r\n•\tTake ownership for the team training needs and attendance. \r\n•\tEnsure assigned training for team member are follow through closely with certification.\r\n•\tEnsure training received by team members are aligned and help in the execution of their work responsibility.\r\n•\tResponsible to ensure OJT for new comers to address their working needs.	2020-12-31	20	Weekly Manufacturing report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		160	52374544	5	\N	\N	\N
192	3 inch wafer coating & develop recipe set-up	set-up and qualification coating and develop recipes for 3 inch wafer	2021-11-30	5		NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	589561367	5	\N	\N	\N
271	Equipment maintenance, CIPs and mindset change	•\tPerform at least 10 improvement to the machine for better productivities or machine reliability. \r\n•\tTo ensure the team login and update the Equipment status properly into the daily equipment status tracking file.   \r\n•\tTo be able make logical and decisive decision to safe guard the company need. \r\n•\tGood to raise concern, but always come up the work around solutions to get things moving.	2020-12-31	25		NIL	NIL	1	1	1	NIL	NIL	NIL	null		189	1087181548	4	\N	\N	\N
292	Revenue and Shipment	To Meet Company Supply Revenue and Shipment objectives.	2020-12-31	40	Revenue File	NIL	NIL	1	1	1	NIL	NIL	NIL	null		167	973701598	4	\N	\N	\N
259	Fab Capacity and Wafers Cycle Time Management	•\tTo effectively manage all the wafers start and ensure all tools utilize to its max capability.\r\n•\tTo constant review of the Cycle Times and Fab Capacity for SLED/ELED, DFB Production / Engineering wafers with process changes, equipment changes to ensure the capacity file are up to date. \r\n•\tTo create a manual tracking system to track process Hold Time when the Engineers delay releasing the wafer due to Rework / Tool Failure\r\n•\tTo work with IT team to link up all run sheets files, SPC files, OQC reports to reduce manual key in time.\r\n•\tTo work with IT on the Run sheet Automation, OQC report and Dashboard to broadcast wafer Processing status\r\n•\tTo ensure all direct material are managed with a good system with zero incident of direct materials shortage issues.\r\n•\tReporting Fab B Weekly Operation report with visual wafer yield trend and cycle time on time.\r\n•\tSubmit Fab B Month-end inventory and KPI on time.\r\n-       To follow up closely with Process team to ensure Process Tools backup qualification.\r\n        + Full backup and Flexibility for wafers to run in Oxford and Trion\r\n        + Full backup and Flexibility for wafers to run in Oxford III-V and \r\n            SAMCO\r\n         +Full release of Denton I29 to run AR coat \r\n         + Tool Backup for EBEAM or contingency plan	2020-12-31	30	Weekly Operation report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		160	52374544	5	\N	\N	\N
193	A,B distance(first layer alignment) measurement improvement	The purpose of this project is to investigate and settle the 1st later alignment issue.\r\nFull loop dummy wafer is running, pending result.	2020-10-20	5		NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	589561367	5	\N	\N	\N
282	Team management	•\tMaintain employee work schedules including assignments, job rotation, training, vacations and paid time off, good team communication, coverage for absenteeism, and all other work-related scheduling. Goal is to ensure there is always good manpower support to the daily MFG need. \r\n•\tEmpower employees to take responsibility for their jobs and goals. Delegate responsibility and expect accountability and regular feedback.\r\n•\tFoster a spirit of teamwork and unity among MFG personnel and other departments (Equip, Process, facility), allows for disagreement over ideas, conflict and expeditious conflict resolution, and the appreciation of diversity as well as cohesiveness, supportiveness, and working effectively together to enable each team members, other departments and company to succeed.\r\n•\tPeople Engagement - Through continuous engagement to achieved more support and initiatives from operators and technician to provide feedbacks for all kinds of improvement opportunity and closure.\r\n•\tInstill good Behaviors traits for quality excellence to the entire MFG team members.\r\n•\tInstill below critical work behaviors to all in the MFG team:\r\n\r\n1.\tInitiative to learn, apply and improve\r\n2.\tSelf discipline \r\n3.\tAdaptability\r\n4.\tWork with Urgency and Correct Priority\r\n5.\tAbility to Multi-Task\r\n6.\tContribute to Team Success	2020-12-31	15	Will be judged by bosses, colleagues of other divisions, operators. Teamwork Fab working environment harmony	NIL	NIL	1	1	1	NIL	NIL	NIL	null		208	1921197435	5	\N	\N	\N
283	6S, Housekeeping and Safety	•\tTake ownership for the housekeeping compliance for the team and drive the team to achieve Zero NC due to housekeeping and safety.\r\n•\tConstantly communicate with the team and align them on housekeeping and safety protocol\r\n•\tTake ownership to ensure Zero non-conformance for Safety violations within the team\r\n•\tAbility to detect safety gaps and resolve them.\r\n•\tEnsure that the newcomers are briefed on the safety specs and the document needs to be signed off.\r\n•\tNeed to take ownership and responsibility for all safety related issues.\r\n•\tInform SM and above immediately for serious incidents. Need to ensure execution of preventive and corrective actions so that there is no reoccurrence of similar issues.\r\n•\tNeed to inform SM and above for Fab Evacuation and any Line Down issues	2020-12-31	10	Number of auditing findings on 6S and Safety incidents	NIL	NIL	1	1	1	NIL	NIL	NIL	null		208	1921197435	5	\N	\N	\N
284	Training of subordinate	•\tTake ownership for the team training needs and attendance. \r\n•\tEnsure assigned training for team member are follow through closely with certification.\r\n•\tEnsure training received by team members are aligned and help in the execution of their work responsibility.\r\n•\tResponsible to ensure OJT for new comers to address their working needs.	2020-12-31	15	Training of new operators/ technicians, and ability to run wafers	NIL	NIL	1	1	1	NIL	NIL	NIL	null		208	1921197435	5	\N	\N	\N
285	Expected behaviors traits for quality excellence	•\tNeed to have initiative to learn, apply and improve\r\n•\tNeed to have Self-discipline in the works undertaken, this is to ensure max level of passion and pride, hunger and want.\r\n•\tAdaptability - Continuously learning to adapt to changes in environmental factors and manage the given priorities and stay engage to allow moving in the same company’s direction to achieve the needed goals .\r\n•\tWork with Urgency and Correct Priority - Continuously managing job priorities and working with urgency to match management priority\r\n•\tAbility to Multi-Task - Constantly working and juggling between multiple tasks and people to deliver max results. \r\nContribute to Team Success - Continuously providing service to equip, process and manufacturing team members to help them succeed in their works.	2020-12-31	10	Will be judged/ rated by bosses	NIL	NIL	1	1	1	NIL	NIL	NIL	null		208	1921197435	5	\N	\N	\N
286	Supervisor behavior	1.\tTo manage align the operation requirement between the Equipment, Process and Manufacturing teams to ultimately foster long term sustainability in terms of Morale and Synergy.  \r\n2.\tTo take the lead by being fair and sensitive to the other team’s needs and indices. This will foster trust and improved co-operation. The subordinates will see and learn that win-win situations can be achieve, thereby following suit. \r\n3.\tTo increase contact with the Process and Equip engineers, to have balanced points of views. This will enhance the working relationships with understanding each other's problems and concerns. \r\n4.\tTo increase the contact with the subodinate to listen to their feedback and problems. Avoid finger pointing to them unnecessary to foster trust. This gives the subordinate the feeling that they are being heard and that their feedback is of value, which will encourage them to speak up and uplifts their self worth and foster ownership. \r\n5.\t Carry out individual conversation. Understand their issues and problems, but at the same time truthfully tell them their standing, strengths and weaknesses. Tell them on which areas to improve on. \r\n6.\tMet out punishments and rewards appropriately. This will create role models and also real life examples of wrong-doings. In managing the team, being firm and fair is the key. \r\n7.\tFollow up closely on feedbacks and suggestions, ensure you are on top of all of them, this will make the engineers feel engaged and important. \r\n8.\tCultivate and Demand consistent quality awareness and vigilance, put up sequence of events for every incidents to ensure a good coverage of CA/ PA.\r\n9.\tUnderstand and implement better methods in recovering tools from failure \r\n10.\tIdentification of Chronic Equipment issues and constraint and solving them in the faster possible time.\r\n11.\tNeed to ensure zero incident of mistake to ensure will not run into quality issue at all time.	2020-12-31	10	Will be judged/ rated by bosses	NIL	NIL	1	1	1	NIL	NIL	NIL	null		208	1921197435	5	\N	\N	\N
281	Reducing wafer breakage to 5% from 13% in 2019	1) Miniature Dryer with N2 Shower: ensure the wafer is thoroughly dry with a constant and consistent Nitrogen flow for every wafer.    \r\n2) To try new wafer boxes, cassette, carriers, jig, … to avoid wafer crash.\r\n3)  Training on wafer handling: video and hands-on.\r\n          Finish date: regular\r\n4) Regular auditing wafer handling.\r\n          Finish date: regular	2020-12-31	10	G:\\Shared drives\\Fab B Production\\Wafer Breakage	NIL	NIL	1	1	1	NIL	NIL	NIL	null	Wafer_Breakage_Percentage.png	208	1921197435	5	\N	\N	\N
289	Capacity Improvement	1)\tSemi-automate OGR generation by software\r\n2)\tIncrease capacity by introducing third production line.\r\n3)\tImplement DAQ testing for High temp test (SLED) to free up operator\r\n4)\tImplement Set-up for BF10 Coil winding to free up operator\r\n5)\tQualify vendor for production of ILM Box Electrical Cables\r\n6)\tDefine alternate source plan for key material used in ILM\r\n7)\tOutsource testing of PCBA to PCBA vendor	2020-12-31	1		NIL	NIL	1	1	1	NIL	NIL	NIL	null		177	1913240580	6	\N	\N	\N
197	6S, Housekeeping and Safety	•\tTake ownership for the housekeeping compliance for the team and drive the team to achieve Zero NC due to housekeeping an safety.\r\n•\tConstantly communicate with the team and align them on housekeeping and safety protocol\r\n•\tTake ownership to ensure Zero non-conformance for Safety violations within the team\r\n•\tAbility to detect safety gaps and resolve them.\r\n•\tEnsure that the newcomers are briefed on the safety specs and the document needs to be signed off.\r\n•\tNeed to take ownership and responsibility for all safety related issues.\r\n•\tInform SM and above immediately for serious incidents. Need to ensure execution of preventive and corrective actions so that there is no reoccurrence of similar issues.\r\n•\tNeed to inform SM and above for Fab Evacuation and any Line Down issues	2020-12-30	30	UPGARADE APT to 1 k clean room	NIL	NIL	1	1	1	NIL	NIL	NIL	null		197	1017729787	4	\N	\N	\N
269	Expected behaviors traits for quality excellence	•\tNeed to have initiative to learn, apply and improve\r\n•\tNeed to have Self-discipline in the works undertaken, this is to ensure max level of passion and pride, hunger and want.\r\n•\tAdaptability - Continuously learning to adapt to changes in environmental factors and manage the given priorities and stay engage to allow moving in the same company’s direction to achieve the needed goals.\r\n•\tWork with Urgency and Correct Priority - Continuously managing job priorities and working with urgency to match management priority\r\n•\tAbility to Multi-Task - Constantly working and juggling between multiple tasks and people to deliver max results. \r\n•\tContribute to Team Success - Continuously providing service to equip, process and manufacturing team members to help them succeed in their works.	2020-12-31	25		NIL	NIL	1	1	1	NIL	NIL	NIL	null		189	1087181548	4	\N	\N	\N
270	6S, Housekeeping and Safety	•\tTake ownership for the housekeeping compliance for the team and drive the team to achieve Zero NC due to housekeeping a safety.\r\n•\tConstantly communicate with the team and align them on housekeeping and safety protocol\r\n•\tTake ownership to ensure Zero non-conformance for Safety violations within the team\r\n•\tAbility to detect safety gaps and resolve them.\r\n•\tEnsure that the newcomers are briefed on the safety specs and the document needs to be signed off.\r\n•\tNeed to take ownership and responsibility for all safety related issues.\r\n•\tInform SM and above immediately for serious incidents. Need to ensure execution of preventive and corrective actions so that there is no reoccurrence of similar issues.\r\n•\tNeed to inform SM and above for Fab Evacuation and any Line Down issues	2020-12-31	25		NIL	NIL	1	1	1	NIL	NIL	NIL	null		189	1087181548	6	\N	\N	\N
293	Production Efficiency and Capability	To improve the efficiency and reduce cost. To support the ramp to high volume for our core products.	2020-12-31	30	Project File	NIL	NIL	1	1	1	NIL	NIL	NIL	null		167	973701598	4	\N	\N	\N
294	Production Cost Improvement	Improve Yields to reduce cost. Facilitate cross training to ensure better usage of resources.	2020-12-31	20	Training File, Yield file	NIL	NIL	1	1	1	NIL	NIL	NIL	null		167	973701598	4	\N	\N	\N
316	Production Planning System Improvement(Odoo)	Ship to Order	2020-12-31	30	Odoo System	NIL	NIL	1	1	1	NIL	NIL	NIL	null		153	253052978	5	\N	\N	\N
327	Production Efficiency and Capability		2020-12-31	30		NIL	NIL	1	1	1	NIL	NIL	NIL	null		199	520727285	4	\N	\N	\N
194	wafer bask side cleanliness improvement: step by step check wafer back side and find the chance to add wafer back side clean action	1.The purpose of this project is to find the root cause of wafer backside contamination and  seek the chance to add clean step in wafer process flow.\r\n2.Full loop dummy wafer is running  and now we are collecting data step by step	2020-10-20	5		NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	589561367	4	\N	\N	\N
195	low vacuum mode implementation reduction to lower the risk of wafer broken	1.to optimize the Nlof2070 PML and SPD layer;LD3 DRN layer process to make the layer never use low vacuum mode\r\n2.15NXT qualification to replace SU8 for SU8 process have high chance to use low vacuum mode	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	589561367	4	\N	\N	\N
340	GTM for 1310nm Low PDG SOA	Lead development team to successfully develop and ready go-to-market 1310nm low PDG SOA product	2020-12-31	30		NIL	NIL	1	1	1	NIL	NIL	NIL	null		204	480020115	3	\N	\N	\N
356	Deliver all wafer requests from production team	Understand the parameters of most of SLED products in DLS and customer requirements so that a baseline growth can be set. Making a plan to improve current SLED products in their key parameters.	2020-12-31	50	Deliver production wafers	NIL	Well done. Need to continue to track the yield of production wafers.	1	1	1	NIL	NIL	NIL	On Track		163	1373136557	1	\N	\N	\N
423	25G DML Qual	1. 2000hrs HTOL	2020-07-30	1		NIL	NIL	1	1	1	NIL	NIL	NIL	null		155	931345185	3	\N	\N	\N
371	IT Management	Preparing deployment of DMES (Denselight Manufacturing Execution System)	2020-12-31	10	Deployment DMES for manufacturing use a.\tFab-B Runsheet automation b.\tFab-A GATR automation c.\tFab-A Recipe generation d.\tDITA  e.\tWAT automation	NIL	NIL	1	1	1	NIL	NIL	NIL	null		164	1428738048	4	\N	\N	\N
348	PE activities and Sales support	Support Sales for Product definition and sampling and for technical communications with clients.\r\nIn charge of all PE activities while position is not filled (Specs, ATRs, RMAs, NCMRs, Trainings...).	2020-12-31	15		NIL	NIL	1	1	1	NIL	NIL	NIL	null		145	1813039923	1	\N	\N	\N
383	Organization/ Culture Change	• Develop and improve standard recruitment process to reduce attrition by 50%. • Identify and fill all 2020 budgeted positions. • Continue review of KFA’s and execution of DLS 2.0	2020-12-31	15	HR attrition report	NIL	Need to reduce attrition in direct staff	1	1	1	NIL	NIL	NIL	On Track		259	135493917	5	\N	\N	\N
507	hunet test1	test1	2020-09-09	50		NIL mid emp comm1	NIL	2	1	1	NIL	NIL	NIL	On Track		\N	17	1	\N	\N	\N
75	CTO Role: Developing company technology strategy to support business goals	a)\tDirect R&D and Technology Transformation Roadmap to support Company Revenue growth (forecast) objectives: $12M in 2020, $19M in 2021, $28M in 2022\r\nb)\tCommunicate technology strategy and directions to employees, customers, partners and investors.\r\nc)\tLead KFA5 (Strategic Initiatives on New Product Technology Development)\r\nd)\tProvide technical guidance and mentorship to all engineering staff	2020-12-31	35	Company Technology Roadmap, technical presentations & meeting contributions, KFA Reviews with CEO	1a) \t(i) Regular updating of company technology roadmap – done\r\n\t(ii) Datacom: Mapping Datacom Type-A Intra-DCI (CW-DFB & EML), Type-B Inter-DCI Strategy (coherent)\r\n(iii) Sensing: Mapping for higher value: MOPA, Optical engine and Interrogators\r\n1b)\t(i) Presented Lunch-time Talk: March2020: Coherent Comms Pluggables\r\n(ii) Supported BOD on technical due diligence for HTOE acquisition\r\n1c) \tLead/Sponsor KFA5 (New Product Technology Development)  yes\r\n1d)\tYes, via various forum: NRE proposals, NPI mtgs, PE mtgs, KFA2.4(Tech mkt)	NIL	1	1	1	NIL	NIL	NIL	On Track		158	1135328161	5	\N	\N	\N
406	NRE	1. POET (by Q4 2020) Mid Year PO for $500K to be signed. Deliverables agreed. WAT acceptance criteria for new objectives sent and in discussion 2. Acacia (by Sep 2020) Mid Year Technical specifications have been agreed with Acacia Budgetary pricing of initial unit cost have been communicated to Acacia for 2021-2022. Initial NRE pricing has been communicated with Acacia but to go back to them on details of pricing 1st iteration of Racetrack device has been fabricated with HIC + Q-layer and testing has been completed for FP devices. Analysing data now. 3. Hitachi 1550nm SOA with 50nm bandwidth and Flip Chip (by Q1 2021) Mid year Technical specifications have been proposed to Hitachi and awaiting response in Oct 2020 (3rd postponement by customer) 4. ZTE 1550nm Gain Chip and SOA with Psat of 21dBm (by Q3 2021) Mid Year Initial proposal with pricing has been made to ZTE for Gain Chip and SOA. ZTE responded and next meeting to finalise technical requirements on 23 Sep 2020. To follow-up with new NRE pricing after technical alignment. 5. Huawei 1550 High DOP SOA (ongoing) Mid Year Devices ready to ship Awaiting PO for devices	2021-12-31	20	Weekly update reports by team	NIL	NIL	1	1	1	NIL	NIL	NIL	null		262	430837474	3	\N	\N	\N
76	Provide technical guidance on Technical Marketing, NRE, NPI and Applications	a)\tTAM/SAM & Tracking products, applications and market trends \r\nb)\tTechnical sales and applications support advisory\r\nc)\tTechnical mentorship to NRE proposals\r\nd)\tTechnical mentorship to members of NPD and PE teams\r\ne)\tRenesas-DLS Technology Transfer co-ordination	2020-12-31	35	TAM/SAM/market/product studies (pptx/excel), related NRE, NPD, PE meetings, pptx, minutes	2a)   TAM/SAM & Tracking products, applications and market trends\r\n\tPrepared TAM/SAM analysis for Sensing and Datacom market; joint SOM analysis with Sales\r\n•\tSensing (SLED, ILM, FOG, FBGS, DAS, Wind-Lidar)\r\n•\tCoherent Datacom (SOA/GC for Coherent 400ZR) & Intra-DCI (25G DML, EML, CW-DFB)\r\n•\tDatacom Roadmap {5G, Intra-DCI DML, 400G EML and new 50G PON standard}\r\n\r\n2b)\tTechnical sales and applications support advisory\r\n•\tTechnical sales & applications Advisory: SiLC, InPhi, Luxtera, Elbana, AvoPhotonics, Apple \r\n•\tInterrogators: ILM(MOPA), India Railway Project (using Redondo interrogator approach)\r\n\r\n\r\n2c) Technical mentorship to NRE proposals\r\n•\tAcacia NRE design proposal, Eloira NRE proposal\r\n•\tNorthrup Grumman NRE bid:  NRE Technical Proposal developed and presented to NG\r\n\r\n2d) Technical mentorship to members of NPD & PE teams\r\n•\tMOCVD Epitaxy Roadmap coordination with Technology Roadmap, KFA5.2 and KFA5.4\r\n•\tProvided bootstrap technical requirements guidance to internal BH NDP team (led by Isaac) \r\n•\tDenselight patent filing on flip-chip MFA racetrack SOA \r\n•\tFOS4X: technical sales support to Sales bid and advisory to APT for successful trial-build \r\n•\tSponsored lunch-time Talk: May2020 by Maumita/Longcheng on “TEC design and application for module products”\r\n\r\n\r\n2e) Renesas-DLS Technology Transfer Co-ordination (Jan-May 2020)\r\n•\tSupported technical analysis for Renesas MOU signing on 11April2020\r\n•\tInitiated DLS activities for Phase1 technical transfer (done Phase1A)\r\n•\tRenesas stopped Transfer Program in May2020 due to Renesas’s corporate direction change	NIL	1	1	1	NIL	NIL	NIL	On Track		158	1135328161	1	\N	\N	\N
403	KFA 5.1 - Product Development System	1. Improvement and Implementation PRA and RFC Mid Year - Implemented by Sales and NPD and are being used 2. Improvement and Implementation of PDM Mid Year - Implemented and being used by NPD Regular audit implemented by QA 3. Develop Benchmarking method Mid Year - Methodology and testing requirements completed Establish purchase channels for competitive devices 4. Implement ROI template Mid Year - Updated with financial content updated every quarter.	2020-12-31	5		NIL	NIL	1	1	1	NIL	NIL	NIL	null		262	430837474	5	\N	\N	\N
404	New Products for Datacoms and Telecoms	1. High Power CWDM DFB 70mW@75C Mid-Year > 50mW at 75C achieved with 500um devices 1st iteration 1000um DFB to achieve > 70mW at 75C design completed. Plan to fab out 1st iteration by mid Q4 2. 10G CWDM DML c-temp and i-temp Mid-Year 1310nm and 1270nm done 1290nm and 1330nm awaiting processing at Almae for grating writing. 3. 25G CWDM DML c-temp and i-temp (by Q4 2020) Mid-Year CWDM c-temp and e-temp available. 1330nm i-temp samples shipped but to be improved with D - design. 1st iteration of Localised Passivation done. 1270nm wafer shown improved high temp operation. DLS successfully grown B and D version 25G AL EPI for CWDM4 Reverse ridge and Current Blocking in Q4 Externally written grating evaluation to complete by mid Q4 Rel. Qualification for 25G EPI (2500 hrs done) continue to 5000 hrs. To load new devices for reliability in Q4 once i-temp POR is completed. 4. 25G CWDM6 DML c-temp and i-temp (by Q1 2021) Mid Year DLS grown D version 25G AL EPI for 1350nm and 1370nm. Grating design completed Wafers to be sent out for grating writing at HXOPTO 5. High DOP SOA 1550nm - Single and 5-array (by Q4 2020) Mid Year Standard Product available. Improved Psat to 17dBm and also NF < 6.5dB SOA performance for straight design meets all Acacia specs. Initial racetrack device fabricated and evaluating performance now. Current specs meets OIF’s TROSA coherent SOA specs. New wafers have been fabricated to continue improvements for Psat, NF and output beam. Package BTFs for customer samples in early Q4 No information by Huawei 6. Low DOP SOA 1310nm (by Q4 2020) Standard Product available for low DOP 1310nm SOA Packaged into BTF and testing shows performance comparable to Antritsu Working on submount design similar to Antritsu Working to supply samples to 3 x China customer for 100ZR. Taclink, Xgiga and Source Photonics. Evaluation of new EPI (i.e. without undulations and PL shifted) to increase Gain to > 20dB at 25C and/or operation at 50C	2020-12-31	20	Weekly update reports by team and monthly updates to CEO for BOD	NIL	NIL	1	1	1	NIL	NIL	NIL	null		262	430837474	3	\N	\N	\N
409	Improvements of soft skills	1. Improve team's execution 2. Motivate team's responsibility and ownership 3. Alignment of reporting and communication 4. Guidance of Team Managers 5. Better tracking of team's task	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		262	430837474	6	\N	\N	\N
410	Operational efficiency	Denton I29 qual, Back up tools, Cost reduction activity, SOP implementation, SPS systems set up, Process control and monitoring,	2020-12-31	15	indices	NIL	Denton Qual has been a major issue	1	1	1	NIL	NIL	NIL	On Track		263	324340084	4	\N	\N	\N
411	Personnel Development	File atleast one patent or paper or trade secret from Process and Product groups per year , Cross training on another tool , Mentor ship by senior engineers to IA students	2020-12-31	15	patents, training, mentorship	NIL	No progress here	1	1	1	NIL	NIL	NIL	On Track		263	324340084	5	\N	\N	\N
384	OPS Eff/Cost Reduction	• Implement in-house process runsheet software for production use by 1Q2020 • To ensure the production CT and OTD mean the 15 days for the standard product and the OTD given by the PC.	2020-12-31	15	MFG Operation reports	NIL	Delayed DMES to Q32020	1	1	1	NIL	NIL	NIL	On Track		259	135493917	4	\N	\N	\N
385	Revenue	• Achieve > US$ 12.1M revenue in 2020 as per base AOP. Stretch goal is $14.1M • Introduce new ILM boxes (BF9C/D, BF10..) into market and capture > US $1.00M in revenue • Capture > $1.0M for 16XX DFB, > $1.4M for CW, High speed DFB	2020-12-31	15	Sale report	Above was a common goals that every Department head must be embrace, the business situation is not looking good and we had adjusted down these business goals ....	Wafer capacity needs to increase for 2021.	1	1	1	NIL	NIL	NIL	Not On Track		259	135493917	1	\N	\N	\N
416	APT	Achieve shipment goals and hit key metrics for APT	2020-12-31	25	Reports	Shipment goals are met for Q1, Q2 and Q3. On track to meet shipment goals for Q4. Overcome challenges that could have derailed our shipment plan like BF10 but we managed to resolve these issues as a team.\r\nAPT cost is below target.\r\nCross training for the engineering and production team on-going.\r\nAttrition rate for the whole department is low. \r\nOEE for test equipment is >60%.	NIL	1	1	1	NIL	NIL	NIL	On Track		264	759336758	4	\N	\N	\N
405	New Products for Sensing	1. 10KHz 1550nm NLW for Wind LIDAR and DAS (by Q4 2020 using double grating and integrated isolator technology) Mid Year - < 30kHz 1550nm NLW available. To evaluate yield Yield issue with 1560nm 50kHz for BK Tel. Need to determine reason Digital board and driver done Initial development of NLW + Amplifier (i.e. MOPA with output at 100mW) done 10kHz box (a. Integrated Isolator prototype done and b. evaluating PIC solution) 2. High Power 200kHz 1550nm NLW for Auto LIDAR (by Q4 2020) Mid Year - 1mm fabricated and Benchtop test system completed Need to package 1mm device into BTF next. 3. 1310nm and 1550nm High DOP SLED for FOG (by Q2 2020) Mid Year - Eloira transferred to PE team Proposal submitted to Eloira Continue to support PE team to test new BTFs for more test data and to evaluate new TEC. 4. 1310nm Low DOP SLED for China FOG (by Q2 2020) Mid Year - Panwoo : >2mW, PER < 1dB done. > 0.8mW BTF achieved. To push product to Panwoo Shipped 6 pcs of > 0.7mW BTF to customer and have 6 > 0.8mW to ship > 1mW BTF sample order shipped to NuGrid. China Aerospace and Panwoo has approved BTF performance. Improvement to MOCVD growth without undulations is in progress BH development version is in progress 5. 1550nm High DOP SOA for LIDAR pre-amplifiers (by Q4 2020) Mid-Year Completed initial specifications of (Gain: 20dB, Psat >10dBm, NF < 7 dB, PDG >15dB, Ripple < 0.5dB) Achieved Psat of 17dBm and Gain > 20 dB. Trying to increase it to 21 dBm	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		262	430837474	3	\N	\N	\N
464	NCMR	The SLED NCMR cases must 30% lower than 2019	2020-12-31	15	SLED NCMR summary by QA	NIL	NIL	1	1	1	NIL	NIL	NIL	null		176	610693885	6	\N	\N	\N
407	New Technology and Capabilities Development	1. AL wafer growth (by 31/12/20) Mid year - Completed growth for o-band high power DFB and 25G DML. Fabricated and evaluated 1310nm DFB devices for high power DFB and 1290nm FP 25G DML. 2. Complete G4 qualification (by 6/20) Mid Year - Completed > 500hrs for ELEDs 3. BH Development for SLED, SOA and DFB (by Q4 2020 for SLED, Q1 2021 for SOA and Q2 2021 for DFB) Mid Year - Evaluated requirements for ridge width, Blocking layer, regrowth and FF for FP. Continue to evaluate etch with Dry+Wet and Full wet. 4. MFA Development (ongoing) Mid Year - Have not done much work on this. But going to provide some samples for Hisense for coupling evaluation and potentially an NRE. AMF MOU signed and we have completed the proposal for kickoff. We have fabricated an 1550 EPI to evaluate HIC with Q-layer to determine competitiveness against BH and SSC devices. 5. Regrowth (including SAE growth) (by Q2 2021) Mid Year - SAE growth and Fe growth completed. But still need to evaluate the impact of contamination of Fe growth in G4. 6. Grating development (by Q4 2020) Mid Year - Grating designs for high power DFB and 25G have completed 1st iteration and requirements for 2nd iterations have been confirmed including buffer thickness. Evaluating 2nd iteration devices end Sep 20. Besides Almae, additional grating vendor HXOPTO is under evaluation and we are evaluating gratings written by Phable in 25G.	2021-06-30	15	Weekly update reports by team including engineering builds	NIL	NIL	1	1	1	NIL	NIL	NIL	null		262	430837474	3	\N	\N	\N
408	MOCVD Operational Improvement	1. G4 qualification Mid Year- > 500 hrs Completed using 54708T devices Continue to qualify with 10 wafer growths by Q4 2020 2. MOCVD Production Process Controls (Tool and Products) Mid Year - Tool SPC chart is done and being recorded SPC charts for products is on going. But higher volume products such as 54708T is completed. Continue process control development 3. MOCVD recipe consolidation Mid Year - Alignment for products in production (i.e. managed by PE) mainly completed. 4. Maintenance improvement Mid Year - Working on improving MOCVD uptime by improving PM a. Inlet and outlet gas management b. Chamber cleaning and prevention of contanmination c. Pump and cold trap 5. Characterisation of EPI Mid Year - Improvement of XRD, PL and ECV analysis still ongoing Periodic screening of EPI with TEM and SIMs analysis implemented for growth control	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		262	430837474	4	\N	\N	\N
413	Revenue goal - Achieve > US$ 12.1M revenue in 2020 as per AOP	1) Support POET, 25G DML, Huawei SOA, Panwoo, Almae BH, BW10 and other Laser projects. 2) Help achieve 2 design wins for 1653DFB 10G i-temp & 25G DML or High power DFB c-temp, 3) Back up tools qual	2020-12-31	25	Revenue, design wins, back up tools	NIL	Good support by team for above projects	1	1	1	NIL	NIL	NIL	On Track		263	324340084	6	\N	\N	\N
448	Efficient leadership	A. \r\nSupervision of fellow engineers to bring the performance level of employees according to the management expectations - Weightage (25%)\r\nResponsibilities:\r\n1. Establish the capability of the team for New product development support by mentoring\r\n2. Build leadership engagement skills \r\n3. Create job scope and supervise fellow engineers accordingly\r\n4. Contributing towards goal alignment with management and create/ facilitate new ideas within the team according to project requirements\r\n5. Contribute to PMP settings for fellow juniors\r\n6. Performing administrative managerial job\r\n\r\nB.\r\nDepartmental audit - Weightage(5%)\r\n\r\nResponsibilities:\r\n1. Establish the capability by participating in training for Quality Management System (QMS)\r\n2. Audit the areas of DLS (eg. APT, Fab A, Fab B, etc.)\r\n3. Represent NPD for ISO9001:2015 and prepare required documents for audit submission (eg. Indigo for previous consecutive 2 years  and this year prepare the team for projects: 25G, SOA, High Power DFB)	2021-01-01	30		NIL	Handled all logistical, execution and planning of actions and responsibilities very well. Need to improve the technical competency of her reports.	1	1	1	NIL	NIL	NIL	On Track		238	539619816	5	\N	\N	\N
223	Conduct supervised growth campaign for standard DLS products (SLEDs and ELEDs) on Aix 200	- Write/modify recipes for single Q layer calibration runs\r\n- Write/modify recipes for MQW calibration runs\r\n-Perform standard characterization :PL,XRD, Visual Inspection\r\n-Interpret characterization results and do flow corrections for growth on Prime substrates\r\n-Prepare GATR reports for Prime wafer growths on Aix 200 and G4 reactor\r\n-Keep up to date information regarding growth runs, characterizations, and wafer transfer details	2020-12-31	40	Aix 200 logsheet, Wafer transfer form	NIL	Agree	1	1	1	NIL	NIL	NIL	On Track		211	1510925941	6	\N	\N	\N
419	sale channels/distributors	Sign two or more distributors in Greater China	2020-12-31	25	Distribution contract documents	NIL	NIL	1	1	1	NIL	NIL	NIL	null		265	25957709	1	\N	\N	\N
424	Hisense 7-Pin Qual	1. Mech shock/vibration shock/temp cycling\r\n\r\n2. ESD\r\n\r\n3. Thermal Shock\r\n\r\n4. High-temp storage	2020-04-15	1		NIL	NIL	1	1	1	NIL	NIL	NIL	null		155	931345185	3	\N	\N	\N
433	25G BW10 DML, CWDM4, c-temp Program	2. 25G BW10 DML, CWDM4, c-temp Project Delivery\r\na. Leverage mainly on 1310nm Project Activities/Milestones\r\nb. Establish and Organize Regular Project Update, Planning, and Deliveries (Jul 2019)\r\nc. Project Milestone Plan Deliveries – Completed (July 2019)\r\nd. Alpha Phase Test Verification Build – On Going (Est Comp; Q1-2020)\r\ne. Rel-Qual Completion\r\n- Pre-Qual Completed\r\n- Beta-Qual Completed >2500 hrs\r\n- Lot#2, Lot#3 Submission\r\nf. Customer Beta Sample Shipment – On Going (Est Comp; Q3-2020)\r\ng. Beta Phase Exit - Q4-2020\r\nh. Release to Product Engineering Team - Q1-2021	2019-12-31	20	Release to Production	NIL	NIL	1	1	1	NIL	NIL	NIL	null		170	1207021661	3	\N	\N	\N
378	Support Daily Fab A Process Operation	- Loading/Unloading wafers from MOCVD tool (G4 as well as AIX200)\r\n- Perform characterization using : XRD, PL, microscope & ECV\r\n- Start recipe if it is needed\r\n- Keeping up to date information of wafer transfers, growth runs and characterisation	2020-09-30	30	MOCVD Log sheets	NIL	NIL	1	1	1	NIL	NIL	NIL	null		190	1598293097	6	\N	\N	\N
386	Making Sure MOCVD Tool Is Ready For Daily Operation	- Perform daily checks for MOCVD tool (G4 & AIX200)\r\n- Do checks on MO bath(chillers) and also perform glycol exchange when needed\r\n- Do linear change(AIX200) & ceiling change(G4) when required by process team.\r\n- Also perform aqua etching for linear and ceiling at respective wet benches\r\n- Maintain scrubber by topping up sodium hypochlorite(NACLO) every 5 days.\r\n- Perform hot water flush and drain the exhaust line of wet scrubber on a weekly basis to prevent choking of pipes.	2020-09-30	40	MOCVD Log sheets & excel sheets	NIL	NIL	1	1	1	NIL	NIL	NIL	null		190	1598293097	6	\N	\N	\N
393	Support Activities On Improvements	- Data processing\r\n- SPC, maintenance \r\n- Monitoring tools behaviour\r\n- Conducting routine PM	2020-09-30	30	MOCVD Log sheets, excel sheets & word documents	NIL	NIL	1	1	1	NIL	NIL	NIL	null		190	1598293097	6	\N	\N	\N
472	Operation and Sales Support	Production Support and Sales Technical Inquiry Support	2020-12-31	15		NIL	NIL	1	1	1	NIL	NIL	NIL	null		169	1352141850	6	\N	\N	\N
430	6S, Housekeeping and Safety	- Take ownership for the housekeeping compliance for the team and drive the team to achieve Zero NC due to housekeeping a safety.\r\n- Constantly communicate with the team and align them on housekeeping and safety protocol\r\n- Take ownership to ensure Zero non-conformance for Safety violations within the team\r\n- Ability to detect safety gaps and resolve them.\r\n- Ensure that the newcomers are briefed on the safety specs and the document needs to be signed off.\r\n- Need to take ownership and responsibility for all safety related issues.\r\n- Inform SM and above immediately for serious incidents. Need to ensure execution of preventive and corrective actions so that there is no reoccurrence of similar issues.\r\n- Need to inform SM and above for Fab Evacuation and any Line Down issues	2021-01-01	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		198	1941685512	6	\N	\N	\N
414	Yield	DFB yield improvement to 70% and Others (SLED & ELED) to ~ 90%, Mechanical yield > 90%, Fix marginality issues (ripple issues, peeling, process consistency), 3 inch wafer demonstration,	2020-12-31	20	Yields, yield sigma	NIL	good work on DFB yield and 54708 yield. Need to do 3: demo by year end.	1	1	1	NIL	NIL	NIL	On Track		263	324340084	6	\N	\N	\N
428	Communication, Teamwork and  Cost Reduction	- Communicates clearly and intelligently with vendor and collogues  on the machine issue to improve the machine performance.\r\n- Works well with the fellow employees without friction\r\n- Looking for the alternative vendor to provide same quality and performance\r\n- Looking for the higher durability parts with lower cost.	2021-01-01	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		198	1941685512	4	\N	\N	\N
434	25G DLS-G4 DML, CWDM6, i-temp Program	1. 25G DLS-G4 DML, CWDM6, i-temp Project Delivery\r\na. Design Verification\r\nb. Process Verification\r\nc. Alpha Sample Readiness\r\nd. Initial Rel-Qual Verification	2019-12-31	30	Alpha Sample	NIL	NIL	1	1	1	NIL	NIL	NIL	null		170	1207021661	3	\N	\N	\N
431	Expected behaviors traits for quality excellence	- Report to work on time\r\n- Use time constructively\r\n- Good working knowledge of job assignment\r\n- Organizes and performs work in a timely, professional manner\r\n- Willingly accepts work assignments.\r\n- Willingly accepts changes in assignments not directly related to job\r\n- Performs assigned duties with less or no supervision\r\n- Performs assigned duties with less or no supervision even under pressure and extra  time.	2021-01-01	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		198	1941685512	6	\N	\N	\N
429	Machine operation, spec and history issue	- Maintains neat and orderly workstation\r\n- Maintains neat and orderly paperwork on the machine issue, spec and history.\r\n- From the history will have the effective troubleshooting on the machine issue and the performance.\r\n- Ensure all communication and documents are presented in an organized and professional manner.	2021-01-01	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		198	1941685512	5	\N	\N	\N
432	POET Program	1. POET Project Delivery\r\n a. Establish and Organize Regular Project Update, Planning, and Deliveries\r\n b. Almae BH – Complete delivery of twelve (12) quarter-wafers\r\n - four (4) quarters of 1271nm\r\n - four (4) quarters of 1291nm\r\n - four (4) quarters of 1311/1331nm\r\nc. CWDM (Onix)\r\n- two (2) full wafers of 1271nm\r\n- two (2) full wafers of 1291nm\r\n- two (2) full wafers of 1311nm\r\n- two (2) full wafers of 1331nm	2019-12-31	20	1. weekly Project Update, 2. PO, 3. Sales Invoice, 4. Customer shipment acknowledgement	NIL	NIL	1	1	1	NIL	NIL	NIL	null		170	1207021661	1	\N	\N	\N
435	InPhi High Power CW Laser Program	4. DBF, CWDM, 70mW, 300mA - CW\r\na. Establish and Organize Regular Project Update, Planning, and Deliveries\r\nb. Design Verification\r\nc. Process Verification\r\nd. Alpha Sample Shipment	2019-12-31	30	Alpha Sample	NIL	NIL	1	1	1	NIL	NIL	NIL	null		170	1207021661	3	\N	\N	\N
436	Equipment maintenance, CIPs and mindset change	•\tFFU unit repair-Fab B completed. Other area in progress,\r\n•\tRepairing and testing on PCB, power supply, control board and motor for Fab B and MOCVD.\r\n•\tBuy and stock in electrical and electronics compound need for company.\r\n•\tOwnership for Lithography and metrology tools, prepare spare parts and improvement project ongoing.\r\n•\tPLAT-01 intermittent wafer breakage issue- to modify top assembly part in progress,\r\n•\tDEVE-01 spindle rotation issue- motor driver repair in progress,	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		236	850138976	4	\N	\N	\N
418	External Manufacturing	Improve and manage business relationship and KPIs with the subcons.	2020-12-31	25	Subcon Reports	QBRs are held quarterly with the subcons.\r\nCycle time for all subcons have improved especially Allray, SFO and Coset. Work on going to improve the cycle time at PMS.\r\n1st pass yield for SFO has improved to > 90% with the transfer of ferruling process to the suppliers.\r\nSubcons yield are > 90% for all except PMS. Work in progress to improve their yield together with PE.	NIL	1	1	1	NIL	NIL	NIL	On Track		264	759336758	4	\N	\N	\N
437	6S, Housekeeping and Safety	•\tTake ownership for the housekeeping compliance for the team and drive the team to achieve Zero NC due to housekeeping a safety.\r\n•\tConstantly communicate with the team and align them on housekeeping and safety protocol\r\n•\tTake ownership to ensure Zero non-conformance for Safety violations within the team\r\n•\tAbility to detect safety gaps and resolve them.\r\n•\tEnsure that the newcomers are briefed on the safety specs and the document needs to be signed off.\r\n•\tNeed to take ownership and responsibility for all safety related issues.\r\n•\tInform SM and above immediately for serious incidents. Need to ensure execution of preventive and corrective actions so that there is no reoccurrence of similar issues.\r\n•\tNeed to inform SM and above for Fab Evacuation and any Line Down issues	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		236	850138976	6	\N	\N	\N
438	Equipment maintenance, CIPs and mindset change	•\tPerform at least 10 improvement to the machine for better productivities or machine reliability. \r\n•\tTo ensure the team login and update the Equipment status properly into the daily equipment status tracking file.   \r\n•\tTo be able make logical and decisive decision to safe guard the company need. \r\n•\tGood to raise concern, but always come up the work around solutions to get things moving.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		236	850138976	4	\N	\N	\N
439	Expected behaviors traits for quality excellence	•\tNeed to have initiative to learn, apply and improve\r\n•\tNeed to have Self-discipline in the works undertaken, this is to ensure max level of passion and pride, hunger and want.\r\n•\tAdaptability - Continuously learning to adapt to changes in environmental factors and manage the given priorities and stay engage to allow moving in the same company’s direction to achieve the needed goals.\r\n•\tWork with Urgency and Correct Priority - Continuously managing job priorities and working with urgency to match management priority\r\n•\tAbility to Multi-Task - Constantly working and juggling between multiple tasks and people to deliver max results. \r\n•\tContribute to Team Success - Continuously providing service to equip, process and manufacturing team members to help them succeed in their works.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		236	850138976	4	\N	\N	\N
440	Equipment maintenance, CIPs and mindset change	•\tMAL-03 x,y and z axis movement motor repaired and tested ok.\r\n•\tMOCVD scan profiler mother board issue-repaired and tested ok.\r\n•\tPDS-01 rf forward issue- rf controller board repaired and tested ok.\r\n•\tEBEV-02 thickness monitor controller- repaired and tested ok.\r\n•\tSPUT-01 pressure monitor controller-repaired and tested ok.\r\n•\tLearning all Fab B equipment Weekly and Monthly PM in progress,\r\n•\tFab B air shower auto close function completed.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		236	850138976	4	\N	\N	\N
353	PDMS	Migrating from manual approval and excel/word based specs system to database system (PDMS)	2020-12-31	16	Enable the successful launching of PDMS in DLS	NIL	NIL	1	1	1	NIL	NIL	NIL	null		252	10	5	\N	\N	\N
357	To support simulation capability in PE Department	To support simulation capability in PE Department	2020-12-31	16	To support simulation capability in PE Department	NIL	NIL	1	1	1	NIL	NIL	NIL	null		252	10	6	\N	\N	\N
227	To document procedures for G4 and implement SPC control for G4	I will try to make the SPC ready for the processes in G4	2020-12-25	20	Readily available SPC charts to monitor the status of G4	NIL	NIL	1	1	1	NIL	NIL	NIL	null		179	1906914592	4	\N	\N	\N
441	To develop a procedure for step 1b of SAG	To establish a procedure or model to characterize the materials deposited in mask opening by SAG.	2020-12-25	30		NIL	NIL	1	1	1	NIL	NIL	NIL	null		179	1906914592	3	\N	\N	\N
226	To optimize the process for AlQ based BH	AlQ based BH is going to be a important building block for various applications including CW-DFB, DMLs etc. In addition, this will allow us to develop the Butt-Joint structures, where DFB laser can be integrated with other components such as EML, SSC, and waveguides.\r\nMy objective is to optimize the MOCVD growth conditions to obtain good morphology blocking layer growth with low leakage current.	2020-12-25	25	Reduce the leakage current in AlQ based BH structures	NIL	NIL	1	1	1	NIL	NIL	NIL	null		179	1906914592	3	\N	\N	\N
427	Equipment maintenance and CIP	- Complete all schedule PM and critical equipment PM by Q420, ensure that the integrity of the checklist is up to date and error free\r\n- Reduce unplanned down-time by 5 % compare to 2019 for 2020\r\n- Perform at least 5 improvement to the machine for better productivities or machine reliability.\r\n- To ensure the team login and update the Equipment status properly into the daily equipment status tracking file.\r\n- To be able make logical and decisive decision to safe guard the company need.\r\n- Good to raise concern, but always come up the work around solutions to get things moving.\r\n- Increase the KPI for the MOCVD yearly 5 % or maintain the optimum  KPI.	2021-01-01	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		198	1941685512	4	\N	\N	\N
442	To optimize growth recipe for AlQ based materials emitting at 1550 nm	To assess if AlQ based 1550 nm can be used for any i-temp applications	2020-12-25	25		NIL	NIL	1	1	1	NIL	NIL	NIL	null		179	1906914592	3	\N	\N	\N
484	Quality and Safety	ISO Compliance	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		181	1536568573	1	\N	\N	\N
460	Cost Reduction	Develop and create projects and activities that will reduce the manufacturing cost and improve Product Engineering team productivity and efficiency in terms of Data Analysis and Data Mining	2020-12-31	25	Cost Reduction	NIL	NIL	1	1	1	NIL	NIL	NIL	null		217	1484926575	4	\N	\N	\N
471	Quality	SLED and ELED RMA/NCMR technical support and timely response to customer.	2021-03-31	15	QA RMA Tracking	NIL	NIL	1	1	1	NIL	NIL	NIL	null		169	1352141850	6	\N	\N	\N
350	Set up a model to simulate the AIX200 MOCVD	1.2\tUnderstand the behaviour of AIX200 MOCVD reactor, build a model to estimate the surface wafer temperature and process flow during each run with various III-V coating so that all process engineer can use to conduct production wafer growth in AIX200	2020-12-31	15		NIL	Good work done.	1	1	1	NIL	NIL	NIL	On Track		163	1373136557	4	\N	\N	\N
358	Overcome the challenges in developing new products	1. Develop new products for DLS, start with high BW SLED product. \r\n2. Contribute to current DLS projects such as 25G DML, high power DFB and BH development to solve key issues in the growth of such wafers.	2020-12-31	10	Improve device's performances	NIL	Need to repeat growths for both AL and InGaAsP wafers for high power DFB (including BH)	1	1	1	NIL	NIL	NIL	On Track		163	1373136557	3	\N	\N	\N
258	25G manual jig readiness and coating yield improvement	1) Improve jig capacity while maintaining high yield\r\n2) Improve bar loading speed\r\n3) Improve throughput per run in Denton I29\r\n4) support qualification process for all 25G products in Denton I29\r\n - AR / HR coating for Alu containing QWs in Denton I29\r\n - AR coating for non-hermetic devices.	2020-11-15	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		241	2125149271	3	\N	\N	\N
486	Denton I29 Tool qualification	1. Tool Installation: Tool upgradation ongoing.\r\n2. Process development: calculate n and k values, TF, Recipe developments, \r\n3. Coating designs for AR & HR\r\n4. Deposition & spectral measurement for the stacks\r\n5. Tool Qual: SLED & DFBs\r\n     ( Process development, Deposition ) \r\n     ( Pass- CBT, HTOL, TS & ESD )\r\n"	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		241	2125149271	3	\N	\N	\N
359	Train equipment engineer on MOCVD	1. Set up a procedure for AIX200 and G4 MOCVD reactor to work stable with proper maintenance schedule. \r\n2. Train equipment engineer the working principle of MOCVD and how AIX200 and G4 MOCVD reactor work. Explain key factors that need closely observation.	2020-12-31	10	MOCVD uptime	NIL	Need to pay more attention to both Uma and Hameed	1	1	1	NIL	NIL	NIL	On Track		163	1373136557	5	\N	\N	\N
363	Benefit Reviews	To continue ensure the benefits for the employees are competitive with the market for retention and motivation	2020-12-31	20	Programs developed	To date, we have implemented the salary increment and market adjustment was executed on 01.07.2020. In Oct 2020, the proposal for the operators in-hire rate adjustment that required a compression exercise was discussed and, which will be implemented in Nov 2021.	NIL	1	1	1	NIL	NIL	NIL	On Track		256	534558467	6	\N	\N	\N
444	Technical lead for Renesas process trial for fabrication of 25G BH-DML product	a) Epi process trial for Step-1A and Step-1B\r\n    - complete and clear both steps\r\nb) Epi process trial for Step-2A and Step-2B\r\n    - complete and clear both steps\r\nc) Transfer of full fabrication process to DLS	2020-12-31	20	1) Minutes and presentation slides of meeting between Renesas and DLS, and 2) Documentation of product transfer to manufacturing at DLS	NIL	Program ended abruptly. But handled well throughout.	1	1	1	NIL	NIL	NIL	On Track		150	1557152765	3	\N	\N	\N
115	MOCVD Operational Improvement	1. G4 qualification\r\n\r\n2. MOCVD Production Process Controls (Tool and Products)\r\n\r\n3. MOCVD recipe consolidation\r\n\r\n4. Maintenance improvement\r\n\r\n5. Characterisation of EPI	2021-03-30	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		144	430837474	4	\N	\N	\N
114	New Technology and Capabilities Development	1. AL wafer growth\r\n\r\n2. BH Development\r\n\r\n3. High power DFB and 25G DML Grating development	2021-03-30	20	Weekly update reports by team including engineering builds	NIL	NIL	1	1	1	NIL	NIL	NIL	null		144	430837474	3	\N	\N	\N
446	Development of high PDG and high Psat C-band SOA devices	a) Develop SOA chip for p-side down flip-chip bonding\r\n    - samples of SOA chip that can be p-side down flip chip bonded\r\nb) Develop 1550nm high PDG SOA with high Psat\r\nc) Develop 1550nm high PDG SOA with wide bandwidth and tight ASE wavelength tolerance\r\nd) Develop 1550nm high PDG SOA based on loopback waveguide configuration with single-sided AR coating\r\ne) Develop good AR coating for high power requirement of SOA\r\nf) Develop test methodology and setup for high PDG high Psat SOA\r\ng) Oversee reliability qualification and product transfer to manufacturing\r\nh) Provide subject-matter engineering support for SOA device	2020-12-31	35	1) Product design file documents, 2) test reports, 3) manufacturing transfer doc	NIL	Good work done with Acacia, ZTE and NEC. Need to train and build up junior engineers to take on more responsibility. Need to establish production readiness.	1	1	1	NIL	NIL	NIL	On Track		150	1557152765	3	\N	\N	\N
246	2800G4HT MOCVD tool qualification	1.\tTool qualification based on InGaAsP material growth\r\n              1a. 54708T ELEDs products @ 15XX\r\n              1b. Low DOP 1310 SLEDs for Panwoo @ 13XX\r\n\r\nThe objective is to qualify the G4 MOCVD tool by choosing two different wavelengths such as 15XX as well as 13XX products.\r\n- The low DOP SLEDs is based on complex QWs (the most complicated epi structures so far) , where we can qualify both types of QWs: compressive as well as tensile QWs in one reliability test\r\n\r\nMethods used: To qualify an epi growth tool for production, the HTOL (High temperature Operating life test) for 2000 hrs at maximum temperature (85C)/current (120 mA) in Automatic Current Control (ACC) mode were performed on dies packaged into TOCANs with external photo detector (PD)	2020-09-30	10	RELEASE AUTHORIZATION and QS-PED-PR001-FRM02 Engineering Report	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		147	645448974	6	\N	\N	\N
368	CTO Role: Developing company technology strategy to support business goals	a) Direct R&D and Technology Transformation Roadmap to support Company Revenue growth (forecast) objectives: $12M in 2020, $19M in 2021, $28M in 2022 b) Communicate technology strategy and directions to employees, customers, partners and investors. c) Lead KFA5 (Strategic Initiatives on New Product Technology Development) d) Provide technical guidance and mentorship to all engineering staff	2020-12-31	35	Company Technology Roadmap, technical presentations & meeting contributions, KFA Reviews with CEO	a) \t(i) Regular updating of company technology roadmap \r\n\t(ii) Datacom: Mapping Datacom Type-A Intra-DCI (CW-DFB & EML), Type-B Inter-DCI Strategy (coherent)\r\n       \t(iii) Sensing: Mapping for higher value: MOPA, Optical engine and Interrogators\r\nb)\t(i) Presented Lunch-time Talk: March2020: Coherent Comms Pluggables\r\n       \t(ii) Supported BOD on technical due diligence for HTOE acquisition\r\nc) \tLead/Sponsor KFA5 (New Product Technology Development) → yes\r\nd)\tYes, via various forum: NRE proposals, NPI mtgs, PE mtgs, KFA2.4(Tech mkt)	Need to develop requirements document for each new technology. Can vary from country to country.	1	1	1	NIL	NIL	NIL	On Track		258	1135328161	5	\N	\N	\N
360	Improve Company's Branding	Improve company’s image for better hiring sourcing and overall reputation of Denselight	2020-09-30	20	Implementation of the E-PMP and E-OT on schedule	Participated a total of 4 Job fairs: a. 20/1/2020 NTU Job Fairs (F2F); NTU Virtual Job Fair 13 - 17.07.20; USPUR 1 - 31.08.20 (Virtual); SG Enable Virtual Training & Career Fair 5 19.09.20 (Virtual)	Hiring process still needs to be fine tuned. Need to get out of watch list of TAFEP.	1	1	1	NIL	NIL	NIL	On Track		256	534558467	5	\N	\N	\N
361	Develop & Improve standard Recruitment Process to Reduce Attrition	1. Set up a more robust KFA no.1 teams to lead by new energized leaders \r\n2. Look at Selection Assesmen tool to check for culture fit and commitment from final 2 candidates to 'Hire Right'.	2020-12-31	20	KFA Monthly meetings	Revamped the entire KFA no.1 team leaders. Tirso has completed KFA no.1.1; remaining KFA 1.2 to KFA 1.5 still on-going.  For the Selection Assessment Tool - we will review if we can afford such a system to maintain cost expenditure. This may move to year 2021 for review.	Recruitment process, in particular interview process, needs to be looked at in 2021	1	1	1	NIL	NIL	NIL	On Track		256	534558467	5	\N	\N	\N
362	Reduce Turnover	Retain effective employees and motivate them to higher productivity	2020-12-31	20	KFA 1.3 monthly report	To date the Voluntary average monthly Turnover for Indirects is at 0.9% (August 2020).  Target for voluntary average monthly indirects Turnover is 1.5%.   We have commenced on different programs e.g. Touch Points survey, HR Chit-chats with employees and Buddy System for new hires.	Attrition has dropped slightly but still above market standard	1	1	1	NIL	NIL	NIL	On Track		256	534558467	4	\N	\N	\N
509	test	test	2020-12-31	100	test	Mid year employee comments	Mid Year Manager's Comments	3	1	1	End Year Employee's Comments	NIL	NIL	On Track		\N	17	1	\N	\N	\N
508	test2	test2	2020-12-31	50		NIL mid comm2	NIL	3	1	1	NIL	NIL	NIL	On Track		\N	17	3	\N	\N	\N
451	Leading technical team focusing project deliverable according to success criteria	A. High power  CW CWDM (1270, 1290, 1310, and 1330) DFB program \r\n\r\n  Customers: CISCO (40mW @80C, 35dB) and InPhi (70mW@75C, 35dB) \r\n\r\nResponsibilities:\r\n\r\n1. Technical team lead and manage project deliverables from March 2020 to 9th October 2020\r\n2. Technical team lead from 16th October 2020\r\n3. Customer engagement and decision making\r\n4. Risk assessment and mitigation\r\n5. Consolidate summary report\r\n\r\nB. High efficient SLED \r\n\r\nCustomer: ELOIRA (Enhance temperature performance -40C to 85C and reduce turn-on time <4s)\r\n\r\nResponsibility:\r\n1. Technical team lead and manage project deliverables from January 2020 to 15th September 2020\r\n2. Consultant 16th September 2020\r\n3. Transfer new product development to PE team\r\n4. Cost reduction on overall DLS SLED BTF packaging\r\n5. Consolidate summary report\r\n\r\nCustomer: Indigo (Enhance Wall Plug Efficiency by 1% for 1670 - 1690nm SLEDs)\r\n\r\nResponsibility:\r\n1. Technical team lead and manage project deliverables for upcoming customer demands\r\n2. Transfer new product development to PE team\r\n\r\nC. Transfering knowledge to the team members for POET project\r\n\r\nResponsibility:\r\n   \r\n1. Documentation on 1310 DFB+SSC (CISCO) development	2021-01-01	50		NIL	There is a lot of action and intensity, however more focus is needed in achieving the required goals.	1	1	1	NIL	NIL	NIL	On Track		238	539619816	3	\N	\N	\N
467	25G BW10 DML, CWDM4, C-temp Project Delivery	a. Leverage mainly on 1310nm Project Activities/Milestones\r\nb. Establish and Organize Regular Project Update, Planning, and Deliveries (Jul 2019)\r\nc. Alpha Phase Test Verification Build – On Going (Est Comp; Q1-2020)\r\nd. Rel-Qual Completion\r\n- Pre-Qual Completed\r\n- Beta-Qual Completed >2500 hrs\r\n- Lot#2, Lot#3 Submission\r\ne. Customer Beta Sample Shipment – On Going (Est Comp; Q3-2020)\r\nf. Beta Phase Exit - Q4-2020\r\ng. Release to Product Engineering Team - Q1-2021	2020-12-31	30	Beta phase	1.Beta phase review had been completed\r\n2.HTOL>2500hrs\r\n3.Customer sample shipment : now is preparing the NON HERMAETIC sample\r\n4. Release to PE team : Progressing\r\n5. To finalize the facet coating process - Now is under the qualification on Denton machine.	NIL	1	1	1	NIL	NIL	NIL	Not On Track		166	2107825133	3	\N	\N	\N
449	Enhancing good experience and engagement of the customer	A leader in KFA 5.3: Develop capabilities for MFA-embedded photonics to render disruptive performance in sensing modules (SLED device) and datacom lasers (SiPh power bank for DFB) \r\nScope:\r\n    i. Exploits embedded MFA technique to current P-Side up the device to attain disruptive performance for MFA enable sensing module\r\n       -Couple power BW enhancement  for SLED/DFB device during packaging \r\n    ii.  Exploits embedded MFA technique to high power density laser banks for data center and COBO applications \r\n       -Transmit laser through fiber / WG to integrate with SiPh platform\r\n   iii.  Seek and establish External collaboration with AMF, IMEC, COBO, etc. group to implement commercially viable Optical Engine \r\n\r\nResponsibilities:\r\n   1. Leading and managing a key functional area of the project\r\n   2. Collaborating and coordinating the workflow with the other groups (DLS and outside) related work package\r\n   3. Project deliverable/success criteria \r\n   4. Task assignment and consolidated summary	2021-12-31	15		NIL	Done a good job to compile and consolidate all technology and capabilities for this KFA 5.3.	1	1	1	NIL	NIL	NIL	On Track		238	539619816	1	\N	\N	\N
447	Technical support to development of high temperature high power CW DFB lasers	a) Design of epi-structure and gratings for CW DFB lasers\r\nb) Technical liaison and point of contact for ebeam grating writing, grating processing and cleave and coat by external vendors\r\nc) Provide subject-matter engineering support for DFB laser and DFB grating design and fabrication\r\nd) Provide subject-matter engineering support for BH devices, including BH-DFB and BH-SOA\r\ne) Continued support in development of high temperature CW DFB laser for Sicoya	2020-12-31	10	1) Design reports, 2) SOW requirement documents	NIL	Minimal support has been required.	1	1	1	NIL	NIL	NIL	On Track		150	1557152765	3	\N	\N	\N
450	Support Sales for continuing DLS AOB	Collaborating with the Sales department to deliver the product demands in AOB\r\n\r\nResponsibilities: \r\n\r\n1. Co-ordinating task according to demands\r\n     a. OSI\r\n     b. Dust Photonics\r\n     c. RainTree\r\n     d. Sicoya\r\n     e. Trong Siang\r\n     f. Photolex\r\n2. Effective collaboration with operation and manufacturing to improve lead time forecasting\r\n3. Create suitable technical specification\r\n3. WO raise \r\n4.  Data analysis and create die picklist	2021-01-01	5		NIL	Done a good job supporting sales in providing samples and products to customers.	1	1	1	NIL	NIL	NIL	On Track		238	539619816	6	\N	\N	\N
493	Daitron bar stacker qualification	1) 250 um, 300 um, 350 um, 1000 um & 1500 um cavity length bars qualification \r\n2) Training of operators/technician\r\n3) Standard operating procedure manual for operators & technicians	2020-12-31	5		NIL	NIL	1	1	1	NIL	NIL	NIL	null		241	2125149271	5	\N	\N	\N
466	File paper	Finish at leave 2 paper before end of the year	2020-12-31	5	Paper acceptance letter	NIL	NIL	1	1	1	NIL	NIL	NIL	null		176	610693885	6	\N	\N	\N
489	SLED & ELED AR Coating in Trion	•\tTo qualify Trion PECVD-02 for AR coating on SLED Products \r\n•\tTo complete 500 & 1000 hours of HTOL for SLED product    \r\n•\tOutput power reduction should be within 20 % range\r\n\r\n• To qualify Trion PECVD-02 for AR coating on ELED Products\r\n• To complete CMFG 500 hours of HTOL for ELED products\r\n• Output power reduction should be within 20 % range	2020-08-31	5		NIL	NIL	1	1	1	NIL	NIL	NIL	null		241	2125149271	4	\N	\N	\N
347	Digital board	Develop digital board for ILM boxes	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		145	1813039923	3	\N	\N	\N
491	E-BEAM & RTP backup tool (External)	E-Beam: \r\n1) vendor at IMRE\r\n\r\nRTP backup:\r\n1) Purchased 4 point probe tool to measure sheet resistivity of metal films before and after RTA \r\n3 temp linearity check using one of the metals in-house and then at NTU later(to check if there is any offset)\r\n2) vendor at NTU	2020-11-16	5		NIL	NIL	1	1	1	NIL	NIL	NIL	null		241	2125149271	4	\N	\N	\N
485	Automatic bar loading tool for 150 um cavity length	Collaboration with Singapore Institute of Manufacturing Technology to design and built automatic bar loading tool for 150 um cavity length bars\r\n1) Similar mechanism to current Daitron bar loading without the picking step	2021-02-28	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		241	2125149271	4	\N	\N	\N
501	Hunettest	Testing	2020-12-12	100	N/A	All Okay	Good	1	1	1	NIL	NIL	NIL	On Track		\N	17	1	\N	\N	\N
453	DMES Phase 4 - Fab B Auntomation	Original Objective:\r\nAPT WAT Automation\r\nDevelop/Write a program application using Microsoft Visual studio and C# Language with Maria DB Server\r\n3a. Analysis\r\n3b. Planning\r\n3c. Design\r\n3d. Execution\r\n3e. Testing (User Acceptance)\r\n3f. Deployment\r\n\r\nNew Objective:\r\nDMES Phase 4\r\n3a) Dashboard\r\n3b) XOR Tool\r\n3c) Production Scheduling	2020-12-31	15	DMES Phase 4	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		214	1608216415	3	\N	\N	\N
454	Customize Google Form	Enhance Approval Workflow Form \r\nDevelop/Write a program application using Google App Script – Google Script language and Maria DB Server\r\n5a. Convert data from Google Sheet to Database\r\n5b. Submission Tracking\r\n5c. View Approved and Rejected record with filtered view	2020-08-31	7	Enhance Approval Workflow Form	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track	3.PNG	214	1608216415	3	\N	\N	\N
455	DDA Web Application	Original Requirement:\r\nEnhance DDA Web App\r\nDevelop/Write a program application using Google App Script – Google Script Language and Maria DB Server\r\n4a. Document Submission\r\n4b. Document Approval\r\n4c. Digital Signature\r\n4d. Tracking Documents	2020-12-31	8	DMES Phase 4	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		214	1608216415	3	\N	\N	\N
376	Software Management	Implementing publish trigger function on DMES, so any new updates/changes done by Rebecca able to be published directly to all client workstations (3 workstation at Fab-B plasma, 2 workstations at Litho, 2 user notebooks for Jason and The, and soon will also install for Process Engineer Notebooks), so when the users open DMES it will triggered update install automatically	2020-03-31	10	Proceed to install DMES on Process Engineer Notebooks	NIL	NIL	1	1	1	NIL	NIL	NIL	null		164	1428738048	4	\N	\N	\N
78	Monthly closing within 4 working days	Financial reporting effectively close on the 4 working days after month end	2021-01-15	25	Date of closing and email out	NIL	NIL	1	1	1	NIL	NIL	NIL	null	Finance_KPI_1_202009.JPG	151	988735390	5	\N	\N	\N
468	25G DLS-G4 DML, CWDM6, I-temp Project Delivery	a. Design Verification\r\nb. Process Verification\r\nc. Alpha Sample Readiness\r\nd. Initial Rel-Qual Verification	2020-12-31	30	Alpha phase	a. Finalized the LP will be the process of I temp.\r\nb.D version had been verified\r\nc. Klab was qualified, Denton right now is under product qual.\r\nd. Pulse mode test can choose 25C/150mA,10% duty.\r\ne. Alpha exiting haven't completed yet\r\nf. The first wafer of HXOPTO was passed the criteria.\r\ng. TRX design is still progressing.	NIL	1	1	1	NIL	NIL	NIL	Not On Track		166	2107825133	3	\N	\N	\N
459	Testing Capability in Product Engineering	Enable test capability within the Product Engineering team\r\n\r\nBridge the gaps between new testing requirements from Customer and capability in house for Product Engineering.	2020-12-31	25	Testing Capability in Product Engineering	NIL	NIL	1	1	1	NIL	NIL	NIL	null		217	1484926575	4	\N	\N	\N
469	InPhi high power laser	a. Establish and Organize Regular Project Update, Planning, and Deliveries\r\n\r\nb. Design Verification\r\n\r\nc. Process Verification\r\n\r\nd. Alpha Sample Shipment	2020-12-31	20	Alpha phase	a.To provide the technical supports on base wafer design\r\n-DONE\r\nb.To provide the technical supports on grating design\r\n-DONE\r\nc.To provide the technical supports on facet coating process\r\n-DONE	NIL	1	1	1	NIL	NIL	NIL	On Track		166	2107825133	3	\N	\N	\N
463	RMA technical support and timely response to customer	1. # of RMAs settled successfully per product group per year. \r\n2. No recurrence of RMA/NCMR upon implementing CA/PA\r\n3. 30%-50% reduction of RMA case from 2019\r\n4. Cycle time of closing the RMA: decreased to 2weeks	2020-12-31	15	RMA report by QA	NIL	NIL	1	1	1	NIL	NIL	NIL	null		176	610693885	6	\N	\N	\N
465	Sales support	Support sales to finish the 2020 SLED technology and market share evaluation for KFA2.3\r\nUpdate all SLED product sheet based on sale's request\r\nComplaint free from sale's team	2020-12-31	10	YTD # of sales engagement supported	NIL	NIL	1	1	1	NIL	NIL	NIL	null		176	610693885	6	\N	\N	\N
461	Yield improvement	To recover the CBT/COS cum yield to 84% (Q3'20)	2020-12-31	25	Major SLED products (CS5153A/CS5169A) must hit 84% CBT/COS integral test yield by Q4'20	NIL	NIL	1	1	1	NIL	NIL	NIL	null		176	610693885	6	\N	\N	\N
470	Mask job	1. Complete the mask drawing requirement correctly\r\n2. Complete the mask drawing requirement on time	2020-12-31	20	Routine work	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		166	2107825133	5	\N	\N	\N
473	Team and Personal development	Train fellow PE team members on product knowledge and concepts of product engineering.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		169	1352141850	6	\N	\N	\N
456	DFB Program Management	Test Yield Goal: 75% for Almae and Eulitha Grating\r\n\r\nSupport all revenue shipment; plan the packaged product ahead of time based on forecast\r\n\r\nWork with the team to come up with a robust design to meet the target yield\r\n\r\nAssist in analyzing Eulitha Tool, perform the evaluation and data collection\r\nAssist in finding other vendors and qualifying them for DFB Grating Writing	2020-06-02	25		NIL	NIL	1	1	1	NIL	NIL	NIL	null		217	1484926575	3	\N	\N	\N
458	NPD to Production Handover	Attend meetings and monitor the situation of the Following products for production transfer:\r\n\r\nDFB Sicoya 1310nm\r\n- Review the Gamma Phase exit documents\r\nDML 25G DFB\r\n- Review the Characterization Report and Alpha/Beta Phase exit documents\r\nPanwoo 1310 Low DOP SLED\r\n- Establish production readiness and prepare the Data Analysis on all the DOE that comes out	2020-12-31	25	NPD to Production Handover	NIL	NIL	1	1	1	NIL	NIL	NIL	null		217	1484926575	3	\N	\N	\N
474	10-30kHz Linewidth ILM box		2020-12-31	25		NIL	NIL	1	1	1	NIL	NIL	NIL	null		145	1813039923	3	\N	\N	\N
502	testing 1	test	2020-12-12	100		NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	17	1	\N	\N	\N
343	Yield Improvements	ELED Yield Improvements:\r\n\r\nQ3 Status:\r\n1. Found out there is a toggle in different etcher tools (Oxford vs Samco), channeled all production to Samco and it pulled the ripple baseline from 0.2dB to 0.1dB.\r\n 2. Record Yielding wafer 20023B from Samco is 87%.\r\n 3. Found a couple of tester issues that  like poor coupling to OSA and unreliable test result if autobar loading is more than 3 bars.\r\n 4. Reached yield of 77% with baseline design due to tester control improvements.\r\n 5. Found out the original design is not robust enough to handle process variations that induce ripple.\r\n 6. Designed an engineering mask with absorber and taper to make it robust to process variations.\r\n 7. 500um cavity length showed more coating thickness tolerance.\r\n\r\nDL-CS5153A Yield Improvement\r\n\r\nQ3 Status:\r\nDL-CS5153A COS WAT yield showed 40nm SCH thickness can bring back the yield back to 100%.\r\nNeed to reconfirm with full wafer.\r\n\r\n\r\nDL-CS5169A Yield Improvement\r\nQ3 Status:\r\nDL-CS5169A repeat build is yielding 100% in WAT using wafer 20040A.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		169	1352141850	4	\N	\N	\N
476	Goals For The Program Management Team	The primary goal is to use the PDM as an effective tool to gate the different development phases and ensure schedule conformance.  The secondary goals is to develop the program managers overall technical capability in order that a broader perspective on the program outlook can be obtained.	2020-11-15	1	PDM Conformance	NIL	NIL	1	1	1	NIL	NIL	NIL	null		155	931345185	5	\N	\N	\N
478	Acacia : Custom C band 4-port folded SOA Chip	1. Develop a  custom C band 4-port folded SOA Chip \r\n2. Meet key specs : Noise Figure; Output Saturation Power; Mode Field Adaptor / Bow Tie; Far Field & Temperature Performance requested by the customer\r\n3. Integrate P-down Flip chip development for the custom SOA chip\r\n4. Deliver alpha/mechanical samples to the customer in May'21. \r\n5. Deliver beta/ chip qual samples to the customer in Dec'21	2020-12-31	33	Complete SOA Die design by Dec'20	NIL	NIL	1	1	1	NIL	NIL	NIL	null		172	364472470	1	\N	\N	\N
479	ZTE / Hitachi / Huawei  : Custom SOA/Gain Chip development	1. Close on one of the key SOA/Gain Chip custom projects from 1 of the 3 customers in 4Q'20\r\n2. Meet the deliverables as provided in the project plan and schedule by end-4Q'20	2020-12-31	33	Close and win one of the custom SOA/Gain Chip development projects from ZTE/Hitachi/Huawei	NIL	NIL	1	1	1	NIL	NIL	NIL	null		172	364472470	1	\N	\N	\N
251	BH RG epi deve	1.\tBH epi growth development for high power and high-speed devices\r\n        - Epi growth optimization of RG on pattern substrate\r\n        - Optimization of Fe doping level for the current blocking layers in order to avoid any kind of leakage\r\n         - Growth parameter optimization to avoid any further inter-diffusion between Fe and Zn during RG \r\n             (a) Growth temperature\r\n             (b) Zn doping level for p-clad\r\n             (c) Passivation of side wall with thin InP layer	2020-12-31	10	Dedicated slides to confirm each task	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		147	645448974	3	\N	\N	\N
481	DLS-AMF Collaboration to integrate DLS laser chip to AMF SiPh platform to offer DLS customer SiP based solutions through a partnership with AMF	1. Meet the deliverables and schedule of Proof-of-Concept 1\r\n - Demonstrate optical coupling of DLS-MFA chip on AMF demo SiPh Edge-Coupler) \r\n2. Meet the deliverables and schedule of Proof-of-Concept 2\r\n- Demonstrate FC assembly of DFB FC chip on AMF demo SiPh platform	2020-12-31	33	Fabricate and supply of ready flip-chip lasers to match AMF SiPh wafers(edge couplers)	NIL	NIL	1	1	1	NIL	NIL	NIL	null		172	364472470	3	\N	\N	\N
482	Daily Yield Dashboard	Establish & publish out daily yield dashboard using TIBCO database; ensure realtime test results capturing; highlight low yield wafers for PE/APT team to investigate.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		225	1256890838	5	\N	\N	\N
483	Manpower savings with TIBCO databased enhancement	Revamp data upload process flow for data to be traceable, consistent and real time, and and amenable to addition of new testers.	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		225	1256890838	5	\N	\N	\N
26	Revenue	•\tAchieve > US$ 12.1M revenue in 2020 as per base AOP.  Stretch goal is $14.1M\r\n•\t Introduce new ILM boxes (BF9C/D, BF10..) into market and capture > US $1.00M in revenue\r\n•\tCapture > $1.0M for 16XX DFB, > $1.4M for CW, High speed DFB	2020-12-31	15	Sale report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		148	135493917	1	\N	\N	\N
248	Training to other engineers or new comers	Transfer technical knowledge to junior engineers and technician so that they can work independently in FabA on both tools AIX200/4 MOCVD as well as G4 AIXTRON MOCVD tool\r\n-\tCreate a training program in FabA \r\n        Hardware exchange: ceiling, Collector ring, Diffusion barrier, susceptor, satellites, etc.\r\n-\tEstablish power point presentation for each and every new program\r\n        25 G slides\r\n        Low DOP slides	2020-10-31	10	G drive	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		147	645448974	6	\N	\N	\N
480	To achieve undulation free Quantum well structures for 13xx SLEDs as well as SOAs	Develop the epi growth recipe optimization to achieve undulation free 13xx SLEDs and SOA devices	2020-09-17	20	Panwoo device results, XSEM results	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		147	645448974	3	\N	\N	\N
488	Low stress SiO2 for 25G	SiO2 Film analysis: \r\n1. Refractive Index\r\n2. Uniformity range\r\n3. Stress\r\n4. Wet Etch rate\r\n5. X-SEM thickness calibration with Filmetrics \r\n6. X-SEM Profile	2020-11-15	5		NIL	NIL	1	1	1	NIL	NIL	NIL	null		241	2125149271	3	\N	\N	\N
490	Process backup tool readiness	1. AR coat for DFB in Oxford\r\n2. Low stress SiN HM in Oxford\r\n3. Develop low stress AR coating recipe in Oxford	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		241	2125149271	4	\N	\N	\N
492	M+ plating tool	1) Tool acceptance plan\r\n2) Qualification plan\r\n3) Training of operators/technicians	2020-11-30	5		NIL	NIL	1	1	1	NIL	NIL	NIL	null		241	2125149271	3	\N	\N	\N
494	SPC Monitoring for process and tool	1) Adding more process & tools into SPC monitoring\r\n2) Automate and reflect in real time chart monitoring\r\n3) Google sheets conversion	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		241	2125149271	4	\N	\N	\N
495	Ripple yield improvement	AR coating process optimization to improve ripple yield\r\nfront & back facet to improve bar thickness uniformity (5nm range)	2020-09-30	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		241	2125149271	1	\N	\N	\N
503	testing	test	2022-02-21	100		NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	17	1	\N	\N	\N
280	Target to fabout at around 400 wafers (of 8 process block type)	Target to fabout at around 400 wafers (of 8 process block type), while 257 wafers were fabout in 2019.\r\n\r\n•\tPerform Manufacturing training for new operators and re-train current operators. Train 03 operators skillful in each module/ area (Litho, Plasma, PVD, Litho, LAP, AR/HR). Assure total at least 14 operators/ technicians to run 40 wafers/ month.\r\n•\tParticipating in developing DMES software: dashboard for completed/ WIP wafers by monthly, yearly; WIP wafer tracking and planning. Generate auto OQC reports, and auto SPC from data in DMES runsheets.\r\n•\tReporting Fab B Weekly/ Monthly Operators performance, Equipment utilisation, numbers of processed wafers on each tools.\r\n•\tEmpower employees to take responsibility for their jobs and goals. Delegate responsibility and expect accountability and regular feedback.\r\n•\tImplement at least 10 improvement projects for better MFG efficiency.\r\n•\tCreate systems to eliminate operator’s related Human errors.\r\n•\tEnsure all SPC files updated daily (RID, PML/NML Evap, sputtering, AR/HR).	2020-12-31	30	Number of wafers fabout by end of 2020	NIL	NIL	1	1	1	NIL	NIL	NIL	null	Total_wafer_fabout_details.png	208	1921197435	5	\N	\N	\N
309	APT Manufacturing		2020-12-31	25		1) Operator cross training 100 % completed (excluded Fiftech tester still not release)  now 5 operators ( 6 work stations) awaiting for trainers certification.\r\n2) Operator's attrition from June to Dec 2020 is 4 out of 12 = 33% therefore from now to next year June 2021 the  attrition rate to reduce 50% will be 2 out of 12.	NIL	1	1	1	NIL	NIL	NIL	On Track		159	689543953	5	\N	\N	\N
311	APT Manufacturing		2020-12-31	25		1) Daily work order tracking is on track met above 90 %.\r\n2) ELED cycle time had met below 6 days, QTD is 4.8 days.	NIL	1	1	1	NIL	NIL	NIL	On Track		159	689543953	6	\N	\N	\N
312	APT Manufacturing		2020-12-31	25	Revenue (To achieve shipment goals)	Q4 revenue had re-adjusted to lower due to economic down turn.\r\nWhat production team can continue contribute to this revenue is provide manpower (O/T) support and flexibilities of tools usage ( high utilization )through multi-skill training.	NIL	1	1	1	NIL	NIL	NIL	On Track		159	689543953	6	\N	\N	\N
296	Operational Excellence	Establish methodology to introduce OEE and to drive improvement programs	2020-12-31	50	Improve OEE	Introduce OEE thru in house developed sensors. This is a major milestone in DLS APT as this is a real time measurement by the minute of a sensor hooked up . The dashboard is a very good indicator of the progress made in terms of automating solutions to boost productivity in APT first before moving across Fab A and Fab B.\r\n\r\nEngaged several government arms for support of grants, eg Enterprise Singapore, EDB , WSG , SSG to explore feasibility to enable i4.0 digital transformation to DLS. This is still work in progress. Although, the work done has not reaped any fruits in terms of financials, but the network which connected DLS to the next in-line projects in the near future to help boost either human capital building of to be given a grant for hardware/software solutions has been established	Navin has made good progress on this and we hope that we should complete the full implementation as per schedule.	1	1	1	NIL	NIL	NIL	On Track		162	1982477965	4	\N	\N	\N
366	Advancing DPHI Platform solutions offering	a) DPhi and Optical Engine solutions Technical Directions b) DLS-AMF MOU and POC1&2 c) DPHI implementation, including HIPP to OE solutions engineering	2020-12-31	30	Presentations, reports, meetings pptx and minutes	a) (i) Develop concept for Turnkey Optical Engine Solutions (POC, OE1 & OE2)\r\n    (ii) DPhi trademark registration filed\r\n    (iii) Contribution to DPhi collaterals and marketing effort\r\nb) (i) MOU signing done on 24Aug2020 \r\n    (ii) Devt Phase-1 POC1 & POC2 program plan, DLS POC team formed, POC work in progress\r\nc) (i) DPhi & Optical Engine Phased-concept ppt\r\n    (ii) Discussion in progress with Hisense and HGTech for 400G Intra-DCI FR4 OE	Good progress to date with seminar being held in Oct 2020	1	1	1	NIL	NIL	NIL	On Track		258	1135328161	3	\N	\N	\N
499	Development of narrow linewidth ILM boxes.	1) Work with the team to develop the narrow line width laser modules.\r\n2) Work closely with the manufacturing team to handle the RMA and NCMR issues pertaining to ILM boxes.\r\n3) Simulation of the FBGL module (external cavity laser) based on single grating, to be followed by dual grating and parameter tuning for narrowing the linewidth.\r\n4) Test and characterize the performance of NLW laser with an EDFA- a preliminary study for the MOPA development.	2020-12-31	80		NIL	Aayush has met the expectations under supervision for the Testing activities listed above. The next step for him will be to continue developing his experimental skills and ability to improve existing setups and propose new ones. The simulation part was left unachieved unfortunately.\r\nRegarding the work done on NCMR, the conclusion that kinks are not related to mode-hops is counter-intuitive and goes against observations made by other DLS engineers. A final report with clear statements is still pending.	1	1	1	NIL	NIL	NIL	On Track		206	31853750	3	\N	\N	\N
367	Provide technical guidance on Technical Marketing, NRE, NPI and Applications	a) TAM/SAM & Tracking products, applications and market trends b) Technical sales and applications support advisory c) Technical mentorship to NRE proposals d) Technical mentorship to members of NPD and PE teams e) Renesas-DLS Technology Transfer co-ordination	2020-12-31	35	TAM/SAM/market/product studies (pptx/excel), related NRE, NPD, PE meetings, pptx, minutes	a)  Prepared TAM/SAM analysis for Sensing and Datacom market; {coherent, intra-DCI, FOG, OCT) \r\nb)  (i) Technical sales & application advisory: SiLC, InPhi, Luxtera, Elbana, Avophotoics, FOS4X \r\n     (ii) Interrogators: ILM(MOPA), India Railway Project (Redondo & FFT-DAS)\r\nc)  (i) Acacia NRE design proposal, Eloira NRE proposal\r\n    (ii) Northrup Grumman NRE bid:  NRE Technical Proposal developed and presented to NG\r\nd) (i) MOCVD Epi Roadmapping with KFA5.2 & KFA5.4\r\n    (ii) Technical device guidance to NDP: CW-DFB, BH NDP, SOA/GC\r\n    (iii) Denselight patent filing on flip-chip MFA racetrack SOA\r\n    (iv) FOS4X Tech Sales bid and APT build-trail advisory \r\n    (v) Sponsored lunch-time Talk: May2020 by Maumita/KLC on TEC pkg\r\ne) (i) Renesas-DLS Technical analysis for MOU signing\r\n    (ii) Initiated DLS Phase1 technical transfer (done Phase1A)\r\n    (iii) Comment: Renesas corporate change stopped Transfer Program in May2020	Well supported in developing marketing collateral. Good work to date.	1	1	1	NIL	NIL	NIL	On Track		258	1135328161	1	\N	\N	\N
396	Channel Growth	Drive business through Channels, and grow DenseLight revenue in US	2020-12-31	20	Channel Growth (US)	NIL	Not much progress made to date.	1	1	1	NIL	NIL	NIL	On Track		260	985791817	5	\N	\N	\N
400	Sharing of PNL with analysis and cost review - 12 times in 2020	To analysis and share with staff, Fab A, Fab B and ATP the costing related to the respective areas and progress therein.	2021-01-15	25	Data (costing) in excel	NIL	Very dilligent in this area	1	1	1	NIL	NIL	NIL	On Track		261	988735390	4	\N	\N	\N
297	Work Order Automation	Introduce APT Work Order Automation thru ODOO	2020-12-31	30	DLS KPI Dashboard	Several charts has been created using limited data we had initially to build an APT WIP profile thru Odoo automation as a mini ERP system. This is not only limited to WIP profile, but also as aging WIP, Queue time pareto by tool type, and many other customizable charts and trends for analysis.\r\n\r\nTraveler has has been added into Odoo as opposed to hard copy. Invoicing thru Odoo for sub con and tracking is currently underway. \r\n\r\nSo far, the ODOO system is a working solution but is only 65%-70% completed. This journey will be part of a continuous improvement item where the sky will be the limit as new and improved solutions becomes available over time. The last 15%-20% will be the toughest as it will link up the overall structure from W/O release till shipment and linking materials and sub-con as a whole WIP management solution,	Navin has done a great job to complete this with the limited resources available.	1	1	1	NIL	NIL	NIL	On Track		162	1982477965	6	\N	\N	\N
247	Epi growth development for 25 G DFB based on AlGaInAs materials for 6 different wavelength for i-temp applications	Al based material growth in G4 MOCVD and device qualification\r\n\r\n- 10G/25G DML Al based epi structure qualification\r\n•\tD-version Epi structure optimization\r\n•\tR-version Epi structure optimization\r\n•\tB-version Epi structure optimization\r\n•\tB2-version Epi structure optimization (doped Barrier with 2E16 Zn)\r\n- High power CDWM DFB Al based Epi structure qualification (1270, 1290 nm, 1310, 1330 nm, 1350 nm and 1370 nm)\r\n- 25G DML for high speed \r\n- Create a SOP for Al materials growth \r\n- Develop a master recipe for Al based materials without any contamination such as Si, Zn and O free for each wavelength: Please follow the wafer list attached with this goal \r\n   a. Before any prime run , it is advisable to run one dummy run ( with high Al containing layers) to remove the O traces inside the reactor	2020-09-30	20	G4 log sheet	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		147	645448974	3	\N	\N	\N
249	Transfer the recipe for production run in DCC folder	Freeze the recipe for Low DOP products and production wafers (54708T high volume product) based on the inputs previously grown wafers.	2020-12-31	5	DCC folder	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		147	645448974	6	\N	\N	\N
255	Design and Realization of Buried Heterostructure Platform	1.\tPhysical Parameter Design for BH Engineering Masks\r\n2.\tBH Device Structure Simulation/Analysis \r\n3.\tBH Device Structure Requirements\r\n4.\tCharacterization and optimization of Fe-InP via N-i-N \r\n5.\t1st demo of InGaAsP BH FP-LD\r\n-\tExperimental in, and modal gain to be comparable to Ridge-Based InGaAsP FP\r\n6.\t1st demo of InGaAsP BH LDOP SLED\r\n-\tLOP > 1.5mW @ 100mA\r\n-\tPER ~ 1.2 @ 100mA\r\n-\tBW >  30nm \r\n-\tFF <  42° (v) x 30° (h)\r\n7.\t1st demo of G4-AlQ based BH FP/DFB-LD, Lcav=250um\r\n-\tIth < 10mA @ RT,  20mA @ 85°C\r\n-\tPout > 20mW for Iop=60mA @ RT	2020-12-31	30	1.\tBH Engineering Mask tapeout 2.\t1st demo of InGaAsP BH FP-LD 3.\tLaser material characterization of BH InGaAsP FP-LD 4.\tDevelop BH LDOP SLED to match Panwoo LDOP SLED spec.	NIL	NIL	1	1	1	NIL	NIL	NIL	null	link2.JPG	205	1602769597	3	\N	\N	\N
169	Office Administration	a. Ensure all Corporate Travel request are approved in FYLE before requestor can proceed to make travel booking. \r\nb. Overseeing general office operation – answering phone calls, purchasing and maintaining proper stock for office supplies– Stationary, cleaning, pantry use, office furniture and fixture. \r\n    i. Managing office cleaner and part-time cleaner to maintain office hygiene. \r\nc. Manage and follow up on Company Safety License and Permit Renewal on yearly basis. \r\nd. Assisting Safety Officer on the application for TLD badge (Arsenic & Radiation test) with NEA. – [MOCVD staff]\r\ne. Support on ad hoc Project administration and coordination to the needs of CEO and the Senior management team. Maintaining the overall work plan, project plans and tracking key tasks. Example: COVID-19 CB planning, Follow-up and compiling Employees Travel & Health Declaration, Collate PMP from employees	2020-12-31	25		-\tProvide strong support to HR and management team to execute BCP plans during Circuit Breaker period such as create workable workforce scheduling template, create Travel & Health declaration form and compiled the submission, coordinated the CB management meeting and provide support to safety committee to put up all safety measuring posters and ensure masks and sanitizers are suffice for use.\r\n-\tContinuously examines administrative effectiveness and seeks better procedures such as create 2 vendors system for pantry, stationary and cleaning supplies and consolidated purchased in monthly basis. \r\n-\tImproves administrative support systems for Safety department through gathering all the necessary documents required for applying licenses and keeps the license certificates organized in Google Drive and initiate GIRO payment option with NEA and SCDF to improve our renewal experience.	NIL	1	1	1	NIL	NIL	NIL	On Track		207	1779366736	6	\N	\N	\N
500	Development of C-band High Gain and High Psat SOA	1) Simulate performance of various SOA designs, establish correlation with experimental data and trends with respect to variation of design parameters. \r\n2) Perform testing, characterization and analysis of fabricated SOA devices based on new epi and device designs.\r\n3) Working with team to build up new test setups, including Near Field measurement using IR camera on Sigma Koki station.	2021-01-30	20		NIL	Aayush’s current role extend beyond the above listed C-band SOA to O-band 1310nm low PDG SOA.\r\nWhilst he has been able to initiate use of Harolds/PICWave for SOA simulation through self-study and support by vendor PhotonDesign, this work is still work-in-progress as he was still not able to align the ASE characteristics with the optical gain characteristics. This has to be completed to establish the methodology to study and design the SOA device to meet targeted performance.\r\nHe has been able to raise WO and work closely with APT to establish committed schedule to complete WO in good time, to enable testing to be carried out for SOA development.\r\nHe has picked up the capability to perform Near Field optical mode test and the understanding to compile various test data together for further analysis.\r\nMore learning will be required to progress to the next level of data analysis at wafer and DOE levels.	1	1	1	NIL	NIL	NIL	On Track		206	31853750	3	\N	\N	\N
\.


--
-- Data for Name: GnC_kpi; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."GnC_kpi" (id, description, due, date_created, progress, goal_id) FROM stdin;
34	Develop 25G DML flow to enable product fabrication for qualification (FC)	2020-12-31	2020-09-14	Not Started	63
8	Perform 5 BB calls per week	2020-07-01	2020-08-19	Not Started	11
9	Visit 5 customers a week	2020-09-01	2020-08-19	Completed	11
11	KPI 2	2020-10-20	2020-08-21	Not Started	16
10	Meet 20 Customers a month	2020-10-20	2020-08-21	Working	16
12	KPI 3	2020-10-20	2020-08-24	Not Started	18
14	SLED: to recover back CBT/COS cum yield to 84% by Q4'2020 (with 80%/20% product vol details;	2020-12-31	2020-09-04	Not Started	28
15	DFB 16xx CBT yield goal:\r\n1. Almae 75% (Q2 ~ Q4)\r\n2. Eulitha 50% (Q3) and 60% (Q4)	2020-12-31	2020-09-04	Not Started	28
18	2. Complete all the checklist on FMEA, margin check (derived from FMEA high RPN > 100), product stability (product bins cp/cpk), setting up PRM/ORT	2020-12-31	2020-09-04	Not Started	30
19	1. Help sales team meet overall revenue goal of $12.1M	2020-12-31	2020-09-10	Working	20
20	2. To help sales team meet quarterly goals\r\ni.\tQ1: $1.24M\r\nii.\tQ2: $2.40M\r\niii.\tQ3: $3.87M\r\niv.\tQ4: $4.59M	2020-12-31	2020-09-10	Working	20
21	3. Meet one of the following: \r\nI.\tMeet/exceed total $1M in ILM revenue ILM (WW) or \r\nII.\t$500K DFB (WW 16xx) or  \r\nIII.\t$300K SOA / Gain (non-China)	2020-12-31	2020-09-10	Working	20
22	2. Win additional designs in the following\r\n- 4 16XX design wins (WW)\r\n- 3 High power DFB wins (Non-China)\r\n- 4 Gain Chip / SOA designs (Non China)	2020-12-31	2020-09-10	Working	21
54	Hit Company revenue Goal - $12.1M	2020-12-31	2020-09-17	Not Started	86
23	1. ILM\r\n(i) Estimate WW market potential, identify key markets & customers to focus on (iii) Win design - 4 ILM / FBGL designs	2020-12-31	2020-09-10	Working	21
24	1. Deliver 3 new application notes or videos that show cases DenseLight’s expertise in the respecting markets.	2020-12-31	2020-09-10	Not Started	23
26	2. Work with the internal teams to deliver 2 Technical Marketing reports, and make recommendations on the direction DenseLight should take.	2020-12-31	2020-09-10	Not Started	23
27	1. Improve the existing sample request process within Odoo that allows different stake holders to acknowledge, tack and ship samples.	2020-12-31	2020-09-10	Working	25
28	2. DenseLight’s web page, to ensure customers can find information to help them in their design of DenseLight’s products.	2020-12-31	2020-09-10	Working	25
55	Meet Quarterly Goals\r\ni.\tQ1: $1.24M\r\nii.\tQ2: $2.40M\r\niii.\tQ3: $3.87M\r\niv.\tQ4: $4.59M	2020-12-31	2020-09-17	Not Started	86
35	Ensure consistent wafer processing in SLED/ELED process	2020-12-31	2020-09-14	Working	64
36	Support engineering evaluation on different etch process, mask change, etc	2020-12-31	2020-09-14	Working	64
37	Ensure consistent wafer processing in SLED/ELED process	2020-12-31	2020-09-14	Not Started	65
38	Support engineering evaluation on HIC processing and FC capability	2020-12-31	2020-09-14	Not Started	65
29	Work with design and growth team to develop mask design and process flow for BH	2020-12-31	2020-09-14	Working	61
31	Develop clean process for epi regrowth	2020-12-31	2020-09-14	Working	61
30	Develop uniform and repeatable etch process	2020-12-31	2020-09-14	Working	61
32	Develop 25G DML flow to enable product fabrication for qualification (non FC)	2020-09-30	2020-09-14	Not Started	63
33	Support engineering evaluation on wet etch reverse ridge, SiO2 localised passivation, current blocking, etc.	2020-12-31	2020-09-14	Not Started	63
39	Develop BH DFB flow to enable product fabrication for qualification	2020-12-31	2020-09-14	Not Started	62
40	Develop integration flow of BH DFB with FC compatibility to POET interposer, meeting all physical specifications agreed with POET	2020-12-31	2020-09-14	Not Started	62
41	Work with module team to ensure smooth processing of 3" wafers	2020-12-31	2020-09-14	Not Started	66
42	Document procedure for operator training and certification	2020-12-31	2020-09-14	Not Started	67
43	Create and keep records of operator certification/re-certification	2020-12-31	2020-09-14	Not Started	67
44	Implement FMEA for new process development	2020-12-31	2020-09-14	Not Started	69
45	Implement window checks as part of process development procedure	2020-12-31	2020-09-14	Not Started	69
46	Transfer all production and engineering runsheets to DMES	2020-09-30	2020-09-14	Not Started	68
47	Create bluebook template for process integration	2021-12-31	2020-09-14	Not Started	70
56	Hit Non-China ILM revenue Goal\r\n- $500K	\N	2020-09-17	Not Started	86
17	1. Achieve 2 design wins for 1653nm DFB, 10G i-temp and 25G DML or high power DFB c-temp	2020-12-31	2020-09-04	Working	30
57	Identify growth channels and markets by Q2	2020-04-30	2020-09-17	Not Started	87
13	ELED CBT test yield to recover back to 80.6% in Q4 with new design fix. This goal is back calcuated based on 75% cum yield goal.	2020-12-31	2020-09-04	Working	28
58	Bring these channels online by Q2 (e.g. rep, distributor, US sales)	2020-04-30	2020-09-17	Not Started	87
59	Min $500K revenue from US (non POET)	2020-12-31	2020-09-17	Not Started	87
60	Ship new SOA product to 1 customer by Q2	2020-04-30	2020-09-17	Not Started	88
61	Design win min 3 SOA or Gain chip designs by FY20	2020-12-31	2020-09-17	Not Started	88
62	Design in CW 70mW/70C lasers into at least 2 customers by Q4	2020-12-31	2020-09-17	Not Started	88
63	Design win min 3 new ILM customer in FY20	2020-12-31	2020-09-17	Not Started	88
64	a.\tImplement a system that links Quote to Invoicing in Odoo\r\nb.\tImplement sample request process in Odoo\r\nc.\tImplement RFC process into Odoo \r\nd.\tImplement a reporting system through Odoo that is able to pull out YTD, QTD reports, backlog and book to bill	2020-12-31	2020-09-17	Not Started	89
65	a.\tEnhance the current web-site. Measure based line and set performance goals for the improved site (e.g. number of visitors, bounce rate etc.)\r\nb.\tWork with internal teams to generate all the collaterals needed to ensure the web is up to date (datasheets etc) and contains relevant information (application notes)\r\nc.\tEnsure all products listed are manufacturable\r\nd.\tSet branding improvement measurement goals for relevant online platforms like LinkedIn. Formulate and execute plan to improve DenseLight branding	2020-12-31	2020-09-17	Not Started	89
66	1. Set up a more robust KFA no. 1 teams led by new energized leaders\r\n2. Look at a Selection Assessment tool to check for cultur fit and commitment from final  2 candidates to 'Hire Right'\r\n3. Introduce a panel interview (if necessary)	2020-12-31	2020-09-18	Not Started	102
67	Identify & fill up 2020 budgeted positions\r\n- Hire as per AOP 2020 and according to the needsbut mindful of the cost of payroll acceding the budget	2020-12-31	2020-09-18	Not Started	102
68	Odoo Recruitment Database\r\n- Maintain a database of CVs, in Odoo by Q4,2020 to keep track of good KIV candidates for future hiring & hiring via ODOO recruitment tracking system\r\n\r\na) 50% by Q2,2020\r\nb) 100% of CV by Q4,2020	2020-12-31	2020-09-18	Not Started	102
229	Operator training & Assessments\r\nTraining of Operators and Asses them	2021-03-01	2020-09-29	Not Started	160
69	Improved NMTO and E-Boarding program in KFA no.1.1\r\nTop 10% identified form Functional Review - 0% turnover and are retained from KFA no.13	2020-12-31	2020-09-18	Not Started	103
70	Leadership Development\r\n- Conduct 4 supervisory training for potential managers/supervisors\r\n\r\nBy Q2,2020, 2 training to be completed.\r\nBy Q4, 2020, last 2 trainings conducted.	2020-12-31	2020-09-18	Not Started	103
71	Consistent welfare activities on alternate months to bond the people\r\n- 6 welfare activities to bey done by Q4,2020\r\n\r\nIntroduce workplace integration program (funded by WSG and administered by SNEF) to come up with integration activity for staff - Q3,2020\r\n\r\nTouch points with new hires 1st, 3rd and 6th month of service in DLS to be organized by HRBPs assigned.	\N	2020-09-18	Not Started	103
72	Improve Communication\r\n- During townhall, introduce pigeon-hole questions for people to ask Rajan (by Apr 2020)\r\n\r\n- Start a group-chat Buddy system (4 existing employee mentor 1 new hire) per KFA no.1.3 (By April 2020)\r\n\r\n- Evaluate EOS 2020 results and start focused group coffee talks to determine action plans. (By March 2020)	2020-12-31	2020-09-18	Not Started	103
73	a. Propose a sales incentive Plan for implementation twice a year (SIP) \r\n(By April 2020)\r\n\r\nb. Propose a general bonus proposal for the Board's approval (By April 2020)\r\n\r\nc. Prepare a Salary increment proposal in May for July 2020 Implementation (By May 2020)\r\n\r\nd. Conduct a market adjustment for key employees by March 2020 (By March 2020)	2020-07-31	2020-09-18	Working	104
74	a. Identify next set of potential leaders to develop and train them via the DLS supervisory Leadership program found in KRA (2) and reduce the no. of reports to HODs for better management.\r\n(BY Q3,2020 completed functional reviews)\r\n\r\nb. Ensure HODs rate and rank their employees under their charge during Functional Reviews and ensure top 10% identified as key personnel are retained. \r\n(By August 2020 functional reviews done and key talents identified)	2020-12-31	2020-09-18	Not Started	106
75	a. Identify next set of potential leaders to develop and train them via the DLS supervisory Leadership program found in KRA (2) and reduce the no. of reports to HODs for better management.\r\n(BY Q3,2020 completed functional reviews)\r\n\r\nb. Ensure HODs rate and rank their employees under their charge during Functional Reviews and ensure top 10% identified as key personnel are retained. \r\n(By August 2020 functional reviews done and key talents identified)	2020-12-31	2020-09-18	Not Started	106
77	Ensure adherence to requirements of job posting on government job portal	2020-12-31	2020-09-19	Working	107
89	Ensure on-time work pass applications according to latest MOM’s advisories	2020-12-31	2020-09-21	Not Started	107
99	1)\tCycle time improvement \r\n2)\tCost and rework rate reduction\r\n3)\teBeam passes reduction and convergence	2020-12-31	2020-09-23	Not Started	122
80	Touch points with new hires on 6 months and 1 year of service in DLS	2020-12-31	2020-09-19	Not Started	108
81	Work with HODs in implementing buddy system	2020-12-31	2020-09-19	Not Started	108
82	Organise 1 event every month and focusing on 3 major events (team building, CSR and year end party)	2020-12-31	2020-09-19	Not Started	108
90	Work with Finance to ensure the payroll cost are within the approved budget	2020-12-31	2020-09-21	Not Started	107
85	Review and negotiate for better medical insurance coverage during renewal	2020-12-31	2020-09-19	Not Started	109
86	Attend at least 4 job fairs/talks that involves DLS	2020-12-31	2020-09-19	Not Started	110
88	Keep abreast of MOM updates and take necessary action, and ensure Management and employees are informed of the latest update	2020-12-31	2020-09-19	Working	111
78	Improve onboarding process, eg. Orientation program for both directs and indirects	2020-06-30	2020-09-19	Working	108
83	Assist the HR Director in the compression salary review for Directs	2020-07-31	2020-09-19	Working	109
84	Assist the HR Director in preparation of the salary increment proposal for July 2020 implementation	2020-05-31	2020-09-19	Completed	109
87	E-OT system – working with IT and Hunet to automate the computation of directs overtime	2020-07-31	2020-09-19	Working	110
79	Identify top 2 resignation reasons and recommend improvement plan	2020-12-31	2020-09-19	Working	108
76	Assist the HR Director to source for a Selection Assessment tool to check for culture fit and commitment of the candidates	2020-12-31	2020-09-19	Working	107
91	Explore working with new recruitment agencies to source more candidates for directs	2020-12-31	2020-09-21	Not Started	107
92	Prepare product costing from May to Dec 2020	2020-12-31	2020-09-23	Not Started	81
94	Ensure monthly closing within 4 working days	2021-01-06	2020-09-23	Not Started	78
95	Sharing PNL with analysis in staff meeting and respective owner in Fab A, B and APT	2021-01-15	2020-09-23	Not Started	80
93	Prepare monthly BOD report on time	2021-01-15	2020-09-23	Working	79
97	1) Provide the back up tool run path for Samco and Oxford for ALM, grating and RID etch process\r\n2) Provide the back up tool run path for Trion and Oxford SION, SIO2 and SIN processes	2020-12-31	2020-09-23	Working	120
96	Deliver wafers on time with quality to realize NRE milestones\r\n1) Develop 25G DML FC process to meet customer product requirements\r\n2)  Develop BH DFB FC process to meet customer product requirements\r\n\r\n3) 25G non-FC process developments are as below: \r\na) Solve gold step coverage issue for 25G DML non-FC process for POR process (c-temp)\r\nb) Pass reliability for 25G DML process for POR process (c-temp)\r\nc) Develop the 25G DML non-FC process with Localized Passivation\r\nd) Develop the 25G DML non-FC process with reverse ridge formation\r\ne) Develop the 25G DML non-FC process with current blocking etch	2020-12-31	2020-09-23	Working	119
100	1) Mentor new hires to bring them into working level\r\n2) Professional conversion program (PCP) for new employees\r\n3) Learn Laser device physics\r\n4) Develop leadership skills to lead the team	2020-12-31	2020-09-23	Working	123
98	1) Fix PML and SION/SiO2 film peeling issues for 25G DML process\r\n2) PCO SION spacer shoulder drop cause wafer yield issue\r\n3) Fix process margin issues\r\n4) Fix HME Wet etch over etch issues	2020-12-31	2020-09-23	Working	121
119	a)\t100% SOP set up for all steps / New Operator certification \r\nb)\tEnable 2 slot jig for AR/HR coat in Oxford / Trion for longer cavity lengths\r\nc)\tBack up tools qualification / deployment into production by Q2’20\r\nd)\tYield system set up by cleaning up using process mapping for SLED / ELED / DFB\r\ne)\tAssign One cost reduction activity per engineer (should cover material cost, gold reduction by integration and resist convergence)	2020-12-31	2020-09-26	Not Started	36
16	1. Establish weekly yield meeting report structure and driving system:  \r\n1.1 Establish weekly yield reporting framework\r\n1.2 Clean up the data source to ensure data accuracy\r\n1.3 Establish & align cum yield calculation methodology and list of criteria for yield calculation\r\n1.4 Based on 75% cum yield goal, breakdown & establish individual goals for test/APT/coating with clear ownership.	2020-12-31	2020-09-04	Working	29
228	KFA 5.2 : BH development\r\nWorking for the final report. \r\nInitial report regarding literature review- submitted 31 Jul 2020\r\nProcess capability analysis- 31 Oct 2020	2020-10-30	2020-09-29	Working	179
104	2. Database system enhancement:\r\n2.1  Kickoff TIBCO database enhancement project by creating different scripts to extract data from different stations, then consolidate together for better data integrity, data traceability & fault investigation. \r\n2.2 Automate work order	\N	2020-09-25	Not Started	29
105	3. Establish & publish out daily yield dashboard; ensure real-time test results capturing, highlight low yield wafers for PE/APT to investigate.	\N	2020-09-25	Not Started	29
106	4. SPC setup for porduct bin monitoring; enable cp/cpk tracking using TIBCO or JMP.	\N	2020-09-25	Not Started	29
107	5. Establish ORT flow & procedures for production released parts (ELED/SLED/DFB 16xx)	2020-12-31	2020-09-25	Not Started	29
120	a)\tFile atleast one patent or paper or  trade secret from Process and Product groups per year\r\nb)\tCross training on another tool \r\nc)\tMentor ship by senior engineers to IA students	2020-12-31	2020-09-26	Not Started	35
110	2. Cost reduction\r\n2.1 Cost down through team efficiency improvement activities\r\n2.2 Manpower savings with TIBCO database enhancement\r\n2.3 Man hour savings by migrating form manual approval on excel based spec to online database system (PDMS)\r\n2.4 For DFB, to establish testing correlation with vendors so to enable sampling test instead full test	2020-12-31	2020-09-25	Not Started	31
109	1. RMA (external) & NCMR (internal)\r\n1.1 # of RMA/NCMR suc cessfully closed this year\r\n1.2 No reccurence of RMA/NCMR upon implementing CA/PA.\r\n1.3 30% ~ 50% reduction of RMA cases from 2019.\r\n1.4 Cycle time of closing the RMA: as per QA timeline\r\n\r\n2. CONC (FAB A/FAB B wafer scrap on ELED/SLED/DFB 16xx): <5%	2020-12-31	2020-09-25	Working	31
108	3. New product & NRE projects scoped:\r\n3.1 25G DML\r\n3.2 High power DFB (Sicoya 1310nm)\r\n3.3 OSI 1310nm & 1550nm \r\n3.4 1650nm/1625nm pulse FP laser\r\n3.5 Eloira SLED 1550nm\r\n3.6 Panwoo	2020-12-31	2020-09-25	Working	30
115	1. Able to demonstrate laser process in the wafer fab process.\r\n2. Able to give decision making on process related.	2021-01-31	2020-09-25	Not Started	59
114	1. Able to support all types of FA request.\r\n2. Able to support wafer fab process and other related works.	2021-01-31	2020-09-25	Working	58
113	1. Able to maintain housekeeping/5S at all times.\r\n2. Able to maintain machine handle in good condition.\r\n3. Continuously monitor FA consumables.	2021-01-31	2020-09-25	Working	57
112	1. Target Internal TAT of 1 day\r\n2. Target External FA TAT to 3 days.\r\n3. Able to maintain wafer disposition to 4 hours\r\n4. Able to create FA library for Internal and External data folder management	2021-01-31	2020-09-25	Working	56
111	1. Able to create presentation showing steps of laser process on the fab.\r\n2. Able to involve in giving disposition to proceed wafer process.\r\n3. Able to send report and highlight to any issues observed on the fab.	2020-09-30	2020-09-25	Working	55
116	a.\tDrive CONC to be less than 5% for Y2020.\r\nb.\tNCMR and RMA numbers to be reduced by 30% from last year’s\r\nc.\tSPC system set up at top 5 bins for matured products in Product group. \r\nd.\tSPC to next level in Fab B for i) tool level , ii) Product level, iii) Metrology level  - Achieve Cpk > 1.33 & OOC < 10% + investigation on all OOC points \r\ne.\tImprove Fab B WAT yield to 90% by fixing process related issues\r\nf.\tConduct routine audits and drive Audit findings to closure within 2 months\r\ng.\tPRM / ORT system set up for matured products (ELED / SLED / DFB)	2020-12-31	2020-09-26	Not Started	33
117	i)\tSupport “key customer programs (Renesas, 25G DML, Huawei SOA, Panwoo, Almae BH, BW10 and other Laser projects) as per learning cycle plan. Scope issues and ensure successful wafer outcome for realizing revenue / NRE\r\nii)\tPrelim qualification of ONE Renesas product by end 2020\r\niii)\tDrive Fab B process, Product and QA groups to help achieve 2 design wins for 1653DFB, 10G i-temp and 25G DML or High power DFB c-temp.\r\niv)\tSmooth operations by ensuring back ups for all “possible” tools (at inhouse & at external sources) \r\nv)\tCumulative Yield target of 75% for the year 2020.	2020-12-31	2020-09-26	Not Started	32
118	a.\tDFB yield improvement to 70% and others (SLED & ELED) to ~ 90%\r\nb.\tFix process marginality issues (n metal peeling, Ripple fails, p-metal peeling with SiO2 scheme and others) \r\nc.\tWAT yield losses due to Fab B and Product related issues to be < 10%\r\nd.\tQualify Eulitha for grating writing by end Q3 \r\ne.\tDemonstrate 3 inch wafer process	2020-12-31	2020-09-26	Not Started	34
148	TECN for Sputter-02 for low vacuum\r\nECN pending	2020-11-01	2020-09-27	Working	160
149	SOP for Trion AR coating- \r\nDocumentation done. need to get approvals	2020-11-30	2020-09-27	Not Started	160
150	AR coating Jig cleaning- SOP	2020-03-01	2020-09-27	Completed	160
151	Rapid Thermal Process VI and Image Capture- TECN done\r\nSOP pending	2020-11-30	2020-09-27	Not Started	160
152	Bar unloading and inspection. Operators are following APT documents now.\r\nNeed to document for FAB B	2020-12-30	2020-09-27	Not Started	160
155	E-BEam\r\n1. Recipes optimized.\r\n2. Height reduction- Stems are ready.	2020-11-30	2020-09-27	Not Started	163
156	Plating:\r\nEvaluation ongoing	2020-12-30	2020-09-27	Not Started	163
167	Centralize documentation and acceptance for incoming material inspection by creating google shared drive for all department incoming material documentations and approval	2020-06-30	2020-09-28	Not Started	47
157	Sputter-02\r\nAu dummy run thickness reduced from 2000A to 500A\r\nNo more dummy run after PM	2020-03-30	2020-09-27	Completed	163
169	To complete the DMES Fab B Runsheet Automation System in Q4, 2020	2020-12-31	2020-09-28	Working	49
170	Reduce Vendor CoNC by 2% from previous year (2019)	2020-12-31	2020-09-28	Not Started	44
171	Reduce Cost of Non-conformance (CoNC) by <5% with respect to the total cost of goods sold (COGS)	2020-12-31	2020-09-28	Not Started	44
160	Refer to the KFA files in the SBP folders in G drive for each kfa KPI's.	2020-12-31	2020-09-28	Not Started	165
161	Refer to the file mentioned and locations which is in the SBP folder in the G drive.	2020-12-31	2020-09-28	Not Started	167
162	Successfully created the PDMS database which can be found in the link below.\r\nhttp://pdfwin.denselight.com:8080/spotfire/library?guid=3b65dd09-212a-47b7-9ebf-71d860a42337	2020-12-31	2020-09-28	Completed	168
163	Reduce customer RMA to 30% from the previous year (2019)	2020-12-31	2020-09-28	Not Started	44
164	Reestablish Monthly Quality Patrol Audit to counter check process and manufacturing process compliance to requirement and standard.	2020-03-31	2020-09-28	Not Started	46
165	Establish In-coming SPC for direct materials (substrates, mask plates, chemicals, gases, others,) using the COC of these materials	2020-06-30	2020-09-28	Not Started	47
166	Create incoming inspection request google form and deploy to PPC for any materials required incoming inspection	2020-06-30	2020-09-28	Not Started	47
172	Establish phase gates exit for each New Product Development project thru PDM	2020-06-30	2020-09-28	Working	50
176	Product Qual in Denton I29\r\n 1. ELEDs: a. Deposition of Spectral stracks and measurements- Jul 2020\r\n b. CBT pass- Third attempt going on-Sep 20\r\n 2. SOA High Psat: a. Design development- 15 Oct\r\n  b. SOA: CBT pass- & 1000Hrs HTOL.- Feb21	2020-02-28	2020-09-28	Not Started	178
174	Denton I29 Tool qualification\r\n 1. Tool up from 3 May. \r\n    a. Tool upgradation is going on- Jan 2021 (Ion Source, Heater control, OMS, Crystal, software)\r\n    b.  New tool breather plate exp. completed- May 2020\r\n 2. n & k values obtained-June 2020\r\n 3.Coating designs for AR & HR- June 2020\r\n 4. Deposition of Spectral stacks and measurements- Jul 2020\r\n 5.a. SLED Qual is going on- 500Hrs BI will complete on 29 Sep\r\n    b. DFB Qual: CBT passed.  Shipped dies to Alray for Tocans for TS & ESD- 26 OCt \r\n    c. 2000Hrs BI- Dec 2020	2020-12-30	2020-09-28	Working	178
178	Transfer DCC shared files in Google Shared Drive and Utilize Odoo intranet for easy access and control.	2020-04-30	2020-09-28	Not Started	51
179	Develop a Document Management System programs to enable the automation of documentation	2020-09-30	2020-09-28	Not Started	51
158	Refer to the files and location mentioned.	2020-05-13	2020-09-28	Completed	164
180	Pass the Third-party ISO 9001:2015 QMS Surveillance Audit	2020-12-31	2020-09-28	Not Started	52
181	Procurement & deploy three (3) Virtual PC server	2020-06-30	2020-09-28	Not Started	53
182	Reduce RMA Interim report submission to 30days (upon received of complete information or RMA units)	2020-12-31	2020-09-28	Not Started	43
183	Reduce RMA Final CAPA closure time to 60days (upon received of complete information or RMA units)	2020-12-31	2020-09-28	Not Started	43
184	Reduce Ext. Mfg. Reject/Scrap rate by 2%	2020-12-31	2020-09-28	Not Started	45
185	Improve response time to quality issue\r\n- Interim Report submission 7 days\r\n- Final closure 30 days	2020-12-31	2020-09-28	Not Started	45
186	25G Qualification in Denton I29\r\n1. Ar ablation recipe: DOEs\r\n2. AR & HR coating stacks working on- Oct 20\r\n3. Alu DFB: 350um: CBT passed & 168Hrs BI & UDH ongoing- Dec 20\r\n4. 25 G: Jig testing ongoing.\r\n5. DOE for 25G products- Oct 20\r\n6. 25G: CBT pass, HTOL 2000Hrs - Jan 21	2021-03-01	2020-09-28	Not Started	179
203	Ensure consistent wafer processing	2020-12-31	2020-09-29	Not Started	200
192	1. Lapping tool SPC setup\r\nStatus: Setup the metro tool SPC ok.\r\n2. Product SPC setup\r\nStatus: SPC chart is there	2020-06-30	2020-09-29	Completed	142
193	ECN SPR220/BCB for lapping\r\nStatus: Done. ER #: 20-WP-ER-0006	2020-06-30	2020-09-29	Completed	142
194	DI guideline setup: \r\nDone. To continue update the new defect and submit a new version in future.	2020-09-30	2020-09-29	Completed	142
191	1. 100% SOP on backlap area\r\nStatus: Based on the requirement, the OOS SOP and defect handling SOP has been updated into the spec QS-FAB-PR-059 Rev C\r\n2. New operator training and certification.\r\nStatus: Trained and certificated the new lapping operator Sri. He can perform the lapping job independently.\r\n3. Measure current productivity & improve by 10%\r\nStatus: Ongoing -To try ESC method for bond(remove wax)\r\n4. Audit finding closure\r\nStatus: Logsheet QS-FAB-PR-059 modified ok based on the QA audit result	2020-12-30	2020-09-29	Completed	144
197	Patent/trade secret/publish technical paper	2020-12-30	2020-09-29	Not Started	146
210	Au plating tool sourcing\r\nStatus: China supplier identified. Demo wafer qualification finished and can meet the requirement. Pending tool purchase.	2020-12-30	2020-09-29	Working	198
200	Litho rework reduction\r\nStatus: current performance at <5%	2020-12-30	2020-09-29	Working	145
221	Tool readiness check done. etch rate uniformity check done. 1st pilot run is on going. Pend for the test result.	\N	2020-09-29	Not Started	128
187	Ensure consistent wafer processing	2020-12-31	2020-09-29	Working	187
206	Ensure consistent wafer processing	2020-12-31	2020-09-29	Not Started	199
207	Ensure consistent wafer processing	2020-12-31	2020-09-29	Not Started	201
209	Support engineering evaluation on process improvement	2020-12-31	2020-09-29	Not Started	200
202	Defect scan tool purchase\r\nStatus: After compared many potential suppliers, identified Hauman is the best cost performance supplier. Price at about USD 170k compared to others at USD 400k and above. Pending final confirmation of the purchase.	2020-09-30	2020-09-29	Working	198
196	15nXT negative resist evaluation:\r\nPending PG/Ultrasonic+APT ASH evaluation to remove resist after PLT	2020-12-30	2020-09-29	Working	142
211	Support engineering evaluation on process improvement	2020-12-31	2020-09-29	Not Started	199
212	Support engineering evaluation on process improvement	2020-12-31	2020-09-29	Not Started	201
213	Work with module team to ensure smooth processing of 3" wafers	2020-12-31	2020-09-29	Not Started	203
214	Transfer all production and engineering runsheets to DMES	2020-09-30	2020-09-29	Not Started	204
215	Analyze past/current CoNC cases	2020-12-31	2020-09-29	Working	205
217	Support engineering evaluation on different etch process, mask change, etc	2020-12-31	2020-09-29	Not Started	187
189	Ensure consistent wafer processing	2020-12-31	2020-09-29	Working	188
219	Support engineering evaluation on HIC process and FC capability	2020-12-31	2020-09-29	Not Started	188
216	Support engineering evaluation on CoNC reduction	2020-12-31	2020-09-29	Working	205
220	GRT etch recipe in SAMCO was characterized, GRT profile for the new recipe is acceptable. Currently one quarter split wafer ran but broken at Fab A during regrow. And one full size wafer run through. Pending end of line test result.	\N	2020-09-29	Working	126
222	Due to hard ware issue, process qualification hasnot started yet	\N	2020-09-29	Not Started	127
223	Try run on the dummy wafers with and without pattern and masked with UV26 and NLOF done. Scope inspection show comparable result for ACT410 and Remover 1165. Currently it is under test run in engineer wafers. Pend the result for the release of production wafers.	\N	2020-09-29	Not Started	129
224	Both DFB and ELED split wafers COS units completed 500hrs burnt in test with acceptable result and tool under conditional release. Pend another 500hrs burnt in and test result for the full release.	\N	2020-09-29	Not Started	202
225	Completed base etch recipe characterization with some short loop wafers ran.	\N	2020-09-29	Not Started	125
201	3" process readiness\r\nStatus: 3" chuck ready, coating recipes tuned ok	2020-09-30	2020-09-29	Completed	145
208	2nd hand Dektak tool purchase\r\nStatus: Supplier identified and purchase on going. No response from supplier now. Pending chasing.	\N	2020-09-29	Working	198
198	Tool type cross training:\r\nTF process training is ongoing.	2020-12-30	2020-09-29	Working	146
199	Mentorship to IA student\r\nStatus: Teach the lapping process to the IA student	2020-12-30	2020-09-29	Completed	146
195	Vernier mask for grating layer: Test done and to keep the current process is the best choice.	2020-08-30	2020-09-29	Completed	142
226	SiO2 film analysis\r\n1. RI - Done.\r\n2. uniformity -done\r\n3. Stress -measured\r\n4. Etch rate check-Done\r\n4. Repeatability check- done -Mar 20\r\n- Started using for 25G products - \r\nNext plan: Back up SiO2 in Trion-ongoing	2020-10-15	2020-09-29	Working	179
227	Low Stress SION recipe for Oxford\r\n1. RI - Done.\r\n2. uniformity -done\r\n3. Stress -measured\r\n4. Etch rate check-Done\r\n4. Repeatability check- done -Mar 20\r\n Started using for 25G products	2020-10-30	2020-09-29	Not Started	179
230	Setup clean frequency and no contamination due to coating Jigs\r\nBack up for AR & HR coating Jigs- Arranged external vendor with manufacturing\r\n2 slot Jig to increase the productivity by 20 bars/ run from 12 bars/ run	2020-12-31	2020-09-29	Not Started	178
231	New Quartz plate for Trion & Oxford . \r\nTwo wafer/ run Clean recipe optimization going on\r\nIncrease to three wafer per run	2021-03-01	2020-09-29	Not Started	178
232	SIN HM in Oxford: Process is ready. Evaluation in ongoing\r\nE-Beam: communicated and confirmed the process capability of IMRE E-Beam tool \r\nRTP: communicating with NTU	2020-11-30	2020-09-29	Not Started	178
233	Developed a new low stress AR recipe in Oxford. DA simulation Sep 20 Need to proceed the Qual with new recipe- Nov 2020 1000Hrs HTOL for the new low stress recipe	2021-03-01	2020-09-29	Not Started	178
234	1. Daitron bar stacker is capable of loading bars which the CL more than 250um \r\nDuplicated (Xtreme) Jig Qual\r\nFor the 150um CL- manual loading Jig is ready	2020-11-15	2020-09-29	Not Started	178
235	Trion AR coating back up for Oxford\r\nHTOL passed for SLEDs : 1000hrs HTOL passed for ELEDs: 500Hrs	2020-07-31	2020-09-29	Completed	178
236	NML peel off -NCMR closed. No recurrence\r\nAR coating peel off Investigation ongoing. Low stress recipe evaluation ongoing	2020-12-30	2020-09-29	Not Started	160
238	Cary 5000 Spectrophotometer Qualification\r\nInstallation going on- Oct 20 Process recipes-\r\nProduction release-	2020-12-30	2020-09-29	Not Started	178
237	1.Acceptance \r\n2. Qualification \r\n3. Training of operators \r\n4. Back up for the existing F40.	2020-08-15	2020-09-29	Completed	178
258	Maintaining of proper stock for office supplies - hygiene & cleaning, stationary, pantry use etc...in daily basis	2020-12-31	2020-10-02	Not Started	169
259	Support Safety officer to ensure Company Safety License and Permit are renewed on yearly basis.	2020-12-31	2020-10-02	Working	169
256	Basic understanding of laser devices, namely:\r\n1) operation of laser (FP & DFB)\r\n2) critical parameters and impact\r\n\r\nHands-on:\r\n1) test setup and analysis methodology\r\n2) analysing tool (i.e. Tibco)	\N	2020-10-02	Working	228
260	Assisting Safety Officer on the application for TLD badge (Arsenic & Radiation test) with NEA on quarterly basis.	2020-12-31	2020-10-02	Not Started	169
261	Support on ad hoc Project administration and coordination to the needs of CEO and the Senior management team until project completion.	2020-12-31	2020-10-02	Not Started	169
262	Ensure goods received are processed daily in QuickBooks in a timely and accurate manner.	2020-12-31	2020-10-02	Not Started	170
252	Daily managing CEO's calendar, advise on conflicting events and carry out multiple rescheduling as necessary.	2020-12-31	2020-10-02	Not Started	166
253	Compiled the presentation slides 24 hour before Townhall Meeting	2020-12-31	2020-10-02	Not Started	166
247	Understanding testing methodology to analyse device performance and yield	\N	2020-09-30	Working	230
254	Ensure travel booking for CEO is done timely	2020-12-31	2020-10-02	Not Started	166
251	Understanding critical parameters and testing methodologies, namely for:\r\n1) High Speed DFB Device (i.e. S-parameters, RIN, eye diagram)\r\n2) High Power DFB Device (i.e. power, SE, Ith, voltage, centre wavelength, SMSR)\r\n3) SOA (i.e. gain, ASE, noise ratio/figure, bandwidth, ripple)	\N	2020-09-30	Working	231
255	Ensure all Corporate Travel request are approved in FYLE before requestor can proceed to make travel booking.	2020-12-31	2020-10-02	Not Started	169
263	Fine tune process on Goods Received Flow to be completed by end of 2020.	2020-12-31	2020-10-02	Not Started	170
264	Project completion on revamping the website by end 2020.	2020-12-31	2020-10-02	Not Started	171
265	Work with PE and PPC team to clean up all Product lists and remove the obsolete ones.\r\n-\tUpdate Product Brochures with up-to date Product list by end of 2020\r\n-\tMaintain the website with up-to date Product list by end of 2020	2020-12-31	2020-10-02	Not Started	171
266	Create social media contents and post it twice a month in LinkedIn	2020-12-31	2020-10-02	Not Started	171
267	Provide Customer Service support for US regions. \r\n-\tQuote within 48hours after receive an inquiry\r\n-\tEnter Sales Order and then send Order confirmation to Customer within 48hours after PO receive.\r\n-\tSupport after-Sales support such as chase for payment and provide shipping document to Customer after shipment has shipped.	2020-12-31	2020-10-02	Not Started	171
269	b. Review the HRIS to increase productivity for work - E- PMP by HuNet (By Q3, 2020) - E- OT System -Auto link to Citrix for time soft payout computation by HuNet (By March 2020)	\N	2020-10-05	Working	105
268	a. Attend at least 4 job fairs/talks to represent DLS (Total no. of attended by year end)	\N	2020-10-05	Working	105
270	At least sign two new distributors.	2020-12-31	2020-10-05	Not Started	185
271	Reach US$1.54M in the first half of 2020\r\nReach US$3.6M in the second half of 2020	2020-12-31	2020-10-05	Not Started	184
272	At least 4 design in for 25G laser, SOA or DFB 16xx	2020-12-31	2020-10-05	Not Started	186
273	Drive subcons to achieve > 90% yield.	2020-12-31	2020-10-07	Not Started	130
274	Improve 1st pass yield at SFO to > 80%	2020-12-31	2020-10-07	Not Started	130
275	Drive the subcons to meet cycle time < 4 weeks	2020-12-31	2020-10-07	Not Started	130
276	Maintain and optimize purchase requisition system. Ensure all POs are issued timely.	2020-12-31	2020-10-07	Not Started	138
277	Develop a mechanism to track cost savings	2020-12-31	2020-10-07	Not Started	138
278	Achieve cost savings of >$250k for 2020	2020-12-31	2020-10-07	Not Started	138
279	Develop alternate sources for key supply	2020-12-31	2020-10-07	Not Started	138
280	Source and select the Travel Management Companies that can offer the lowest cost of travel	2020-12-31	2020-10-07	Not Started	138
281	Chair QBRs with subcons	2020-12-31	2020-10-07	Not Started	130
282	Meet monthly and quarterly shipment target.	2020-12-31	2020-10-07	Not Started	139
283	Achieve OEE target of 60% for test equipment.	2020-12-31	2020-10-07	Not Started	139
284	Identify and fill all 2020 budgeted positions. Reduce attrition rate by 50%.	2020-12-31	2020-10-07	Not Started	139
285	Complete cross training for the engineering team to support APT Process & Equipment.	2020-12-31	2020-10-07	Not Started	139
286	Drive the fulfilment of 2020 CAPEX to support revenue and capability target.	2020-12-31	2020-10-07	Not Started	138
287	Lead, define and fulfill goals set under KFA 3.1 Cost effective External Manufacturing Strategy	2020-12-31	2020-10-07	Not Started	140
288	Lead, define and fulfill goals set under KFA 1.4 Improve Communication Amongst Team	2020-12-31	2020-10-07	Not Started	140
289	Lead KFA 4 Build and deliver effective and efficient business process’ and systems.	2020-12-31	2020-10-07	Not Started	140
290	Support and Meet Monthly/Quarterly Shipment Targets.	2020-12-31	2020-10-09	Not Started	292
291	Support and Deliver ILM Engineering Samples to Market	2020-12-31	2020-10-09	Not Started	292
292	Support and ship engineering DFB, 25G and SOA to market.	2020-12-31	2020-10-09	Not Started	292
293	Purchase and Qualify new chip tester	2020-12-31	2020-10-09	Not Started	293
294	Purchase and Qualify new Yelo System	2020-12-31	2020-10-09	Not Started	293
295	Identify and source new VI system or acquire additional VI capability to match production volume.	2020-12-31	2020-10-09	Not Started	293
296	Re-layout Plan for APT to improve production efficiency	2020-12-31	2020-10-09	Not Started	293
319	Recipe development for die attach of low DOP products	2020-12-31	2020-10-09	Working	175
299	Coordinate training plan for operators as scheduled	2020-12-31	2020-10-09	Not Started	294
320	KFA 4.3 Automation of processes: \r\na. WAT Report \r\nb. OGR Report \r\nc. STR to subcons	2020-12-31	2020-10-09	Not Started	176
321	KFA 3.1 Effective External Manufacturing Strategy	\N	2020-10-09	Not Started	176
303	Achieve and sustain the cumulative Yield Goal for 75% by maintaining Assembly Yield Goal 90%	2020-12-31	2020-10-09	Not Started	294
305	Drive Process Improvement to reduce cycle time by 15%	2020-12-31	2020-10-09	Not Started	294
306	Improve the WAT process with automation and process improvement.	2020-12-31	2020-10-09	Not Started	294
307	To acquire and qualify new subcontractors for 8-pin BTF, 14-pin FBGL lasers and ELED TO-Can. 6. Generate baseline SOWs for all subcons.	2020-12-31	2020-10-09	Not Started	173
308	Hisense: To formalize 8-pin collimated TO Cans into production – documentation, test correlation, etc. [Provided product goes into manufacturing]	2020-12-31	2020-10-09	Not Started	173
309	SFO: To ensure that proper qualification of new ferrules and make sure objective 1 is achieved through this change	2020-12-31	2020-10-09	Not Started	173
310	Cycle time to be improved to 3 weeks (average) for TO-Can and 4 weeks (average) for Butterfly.	2020-12-31	2020-10-09	Not Started	173
311	Yield at subcons to be maintained or exceed 90%	2020-12-31	2020-10-09	Not Started	173
312	Generate baseline SOWs for all subcons	2020-12-31	2020-10-09	Not Started	173
313	Assisting the Panwoo deliverables to ensure testing and sampling is done on time.	2020-12-31	2020-10-09	Not Started	295
314	Establish new product development procedure for design and assembly at subcons	2020-12-31	2020-10-09	Not Started	174
315	Ensure proper assembly and qualification of subcontractors if build is successful (this does not include qualification of the product)	2020-12-31	2020-10-09	Not Started	174
316	ILM DAS development with discussion and new modules build for the\r\ndevelopment of the box.	2020-12-31	2020-10-09	Not Started	295
317	Key projects (main subcon and alternative subcon stated): \r\na. 14-pin BTF narrow linewidth laser with double grating – AFR, PMS \r\nb. 8-pin low DOP SLED – AFR. PMS \r\nc. 14-pin BTF with TEC from TEC Microsystems – PMS, SFO \r\nd. 8-pin DFB Cooled TO Can with aspherical lens \r\ne. 14-pin BTF narrow linewidth laser with double grating with isolator – AFR, PMS, SFO \r\nf. Semiconductor Optical Amplifier (SOA) – AFR \r\ng. 25G TO-can, TOSA - Allray	2020-12-31	2020-10-09	Not Started	174
318	Purchasing and commissioning of new APT equipment: \r\na. Auto COS Tester - Yelo \r\nb. Chip tester - Fittech \r\nc. VI System	2020-12-31	2020-10-09	Not Started	175
322	KFA 1.4 Improve Communications amongst Teams	2020-12-31	2020-10-09	Not Started	176
323	Benchmarking OEE Standards	2020-12-31	2020-10-09	Not Started	296
324	Introduce OEE thru in house developed sensors	2020-12-31	2020-10-09	Not Started	296
325	Explore government Grants for Industry 4.0 introduction into DLS	2020-12-31	2020-10-09	Not Started	296
326	Possibility to have split functions	2020-12-31	2020-10-09	Not Started	297
327	Include Travellers into the system	2020-12-31	2020-10-09	Not Started	297
328	WIP Profile of APT thru charts and data for better visibility and analytics	2020-12-31	2020-10-09	Not Started	297
329	Setup weekly performance management meetings to address gaps between actual versus targets and formulate actions plans to bridge the gaps	2020-12-31	2020-10-09	Not Started	298
330	Contribute the success of KFA4.1 (order to ship solution thru odoo) and KFA4.3 (automate manufacturing operations)	2020-12-31	2020-10-09	Not Started	298
331	Introduce Kaizen Boards	2020-12-31	2020-10-09	Not Started	298
332	Issue PO within 1 to 2 after PRF is approved.\r\nKeep communication with internal requestors regarding the requirement on requested delivery time and receiving.\r\nEmail and regular call with vendors to ensure on time delivery.\r\nCreate PO master data sheet to track all PO status	\N	2020-10-09	Not Started	302
333	Negotiate with Subcon SFO, ALLRAY, PMS cut down cost\r\nNegotiate on Capex PO\r\nNegotiate on PO with high value	2020-12-31	2020-10-09	Not Started	303
334	Keep frequent communication with Subcon via Email, call and weekly meeting to ensure on time delivery\r\nLoad subcon with forecasting to short lead time :  3 weeks for TO CAN, 4 weeks for Butterfly Can which current status is 5-7 weeks.\r\nMaintain excel sheet of each subcon to track WIP status	2020-12-31	2020-10-09	Not Started	304
335	Ensure accuracy of monthly expense reporting on Capex, Subcon and others including direct and indirect materials	2020-12-31	2020-10-09	Not Started	305
337	Achieve OEE target of 60% for test\r\nequipment.	2020-12-31	2020-10-09	Not Started	308
338	Meet monthly and quarterly shipment\r\ntarget.	2020-12-31	2020-10-09	Not Started	308
340	Identify and fill all 2020 budgeted positions.\r\nReduce attrition rate by 50%.	2020-12-31	2020-10-09	Not Started	309
339	Completed APT operator cross training by end of the years 31/12/20	2020-12-31	2020-10-09	Working	309
343	On Time Delivery (Meet monthly and quarterly shipment\r\ntarget)	2020-12-31	2020-10-09	Completed	60
349	Maintain 90% Box yield for box assembly.	2020-12-31	2020-10-09	Not Started	288
350	Maintain zero safety incidents per month	2020-12-31	2020-10-09	Not Started	288
351	Ensure and maintain supply of raw materials or COGS.	2020-12-31	2020-10-09	Not Started	288
352	Define PM/Calibration schedule for all equipment used for ILM and ensure all machines are calibrated on time.	2020-12-31	2020-10-09	Not Started	288
356	Support KFA5.5 Initiate capability development of System-in-box ILM solutions for key applications over (2- 3  year) mid-term roadmap.	2020-12-31	2020-10-09	Not Started	290
354	Introduce 10kHz ILM box for DAS market\r\nTroubleshoot, finalise and produce 10kHz ILM box for production	2020-12-31	2020-10-09	Working	290
357	KFA 4: Inventory and Materials Tracking	2020-12-31	2020-10-09	Working	316
355	KFA 4: WO Automation	2020-12-31	2020-10-09	Working	316
358	KFA 2: SOA Scheduling and Shipment	2020-12-31	2020-10-09	Working	316
360	Semi-automate OGR generation by software	2020-12-31	2020-10-09	Not Started	289
353	Improve Subcon Planning and Forecasting considering yield issues and sales forecast	2020-12-31	2020-10-09	Completed	315
361	Increase capacity by introducing third production line.	2020-12-31	2020-10-09	Not Started	289
362	Implement DAQ testing for High temp test (SLED) to free up operator	2020-12-31	2020-10-09	Not Started	289
363	Implement Set-up for BF10 Coil winding to free up operator	2020-12-31	2020-10-09	Not Started	289
365	Define alternate source plan for key material used in ILM	2020-12-31	2020-10-09	Not Started	289
366	Outsource testing of PCBA to PCBA vendor	2020-12-31	2020-10-09	Not Started	289
364	Qualify vendor for production of ILM Box Electrical Cables	2020-12-31	2020-10-09	Working	289
370	On Time Delivery (Meet monthly and\r\nquarterly shipment target)	2020-12-30	2020-10-09	Not Started	319
373	Build die/CoS bank and Modules for high\r\nrunner devices based on forecast	2020-12-30	2020-10-09	Not Started	319
376	KFA 2: SOA Scheduling and Shipment	2020-12-31	2020-10-09	Not Started	321
377	KFA 4: Inventory and Materials Tracking	2020-12-31	2020-10-09	Not Started	321
378	KFA 4: WO Automation	2020-12-30	2020-10-09	Not Started	321
375	Improve Subcon Planning and Forecasting\r\nconsidering yield issues and sales forecast	2020-12-31	2020-10-09	Working	320
369	Improve Subcon Planning and Forecasting considering yield issues and sales forecast\r\n- On time shipment of die/CoS to subcon to meet weekly loading plan\r\n- Material availability of Consigned materials to support build requirement	2020-12-31	2020-10-09	Working	300
368	Build die/CoS bank and Modules for high runner devices based on forecast\r\n- Up to Date FG Inventory Tracking and Monitoring	2020-12-31	2020-10-09	Working	299
374	KFA 4: WO Automation\r\n- Work with the team to implement Odoo work order for production	2020-12-31	2020-10-09	Working	301
372	KFA 4: Inventory and Materials Tracking\r\n- Input all In-house and Consigned Materials in Odoo for Tracking	2020-12-31	2020-10-09	Working	301
371	KFA 2: SOA Scheduling and Shipment\r\n- Implementation of DSL commit dates and processing of shipment within Odoo system	2020-12-31	2020-10-09	Working	301
367	On Time Delivery (Meet monthly and\r\nquarterly shipment target)	2020-12-31	2020-10-09	Working	299
386	Facilitate the training and certification of new operators on Burn-in (ILX and Yelo)\r\nand Manual Test	2020-12-31	2020-10-09	Not Started	323
347	To achieves 5.4 M revenue in Q3 / Q4  2020\r\na) Q3 : $1.97 M\r\n\r\nb) Q4 : $3.43 M	2020-12-31	2020-10-09	Working	312
390	ELED cycle time improvement to meet base line target cycle time for CTB, Auto bar, BTD and die sorter at 6 days and below.	2020-12-31	2020-10-09	Not Started	311
391	Daily Work Order tracking to meet the setting target at 90 % and above	2020-12-31	2020-10-09	Not Started	311
392	Support and Meet Monthly/Quarterly\r\nShipment Targets.	2020-12-31	2020-10-10	Not Started	325
393	Assisting the Panwoo deliverables to\r\nensure Assembly & testing and sampling is done on\r\ntime.	2020-12-31	2020-10-10	Not Started	326
394	Assisting the High Power DFB/25G/FP/SOA/BH to\r\nensure availability of Assembly line , Testing Stations to support NPD	2020-12-31	2020-10-10	Working	326
395	Successfully qualified daitron for WTC,BTD, CTB ELED/DFB/25G/SLED	2020-12-31	2020-10-10	Not Started	327
396	Coordinate with Supervisor to Provide Training and Certification of Operators (cross train and multi tasking skill development) as per Schedule	2020-12-31	2020-10-10	Not Started	328
397	Provide OJT to Technicians and engineer as multi skill development and backup resource	2020-12-31	2020-10-10	Not Started	328
398	Achieve and sustain the cumulative Yield\r\nGoal for 75% by maintaining Assembly Yield\r\nGoal 90%	2020-12-31	2020-10-10	Not Started	328
399	Created Die attach machine automated recipe's for different product to reduce cycle time to improve process capabilities	2020-12-31	2020-10-10	Not Started	328
400	To support equipment move in, Hookup and qualify Fit Tech Chip Tester	2020-12-31	2020-10-10	Not Started	327
401	To support equipment move in, Hookup and qualify Yelo Test System	2020-12-31	2020-10-10	Not Started	327
348	Meet quarterly and monthly shipment target.	2020-12-31	2020-10-09	Working	288
359	1)\tHand over management of materials to Siti	2020-12-31	2020-10-09	Working	291
388	Dedicated 4Pin TO can Jig to avoid wrong DUT insertion and cause damage to the parts - Q2	2020-12-31	2020-10-09	Working	324
379	Continuous support by cross training of operators and technician to provide flexibility on critical process/machines - Q3\r\nCome up of list the training to be completed by self into testing then to take over certification. \r\n- Planned out the list training to be completed - Q4	2020-12-31	2020-10-09	Working	317
387	Regularly publish Yelo Engineering WO Utilization to support product HTOL and Fab machine qualification - Q3 & Q4	2020-12-31	2020-10-09	Working	324
341	Build die/CoS bank and Modules for high runner devices based on forecast	2020-12-31	2020-10-09	Completed	60
385	Maintain VI yield and getting in the microscope and qualification\r\nMonitor test yield related defects and come up with corrective actions	2020-12-31	2020-10-09	Working	323
403	1. Restore Palomar machine on April 2020 which save DLS US$60k to repair it. \r\n2. Improved Auto bar TEC for better performance by installing water tank,\r\n3. Qualified Newport spheres for manual stations for better accuracy and tester performance\r\n4. Improved SPC for Test and Assembly process by introducing excel monitoring	2020-12-31	2020-10-10	Not Started	328
404	Coordinate with IE and layout assembly machines and Test stations according to Manufacturing Process Flow	2020-12-31	2020-10-10	Not Started	328
406	Support to setup and run engineering WO Daitron/ Die Attach/Wire bond in CoS build for different design masks patterns	2020-12-31	2020-10-10	Not Started	326
407	Support to setup and run engineering WO request for all assembly machines which need special attention	2020-12-31	2020-10-10	Not Started	325
408	Attend and Resolve Setup/equipment Down times and Process Issues On time to keep equipment availability higher 95% rate	2020-12-31	2020-10-10	Working	327
409	Monitor Assembly and Test Yield by Process and continue to support and Maintain 90%	2020-12-31	2020-10-10	Not Started	327
410	Improve safety and 5S in APT Assembly and test area by properly layout all cables and connectors in cable duct	2020-12-31	2020-10-10	Not Started	328
405	Designed and installed auto bar OSA Jig to for high speed DFB/FP/ELED/SLED OSA Measurement	2020-12-31	2020-10-10	Working	328
411	Support Release Operating procedures and work instructions , training Certification Documents by Process and update outdated documents	2020-12-31	2020-10-10	Not Started	328
412	Perform PM and Calibration of all APT equipment's, and Engauge external vendor to calibrate system	2020-12-31	2020-10-10	Not Started	327
421	Arrow on the whiteboard based for which boxes	2020-12-31	2020-10-12	Working	313
431	LIV Test Panel	2020-05-30	2020-10-12	Completed	338
420	ILM activity by product boxes (Incoming and Outcoming) with BF10 (Bandwear) and ILM daily. Need to input into Yield for ILM.	2020-12-31	2020-10-12	Working	313
422	Implement every Work Instructions (10/ 18 WIs) and New looks of Travelers for box with Rev B (upgrade)	2020-12-31	2020-10-12	Working	313
434	To achieve revenue target in 2020. Revenue target is , for 16xx DFB US$1857K and for other products US$3285K in China market( Company's annual sales revenue is US$13440K).	2020-12-31	2020-10-13	Not Started	207
514	Reach US$1.54M in the first half of 2020 Reach US$3.6M in the second half of 2020	2020-12-31	2020-10-14	Not Started	420
435	To promote new products( 25G CWDM4 DFB, 1550nm gain chip and SOA etc) to telecom customers, such as tranceiver makers, Huawei, ZTE etc.	2020-12-31	2020-10-13	Not Started	206
436	To do routine work on time, such as to join weekly revenue call, invite R&D engineer to introduce our new products to customers and provide forecast to factory etc	2020-12-31	2020-10-13	Not Started	208
417	Addition foam to prevent from wobbly and also install holder fiber tool so that your hand can acting as brake for spool.	2020-10-30	2020-10-12	Working	310
416	Set-up for BFs Coil winding	2020-08-30	2020-10-12	Completed	310
419	Material Inventory every end of month with new ID number within only ILM dept	2020-09-30	2020-10-12	Completed	313
423	Quality VS Time	2020-12-31	2020-10-12	Working	314
415	Ensure and maintain supply of raw materials in follow up and estimate of based on Q4. Try control users and based on urgent boxes esp ASE box.	2020-12-31	2020-10-12	Working	307
424	Learn and run for production to meet shipping date at same time	2020-12-31	2020-10-12	Working	314
413	Meet monthly and quarterly target	2020-12-31	2020-10-12	Working	307
414	Maintain 90% Box yield for box assembly on Q3 as Output targets.	2020-09-30	2020-10-12	Completed	307
418	It able to be working on FOS4X coil, I would like to experiment on it later or soon	2020-11-30	2020-10-12	Working	310
425	2)\tHand over preparation of OGR for boxes	\N	2020-10-12	Not Started	291
426	3)\tHave Siti handle tracking of WIP	2020-12-31	2020-10-12	Not Started	291
427	Generic Instrument Class for Sourcemeter\r\nK2420\r\nK2460	2020-10-30	2020-10-12	Not Started	337
428	Generic Instrument Class for TECSourcemeter K2500 and Arroyo 5235	2020-10-30	2020-10-12	Not Started	337
429	Generic Instrument Class for OSA Ando/Yoka and Anritsu	2020-10-30	2020-10-12	Not Started	337
432	SOA Test Panel	2020-08-31	2020-10-12	Not Started	338
433	PER Test Panel	2020-10-30	2020-10-12	Not Started	338
430	OSA Test Panel	2020-05-30	2020-10-12	Completed	338
441	Propose structure/method to achieve high BW SLED	2020-12-31	2020-10-14	Not Started	358
449	1. Set up a more robust KFA no. 1 teams led by new energized leaders \r\n2. Look at a Selection Assessment tool to check for cultur fit and commitment from final 2 candidates to 'Hire Right' \r\n3. Introduce a panel interview (if necessary)	2020-12-31	2020-10-14	Not Started	361
450	Identify & fill up 2020 budgeted positions - Hire as per AOP 2020 and according to the needsbut mindful of the cost of payroll acceding the budget	2020-12-31	2020-10-14	Not Started	361
446	b. Review the HRIS to increase productivity for work - E- PMP by HuNet (By Q3, 2020) - E- OT System -Auto link to Citrix for time soft payout computation by HuNet (By March 2020)	\N	2020-10-14	Not Started	360
447	a. Attend at least 4 job fairs/talks to represent DLS (Total no. of attended by year end)	\N	2020-10-14	Not Started	360
451	Odoo Recruitment Database - Maintain a database of CVs, in Odoo by Q4,2020 to keep track of good KIV candidates for future hiring & hiring via ODOO recruitment tracking system a) 50% by Q2,2020 b) 100% of CV by Q4,2020	2020-12-31	2020-10-14	Not Started	361
452	Improved NMTO and E-Boarding program in KFA no.1.1 Top 10% identified form Functional Review - 0% turnover and are retained from KFA no.13	2020-12-31	2020-10-14	Not Started	362
440	Deliver production wafers: Deliver 100% of requested wafers from PE team with good material quality.	2020-12-31	2020-10-14	Completed	356
662	Reduce Cost of Non-conformance (CoNC) by <5% with respect to the total cost of goods sold (COGS)	2020-12-31	2020-10-22	Not Started	244
448	1. Tool qualification based on InGaAsP material growth \r\n1a. 54708T ELEDs products @ 15XX: Rel test performed on wafer ID 19112B grown in G4 MOCVD (passed 2000 hrs test)\r\n\r\nTarget: To drift in Power (<20 %) at high current and high temp\r\n\r\nDocument name: "QS-PED-PR001-FRM02 Engineering Report _G4 qual_10.01.2020"\r\n\r\n1b. Low DOP 1310 SLEDs for Panwoo @ 13XX:  Rel test performed on wafer ID 19148A grown in G4 MOCVD (passed 500 hrs. test) : on going process\r\n\r\nTarget: To drift in Power (<20 %) at high current and high temp	2020-10-14	2020-10-14	Working	246
666	Conduct on-site periodic audit for Ext. Mfg. to ensure change management is being practice.	2020-12-31	2020-10-22	Not Started	244
439	AIX200 MOCVD operation model: To understand and plot the blue shift of PL peak run to run. Method (temperature, flow) to compensate the drifting.	2020-12-31	2020-10-14	Completed	350
453	Leadership Development - Conduct 4 supervisory training for potential managers/supervisors By Q2,2020, 2 training to be completed. By Q4, 2020, last 2 trainings conducted.	2020-12-31	2020-10-14	Not Started	362
454	Consistent welfare activities on alternate months to bond the people - 6 welfare activities to bey done by Q4,2020 Introduce workplace integration program (funded by WSG and administered by SNEF) to come up with integration activity for staff - Q3,2020 Touch points with new hires 1st, 3rd and 6th month of service in DLS to be organized by HRBPs assigned.	\N	2020-10-14	Not Started	362
456	Improve Communication - During townhall, introduce pigeon-hole questions for people to ask Rajan (by Apr 2020) - Start a group-chat Buddy system (4 existing employee mentor 1 new hire) per KFA no.1.3 (By April 2020) - Evaluate EOS 2020 results and start focused group coffee talks to determine action plans. (By March 2020)	2020-12-31	2020-10-14	Not Started	362
462	d. Conduct a market adjustment for key employees by March 2020 (By March 2020)	2020-07-31	2020-10-14	Not Started	363
463	c. Prepare a Salary increment proposal in May for July 2020 Implementation (By May 2020)	2020-07-31	2020-10-14	Not Started	363
464	b. Propose a general bonus proposal for the Board's approval (By April 2020)	2020-07-31	2020-10-14	Not Started	363
468	a. Propose a sales incentive Plan for implementation twice a year (SIP) (By April 2020)	2020-07-31	2020-10-14	Not Started	363
469	b. Ensure HODs rate and rank their employees under their charge during Functional Reviews and ensure top 10% identified as key personnel are retained. (By August 2020 functional reviews done and key talents identified)	2020-12-31	2020-10-14	Not Started	364
470	a. Identify next set of potential leaders to develop and train them via the DLS supervisory Leadership program found in KRA (2) and reduce the no. of reports to HODs for better management. (BY Q3,2020 completed functional reviews)	2020-12-31	2020-10-14	Not Started	364
472	Already well trained to handle all this task independently.	2020-09-30	2020-10-14	Not Started	378
473	Able to perform independently.	2020-09-30	2020-10-14	Not Started	386
474	Able to do it once understanding of  MOCVD is strong.	2020-09-30	2020-10-14	Not Started	393
475	a. Implement a system that links Quote to Invoicing in Odoo b. Implement sample request process in Odoo c. Implement RFC process into Odoo d. Implement a reporting system through Odoo that is able to pull out YTD, QTD reports, backlog and book to bill	2020-12-31	2020-10-14	Not Started	394
516	At least 4 design in for 25G laser, SOA or DFB 16xx	2020-12-31	2020-10-14	Not Started	421
476	a. Enhance the current web-site. Measure based line and set performance goals for the improved site (e.g. number of visitors, bounce rate etc.) b. Work with internal teams to generate all the collaterals needed to ensure the web is up to date (datasheets etc) and contains relevant information (application notes) c. Ensure all products listed are manufacturable d. Set branding improvement measurement goals for relevant online platforms like LinkedIn. Formulate and execute plan to improve DenseLight branding	2020-12-31	2020-10-14	Not Started	394
477	Ship new SOA product to 1 customer by Q2	2020-04-30	2020-10-14	Not Started	395
478	Design win min 3 SOA or Gain chip designs by FY20	2020-12-31	2020-10-14	Not Started	395
479	Design in CW 70mW/70C lasers into at least 2 customers by Q4	2020-12-31	2020-10-14	Not Started	395
480	Design win min 3 new ILM customer in FY20	2020-12-31	2020-10-14	Not Started	395
481	Identify growth channels and markets by Q2	2020-04-30	2020-10-14	Not Started	396
482	Bring these channels online by Q2 (e.g. rep, distributor, US sales)	2020-04-30	2020-10-14	Not Started	396
483	Min $500K revenue from US (non POET)	2020-12-31	2020-10-14	Not Started	396
484	Hit Company revenue Goal - $12.1M	2020-12-31	2020-10-14	Not Started	397
485	Meet Quarterly Goals i. Q1: $1.24M ii. Q2: $2.40M iii. Q3: $3.87M iv. Q4: $4.59M	2020-12-31	2020-10-14	Not Started	397
486	Hit Non-China ILM revenue Goal - $500K	\N	2020-10-14	Not Started	397
487	Prepare product costing from May to Dec 2020	2020-12-31	2020-10-14	Not Started	399
488	Sharing PNL with analysis in staff meeting and respective owner in Fab A, B and APT	2021-01-15	2020-10-14	Not Started	400
489	Prepare monthly BOD report on time	2021-01-15	2020-10-14	Not Started	401
490	Ensure monthly closing within 4 working days	2021-01-06	2020-10-14	Not Started	402
491	a) 100% SOP set up for all steps / New Operator certification b) Enable 2 slot jig for AR/HR coat in Oxford / Trion for longer cavity lengths c) Back up tools qualification / deployment into production by Q2’20 d) Yield system set up by cleaning up using process mapping for SLED / ELED / DFB e) Assign One cost reduction activity per engineer (should cover material cost, gold reduction by integration and resist convergence)	2020-12-31	2020-10-14	Not Started	410
492	a) File atleast one patent or paper or trade secret from Process and Product groups per year b) Cross training on another tool c) Mentor ship by senior engineers to IA students	2020-12-31	2020-10-14	Not Started	411
493	a. Drive CONC to be less than 5% for Y2020. b. NCMR and RMA numbers to be reduced by 30% from last year’s c. SPC system set up at top 5 bins for matured products in Product group. d. SPC to next level in Fab B for i) tool level , ii) Product level, iii) Metrology level - Achieve Cpk > 1.33 & OOC < 10% + investigation on all OOC points e. Improve Fab B WAT yield to 90% by fixing process related issues f. Conduct routine audits and drive Audit findings to closure within 2 months g. PRM / ORT system set up for matured products (ELED / SLED / DFB)	2020-12-31	2020-10-14	Not Started	412
544	1. AL wafer growth (by 31/12/20)\r\n\r\na. CWDM4 high power DFB (6 MQW DFB) \r\nb. CWDM4 B and D version of 25G DML. \r\nc. CWDM6 D version of 25G DML	2020-12-31	2020-10-16	Not Started	114
459	Recipe already frozen for following products in AIX200\r\n- 3036H\r\n- 5169A\r\n- 54708T	2020-09-30	2020-10-14	Working	248
664	Reduce Vendor CoNC by 2% from previous year (2019)	2020-12-31	2020-10-22	Not Started	244
667	Establish remote audit system for top tier (or with high quality issues) raw materials supplier.	2020-12-31	2020-10-22	Not Started	244
465	Already discussed with team and started working on this task.  The progress in ongoing and discussed during MOCVD meeting.\r\n\r\nTarget: To develop a recipe for RG on grating wafer for G4 MOCVD reactor	2021-03-31	2020-10-14	Working	250
466	Target: To achieve a working BH device by end of 2020\r\n- Growth parameters optimization for the blocking layer RG in MOCVD with minimum leakage	2020-12-31	2020-10-14	Working	251
471	Transferred the recipe for 3036H product on 21.02.2020.\r\nTo find recipe in DCC please visit below:\r\n\\\\192.168.1.253\\Hemera\\DCC Share\\DCC Approved Documents for all users\\QMS\\FAA Documents\\MOCVD Recipe\r\n\r\nTarget: to transferred all production recipe in DCC folder	2020-02-21	2020-10-14	Completed	249
494	i) Support “key customer programs (Renesas, 25G DML, Huawei SOA, Panwoo, Almae BH, BW10 and other Laser projects) as per learning cycle plan. Scope issues and ensure successful wafer outcome for realizing revenue / NRE ii) Prelim qualification of ONE Renesas product by end 2020 iii) Drive Fab B process, Product and QA groups to help achieve 2 design wins for 1653DFB, 10G i-temp and 25G DML or High power DFB c-temp. iv) Smooth operations by ensuring back ups for all “possible” tools (at inhouse & at external sources) v) Cumulative Yield target of 75% for the year 2020.	2020-12-31	2020-10-14	Not Started	413
495	a. DFB yield improvement to 70% and others (SLED & ELED) to ~ 90% b. Fix process marginality issues (n metal peeling, Ripple fails, p-metal peeling with SiO2 scheme and others) c. WAT yield losses due to Fab B and Product related issues to be < 10% d. Qualify Eulitha for grating writing by end Q3 e. Demonstrate 3 inch wafer process	2020-12-31	2020-10-14	Not Started	414
496	Lead, define and fulfill goals set under KFA 3.1 Cost effective External Manufacturing Strategy	2020-12-31	2020-10-14	Not Started	415
497	Lead, define and fulfill goals set under KFA 1.4 Improve Communication Amongst Team	2020-12-31	2020-10-14	Not Started	415
498	Lead KFA 4 Build and deliver effective and efficient business process’ and systems.	2020-12-31	2020-10-14	Not Started	415
499	Meet monthly and quarterly shipment target.	2020-12-31	2020-10-14	Not Started	416
500	Achieve OEE target of 60% for test equipment.	2020-12-31	2020-10-14	Not Started	416
501	Identify and fill all 2020 budgeted positions. Reduce attrition rate by 50%.	2020-12-31	2020-10-14	Not Started	416
502	Complete cross training for the engineering team to support APT Process & Equipment.	2020-12-31	2020-10-14	Not Started	416
503	Maintain and optimize purchase requisition system. Ensure all POs are issued timely.	2020-12-31	2020-10-14	Not Started	417
504	Develop a mechanism to track cost savings	2020-12-31	2020-10-14	Not Started	417
505	Achieve cost savings of >$250k for 2020	2020-12-31	2020-10-14	Not Started	417
506	Develop alternate sources for key supply	2020-12-31	2020-10-14	Not Started	417
507	Source and select the Travel Management Companies that can offer the lowest cost of travel	2020-12-31	2020-10-14	Not Started	417
508	Drive the fulfilment of 2020 CAPEX to support revenue and capability target.	2020-12-31	2020-10-14	Not Started	417
509	Drive subcons to achieve > 90% yield.	2020-12-31	2020-10-14	Not Started	418
510	Improve 1st pass yield at SFO to > 80%	2020-12-31	2020-10-14	Not Started	418
511	Drive the subcons to meet cycle time < 4 weeks	2020-12-31	2020-10-14	Not Started	418
512	Chair QBRs with subcons	2020-12-31	2020-10-14	Not Started	418
513	At least sign two new distributors.	2020-12-31	2020-10-14	Not Started	419
604	First engineering samples of loopback SOA chip and CoS	2020-12-31	2020-10-19	Working	446
517	To determine the effect of MOCVD growth parameters (Fe-flow, V/III ratio) on the carrier concentration of Fe in InP_Fe blocking layers	2020-11-20	2020-10-16	Not Started	226
518	To standardize the in-situ oxide removal (pre-annealing) growth conditions	2020-11-30	2020-10-16	Not Started	226
519	To have a first draft ready for operating and maintenance procedures for G4	2020-11-20	2020-10-16	Not Started	227
521	To find partners or collaborators or place to do CL or u-PL characterization of our wafers.	2020-11-30	2020-10-16	Not Started	441
522	To establish a model to correlate the thickness and composition between planar area and growth in mask opening	2020-12-25	2020-10-16	Not Started	441
524	Increase the MOCVD KPI Yearly by 5 % or maintain the optimum KPI.	2021-01-01	2020-10-16	Not Started	427
525	To demonstrate the possibility of growing Al based 1550 nm devices with required strain and doping	2020-11-30	2020-10-16	Not Started	442
520	To implement SPC for G4:\r\nGrowth rate, Doping etc	2020-11-30	2020-10-16	Working	227
384	Facilitate all communications and setup for Manual and Auto Bar Testing Relay-out\r\n- Review problem of station 4 and station 1 discrepancy - Q4 \r\n- Create proper golden sample qualification system and management Q4.\r\n- Qualification of Fittech die tester.\r\n- Plan a target date  to move Autobar to assembly room	2020-12-31	2020-10-09	Working	322
526	Establish SMSR Yield vs Kappa-L Relationship	2020-12-31	2020-10-16	Completed	351
527	Reaching 65% SMSR Yield for Eulitha	2020-12-31	2020-10-16	Not Started	351
529	Complete Q4 target for ILM as far as PE support concerned.	2020-12-31	2020-10-16	Not Started	355
528	Document Readiness for Q4 Target	2020-12-31	2020-10-16	Working	355
530	Document Readiness for Q4 Target	2020-12-31	2020-10-16	Not Started	369
531	Meeting target for Q4 as far as PE support is concerned	2020-12-31	2020-10-16	Not Started	369
532	Fab A using new Data Structure	2020-12-31	2020-10-16	Not Started	354
533	Fab A Data can be integrated to TIBCO	2020-12-31	2020-10-16	Not Started	354
534	Walkthrough session (pre-UAT) finished in end of October	2020-10-31	2020-10-16	Not Started	353
535	Finished the UAT	2020-11-30	2020-10-16	Not Started	353
536	PDMS Go Live	2020-12-31	2020-10-16	Not Started	353
537	Able to run the old file that Cheng Guan had.	2020-11-15	2020-10-16	Working	357
538	Able to change the relevant input parameter in the simulation and checking the delta in the output parameter	2020-12-31	2020-10-16	Working	357
540	2. MOCVD Production Process Controls (Tool and Products)\r\n\r\na. Tool parameters SPC chart \r\nb. SPC charts for production products \r\nc. Continue process control development by Q1 2021	2020-12-31	2020-10-16	Not Started	115
542	4. Maintenance improvement\r\n\r\na. Reduce MOCVD downtime by 20%	2021-03-30	2020-10-16	Not Started	115
543	5. Characterisation of EPI\r\n\r\na. Improvement of XRD, PL and ECV analysis to determine growth quality and uniformity by reducing scraps to < 10% and improve uniformity to < +/- 5nm in edge exclusion. \r\n\r\nb. Periodic screening of EPI with TEM and SIMs analysis implemented to obtain data for (a).	2021-03-30	2020-10-16	Not Started	115
380	Come up with plan to closed the station1 to station4 measurements variation (1 mW to 3 mW). \r\nby Nov.\r\nCome up with improvement plan for Manual Test station GRR to be <30% by Dec\r\nSupport and qualify the new gain chip testing with development.	2020-12-31	2020-10-09	Working	317
545	2. BH Development for SLED, SOA and DFB \r\n\r\nAlpha versions of \r\na. 3159/1550 FP by Q4 2020 \r\nb. 1310 Low DOP SLED (Beta version)\r\nc. 1310 AL-based DFB	2021-03-30	2020-10-16	Working	114
549	6. SAE growth\r\n\r\na. Initial prototype of SAE growth for 2 device on single wafer	2021-03-30	2020-10-18	Not Started	115
546	1. G4 qualification\r\n\r\na. 500 hrs of ELED 54087T device\r\nb. Additional 5 wafers grown in G4 (at least ONE AL-based wafer) loaded for reliability test	2020-12-31	2020-10-16	Working	115
541	3. MOCVD recipe consolidation\r\n \r\na. Alignment of recipe for products (> 80%) in production (i.e. managed by PE)	2020-08-30	2020-10-16	Working	115
548	3. Grating development (by Q4 2020)\r\n\r\na. Qualify new grating vendor QXOPTO\r\nb. Develop > 800um cavity length 1310nm DFB\r\nc. Develop > 800um cavity length CWDM DFB by Q1 2021\r\nd. Develop 25G DML CWDM grating design for D version\r\ne. Develop 25G DML 1351nm and 1371nm grating design for D version by Q1 2021	2020-12-31	2020-10-18	Working	114
550	1. POET (by Q4 2020)\r\n\r\na. PO for $500K to be signed and deliverables agreed.\r\nb. WAT acceptance criteria for new objectives.\r\nc. Deliver Almae BH wafers	2020-12-31	2020-10-18	Not Started	118
552	3. Hitachi 1550nm SOA with 50nm bandwidth and Flip Chip \r\n\r\na. Technical proposal and cost\r\nb. Confirmation of NRE with Hitachi	2020-11-01	2020-10-18	Not Started	118
551	2. Acacia \r\n\r\na. Agree Technical specifications\r\nb. NRE (Development) pricing final proposal\r\nc. 1st iteration of Racetrack device fabrication and characterisation.\r\nd. Develop initial engineering test setup to test racetrack SOA	2020-10-01	2020-10-18	Working	118
553	4. ZTE 1550nm Gain Chip and SOA with Psat of 21dBm \r\n\r\na. Final proposal with pricing to ZTE for Gain Chip and SOA.\r\nb. Confirmation of project	2020-11-15	2020-10-18	Not Started	118
554	5. Huawei 1550 High DOP SOA\r\n\r\na. Ship 40 pcs 1550 SOA devices	2020-12-31	2020-10-18	Not Started	118
555	1. 10KHz 1550nm NLW for Wind LIDAR and DAS \r\n\r\na. < 30kHz Double grating 1550nm NLW BTF \r\nb. < 50kHz Double grating 1560nm NLW for BKTel\r\nc. 200mW NLW + EDFA MOPA \r\nd. Integrated Isolator BTF by Q1 2021	2020-12-31	2020-10-18	Not Started	112
556	2. 40mW High Power 200kHz 1550nm NLW for Auto LIDAR \r\n\r\na. Fabricated 1mm 1550 gain chip device by Aug 2020\r\nb. 40mW 1550nm NLW BTF	2020-12-31	2020-10-18	Not Started	112
557	3. 1310nm 120nm broadband SLED \r\n\r\na. Fabricate and characterised multi device MQW for 120nm (10dB) broadband device. To achieve > 100nm 10dB Span.	2021-02-27	2020-10-18	Working	112
558	4. 1310nm Low DOP SLED for China FOG \r\n\r\na. Improvement to MOCVD growth without undulations by Q4 2020\r\nb. > 0.8mW @ 100mA 8-pin BTF by Q4 2020\r\nc. > 1mW @ 100mA 8-pin BTF by Q1 2021	2021-03-30	2020-10-18	Not Started	112
560	1. High Power CWDM DFB 70mW@75C\r\n\r\na. 500um 1310nm DFB devices to achieve 50mW at 75C by Q3 2020\r\nb. Alpha 1mm 1310nm DFB to achieve > 70mW at 75C by Q4 2020\r\nc. Alpha 1mm CWDM DFB to achieve > 70mW at 75C\r\nd. Non-hermetic AL based DFB AR and HR coating\r\ne. > 2000 hrs HTOL	2021-03-30	2020-10-18	Not Started	113
561	2. 10G CWDM DML c-temp and i-temp\r\n\r\na. 1310nm and 1270nm by Q2 2020\r\nb. 1290nm and 1330nm by Q4 2020	2020-12-31	2020-10-18	Not Started	113
562	3. 25G CWDM DML c-temp and i-temp (by Q4 2020)\r\n\r\na. CWDM c-temp and e-temp by Q3 2020 \r\nb. Beta CWDM i-temp by Q4 2020.\r\nc. > 5000 hrs rel. qualification for 25G e-temp. by Q4 2020\r\nd. > 1000 hrs rel. qualification for 25G i-temp by Q4 2020	2020-12-31	2020-10-18	Not Started	113
563	4. 25G CWDM6 DML e-temp and i-temp (by Q1 2021)\r\n\r\na. 1351nm and 1371nm e-temp by Q4 2020\r\nb. 1351nm and 1371nm i-temp by Q1 2021	2021-03-30	2020-10-18	Not Started	113
564	5. High DOP SOA 1550nm - Single and 5-array\r\n\r\na. 1550nm SOA with Gain > 20dB, Psat > 9dBm, NF < 7.5dB, PER > 15dB and Bandwidth > 40nm operating at 40C	2020-08-30	2020-10-18	Working	113
565	6. Low DOP SOA 1310nm for 100ZR\r\n\r\na. Send packaged BTF samples (similar to Antritsu performance) to 100ZR customers (Taclink, Xgiga and Source Photonics). Achieve design-in for at least 1 customer.\r\n \r\nb. Design and fabricate submount design similar to Antritsu\r\n\r\nc. Repeat and fabricate 3 wafer growth	2020-12-31	2020-10-18	Not Started	113
566	1. Improvement and Implementation PRA and RFC\r\n\r\na. Implementation by Sales and NPD	2020-12-31	2020-10-18	Not Started	116
567	2. Improvement and Implementation of PDM\r\n\r\na. Implementation by NPD\r\nb. Regular audit implementation by QA	2020-10-30	2020-10-18	Not Started	116
568	3. Develop Benchmarking method \r\n\r\na. Develop Methodology and testing requirements\r\nb. Establish purchase channels for competitive devices\r\nc. Establish at least 1 case study	2020-12-31	2020-10-18	Not Started	116
569	4. Implement ROI template\r\n\r\na. Update with latest financial content every quarter\r\nb. Derive at least 2 x ROI cases for product council	2020-12-31	2020-10-18	Not Started	116
570	1. Establish at least 3 effective NPD sub teams with manager (directs)	2020-12-31	2020-10-18	Not Started	117
571	2. Establish clear RACI for > 80% of NPD programs	2020-12-31	2020-10-18	Not Started	117
572	3. Establish daily reporting updates by all PM at NPD daily pow wow meetings	2020-12-31	2020-10-18	Not Started	117
573	4. Implementation of PDMs for all NPD programs	2020-12-31	2020-10-18	Not Started	117
576	Customer 100% good experience by delivering the customer orders on time with 100% good quality by Q4'20.	2021-01-01	2020-10-18	Working	450
669	Establish a groundwork for Quality Management System align with automotive standard (TS16949)\r\n-\tAttend (if required) Automotive Industry Standard course/training\r\n-\tAssist QA Manager to prepare system documentations and system	2020-12-31	2020-10-22	Completed	245
629	Enable Product Engineering capability to perform tests on new test requirement, new package type, etc.\r\n\r\n\r\nKey Projects:\r\nReverse current Test - Molex Requirement\r\nStability Check - FP Product Requirement\r\nPulsed Testing - FP Product Requirement\r\nType M Testing - New TO Package\r\nType N Testing - New TO Package\r\nType R Testing - New TO Package\r\nType S Testing - New TO Package\r\nPinhole test - Collimated Lens characterization\r\nIR Camera Spot Size test - Collimated Lens characterization	2020-12-31	2020-10-19	Not Started	459
661	Re-institutionalize good housekeeping such as 6S program\r\n-\tConduct 6S orientation/training to all employee. \r\n-\tReward and commendation every townhall for best department 5S performance	2020-12-31	2020-10-22	Not Started	243
665	Improve response time to quality issue:\r\no\tInterim Report submission 7 days\r\no\tFinal closure 30 days	2020-12-31	2020-10-22	Not Started	244
575	Deliver 20% strategical solution to the key functional area of DLS by providing the disruptive performance of the innovative products and related building blocks by Q4'20	2021-12-31	2020-10-18	Working	449
668	Involvement of QA function to new product development\r\n-\tEstablish QA gates for each New Product Development Phases	2020-09-30	2020-10-22	Completed	245
578	1a) Operation Tool \r\n- Wafer Execution with separate functionality for each steps\r\n  > Generic\r\n  > QC Parameter Insertion\r\n  > Litho\r\n  > Litho Cleaning Procedure\r\n  > Transaction History\r\n  > Rework\r\n  > Event Log\r\n  > Rework History\r\n1b) Engineering Tool with advanced features\r\n- Enable Engineer to update and maintain Fab B Registry\r\n  > Mask\r\n  > Product Code\r\n  > Equipment\r\n  > Recipe\r\n  > Module\r\n  > Stage\r\n  > Block\r\n- Enable Engineer to Create Runsheet Template \r\n  > Modify Runsheet template using form view\r\n  > Modify Runsheet Template using Excel - Download and Upload\r\n- Enable Engineer to create Runsheet for Wafer Release\r\n  > Production Runsheet\r\n  > Engineering Runsheet\r\n  > Formula Selection\r\n  > Hold\r\n  > Skip	2020-05-01	2020-10-19	Completed	392
579	All the KPI Part 2 - DMES Phase 3 is completed successfully	2020-09-30	2020-10-19	Completed	452
602	Engineering samples of 1550nm high PDG and high Psat SOA (>=13dBm) chip and CoS for customer evaluation	2020-12-31	2020-10-19	Working	446
580	To complete the Project by 31 Dec 2020	2020-12-31	2020-10-19	Working	453
581	To complete the code by 31/8/2020	2020-08-31	2020-10-19	Completed	454
442	Complete the training list for AIX200 and G4 MOCVD equipment engineer	2020-12-31	2020-10-14	Working	359
582	Configure automatically email to Sales Department for Analytics report monthly	2020-03-31	2020-10-19	Not Started	372
583	Follow up with external 3rd party Odoo vendor (Pragmatic - India) to fix the issues on synchronization from Odoo to Quickbook	2020-12-31	2020-10-19	Not Started	379
584	Modify Sales Module as per Sales Department requirements	2020-09-30	2020-10-19	Not Started	373
585	Modify Manufacturing Order Module as per APT - Operation Department requirements	2020-09-30	2020-10-19	Not Started	374
586	Purchased Synology RS1619XS+	2020-03-31	2020-10-19	Not Started	365
587	Purchased 2 Virtual Machine (12 Virtual PC) to host 2 JMP licenses and also Tibco Spotfire installed on all VPC	2020-09-30	2020-10-19	Not Started	377
588	Modify Inventory Module as per PPC Department requirements	2020-09-30	2020-10-19	Not Started	375
589	Prepare rack for Starhub Gateway and lines hubs	2020-03-31	2020-10-19	Not Started	370
590	Deployment DMES for manufacturing use a.\tFab-B Runsheet automation b.\tFab-A GATR automation c.\tFab-A Recipe generation d.\tDITA  e.\tWAT automation	2020-12-31	2020-10-19	Not Started	371
591	Proceed to install DMES on Process Engineer Notebooks	2020-03-31	2020-10-19	Not Started	376
592	to enable digital signature in Document and google sheet	2020-12-31	2020-10-19	Not Started	455
593	a. To Finalize the base wafer/grating design\r\nb. To Finalize the wafer process design\r\nc. To Finalize the facet coating process\r\nd. To Establish the WAT procedure\r\ne. To Complete the Beta exiting report	2020-12-31	2020-10-19	Working	467
594	a. To Conclude the RR/LP/CB DOE\r\nb. To Conclude the D/B version base wafer design\r\nc. To Conclude the Klab/DLS sputter/DLS Denton coating process\r\nd. To Conclude the pulse mode test for distinguishing the COMD failure\r\ne. To Complete the Alpha exiting report\r\nf.  To Verify the grating vendor for PS grating writing\r\ng. To Verify the TRX design and configuration	2020-12-31	2020-10-19	Working	468
595	a.To provide the technical supports on base wafer design\r\nb.To provide the technical supports on grating design\r\nc.To provide the technical supports on facet coating process	2020-12-31	2020-10-19	Not Started	469
596	1. Manage and organize the preview meeting before drawing the mask\r\n2. Assign and prioritize the mask drawing job\r\n3. Manage and organize the review meeting after drawing the mask	2020-12-31	2020-10-19	Not Started	470
598	Develop test methodology to measure polarization dependent gain of low PDG SOA	2020-06-30	2020-10-19	Completed	445
599	Prepare documentation for product transfer	2020-12-31	2020-10-19	Working	445
597	Engineering samples of 1310nm low PDG SOA chip and CoS for customer evaluation	2020-09-30	2020-10-19	Completed	445
600	Complete epi process trial for Step-1A	2020-05-31	2020-10-19	Completed	444
601	Complete epi process trial for Step-1B	2020-12-31	2020-10-19	Working	444
603	Engineering samples of 1310nm low PDG SOA BTF module for customer evaluation	2020-12-31	2020-10-19	Working	445
605	Secure at least one NRE for development of 1550nm SOA with project pricing of at least U$100k	2020-12-31	2020-10-19	Working	446
606	Develop correlation database between ASE power and optical gain to enable production testing of SOA	2020-12-31	2020-10-19	Working	446
607	Develop first design for 500um CW DFB laser devices	2020-09-30	2020-10-19	Completed	447
608	Complete CW-DFB laser product documentation for Sicoya project	2020-12-31	2020-10-19	Working	447
616	# of RMAs settled successfully per product group per year.	2020-12-31	2020-10-19	Working	471
610	1650nm pulse FP Laser Development	2021-03-31	2020-10-19	Not Started	344
611	Eloira SLED 1550nm Passdown to Xiao Yu	2020-08-31	2020-10-19	Completed	344
609	OSI 1310nm and 1550nm Datasheet and sample creation	2020-12-31	2020-10-19	Working	344
613	DL-CS5153A Yield Improvement	2021-03-31	2020-10-19	Working	343
615	DL-CS5010-T30 & DLCS51010-ASE Epi Design	2021-03-31	2020-10-19	Not Started	343
618	30%-50% reduction of RMA case from 2019	2020-12-31	2020-10-19	Working	471
617	No recurrence of RMA/NCMR upon implementing CA/PA	2020-12-31	2020-10-19	Working	471
619	# of NCMR closed	2020-12-31	2020-10-19	Not Started	471
620	YTD # of sales engagement supported.	2020-12-31	2020-10-19	Not Started	472
621	Train Dheepeka about Yield and Task Management	2020-12-31	2020-10-19	Not Started	473
622	Passover SLED knowledge and concepts to Xiao Yu	2020-12-31	2020-10-19	Completed	473
614	SLED DL-CS5169A repeat build\r\n\r\nWas able to repeat using wafer 20040A	2020-12-31	2020-10-19	Completed	343
612	ELED new Engineering Mask Design to Improve Ripple	2021-03-31	2020-10-19	Working	343
623	To help met 2020 revenue and ensure no miss shipment due to product issues	2020-12-31	2020-10-19	Working	342
625	Development of Sample Bank for different form factors and wavelength for 16xx	2020-12-31	2020-10-19	Not Started	456
626	Establish Production readiness in execution of 16xx DFB volume orders	2020-12-31	2020-10-19	Not Started	456
438	1. SPC charts and production control plan: Create a dynamic SPC chart for checking of all production runs with the 3 main SPEC: PL peak; XRD strain % and PL standard deviation.\r\n2. Finish SPC chart to control the equipment process: AIX200, PL mapper and XRD. Start working on G4 process control charts.	2020-12-31	2020-10-14	Completed	349
624	Establish correlation with CM vendors to reduce in-house testing costs\r\n\r\nHisense correlation on wavelength 99% - Originally we had to test each unit 100% in DLS, with all the conditions for wavelength tuning. Now we only need to make the testing once\r\n\r\nImprovement points - originally the correlation was 70% - low, we asked Hisense to change the setup with collimated lens fiber and now we get 99% correlation with them\r\nOriginally: 15C, 25C, 40C, 20mA, 50mA - > 6 OSA tests\r\nNow: 25C - 50mA - 1 test only needed inhouse	2020-06-30	2020-10-19	Working	460
628	Test time improvement in Production test\r\n\r\nKey Projects:\r\n\r\nELED Autobar OSA Test - Originally can only test at Manual Station\r\nManual: 5 UPH\r\nAuto: 92 UPH\r\n\r\nDFB Auto Analysis software - Post processing capability on DFB Devices\r\nManual: 5 UPH\r\nAuto: 92UPH\r\n\r\nSplitter Type Test - OSA and LIV in one setup\r\nBefore: 5 UPH LIV OSA\r\nAfter: 12 UPH LIV OSA	2020-12-31	2020-10-19	Working	460
627	Improve team productivity by developing tools that will help in Data Analysis and Data Mining\r\n\r\nImprovement metrics is how quick the team can analyze and compile data\r\n\r\nKey projects:\r\nCompiler Software - Manual Compiling takes you an hour to copy paste data. Compiler software performs it in a few seconds\r\nOGR Generator - Multi file function enables PPC or Product Engineering to generate multiple OGR's in one setup. Original: 10 per hour to 30 per hour\r\nDirectory Mapper - Creates a list of all the files under a directory.	2020-12-31	2020-10-19	Working	460
630	Timely analysis and presentation of Fab Out wafers	2020-12-31	2020-10-19	Not Started	456
631	Timely Analysis of new DOE that comes out for Panwoo Devices	2020-12-31	2020-10-19	Not Started	458
633	Review the Sicoya Gamma Documents	2020-12-31	2020-10-19	Not Started	458
634	Design review for 25G.\r\nAlpha/Beta Phase Exit review\r\nGamma Phase Exit take over	2020-12-31	2020-10-19	Not Started	458
632	Help in setting up test stations by being knowledgeable in setup and operation of the Manual Stations.\r\nCover gaps in PE Team capability to make test setup and help the team deliver timely FA check on their products	2020-12-31	2020-10-19	Working	459
635	Achieve output power of 40mW with an initial engineering yield of 40%	2020-12-31	2020-10-20	Not Started	475
637	Produce 1560nm / 50kHz FBGL modules with an initial engineering yield of 40%.	2020-12-31	2020-10-20	Not Started	346
638	1550nm/10khz Module with initial engineering yield of 25%	2020-12-31	2020-10-20	Not Started	474
639	Digital communication capability (50%)\r\nDimensions L<150mm, W<100mm  (30%)\r\nCost <400USD (20%)	2020-12-31	2020-10-20	Not Started	347
640	100% of new technical document creation request answered within 3 weeks after request	2020-12-31	2020-10-20	Not Started	348
636	Completion of MOPA prototype (without dimension constraints:\r\n-200mW CW output power (50%)\r\n-<100khz linewidth (50%)	2020-11-30	2020-10-20	Working	345
641	1. Beta-Phase Exit\r\n2. Hand-over Technical Package to Product Eng'g Team\r\n3. Move to Gamma Phase	2019-12-31	2020-10-20	Not Started	433
642	1. Alpha Phase Exit\r\n2. Alpha Sample Availability	2019-12-31	2020-10-20	Not Started	434
643	1. CW Laser, Almae BH wafer Deliveries\r\n2. 25G DML wafer Start Initiation	2019-12-31	2020-10-20	Not Started	432
644	1. Phase 0 Exit\r\n2. Alpha Sample Availability	2019-12-31	2020-10-20	Not Started	435
645	Reliability qualification of the AXT wafer substrate and the Almae vendor grating regrowth.	2020-04-09	2020-10-20	Not Started	422
646	Define the move-in, acceptance criteria of the Yelo burn-in and HTOL reliability testing system.	2020-02-01	2020-10-20	Not Started	425
648	Perform HTOL on various versions of the 25G devices on the Yelo system	2020-10-13	2020-10-20	Not Started	423
649	Full packaging qualification of the Hisense 8-pin TO Can	2020-04-15	2020-10-20	Not Started	424
650	Develop a SLED with BW 115nm, Power 6mW using 2 strategies in parallel.	2021-07-01	2020-10-20	Not Started	477
651	PDM conformance and increased PM technical efficiency.	2020-11-01	2020-10-20	Not Started	476
443	- Based on I-V test performed on 20062A grown in G4 (D-version -1290 FP device), the ideality factor looks better than BW10 grown wafers that means the epi quality is good enough to proceed with for DFB device:\r\n   a. Ideality factor better than BW10 grown wafers\r\n   b. Rd looks flat that shows no leakage  \r\n\r\n- Based on recently grown wafers in G4 with wafer ID 20063A for D version-1290 DFB device, it seems epi quality is better than BW10 grown epi. The results were presented by PC on 13the Oct 2020 in 25 G i-temp meeting. The wafer passed all the specs. Already done	2020-10-12	2020-10-14	Completed	247
460	Already performed on G0573A-Q1 and shows flat topography after Grating regrowth was performed on 13.05.2020 in G4 MOCVD confirmed by TEM images.\r\nTarget: to achieve bottom grating layer growth without any dislocations\r\n\r\nAlready achieved!	2020-05-13	2020-10-14	Completed	252
467	Target: to achieve PL uniformity all over the substrate within +/- 5 nm with 5 mm edge exclusion\r\n- W2W variation is within < 5 nm\r\n- R2R variation should be < 3 nm	2020-10-30	2020-10-14	Working	253
652	Target: To develop a recipe to achieve the undulation free growth of complex quantum well by optimization growth parameters\r\nWe already confirmed the undulation free Quantum well growth for following wafers:\r\n20121A/B/C (SLEDs)\r\n20122A/B (SLEDs)\r\n20120B/C (for SOA device)\r\n20123A/B (SLEDs)\r\n20124A/B (SLEDs)\r\n20137A/B (SLEDs)\r\n20138A/B (SLEDs)	2020-10-10	2020-10-20	Completed	480
455	Already trained/ transfer all knowledge I had with G4  to following engineers on G4 and AIX200 for hardware maintenance to exchange inlet parts of G4 MOCVD:\r\n1. Wesley\r\n2. Sang\r\n3. Hameed\r\n4. Dheeraj\r\n\r\nTarget: each individual  can perform task independently each task with proper documentation: done	2020-09-30	2020-10-14	Completed	248
653	-\tReduce customer RMA to 30% from the previous year (2019)	2020-12-31	2020-10-22	Not Started	242
654	Reduce RMA Interim report submission to 30days (upon received of complete information or RMA units)	2020-12-31	2020-10-22	Not Started	242
655	Reduce RMA Final CAPA closure time to 60days (upon received of complete information or RMA units)	2020-12-31	2020-10-22	Not Started	242
663	Reduce Subcon-related Reject/Scrap rate by 2%	2020-12-31	2020-10-22	Not Started	244
658	Centralize documentation and acceptance for incoming material inspection by creating google shared drive for all department incoming material documentations and approval.	2020-03-31	2020-10-22	Completed	243
657	Create incoming inspection request google form and deploy to PPC for any materials required incoming inspection.	2020-03-31	2020-10-22	Completed	243
647	Develop a Ridge-Based low-DOP SLED product with performance parameters: 1mW fiber out power, PER<1dB, BW>35nm	2020-06-30	2020-10-20	Working	426
660	Include 6S in the audit checklist to support the 6S program	2020-03-31	2020-10-22	Completed	243
656	Establish Incoming Process Control for direct materials (substrates, mask plates, chemicals, gases, others,) using the COC of these materials	2020-03-31	2020-10-22	Completed	243
659	Re-establish Monthly Quality Patrol Audit to counter check process and manufacturing process compliance to requirement and standard. To check Recipe, Runsheet, GATR, WAT and Test data & results (FMEA, Control Plan and SPC check included)	2020-03-31	2020-10-22	Completed	243
577	1. Deliver project deliverable on time and meet customer technical spec requirements of 1310 CW 70mW@70C Q4'20\r\n2. Meet -40C to 85C of SLED operation of SLED @5mW with turn on <4s by Q4'20\r\n3. 100% transfer of CISCO project to making a summary of work.	2021-01-01	2020-10-18	Working	451
382	Yelo Burn-in Utilization improvement by qualifying multiple WO loading in one slots. - Q2\r\nQualify new 2 additional COS Jig for production and engineering capacity improvement - Q3	2020-12-31	2020-10-09	Working	322
381	Review current OEE on APT Test-Burn-in equipment and come up with actions plan to improve OEE to reach the OEE target 70%.\r\n   1) PM checklist (95% execution with feedback).  PM execution and Checks by Dec\r\n   2) Machine Test downtime target<5%. by Dec\r\n   3) Response to test issues and corrective actions should be less than 1 day. Except for plan \r\n      downtime.\r\n   4) ILX Burn-in Slots improvement to 40 BTF slots. by Dec	2020-12-31	2020-10-09	Working	317
670	ISO and ESD to clear.\r\n-To complete all ESD and ISO items by Nov.\r\n- complete the mandatory training for 5S and Safety and apply it.	2020-12-31	2020-10-23	Working	484
671	BH-Based Low DOP SLED	2021-06-15	2020-10-27	Not Started	426
682	Equipment need to setup by - 2/11/20\r\nPrepare 3 samples for temp linearity check in house - 09/11/20\r\nPrepare another 3 samples for temp linearity check at NTU - 09/11/20\r\nDetermine if any offset between both tools	2020-11-15	2020-10-27	Not Started	491
677	Qualified. Trion can backup Oxford.- Aug 20\r\n(Supported MOLEX delivery for Q3)	2020-08-31	2020-10-27	Completed	489
691	4 Samples received after plating completed by vendor\r\nPending visual inspection check, nodules check	2020-10-31	2020-10-27	Not Started	492
673	2 Jigs currently able to load 12 bars - stability, shake & repeatability test done\r\nno bars dropping inside chamber after deposition\r\n\r\n\r\n.	2020-10-19	2020-10-27	Completed	258
680	1 Jig modified to fix shadowing and overcoating issue: \r\n1) improvement observed. \r\n2) Overcoating did not touch the bond pad	2020-10-19	2020-10-27	Completed	258
679	RTP-02 backup:\r\n4 point probe tool arrived - 24/10/20\r\n\r\n1.  E-BEam: communicated and confirmed the process capability of IMRE E-Beam tool (1 NML deposition completed 01/10/20)\r\n2. RTP: communicated and confirmed the process capability of NTU RTP tool (issued revised quotation on 19/10/20)	2020-10-23	2020-10-27	Completed	491
692	Acceptance report and final quotation	2020-12-31	2020-10-27	Not Started	492
676	1. RI - Done.\r\n2. uniformity -done\r\n3. Stress -measured\r\n4. Wet Etch rate check-Done\r\n4. Repeatability check- done -Mar 20\r\n- Started using for 25G products - \r\nNext plan: Back up SiO2 in Trion-ongoing	2020-07-31	2020-10-27	Completed	488
678	1) AR coat for DFB in Oxford- 24hrs HTOL completed. \r\n2) AR coat for DFB in Oxford- 24hrs HTOL completed. \r\n3)  Developed a new low stress AR recipe in Oxford. DA simulation completed Sep 20	2020-09-24	2020-10-27	Completed	490
684	1) Proceed the Qual with new recipe - Nov 2020\r\n2) HTOL for the new low stress recipe - Feb 21	2021-02-28	2020-10-27	Not Started	490
686	1) Learning how to develop and optimize process recipe for various products with Optilayer\r\n2) Familiarize with software	2020-11-30	2020-10-27	Working	486
672	1) Tool upgradation is going on- Jan 2021 (Ion Source, Heater control, OMS, Crystal, software)\r\n2) New tool breather plate exp completed- May 2020\r\n3) n & k values obtained - June 2020\r\nCoating designs for AR & HR- June 2020\r\n4) Deposition of Spectral stracks and measurements- Jul 2020	2020-07-31	2020-10-27	Completed	486
687	2) Training of operators/technician - completed	2020-08-31	2020-10-27	Completed	493
688	1) 250 um, 300 um, 350 um DFB\r\n2) 1000 um ELED MOLEX\r\n3) 1500 SLED & SOA\r\n\r\nProducts listed above qualification completed. \r\n20 bars per loading qualified	2020-07-31	2020-10-27	Completed	493
689	Standard operating procedure manual for operators and technicians pending	2020-12-15	2020-10-27	Not Started	493
690	4 Samples sent to M+ for plating evaluation: \r\n1) Sample 1 - blank wafer with pre-stress measurements\r\n2) Sample 2 - blank wafer with attic mask \r\n3) Sample 3 - 1/2 wafer with attic mask\r\n4) Sample 4 - 1/4 wafer with attic mask\r\n\r\nAll 4 samples were subjected to the same plating conditions	2020-09-30	2020-10-27	Completed	492
693	1) resolved syncing issue with TIBCO spotfire\r\n2) incorporated 11 process charts for monitoring in TIBCO spotfire\r\n3) added in CP, CPK parameters	2020-07-15	2020-10-27	Completed	494
694	1) Automate and reflect in real time chart monitoring\r\n2) Google sheets conversion	2020-12-31	2020-10-27	Not Started	494
695	Fingerprint of processes in Oxford & Trion (RI check, wet etch rate, uniformity range, stress)\r\n1) AR coating recipe (SINAR-15-08-18) - Oxford\r\n2) SiON-2 PCO spacer - Oxford\r\n3) SiON-new low stress recipe - Oxford\r\n4) SiN HM in Trion\r\n5) AR coating in Trion\r\n6) SiON in Trion	2020-09-30	2020-10-27	Completed	490
696	supported ripple yield investigation on ELED (MOLEX)\r\n- ripple to AR coating thickness correlation determination\r\n- trend chart correlation of FF thickness range vs ripple & BF range vs ripple\r\n- bar identification per work order under visual inspection directory\r\n- improvement measures to tighten facet coating thickness to +/- 5 nm\r\n- coordinated and ensured MOLEX Q3 shipment before oxford was sent for upgrade	2020-08-31	2020-10-27	Completed	495
703	Simulation model developed with Harold and Picwave that matches simulation outcome with experimental result.	2021-01-30	2020-10-31	Not Started	500
699	Evaluated the NLW laser modules based on single and dual gratings.	2020-12-31	2020-10-31	Working	499
702	Report and analysis of the performance of NLW laser with a commercial EDFA to present to ZX Lidars and BKTEL.	2020-12-31	2020-10-31	Completed	499
700	Solved RMA and NCMR issues related to ILM, mainly, the SMSR issues found in BF10, and PER issues.	2020-12-31	2020-10-31	Completed	499
701	Developed an initial model of an FBG first, followed by single grating based ECL.	2020-12-31	2020-10-31	Completed	499
681	First jig modification completed, overcoating improved to within 10 nm. \r\nSecond jig will undergo modification.	2020-12-26	2020-10-27	Working	258
685	Tool operation without supervision\r\nFamiliarity of the tool	2020-09-30	2020-10-27	Completed	486
704	Report and analysis template of SOA test and characterization results that is generated automatically from the raw measurement data.	2021-01-30	2020-10-31	Working	500
705	KPI 1	2020-12-31	2020-11-05	Not Started	504
706	hunet test	2020-12-31	2020-11-09	Not Started	506
707	test1	2020-12-31	2020-11-09	Not Started	507
708	test2	2020-12-31	2020-11-09	Not Started	508
709	KPI 1	2020-12-31	2020-11-12	Not Started	510
710	KPI 1	2021-01-31	2020-11-18	Not Started	512
711	KPI 2	2021-01-31	2020-11-18	Not Started	513
712	KPI 1	2021-12-31	2020-11-20	Not Started	514
713	KPI 3	2021-12-31	2020-11-20	Not Started	515
714	KPI 2	2021-12-31	2020-11-20	Not Started	514
715	good	2020-12-11	2020-11-27	Not Started	518
716	goog	2020-12-11	2020-11-27	Not Started	518
717	xx	2020-12-11	2020-11-27	Not Started	519
718	dd	2020-12-11	2020-11-27	Not Started	520
245	Improving existing coupling efficiency from 40% by applying the MFA technology between light source and agnostic platform such as the following:\r\n1) Si platform\r\n2) fiber\r\n3) optical interposer\r\n3) any other compatible medium\r\n\r\nOver time, the objective of KFA 5.3 has been changed and my task was aligned accordingly.\r\nMy present goal is:\r\n1) To design a waveguide module that is compatible with the light source as well as the preceding module.\r\n2) To ensure that the waveguide module is compatible with the platform.	2021-01-01	2020-09-30	Working	229
241	A)\r\nDevelopment of high power-high temperature CW DFB performance, namely:\r\n1) 75mW @ 75C for 1270, 1290, 1310, 1330 nm - InPhi\r\n\r\nB)\r\nCustomised solutions and assess technical specifications for mid power-high temperature CW DFB performance, namely:\r\n1) 40mW @ 70C - Raintree\r\n2) 30mW @ 85C - Cisco (obsolete)\r\n3) 25mW @ 95C - Sicoya	2021-01-01	2020-09-30	Working	228
574	A. Create a 100% goal-oriented and task-driven focused organization by introducing disruptive 1310 CW 70mW @70C product compared to the competitors by Q4'20\r\n\r\nB. Being responsible as auditee, establish competence in the quality and assurance system of DLS to collectively achieve certification of ISO9001:2015 by Q4'20.	2021-01-01	2020-10-18	Working	448
719	Work Order Automation thru Odoo\r\n1. To have the WO released in Odoo from the conventional method of releasing WO thru excel.  - to be measured in 2H of 2020	2020-12-30	2020-12-10	Not Started	164
205	Mask and acid bench sourcing\r\nStatus: Local vendor TLG has been identified as the supplier. Which has very obvious cost advantage, the price is less than half of the oversea suppliers.\r\nNow PO raised and pending release money then TLG can start to make the tool for us	2020-12-30	2020-09-29	Working	198
168	i) Litho process margin improvement, reduce defocus, resist footing\r\nBackground information: Frequent defocus, resist footing issue happen due to wafer topology and warpage issue, which is even more serious for Poet PLT layer and partial wafers. Exposure to use low vacuum contact is a good method to solve the issue. But due to scare of wafer broken, line is hesitate to use the method.\r\nStep 1: Identify the root cause of the issue[Done]\r\nStep 2: Solution procedure optimization[Done, to check wafer condition before use the mode, make sure no minor crack at wafer edge]\r\nStep 3: Solution implementation[Done, footing issue reduced. Even wafer edge see minor chipping, but no major impact to wafer]\r\nii) SPR220 bonding process stabilization\r\nResist bubble issue is the bottleneck to use SPR220 as the bonding material. I come out the idea that to do a short time exposure may solve the issue during the discussion with my pioneer. Subsequently we did the test and showed it's work.\r\nStep 1: Test with the exposure idea(flood exposure)[Done]\r\nStep 2: Test with 10 wafers process through[Done, it's work]\r\nStep 3: Margin check on exposure time and delay time to PEB[Done]\r\nStep 4: Implementation with engineering report[Done, ER #: 20-WP-ER-0006]	2020-06-30	2020-09-28	Completed	141
674	2) Meeting on 28/10/20 with Siew Ping to demonstrate current loading with Daitron tool\r\n\r\n3) Second meeting on 25/11/20 with Siew Ping and discussed the process flow and improvement plans for mass volume production. Once the process template is finalized, we can pinpoint which process step to automate.\r\n\r\n4) Automatic bar stacker with JFP Microtechnic: conference call held JFP PP One bar stacker on 2 Dec 2020. Follow up plan is to ship dummy and actual bars to them for loading evaluation.	2021-01-31	2020-10-27	Working	485
720	KPI 1	2020-12-11	2020-12-21	Not Started	524
\.


--
-- Data for Name: GnC_midyrcommentbox; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."GnC_midyrcommentbox" (id, comment, created_on, created_by_id, goal_id) FROM stdin;
\.


--
-- Data for Name: Profile_departments; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Profile_departments" (id, name, manager_id) FROM stdin;
1	IT	\N
14	OPERATIONS-APT	\N
15	PRODUCT ENGINEERING	\N
6	FINANCE AND CORPORATE	\N
18	OPERATIONS-EQUIPMENT	\N
11	SECTION MANAGER	\N
24	NEW PRODUCT INNOVATION	\N
3	NEW PRODUCT DEVELOPMENT	\N
7	PROCESS ENGINEERING	\N
12	SALES DEPARTMENT	\N
25	ILM	\N
17	OPERATIONS (WP-FAB B)	\N
21	OPERATIONS (ATP)	\N
9	HUMAN RESOURCE	\N
26	DPhi INTEGRATION	\N
19	SENIOR FINANCIAL ANALYST	\N
20	EXTERNAL MANUFACTURING	\N
10	QUALITY ASSURANCE	\N
5	EXTERNAL MANUFACTURING & PROCUREMENT	\N
22	OPERATIONS - FACILITY	\N
13	HIPP INTEGRATION	\N
2	CORPORATE OFFICE	\N
4	OPERATIONS	\N
16	IT DEPT	\N
8	OPERATIONS- PPC	\N
23	FACILITY & MAINTENANCE	\N
\.


--
-- Data for Name: Profile_discard_skills; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Profile_discard_skills" (id, name, "course_Attended") FROM stdin;
\.


--
-- Data for Name: Profile_guide; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Profile_guide" (id, title, thumbnail, video, description) FROM stdin;
2	How To Login and Use the Dashboard		guide/video/Logintodashboard.webm	Tutorial on How To Login and Use the Dashboard.
3	How to Add Goals In Goal Setting Stage		guide/video/Howtoaddgoals.webm	Tutorial on How to Add Goals In Goal Setting Stage
4	How To Approve Or Reject Goals		guide/video/Howtoapproveorrejectgoals.webm	Tutorial on How To Approve Or Reject Goals
5	How To Shift The Stage Of Appraisal		guide/video/Howtoshiftappraisalstage.webm	Tutorial on How To Shift The Stage Of Appraisal
6	How To Create A Appraisal		guide/video/Howtocreateaappraisal.webm	Tutorial on How To Create A Appraisal
7	How To Add Midyear review		guide/video/Howtoaddmidyearreview.webm	Tutorial on How To Add Midyear review
8	How To Approve Or Reject Midyear Review		guide/video/Howtoapproveorrejectmidyearreview.webm	Tutorial on How To Approve Or Reject Midyear Review
9	How To Add End-Year Review		guide/video/Howtoaddendyearreview.webm	Tutorial on How To Add End-Year Review
10	How To Approve Or Reject End-Year Review		guide/video/Howtoapproveorrejectendyeareview.webm	Tutorial on How To Approve Or Reject End-Year Review
11	Checking Notifications And Alerts		guide/video/Howtochecknotificationsandalerts.webm	Tutorial on How to Check Notifications And Alerts
\.


--
-- Data for Name: Profile_notification; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Profile_notification" (id, title, description, color, seen, created_at, user_id) FROM stdin;
2	Managertest approve goals of hunet test 8	Hi usertest Manager Managertest approve goals of hunet test 8 . 	success	f	2021-01-07 21:44:20.924384+00	17
3	Managertest approve goal  of  hunet test 8	Hi usertest Manager Managertest approve goal  goal 1  ofhunet test 8 . 	success	f	2021-01-07 22:02:02.926456+00	17
4	Managertest approve goal  of  hunet test 8	Hi usertest Manager Managertest approve goal  goal  ofhunet test 8 . 	success	f	2021-01-07 22:02:14.003178+00	17
5	Managertest approve goal  of  hunet test 8	Hi usertest Manager Managertest approve goal  goal  ofhunet test 8 . 	success	f	2021-01-07 22:02:26.276142+00	17
6	Managertest approve goal  of  hunet test 8	Hi usertest Manager Managertest approve goal  goal  ofhunet test 8 . 	success	f	2021-01-07 22:02:33.833352+00	17
7	usertest submit mid year review of hunet test 8	Hi Managertest Employee usertest submit mid year review of hunet test 8 . Please approve or reject mid year review . 	info	f	2021-01-07 22:15:29.562939+00	18
10	Managertest approve goal  of  hunet test 10	Hi usertest Manager Managertest approve goal  goal 1  ofhunet test 10 . 	success	f	2021-01-08 00:28:18.921939+00	17
11	Managertest approve goals of hunet test 10	Hi usertest Manager Managertest approve goals of hunet test 10 . 	success	f	2021-01-08 00:28:29.836497+00	17
13	Managertest approve midyear review of hunet test 10	Hi usertest Manager Managertest approve midyear review ofhunet test 10 . 	success	f	2021-01-08 00:31:51.610569+00	17
15	Managertest approve endyear review of hunet test 10	Hi usertest Manager Managertest approve endyear review ofhunet test 10 . 	success	f	2021-01-08 00:50:51.146917+00	17
17	usertest submit goals of tejpratap	Hi Managertest Employee usertest submit goals of tejpratap . Please approve all goals and then approve appraisal 	info	f	2021-01-08 02:02:06.577661+00	18
18	Managertest approve goal  of  tejpratap	Hi usertest Manager Managertest approve goal  goal 1  oftejpratap . 	success	f	2021-01-08 02:04:05.256255+00	17
19	Managertest reject goal  of  tejpratap	Hi usertest Manager Managertest reject goal  goal 1  oftejpratap . 	success	f	2021-01-08 02:04:15.281379+00	17
20	Managertest approve goal  of  tejpratap	Hi usertest Manager Managertest approve goal  goal 1  oftejpratap . 	success	f	2021-01-08 02:04:23.492359+00	17
46	test appraisal created	Hi usertest  Managertest created test Please go to dashboard and then add goals , kpis , core values and skills and then submitted to manager 	info	f	2021-01-13 16:18:06.251008+00	17
47	test appraisal created	Hi Managertest  Managertest created test Please go to dashboard and then add goals , kpis , core values and skills and then submitted to manager 	info	f	2021-01-13 16:18:06.255605+00	18
24	Managertest approve midyear review of tejpratap	Hi usertest Manager Managertest approve midyear review oftejpratap .	success	t	2021-01-08 02:13:03.025305+00	17
36	hunet test 0 appraisal created	Hi usertest  Managertest created overall_appraisal.name Please go to dashboard and then add goals , kpis , core values and skills and then submitted to manager 	info	f	2021-01-09 22:10:00.44631+00	18
37	hunet test 0 appraisal created	Hi Managertest  Managertest created overall_appraisal.name Please go to dashboard and then add goals , kpis , core values and skills and then submitted to manager 	info	f	2021-01-09 22:10:00.786645+00	534558467
38	usertest submit goals of hunet test 0	Hi Managertest Employee usertest submit goals of hunet test 0 . Please approve all goals and then approve appraisal 	info	f	2021-01-09 22:21:36.400786+00	18
39	usertest submit goals of hunet test	Hi Managertest Employee usertest submit goals of hunet test . Please approve all goals and then approve appraisal 	info	f	2021-01-09 22:22:54.592398+00	18
40	Managertest approve goal  of  hunet test 0	Hi usertest Manager Managertest approve goal  goal 1  ofhunet test 0 . 	success	f	2021-01-09 22:23:38.595774+00	17
41	Managertest approve goals of hunet test 0	Hi usertest Manager Managertest approve goals of hunet test 0 . 	success	f	2021-01-09 22:24:11.158725+00	17
48	test2 appraisal created	Hi usertest  Managertest created test2 Please go to dashboard and then add goals , kpis , core values and skills and then submitted to manager 	info	f	2021-01-13 16:51:32.30806+00	17
21	Managertest approve goal  of  tejpratap	Hi usertest Manager Managertest approve goal  goal 3  oftejpratap .	success	t	2021-01-08 02:04:30.870924+00	17
42	invitation for peerAppraisal	Hi usertest Managertest invited you  for peer appraisal review  . 	info	f	2021-01-09 22:40:33.401806+00	17
43	invitation for peerAppraisal	Hi Managertest Managertest invited you  for peer appraisal review  . 	info	f	2021-01-09 22:40:33.719586+00	18
44	invitation for peerAppraisal	Hi usertest Managertest invited you  for peer appraisal review  . 	info	f	2021-01-09 22:41:49.663621+00	17
45	invitation for peerAppraisal	Hi Managertest Managertest invited you  for peer appraisal review  . 	info	f	2021-01-09 22:41:49.98318+00	18
50	newapp appraisal created	Hi usertest  Managertest created newapp Please go to dashboard and then add goals , kpis , core values and skills and then submitted to manager 	info	f	2021-01-13 19:45:10.352563+00	17
53	Managertest approve goal  of  newapp	Hi usertest Manager Managertest approve goal  gg  ofnewapp . 	success	f	2021-01-13 19:50:13.036022+00	17
54	Managertest approve goals of newapp	Hi usertest Manager Managertest approve goals of newapp . 	success	f	2021-01-13 19:50:15.930311+00	17
55	Managertest submit goals of newapp	Hi HELEN VINCENT Employee Managertest submit goals of newapp . Please approve all goals and then approve appraisal 	info	f	2021-01-13 20:16:41.221682+00	534558467
57	Managertest approve midyear review of newapp	Hi usertest Manager Managertest approve midyear review ofnewapp . 	success	f	2021-01-13 20:22:16.174942+00	17
58	new appd appraisal created	Hi usertest  Managertest created new appd Please go to dashboard and then add goals , kpis , core values and skills and then submitted to manager 	info	f	2021-01-15 07:36:47.358229+00	17
60	test appraisal created	Hi HELEN VINCENT  Managertest created test Please go to dashboard and then add goals , kpis , core values and skills and then submitted to manager 	info	f	2021-01-15 11:48:39.042187+00	534558467
61	test appraisal created	Hi usertest  Managertest created test Please go to dashboard and then add goals , kpis , core values and skills and then submitted to manager 	info	f	2021-01-15 11:48:39.05058+00	17
63	2020 demo appraisal appraisal created	Hi usertest  Managertest created 2020 demo appraisal Please go to dashboard and then add goals , kpis , core values and skills and then submitted to manager 	info	f	2021-01-18 08:30:37.902004+00	17
66	Managertest reject goal  of  2020 demo appraisal	Hi usertest Manager Managertest reject goal  goal 1  of2020 demo appraisal . 	success	f	2021-01-18 08:42:33.338861+00	17
67	Managertest approve goal  of  2020 demo appraisal	Hi usertest Manager Managertest approve goal  goal 1  of2020 demo appraisal . 	success	f	2021-01-18 08:43:30.498968+00	17
68	Managertest approve goal  of  2020 demo appraisal	Hi usertest Manager Managertest approve goal  goal 2  of2020 demo appraisal . 	success	f	2021-01-18 08:43:51.664929+00	17
69	Managertest approve goals of 2020 demo appraisal	Hi usertest Manager Managertest approve goals of 2020 demo appraisal . 	success	f	2021-01-18 08:44:44.537572+00	17
71	Managertest approve midyear review of 2020 demo appraisal	Hi usertest Manager Managertest approve midyear review of2020 demo appraisal . 	success	f	2021-01-18 08:53:42.070687+00	17
73	Managertest approve endyear review of 2020 demo appraisal	Hi usertest Manager Managertest approve endyear review of2020 demo appraisal . 	success	f	2021-01-18 08:57:57.449462+00	17
74	hunet 2021 test appraisal created	Hi usertest  Managertest created hunet 2021 test Please go to dashboard and then add goals , kpis , core values and skills and then submitted to manager 	info	f	2021-01-18 14:50:08.967148+00	17
77	Managertest approve goal  of  hunet 2021 test	Hi usertest Manager Managertest approve goal  goal 1  ofhunet 2021 test . 	success	f	2021-01-18 15:02:36.689351+00	17
78	Managertest approve goal  of  hunet 2021 test	Hi usertest Manager Managertest approve goal  goal 2  ofhunet 2021 test . 	success	f	2021-01-18 15:02:50.655184+00	17
79	Managertest approve goals of hunet 2021 test	Hi usertest Manager Managertest approve goals of hunet 2021 test . 	success	f	2021-01-18 15:03:00.298698+00	17
81	Managertest reject mid year review  of  hunet 2021 test	Hi usertest Manager Managertest reject mid year review  ofhunet 2021 test . Manager mid year rejection comment is everything is wrong 	error	f	2021-01-18 15:10:48.330148+00	17
82	Managertest approve midyear review of hunet 2021 test	Hi usertest Manager Managertest approve midyear review ofhunet 2021 test . 	success	f	2021-01-18 15:16:17.825423+00	17
84	Managertest approve endyear review of hunet 2021 test	Hi usertest Manager Managertest approve endyear review ofhunet 2021 test . 	success	f	2021-01-18 15:21:51.715956+00	17
85	Demo With Shan HSu appraisal created	Hi usertest  Managertest created Demo With Shan HSu Please go to dashboard and then add goals , kpis , core values and skills and then submitted to manager 	info	f	2021-01-19 07:22:55.072253+00	17
88	Managertest approve goal  of  Demo With Shan HSu	Hi usertest Manager Managertest approve goal  goal 1  ofDemo With Shan HSu . 	success	f	2021-01-19 07:49:47.973181+00	17
89	Managertest approve goal  of  Demo With Shan HSu	Hi usertest Manager Managertest approve goal  Goal 2  ofDemo With Shan HSu . 	success	f	2021-01-19 07:49:52.44045+00	17
90	Managertest approve goal  of  Demo With Shan HSu	Hi usertest Manager Managertest approve goal  Goal 2  ofDemo With Shan HSu . 	success	f	2021-01-19 07:49:57.349914+00	17
91	Managertest approve goals of Demo With Shan HSu	Hi usertest Manager Managertest approve goals of Demo With Shan HSu . 	success	f	2021-01-19 07:50:03.540092+00	17
93	Managertest approve midyear review of Demo With Shan HSu	Hi usertest Manager Managertest approve midyear review ofDemo With Shan HSu . 	success	f	2021-01-19 07:59:13.961964+00	17
95	Managertest approve endyear review of Demo With Shan HSu	Hi usertest Manager Managertest approve endyear review ofDemo With Shan HSu . 	success	f	2021-01-19 09:15:38.364595+00	17
96	appraisal name 1 appraisal created	Hi usertest  Managertest created appraisal name 1 Please go to dashboard and then add goals , kpis , core values and skills and then submitted to manager 	info	f	2021-01-19 09:28:04.484817+00	17
98	new appraisal adi appraisal created	Hi usertest  Managertest created new appraisal adi Please go to dashboard and then add goals , kpis , core values and skills and then submitted to manager 	info	f	2021-01-21 16:45:30.425009+00	17
99	new appraisal adi appraisal created	Hi Managertest  Managertest created new appraisal adi Please go to dashboard and then add goals , kpis , core values and skills and then submitted to manager 	info	f	2021-01-21 16:45:30.434814+00	18
100	2021 Performance appraisal appraisal created	Hi usertest  Managertest created 2021 Performance appraisal Please go to dashboard and then add goals , kpis , core values and skills and then submitted to manager 	info	f	2021-01-24 20:45:44.767149+00	17
101	2021 Performance appraisal appraisal created	Hi Managertest  Managertest created 2021 Performance appraisal Please go to dashboard and then add goals , kpis , core values and skills and then submitted to manager 	info	f	2021-01-24 20:45:44.772697+00	18
102	usertest submit goals of 2021 Performance appraisal	Hi Managertest Employee usertest submit goals of 2021 Performance appraisal . Please approve all goals and then approve appraisal 	info	f	2021-01-24 21:08:06.88633+00	18
103	Managertest approve goal  of  2021 Performance appraisal	Hi usertest Manager Managertest approve goal  Goal 1  of2021 Performance appraisal . 	success	f	2021-01-24 21:23:35.01721+00	17
104	Managertest approve goal  of  2021 Performance appraisal	Hi usertest Manager Managertest approve goal  Goal 2  of2021 Performance appraisal . 	success	f	2021-01-24 21:23:46.395596+00	17
105	Managertest approve goals of 2021 Performance appraisal	Hi usertest Manager Managertest approve goals of 2021 Performance appraisal . 	success	f	2021-01-24 21:24:14.620057+00	17
106	usertest submit mid year review of 2021 Performance appraisal	Hi Managertest Employee usertest submit mid year review of 2021 Performance appraisal . Please approve or reject mid year review . 	info	f	2021-01-24 21:32:54.043606+00	18
107	Managertest approve midyear review of 2021 Performance appraisal	Hi usertest Manager Managertest approve midyear review of2021 Performance appraisal . 	success	f	2021-01-24 22:05:21.387675+00	17
108	usertest submit end year review of 2021 Performance appraisal	Hi Managertest Employee usertest submit end year review of 2021 Performance appraisal . Please approve or reject end year review . 	info	f	2021-01-24 22:12:47.506191+00	18
109	Managertest approve endyear review of 2021 Performance appraisal	Hi usertest Manager Managertest approve endyear review of2021 Performance appraisal . 	success	f	2021-01-24 22:19:58.246789+00	17
\.


--
-- Data for Name: Profile_profile; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Profile_profile" (id, "profile_Picture", name, "employee_ID", nric, "typeOfEmployee", email, gender, address_1, address_2, "date_Of_Passport_Expiry", "citizenship_Status", "date_Of_Hire", "job_Title", "employment_Type", skill1, skill2, skill3, "division_Centre", phone, department_id, "first_Reporting_Manager_id", user_id, "second_Reporting_Manager_id") FROM stdin;
2047523461		JULIUS OCADO AMPO	554	\N	INDIRECT	j.ampo@denselight.com				\N	-	2020-06-15	SENIOR ENGINEER	Full-time	\N	\N	\N	\N	\N	22	135493917	301	135493917
1087181548		BALAKRISHNAN PRABHU	513	UNK	INDIRECT	balakrishnan.prabhu@denselight.com	Male	UNK		\N	-	2019-04-22	SENIOR ENGINEER	Full-time	\N	\N	\N	\N	\N	18	135493917	276	5
759336758		CHAN TAT KHIT	534	\N	INDIRECT	tatkhit.chan@denselight.com				\N	-	2019-12-12	DIRECTOR	Full-time	\N	\N	\N	\N	\N	5	1813823810	252	1813823810
1557152765		CHAN YUEN CHUEN	32	\N	INDIRECT	eycchan@denselight.com				\N	-	2001-04-15	FELLOW	Full-time	\N	\N	\N	\N	\N	3	430837474	253	430837474
988735390		CHIN SE WEI	476	\N	INDIRECT	david.chin@denselight.com				\N	-	2018-08-06	FINANCIAL CONTROLLER	Full-time	\N	\N	\N	\N	\N	6	1813823810	254	1813823810
253052978		DILEM KAREEN DAMOGO	231	\N	INDIRECT	kareen@denselight.com				\N	-	2008-08-25	MANAGER	Full-time	\N	\N	\N	\N	\N	8	759336758	256	759336758
931345185		HOGAN ROYSTON HUGH	498	\N	INDIRECT	hogan.hugh@denselight.com				\N	-	2018-10-29	SECTION MANAGER	Full-time	\N	\N	\N	\N	\N	3	430837474	258	430837474
1224448967		JULIUS BAUTISTA EBONITE	367	\N	INDIRECT	julius@denselight.com				\N	-	2014-05-02	MANAGER	Full-time	\N	\N	\N	\N	\N	10	324340084	259	324340084
25957709		KEVIN YANG KAI	C001	\N	INDIRECT	kevin.yang@denselight.com				\N	-	2020-01-01	VICE PRESIDENT	Full-time	\N	\N	\N	\N	\N	12	1813823810	261	1813823810
689543953		LEE CHEW BENG	547	\N	INDIRECT	robin.lee@denselight.com				\N	-	2020-05-11	SENIOR SUPERVISOR 1	Full-time	\N	\N	\N	\N	\N	14	759336758	263	759336758
52374544		LEE SIP HENG (JASON)	506	\N	INDIRECT	jason.lee@denselight.com				\N	-	2019-02-25	SENIOR SUPERVISOR II	Full-time	\N	\N	\N	\N	\N	4	135493917	264	135493917
1982477965		NAVIN KUMAR A/L VALAUTHAM	505	\N	INDIRECT	navin.kumar@denselight.com				\N	-	2019-02-19	DEPUTY DIRECTOR	Full-time	\N	\N	\N	\N	\N	14	759336758	266	759336758
2107825133		SUNG PING-CHUN	556	\N	INDIRECT	pc.sung@denselight.com				\N	-	2020-07-13	MEMBER OF TECHNICAL STAFF (R&D)	Full-time	\N	\N	\N	\N	\N	3	430837474	270	430837474
2051658454		ANG HOCK SENG	D124	\N	DIRECT	hk921004@gmail.com				\N	-	2019-07-16	TECHNICIAN	Full-time	\N	\N	\N	\N	\N	17	52374544	273	135493917
1352141850		ARBIZ CARLAN KYLE ORTEGA	523	\N	INDIRECT	carlan.arbiz@denselight.com				\N	-	2019-07-01	SENIOR ENGINEER	Full-time	\N	\N	\N	\N	\N	15	861437177	274	324340084
1207021661		ARGABIOSO DANILO SAPLALA	481	\N	INDIRECT	danilo.argabioso@denselight.com				\N	-	2018-08-20	MANAGER	Full-time	\N	\N	\N	\N	\N	3	931345185	275	430837474
1973223122		CHEN KOK KIONG	527	\N	INDIRECT	chenkk@denselight.com				\N	-	2019-10-01	ENGINEER II	Full-time	\N	\N	\N	\N	\N	3	2107825133	280	430837474
1904933651		CHEN YAN	431	\N	INDIRECT	chen.yan@denselight.com				\N	-	2017-07-17	SENIOR ENGINEER	Full-time	\N	\N	\N	\N	\N	20	759336758	281	759336758
1634575202		CHEW YONG SHENG	D102	\N	DIRECT	libra330@hotmail.com				\N	-	2018-10-18	TECHNICIAN	Full-time	\N	\N	\N	\N	\N	17	52374544	282	135493917
610693885		CHIA HSIAO YU	551	\N	INDIRECT	xiaoyu.jia@denselight.com				\N	-	2020-06-02	PRINCIPAL ENGINEER	Full-time	\N	\N	\N	\N	\N	15	861437177	283	324340084
1913240580		CHUA YU XIANG	375	\N	INDIRECT	yxchua@denselight.com				\N	-	2015-03-11	ENGINEER II	Full-time	\N	\N	\N	\N	\N	14	973701598	284	759336758
1776097184		CHUAN YE	549	\N	INDIRECT	ye.chuan@denselight.com				\N	-	2020-05-04	SENIOR PRINCIPAL ENGINEER	Full-time	\N	\N	\N	\N	\N	7	324340084	285	324340084
1536568573		DE LEON ALEXANDER MAMARADLO	537	\N	INDIRECT	alexander.deleon@denselight.com				\N	-	2020-02-24	SENIOR ENGINEER	Full-time	\N	\N	\N	\N	\N	14	973701598	288	759336758
864267076		EE XUE LI	D137	\N	DIRECT	eexueli93@gmail.com				\N	-	2020-07-08	MANUFACTURING OPERATOR	Full-time	\N	\N	\N	\N	\N	17	52374544	289	135493917
711389827		FAIROZ AHAMED	453	\N	INDIRECT	fairoz.ahamed@denselight.com				\N	-	2018-03-01	PRINCIPAL ENGINEER	Full-time	\N	\N	\N	\N	\N	3	1616831965	290	430837474
249343659		FAN LOUIE CANARES	530	\N	INDIRECT	louie.fan@denselight.com				\N	-	2019-11-18	ASSISTANT ENGINEER	Full-time	\N	\N	\N	\N	\N	7	324340084	291	324340084
1854222316		FENG YINGXUE	D130	\N	DIRECT	571055970@qq.com				\N	-	2020-03-24	MANUFACTURING OPERATOR	Full-time	\N	\N	\N	\N	\N	21	689543953	292	759336758
1523161462		FERRARA GIOVANNI	550	\N	INDIRECT	giovanni.ferrara@denselight.com				\N	-	2020-05-18	SENIOR ENGINEER	Full-time	\N	\N	\N	\N	\N	3	2107825133	293	430837474
50985924		HOE NEE SHIUAN	350	\N	INDIRECT	nshoe@denselight.com				\N	-	2013-08-01	PRINCIPAL ENGINEER	Full-time	\N	\N	\N	\N	\N	5	759336758	295	759336758
1598293097		ABDUL HAMEED BIN RAMADHAN	557	\N	INDIRECT	hameed.ramadhan@denselight.com				\N	-Singaporean	2020-07-13	ASSISTANT ENGINEER	Full-time	\N	\N	\N	\N	+6590910945	3	645448974	272	430837474
534558467		HELEN VINCENT	433	\N	INDIRECT	helen@denselight.com				\N	-	2017-08-21	DIRECTOR	Full-time	\N	\N	\N	\N	+6564154498	9	1813823810	257	534558467
135493917		CHAN BOR SHEN	472	\N	INDIRECT	bs.chan@denselight.com				\N	-	2018-07-30	SENIOR DIRECTOR	Full-time	\N	\N	\N	\N	+6593377619	4	1813823810	251	1813823810
985791817		SOMA SANKARAN	408	\N	INDIRECT	soma.sankaran@denselight.com				\N	SINGAPOREAN	2017-01-09	VICE PRESIDENT	Full-time	\N	\N	\N	\N	+6596304236	12	1813823810	269	1813823810
9327697		CHANG CHEE KIONG JAMES	493	-	INDIRECT	james.chang@denselight.com	Male	-		\N	-	2018-10-16	PRINCIPAL ENGINEER	Full-time	\N	\N	\N	\N	\N	26	1135328161	277	1135328161
973701598		YAO RU SHENG (RAY)	391	S8037830J	INDIRECT	rsyao@denselight.com	Male	Blk 211B Compassvale Lane, #02-202 Singapore 542211		\N	-	2016-07-15	SENIOR PRINCIPAL ENGINEER	Full-time	\N	\N	\N	\N	+6597680417	14	759336758	271	759336758
1616831965		ARCILLA RAYMUNDO BONUSAN	526	G3879170U	INDIRECT	raymundo.arcilla@denselight.com	Male	Blk 114 Yishun Ring Road, #07-545 Singapore 760114		\N	-	2019-07-29	MANAGER	Full-time	\N	\N	\N	\N	+6593695037	3	1813039923	249	430837474
364472470		CHEAH YONG SEAN	555	\N	INDIRECT	sean.cheah@denselight.com				\N	-	2020-06-29	MANAGER	Full-time	\N	\N	\N	\N	+6591863216	3	931345185	278	430837474
861437177		MA LI	536	S7676776I	INDIRECT	jacquelyn.ma@denselight.com	Female	Block 67 Choa Chu Kang Loop, #07-04 Singapore 689671		\N	-	2020-02-17	DIRECTOR	Full-time	\N	\N	\N	\N	+6596557081	15	324340084	265	324340084
1428738048		RYAN STEPHEN	497	\N	INDIRECT	ryan.stephen@denselight.com				\N	-	2018-10-31	SENIOR ENGINEER	Full-time	\N	\N	\N	\N	+6596150427	16	324340084	268	324340084
1135328161		LAM YEE LOY	7	-	INDIRECT	yeeloy@denselight.com	Male	-		\N	-	2001-01-01	CHIEF TECHNOLOGY OFFICER	Full-time	\N	\N	\N	\N	\N	26	1813823810	262	1813823810
619517776		WANG LI	D127	\N	DIRECT	1275334393@qq.com				\N	-	2019-12-04	MANUFACTURING OPERATOR	Full-time	\N	\N	\N	\N	\N	17	52374544	338	135493917
2035253683		YANG FENG	D083	\N	DIRECT	63939234@qq.com				\N	-	2016-11-01	MANUFACTURING OPERATOR	Full-time	\N	\N	\N	\N	\N	17	52374544	344	135493917
410233054		WANG JINHUA	D106	\N	DIRECT	497814581@qq.com				\N	-	2018-11-26	MANUFACTURING OPERATOR	Full-time	\N	\N	\N	\N	\N	17	52374544	337	135493917
1017729787		KANG KOK SENG (MICHAEL)	508	\N	INDIRECT	michael.kang@denselight.com				\N	-	2019-03-01	ENGINEER I	Full-time	\N	\N	\N	\N	\N	22	135493917	302	135493917
1539913308		TEH WEI JOE	D136	\N	DIRECT	joeyteh99@gmail.com				\N	-	2020-06-22	MANUFACTURING OPERATOR	Full-time	\N	\N	\N	\N	\N	17	52374544	335	135493917
726826699		SRI ISWIRA SRI KUMAR	D135	\N	DIRECT	srieshwergunasegaram@gmail.com				\N	-	2020-06-08	TECHNICIAN	Full-time	\N	\N	\N	\N	\N	17	52374544	327	135493917
313243524		XU QIULAN	D122	\N	DIRECT	593930910@qq.com				\N	-	2019-07-19	MANUFACTURING OPERATOR	Full-time	\N	\N	\N	\N	\N	17	52374544	343	135493917
1921197435		NGUYEN VIET THE	402	\N	INDIRECT	vtnguyen@denselight.com				\N	-	2016-09-01	ENGINEER II	Full-time	\N	\N	\N	\N	\N	4	135493917	314	135493917
305986913		RAGUVARAN SUBRAMANIAM	D114	\N	DIRECT	ragucr9403@gmail.com				\N	-	2019-04-02	TECHNICIAN	Full-time	\N	\N	\N	\N	\N	17	52374544	318	135493917
22592094		VAITHIYALINGAM HARI	516	UNK	INDIRECT	hari.v@denselight.com	Male	UNK		\N	-	2019-05-10	ENGINEER I	Full-time	\N	\N	\N	\N	\N	18	135493917	336	5
1941685512		LIEW KOK WAI	543	UNK	INDIRECT	wesley.liew@denselight.com	Male	UNK		\N	-	2020-03-09	SENIOR ASSISTANT ENGINEER	Full-time	\N	\N	\N	\N	\N	18	135493917	307	5
850138976		SUNDARARAJ SIVARAMALINGAM	541	UNK	INDIRECT	sundararaj.siva@denselight.com	Male	UNK		\N	-	2020-03-02	ENGINEER I	Full-time	\N	\N	\N	\N	\N	18	135493917	328	5
1710250857		TAN POH GEK (SHARON)	532	\N	INDIRECT	sharon.tan@denselight.com				\N	-	2019-11-07	SALES REPRESENTATIVE I	Full-time	\N	\N	\N	\N	\N	12	985791817	331	985791817
397620336		ROBIAH BTE MOHAMED TAHIR	D088	\N	DIRECT	layhoon.lee@denselight.com				\N	-	2017-05-03	CO. CLEANER	Full-time	\N	\N	\N	\N	\N	23	534558467	322	534558467
163946503		LEE LAY HOON	538	\N	INDIRECT	layhoon.lee@denselight.com				\N	-	2020-02-10	HR BUSINESS PARTNER	Full-time	\N	\N	\N	\N	\N	9	534558467	305	534558467
104959828		TAY KAY MENG ANDREW	466	\N	INDIRECT	andrew.tay@denselight.com				\N	-	2018-06-11	EXECUTIVE I	Full-time	\N	\N	\N	\N	\N	6	988735390	334	988735390
1777433913		KOH LONG CHENG	352	-	INDIRECT	lckoh@denselight.com	Male	-		\N	-	2013-08-05	PRINCIPAL ENGINEER	Full-time	\N	\N	\N	\N	\N	26	1135328161	304	1135328161
1369735000		JIA QINGWEN	C002	-	INDIRECT	qingwen.jia@denselight.com	Male	-		\N	-	2020-02-03	MANAGER	Full-time	\N	\N	\N	\N	\N	12	25957709	300	\N
539619816		MAUMITA CHAKRABARTI	463	G3461597M	INDIRECT	maumita.chakrabarti@denselight.com	Female	Bk 53 Flora Drive, #05-12 Singapore 506863		\N	EP	2018-05-14	SECTION MANAGER	Full-time	Technical expertise in Optics	Project Management	Executive business management	OE Design	+6583192358	3	430837474	312	430837474
1602769597		LOH TER HOE	467	\N	INDIRECT	isaac.loh@denselight.com				\N	-	2018-06-18	SENIOR PRINCIPAL ENGINEER	Full-time	\N	\N	\N	\N	\N	3	2107825133	310	430837474
480020115		LIM KHAI TENG	535	\N	INDIRECT	kt.lim@denselight.com				\N	-	2020-01-02	MANAGER	Full-time	\N	\N	\N	\N	\N	3	931345185	309	430837474
31853750		MADAN AAYUSH	544	-	INDIRECT	madan.aayush@denselight.com	Male	-		\N	-	2020-03-17	ENGINEER I	Full-time	\N	\N	\N	\N	\N	3	1557152765	311	430837474
1510925941		PERUMANA ILLOM NARAYANAN KUTTY UMADEVI	504	\N	INDIRECT	umadevi@denselight.com				\N	-	2019-02-12	ENGINEER I	Full-time	\N	\N	\N	\N	\N	3	1373136557	317	430837474
1798521118		WANG YAPING	D129	\N	DIRECT	3604879607@qq.com				\N	-	2020-01-08	MANUFACTURING OPERATOR	Full-time	\N	\N	\N	\N	\N	24	1616831965	340	430837474
729274232		LIM CHIEW KEAT	546	\N	INDIRECT	chiewkeat.lim@denselight.com				\N	-	2020-04-27	SENIOR ENGINEER	Full-time	\N	\N	\N	\N	\N	3	1813039923	308	430837474
1608216415		REBECCA LOURDES	529	-	INDIRECT	rebecca.lourdes@denselight.com	Female	-		\N	Malaysian	2019-11-01	ENGINEER	Full-time	C#	MySQL	Google App Script	IT Programming	+6583024028	16	1428738048	320	324340084
1484926575		RONALDO MAPOTE LACOPIA	514	\N	INDIRECT	ronaldo.mapote@denselight.com				\N	-	2019-05-02	SENIOR ENGINEER	Full-time	\N	\N	\N	\N	\N	15	861437177	323	324340084
589561367		HOU JIANTAO	520	-	INDIRECT	jiantao.hou@denselight.com	Male	-		\N	-	2019-06-03	SENIOR ENGINEER	Full-time	\N	\N	\N	\N	\N	7	1776097184	296	324340084
206959734		HUANG LING	488	-	INDIRECT	ling.huang@denselight.com	Female	-		\N	-	2018-09-19	PRINCIPAL ENGINEER	Full-time	\N	\N	\N	\N	\N	7	1776097184	297	324340084
439847763		SIM HON YUEN AARON	357	\N	INDIRECT	hysim@denselight.com				\N	-	2013-10-10	PRINCIPAL ENGINEER	Full-time	\N	\N	\N	\N	\N	7	324340084	325	324340084
1256890838		TAN SOO HWEE JASLYN	492	\N	INDIRECT	jaslyn.tan@denselight.com				\N	-	2018-10-08	ENGINEER II	Full-time	\N	\N	\N	\N	\N	15	861437177	332	324340084
290990818		HUANG SHENGHE	540	-	INDIRECT	simon.huang@denselight.com	Male	-		\N	-	2020-02-24	PRINCIPAL ENGINEER	Full-time	\N	\N	\N	\N	\N	7	439847763	299	324340084
1723530200		NOBLE BRIGHT	522	-	INDIRECT	noble.bright@denselight.com	Male	-		\N	-	2019-06-13	ENGINEER II	Full-time	\N	\N	\N	\N	\N	7	1776097184	315	324340084
1779366736		NG YEN ENG	542	\N	INDIRECT	cassandra.ng@denselight.com				\N	-	2020-03-02	SENIOR EXECUTIVE	Full-time	\N	\N	\N	\N	\N	2	1813823810	313	1813823810
1575722891		ZHANG QING	D131	\N	DIRECT	2214776521@qq.com				\N	-	2020-04-07	MANUFACTURING ENGINEER	Full-time	\N	\N	\N	\N	\N	17	52374544	348	135493917
781280338		ZHENG SHAOQIN	D108	\N	DIRECT	1004548688@qq.com				\N	-	2018-12-26	MANUFACTURING OPERATOR	Full-time	\N	\N	\N	\N	\N	17	52374544	351	135493917
6		CHEE YOK SUN, ALVIS	S123456D	UNK	INDIRECT	alvis.chee@denselight.com	Male	UNK		\N	Singaporean Citizen	2017-07-03	SENIOR FINANCIAL ANALYST	Full-time	\N	\N	\N	\N	\N	6	988735390	279	\N
1002214209		ZHAO HANXUE (KELLY)	519	\N	INDIRECT	hanxue.zhao@denselight.com				\N	-	2019-06-03	DEPUTY DIRECTOR	Full-time	\N	\N	\N	\N	\N	12	985791817	349	985791817
5		KAY YEW SENG, ANTHONY	389	S1234567D	INDIRECT	anthonyk@denselight.com	Male	-		\N	-	2016-07-01	SECTION MANAGER	Full-time	\N	\N	\N	\N	\N	18	135493917	260	\N
1106999016		ALEX TAN TECK HOWE	UNK	\N	INDIRECT	alex.tan@denselight.com				\N	-	2018-06-08	HR BUSINESS PARTNER	Full-time	\N	\N	\N	\N	\N	9	534558467	353	534558467
16		hunetadmin1	S123456D	S1234567D	DIRECT	hunetadmin1@gmail.com	Female	132 Yishun St 23 #03-412	132 Yishun St 23 #03-412	2020-08-19	Singapore Citizen	2020-08-19	Founder	Full-time	\N	\N	\N	\N	+6583917231	1	430837474	1	\N
20		aditya	S123456D	2345678	DIRECT	goog@gmail.com	Male	ggdjkj	ggdoid	2020-12-12	-nil	2020-10-12	gooa	Full-time	\N	\N	\N	ado	+919667378383	14	1813823810	368	\N
430837474		ANDY PIPER	464	\N	INDIRECT	andy.piper@denselight.com				\N	-	2018-05-21	VICE PRESIDENT	Full-time	\N	\N	\N	\N	\N	3	1813823810	247	1813823810
324340084		CHIVUKULA SUBRAHMANYAM	480	\N	INDIRECT	chivukula.subbu@denselight.com				\N	-	2018-08-17	VICE PRESIDENT	Full-time	\N	\N	\N	\N	\N	7	1813823810	255	1813823810
1906914592		DASA LAKSHMI NARAYANA DHEERAJ	558	\N	INDIRECT	dheeraj.dasa@denselight.com				\N	-	2020-07-22	SNR PROCESS ENGINEER (MOCVD)	Full-time	\N	\N	\N	\N	\N	3	430837474	286	430837474
148988561		YU MIAO	D126	\N	DIRECT	49504145@qq.com				\N	-	2019-07-22	MANUFACTURING OPERATOR	Full-time	\N	\N	\N	\N	\N	21	689543953	347	759336758
1916964989		ZHONG XIANGZHU	D128	\N	DIRECT	490639724@qq.com				\N	-	2019-12-18	MANUFACTURING OPERATOR	Full-time	\N	\N	\N	\N	\N	21	689543953	352	759336758
231731743		SITI QADARIYAH BINTE MD YUSOFF	545	\N	INDIRECT	siti.q@denselight.com				\N	Singaporean	2020-03-23	ASSISTANT ENGINEER	Full-time	\N	\N	\N	ILM	+6597656307	14	973701598	326	759336758
426739617		RASURI BINTI RAZALI	517	\N	INDIRECT	rasuri.razali@denselight.com				\N	-	2019-05-13	PLANNER II	Full-time	\N	\N	\N	\N	\N	8	253052978	319	759336758
1233462141		WANG YUEPING	D082	\N	DIRECT	55320191@qq.com				\N	-	2016-10-26	MANUFACTURING OPERATOR	Full-time	\N	\N	\N	\N	\N	21	689543953	341	759336758
1536649866		YANG TING	D064	\N	DIRECT	181479069@qq.com				\N	-	2013-12-02	MANUFACTURING OPERATOR	Full-time	\N	\N	\N	\N	\N	21	689543953	345	759336758
249507857		LEE YUN SIAN	D133	\N	DIRECT	lys.199810@gmail.com				\N	-	2020-05-11	MANUFACTURING SPECIALIST	Full-time	\N	\N	\N	\N	\N	21	689543953	306	759336758
620999160		ZHENG CAILI	D097	\N	DIRECT	825995920@qq.com				\N	-	2018-06-08	MANUFACTURING OPERATOR	Full-time	\N	\N	\N	\N	\N	25	689543953	350	759336758
29738722		WANG WEI	D111	\N	DIRECT	939024661qq.com@gmail.com				\N	-	2019-03-15	MANUFACTURING OPERATOR	Full-time	\N	\N	\N	\N	\N	21	689543953	339	759336758
708482014		TAN CHIN WUN	D138	\N	DIRECT	chin2005@hotmail.com				\N	-	2020-07-20	MANUFACTURING OPERATOR	Full-time	\N	\N	\N	\N	\N	21	689543953	330	759336758
1436222314		ONG RONG FENG	D093	\N	DIRECT	goodshowluo@gmail.com				\N	-	2018-03-12	TECHNICIAN	Full-time	\N	\N	\N	\N	\N	21	689543953	316	759336758
161961016		REYES JIM ROSE ADDUN	531	\N	INDIRECT	jim.rose@denselight.com				\N	-	2019-11-19	PLANNER	Full-time	\N	\N	\N	\N	\N	8	253052978	321	759336758
418560939		TANG CHAI YEE	D139	\N	DIRECT	chaiyee1103@hotmail.com				\N	-	2020-07-27	MANUFACTURING OPERATOR	Full-time	\N	\N	\N	\N	\N	21	689543953	333	759336758
17	profile/003cap_ons_mas_mob_01_3.jpg	usertest	S123456D	S1234567S	INDIRECT	usertest@email.com	Male	NAN	NA	2021-09-11	-	2017-08-21	Employee	Full-time	\N	\N	\N	\N	+6590000001	9	18	364	\N
1014312820		SYREX ARCILLO TURA	361	\N	INDIRECT	syrex@denselight.com				\N	-	2014-03-03	SENIOR SUPERVISOR II	Full-time	\N	\N	\N	\N	\N	14	1982477965	329	759336758
1887544512		HUANG PING	D125	\N	DIRECT	260857989@qq.com				\N	-	2019-07-22	MANUFACTURING OPERATOR	Full-time	\N	\N	\N	\N	\N	21	689543953	298	759336758
520727285		KHIZAR HUSSAN KALEEL	447	\N	INDIRECT	khizar@denselight.com				\N	-	2018-01-15	ENGINEER I	Full-time	\N	\N	\N	\N	\N	14	973701598	303	759336758
2076006951		WONG ZU XING KEITH	553	S9207863I	INDIRECT	keith.wong@denselight.com	Male	BLK 385 TAMPINES STREET 32, #05-53 SINGAPORE 520385		\N	-	2020-06-15	ENGINEER I	Full-time	\N	\N	\N	\N	+6586601940	3	539619816	342	430837474
1813039923		KADER KAMAL	524	G3877620M	INDIRECT	kamal.kader@denselight.com	Male	Block 4 Pasir Ris Link, #06-13 Ripple Bay, Singapore 518160		\N	-	2019-07-08	SECTION MANAGER	Full-time	\N	\N	\N	\N	+6587936413	3	430837474	248	430837474
1373136557		NGUYEN XUAN SANG	548	\N	INDIRECT	xuansang.nguyen@denselight.com				\N	Vietnam	2020-05-11	SENIOR PROCESS ENGINEER	Full-time	MOCVD epitaxy;	Device processing;	Material science	\N	+6583799281	3	430837474	267	430837474
645448974		ASHISH KUMAR RAI	484	G3803476L	INDIRECT	ashish.kumar@denselight.com	Male	Blk 702 Upper Changi Road East, #03-07 Changi Court, Singapore 486832		\N	-	2018-09-03	PRINCIPAL ENGINEER	Full-time	\N	\N	\N	\N	+6586719627	3	430837474	250	430837474
673813648		SANTOSH KUMAR PANI	475	-	INDIRECT	santosh.kumar@denselight.com	Male	-		\N	-	2018-08-01	PRINCIPAL ENGINEER	Full-time	\N	\N	\N	\N	\N	7	439847763	324	324340084
10		Muhammad Zuhdi	559	G3506537M	INDIRECT	mzuhdi@denselight.com	Male	Blk 842B Tampines Street 82, #16-22 Singapore 522842		\N	-	2020-08-03	Senior Product Engineering	Full-time	\N	\N	\N	\N	+6583627935	15	861437177	357	324340084
1611091001		DE GUZMAN TIRSO CAMBALISA	533	\N	INDIRECT	tirso.deguzman@denselight.com				\N	Singapore Citizen	2019-11-22	SENIOR ENGINEER	Full-time	Quality Assurance	Project Management	Lean Six Sigma	QA	+6591801097	10	324340084	287	324340084
2125149271		YEO AUDIE ADAM	539	-	INDIRECT	audie.yeo@denselight.com	Male	-		\N	-Singaporean	2020-02-24	ENGINEER I	Full-time	\N	\N	\N	\N	+6596454157	7	1776097184	346	324340084
1813823810		RAJAN RAJGOPAL	410	\N	INDIRECT	rajan@denselight.com				\N	-	2017-01-23	PRESIDENT & CHIEF EXECUTIVE OFFICER	Full-time	\N	\N	\N	\N	\N	2	\N	246	1813823810
2125149272		Amit	S123456D	234	INDIRECT	amit@gmail.com	Male		\N	\N	-	2021-01-21	student	Full-time	\N	\N	\N		\N	1	18	373	988735390
18	profile/customer.jpeg	Managertest	S123456D	S1234567S	INDIRECT	managertest@email.com	Female	NA	NA	2020-09-11	-	2017-08-21	Manager	Full-time	\N	\N	\N	\N	+6590000001	9	534558467	365	\N
2125149273		Admin	S123456D	Admin	INDIRECT	admin@email.com	Male	Admin	\N	\N	-	2021-01-24	Admin	Full-time	\N	\N	\N		\N	23	18	374	534558467
\.


--
-- Data for Name: Profile_qualifications; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Profile_qualifications" (id, institution, name, graduation_year, employee_id) FROM stdin;
1	University of South Australia	Masters of Business Administration	1998	985791817
2	Indian Institute of Technology, Kharagpur, INDIA	B.Tech (Hons) in Electronics & Electrical Communication	1984	985791817
3	Singapore - Massachusetts Institute of Technology Alliance program (SMA)	Doctor of Philosophy (PhD)	2013	1373136557
4	Capital College of Management and Technology	Diploma	2019	231731743
5	National University of Singapore	Bachelors of Engineering (Electrical)	2014	2125149271
6	Gottfried Wilhem Leibniz Universitaet Hannover	Master of Science (MSc) in Nanotechnology	2019	2125149271
\.


--
-- Data for Name: Profile_resetpasswordtoken; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Profile_resetpasswordtoken" (id, token, created_at, user_id) FROM stdin;
2	d0361a	2021-01-24 16:25:40.369731+00	365
3	059967	2021-01-24 16:26:10.581433+00	365
4	91ed10	2021-01-24 16:27:51.723169+00	365
5	4e74df	2021-01-24 16:31:11.774934+00	365
6	bb7d71	2021-01-24 16:44:13.629216+00	364
\.


--
-- Data for Name: Profile_user; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Profile_user" (id, password, last_login, first_name, username, last_name, email, is_active, is_admin, is_superuser, is_email_verified, date_joined, dummy_password, role) FROM stdin;
1	pbkdf2_sha256$216000$fB3oJlxx8Pob$VKmju/R9rFWSI88qMX9iyUhKGp5Rzej0z9ibOCnNWhc=	2020-12-17 11:13:03.142265+00		hunetadmin1		Denselight_epmp@consulthunet.com	t	t	t	f	2020-08-10 07:17:17+00	\N	Hr
273	pbkdf2_sha256$180000$9zOW0QhjHiD8$2yKSGrV60EtjfSUnBq6e9pJavNVE2rDCpJPX6Anu7ks=	\N		anghockseng		hk921004@gmail.com	t	f	f	f	2020-08-16 23:21:23.153605+00	\N	Employee
280	pbkdf2_sha256$180000$SHFlVHItvaWf$fBjYXeuZnnLt++AKWui0ODz9s/gw9ObLRBirOe59GgA=	\N		chenkokkiong		chenkk@denselight.com	t	f	f	f	2020-08-16 23:21:24.44429+00	\N	Employee
282	pbkdf2_sha256$180000$ID9A8rSNsJ7F$0zEJcdpPMPJTS6PX020ggH3VqwdqGihG8k/nZNo4F+Y=	\N		chewyongsheng		libra330@hotmail.com	t	f	f	f	2020-08-16 23:21:24.80783+00	\N	Employee
289	pbkdf2_sha256$180000$82zqjOLvhlYG$jvaH4vzI8u4Gcl4PDM3zxxRpfCaSIpA3V444IXYjvHM=	\N		eexueli		eexueli93@gmail.com	t	f	f	f	2020-08-16 23:21:26.11722+00	\N	Employee
283	pbkdf2_sha256$216000$hKfJcVaU5WDk$nhX8Q4N+2vrFeJDgkQxkruXkyX2qk7dgeRo381hD5ls=	2020-12-14 08:17:10.254648+00		chiahsiaoyu		xiaoyu.jia@denselight.com	t	f	f	f	2020-08-16 23:21:24.987912+00	\N	Employee
286	pbkdf2_sha256$216000$16Ki6HS4gU5Y$MT+tHPJ620fotPzVhO/oRSZlj21TDuOoFH2RWwZcgVk=	2020-11-26 17:18:08.627688+00		dasalakshminarayanadheeraj		dheeraj.dasa@denselight.com	t	f	f	f	2020-08-16 23:21:25.55128+00	\N	Employee
277	pbkdf2_sha256$216000$qbARj5zbj5Yb$TKMjRk8C5NHR15VkaDYONdi8oK/XUbjNIWzPM8nXz4Q=	2020-11-26 17:03:26.538081+00		changcheekiongjames		james.chang@denselight.com	t	f	f	f	2020-08-16 23:21:23.882977+00	\N	Employee
278	pbkdf2_sha256$180000$cVowaWKCzjDW$KeVWMqgqoIpYiAxmCX2OUwCCGOoFz3X8mlpTFpRQZWY=	2020-10-20 05:21:13.813872+00		cheahyongsean		sean.cheah@denselight.com	t	f	f	f	2020-08-16 23:21:24.088917+00	\N	Employee
281	pbkdf2_sha256$216000$rWL773yvDjcu$sZf8hWg65PU1hBaQ7t3Gib0nii8yb4jQAhWfP4Umhes=	2020-12-18 01:59:05.85516+00		chenyan		chen.yan@denselight.com	t	f	f	f	2020-08-16 23:21:24.626023+00	\N	Employee
287	pbkdf2_sha256$216000$LGJXTXHVGwjR$ELmQic9QeFoLaQyjdLN24SK+6ZYchwofV5ZbajeIVF0=	2020-12-14 09:55:49.513251+00		deguzmantirsocambalisa		tirso.deguzman@denselight.com	t	f	f	f	2020-08-16 23:21:25.731812+00	\N	Employee
288	pbkdf2_sha256$216000$TfL8QeFY6wtq$uQaP4XR7PJ74CUWMy6o2wO++ddtu39QMw9G7WrXbmco=	2020-12-11 14:33:02.650025+00		deleonalexandermamaradlo		alexander.deleon@denselight.com	t	f	f	f	2020-08-16 23:21:25.915761+00	\N	Employee
276	pbkdf2_sha256$216000$uUVzLFvSvgl6$8TcChEWRKJgB8JUzHqZBbkIINuLdir+CQW3LO1yxSGA=	2020-12-15 09:34:36.961406+00		balakrishnanprabhu		balakrishnan.prabhu@denselight.com	t	f	f	f	2020-08-16 23:21:23+00	\N	Employee
279	pbkdf2_sha256$216000$YESjtNpQfqf3$X4p+NdGl8zPp5yokIvopipdKY7m31WcjRfvBmry33V8=	2020-12-09 03:41:26.019738+00		cheeyoksunalvis		alvis.chee@denselight.com	t	f	f	f	2020-08-16 23:21:24+00	\N	Employee
275	pbkdf2_sha256$180000$f6nv6jzRccSb$3EUIueEnTiiMZDpwL5Vtb69sl4zVJYGLVNcjwjFJd7Y=	2020-10-13 09:28:17.783275+00		argabiosodanilosaplala		danilo.argabioso@denselight.com	t	f	f	f	2020-08-16 23:21:23.524481+00	\N	Employee
252	pbkdf2_sha256$216000$R7ZZZvj162zZ$Cd2kRSFJjAuSWNNJFBVL9IjhzSJTBGgnl7l8Wrbm49A=	2020-11-29 19:02:58.237413+00		chantatkhit		tatkhit.chan@denselight.com	t	f	f	f	2020-08-16 23:21:19.322188+00	\N	Employee
285	pbkdf2_sha256$216000$b7y3rkGhBKT5$VzwNSPRPyG836nn+eRgw6BZsY8p+b5Od/oB7F9EL+iA=	2020-12-14 06:27:16.556747+00		chuanye		ye.chuan@denselight.com	t	f	f	f	2020-08-16 23:21:25.36653+00	\N	Employee
284	pbkdf2_sha256$216000$1FSaEd7YdNYO$9MSHF22g+MNvuXKXOM/R1AU1m+mPDuUPWykqQhHqGRg=	2020-12-07 07:24:14.936518+00		chuayuxiang		yxchua@denselight.com	t	f	f	f	2020-08-16 23:21:25.174685+00	\N	Employee
274	pbkdf2_sha256$180000$81ZRgULh7MUe$4a+9Lug43PkxBdwyBrTmO1Z5/8dOJbpf9zOBENY+478=	2020-10-13 13:24:43.471767+00		arbizcarlankyleortega		carlan.arbiz@denselight.com	t	f	f	f	2020-08-16 23:21:23.339027+00	\N	Employee
249	pbkdf2_sha256$180000$dZva2J3zkwir$XXfyLQRwFkpFqsY1KcMRdLvPAiJWKeH/NaoO/NLmIAo=	2020-10-22 07:21:08.334267+00		arcillaraymundobonusan		raymundo.arcilla@denselight.com	t	f	f	f	2020-08-16 23:21:18.784006+00	\N	Manager
255	pbkdf2_sha256$216000$uTptc8N6CunN$ENrY26NJY+DoL0C8B79PcmRAS4hWjowusbkAGKZISAQ=	2020-12-14 09:12:08.852308+00		chivukulasubrahmanyam		chivukula.subbu@denselight.com	t	f	f	f	2020-08-16 23:21:19.879287+00	\N	Manager
262	pbkdf2_sha256$216000$iLEhtu3ZKyxU$NVb09h8ITsuNvKi0t/dmbnAfAEZxNkwQOA6c7eTWR24=	2020-12-14 08:56:12.978397+00		lamyeeloy		yeeloy@denselight.com	t	f	f	f	2020-08-16 23:21:21.172574+00	\N	Manager
3	argon2$argon2i$v=19$m=512,t=2,p=2$YXRtenB3UkxmSTZr$oNBQB4W4FntrCvIH4LxOLg	2020-12-19 20:24:01.052185+00	\N	denselightsuperuser	\N	superuser@denselight.com	t	t	t	f	2020-12-19 20:18:36.900716+00	\N	Employee
254	pbkdf2_sha256$216000$8VjyGzWKxy75$8OESW/K2X8H3PJ0xfyAB5hLhFbqwUNtplxfPSMWZd8U=	2020-12-15 07:51:39.005492+00		chinsewei		david.chin@denselight.com	t	f	f	f	2020-08-16 23:21:19.694903+00	\N	Manager
251	pbkdf2_sha256$216000$wpbEo64aJBvs$b19H2qlsmXQtcB6so9XsPeMgota9eVsE2xITm4pGKrQ=	2020-12-14 08:08:58.63605+00		chanborshen		bs.chan@denselight.com	t	f	f	f	2020-08-16 23:21:19.14379+00	\N	Manager
261	pbkdf2_sha256$216000$rKrB6tfku63w$8OklNgkXbmvUNkOP7xrNZWWE6HQFWV+pNXL9lnjOPok=	2020-11-29 16:17:44.901475+00		kevinyangkai		kevin.yang@denselight.com	t	f	f	f	2020-08-16 23:21:20.987596+00	\N	Manager
253	pbkdf2_sha256$180000$HTAbJn3YYHWW$vC93pXowZqUO4zlcI34n8tEap3/UJLMJQ5RJ7qdZIf8=	2020-11-03 01:42:41.093774+00		chanyuenchuen		eycchan@denselight.com	t	f	f	f	2020-08-16 23:21:19.501832+00	\N	Manager
264	pbkdf2_sha256$216000$mMRUAWh6UckY$qVFK5+WMJHxEo3BkO/FCPAZwRzllNybWrSCoufvDS7g=	2020-12-13 10:32:51.033473+00		leesiphengjason		jason.lee@denselight.com	t	f	f	f	2020-08-16 23:21:21.529091+00	\N	Manager
259	pbkdf2_sha256$180000$HomlcSbSaF79$IQDIjPM8Xc79A5xYjvOWkmv8IJ2MMvgZJAKU0wHC124=	2020-10-19 02:23:55.812613+00		juliusbautistaebonite		julius@denselight.com	t	f	f	f	2020-08-16 23:21:20.617998+00	\N	Manager
271	pbkdf2_sha256$216000$NXrDyFB1oPfp$30t+PSYHPyIY78p7qlYjeyudPlfvB7AGqsoDqlL+Fu4=	2020-12-16 01:11:07.491809+00		yaorushengray		rsyao@denselight.com	t	f	f	f	2020-08-16 23:21:22.786425+00	\N	Manager
266	pbkdf2_sha256$216000$JyBm9Eu24G0w$sOm6kgebFF+NcaZeo5QAz61cq1nxOCzmWv4quYrSiOc=	2020-12-14 08:03:49.883861+00		navinkumara/lvalautham		navin.kumar@denselight.com	t	f	f	f	2020-08-16 23:21:21.881793+00	\N	Manager
250	pbkdf2_sha256$180000$Zn7qfjlMOysa$2xFffbjMPN25xxSHDjLKaHglkjERZ3ansi856gXv/8s=	2020-10-21 01:57:02.729623+00		ashishkumarrai		ashish.kumar@denselight.com	t	f	f	f	2020-08-16 23:21:18.967313+00	\N	Manager
270	pbkdf2_sha256$216000$3UrAKLX7yonP$1DUNWtdOYQ7pwHq7hbsOxBb2ZNPPhZtO5uXw+MCYatg=	2020-11-26 17:08:42.331211+00		sungping-chun		pc.sung@denselight.com	t	f	f	f	2020-08-16 23:21:22.603296+00	\N	Manager
263	pbkdf2_sha256$216000$aFdE4TwMXsu3$IUnXqqfWz6frAcqTjx8RDSuWAVgz2f4G1FSESvMGDRI=	2020-12-18 08:57:07.745808+00		leechewbeng		robin.lee@denselight.com	t	f	f	f	2020-08-16 23:21:21.351657+00	\N	Manager
267	pbkdf2_sha256$216000$HqK48E93NBB9$28a34DNxUY4ID/zVJqkR1eRCiwITdb+VEFU2qbJkM68=	2020-12-16 05:04:11.068215+00		nguyenxuansang		xuansang.nguyen@denselight.com	t	f	f	f	2020-08-16 23:21:22.061527+00	\N	Manager
247	pbkdf2_sha256$216000$hP5zgM5AE1A1$8dvw8RdwkdQpxAWGrydiqgFNC3azqdcKiIswNnNcBI4=	2020-11-29 19:12:49.386111+00		andypiper		andy.piper@denselight.com	t	f	f	f	2020-08-16 23:21:18.399395+00	\N	Manager
256	pbkdf2_sha256$216000$skuzWJM8JUfu$k2AgB9FFToFPFjoIP/lvYkkOVo5Nw8ogldHOsJHcoBQ=	2020-12-18 09:44:37.37802+00		dilemkareendamogo		kareen@denselight.com	t	f	f	f	2020-08-16 23:21:20.070554+00	\N	Manager
269	pbkdf2_sha256$216000$61k7Crkd3dla$d/BYjoXSBm5MgBixHl848DWY5VgpeZP0nVBTC/iLn6g=	2020-11-29 16:03:55.457898+00		somasankaran		soma.sankaran@denselight.com	t	f	f	f	2020-08-16 23:21:22.420776+00	\N	Manager
265	pbkdf2_sha256$216000$Vsq0FsyU7fSL$V0JzS+c9s8tIa+eWBc3fwCDG0RIHul39OsVwVXpp59w=	2020-12-02 06:42:05.970919+00		mali		jacquelyn.ma@denselight.com	t	f	f	f	2020-08-16 23:21:21.704742+00	\N	Manager
258	pbkdf2_sha256$180000$9RHU6AqNmzfs$baxaQuzCDXFC792AumHG7ZnmRxCsaoELmWD+H/fDkWA=	2020-10-13 05:12:39.280633+00		hoganroystonhugh		hogan.hugh@denselight.com	t	f	f	f	2020-08-16 23:21:20.434171+00	\N	Manager
268	pbkdf2_sha256$216000$0svCEPcFZl3N$PhoyaLABf4EuXpcPqvHbkjx2DWk22Nu4s3HkINdnlIQ=	2020-12-16 12:33:20.442259+00		ryanstephen		ryan.stephen@denselight.com	t	f	f	f	2020-08-16 23:21:22.237813+00	\N	Manager
248	pbkdf2_sha256$180000$Qn1RyOzEEMA9$YoP69GjSkJoZDYUA+w51RaDeguAFdHkgCUmzsSLVZ6E=	2020-10-30 01:19:50.23244+00		kaderkamal		kamal.kader@denselight.com	t	f	f	f	2020-08-16 23:21:18.580047+00	\N	Manager
246	pbkdf2_sha256$216000$dpnl7Pmoazo5$430fSmeBbUGfPeWy1bLDPCdUQy7SggNVtPe4WbQ1lEE=	2020-12-09 09:01:29.871475+00		rajanrajgopal		rajan@denselight.com	t	f	f	f	2020-08-16 23:21:18.215669+00	\N	Manager
305	pbkdf2_sha256$216000$7WJ7COiyxdi3$6DBPtRj7dcrnhtrdZA2bnwC8mmYi10F8KKCmDBq5txI=	2020-12-04 07:53:44.450656+00		leelayhoon		layhoon.lee@denselight.com	t	f	f	f	2020-08-16 23:21:29+00	\N	Hr
292	pbkdf2_sha256$180000$YLSXmS8eV7mi$G9ovm3alSGNb0oFDm5cNdDUBBsNyW5MREOw42VrG5gk=	\N		fengyingxue		571055970@qq.com	t	f	f	f	2020-08-16 23:21:26.668405+00	\N	Employee
293	pbkdf2_sha256$180000$6s9VrNfAdPF5$yZjkLRFuyGuu5LT4KOcTte5EOWFCL7e0m2s0k/PDkAM=	\N		ferraragiovanni		giovanni.ferrara@denselight.com	t	f	f	f	2020-08-16 23:21:26.861059+00	\N	Employee
294	pbkdf2_sha256$180000$HBWk4jU2wLXz$8rBazbHts0fP7Vd2UU1OtOE0T7mCVQY82TP4DG0riuo=	\N		hoxhinweisusan		susan.ho@denselight.com	t	f	f	f	2020-08-16 23:21:27.041747+00	\N	Employee
298	pbkdf2_sha256$180000$Nw0SQgrc55dC$INUL6jg5OJPwUW1we5YHEXrclVApVbjAN5OjPyKMKYE=	\N		huangping		260857989@qq.com	t	f	f	f	2020-08-16 23:21:27.779048+00	\N	Employee
306	pbkdf2_sha256$180000$vqVLTqGUeN4G$JUpg21NxLcpVpm0fzuPDth2fa5aKWfJrRffMnlJyi9s=	\N		leeyunsian		lys.199810@gmail.com	t	f	f	f	2020-08-16 23:21:29.270697+00	\N	Employee
338	pbkdf2_sha256$180000$p0CcEsNSdUpU$wTHl6l5SnUC6uL/cFtjAgTC2qnb12j3++DhE1CKUnYU=	\N		wangli		1275334393@qq.com	t	f	f	f	2020-08-16 23:21:35.233057+00	\N	Employee
308	pbkdf2_sha256$180000$B3fA2hTWopUJ$eUMFhw8y/cJuR5De5R1O3EGKVwDnEr+js3JYvLXPIaw=	\N		limchiewkeat		chiewkeat.lim@denselight.com	t	f	f	f	2020-08-16 23:21:29.635616+00	\N	Employee
316	pbkdf2_sha256$180000$LrrDNn229zb9$kpH0Zw4NA4sXvLE5c0qDRyP5hIqT7z7Mzrztrd/kQdE=	\N		ongrongfeng		goodshowluo@gmail.com	t	f	f	f	2020-08-16 23:21:31.153209+00	\N	Employee
318	pbkdf2_sha256$180000$jyDiSGthNKk0$C1uOacDEndnFUcD0IHFMrX8+VH/s4CPsT2DcF/eTgBg=	\N		raguvaransubramaniam		ragucr9403@gmail.com	t	f	f	f	2020-08-16 23:21:31.530264+00	\N	Employee
327	pbkdf2_sha256$180000$lNLkH2V5rh5i$jKX2WnNLpqwHZLWo/f+xcErp6GyRHEUDjleh+gTk7yU=	\N		sriiswirasrikumar		srieshwergunasegaram@gmail.com	t	f	f	f	2020-08-16 23:21:33.170076+00	\N	Employee
330	pbkdf2_sha256$180000$zBZkc6AdTUZj$n8a9fkpjgUiHkNO6aRPrwqDnjxAZFuuxqnGWmDpEgUM=	\N		tanchinwun		chin2005@hotmail.com	t	f	f	f	2020-08-16 23:21:33.7183+00	\N	Employee
333	pbkdf2_sha256$180000$GakhoMRfsCQs$UgCJTAVIl5lUtRKm/OrzCudTIC1gIUthgI7wCu2vKas=	\N		tangchaiyee		chaiyee1103@hotmail.com	t	f	f	f	2020-08-16 23:21:34.292624+00	\N	Employee
335	pbkdf2_sha256$180000$dC2yOcD1Zbow$UvtVYA/UA/DhZlw9nwksqT+3hndxqYZHIawvy57eZu0=	\N		tehweijoe		joeyteh99@gmail.com	t	f	f	f	2020-08-16 23:21:34.664201+00	\N	Employee
290	pbkdf2_sha256$180000$8uY6YKtNiATE$lxLixLFnpDlICoGCVP/Nk6eXDnkzxHcikmd6Kj5f2J0=	2020-10-12 08:48:24.122015+00		fairozahamed		fairoz.ahamed@denselight.com	t	f	f	f	2020-08-16 23:21:26.300018+00	\N	Employee
300	pbkdf2_sha256$180000$k3YyMBThWtsP$PtPTLT7QTqKAMmtFegXmJjyabgMixVxwiTp55YH1k6A=	2020-10-13 07:53:19.575425+00		jiaqingwen		qingwen.jia@denselight.com	t	f	f	f	2020-08-16 23:21:28.169562+00	\N	Employee
322	pbkdf2_sha256$216000$AEN61wpxU1yR$sFVmtSWrRG4fsY7qNrqrt6w1Ib4Agv272MQm+6FZzuY=	\N		robiahbtemohamedtahir		layhoon.lee@denselight.com	t	f	f	f	2020-08-16 23:21:32.245931+00	\N	Employee
317	pbkdf2_sha256$180000$5ynuuQmb66D3$YT5NrFzoxB602O1BsyY2W8ra+2O/gtawGhAGJ/D/Jkw=	2020-09-30 08:22:19.411355+00		perumanaillomnarayanankuttyumadevi		umadevi@denselight.com	t	f	f	f	2020-08-16 23:21:31.343056+00	\N	Employee
303	pbkdf2_sha256$216000$jNR9uB8cpsw2$BegJwE55Zh8zR4zCmMTe+anGPhcqbPx/QF0x47Ar8iA=	2020-12-16 01:38:40.806241+00		khizarhussankaleel		khizar@denselight.com	t	f	f	f	2020-08-16 23:21:28.723859+00	\N	Employee
313	pbkdf2_sha256$180000$SMYnSY06t3Wo$32S/TH1bisLqzrKNTqv2eI2bI2kpqcypBUPx0NSj/7g=	2020-09-28 04:06:57.189693+00		ngyeneng		cassandra.ng@denselight.com	t	f	f	f	2020-08-16 23:21:30.578867+00	\N	Employee
332	pbkdf2_sha256$180000$YVn4OgVDemzA$JA7hDkFBhW2wehiq+3Lc2InbOYBralNZYCebf/zFiKI=	2020-10-20 11:23:27.337159+00		tansoohweejaslyn		jaslyn.tan@denselight.com	t	f	f	f	2020-08-16 23:21:34.0995+00	\N	Employee
299	pbkdf2_sha256$216000$tk63A8byH2LS$4qQZCWBP4d4I5cwNja++Rde6bLvoqdE60Dg2TIV9FT0=	2020-12-11 10:31:21.20401+00		huangshenghe		simon.huang@denselight.com	t	f	f	f	2020-08-16 23:21:27.969447+00	\N	Employee
302	pbkdf2_sha256$216000$rix7941fCXXP$i5iJwIohoUCc+fg6FaHB3/5EWDrkd7boMdL1PT8XzoY=	2020-12-08 07:46:33.570943+00		kangkoksengmichael		michael.kang@denselight.com	t	f	f	f	2020-08-16 23:21:28.536611+00	\N	Employee
331	pbkdf2_sha256$216000$zLThET3dxJyH$e+Ltz3g2cDOj6Qn9hzMv06UAjY1xqY65JZu/nK09aug=	2020-12-18 01:22:07.597646+00		tanpohgeksharon		sharon.tan@denselight.com	t	f	f	f	2020-08-16 23:21:33.914561+00	\N	Employee
295	pbkdf2_sha256$216000$Cu3MVM5fQ692$qqWbDH/6cyiviRhEq9wNlYTK7zm3OWB6lx3SgHdrQb0=	2020-12-08 09:49:31.862575+00		hoeneeshiuan		nshoe@denselight.com	t	f	f	f	2020-08-16 23:21:27.225211+00	\N	Employee
319	pbkdf2_sha256$216000$06GyKLsp4qyx$rrO1idbO6WpRE7J8DdIYROnCl7H99cGf8FwcPKDSjD0=	2020-12-18 08:52:06.934755+00		rasuribintirazali		rasuri.razali@denselight.com	t	f	f	f	2020-08-16 23:21:31.709968+00	\N	Employee
309	pbkdf2_sha256$180000$ShNhL8K3hv34$XF7V0hILKM4h3gKFUYjY3jF4AmD+76kGIBzXdKxEwFc=	2020-10-20 05:29:02.2065+00		limkhaiteng		kt.lim@denselight.com	t	f	f	f	2020-08-16 23:21:29.838296+00	\N	Employee
334	pbkdf2_sha256$216000$GU5yeqmmg0th$ypTVb5C7GC+h0Kl3MsVkZRNhhGawt1M8xTsC1hgNL0A=	2020-12-14 01:59:12.012687+00		taykaymengandrew		andrew.tay@denselight.com	t	f	f	f	2020-08-16 23:21:34.484663+00	\N	Employee
323	pbkdf2_sha256$180000$dQJRnv5JFWGE$8LDUXi1wWXD33pgA2vmPotHAm+8paC2fyFDEJ4ltBII=	2020-10-19 03:44:23.598678+00		ronaldomapotelacopia		ronaldo.mapote@denselight.com	t	f	f	f	2020-08-16 23:21:32.42517+00	\N	Employee
310	pbkdf2_sha256$216000$nUud0kFHRX1y$h093T5LMy2aSj9NcmOmKuQu157bQrtL3He2Gz+L4qUc=	2020-12-18 08:51:26.920658+00		lohterhoe		isaac.loh@denselight.com	t	f	f	f	2020-08-16 23:21:30.019233+00	\N	Employee
296	pbkdf2_sha256$180000$iCbuqA4DW0QL$h5A4FLDYBfLHy1Wy6IhWyvn/8vAsUnvZ7g8M78iRKlQ=	2020-09-26 02:47:14.759278+00		houjiantao		jiantao.hou@denselight.com	t	f	f	f	2020-08-16 23:21:27.412711+00	\N	Employee
314	pbkdf2_sha256$216000$2UUx4fzWofzE$CA1gO5E33caSe2ufuuogJg9XmuzVMF2A1BOduj5tfLI=	2020-12-16 05:08:51.190768+00		nguyenvietthe		vtnguyen@denselight.com	t	f	f	f	2020-08-16 23:21:30.758764+00	\N	Employee
315	pbkdf2_sha256$216000$MMs7jAjaF31X$PVd4/LxM4kQSTYxECJW4rJ2uh7Co2PHAsEP1E5tMd/I=	2020-12-14 03:47:20.943171+00		noblebright		noble.bright@denselight.com	t	f	f	f	2020-08-16 23:21:30.964244+00	\N	Employee
311	pbkdf2_sha256$180000$u2qbK0O0Evvo$+KmQkiaZQQUz7KqDg5BRQouZ+jO6zyPa53hRRB3VAa0=	2020-10-27 15:34:00.380446+00		madanaayush		madan.aayush@denselight.com	t	f	f	f	2020-08-16 23:21:30.204402+00	\N	Employee
297	pbkdf2_sha256$216000$Q75173Sd6MT5$Aktf5RU+jL6hf+qNirNCFu+U5dD8uZZfjL+Hzzp/kZ0=	2020-12-11 10:40:17.485677+00		huangling		ling.huang@denselight.com	t	f	f	f	2020-08-16 23:21:27.594508+00	\N	Employee
304	pbkdf2_sha256$216000$EoJwgEn8Eufd$Aoy1uN800AKL0NUk5tDkLkDNqAksWr1ftELuora92Bw=	2020-12-15 04:43:53.496278+00		kohlongcheng		lckoh@denselight.com	t	f	f	f	2020-08-16 23:21:28.909938+00	\N	Employee
320	pbkdf2_sha256$216000$YsGa8dezwzBP$mXvr9/gmpejSh+yrX2l4a65qXAE5GVVLWW98dYA39ik=	2020-12-16 02:04:41.446146+00		rebeccalourdes		rebecca.lourdes@denselight.com	t	f	f	f	2020-08-16 23:21:31.888687+00	\N	Employee
324	pbkdf2_sha256$216000$FYca4meEhA4q$kyk97gwLTPAExLxg7cxSDHlarNzHLbIpK6ErpUad0xM=	2020-12-14 03:50:13.078484+00		santoshkumarpani		santosh.kumar@denselight.com	t	f	f	f	2020-08-16 23:21:32.613177+00	\N	Employee
321	pbkdf2_sha256$216000$KUfRjqOeQUeF$htY4KPmQZ6wPo2LYWeCG1rUV42Lv34TCtCRQ3ePnfv0=	2020-12-14 09:50:34.655211+00		reyesjimroseaddun		jim.rose@denselight.com	t	f	f	f	2020-08-16 23:21:32.066918+00	\N	Employee
326	pbkdf2_sha256$216000$ETkEVi6iqAPv$KGUOXwGq47/jjXyaiF/p1FUTly1p4G/DdTt1Al4CA4g=	2020-12-17 07:44:45.481014+00		sitiqadariyahbintemdyusoff		siti.q@denselight.com	t	f	f	f	2020-08-16 23:21:32.985516+00	\N	Employee
325	pbkdf2_sha256$216000$yH5QsqFsETkg$u73IK30Oz9JqylG/dZBssqS2/HG48YRx22BtchIiXzk=	2020-12-14 02:24:37.694244+00		simhonyuenaaron		hysim@denselight.com	t	f	f	f	2020-08-16 23:21:32.796744+00	\N	Employee
301	pbkdf2_sha256$216000$UrxbBDkca4em$reaxCHGl/QdLm6CPOsMm/07F8rUvtHpSHdUDR8rSArE=	2020-12-16 03:02:54.967275+00		juliusocadoampo		j.ampo@denselight.com	t	f	f	f	2020-08-16 23:21:28.34879+00	\N	Employee
329	pbkdf2_sha256$216000$2REXpSaAdsOL$A/1g4/85uq2VEXOEy8yiKrw+xrpNc8ZvJgX5lBR6laQ=	2020-12-14 08:59:48.288742+00		syrexarcillotura		syrex@denselight.com	t	f	f	f	2020-08-16 23:21:33.535952+00	\N	Employee
307	pbkdf2_sha256$216000$cwXaGHrLcpSR$RM0ol60FsXy9oV+sD/n9sJj7e1LAYMOUS/4nl79nRiY=	2020-12-16 05:08:28.280224+00		liewkokwai		wesley.liew@denselight.com	t	f	f	f	2020-08-16 23:21:29+00	\N	Employee
291	pbkdf2_sha256$216000$N59S60SeP50P$sdrFvAPJGHJ0P6mA4pAJsdIp+om4D/0d/C15paGX4Eg=	2020-12-17 09:02:38.476717+00		fanlouiecanares		louie.fan@denselight.com	t	f	f	f	2020-08-16 23:21:26.488609+00	\N	Employee
337	pbkdf2_sha256$180000$54FzYvnGzFwl$wsfmT21H6pEcU/PhuWWG8VGxIroUMgrd4mFI0UwWyco=	\N		wangjinhua		497814581@qq.com	t	f	f	f	2020-08-16 23:21:35.044183+00	\N	Employee
339	pbkdf2_sha256$180000$9FvNjlKF4f7C$aD4l+o6viVwoa95mYU0lgUKueoXWFTCa1qJ7K52ekdI=	\N		wangwei		939024661qq.com@gmail.com	t	f	f	f	2020-08-16 23:21:35.425922+00	\N	Employee
260	pbkdf2_sha256$216000$gPgBsLjMy7CM$ll3YLIzstmgZuBWnqP+SrMEDcgjH6zr34Um7juuUxZw=	2020-12-17 15:44:00.25172+00		kayyewsenganthony		anthonyk@denselight.com	t	f	f	f	2020-08-16 23:21:20+00	\N	Manager
312	pbkdf2_sha256$216000$F0SGrwVoO08h$z4KGzjLU5/T5/kDmez9gXz1S0TZsdDDJHKfX3C1MLbE=	2020-12-03 02:21:22.373997+00		maumitachakrabarti		maumita.chakrabarti@denselight.com	t	f	f	f	2020-08-16 23:21:30.384916+00	\N	Manager
353	pbkdf2_sha256$180000$YHUaAqX4jgOd$VTu0X3z9BwU4VXOjjp2gVS9aazISAA/83bfqJOoZuJM=	2020-10-26 09:34:41.593311+00		alextanteckhowe		alex.tan@denselight.com	t	f	f	f	2020-08-16 23:21:38+00	\N	Hr
340	pbkdf2_sha256$180000$UBWy2cBLWPOT$V6Lxy/d19Rv1+VFkHFhkV92g52gOzJSJqb6Gj4rj5jU=	\N		wangyaping		3604879607@qq.com	t	f	f	f	2020-08-16 23:21:35.631888+00	\N	Employee
341	pbkdf2_sha256$180000$g7e7ThGGNYTv$CA4hGXPVKep58Buys8oZq9dLLr5RkUvSZ5rJyaef0/s=	\N		wangyueping		55320191@qq.com	t	f	f	f	2020-08-16 23:21:35.823344+00	\N	Employee
343	pbkdf2_sha256$180000$gGOg3GQDiyVt$wTabMQybUgyIrFVqrKUzleedcBqLIu34DIH5EmQ1zBQ=	\N		xuqiulan		593930910@qq.com	t	f	f	f	2020-08-16 23:21:36.181407+00	\N	Employee
344	pbkdf2_sha256$180000$dN29d3VJGCND$sJV6bTireO1T6Ogg2ayu3jWK//TKdDtK1KNEwQkgOX0=	\N		yangfeng		63939234@qq.com	t	f	f	f	2020-08-16 23:21:36.364325+00	\N	Employee
345	pbkdf2_sha256$180000$RtVqq80Xpef2$ptb5w2jgQQpPJmD/gs/HF+0duY01mYdWzfv3B/+IS+s=	\N		yangting		181479069@qq.com	t	f	f	f	2020-08-16 23:21:36.542818+00	\N	Employee
347	pbkdf2_sha256$180000$EInlclzKWSdr$XiBN3iLfBICq8VXKKBxg1Cq1XaP1e0bcekjiPVhKWuM=	\N		yumiao		49504145@qq.com	t	f	f	f	2020-08-16 23:21:36.920065+00	\N	Employee
348	pbkdf2_sha256$180000$628aOClD5SUh$1V/KBudXjCTDyL6i+doRIxWEz7pKRN5YhOvQZeYXuk0=	\N		zhangqing		2214776521@qq.com	t	f	f	f	2020-08-16 23:21:37.108985+00	\N	Employee
350	pbkdf2_sha256$180000$l9AwTscJ4wea$Tcm/yPF1+J0DCLmRGy10CFNfqCBlHOrR9pw5HEK0c1s=	\N		zhengcaili		825995920@qq.com	t	f	f	f	2020-08-16 23:21:37.481706+00	\N	Employee
351	pbkdf2_sha256$180000$KlNdEhFdw7tf$pDlFNLQo9VPhtqFPzuF2s7wN4FveKhAM3MJLPmKhBlo=	\N		zhengshaoqin		1004548688@qq.com	t	f	f	f	2020-08-16 23:21:37.663083+00	\N	Employee
352	pbkdf2_sha256$180000$mmVe83mCLpvm$QHXw4+56Zjpjq3e7RivXko/X286aCpa61m1yk6UKPck=	\N		zhongxiangzhu		490639724@qq.com	t	f	f	f	2020-08-16 23:21:37.84057+00	\N	Employee
336	pbkdf2_sha256$216000$Ynlux2FCOi99$H/XU+F5x6mK4Z0pbFW+a9VEttxDW71Qrp38O8+loU5M=	2020-12-15 08:49:39.25694+00		vaithiyalingamhari		hari.v@denselight.com	t	f	f	f	2020-08-16 23:21:34+00	\N	Employee
349	pbkdf2_sha256$180000$QUwQfrpqG6S2$KKy7wiXrCp+eQjsro1k/0behu7hde0KAIG9j22MOfks=	2020-09-10 05:47:29.130126+00		zhaohanxuekelly		hanxue.zhao@denselight.com	t	f	f	f	2020-08-16 23:21:37.292888+00	\N	Employee
328	pbkdf2_sha256$216000$klEMTRw3TZVH$xk97yAe+SR28hWdQWv/Rky5hR2PXatM0qvT8EmbY0to=	2020-12-15 09:52:03.919421+00		sundararajsivaramalingam		sundararaj.siva@denselight.com	t	f	f	f	2020-08-16 23:21:33+00	\N	Employee
272	pbkdf2_sha256$216000$JjVfPxpPCIR3$aCHkLptDQhaTXQkx05/M1SvNZfpZ7M4qbi7lDXt349k=	2020-12-17 08:56:55.092282+00		abdulhameedbinramadhan		hameed.ramadhan@denselight.com	t	f	f	f	2020-08-16 23:21:22.965977+00	\N	Employee
346	pbkdf2_sha256$216000$GpiQUBq00XCW$SbSadztGW8IV5VunNcWMZ/o76aqDTgpwoAo1rC1776s=	2020-12-12 05:18:22.933933+00		yeoaudieadam		audie.yeo@denselight.com	t	f	f	f	2020-08-16 23:21:36.725915+00	\N	Employee
342	pbkdf2_sha256$216000$IyixGC47Bfpk$0LBTiyDCYpBJVAhUarnGc/xYA7CQZHQxL5qEd+11pVw=	2020-12-03 02:15:41.639699+00		wongzuxingkeith		keith.wong@denselight.com	t	f	f	f	2020-08-16 23:21:36.000247+00	\N	Employee
367	pbkdf2_sha256$216000$YFQPcvw8OUCx$Jq7lIGWnDoEh4iEmKVsVJqgqSBI/Thtt11QSkAMc264=	2020-12-01 13:37:53.610525+00		usertest2			t	f	f	f	2020-11-18 11:57:52.163035+00	\N	Employee
357	pbkdf2_sha256$180000$FegQWRI6eYdI$IcJHFKz18oJ9knBIxkwn/Oel2TkQUvNKGqdv4WxHbM4=	2020-10-14 02:05:21.706639+00		muhammadzuhdi		mzuhdi@denselight.com	t	f	f	f	2020-08-19 08:10:59+00	\N	Employee
257	argon2$argon2i$v=19$m=512,t=2,p=2$ZHFudzJLN200VEll$5kI3P+PSonPcyTFwl883Sg	2020-12-11 07:34:01.81737+00		helenvincent		helen@denselight.com	t	f	f	f	2020-08-16 23:21:20.25196+00	\N	HRManager
365	argon2$argon2i$v=19$m=512,t=2,p=2$eTF3c01zSTQxMzhY$YA+iRm+dTsXimoX+r8V+WQ	2020-12-11 07:28:40.419815+00		managertest		managertest@email.com	t	f	f	f	2020-11-02 04:25:34+00	\N	HRManager
373	argon2$argon2i$v=19$m=512,t=2,p=2$andoRDJXeWN1ZVpn$agA86+E7EuQ/9s5xuQXPKQ	\N	\N	amit	\N	amit@gmail.com	t	f	f	f	2021-01-21 18:17:11.016024+00	\N	HRManager
374	argon2$argon2i$v=19$m=512,t=2,p=2$dmtmZm5WSEZJcUJw$HsR2bKmd/RV9CefUMr7kbQ	\N	\N	superadmin	\N	admin@email.com	t	f	f	f	2021-01-24 19:13:38.422775+00	\N	Admin
364	argon2$argon2i$v=19$m=512,t=2,p=2$dFl5S2tqdGkyZFNS$4kfMvpBilUFi6TDsfF+afw	2020-12-16 12:36:45.799939+00		usertest		usertest@email.com	t	f	f	f	2020-11-02 04:24:00.951896+00	\N	Employee
368	pbkdf2_sha256$216000$0U9LI0GZ9lre$pK2sevAXjHTlKP1TIGA1kXPyDCLJ6i9+tJujjgkZMMU=	\N		aditya		goog@gmail.com	t	f	f	f	2020-11-24 17:49:41.907653+00	\N	Manager
\.


--
-- Data for Name: Profile_user_groups; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Profile_user_groups" (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: Profile_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Profile_user_user_permissions" (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: Ticketing_ticket; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Ticketing_ticket" (id, category, title, description, status, created_by_id) FROM stdin;
\.


--
-- Data for Name: Ticketing_ticketcomments; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Ticketing_ticketcomments" (id, comment, created_on, ticket_id, user_id) FROM stdin;
\.


--
-- Data for Name: Trainings_applytrainings; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Trainings_applytrainings" (id, status, date_start, date_end, approved_by, employee_id, training_id) FROM stdin;
\.


--
-- Data for Name: Trainings_careerdiscussion; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Trainings_careerdiscussion" (id, "Q1", "Q2", "Q3", "Q4", "Q5", "Q6", "Q7", "Q8", employee_id, user_appraisal_id) FROM stdin;
\.


--
-- Data for Name: Trainings_skillcategory; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Trainings_skillcategory" (id, name) FROM stdin;
1	Accounting Standards
2	Accounting and Tax Systems
3	Audit Compliance
4	Audit Management
5	Automated Operation Monitoring
6	Automated Systems Design
7	Automation Process Control
8	Automation System Maintenance
9	Business Continuity Planning
10	Business Acumen
11	Business Innovation and Improvement
12	Business Negotiation
13	Business Networking
14	Business Operation Development
15	Business Performance Management
16	Business Planning
17	Business Presentation Delivery
18	Change Management
19	Communication
20	Compensation & Benefits Management
21	Conduct and Behaviour Management
22	Conflict Management
23	Continuous Process Improvement
24	Cost Management
25	Creative Thinking
26	Crisis Situations Management
27	Customer Acquisition Management
28	Customer Experience Management
29	Customer Relationship Management
30	Cybersecurity
31	Data Analytics System Design
32	Data Mining and Modeling
33	Data Synthesis
34	Decision Making
35	Defect Density Monitoring
36	Digital Literacy
37	Diversity and Inclusion Management
38	Effectiveness Management
39	Electrostatic Discharge Control
40	Embedded Systems Integration
41	Employee Communication Management
42	Employee Engagement Management
43	Emergency Management
44	Employer Branding
45	Enterprise Risk Management
46	Equipment Maintenance
47	Facilities Management
48	Factory Systems Management
49	Failure Analysis
50	Financial Acumen
51	Financial Closing
52	Financial Management
53	Financial Reporting
54	Financial transactions
55	Global Mindset
56	Good Manufacturing Practices Implementation
57	Group Accounting & Consolidation
58	Hazards & Risk Control
59	Human Resource Advisory
60	Human Resource Practices Implementation
61	Human Resource Systems Management
62	Infocom Technology Adoption and Innovation
63	Information Systems
64	Infrastructure Support
65	Installing & Configuring
66	Innovation Management
67	Internal Control
68	Involuntary Exit Management
69	Job Analysis & Evaluation
70	Labour Relations Management
71	Leadership
72	Learning & Development
73	Lifelong Learning
74	Manufacturing Process Design
75	Manufacturing Process Management
76	Market Profitting
77	Networking
78	Materials Qualification
79	Metrology Management
80	Network Administration and Maintenance
81	Network and Systems
82	New Product Introduction
83	Onboarding
84	Operational Excellence
85	Operations Management
86	Organisational Analysis
87	Organisational Change Management
88	Organisational Culture Development
89	Organisation Design
90	Organisational Strategy Development
91	Organisational Strategising
92	Parametric Testing
93	People Capability Development
94	Performance Management
95	Problem Solving
96	Process Integration
97	Procurement Management
98	Product Testing
99	Production Performance Management
100	Production Planning
101	Production Resource Management
102	Production Shut-down & Re-start
103	Project Management
104	Quality Assurance Management
105	Quality Control & Assurance
106	Quality Process Control
107	Quality Systems Management
108	Report Writing
109	R&D
110	Resource Management
111	Risk Appetite & Goals Setting
112	Sales Closure
113	Selection Management
114	Service Excellence
115	Software Testing
116	Solutioning
117	Stakeholder Management
118	Strategic Workforce Planning
119	Succession Planning
120	Supplier Performance
121	Supplier Sourcing
122	System Integration
123	Systems Thinking Application
124	Tax Computation
125	Tax Implications
126	Taxation Laws
127	Teamwork
128	Technical Presentations
129	Technology Integration
130	Technology Roadmapping
131	Total Rewards Philosophy Development
132	Transactional Accounting
133	Transdisciplinary Thinking
134	Vision Management
135	Voluntary Exit Management
136	Workplace Safety & Health Practices Implementation
137	Yield Analysis
\.


--
-- Data for Name: Trainings_skills; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Trainings_skills" (id, description, weightage, "recommended_Trainings_user", "recommended_Trainings_manager", "recommended_Trainings_board", user_rating, manager_rating, board_rating, user_comments, manager_comments, board_comments, appraisal_id, employee_id, skill_category_id) FROM stdin;
3	Accounting Standards is very future-proof	100	Accounting Standards Training Part 1, Accounting Standards Training Part 2	Accounting	NIL	4	3	4	I think this is a good skill	I dont think so	NIL	\N	\N	1
4	Skills Description 1	100	NIL	You need to go for accounting course 101	NIL	3	2	1	NIL	You need some training.	NIL	\N	\N	2
18	Supervisor training 101	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	988735390	71
46	Improve knowledge of SLEDs and ELEDs design, processing and testing	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1510925941	74
47	Improve and acquire more knowledge of MOCVD wafer epitaxy	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1510925941	75
118	Hunet Test	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	17	1
119	testing	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	17	1
91	Close the deal Push for the best for Denselight	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	25957709	12
92	People management skill. Motive people help people succeed.	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	25957709	71
89	Supervisor training 101	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	988735390	71
90	Singapore Corporate Tax Training course	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	988735390	124
85	Behaviour Observation and conflict Resolution - Managing difficult conversations with talking with employee at termination or grievance handling. To attend course: SNEF - Managing Harassment in the work place.	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	534558467	19
23	Collaboration Skills\r\nTeam work is the force that helps any organization succeed, and learning to collaborate well will bring in the results you need	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1710250857	72
22	Managing Your Priorities\r\nAs work load gets larger, we need to develop the ability to manage priorities	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1710250857	72
24	Behaviour Observation and conflict Resolution - Managing difficult conversations with talking with employee at termination or grievance handling.\r\n\r\nTo attend course: SNEF - Managing Harassment in the work place.	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	534558467	19
35	Got training for the Audit management	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1723530200	4
7	Bridging Strategy to Outcomes\r\nTo support the successful implement of company strategies.\r\nDevelop improved action skills for business development strategy.	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1002214209	91
6	Adapting to Constant Change\r\nTo lead positive attitude and actions during change.\r\nDevelop improved flexibility to adapt changing economy environment.	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1002214209	18
5	Denselight Supervisor training 101: A Supervisor role\r\nTo improve management skills to ensure more collaborative and effective work space.\r\nDevelop improved coaching skills.	40	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1002214209	71
86	Cyber Security Masterclass	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1428738048	63
87	Privacy Information Management System (PIMS)	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1428738048	63
93	To learn & pick up process of MOCVD.	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1598293097	72
98	Safety ERT involvement	20	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1941685512	45
10	Digital Transformation focus on Document Automation	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1224448967	63
11	Personal Data Protection Act 2012 (PDPA),	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1224448967	30
12	Identifying Work Priorities and Setting Verifiable Goals (Individual) (VILT)	40	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1224448967	15
13	Continuously support day to day process related activity to learn and familiarize on the process and issue.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	249343659	23
15	Achieve Forum training: Collaboration Skills	20	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	439847763	127
16	Be more articulate in presentations so as to communicate with others more effectively	40	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	439847763	19
17	Make use of Tibco Spotfire more for wafer level data analysis in development work	40	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	439847763	137
19	Singapore Corporate Tax Training course	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	988735390	124
9	GST latest changes - free workshop by IRAS when available.	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	104959828	2
8	attended course on Effective Cash flow Management, Budgeting on 19 Aug 2020.	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	104959828	132
21	GST seminar	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	6	2
20	Virtual : Strategy For Costing & Budgeting	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	6	2
25	Building Commitment to Result\r\n09 & 12.06.2020	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1014312820	72
26	Supervisory 101 Training\r\n28.03.2020	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1014312820	72
30	Lead the team	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	673813648	71
31	Find out the loop hole in the existing process and propose solutions	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	673813648	23
32	Deep dive and fully understand ELED/SLED/DFB procoess flow, die design, product application , test spec & charaterization, lesson learnt.	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	861437177	129
33	Work closely with QA, NPD and sales to establish and improve the business creation process flow (PDM requirement) for new product development by milestone phase exit.	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	861437177	11
28	Improving operations efficiency by 56.19% in terms of distance travel reduction thru the proposed production layout in APT. The data was presented during one of the KFA session.	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1014312820	9
27	Integrating and implementing Odoo in DLS as alternative of ERP system to enhance WIP visibility across departments in DLS and to improve productivity of the employees by doing other value adding task after automating certain process steps such as creating WO and tracking the WO.	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1014312820	122
34	1. Masking process development, resist film thickness tuning/exposure&developer condition optimization\r\n2. Etch process understanding/backup\r\n3. Integration understanding\r\n4. Backlap/N-metal peeling off understanding	5	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1776097184	69
36	By using Tibco Automated the SPC charts for FAB B processes	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1723530200	7
37	Designing the packaging of the NPI products tendered from FOS4x.	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1014312820	74
38	Supervisory training	33	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	50985924	93
39	Technical capability for new products at external manufacturers	33	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	50985924	82
40	External manufacturing management - costs, MOQs, inventories, etc.	33	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	50985924	24
42	Dilemma Management is a strategic tool, not only for leaders, but also for teams, work groups, stakeholders to apply a focused, collaborative approach for analyzing complex business issues where there is no "right" answer or "best" solution, but rather two opposing positions or points of view, each with distinct advantages and disadvantages. The key to dilemma management is to develop a strategy that achieves the advantages of both positions while minimizing the disadvantages.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1777433913	34
43	Storytelling is a communication tool that enhances the meaning, impact, and energy behind ideas. Stories take typical messages and bring them to life, engaging people’s minds and evoking their emotions. Stories transform traditional business communication into exchanges that capture the imagination and build commitment. This module is designed to help.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1777433913	19
41	Research of laser feedback mechanisms to achieve narrow linewidth.	80	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1777433913	109
44	Learn our products' well and do presentation to customers when to visit customers.	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1369735000	128
45	Silicon Photonics e-Learning	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	9327697	96
48	Technical writing\r\nProject management methodologies	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1906914592	103
76	- Articulate and experienced  in managing hazard and risk control. \r\n- Effective teaching and knowledge sharing skills, and ensures that the team fully understands the big picture.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	2047523461	58
50	Skills development on:\r\n1) analytical aspect\r\n2) understanding priority of given tasks	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	2076006951	72
49	To develop a project plan starting from scratch (i.e. work package division, key milestone)	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	2076006951	103
51	People management skill. \r\nMotive people\r\nhelp people succeed.	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	25957709	71
52	Close the deal\r\nPush for the best for Denselight	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	25957709	12
29	In depth of all Critical equipment	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	5	46
54	•\tDrive initiatives and take smart risks to achieve our goals.\r\n•\tTo believe that excellence is achievable if we put our hearts and minds to achieve it. \r\n•\tTo know that change is needed to improve situations. \r\n•\tTo set out goals and do what it takes to attain them. \r\n•\tTo challenge oneself continuously by setting higher targets after achieving the last set target	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	52374544	84
55	Coach & Develop	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	973701598	42
56	Buidling commitment to Results	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	973701598	41
57	Embark on multiple automation companies to understand better how it can help improve DLS state of operations automation thru online demo or site visits	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1982477965	5
58	Understand and execute Kaizen in line with Best In Class practises	40	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1982477965	18
59	Develop KPI dashboards to drive performance thru data, eg output from the Rapsberry Pi with sensors to measure utilization	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1982477965	94
60	Lead with Influence\r\n(Lead with Influence)	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	161961016	34
61	Leading Virtually	40	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	161961016	72
62	Communication with Impact\r\n(Communication with Impact)	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	161961016	41
64	Building team pride & purpose	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	689543953	71
65	Making Collaborative Decisions	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	689543953	127
67	Leading Complex Decisions,Making Collaborative Decisions & Problem-Solving Results	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	426739617	95
66	Develop a Leadership Mindset	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	426739617	71
63	Coil spool for BF 50m and ASE 10m.\r\nPlan to do coil for fosx	60	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	231731743	23
68	Build up hardware and software solutions for dataflow pipeline from data source, into storage and eventually into data visualization tools.	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	711389827	81
69	Build up hardware and software solutions for dataflow pipeline from data source, into storage and eventually into data visualization tools.	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	711389827	122
73	- Demonstrate good leadership and good listening skills. \r\n- Lead by example by showing the team good working attitude, creativity, and going the extra mile. \r\n- Constant team motivation by holding regular discussions and meetings to encourage openness of ideas and allow them to voice their feedback.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	2047523461	71
71	Display characteristics of good leadership such as integrity & honesty, positive attitude, work commitment, impartiality and humility.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	2047523461	71
72	Multiple disciplines in facilities management to ensure effective and efficient operations, such as operational, preventive maintenance & services, EHS, Fire safety, planning, project management and 6S.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	2047523461	47
77	- Constant learning and skills upgrading, so as to ensure the sustainability and updatedness of my ideas and contributions to DSL.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	2047523461	73
78	- Vast knowledge of maintenance and management of  different machines / equipment in the semiconductor wafer fab industries.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	2047523461	46
70	Experienced and knowledgeable in Workplace Safety & Heath regulations and best practices.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	2047523461	136
75	- Consider all factors behind any decisions and avoid rash decision making.\r\n- Ensure decision makings are aligned to DSL or team targets and goals.\r\n- Take decision making initiatives and avoid unnecessary delays while waiting on other parties.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	2047523461	34
74	- Be inclusive and friendly to all team members.\r\n- Practice cooperation and democracy at all times.\r\n- Encourage and motivate others to practice the spirit of teamwork.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	2047523461	127
79	- Constant communication with team and management to ensure unity and effective teamwork.\r\n- Improve ideas sharing and work relationship.\r\n- Constant communication to ensure up-to-date information and awareness at all times and prevent miscommunication. \r\n- Friendliness, respectfulness, humility and professionalism when communicating with each other to avoid conflict and misunderstanding.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	2047523461	19
80	\N	80	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1813039923	109
82	SLED - Photonic Device Physic & Design understanding\r\n1.\tLearn the design aspects of SLED & optimization\r\nTest & measurement of photonic devices	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	480020115	82
81	SOA -Photonic device physic & design understanding\r\n1.\tLearn the design aspects of SOA & optimization\r\n2.\tTest & measurement of photonic devices	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	480020115	82
83	Understand six sigma and other process control method (SPC) to control the process	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1373136557	75
84	Learning to use Crosslight software to simulate SLED structure and devices	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1373136557	109
88	To have strong knowledge on MOCVD tool.	40	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1598293097	72
94	To learn and pick up skills on making improvements.	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1598293097	72
95	Improvement of Customer Relationship	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1207021661	29
96	Customer experience management to oversees customer interactions	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1207021661	28
97	Learn from Vendor and through online information as well as the machine Menu provided.	20	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1941685512	95
99	- Communicate with impact\r\n   - Customers\r\n   - Management\r\n   - Managers\r\n   - Team members and fellow colleagues \r\n- Effective engagement \r\n- Efficient usage of leadership style, mainly directing, coaching, and supporting \r\n- Creating organizational values	34	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	539619816	71
100	- Organisational needs for disruptive performance compared to competitors\r\n- Effective Product roadmap \r\n- Efficient decision for successful project completion	33	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	539619816	90
101	-  Create the highest level of efficiency within the organization\r\n- administration of effective business practices \r\n-  services as efficiently as possible to maximize the profit of an organization.	11	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	539619816	14
102	- Presentation Preparation\r\n   - identify goal\r\n   - Know time limit\r\n   - Create value aids if necessary\r\n   - Write in the text about the lecture\r\n   - Memorise\r\n   - Practice\r\n\r\n- Understand the Audience \r\n- Engage the audience	11	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	539619816	17
103	-Ideas / Innovation\r\n- Strategy planning\r\n-Target / Goal\r\n-Leadership\r\n- Communication\r\n-Organisation\r\n-People / Team\r\n-Outcome\r\n-Success criteria\r\n-Profit	11	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	539619816	16
104	Knowledge\r\n - InP and related materials and devices\r\n - Attendance at international conferences to keep abreast on latest development in materials and device	20	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1557152765	82
105	Advance C# \r\n- To create application with higher and excellent performance	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1608216415	6
107	Be familiar with product issue diagnosis and debug \r\nSetup different test plan to analyse the issue	5	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	610693885	98
108	Leaning the data analysis software to improve the efficiency of data summarizing	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	2107825133	137
109	To improve the efficiency of problem solving and find out the root cause	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	2107825133	95
110	Database Management	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1352141850	31
111	Advance Program Management	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1352141850	103
106	Learn how to present a good program for DFB products and new product introduced	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1484926575	103
112	Data Modeling for defect Analysis	40	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1352141850	32
113	Understand the Fab A and Fab B process and their impact on the yield to deliver timely and correct analysis	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	1484926575	95
114	Data Analytics, being careful on the data integrity, cleaning the data if there is any noise.	40	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	10	31
115	Describe the problem clearly, form a team of expert, look for the root cause, and look for the corrective actions	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	10	95
116	Creating Test Plan, Execute the test carefully and in detail manner, Document the test steps.	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	10	115
117	\N	70	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	2125149271	137
\.


--
-- Data for Name: Trainings_surveytrainings; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Trainings_surveytrainings" (id, objectives_met, content_design, trainer_knowledge, training_relevance, recommend_training, training_id) FROM stdin;
\.


--
-- Data for Name: Trainings_trainingcourses; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Trainings_trainingcourses" (id, name, provider, cost, ratings, skill_category_id) FROM stdin;
\.


--
-- Data for Name: Trainings_trainings; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public."Trainings_trainings" (id, name, provider, cost, ratings, skill_category_id) FROM stdin;
\.


--
-- Data for Name: auth_access_token; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public.auth_access_token (id, token, expires, created_at, updated_at, user_id) FROM stdin;
2	tYVpP45ip4MX1B1p8NeFGcCpLm46NmkZrASR6p8V0Zg	2020-12-23 08:55:26.826574+00	2020-12-21 08:55:26.827472+00	2020-12-21 08:55:26.827501+00	364
3	-crFLH71IvUFxWCZCq4jBnDGcafKqEE8Kg35QjfKJ8E	2020-12-24 23:27:19.020865+00	2020-12-22 23:27:19.042664+00	2020-12-22 23:27:19.04279+00	364
4	Cf4hD24IzbowqFVBDZGCmvDjGI_gXqnUzZCXBVopCJI	2020-12-24 23:31:57.320455+00	2020-12-22 23:31:57.322196+00	2020-12-22 23:31:57.322248+00	364
5	szrMIegA-T_U3HqCJatA53F9gXEBWPe3FQ4LJP5fFq4	2020-12-24 23:44:00.617679+00	2020-12-22 23:44:00.620205+00	2020-12-22 23:44:00.62024+00	364
6	FjELxeFfHmHAohp0V67dnWXGiaNjLxC3T1ErW9U8otY	2020-12-24 23:46:12.507081+00	2020-12-22 23:46:12.509506+00	2020-12-22 23:46:12.509543+00	364
7	CPNYbLG8iqkPV6UFMiLNAaFcQQ--sFCzXqd0qpaPmPo	2020-12-24 23:52:47.110608+00	2020-12-22 23:52:47.112424+00	2020-12-22 23:52:47.11249+00	364
8	Ycow5SagZ8HKtSHSbXIR631YX4jcFYMp40Ajj2kxpxo	2020-12-24 23:59:24.178873+00	2020-12-22 23:59:24.180977+00	2020-12-22 23:59:24.181017+00	364
9	sE-1BRuN14TQaj9Rq5lfnJxCrLxpRaEJzU4taiIgB7o	2020-12-24 23:59:29.219788+00	2020-12-22 23:59:29.220497+00	2020-12-22 23:59:29.220528+00	364
10	U9mHMMcs7ChS6r5R5J8aBVjTcxZiA6B1LGgZvu9Xkrw	2020-12-25 00:01:54.058449+00	2020-12-23 00:01:54.059864+00	2020-12-23 00:01:54.059893+00	364
11	T1UXCoxNfV2y_4WC617DjwsWeaFJ6buHdwVlqJmZ6Cw	2020-12-25 00:04:24.582528+00	2020-12-23 00:04:24.584111+00	2020-12-23 00:04:24.584198+00	364
12	lIA-r-a4pJGdvBAMW7uboxT7aM4-rlpSWTab0I6l8_0	2020-12-25 00:08:20.922172+00	2020-12-23 00:08:20.924269+00	2020-12-23 00:08:20.924304+00	364
13	J5ueIffSp_5NpChxqH8QoguPyhgXWe5hwvp4Lo3GmZI	2020-12-25 00:10:09.797827+00	2020-12-23 00:10:09.79936+00	2020-12-23 00:10:09.799395+00	364
14	KZmg5yPMn7-YXhDz1cO-wwrHHkhDe0w5BOT49dzeHik	2020-12-25 00:11:04.314071+00	2020-12-23 00:11:04.314916+00	2020-12-23 00:11:04.314944+00	364
15	d5VyCIdsJ-TdzbgKQ4JF-WdXyuAW2R1sZ3iIClriw-I	2020-12-25 00:12:20.341364+00	2020-12-23 00:12:20.3435+00	2020-12-23 00:12:20.343552+00	364
16	O0iovA8U0j2uMX9gwoVbpWTJfxa6j_p71oRDuwTqmC0	2020-12-25 00:12:55.913634+00	2020-12-23 00:12:55.915044+00	2020-12-23 00:12:55.915075+00	364
17	RKb47Iny-vxvnuhbAanHA5uduWfii6EZp6X0_poItNA	2020-12-25 00:17:01.190131+00	2020-12-23 00:17:01.192355+00	2020-12-23 00:17:01.192387+00	364
18	CpYTFegD5_Tjk5nR2Yd1aVtQzoY3qfsaPA_yFL-OjEU	2020-12-25 00:25:04.733385+00	2020-12-23 00:25:04.735516+00	2020-12-23 00:25:04.735555+00	364
19	Jg98SjCjuqBSkXGphCB2B21w2Jqj-ElYGX1d_E7SFvU	2020-12-25 00:30:25.700366+00	2020-12-23 00:30:25.702195+00	2020-12-23 00:30:25.70223+00	364
20	0xpQuDaETnPG_rjJXGqZ2DPGJOdYEmbP6DkzpjoT2pk	2020-12-25 00:32:02.93345+00	2020-12-23 00:32:02.935469+00	2020-12-23 00:32:02.935501+00	364
21	ev66y6zEhIk56kZi0dXhd6qjHZjU3qqIsFNscJxPCIY	2020-12-25 00:33:30.727232+00	2020-12-23 00:33:30.728689+00	2020-12-23 00:33:30.728719+00	364
22	o0lhM2jc7S_Ov7f37DTK3VYYVN1YWTCWzFico_Xy_Fk	2020-12-25 00:40:15.888673+00	2020-12-23 00:40:15.892324+00	2020-12-23 00:40:15.892377+00	364
23	KqAEpzNzoOnZTeBw5aj3hVxCN0Lnrdqx0zZlzk9mgLg	2020-12-25 00:44:09.927486+00	2020-12-23 00:44:09.929424+00	2020-12-23 00:44:09.929472+00	364
24	Krm1EnT-9Pd15Vc3NEJYfQ5vPcw0NTFTXFby5OckUu4	2020-12-25 00:45:15.105133+00	2020-12-23 00:45:15.106604+00	2020-12-23 00:45:15.106635+00	364
25	EAKF6Cex7N5D1bXNFQwT5Axn9iQjH2ZPaWLykZf9kRM	2020-12-25 00:52:28.982823+00	2020-12-23 00:52:28.984913+00	2020-12-23 00:52:28.984963+00	364
26	YiHU8knSoGq7Tx3JFxyn3edACMVdGvNK34gHFu7o89U	2020-12-25 00:52:35.532586+00	2020-12-23 00:52:35.53395+00	2020-12-23 00:52:35.533978+00	364
27	ZGP_2cyqij6YRVTBevb7sTnjKm-T860SCACDvdtc4IA	2020-12-25 00:56:56.015052+00	2020-12-23 00:56:56.018426+00	2020-12-23 00:56:56.01851+00	364
28	yGIeWUyx11TyoIFFpAi1IeMNPHVIOL9tKN_VG3XUFtc	2020-12-25 00:57:45.82435+00	2020-12-23 00:57:45.82532+00	2020-12-23 00:57:45.825348+00	364
29	31LJoLMizT69k9gX83MZDg1g5CAlrbpiE4tw0xHsnL4	2020-12-25 00:58:22.558397+00	2020-12-23 00:58:22.560011+00	2020-12-23 00:58:22.560044+00	364
30	PzVV64KDYbMQ1TkEQUy48OuSMo2YRUG6W_ssRm-uHNs	2020-12-25 08:40:02.286144+00	2020-12-23 08:40:02.294296+00	2020-12-23 08:40:02.294332+00	364
31	ema79kvhp7b2Fz1haOvR5w698B_BUOoQAAII39C5sec	2020-12-25 10:15:53.417731+00	2020-12-23 10:15:53.418367+00	2020-12-23 10:15:53.418382+00	364
32	6tHNGPY4d4sJu8_myIf4DsTgVkevKemu0g-Uwc75r9A	2021-01-09 19:41:36.039879+00	2021-01-07 19:41:36.04074+00	2021-01-07 19:41:36.040763+00	257
33	vUx4v0CA6D2EZipFbXhQJhNfT4VwcBpw56slRwkRxFk	2021-01-09 19:48:21.022767+00	2021-01-07 19:48:21.023246+00	2021-01-07 19:48:21.023259+00	364
34	pwswNq8CBHBnQId8cysHwo8-OjdKoycix55jWFYQjGQ	2021-01-09 20:00:16.647273+00	2021-01-07 20:00:16.647726+00	2021-01-07 20:00:16.64774+00	365
35	_XF2_z7q3hWxG0IUPLsHNc3VlpXxNOcfQWlAO4xS9HY	2021-01-09 20:10:00.955531+00	2021-01-07 20:10:00.956164+00	2021-01-07 20:10:00.956189+00	365
36	M5snFCKB_spy8wLZuErdKLMM8qxQ3bvFN7Oq34J55A4	2021-01-09 20:16:05.373116+00	2021-01-07 20:16:05.373586+00	2021-01-07 20:16:05.373599+00	364
37	6Bu1KjwohgeEfTLOG3dSgU9wp1WF7suNGYRRrPe-JgA	2021-01-09 20:18:05.412907+00	2021-01-07 20:18:05.413289+00	2021-01-07 20:18:05.413302+00	257
38	sW6K8oZtfQXByq1sBVgLytl1CPsdxo15wSKB1qDJhYc	2021-01-09 20:40:48.129738+00	2021-01-07 20:40:48.130149+00	2021-01-07 20:40:48.130163+00	365
39	9gkffzOJbCNgBgWD8bXai3hBgcoqOiEC-bOHDI1ky0M	2021-01-09 20:46:51.521378+00	2021-01-07 20:46:51.521757+00	2021-01-07 20:46:51.52177+00	364
40	ijeKtUzLD-viQ1xoWMric4ySIa6-HFZ-rmgtq4EcRpA	2021-01-09 21:31:50.446692+00	2021-01-07 21:31:50.447255+00	2021-01-07 21:31:50.447269+00	364
41	Mkvk1pRW_MXRRhZ7aBwkMxtrKahngnXQ0TTW5dxfGRs	2021-01-09 21:41:41.977921+00	2021-01-07 21:41:41.978345+00	2021-01-07 21:41:41.978358+00	365
42	oev9-rHSEn1_l7MR9kzGZMnhBfcOMdnGtjJzy1UBZ34	2021-01-09 21:47:17.636463+00	2021-01-07 21:47:17.636986+00	2021-01-07 21:47:17.636999+00	364
43	0YypgbZEzp5qizh8XgSYIOR_R6MqtHoZuE39xio5ZoQ	2021-01-09 22:00:35.617942+00	2021-01-07 22:00:35.618349+00	2021-01-07 22:00:35.618362+00	365
44	v3fYxra_8FAqPyfp8Od-rSQBlhjCjQu9MiLfxJ3VAoc	2021-01-09 22:05:41.131348+00	2021-01-07 22:05:41.131804+00	2021-01-07 22:05:41.131817+00	364
45	bNOEQdvrnV2DulbuYf8p50NkT68eAEPKSyPId9d2VkU	2021-01-09 22:08:42.452027+00	2021-01-07 22:08:42.452511+00	2021-01-07 22:08:42.452527+00	365
46	w4uQKnhtM6jlCdcpLSo7OkW9oA1EZ-a0jTN_Jqhyl2c	2021-01-09 22:10:48.551062+00	2021-01-07 22:10:48.551469+00	2021-01-07 22:10:48.551482+00	364
47	fIsiDioI58nqfSCgfoZSdwmGAV3BCoMuJkh3FDuiZcA	2021-01-09 22:18:08.842787+00	2021-01-07 22:18:08.843169+00	2021-01-07 22:18:08.843181+00	364
48	yMRrfZEGukPtciQYPD3VvpGahRfW09YHnu0K6hCnGtk	2021-01-09 22:19:16.506941+00	2021-01-07 22:19:16.507345+00	2021-01-07 22:19:16.507361+00	365
49	r5ZcWPmwpie-FzCwPHusty65QrEx2hzVjSn31tHOYnE	2021-01-09 22:29:22.738978+00	2021-01-07 22:29:22.739454+00	2021-01-07 22:29:22.739468+00	364
50	x02DoDX_YILEzIJ6bCRpoXhbqUAqZlG8PIo2Vwm2M2I	2021-01-09 22:30:04.738984+00	2021-01-07 22:30:04.739789+00	2021-01-07 22:30:04.739817+00	365
51	nxmBinhijxmrIvYROuNc3RsM_v4CrgLxWEyKJEqM3do	2021-01-09 22:30:50.865487+00	2021-01-07 22:30:50.866283+00	2021-01-07 22:30:50.866309+00	364
52	eJfl_YJuJG2GcgjPZsLv9n8Jna-x_AGKXLT2CzboYxc	2021-01-09 22:31:31.664238+00	2021-01-07 22:31:31.664986+00	2021-01-07 22:31:31.665007+00	365
53	4WaL-PWchgnK7qMrRlIvTw9e7ULD49T8om2ol5FAJXU	2021-01-09 22:34:51.0348+00	2021-01-07 22:34:51.035378+00	2021-01-07 22:34:51.0354+00	364
54	8mQbKH3hZ8XCofYL9aW1gxESxlRHjiqEVrb9od8emaE	2021-01-09 22:37:44.82157+00	2021-01-07 22:37:44.82197+00	2021-01-07 22:37:44.821987+00	365
55	HY-efFoMOGTZPO0As2s-KlJaUipMEyTWwIepWjPqRVM	2021-01-09 22:40:42.326065+00	2021-01-07 22:40:42.326459+00	2021-01-07 22:40:42.326473+00	364
56	U1j8sagd8gCCh8r4y7btDcgmiC4btWgxbjV_HD4xgss	2021-01-09 22:56:31.046577+00	2021-01-07 22:56:31.047003+00	2021-01-07 22:56:31.047017+00	257
57	GA2zsWQDpOZJbnvmsbmN46r8brssT6eoeHQGKV-9Uz0	2021-01-09 23:25:50.663024+00	2021-01-07 23:25:50.663632+00	2021-01-07 23:25:50.663654+00	257
59	vKOeh48uUeuD8s5nGCSgYeNWhCFN-xoybAi4FB7VyPU	2021-01-10 00:19:17.725338+00	2021-01-08 00:19:17.725752+00	2021-01-08 00:19:17.725765+00	365
60	2c-icduOkJvexbZ4GYYALeTQpIohVxJKxeIdirbRM_M	2021-01-10 00:39:36.494209+00	2021-01-08 00:39:36.494739+00	2021-01-08 00:39:36.494753+00	364
94	CdukSMtyTVy_mCXopmnzws9akW95UiunOG9uaXyl25M	2021-01-10 00:54:54.875069+00	2021-01-08 00:54:54.875785+00	2021-01-08 00:54:54.875809+00	365
95	T4mf1k4Bvpbu5eZHPJfVRU67J9oxaTlF1PWtSU8eTmo	2021-01-10 01:00:14.741616+00	2021-01-08 01:00:14.742071+00	2021-01-08 01:00:14.742085+00	364
96	llLiIQB7LpAs38RW8K7vnTPwPfQW8QFlWWdmMyRoPGo	2021-01-10 01:05:45.881694+00	2021-01-08 01:05:45.882166+00	2021-01-08 01:05:45.882179+00	365
97	GaULGUiDJE73LiEfaNBp1aWXXoRn9dwwQhEQDGYLDEw	2021-01-10 01:08:28.788977+00	2021-01-08 01:08:28.789373+00	2021-01-08 01:08:28.789387+00	365
98	YP-fbinjsh7loEKn2eEq8V5w_psH4LmWtDx4QsYxFDc	2021-01-10 01:11:09.00369+00	2021-01-08 01:11:09.004129+00	2021-01-08 01:11:09.004141+00	364
133	4KH1W6x58sSxQavIBaMUhgPJzuks2OHszVRsImZWbS8	2021-01-10 01:28:01.663641+00	2021-01-08 01:28:01.664207+00	2021-01-08 01:28:01.664225+00	364
134	ssmYsLcmwHBemd-F1trQH-rWWhBW7MAEnluWEJV59Ww	2021-01-10 02:03:00.370925+00	2021-01-08 02:03:00.371307+00	2021-01-08 02:03:00.37132+00	365
135	FY8Ye2Q7_EbASqHwdssw_UcyRRkL142_psWNKRPz82o	2021-01-10 02:06:34.75286+00	2021-01-08 02:06:34.753429+00	2021-01-08 02:06:34.753443+00	364
136	tEPyzXANUL-oB-jjpsIW0wrFX7Px7osUdnGZvd9grTE	2021-01-10 02:07:52.434489+00	2021-01-08 02:07:52.434889+00	2021-01-08 02:07:52.434902+00	365
137	48KdNU-PSGfM37jGco006yQMbTrOeruF5QWoLSITI_M	2021-01-10 02:09:15.564098+00	2021-01-08 02:09:15.564577+00	2021-01-08 02:09:15.564591+00	364
138	PSmKcZY3buVqE7ETEt9jFSQub3Wab12b4gp0XJfo0yA	2021-01-10 02:11:22.576531+00	2021-01-08 02:11:22.577053+00	2021-01-08 02:11:22.577076+00	365
139	Jo8hyYskXcJ0xrGHf_KWt1ItbxWnCMpch3u3JpFRkMs	2021-01-10 02:13:47.057105+00	2021-01-08 02:13:47.057526+00	2021-01-08 02:13:47.057541+00	364
140	5WBIwn4I65vr7ezCON8FiO4tAt1HF1_eizWrNCVBq5Q	2021-01-10 02:14:28.294754+00	2021-01-08 02:14:28.295143+00	2021-01-08 02:14:28.295156+00	365
141	4PfF9TRB2IyJhVojWrY54kdMVnMaAiYHfQJiu28NBb4	2021-01-10 02:15:42.268517+00	2021-01-08 02:15:42.26901+00	2021-01-08 02:15:42.269025+00	364
142	KrsoxuS2htu7GwzPOJCnzkdqzeiRR56D3SRumfeyJoI	2021-01-10 02:17:13.886966+00	2021-01-08 02:17:13.887415+00	2021-01-08 02:17:13.887428+00	365
144	9jTj15u6huieRoQ_gJ8jMM-wEFp4xOL0Cvl4yWhxHBA	2021-01-10 05:55:15.519659+00	2021-01-08 05:55:15.520181+00	2021-01-08 05:55:15.520204+00	364
145	h8YtfiIh7yw9dZDCvnpkothRUPFOt7-XQQmflhba0EM	2021-01-10 07:15:32.414264+00	2021-01-08 07:15:32.414759+00	2021-01-08 07:15:32.414775+00	365
146	q4f0zqPHU1xC0xU1j32H-_8e3YVHdOvQKV7zAd54ArI	2021-01-10 07:22:17.652172+00	2021-01-08 07:22:17.652684+00	2021-01-08 07:22:17.652699+00	364
147	g8pasL-iXMs8xsGvMy4xBclbCjAELbwlSJ8cCbw2fjY	2021-01-10 07:31:57.222899+00	2021-01-08 07:31:57.22335+00	2021-01-08 07:31:57.223363+00	365
148	OwIHfIrd8iyiJquSTIdlIVPW0QlY9qFQCjVQc-oy_9I	2021-01-10 07:36:55.750744+00	2021-01-08 07:36:55.751188+00	2021-01-08 07:36:55.751202+00	364
149	EwHiV-E76M3zuIwomVA6nJi5XbTAlJFRJmuqRcIjNxA	2021-01-10 07:40:28.094418+00	2021-01-08 07:40:28.099362+00	2021-01-08 07:40:28.099385+00	365
150	68VpA4_bAf7aBoCqIzPp6dYnN9ObIVYZEm9gXz0lfyk	2021-01-10 07:46:11.834153+00	2021-01-08 07:46:11.834509+00	2021-01-08 07:46:11.834521+00	364
151	3DyVGaK5NdahtoXw6sXtv0Ku2XDIGO1KCelUVSa9W-o	2021-01-10 07:47:49.846752+00	2021-01-08 07:47:49.847286+00	2021-01-08 07:47:49.8473+00	365
152	mvdaQbAJ2J4Ez6JI1H8oMfsocx3-PpB26lSRjP6pHeU	2021-01-10 07:50:09.668645+00	2021-01-08 07:50:09.669161+00	2021-01-08 07:50:09.669176+00	364
153	gnEIkKQg_OF1AKDUD3lZNpvG9Crke94ZgjdIQmsg7kE	2021-01-10 07:54:33.615532+00	2021-01-08 07:54:33.615957+00	2021-01-08 07:54:33.615971+00	365
154	kH_gKvsDS8TKZk4AX0Z-v1eIoLcv0SbBe5DJlN-qWCM	2021-01-10 07:56:33.384215+00	2021-01-08 07:56:33.384688+00	2021-01-08 07:56:33.384702+00	364
155	lNgPl9ZC5tfQgt6wPvsc3FDgdQGuWcYFjFhx5B6tD04	2021-01-10 07:58:33.635721+00	2021-01-08 07:58:33.636128+00	2021-01-08 07:58:33.636142+00	365
156	fchDAGQiLl8jbD9BEbVURu-1oO75dL5r1CPvpT0GjUw	2021-01-10 08:00:24.517155+00	2021-01-08 08:00:24.517805+00	2021-01-08 08:00:24.517825+00	364
157	9OZoz5-sktP9Lr0oDJCZRo77-01zFm_GbWCiJiOgNwc	2021-01-10 08:01:43.083383+00	2021-01-08 08:01:43.083815+00	2021-01-08 08:01:43.083828+00	365
158	FS8Hf5pc9e1YIB5suYELg1LR-p7TUUfVm5dB-FjA3iI	2021-01-10 08:06:45.724984+00	2021-01-08 08:06:45.725487+00	2021-01-08 08:06:45.725509+00	364
159	9evHznwkP7Cf8PAt8f1j-sq8Z9jlyOA-X-NUGIR7xcY	2021-01-10 08:09:54.098599+00	2021-01-08 08:09:54.098999+00	2021-01-08 08:09:54.099018+00	365
160	gq81Tbs0WTZbDqEC1QDdZkeiOzqs5-AMdq3JfXYCrAM	2021-01-10 08:10:55.639463+00	2021-01-08 08:10:55.639931+00	2021-01-08 08:10:55.639952+00	364
161	Bqe_xsV4oGAojQMFD4iz66E8NtylqWRHJ68f0O6dLak	2021-01-10 08:11:33.585366+00	2021-01-08 08:11:33.585832+00	2021-01-08 08:11:33.585848+00	365
162	btqSg5BG2lObGQPzNiqvOWFdLXvVmlcme7t880Z6zxs	2021-01-10 08:16:07.64297+00	2021-01-08 08:16:07.643502+00	2021-01-08 08:16:07.643515+00	364
163	Xa2z-EwDd4CX487hX3knA8zhpr6Vt7g8qw5i6PB6-6A	2021-01-10 19:18:12.775027+00	2021-01-08 19:18:12.77533+00	2021-01-08 19:18:12.775342+00	257
164	214iRpim7wNxWhw_kF3D_t_pNwQgucWWKE0kwEqio3I	2021-01-10 19:19:54.637676+00	2021-01-08 19:19:54.638148+00	2021-01-08 19:19:54.638166+00	365
165	ZajPd5kt0R54OjUIIHSAvOgNvUJtUbZxdJs18Guhszk	2021-01-10 19:25:02.736861+00	2021-01-08 19:25:02.737268+00	2021-01-08 19:25:02.737285+00	364
166	wu5Hv0SpI4q3U_Q0nH9EJuRQZ4a5Et8UEQh9wfc_od4	2021-01-10 19:54:56.707764+00	2021-01-08 19:54:56.70815+00	2021-01-08 19:54:56.708173+00	364
167	MQRq2gSDYYWlnvOvKXTcri78L9OZ0RyZosddxnGlhT0	2021-01-10 20:19:53.035169+00	2021-01-08 20:19:53.035619+00	2021-01-08 20:19:53.035637+00	364
169	upjfAAaxZ2sbxD18BC9_1Rb8rF0ZhG3nDWqMxNPjV6k	2021-01-10 20:41:19.704994+00	2021-01-08 20:41:19.7054+00	2021-01-08 20:41:19.705414+00	257
170	hO94hMH7SIQiUzsCZi0EqneoP9fyfVQCDrTvnH3HSqc	2021-01-11 14:40:51.318401+00	2021-01-09 14:40:51.318748+00	2021-01-09 14:40:51.318761+00	364
171	piZ-dJtWy_1JzReZ1EXth7YJ81ntF-H_TOFmlw1Q-aM	2021-01-11 21:22:19.922655+00	2021-01-09 21:22:19.923474+00	2021-01-09 21:22:19.923496+00	365
172	QtMEcjuSnk2zpGQAYJCQYsoSjTlX2k-E0ycsD16-ExY	2021-01-11 21:43:38.062705+00	2021-01-09 21:43:38.063162+00	2021-01-09 21:43:38.063181+00	364
173	Z6b2Ai6bT9ItzQHqkfL5-kt26R7t6mm6YNUWqjldbek	2021-01-11 22:08:38.573891+00	2021-01-09 22:08:38.574819+00	2021-01-09 22:08:38.574834+00	365
174	0QbEFTXGof36xd1czJLPfVrByEIcVBVCenO_yU5hK_U	2021-01-11 22:16:52.176225+00	2021-01-09 22:16:52.176679+00	2021-01-09 22:16:52.176694+00	364
175	zG-NN6iognMcKXo7ZvUPnLDnLqq5fSNF24IOk6NyGtg	2021-01-11 22:16:52.263453+00	2021-01-09 22:16:52.263825+00	2021-01-09 22:16:52.263838+00	364
176	FF1VEXKM2FMx8kSa57HrocfIdMflm9bomsj9aQzMjBI	2021-01-11 22:48:34.159788+00	2021-01-09 22:48:34.160234+00	2021-01-09 22:48:34.160248+00	364
177	iYTva-F_QSA6WHTsPpqUkLoaL8PhjEEfW32VSJ4JY8s	2021-01-11 22:58:04.315216+00	2021-01-09 22:58:04.315627+00	2021-01-09 22:58:04.31564+00	365
178	HBlZGJ-EX-jguyukjFzpy3dA6ZajHehTCxVFzaFnV3A	2021-01-11 23:09:04.819014+00	2021-01-09 23:09:04.819492+00	2021-01-09 23:09:04.819505+00	257
180	hyfFvfn3lLliuyG1mZNFBJk0cnLLPSF2kZAot32Wii0	2021-01-14 11:28:32.747252+00	2021-01-12 11:28:32.747639+00	2021-01-12 11:28:32.747659+00	365
181	k1DyRTNNsOOrCa3tG8-qCAG0yvBJwmQV_ZaIp7r_t3w	2021-01-15 16:17:28.973723+00	2021-01-13 16:17:28.974312+00	2021-01-13 16:17:28.974327+00	365
182	yT047mmemz2GXRxX3jhid74AWF0JAuWESXdmIqu0g9Q	2021-01-15 16:23:47.173298+00	2021-01-13 16:23:47.17371+00	2021-01-13 16:23:47.173723+00	364
184	ZQNoOjS-9VGvqad5PT-6TijnZyw7-2I8f306K89COi0	2021-01-15 19:07:49.699397+00	2021-01-13 19:07:49.700192+00	2021-01-13 19:07:49.700213+00	365
185	KlaTCUSXsxx3CRGZaxyeHTCjPnpAQhHkVONcD6iPezk	2021-01-15 19:45:52.906119+00	2021-01-13 19:45:52.906569+00	2021-01-13 19:45:52.906587+00	364
186	_piNTKG4d_HBL9L4AWSmjFIFYDd53FYgx6m66ibqSaM	2021-01-15 19:47:09.384435+00	2021-01-13 19:47:09.38487+00	2021-01-13 19:47:09.384885+00	365
187	m3ZiZrM3CTh81fH9IyFZnd1KVHebp3o6sXsnifg1RJI	2021-01-15 19:49:03.191453+00	2021-01-13 19:49:03.191855+00	2021-01-13 19:49:03.191868+00	364
189	W0Axr7s5P2eskBstqrYARu7p1SIpPQIV8iTXcqJWbE4	2021-01-15 20:17:58.742612+00	2021-01-13 20:17:58.744035+00	2021-01-13 20:17:58.744058+00	364
190	2oQPp6pHdyBZha61l6-1TZ1mKLg6dEuwIAma6eWN_w8	2021-01-15 20:18:43.601531+00	2021-01-13 20:18:43.601923+00	2021-01-13 20:18:43.601936+00	365
191	2lo5kqlWTC2krlradlZjVB-0LyU2tQzuprRkPC81dAw	2021-01-15 20:19:39.105811+00	2021-01-13 20:19:39.106221+00	2021-01-13 20:19:39.106234+00	364
192	T-8txc4sx_I4c5m8iMZsB5dHAVMfwisXW0WAmvuC8vc	2021-01-15 20:21:52.69408+00	2021-01-13 20:21:52.694455+00	2021-01-13 20:21:52.694467+00	365
194	zJALHZp1fGmaYiJwVhuMwoUyzHYMVSS4ZMoWIahQUaY	2021-01-15 20:44:14.686325+00	2021-01-13 20:44:14.686722+00	2021-01-13 20:44:14.686735+00	364
195	ZNfP8IgoywyHnm9qOD2BsopqQJYkFyhqBmr703OGcUc	2021-01-16 14:00:35.513986+00	2021-01-14 14:00:35.514386+00	2021-01-14 14:00:35.514407+00	365
196	Nyq9_6OpaQVpyivd16qUfmRy3XdihZmLxbpKkexc2AI	2021-01-16 14:01:22.391416+00	2021-01-14 14:01:22.392104+00	2021-01-14 14:01:22.392125+00	365
197	Ilb5EPm6MoaEyK23Upg4OWtrO48xj79HLtLc1xxoU-g	2021-01-16 14:38:37.268865+00	2021-01-14 14:38:37.269293+00	2021-01-14 14:38:37.269306+00	365
199	8NThmWtxrnGzJnbTx50OYyXD3XzcuJEFQHlaDT2ITS8	2021-01-17 07:26:18.794476+00	2021-01-15 07:26:18.794951+00	2021-01-15 07:26:18.794964+00	365
200	hlaKLGVtpqxQogX9_xNQxqQsqLVs0IoWC1drMEZu2co	2021-01-17 07:35:25.061876+00	2021-01-15 07:35:25.062763+00	2021-01-15 07:35:25.062786+00	365
201	CZeBrI1x91OroxZv8AOOmrkFFm_pFJYhDDf3SDU64aE	2021-01-17 07:58:19.143151+00	2021-01-15 07:58:19.143755+00	2021-01-15 07:58:19.143785+00	364
202	vjjJGTSjoamwuAhl0796pwWt33lJTHGTOE3wlJr0fi4	2021-01-17 08:14:44.787756+00	2021-01-15 08:14:44.78818+00	2021-01-15 08:14:44.788193+00	364
203	k4CHr8GK7g1TH3AY_-vOAbRLYRpUWPLq0fD603a0MtU	2021-01-17 11:41:49.58713+00	2021-01-15 11:41:49.587643+00	2021-01-15 11:41:49.587656+00	365
205	BzDRzIlOo8QYxoR4la7ZCMSMUwjc2V8mBQ05FcV60tc	2021-01-17 13:06:49.316652+00	2021-01-15 13:06:49.316977+00	2021-01-15 13:06:49.316989+00	365
206	qmX-64H6vAZKxAqVf6jiJPDM3cGCUzp9-bB3RZ3E53o	2021-01-18 05:49:46.370744+00	2021-01-16 05:49:46.371082+00	2021-01-16 05:49:46.371094+00	365
207	q_nkhZUJufWWd4zaa91ciU1I-J2oYkNjppjd8Wx2lqM	2021-01-18 21:18:44.975878+00	2021-01-16 21:18:44.976468+00	2021-01-16 21:18:44.976483+00	365
208	bxi0HEYhTosVw3yPK1qcMF4zOSEF5PWEjktNs8Pw0NY	2021-01-20 08:20:25.574+00	2021-01-18 08:20:25.574643+00	2021-01-18 08:20:25.574656+00	365
209	QgIrzrjEk4w17bZHnFauzkCO9ee-ePlsJC3fsV-5hu0	2021-01-20 08:22:50.032924+00	2021-01-18 08:22:50.033406+00	2021-01-18 08:22:50.033418+00	365
210	RCnNGJwNdOhTSfjpJEKNM962tK0aXFtTqLJPATgqOjY	2021-01-20 08:23:49.817451+00	2021-01-18 08:23:49.817878+00	2021-01-18 08:23:49.817902+00	365
211	HZJCh3GuK3dJckOStDBbZN3UJAEVHFedT1Bmnw70P_g	2021-01-20 08:25:34.501983+00	2021-01-18 08:25:34.5028+00	2021-01-18 08:25:34.50283+00	365
212	p0Sa5hAgvUSYSYjFpi6U8H90O3fsez73FLw0_cE79XQ	2021-01-20 08:31:45.460682+00	2021-01-18 08:31:45.461217+00	2021-01-18 08:31:45.46123+00	364
213	_gadFK2dTF--NEU3EjUGz0-AOzCovdl7YFlBmcMlSek	2021-01-20 08:35:45.327667+00	2021-01-18 08:35:45.328235+00	2021-01-18 08:35:45.328248+00	365
214	CV8jTY_whXCwnSp_Fxh2Pex_9y8OCdF7hRwvz2kn1O4	2021-01-20 08:39:04.755244+00	2021-01-18 08:39:04.755817+00	2021-01-18 08:39:04.755832+00	365
215	rdIlYTgxPQr_2j1oxjZyn3lKdH8e-X3hAcxAA6sMTYg	2021-01-20 08:40:24.543059+00	2021-01-18 08:40:24.543541+00	2021-01-18 08:40:24.543553+00	364
216	WqZReQv5hLc1vDtVVpPUYN40xjp6294gtm1SzmOJq9w	2021-01-20 08:41:42.346014+00	2021-01-18 08:41:42.346523+00	2021-01-18 08:41:42.346536+00	365
217	5NE7VTq6ji642tsYYo9WQKF-6v1QPuu52M1O5vdL21o	2021-01-20 08:47:07.305517+00	2021-01-18 08:47:07.306007+00	2021-01-18 08:47:07.306023+00	364
218	7FXnG_2_egnhIyJFlGiDvVWtswk2ae7AuE7J1BEeu4Q	2021-01-20 08:48:10.287917+00	2021-01-18 08:48:10.292494+00	2021-01-18 08:48:10.292517+00	365
219	vAWO0VE7JqUIxLo0jN4c90gj9ld0IH1QApPEwVGq0P4	2021-01-20 08:48:54.35312+00	2021-01-18 08:48:54.353608+00	2021-01-18 08:48:54.353622+00	364
220	CGr-mzbmYVs9jrgUPlAJbaeNWHVS3LBqCwHy-a2pQBQ	2021-01-20 08:52:38.750136+00	2021-01-18 08:52:38.750663+00	2021-01-18 08:52:38.750677+00	365
221	l83bGwJ9Cnjyyog7bNfClFLpW4uw1bd6HK8DNe8QwAc	2021-01-20 08:54:51.71453+00	2021-01-18 08:54:51.714965+00	2021-01-18 08:54:51.714977+00	364
222	KnVGDsgY2EXSE0Dch06010dNFbdAmC5TQJuAamHAZYo	2021-01-20 08:56:48.555452+00	2021-01-18 08:56:48.55592+00	2021-01-18 08:56:48.555934+00	365
223	Lc7QwHwPe-bJGSNeb8yTWVbsIc0yQ4ocSTXrsU3jibs	2021-01-20 14:36:04.271499+00	2021-01-18 14:36:04.272215+00	2021-01-18 14:36:04.272236+00	365
224	qLM2rqSAmmr9oMMhJspqpuyzZe3WmCpwOsa8s91Ua70	2021-01-20 14:47:25.912799+00	2021-01-18 14:47:25.913529+00	2021-01-18 14:47:25.913554+00	365
225	ffcW2gZJQ-FKKarsMQ_3YrTVvizcQKhVjLDkIumK2y4	2021-01-20 14:51:09.273015+00	2021-01-18 14:51:09.2735+00	2021-01-18 14:51:09.273514+00	365
226	yVm_mNPIggSkKRXAJVhw1d3bFQTtUhq7Jh24vCOHjA4	2021-01-20 14:53:11.847995+00	2021-01-18 14:53:11.848553+00	2021-01-18 14:53:11.848568+00	364
227	jZLcXBfwDuLiHEoucStG5FQXiiB2EJwXYiihVQfZRoI	2021-01-20 14:55:55.536471+00	2021-01-18 14:55:55.537023+00	2021-01-18 14:55:55.537038+00	365
228	P2R0_SrH5ytPXliEg4mRbYXAhPOw_JQ9bX0b31-AdkY	2021-01-20 14:57:00.541078+00	2021-01-18 14:57:00.541625+00	2021-01-18 14:57:00.541645+00	364
229	ZA0JhrXL_2ueI1qfhqRaCEOj4mkX69N3Re_8Mu8eK7A	2021-01-20 15:00:42.843107+00	2021-01-18 15:00:42.843674+00	2021-01-18 15:00:42.843687+00	365
230	GFoE9MxodjFrr5v0R8DRBLM-E6GKUOOQqTse7n8FE9k	2021-01-20 15:03:30.115443+00	2021-01-18 15:03:30.11593+00	2021-01-18 15:03:30.115944+00	364
231	QCDTMQJoBReywbmLT18veoFkqg3eOS0t8iMbRIdLOGA	2021-01-20 15:03:56.881048+00	2021-01-18 15:03:56.881702+00	2021-01-18 15:03:56.881717+00	365
232	IcJO38hBblLph8PAOQKhtslCy47SAhDhe8QyJJ1i4j8	2021-01-20 15:05:06.00352+00	2021-01-18 15:05:06.004046+00	2021-01-18 15:05:06.004064+00	364
233	rQCGJCvFMJjopyI2AExmgwS0BIlWKu_L3_sfVDo9TaI	2021-01-20 15:06:38.658657+00	2021-01-18 15:06:38.659228+00	2021-01-18 15:06:38.659243+00	365
234	zm33cyUSWQUvy_uI97IqmsukrUOb1ppS5xhNjVHs4ZM	2021-01-20 15:14:01.268624+00	2021-01-18 15:14:01.269485+00	2021-01-18 15:14:01.26951+00	364
235	mMWnKc65GlRqenxzsK2mVmSrojhdjuNKKcDhObacCrs	2021-01-20 15:15:38.753371+00	2021-01-18 15:15:38.753896+00	2021-01-18 15:15:38.75391+00	365
236	bdOjfvQm_l3nQvyANg7G0gJS2Jgjf2DMywDIAE-Rn5M	2021-01-20 15:17:05.886949+00	2021-01-18 15:17:05.887489+00	2021-01-18 15:17:05.887512+00	364
237	0sG2M8YwvobLFo1PLcltVrpuIB9X-GIVRodlPnziQVo	2021-01-20 15:21:08.469154+00	2021-01-18 15:21:08.469729+00	2021-01-18 15:21:08.469749+00	365
238	Yo_KAl7_Gp79uV_MiMyuCgYGqy46pyi-OgoC5LpxIRg	2021-01-20 15:23:33.2352+00	2021-01-18 15:23:33.235761+00	2021-01-18 15:23:33.235775+00	364
239	q75W-ay9adW1pJL0s_YLm4SGClXA4tj13F1IXhjakoA	2021-01-20 15:24:14.873572+00	2021-01-18 15:24:14.874158+00	2021-01-18 15:24:14.874177+00	365
240	tqjHlzMbGgb_zZc24bRs7QCGkw8Zciehg-df2_tJNRY	2021-01-20 17:52:50.700566+00	2021-01-18 17:52:50.701244+00	2021-01-18 17:52:50.701261+00	364
241	5hb-_31eq_bPwhNWxNxEQk3_Qdl9DINTd0V0mk6HkJ8	2021-01-21 07:19:13.393465+00	2021-01-19 07:19:13.394161+00	2021-01-19 07:19:13.394174+00	365
242	1pTu0wTbhRwXSmB9lAOvc9wroDTiBemL41gaL6sLIrA	2021-01-21 07:19:54.400981+00	2021-01-19 07:19:54.401498+00	2021-01-19 07:19:54.401512+00	365
243	CYCz2jF3yyRuacsGKc1X-yEKU1ORbkJBmX3QGsSbGnQ	2021-01-21 07:28:02.991351+00	2021-01-19 07:28:02.992256+00	2021-01-19 07:28:02.99228+00	365
244	04Dm4762bYmNxh_MBfUvV5UF36UoVq9HA48jedAGyh0	2021-01-21 07:31:26.202735+00	2021-01-19 07:31:26.203146+00	2021-01-19 07:31:26.203159+00	364
245	G15anqgzYTHQ_M69GcvvPU_ZF7qKVxpvKdFdB4G0uvo	2021-01-21 07:33:21.707499+00	2021-01-19 07:33:21.707992+00	2021-01-19 07:33:21.708005+00	364
277	OsaCa8xjFR8_jtXr19T5jMdrENK2AR3qgh6dVCx16EA	2021-01-21 07:37:52.075506+00	2021-01-19 07:37:52.07626+00	2021-01-19 07:37:52.076275+00	365
278	lP4Z9ee1xVElwib9fC5po1XT03J9pAIwq4vWppuj-1o	2021-01-21 07:38:11.984161+00	2021-01-19 07:38:11.984661+00	2021-01-19 07:38:11.984675+00	364
279	WDrBrOLow0Yphlt-mi1t2rrjYhjOG-yZ5zmGf-XUWp4	2021-01-21 07:47:03.112094+00	2021-01-19 07:47:03.112858+00	2021-01-19 07:47:03.112882+00	365
280	7MDSTITP2O092aGTf9vQPsRqbvj_M_xxRy8AuXaAk4I	2021-01-21 07:50:25.411334+00	2021-01-19 07:50:25.41175+00	2021-01-19 07:50:25.411763+00	364
281	GE-jatOiJNb0OL9i5DJabwZCGft3mciWNJk_Y8Tg7Wg	2021-01-21 07:53:41.972227+00	2021-01-19 07:53:41.972712+00	2021-01-19 07:53:41.972727+00	365
282	RYh58tVBZTsMRrpVZlkZFYpMJaiMAQEc3EAhND7mBWY	2021-01-21 07:55:16.395104+00	2021-01-19 07:55:16.395676+00	2021-01-19 07:55:16.395696+00	364
283	LyGbyIvY6xSV7l2_-_N5r2rnGRHfsA63-N0gbPwJaK8	2021-01-21 07:58:46.936024+00	2021-01-19 07:58:46.936446+00	2021-01-19 07:58:46.93646+00	365
284	chwzOxaSlvK-Sgq_zvFQnYpm40pFgQxgSfnnotUSYl0	2021-01-21 07:59:37.641931+00	2021-01-19 07:59:37.642365+00	2021-01-19 07:59:37.642379+00	365
285	PJ63GCk2eMeF62UkVUpZq_JYNIFybe71Z2c3hYrH1s0	2021-01-21 08:00:25.733157+00	2021-01-19 08:00:25.73357+00	2021-01-19 08:00:25.733584+00	364
286	-5KbdwtUQmCyJGknFc-Oh10Ag69NUkta0YiVChNZgmo	2021-01-21 08:04:37.086227+00	2021-01-19 08:04:37.086636+00	2021-01-19 08:04:37.086649+00	365
287	ySbWH-PbUvKnBeFm-NkyE_unHtesLR_QE-XE_rwtDg0	2021-01-21 08:30:16.157352+00	2021-01-19 08:30:16.15781+00	2021-01-19 08:30:16.157823+00	364
288	KfewbfWtSDkqjm1F7MZLsde8cwdkw1Jx0yHqOPf5II4	2021-01-21 08:30:45.13982+00	2021-01-19 08:30:45.140188+00	2021-01-19 08:30:45.1402+00	365
289	UZQeu2dOimhDICihJIhQGTCZApwNcoznMrSvYkrnEDc	2021-01-21 08:34:12.625709+00	2021-01-19 08:34:12.626098+00	2021-01-19 08:34:12.62611+00	365
290	NN4F05j13ZxZ1n24GHVCL8tGfaqxQ6z5W6YJZRkyaNI	2021-01-21 08:42:06.537047+00	2021-01-19 08:42:06.537501+00	2021-01-19 08:42:06.537516+00	365
291	kNkiJziawypeVxdxTNxY1ABPkMDpbX9V1Wp8OjRBzRc	2021-01-21 09:03:42.413538+00	2021-01-19 09:03:42.414+00	2021-01-19 09:03:42.414013+00	365
292	ORlgHiSMuNdbhrZjDrvFwZ2e77Lf9qc37fBl5vMvrs8	2021-01-21 09:09:16.916766+00	2021-01-19 09:09:16.917338+00	2021-01-19 09:09:16.917358+00	365
293	drq4P2h7iOEEyTsMlUuKPdoY2E4hIgkgx4OBCflkxQs	2021-01-21 09:12:04.669389+00	2021-01-19 09:12:04.669828+00	2021-01-19 09:12:04.669843+00	364
294	oxAELwkY6aTnd1G-RLEWequZv7HWSaynk_j8ApPgZlE	2021-01-21 09:14:23.598243+00	2021-01-19 09:14:23.598706+00	2021-01-19 09:14:23.59872+00	365
296	CslwoAy6Vy_R_Z1Py4t1YR8StoyQGXtNopMLGVt0kpc	2021-01-22 18:40:45.099141+00	2021-01-20 18:40:45.099599+00	2021-01-20 18:40:45.099613+00	365
297	Tdig82IuVdbSNlIdeuhia0prckzA63ALn6wRODPFZhw	2021-01-22 21:52:39.233125+00	2021-01-20 21:52:39.233832+00	2021-01-20 21:52:39.233846+00	365
299	npw4XAjricHVYPLTp6Pi3brTZbDfgSpKWHLdqeBaYVE	2021-01-23 16:17:54.076523+00	2021-01-21 16:17:54.076875+00	2021-01-21 16:17:54.076893+00	365
300	XS8jAH89Fj05HYBFVZceDbKAgPpSKZKapYBMnoOa_uo	2021-01-23 16:33:26.782198+00	2021-01-21 16:33:26.782773+00	2021-01-21 16:33:26.782787+00	365
301	F7nLspaVWUG2gE_qGGL-GYcua_JBXgMEe9d8x8EfwWA	2021-01-23 16:43:46.362085+00	2021-01-21 16:43:46.362829+00	2021-01-21 16:43:46.362843+00	365
304	yqo1ldISLcZJczVYv2OXgii15yX6xmDTyJZlZ7Io-zA	2021-01-23 18:13:53.010892+00	2021-01-21 18:13:53.011454+00	2021-01-21 18:13:53.011468+00	365
306	fEk-r49DrlyYXnA2xsrm3OfBM1k5XdNdpXWs58_j-Jo	2021-01-24 05:50:55.804142+00	2021-01-22 05:50:55.804589+00	2021-01-22 05:50:55.804603+00	364
307	UC2XpLOSrLUjJlvg17gyCQOBRpD8ROdeylovqQ2QZKc	2021-01-24 05:55:19.994712+00	2021-01-22 05:55:19.995143+00	2021-01-22 05:55:19.995155+00	365
309	93BmRb8viXW6hTA0aHnl4J5WF44FTMYzhwv2Y4XicGA	2021-01-24 07:08:38.435201+00	2021-01-22 07:08:38.435639+00	2021-01-22 07:08:38.435663+00	365
310	Al1MJVliZ7FjTOBVC8R43KLkIC99GCWed8RlXpbjxA4	2021-01-24 07:14:37.00369+00	2021-01-22 07:14:37.004141+00	2021-01-22 07:14:37.004162+00	365
311	w0bKjVMQ5AgA01a8GngyxQnVE3mqjdfIU1xNbsxdvmo	2021-01-24 07:19:11.433008+00	2021-01-22 07:19:11.43363+00	2021-01-22 07:19:11.433653+00	257
312	kpTTZKGw0g-_zr4fqPU8zmrBRLOhTtRLxVGJmY-EecI	2021-01-24 07:29:58.075302+00	2021-01-22 07:29:58.075949+00	2021-01-22 07:29:58.075971+00	365
313	lt0_jQEvpw4SvTZRZ_UkcN_ETzPawJE9oh-9cL2fnSg	2021-01-24 07:30:44.404242+00	2021-01-22 07:30:44.404783+00	2021-01-22 07:30:44.404797+00	364
314	ymtns_Xpt97GV21vLJDkCssQh5Sy6yaKSjbsBVewjvY	2021-01-24 11:17:41.364971+00	2021-01-22 11:17:41.365473+00	2021-01-22 11:17:41.365488+00	365
315	AbBNqGHz2k-js96p0eCz1Xj4_3HeoW2lHzzW1c3UftU	2021-01-24 12:20:40.347868+00	2021-01-22 12:20:40.348166+00	2021-01-22 12:20:40.348178+00	373
316	XlhnHdlrqwmLvHkZLBHaPrtyM-PppgXaTIxRgeixrEg	2021-01-24 23:46:12.080205+00	2021-01-22 23:46:12.080527+00	2021-01-22 23:46:12.080539+00	365
317	YJVk1vaZ26mmrjuIhfKDMgvBPlYddQDuS655y4QH33c	2021-01-24 23:49:18.441065+00	2021-01-22 23:49:18.441449+00	2021-01-22 23:49:18.441463+00	365
318	somy80FqGPmhk9Mn1WwR6g31ZVpHoQdqdGGucnUelRI	2021-01-25 01:07:29.505881+00	2021-01-23 01:07:29.506417+00	2021-01-23 01:07:29.506439+00	365
319	tDkxaa11XrE8EqkXdzLULlcWZVBjuELJlmF54B34Hu8	2021-01-26 11:13:26.304875+00	2021-01-24 11:13:26.305664+00	2021-01-24 11:13:26.305678+00	365
320	yOoNhvJxqYu8joguaFJzgNae3f0jY681tz8N-ZiWk2Q	2021-01-26 14:15:30.143712+00	2021-01-24 14:15:30.144303+00	2021-01-24 14:15:30.144316+00	365
321	DZEka8xhnd3kEXPmiURk4SUvCtxRGrPIkk1Vi4ygC5s	2021-01-26 16:45:36.344505+00	2021-01-24 16:45:36.345041+00	2021-01-24 16:45:36.345055+00	364
322	jlEPBPbrEGj8XZrd9ZnMroaEyUQRVJcglJIfYc3dZQg	2021-01-26 16:53:26.243338+00	2021-01-24 16:53:26.243809+00	2021-01-24 16:53:26.243823+00	365
323	XJfHdFG5WUgd_ZAdYJnKPruFe1fbtJBVtvI8Su2k8wU	2021-01-26 16:59:40.080305+00	2021-01-24 16:59:40.080883+00	2021-01-24 16:59:40.080905+00	364
324	Y1_EAItKfRCoQKU_Hjpy3efDMpzCcz5WMchqmxBe2ew	2021-01-26 18:14:57.490333+00	2021-01-24 18:14:57.490861+00	2021-01-24 18:14:57.490878+00	365
325	QLA0aRjbY-ncUYl4tTrhWy5TL1-4ZL_XkEXMfOfu7Rs	2021-01-26 19:02:28.536615+00	2021-01-24 19:02:28.537173+00	2021-01-24 19:02:28.537186+00	365
326	Kq3UNBA0EJnWXdjujra_rArTdg_jcVwGTI2OgdjDYmM	2021-01-26 19:14:03.351223+00	2021-01-24 19:14:03.351779+00	2021-01-24 19:14:03.351793+00	374
327	HByAr9adI5VBWJzV-ah9ultCGRoinLPCz5XbtSCclyY	2021-01-26 19:15:19.889281+00	2021-01-24 19:15:19.889704+00	2021-01-24 19:15:19.889716+00	257
328	5wbfQI9rNJRWq5loEWn1QxqtShuuBCc4emdc3NraWg4	2021-01-26 19:16:45.430514+00	2021-01-24 19:16:45.430958+00	2021-01-24 19:16:45.430973+00	257
329	vKBjfy3Gc6kk7DBuB8O1mXCNm1_MO2dUd_vzFbevQwE	2021-01-26 19:18:58.849249+00	2021-01-24 19:18:58.84966+00	2021-01-24 19:18:58.849673+00	257
330	UOAyTcrdnfyP2O7UcpOUSPAqFnVaNERhumVB1Uiet6g	2021-01-26 19:23:50.793488+00	2021-01-24 19:23:50.793939+00	2021-01-24 19:23:50.793958+00	257
331	aHHhToOxr22rulSRvteNAc34FLhnf9ghFPlUBxUet20	2021-01-26 19:26:23.321357+00	2021-01-24 19:26:23.321799+00	2021-01-24 19:26:23.321812+00	374
332	UOB5Qgx7Xk4jyJ5ImaZK3JaGRrIpjZ4jmeT0k0LVwow	2021-01-26 19:45:27.383064+00	2021-01-24 19:45:27.38354+00	2021-01-24 19:45:27.383554+00	374
333	c_s4Visz0-Ukz64Wy3z_0gJpCRaY4d4CZeP4rC2KbQ4	2021-01-26 19:56:56.709511+00	2021-01-24 19:56:56.710113+00	2021-01-24 19:56:56.710126+00	365
334	6oCxbzXKBN5GYdVe_z6YRkqNRryrrpx-6hS05jlPf0A	2021-01-26 20:06:02.692494+00	2021-01-24 20:06:02.692917+00	2021-01-24 20:06:02.692929+00	364
335	RA0_iHAz5Y7gp41Xe14-0eIILVZQJdQEVzGxaxrHcFE	2021-01-26 20:06:49.689921+00	2021-01-24 20:06:49.69041+00	2021-01-24 20:06:49.690424+00	365
336	IjcMWLj6sf2tCIUhjlNPwPu1R4u-Na7XtMf7qKEJ2QI	2021-01-26 20:09:44.914591+00	2021-01-24 20:09:44.914987+00	2021-01-24 20:09:44.915001+00	374
337	fRKZpewRVnAU-X-bUY-_GuMjkrRZ_mkUbYdXSF5o56A	2021-01-26 20:20:06.27491+00	2021-01-24 20:20:06.275358+00	2021-01-24 20:20:06.275372+00	364
338	5sAOMVeHoFHN8r72ea2OolQaluNjYQvWdUvlZXF7iZY	2021-01-26 20:23:42.542524+00	2021-01-24 20:23:42.542947+00	2021-01-24 20:23:42.54296+00	364
339	bi3qmWbI_TBp8ooUn2WnSBisDl4R-iSbRyPC2bgA6Dk	2021-01-26 20:29:18.293181+00	2021-01-24 20:29:18.293601+00	2021-01-24 20:29:18.293615+00	365
340	Xpfhd82JDyPrA-X0cL3HSjI1i4sZGR1XCeTuwQKfApM	2021-01-26 20:48:33.019484+00	2021-01-24 20:48:33.02021+00	2021-01-24 20:48:33.020242+00	364
341	L-pRpogctqrHs0N1xIE-Jnbx7QrpTjY23BvapLegKB0	2021-01-26 21:11:01.194132+00	2021-01-24 21:11:01.19461+00	2021-01-24 21:11:01.194623+00	365
342	ljo2HAqqYCaqiwf9uWag6mkjgpgNPBhHE66Zu0FDyKw	2021-01-26 21:29:56.556101+00	2021-01-24 21:29:56.556692+00	2021-01-24 21:29:56.556722+00	364
343	3-jclzmuOMaYl7BLEynMso2jTOBiOFI5W2J5IiBiJRw	2021-01-26 21:34:57.818805+00	2021-01-24 21:34:57.819203+00	2021-01-24 21:34:57.819216+00	365
344	GGNsrWhvNu24A2ZrQBxoCkw4xSGO8mXTc8y8B50zU34	2021-01-26 21:37:32.829525+00	2021-01-24 21:37:32.829918+00	2021-01-24 21:37:32.82993+00	365
345	Tk3LietQ7t8rosutPvKZ_USdMo4TFGrl0AE07Lr1my0	2021-01-26 21:38:26.651375+00	2021-01-24 21:38:26.651778+00	2021-01-24 21:38:26.651791+00	374
346	jbByGf8kcybmZlsqw5kin_6QWTxA7IT4D_SmbZiIycw	2021-01-26 21:43:11.144225+00	2021-01-24 21:43:11.145059+00	2021-01-24 21:43:11.145082+00	365
347	hofQlRCJp4agS5YpK50W8OKlAmqQIkiwJFRN3rTBWEs	2021-01-26 22:02:26.326382+00	2021-01-24 22:02:26.327108+00	2021-01-24 22:02:26.327131+00	365
348	IwfyQZvrSUJTGjmYcvMUmBx79spsPl-sXHiXH68BRBQ	2021-01-26 22:08:08.771751+00	2021-01-24 22:08:08.772124+00	2021-01-24 22:08:08.772138+00	364
349	O4EynfD84uU7GGcv4k2HVfXRXK29DJ8llAxNu5U1p9Q	2021-01-26 22:09:00.223654+00	2021-01-24 22:09:00.224024+00	2021-01-24 22:09:00.224037+00	374
350	dMDNUzynQGggNCbIw3OPuhjxroPwbdInFndQs7j0PVk	2021-01-26 22:15:55.979394+00	2021-01-24 22:15:55.97982+00	2021-01-24 22:15:55.979834+00	365
351	RSajxDeQIYuL2xeWr2IGQTR8n31EQr0wPwgZkqaJGvg	2021-01-26 22:25:47.38044+00	2021-01-24 22:25:47.380928+00	2021-01-24 22:25:47.380942+00	364
352	z4Q2GG09x9eX4_9RD2tTirHLiwTfPXCmFjp47ZhbsJY	2021-01-26 22:31:30.010541+00	2021-01-24 22:31:30.011088+00	2021-01-24 22:31:30.011102+00	374
353	H5J-gGyTcYxLXIhNDekAOvM4ESOTfDWdfjCOuTU_6Ro	2021-01-26 22:41:54.718103+00	2021-01-24 22:41:54.718675+00	2021-01-24 22:41:54.71869+00	365
354	uY9j0qRawU3eYNdVbEwRZhpwUOAd7O0t9lsJzbw4wy8	2021-01-26 22:43:32.852105+00	2021-01-24 22:43:32.852656+00	2021-01-24 22:43:32.85267+00	364
355	0O3BJLkHTpQaaK1oNlIS3uXkj_PCkuP5GRYgGrV8LAY	2021-01-26 22:43:41.033779+00	2021-01-24 22:43:41.034192+00	2021-01-24 22:43:41.034205+00	364
356	VKQgXOXPryFo2yKRFD7Tx_caqAapicxDjtOdh3cI5Ro	2021-01-26 22:51:07.767427+00	2021-01-24 22:51:07.767887+00	2021-01-24 22:51:07.767901+00	374
357	XxNRx8fI0zo6RHudaby8hEK93PLVWoBsJMQjpUrU8C4	2021-01-26 23:49:03.91854+00	2021-01-24 23:49:03.919098+00	2021-01-24 23:49:03.919112+00	257
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public.auth_group (id, name) FROM stdin;
1	HR manager
2	HR
5	Manager
3	Employee
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can view permission	1	view_permission
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add content type	3	add_contenttype
10	Can change content type	3	change_contenttype
11	Can delete content type	3	delete_contenttype
12	Can view content type	3	view_contenttype
13	Can add session	4	add_session
14	Can change session	4	change_session
15	Can delete session	4	delete_session
16	Can view session	4	view_session
17	Can add crontab	5	add_crontabschedule
18	Can change crontab	5	change_crontabschedule
19	Can delete crontab	5	delete_crontabschedule
20	Can view crontab	5	view_crontabschedule
21	Can add interval	6	add_intervalschedule
22	Can change interval	6	change_intervalschedule
23	Can delete interval	6	delete_intervalschedule
24	Can view interval	6	view_intervalschedule
25	Can add periodic task	7	add_periodictask
26	Can change periodic task	7	change_periodictask
27	Can delete periodic task	7	delete_periodictask
28	Can view periodic task	7	view_periodictask
29	Can add periodic tasks	8	add_periodictasks
30	Can change periodic tasks	8	change_periodictasks
31	Can delete periodic tasks	8	delete_periodictasks
32	Can view periodic tasks	8	view_periodictasks
33	Can add solar event	9	add_solarschedule
34	Can change solar event	9	change_solarschedule
35	Can delete solar event	9	delete_solarschedule
36	Can view solar event	9	view_solarschedule
37	Can add clocked	10	add_clockedschedule
38	Can change clocked	10	change_clockedschedule
39	Can delete clocked	10	delete_clockedschedule
40	Can view clocked	10	view_clockedschedule
41	Can add departments	11	add_departments
42	Can change departments	11	change_departments
43	Can delete departments	11	delete_departments
44	Can view departments	11	view_departments
45	Can add discard_ skills	12	add_discard_skills
46	Can change discard_ skills	12	change_discard_skills
47	Can delete discard_ skills	12	delete_discard_skills
48	Can view discard_ skills	12	view_discard_skills
49	Can add profile	13	add_profile
50	Can change profile	13	change_profile
51	Can delete profile	13	delete_profile
52	Can view profile	13	view_profile
53	Can add user	14	add_user
54	Can change user	14	change_user
55	Can delete user	14	delete_user
56	Can view user	14	view_user
57	Can add qualifications	15	add_qualifications
58	Can change qualifications	15	change_qualifications
59	Can delete qualifications	15	delete_qualifications
60	Can view qualifications	15	view_qualifications
61	Can add password reset	16	add_passwordreset
62	Can change password reset	16	change_passwordreset
63	Can delete password reset	16	delete_passwordreset
64	Can view password reset	16	view_passwordreset
65	Can add email confirmation	17	add_emailconfirmation
66	Can change email confirmation	17	change_emailconfirmation
67	Can delete email confirmation	17	delete_emailconfirmation
68	Can view email confirmation	17	view_emailconfirmation
69	Can add appraisal	18	add_appraisal
70	Can change appraisal	18	change_appraisal
71	Can delete appraisal	18	delete_appraisal
72	Can view appraisal	18	view_appraisal
73	Can add appraisal_ category	19	add_appraisal_category
74	Can change appraisal_ category	19	change_appraisal_category
75	Can delete appraisal_ category	19	delete_appraisal_category
76	Can view appraisal_ category	19	view_appraisal_category
77	Can add overall_ appraisal	20	add_overall_appraisal
78	Can change overall_ appraisal	20	change_overall_appraisal
79	Can delete overall_ appraisal	20	delete_overall_appraisal
80	Can view overall_ appraisal	20	view_overall_appraisal
81	Can add peer appraisal	21	add_peerappraisal
82	Can change peer appraisal	21	change_peerappraisal
83	Can delete peer appraisal	21	delete_peerappraisal
84	Can view peer appraisal	21	view_peerappraisal
85	Can add peer appraisal question	22	add_peerappraisalquestion
86	Can change peer appraisal question	22	change_peerappraisalquestion
87	Can delete peer appraisal question	22	delete_peerappraisalquestion
88	Can view peer appraisal question	22	view_peerappraisalquestion
89	Can add rating_ scale	23	add_rating_scale
90	Can change rating_ scale	23	change_rating_scale
91	Can delete rating_ scale	23	delete_rating_scale
92	Can view rating_ scale	23	view_rating_scale
93	Can add user_ appraisal_ list	24	add_user_appraisal_list
94	Can change user_ appraisal_ list	24	change_user_appraisal_list
95	Can delete user_ appraisal_ list	24	delete_user_appraisal_list
96	Can view user_ appraisal_ list	24	view_user_appraisal_list
97	Can add ticket	25	add_ticket
98	Can change ticket	25	change_ticket
99	Can delete ticket	25	delete_ticket
100	Can view ticket	25	view_ticket
101	Can add ticket_ comments	26	add_ticket_comments
102	Can change ticket_ comments	26	change_ticket_comments
103	Can delete ticket_ comments	26	delete_ticket_comments
104	Can view ticket_ comments	26	view_ticket_comments
105	Can add skill_category	27	add_skill_category
106	Can change skill_category	27	change_skill_category
107	Can delete skill_category	27	delete_skill_category
108	Can view skill_category	27	view_skill_category
109	Can add trainings	28	add_trainings
110	Can change trainings	28	change_trainings
111	Can delete trainings	28	delete_trainings
112	Can view trainings	28	view_trainings
113	Can add training_ courses	29	add_training_courses
114	Can change training_ courses	29	change_training_courses
115	Can delete training_ courses	29	delete_training_courses
116	Can view training_ courses	29	view_training_courses
117	Can add survey_ trainings	30	add_survey_trainings
118	Can change survey_ trainings	30	change_survey_trainings
119	Can delete survey_ trainings	30	delete_survey_trainings
120	Can view survey_ trainings	30	view_survey_trainings
121	Can add skills	31	add_skills
122	Can change skills	31	change_skills
123	Can delete skills	31	delete_skills
124	Can view skills	31	view_skills
125	Can add career_ discussion	32	add_career_discussion
126	Can change career_ discussion	32	change_career_discussion
127	Can delete career_ discussion	32	delete_career_discussion
128	Can view career_ discussion	32	view_career_discussion
129	Can add apply_ trainings	33	add_apply_trainings
130	Can change apply_ trainings	33	change_apply_trainings
131	Can delete apply_ trainings	33	delete_apply_trainings
132	Can view apply_ trainings	33	view_apply_trainings
133	Can add site	34	add_site
134	Can change site	34	change_site
135	Can delete site	34	delete_site
136	Can view site	34	view_site
137	Can add log entry	35	add_logentry
138	Can change log entry	35	change_logentry
139	Can delete log entry	35	delete_logentry
140	Can view log entry	35	view_logentry
141	Can add discard skills	36	add_discardskills
142	Can change discard skills	36	change_discardskills
143	Can delete discard skills	36	delete_discardskills
144	Can view discard skills	36	view_discardskills
145	Can add competencies	37	add_competencies
146	Can change competencies	37	change_competencies
147	Can delete competencies	37	delete_competencies
148	Can view competencies	37	view_competencies
149	Can add competency category	38	add_competencycategory
150	Can change competency category	38	change_competencycategory
151	Can delete competency category	38	delete_competencycategory
152	Can view competency category	38	view_competencycategory
153	Can add departmental competencies	39	add_departmentalcompetencies
154	Can change departmental competencies	39	change_departmentalcompetencies
155	Can delete departmental competencies	39	delete_departmentalcompetencies
156	Can view departmental competencies	39	view_departmentalcompetencies
157	Can add goal category	40	add_goalcategory
158	Can change goal category	40	change_goalcategory
159	Can delete goal category	40	delete_goalcategory
160	Can view goal category	40	view_goalcategory
161	Can add goals	41	add_goals
162	Can change goals	41	change_goals
163	Can delete goals	41	delete_goals
164	Can view goals	41	view_goals
165	Can add mid yr comment box	42	add_midyrcommentbox
166	Can change mid yr comment box	42	change_midyrcommentbox
167	Can delete mid yr comment box	42	delete_midyrcommentbox
168	Can view mid yr comment box	42	view_midyrcommentbox
169	Can add kpi	43	add_kpi
170	Can change kpi	43	change_kpi
171	Can delete kpi	43	delete_kpi
172	Can view kpi	43	view_kpi
173	Can add goal comment	44	add_goalcomment
174	Can change goal comment	44	change_goalcomment
175	Can delete goal comment	44	delete_goalcomment
176	Can view goal comment	44	view_goalcomment
177	Can add departmental goals	45	add_departmentalgoals
178	Can change departmental goals	45	change_departmentalgoals
179	Can delete departmental goals	45	delete_departmentalgoals
180	Can view departmental goals	45	view_departmentalgoals
181	Can add departmental goal comment	46	add_departmentalgoalcomment
182	Can change departmental goal comment	46	change_departmentalgoalcomment
183	Can delete departmental goal comment	46	delete_departmentalgoalcomment
184	Can view departmental goal comment	46	view_departmentalgoalcomment
185	Can add departmental competencies comment	47	add_departmentalcompetenciescomment
186	Can change departmental competencies comment	47	change_departmentalcompetenciescomment
187	Can delete departmental competencies comment	47	delete_departmentalcompetenciescomment
188	Can view departmental competencies comment	47	view_departmentalcompetenciescomment
189	Can add competency comment	48	add_competencycomment
190	Can change competency comment	48	change_competencycomment
191	Can delete competency comment	48	delete_competencycomment
192	Can view competency comment	48	view_competencycomment
193	Can add comment box	49	add_commentbox
194	Can change comment box	49	change_commentbox
195	Can delete comment box	49	delete_commentbox
196	Can view comment box	49	view_commentbox
197	Can add ticket comments	26	add_ticketcomments
198	Can change ticket comments	26	change_ticketcomments
199	Can delete ticket comments	26	delete_ticketcomments
200	Can view ticket comments	26	view_ticketcomments
201	Can add skill category	50	add_skillcategory
202	Can change skill category	50	change_skillcategory
203	Can delete skill category	50	delete_skillcategory
204	Can view skill category	50	view_skillcategory
205	Can add training courses	51	add_trainingcourses
206	Can change training courses	51	change_trainingcourses
207	Can delete training courses	51	delete_trainingcourses
208	Can view training courses	51	view_trainingcourses
209	Can add survey trainings	52	add_surveytrainings
210	Can change survey trainings	52	change_surveytrainings
211	Can delete survey trainings	52	delete_surveytrainings
212	Can view survey trainings	52	view_surveytrainings
213	Can add career discussion	53	add_careerdiscussion
214	Can change career discussion	53	change_careerdiscussion
215	Can delete career discussion	53	delete_careerdiscussion
216	Can view career discussion	53	view_careerdiscussion
217	Can add apply trainings	54	add_applytrainings
218	Can change apply trainings	54	change_applytrainings
219	Can delete apply trainings	54	delete_applytrainings
220	Can view apply trainings	54	view_applytrainings
221	Can add access token	55	add_accesstoken
222	Can change access token	55	change_accesstoken
223	Can delete access token	55	delete_accesstoken
224	Can view access token	55	view_accesstoken
225	Can add refresh token	56	add_refreshtoken
226	Can change refresh token	56	change_refreshtoken
227	Can delete refresh token	56	delete_refreshtoken
228	Can view refresh token	56	view_refreshtoken
229	Can add notification	57	add_notification
230	Can change notification	57	change_notification
231	Can delete notification	57	delete_notification
232	Can view notification	57	view_notification
233	Can add end yr comment box	58	add_endyrcommentbox
234	Can change end yr comment box	58	change_endyrcommentbox
235	Can delete end yr comment box	58	delete_endyrcommentbox
236	Can view end yr comment box	58	view_endyrcommentbox
237	Can add guide	59	add_guide
238	Can change guide	59	change_guide
239	Can delete guide	59	delete_guide
240	Can view guide	59	view_guide
241	Can add reset password token	60	add_resetpasswordtoken
242	Can change reset password token	60	change_resetpasswordtoken
243	Can delete reset password token	60	delete_resetpasswordtoken
244	Can view reset password token	60	view_resetpasswordtoken
\.


--
-- Data for Name: auth_refresh_token; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public.auth_refresh_token (id, token, created, updated, revoked, access_token_id, user_id) FROM stdin;
1	DsepwTE7xGDFAwaz_xC5g9oLkZh2u2n_42vw4uhZBII	2020-12-21 08:39:33.670703+00	2020-12-21 08:55:26.666232+00	2020-12-21 08:55:26.665905+00	\N	364
2	2QRuHgOUgK80R0BrNGJmC2_beSBl-5Hhg4w0cdkYgWs	2020-12-21 08:55:26.881727+00	2020-12-21 08:55:26.881764+00	\N	2	364
3	C44OMm_hO2yvkJNoiReM72-e1qh_mN1JtYINbiNzzWU	2020-12-22 23:27:19.113693+00	2020-12-22 23:27:19.113741+00	\N	3	364
4	W3w9EgTFDnWdyC8ZH6yqp4eduC4VtLkktZlT4hQtaUo	2020-12-22 23:31:57.363147+00	2020-12-22 23:31:57.363182+00	\N	4	364
5	E9da4UktUmeWNr6CpR0c2cVEQZ7KOaCPZ8nkVNSBCfI	2020-12-22 23:44:00.66667+00	2020-12-22 23:44:00.666757+00	\N	5	364
6	paahZxQJeplym-fz6To3u0TyjNZQlAOaxP28QISNp48	2020-12-22 23:46:12.536896+00	2020-12-22 23:46:12.536933+00	\N	6	364
7	unSy-tHHFtoHTbMm98XMCNuQAC7X3W0VXlCp84dmfYI	2020-12-22 23:52:47.141719+00	2020-12-22 23:52:47.141756+00	\N	7	364
8	APUb5gWxi76fED4vqTaaFh_3aMKQFIMWKSELwYGbQ_c	2020-12-22 23:59:24.222997+00	2020-12-22 23:59:24.223032+00	\N	8	364
9	8Ycv3-zur9GCeILU3WpgxvxcEeMw9-U-8iXRWyqmw4I	2020-12-22 23:59:29.250874+00	2020-12-22 23:59:29.250915+00	\N	9	364
10	GSg6LEv9HEw-68TXaALrJDGdcODwW6MTFKw3KRI2Ybk	2020-12-23 00:01:54.087628+00	2020-12-23 00:01:54.087668+00	\N	10	364
11	uOweuqnBKlihD51smfDW6kCuBJFC8B1YDt1CgEL5KTk	2020-12-23 00:04:24.61378+00	2020-12-23 00:04:24.613822+00	\N	11	364
12	AV-nJNMe2-3SaPYMfFf_xYzLAS4lNzaYaDTmqsE1PaY	2020-12-23 00:08:20.955017+00	2020-12-23 00:08:20.955057+00	\N	12	364
13	rpDNgPnlJIWq_ImVJ_ci6ES4PdUF5X-TKSPa9ffYsy8	2020-12-23 00:10:09.827409+00	2020-12-23 00:10:09.827444+00	\N	13	364
14	tQbz7RtRRjyKlQLZ4MklJtEmLkF4quDsOqc0-_Yn7hs	2020-12-23 00:11:04.352613+00	2020-12-23 00:11:04.352651+00	\N	14	364
15	-XtMIUFR-od6lKKDzybPzfimtl7adZE4ytHHj_pWJsU	2020-12-23 00:12:20.387366+00	2020-12-23 00:12:20.387403+00	\N	15	364
16	gT5mZy2O_9N2wBu3Id24mjTVV6IuI6MACOSdSoA2ekM	2020-12-23 00:12:55.94321+00	2020-12-23 00:12:55.94325+00	\N	16	364
17	vp1DM6dlBMBo1S0PkpTAFU4SZGkT2XN4VuQb1qvX7vs	2020-12-23 00:17:01.221161+00	2020-12-23 00:17:01.221198+00	\N	17	364
18	auyWTOxdwwlSnZvRBGJdhG3eGgiZKUHSCEOAc4HOHZk	2020-12-23 00:25:04.771775+00	2020-12-23 00:25:04.771812+00	\N	18	364
19	FKI_UHh5D7CES1RWT-U76XQa1R8A7Z2p-KP4yxEvxt4	2020-12-23 00:30:25.741679+00	2020-12-23 00:30:25.741716+00	\N	19	364
20	ZN0MeNCqohHF0BOkvmrVQ0AIWBzKXINAQQJdPb4e98c	2020-12-23 00:32:02.96538+00	2020-12-23 00:32:02.965421+00	\N	20	364
21	sYLQLtFOtZuXv3DXylCnEm-l7a9YwtmyLiEbMymny9k	2020-12-23 00:33:30.757356+00	2020-12-23 00:33:30.757396+00	\N	21	364
22	uyzPJgnC8lKuY9p7Q2B6KLJpqrOB_jdCj_hGEQ9ySUw	2020-12-23 00:40:15.945329+00	2020-12-23 00:40:15.945365+00	\N	22	364
23	RUR85hXoPz-vOZogTYuzVdGr2NcEqVo8bfc-62KIAtY	2020-12-23 00:44:09.973786+00	2020-12-23 00:44:09.97383+00	\N	23	364
24	qbbll_xFOkaseB6Nw278RuQSh5hkaV3VR6DCAE15Wb0	2020-12-23 00:45:15.136883+00	2020-12-23 00:45:15.13692+00	\N	24	364
25	hU6-cr946uRscNvAJVEcvRSERXc7XDD9YV3Nyh8t0X4	2020-12-23 00:52:29.02832+00	2020-12-23 00:52:29.028376+00	\N	25	364
26	gGSX6zkTDHdy8yeVmTX5OHSNdw2gfe5qDf_MCXA52Bk	2020-12-23 00:52:35.572977+00	2020-12-23 00:52:35.573014+00	\N	26	364
27	fBqr_-94U0QTSDG2fsmPLa8Cvt38Wyx_zyyTbLGmLyI	2020-12-23 00:56:56.05398+00	2020-12-23 00:56:56.054014+00	\N	27	364
28	NXEg4jqOwhI2mJP11X1t7z8DqLkzlYkCNI3m64722S4	2020-12-23 00:57:45.855063+00	2020-12-23 00:57:45.855145+00	\N	28	364
29	uBZchG1MbjAYI0caejmt--gDd_wWHLUXAQakRuLn3sU	2020-12-23 00:58:22.587557+00	2020-12-23 00:58:22.587591+00	\N	29	364
30	ZETnajU0z9u40kY1qOYL_uykRI3aT08UEm7avHH1la4	2020-12-23 08:40:02.36669+00	2020-12-23 08:40:02.36673+00	\N	30	364
31	6xeq5f1j4e3Cz-YTA0KEQbnXjuMbGm6Rk7UGq2SMFx4	2020-12-23 10:15:53.452894+00	2020-12-23 10:15:53.452916+00	\N	31	364
32	wEVHNQji_XeX0Uu45fO01p6xJC_2aVlWmidOi7dKgrQ	2021-01-07 19:41:36.043096+00	2021-01-07 19:41:36.043122+00	\N	32	257
33	KY4TJabVAenqR3n8ZK6vS3VNuo_NBhjBBFLF_nBH18Q	2021-01-07 19:48:21.024878+00	2021-01-07 19:48:21.024896+00	\N	33	364
34	F8cTA6eodZ6Rj_tOJBq04FzkgyiaUug21MEnaaYSzQw	2021-01-07 20:00:16.649451+00	2021-01-07 20:00:16.649474+00	\N	34	365
35	Q5MrDdhzk-sLVEvqTkohVY7J7pPooSTlq1GsMwdTBX0	2021-01-07 20:10:00.957858+00	2021-01-07 20:10:00.957876+00	\N	35	365
36	gF2pqR8WHADkP-8Kfq_MiPF70C8JnUQRNsTRAEWJuY8	2021-01-07 20:16:05.375152+00	2021-01-07 20:16:05.375171+00	\N	36	364
37	3iIr1bhkb1zkCD14UeQU2Om7V2ChVP2PsGnaDUJf0ZA	2021-01-07 20:18:05.41442+00	2021-01-07 20:18:05.414437+00	\N	37	257
38	bAAYQkXio8VYbv52oaDVWmERfsZ8MUQvKpU-_JBFWRM	2021-01-07 20:40:48.131358+00	2021-01-07 20:40:48.131375+00	\N	38	365
39	V-Rwetqgnlez12lKrCnMXofKd5OKPQkMoYqKvAYq3Ns	2021-01-07 20:46:51.522998+00	2021-01-07 20:46:51.523015+00	\N	39	364
40	g-hkodKOJ6zqCfZUX1E437C-JWx0m2YhN79KkxYVaM8	2021-01-07 21:31:50.453286+00	2021-01-07 21:31:50.453314+00	\N	40	364
41	j68ZZ66Y8e-0OE9_DquHxqaIlNzchwSEOt08jrp_QeE	2021-01-07 21:41:41.97989+00	2021-01-07 21:41:41.979908+00	\N	41	365
42	Yv0ua9haLbUBnPFy-XS--JWebo0JinAH6HNwJSXlI-g	2021-01-07 21:47:17.638389+00	2021-01-07 21:47:17.638406+00	\N	42	364
43	G6n9A43KxlSNFFDPYH_sbF2qMkxzEI2KGbaBZm9wdMA	2021-01-07 22:00:35.619795+00	2021-01-07 22:00:35.619818+00	\N	43	365
44	ccu54VrFQAjKxtrbPlTte2TtrCmyGIfgqnO3-sI1m_s	2021-01-07 22:05:41.133153+00	2021-01-07 22:05:41.13319+00	\N	44	364
45	fKT23Fn9KDNe-wwZZyIVnE8JUCvxQiacyrsh6ZVA1wc	2021-01-07 22:08:42.453913+00	2021-01-07 22:08:42.453931+00	\N	45	365
46	XxOdADnU7ivtx-Bqn8QDpNtSm4aF0TDfn-XGi8LhbDg	2021-01-07 22:10:48.552881+00	2021-01-07 22:10:48.552899+00	\N	46	364
47	fUM-nPApO62lEnKIMt2U85v-ceLUgvMQrIR4u4tfonQ	2021-01-07 22:18:08.844632+00	2021-01-07 22:18:08.844651+00	\N	47	364
48	5IGdOm7bU64s6meXu_m9UpHlZPXZ4PAKCTVUYSLHUNE	2021-01-07 22:19:16.508802+00	2021-01-07 22:19:16.508828+00	\N	48	365
49	m7gA_5XkRaVUOo-PWzAlnQrUQD5GFqI6QReqA0_D6DA	2021-01-07 22:29:22.741163+00	2021-01-07 22:29:22.741197+00	\N	49	364
50	Ajvm_LJlWRfg3oPIlwXJKzaVdCppBQPgSkU_Aze-1QY	2021-01-07 22:30:04.741596+00	2021-01-07 22:30:04.741613+00	\N	50	365
51	Ga9YQZJwcD6sUBk7TBQyrohEO-ryt6x3zpMiQOuKrLc	2021-01-07 22:30:50.868304+00	2021-01-07 22:30:50.868408+00	\N	51	364
52	fLWPtGRmyNODgvmCbmUnCtbaVpANW0BVaXtD246JGr0	2021-01-07 22:31:31.666675+00	2021-01-07 22:31:31.666701+00	\N	52	365
53	p-u40ptlHOWI8hdv4LSqOcSVm43xc8nQ1eNNJhzlAMA	2021-01-07 22:34:51.037463+00	2021-01-07 22:34:51.037489+00	\N	53	364
54	Cbbv27edO7E0Rb4FNuwE2C-7TCuKvy0TUOzRbh3AblI	2021-01-07 22:37:44.823516+00	2021-01-07 22:37:44.823544+00	\N	54	365
55	t8v3Xd9t4-G0bV6tAabXuFGQqF05rpsAw6sbvNCJCVI	2021-01-07 22:40:42.327804+00	2021-01-07 22:40:42.327821+00	\N	55	364
56	D0nXHPkD98rHMACOKmKLhNDZ621w6qiCastoEfrYJr4	2021-01-07 22:56:31.048496+00	2021-01-07 22:56:31.048514+00	\N	56	257
57	ft2GBkm7q8uD6hLHbJY3a30mNrjRt-hd6mKogqbEWkw	2021-01-07 23:25:50.665643+00	2021-01-07 23:25:50.665669+00	\N	57	257
59	SCt73u7B7aJRRan7APJRtW38BARMzyvY72J2x18Jqb4	2021-01-08 00:19:17.727255+00	2021-01-08 00:19:17.727279+00	\N	59	365
60	utsVyJDAnhSB8n5p8lu4BpvoMo-REiYXQwwIewPvXXM	2021-01-08 00:39:36.499877+00	2021-01-08 00:39:36.499908+00	\N	60	364
94	UBf6RHUOx5GokwKBlpYm9C2GUncoABioeYZ454zABMw	2021-01-08 00:54:54.877669+00	2021-01-08 00:54:54.877695+00	\N	94	365
95	RcvIXJSce9SYysOLMNS070151gDt5IU5_GVisXqNqsU	2021-01-08 01:00:14.743389+00	2021-01-08 01:00:14.743406+00	\N	95	364
96	zB9sLpvahQyCp-euAUQPlg9b45RThPzx_dYy0Z8Zl8o	2021-01-08 01:05:45.883752+00	2021-01-08 01:05:45.883774+00	\N	96	365
97	V53b_-lBQP0RE3quNAzS7bfskNRFagd_8YiA3YsvNr0	2021-01-08 01:08:28.790838+00	2021-01-08 01:08:28.790855+00	\N	97	365
98	q0OPjCft75bMmCJhpCZwoExO757f4b8vtBJ_aoCwxq8	2021-01-08 01:11:09.005838+00	2021-01-08 01:11:09.005863+00	\N	98	364
133	T_AenynW2GG5IbCM-leSRmXKRq9YDFHcUQFymAccYno	2021-01-08 01:28:01.666472+00	2021-01-08 01:28:01.666495+00	\N	133	364
134	EV4nc3CcUvtFqWsHMP7CXpclpJzYX2leEIwcoyEYY20	2021-01-08 02:03:00.372431+00	2021-01-08 02:03:00.37245+00	\N	134	365
135	C-w_OkMjkEyT0NqGf_KJbRN_vMX9WC_bmSnA3QBL40o	2021-01-08 02:06:34.754883+00	2021-01-08 02:06:34.7549+00	\N	135	364
136	7gLL2HwpNPkD8H5IduAS3WUnKr7OB6Vez0XoQRhlS40	2021-01-08 02:07:52.436413+00	2021-01-08 02:07:52.436433+00	\N	136	365
137	B_5KKRmuRfE2TM4CRsPpCWnFHnld5zmx0mNGvxuX_Tg	2021-01-08 02:09:15.565968+00	2021-01-08 02:09:15.565986+00	\N	137	364
138	pe-r8-rFSoMXnD1tNCUpdmOHp7kST43hlwVdcd0txtc	2021-01-08 02:11:22.578432+00	2021-01-08 02:11:22.578461+00	\N	138	365
139	6a0keWuqSpgbmTUDx3jPPYQREoOyclFB4Tiev8IRAvk	2021-01-08 02:13:47.058856+00	2021-01-08 02:13:47.058873+00	\N	139	364
140	n7okOfSN4_G7zseNmrUBSQGPbf5x7rdCplVtBz2shX8	2021-01-08 02:14:28.296106+00	2021-01-08 02:14:28.296122+00	\N	140	365
141	ykr_szEyXmfCz0e5r0tRDOIl4lkudkP0UrFrlzxw-X8	2021-01-08 02:15:42.270794+00	2021-01-08 02:15:42.270811+00	\N	141	364
142	Pf6xuxjPM3yYeiODkQBHOCyf_kLtWDM2W4zETn6xg-w	2021-01-08 02:17:13.889105+00	2021-01-08 02:17:13.889125+00	\N	142	365
144	ud5aRA_qcKfKZn52KvYoIXN7aBLgJwkr6blZkzTK7E8	2021-01-08 05:55:15.521839+00	2021-01-08 05:55:15.521857+00	\N	144	364
145	Yh0UgNvtGtM0pNA-L9Hx3CUhtLF6ehrWLYS7ShBkONw	2021-01-08 07:15:32.416415+00	2021-01-08 07:15:32.416434+00	\N	145	365
132	ZPkGJWXxWk_sTgNc05fMRWWMfpJ646KpnJi0cfwamro	2021-01-08 01:23:59.954317+00	2021-01-08 19:25:02.733656+00	2021-01-08 19:25:02.733445+00	\N	364
58	qlRqhQc5fwZSI5gS68tri9oq8YVmyIxCfUo3kxb9bbk	2021-01-08 00:12:56.126937+00	2021-01-08 19:54:56.704926+00	2021-01-08 19:54:56.704808+00	\N	364
143	RNBDIHJL7lroETIKHRfG6Q4R6pDXKKhDQDb3tc1-k3g	2021-01-08 02:19:41.491033+00	2021-01-08 20:19:53.03123+00	2021-01-08 20:19:53.031027+00	\N	364
146	UxoQELAurDb054NmDrkC82PuZOM_5uiUpevAjIadN5o	2021-01-08 07:22:17.6541+00	2021-01-08 07:22:17.654117+00	\N	146	364
147	fV61tx4QVMz3_gULiu6rFxTorIxFzBeSPd3LHk-jiyk	2021-01-08 07:31:57.22499+00	2021-01-08 07:31:57.225009+00	\N	147	365
148	9cgKW7oQYUKjtMyDfRrcHLpsy1WSSZ9i7rUGFOKs9_4	2021-01-08 07:36:55.752696+00	2021-01-08 07:36:55.752716+00	\N	148	364
149	Gy7ka9X5D58oWl5X3gNjvPxXoA441H5EtGrwkoYrEbg	2021-01-08 07:40:28.101061+00	2021-01-08 07:40:28.101081+00	\N	149	365
150	TluIds_aO4Ldc-jCfD6UlZyiuQ3CbXcxQ1bMRQCGVUU	2021-01-08 07:46:11.835798+00	2021-01-08 07:46:11.835816+00	\N	150	364
151	8cggZH46TmSi-P5T7DJYAxocjhRfBdOD7pcccx38vTI	2021-01-08 07:47:49.849123+00	2021-01-08 07:47:49.849145+00	\N	151	365
152	2HipzwotJNfZW_5Irn26fkDTW5oCzENKP_FzB6XTGK4	2021-01-08 07:50:09.670427+00	2021-01-08 07:50:09.670445+00	\N	152	364
153	lowYyt5bcfzHV0tY59V72Yo2WecuIFcsha3ZgtUwyRE	2021-01-08 07:54:33.617173+00	2021-01-08 07:54:33.61719+00	\N	153	365
154	Et3BWbYf85L2CDPxLTpjjB23OyBAyMTmcqrQnCcOFec	2021-01-08 07:56:33.385826+00	2021-01-08 07:56:33.385843+00	\N	154	364
155	qG7PgUZxNMg5NUeZGgstOPTEolkLmj9IpJdgC56e0h4	2021-01-08 07:58:33.637721+00	2021-01-08 07:58:33.637739+00	\N	155	365
156	5OrO_geuhRKpWcplRCVaGcAIBronMIUJpQeJYytoH5Y	2021-01-08 08:00:24.519771+00	2021-01-08 08:00:24.519804+00	\N	156	364
157	sibAE9WYPwTYJgPD1GWMeKyTnQQxuNxsKzDNF8ZZDrQ	2021-01-08 08:01:43.085367+00	2021-01-08 08:01:43.085387+00	\N	157	365
158	srpGGJkuXPT-gzePqW_4PegipIQvwDG4hIWaGhBJ1Gg	2021-01-08 08:06:45.726889+00	2021-01-08 08:06:45.726907+00	\N	158	364
159	raiaP9vHqYvkp0J_440i81nu7kuKQmlK4ZPbhqE9e7M	2021-01-08 08:09:54.100179+00	2021-01-08 08:09:54.100196+00	\N	159	365
160	YrjG86kMreOwy7kQnfmOan3E5XIMJQURNMYLWqLxlsk	2021-01-08 08:10:55.641302+00	2021-01-08 08:10:55.641328+00	\N	160	364
161	51LLpLop1JXqDKoffI79IvAJS2Y0SZ97Fk9dGDM19KE	2021-01-08 08:11:33.587033+00	2021-01-08 08:11:33.587051+00	\N	161	365
162	7hiYRCxc_7VyuAAznzNwlOuWVUotYyX38CyH4oug8yg	2021-01-08 08:16:07.645276+00	2021-01-08 08:16:07.645297+00	\N	162	364
93	RxylZ0BOZZniQsQMgTv7NsW2U9DyHz2QsF6Hz5dHSfw	2021-01-08 00:51:46.546115+00	2021-01-08 19:18:12.77228+00	2021-01-08 19:18:12.77216+00	\N	257
163	KAAnypTugaO6uswPcMB6jm8W_Qvpak47uxQTvwoxZPk	2021-01-08 19:18:12.776299+00	2021-01-08 19:18:12.776316+00	\N	163	257
131	rQysaJa3OYf2nAOy2W4TssaD1fMzC84dAvUs6JCu0Ts	2021-01-08 01:19:06.38948+00	2021-01-08 19:19:54.634798+00	2021-01-08 19:19:54.634623+00	\N	365
164	bKIqUcOfrkHXxUoy6_6RLzZdizI4NyZwM2UMyS3ttU4	2021-01-08 19:19:54.639384+00	2021-01-08 19:19:54.639411+00	\N	164	365
165	jXRi_QIlMJMg7Q4egsSGVq0-Utw9H_HeooW-S7KuWsE	2021-01-08 19:25:02.738575+00	2021-01-08 19:25:02.738593+00	\N	165	364
166	CcoopYuRSRavTQGhANa_maOzME6khqWbQi7DsMbWAck	2021-01-08 19:54:56.709359+00	2021-01-08 19:54:56.709376+00	\N	166	364
167	91-tgI1V7Ly3o81bsDyGqqSTCLsS6a7RDVMZ_dZPSFI	2021-01-08 20:19:53.037084+00	2021-01-08 20:19:53.037108+00	\N	167	364
169	ya3_gtwt7rqAw4jYWSUuJffMr2lumqcY66GF-tceJ3A	2021-01-08 20:41:19.706707+00	2021-01-08 20:41:19.706725+00	\N	169	257
168	gKzE5WKJbqd9Wz4pzYGDMq7ubrZgZ5i5dkjZP-qM1RE	2021-01-08 20:38:05.834449+00	2021-01-09 14:40:51.312271+00	2021-01-09 14:40:51.312118+00	\N	364
170	in42tfnwKOauE_E5Aoh6xi_WCKlxBZaP_Un8WzXkRX4	2021-01-09 14:40:51.319973+00	2021-01-09 14:40:51.31999+00	\N	170	364
171	jxT9kDlZWTGMVQhHnRTs0yRN7o_QzklX5XVDi5RYmOc	2021-01-09 21:22:19.929695+00	2021-01-09 21:22:19.929733+00	\N	171	365
172	Ua65S-ipwYVZephbpYuokyyjDi3q6MkoMk9kU18Q0XM	2021-01-09 21:43:38.064691+00	2021-01-09 21:43:38.064708+00	\N	172	364
173	B9hPFHoA9AT7bn-oKpmuvSpGBFlgQ1DvJr9GFiU7vA8	2021-01-09 22:08:38.578492+00	2021-01-09 22:08:38.578509+00	\N	173	365
174	Uw3_PEiUFpnvH_FjRt2A3MOJ4xInUoNanfAlbzIMPXo	2021-01-09 22:16:52.177932+00	2021-01-09 22:16:52.177948+00	\N	174	364
175	WDkFJnnB3SAcWEG61GYW1L8gPJho-ycOIdpixTLYLBY	2021-01-09 22:16:52.264883+00	2021-01-09 22:16:52.264901+00	\N	175	364
176	UNJCKcXkm9AmoE7QfeZZwPNN6jRxRJapxdwE4sOlo1w	2021-01-09 22:48:34.16161+00	2021-01-09 22:48:34.161629+00	\N	176	364
177	nN53KdKEkbVidLqWtubfdseyOQaODJtm9yb-XNZuc9U	2021-01-09 22:58:04.317258+00	2021-01-09 22:58:04.317284+00	\N	177	365
178	1rGNrTkwV-MLlJke2w4VB-BKQgeM5WX4_cWrUeFFGtE	2021-01-09 23:09:04.825281+00	2021-01-09 23:09:04.825314+00	\N	178	257
179	OoC3HFnv1e4nHG9hRYNjhO7vTUzvrQm9lV_XV5MM3lA	2021-01-11 05:35:24.202124+00	2021-01-12 11:28:32.73745+00	2021-01-12 11:28:32.737326+00	\N	365
180	Ye_PV9nRFsmX6FMbl9NDiymJ2bemOf23YLP_F_U59dw	2021-01-12 11:28:32.749485+00	2021-01-12 11:28:32.749503+00	\N	180	365
181	eO-63WUlcTsOyOWZ8HJgT_H2fylCtHdWC1_PNTFHE7U	2021-01-13 16:17:28.992294+00	2021-01-13 16:17:28.992359+00	\N	181	365
182	_fi364lIEwz4cbpJKSB2xG-_nn_vEl9R_iSuB7L5ytI	2021-01-13 16:23:47.17517+00	2021-01-13 16:23:47.175186+00	\N	182	364
184	QXBXAZMLxN0UVnW38mkTdYxE4vcoLhciODxffUOZAxY	2021-01-13 19:07:49.703702+00	2021-01-13 19:07:49.703736+00	\N	184	365
185	NABnPWMlrxwc26Dr1nstCluO_VY00ZI8FMGsplse0aE	2021-01-13 19:45:52.908187+00	2021-01-13 19:45:52.908208+00	\N	185	364
186	kzlcpmWAPeb2CkEtwU6s8w4uhviyantQBtse02sWqow	2021-01-13 19:47:09.385999+00	2021-01-13 19:47:09.386015+00	\N	186	365
187	sd63NE4Cyq4Z6RSR1_pfyz1GnKAaRd2rODJ1EiXhFEQ	2021-01-13 19:49:03.193278+00	2021-01-13 19:49:03.193307+00	\N	187	364
189	t0gouQPNBFipLHHglz6Bqe_jXyBttxfzw29dAvpUtuM	2021-01-13 20:17:58.747041+00	2021-01-13 20:17:58.747063+00	\N	189	364
190	ZujYiCQ2Mck3c1hMrAlvDqu0hY99iXO2Loo7zjEmzFI	2021-01-13 20:18:43.60338+00	2021-01-13 20:18:43.603397+00	\N	190	365
191	f-_BcVZgHohPdwZ09isBHu7JXIN4aNeBL73EZGtKCRo	2021-01-13 20:19:39.107803+00	2021-01-13 20:19:39.107822+00	\N	191	364
192	RrzwU9NxjhqEm5y7fkl4bG5NC0LqJmqulgzGmesAtGc	2021-01-13 20:21:52.695545+00	2021-01-13 20:21:52.695571+00	\N	192	365
194	Qoi6Aj3UsLZrBcbehIExiqw4ov8JVj86RR4krjCKKGQ	2021-01-13 20:44:14.688134+00	2021-01-13 20:44:14.688151+00	\N	194	364
183	APx5Q-M8W3bTaNn1jZYROieY7gHthtApYUE6mh3beDU	2021-01-13 16:51:07.270748+00	2021-01-14 14:00:35.508963+00	2021-01-14 14:00:35.508794+00	\N	365
195	8GM9TK7x6fuyNjXwXb848ZW-9m5ABo5PefDC5SGYyLM	2021-01-14 14:00:35.516724+00	2021-01-14 14:00:35.516748+00	\N	195	365
188	HoupJeJPr0ZG-16j2y-y61JcbHLJXd2m6NhjhzSvSIk	2021-01-13 19:49:46.498312+00	2021-01-14 14:01:22.38311+00	2021-01-14 14:01:22.382978+00	\N	365
196	G17A25hEmixquXCeAxRQ1xnHU-6Ph8wyAGGM6SeDfUg	2021-01-14 14:01:22.393642+00	2021-01-14 14:01:22.393677+00	\N	196	365
193	Z2XAl8NYu36OvoqBa6sNsUPcoguHpKa8a-o751AUOBc	2021-01-13 20:22:34.566248+00	2021-01-14 14:38:37.265031+00	2021-01-14 14:38:37.264797+00	\N	365
197	ruRJ1z99h2YWhFcj_tpsLs28yxasFi5GZ_H7yQSUVWg	2021-01-14 14:38:37.272046+00	2021-01-14 14:38:37.272073+00	\N	197	365
199	vLdZJP7rbYTY1wnLTG_50j9DFSB9yX3GZukvnaxowMY	2021-01-15 07:26:18.797649+00	2021-01-15 07:26:18.797667+00	\N	199	365
200	3T48n1PdZtm5PquC8qMV1umPYbipm_irriWnMw2QU-Q	2021-01-15 07:35:25.06934+00	2021-01-15 07:35:25.069369+00	\N	200	365
201	_Kp7l-4RbQgjQgKrVE6dkr5UOdjy-sUUThazuTR4vXo	2021-01-15 07:58:19.149236+00	2021-01-15 07:58:19.149265+00	\N	201	364
202	0N1uUDFtzchvPq6Bm42j1XkTe1U4TQt_hyU9TJA_2xM	2021-01-15 08:14:44.794138+00	2021-01-15 08:14:44.794177+00	\N	202	364
203	DED2tDgdRkixt3C4VTyxP31fNvAVFHPi2MP_qyacMvw	2021-01-15 11:41:49.589427+00	2021-01-15 11:41:49.589444+00	\N	203	365
198	FNcWVdn9lu6u-VbMWgbx_7aYOIUQ-ruPFGKlNFgpcVc	2021-01-14 19:06:38.239198+00	2021-01-15 13:06:49.313767+00	2021-01-15 13:06:49.313623+00	\N	365
205	__lX5xE_JLPQyJNd55TcX1zuRkroz-pzOA1_rtct93w	2021-01-15 13:06:49.324339+00	2021-01-15 13:06:49.324364+00	\N	205	365
204	2SdNH_vLnnyaii935laLPWJBxDbVttz6bR_Bqx817Uk	2021-01-15 11:46:53.049077+00	2021-01-16 05:49:46.361225+00	2021-01-16 05:49:46.361102+00	\N	365
206	_nQAjfxp_tw9zXbBrY51AvVsBPiq5SZ6Q3Il0_Ca3bk	2021-01-16 05:49:46.372192+00	2021-01-16 05:49:46.372208+00	\N	206	365
207	6n0oDVcWBwMds-4oV6T-050yv1X3T0DAEvHHirFFBAY	2021-01-16 21:18:44.97865+00	2021-01-16 21:18:44.978669+00	\N	207	365
208	gD_gg8oBIr1b-1jke123S3mKXKYH_kZDPtrnbxb0fPQ	2021-01-18 08:20:25.583089+00	2021-01-18 08:20:25.583116+00	\N	208	365
209	cYXn1HFFa3AdthHWPxdz5wC4xtzRTQItVWmC2OoTrgA	2021-01-18 08:22:50.034943+00	2021-01-18 08:22:50.034959+00	\N	209	365
210	MnmxmC-o-O8S5FaJk0fpNqMVHSwBYwHzS0V5RXw9NEY	2021-01-18 08:23:49.81933+00	2021-01-18 08:23:49.819347+00	\N	210	365
211	32rKXnkeZ8ttQCge0EP9Y4DyiStd8HrT6ZoxypOdx2c	2021-01-18 08:25:34.505223+00	2021-01-18 08:25:34.505271+00	\N	211	365
212	WaJ8BbviVnL_sgCA5YsExEPFopNQXm8WR5B8i3AfBTs	2021-01-18 08:31:45.462948+00	2021-01-18 08:31:45.462973+00	\N	212	364
213	fQl5pYLnQJlW40f8fvWmvk2xTXdS_7a3Af523ox1q7Y	2021-01-18 08:35:45.330047+00	2021-01-18 08:35:45.330062+00	\N	213	365
214	zc4oYUEfMmFkI1I8R0zZPOghbu2W2I2e4Zgm6pKLJSI	2021-01-18 08:39:04.763383+00	2021-01-18 08:39:04.763412+00	\N	214	365
215	hQ8VkIQUaMKJvOG2l3227lZCZpd36LXN56CYJUgR8Lk	2021-01-18 08:40:24.545782+00	2021-01-18 08:40:24.545801+00	\N	215	364
216	ZWCI9AafHLOd3wvI9yHhf7rt73jnM8_yjN8-xXV0diE	2021-01-18 08:41:42.353302+00	2021-01-18 08:41:42.353329+00	\N	216	365
217	jtvGv7aHI35n2afTfxi6Z0gTx49-XPYZviaGWV_qcMU	2021-01-18 08:47:07.313121+00	2021-01-18 08:47:07.313145+00	\N	217	364
218	IbAjdt65ryGRh8CtCi3gyU6h4EYDmIWupppx6SPFJEo	2021-01-18 08:48:10.294376+00	2021-01-18 08:48:10.294392+00	\N	218	365
219	pkB5rzafRVaFiwcXnjakLJNStJVadBvlq5-wDIRByQk	2021-01-18 08:48:54.354825+00	2021-01-18 08:48:54.354841+00	\N	219	364
220	skHShfQPVkOZAIg94OROKmdBcn-sf-86yl2HKC7YfpI	2021-01-18 08:52:38.757247+00	2021-01-18 08:52:38.757275+00	\N	220	365
221	_Ix0Y2Ff3siW5FeqlsL2dLVOvcZx13mvHafNLernIaY	2021-01-18 08:54:51.71624+00	2021-01-18 08:54:51.716255+00	\N	221	364
222	tA1xHoSewz5Ck-__sb87uV3f87h7OnHrJ2LgwH_XInw	2021-01-18 08:56:48.557162+00	2021-01-18 08:56:48.557179+00	\N	222	365
223	FwlPMLmE2cxj7OEgvikuj4rvBq3Vui94lOqEYqiVsTU	2021-01-18 14:36:04.274259+00	2021-01-18 14:36:04.274277+00	\N	223	365
224	YAUSPr9QrofEKISYwfP8o2KX77dW8tj9e_o0HiWYRDM	2021-01-18 14:47:25.929015+00	2021-01-18 14:47:25.929043+00	\N	224	365
225	aRBoD6PTrxhWiBijF78zCOWL8OzTwiWPeey7nLKhExg	2021-01-18 14:51:09.282744+00	2021-01-18 14:51:09.282772+00	\N	225	365
226	x5dbRHDgzAOeEeO_pg33UvQrh6NPZWr3qbFzoM7BBh8	2021-01-18 14:53:11.852594+00	2021-01-18 14:53:11.852628+00	\N	226	364
227	nmcckdGpKt75UXo9EV_piBNMRdmJ7CBJPns6XskzRJk	2021-01-18 14:55:55.5455+00	2021-01-18 14:55:55.545528+00	\N	227	365
228	WoRi_kPcKU0iSEyT-tbrxNyvOjPWbjxeQtD1_7DUQnc	2021-01-18 14:57:00.548112+00	2021-01-18 14:57:00.548142+00	\N	228	364
229	YsBjhCg2FjMvAZpoh7mpmjktOcc0QdQYoj-xd-EcH3o	2021-01-18 15:00:42.848843+00	2021-01-18 15:00:42.848871+00	\N	229	365
230	q1yswDi7u3BEO8h1JlaBXrSO5XsdQmp-EO1FmwBzNN0	2021-01-18 15:03:30.121276+00	2021-01-18 15:03:30.121338+00	\N	230	364
231	DW5PgEMYSqz9znc1rMGhLqqRkR9Er_Li7xctcbfug1s	2021-01-18 15:03:56.883008+00	2021-01-18 15:03:56.883026+00	\N	231	365
232	bbiRURiuUj8sZNfGV0oTQKcrg5JZI1QQhHXYlT-Bk7g	2021-01-18 15:05:06.006227+00	2021-01-18 15:05:06.006254+00	\N	232	364
233	GYoeHayTRIaC00DLjCFNN_QEOuczxvvF3YKrtBSK90g	2021-01-18 15:06:38.665255+00	2021-01-18 15:06:38.665298+00	\N	233	365
234	hm6qcJGISc2YdcsiaE_50pk6PbofSr2L67YVR-QWCGw	2021-01-18 15:14:01.271864+00	2021-01-18 15:14:01.271887+00	\N	234	364
235	dPDH_oCdtOr9EywSCuKC1CSh3R_x6JBNUTexupxPbA4	2021-01-18 15:15:38.755644+00	2021-01-18 15:15:38.755664+00	\N	235	365
236	hBKJimTuoDMTewYA4-t7Lg_pSTl8PLsxmAEHLvuZX64	2021-01-18 15:17:05.889022+00	2021-01-18 15:17:05.889039+00	\N	236	364
237	duL43LxzPOSt9sPkkwg-IcT63eNnIenbFvi-lS0P0kM	2021-01-18 15:21:08.471318+00	2021-01-18 15:21:08.471334+00	\N	237	365
238	1wL5pSPa4a-EHukmzCT3vYRJJ2lZxcuKh6Xpy8PWu9I	2021-01-18 15:23:33.237421+00	2021-01-18 15:23:33.237439+00	\N	238	364
239	fbt5b_wNwVpN2sx52t_ldWK9BTyZXS1KWg3hfxzuWOQ	2021-01-18 15:24:14.875971+00	2021-01-18 15:24:14.875991+00	\N	239	365
240	w4AT_9Zej4H7Jc3dDOA7yZv-4pEDipNVefn883ceeyg	2021-01-18 17:52:50.703267+00	2021-01-18 17:52:50.703299+00	\N	240	364
241	iXdlvGawx2sQ6pM9H9Ph4HVaropCuOpkq4oAnWuYpt4	2021-01-19 07:19:13.402425+00	2021-01-19 07:19:13.402461+00	\N	241	365
242	RkVQeFPAjodR_P5ae8qeR5HCRGQPjy3P4n3DJYxK9Dk	2021-01-19 07:19:54.405081+00	2021-01-19 07:19:54.405107+00	\N	242	365
243	Ny6LIjG-UCSfyJCNtuvggLKQA-Mw_GPgWy1NfN3La6Y	2021-01-19 07:28:02.997608+00	2021-01-19 07:28:02.997639+00	\N	243	365
244	uqs01LSeY7S-Jpw1a74yaIfzZemzw9XwWIoqhMqnhMQ	2021-01-19 07:31:26.204601+00	2021-01-19 07:31:26.204619+00	\N	244	364
245	b0MH9PlBs3dE7i8uzH5YmQ0HjNXamXcPSjVfXSSDIw0	2021-01-19 07:33:21.713099+00	2021-01-19 07:33:21.713123+00	\N	245	364
277	SREK5hcef4h75sQKZydgwevk4RSPtB8G3e1-c6EfaBk	2021-01-19 07:37:52.0798+00	2021-01-19 07:37:52.079819+00	\N	277	365
278	szWUlpB-h6tA-iYsxh2PIcwdo4jxLs1sVRg-pEJ8t8A	2021-01-19 07:38:11.987597+00	2021-01-19 07:38:11.987619+00	\N	278	364
279	I0OSAqVnpHH7DkgT1cIIPnnvQeAovuFRv8U4GTT5Vjs	2021-01-19 07:47:03.115001+00	2021-01-19 07:47:03.115028+00	\N	279	365
280	UGX5uMZKDYp1HjCSO2EPOVbCCoRWA-seFEuWtMguoyE	2021-01-19 07:50:25.412903+00	2021-01-19 07:50:25.41292+00	\N	280	364
281	c-p0xXyIvZFxCdhopdwR3ahUlkJ6l1rdssxUFmMKfuY	2021-01-19 07:53:41.974224+00	2021-01-19 07:53:41.974243+00	\N	281	365
282	fYlZEcQcJuRVbXZB0PZWmKCw4jGWNpA25YX9Ys6fMuI	2021-01-19 07:55:16.39735+00	2021-01-19 07:55:16.397376+00	\N	282	364
283	MAdcqahMaesYKCjQb2LMktS9Qu2zWQ9DaS1f6HQ5HPE	2021-01-19 07:58:46.937882+00	2021-01-19 07:58:46.9379+00	\N	283	365
284	aUY0qZIuqjayfUNi7DeEKhNaVD8wk7Rlwwc9Am_9848	2021-01-19 07:59:37.643453+00	2021-01-19 07:59:37.64347+00	\N	284	365
285	FyW6Js07cQj6nBy1v-DoogZzjneFIhdPRAgVBazXRzs	2021-01-19 08:00:25.734689+00	2021-01-19 08:00:25.734706+00	\N	285	364
286	Op-M7hJLzowbnXTGTbG9YMqkj71QRB_1wgOcew8dyYM	2021-01-19 08:04:37.088029+00	2021-01-19 08:04:37.088046+00	\N	286	365
287	w4wtWMuQIg7wbPn7_TVdACMBZU262_bRIG6RVvTgbsA	2021-01-19 08:30:16.161166+00	2021-01-19 08:30:16.161186+00	\N	287	364
288	L2smooZ5MKZ5Fj5da0_cv4whixb_zRGSf9ehGToz3yI	2021-01-19 08:30:45.141179+00	2021-01-19 08:30:45.141195+00	\N	288	365
289	Gam4FYtPkxzjopSZjhiW3CkN8bOfjTNjLhJA-NMuEPA	2021-01-19 08:34:12.627565+00	2021-01-19 08:34:12.627584+00	\N	289	365
290	JCW88YRV1hKu7a2W3GL050DP-MEZ77AHKwKJTA_WBPs	2021-01-19 08:42:06.538979+00	2021-01-19 08:42:06.538997+00	\N	290	365
291	r-fudFlsixuLt3H6LqfATTfdI3tVyh57ouWNLhxxe5w	2021-01-19 09:03:42.415542+00	2021-01-19 09:03:42.415559+00	\N	291	365
292	wSO977ZzUOx6vIWUVJ8ICMmhteqxsy_Y_sKaO4QolTA	2021-01-19 09:09:16.919343+00	2021-01-19 09:09:16.919367+00	\N	292	365
293	MUcomCuI8Tc8vtiJ2KYqmXZ44aB3L1qQq418d8KeqNg	2021-01-19 09:12:04.671168+00	2021-01-19 09:12:04.671204+00	\N	293	364
294	5bP9OXg5QM-WuL2J8cSyQR2axARsWQcZHMtjkwz-oZg	2021-01-19 09:14:23.600006+00	2021-01-19 09:14:23.600022+00	\N	294	365
296	JLt4uDczWGkqgT1-fYLiDl1Vmit2VCnWJDoPqVPfIU4	2021-01-20 18:40:45.101064+00	2021-01-20 18:40:45.101094+00	\N	296	365
297	EjwnRYaTDNOLQThxV3fNExMgHrGsKgT-MtEpvzrBq6M	2021-01-20 21:52:39.239682+00	2021-01-20 21:52:39.239714+00	\N	297	365
295	gP0_IJJ1dM0mv91ipPDEo-3rmMHzhvkn4tu6GUwH66w	2021-01-20 18:06:41.791511+00	2021-01-21 16:17:54.073585+00	2021-01-21 16:17:54.073465+00	\N	365
299	USnC1DKroPWb8dKu_XbaHkW9uq7Od7qJ9vUSmveTvXo	2021-01-21 16:17:54.078018+00	2021-01-21 16:17:54.078043+00	\N	299	365
300	1-IP08bl_cK5tSqGiCKn2QLD26iVQxFkzL-r9-9-688	2021-01-21 16:33:26.785158+00	2021-01-21 16:33:26.785178+00	\N	300	365
301	qqpepK9hfCHb8446AtFCUt4k95nYpXGbnf4lGQPbp7o	2021-01-21 16:43:46.36936+00	2021-01-21 16:43:46.369382+00	\N	301	365
304	Hl1DbjoEj-_i0mRkH9EA0m6NRsR4hr0dxexUWIKaVOE	2021-01-21 18:13:53.013562+00	2021-01-21 18:13:53.013582+00	\N	304	365
306	k_gpmuNmJq4snrhDvGx104iEapPzNYGLnFegK--zDVo	2021-01-22 05:50:55.806277+00	2021-01-22 05:50:55.806294+00	\N	306	364
307	XHp4co5hC-uDR-zZub2DpindGeINgj8tmwVukN0ymwU	2021-01-22 05:55:19.996662+00	2021-01-22 05:55:19.99668+00	\N	307	365
309	gtjJwCGpGgtc1sPW4W_IB-YaPPvR9EiP-NGkHhWGAiM	2021-01-22 07:08:38.437266+00	2021-01-22 07:08:38.437293+00	\N	309	365
310	rKm1U-TqBxPyE7hAieVfeR4YygUBjL-aTBfITyzE7P8	2021-01-22 07:14:37.005663+00	2021-01-22 07:14:37.005681+00	\N	310	365
311	IrVqDe8qEOqpgrZR3J6HuRliDln-NxG9q8CcXK8MIH4	2021-01-22 07:19:11.435589+00	2021-01-22 07:19:11.435614+00	\N	311	257
312	qudfMrX8JhAvFtOdQ7BNx0moQr_SJ5R7k4qNuc1dJ0U	2021-01-22 07:29:58.078034+00	2021-01-22 07:29:58.078058+00	\N	312	365
313	C653e7iIkXiG7OjZMlNcjP-i65e3-h3sosdN-e1m_7s	2021-01-22 07:30:44.406196+00	2021-01-22 07:30:44.406214+00	\N	313	364
302	5Y7wBFqqR1q_L1t0t70i364_EzKAAj5lG54aHQLV0zU	2021-01-21 16:45:37.778848+00	2021-01-22 11:17:41.361367+00	2021-01-22 11:17:41.361143+00	\N	365
314	zJHmRoD2n13bK4c1lsi7NRcFSVD9BOxIjSESuGSfelQ	2021-01-22 11:17:41.366579+00	2021-01-22 11:17:41.366597+00	\N	314	365
305	BXSy-5Oxngo4LoJss_difpN1S-UqsD2jHmNCKKyD2U0	2021-01-21 18:17:45.282459+00	2021-01-22 12:20:40.345157+00	2021-01-22 12:20:40.345036+00	\N	373
315	qKHbEvpPt7VZNvjALlD0DOkkbxMQ4Q2qAdMX0SaWZa8	2021-01-22 12:20:40.349372+00	2021-01-22 12:20:40.349388+00	\N	315	373
298	WRvQX4SAekA03xtKGxMkzXso8OjpAicC6oucmpuXE98	2021-01-21 09:43:34.272719+00	2021-01-22 23:46:12.077536+00	2021-01-22 23:46:12.0774+00	\N	365
316	giWudNZgMC827Bt4HJA2UGp89ccCCxN1aHlXGTLKdyo	2021-01-22 23:46:12.0816+00	2021-01-22 23:46:12.081616+00	\N	316	365
303	O_LTgcpk5jpP9aWKy7sidJDlsAfwcTYyrKrfq4totYc	2021-01-21 17:00:55.460854+00	2021-01-22 23:49:18.437985+00	2021-01-22 23:49:18.437856+00	\N	365
317	X6fK3pXzvdDmP5VHgW6dQje6aAyKKB_X64mDCyXo4js	2021-01-22 23:49:18.442785+00	2021-01-22 23:49:18.44281+00	\N	317	365
308	uE1GCv9WvJu0YEtsSYHtZtR6CObqb6EG1DJds5jiKeA	2021-01-22 05:55:20.1153+00	2021-01-23 01:07:29.501602+00	2021-01-23 01:07:29.501406+00	\N	365
318	GRPLR-iYf5URNKhBLrNklJYGJZXY87s9ZPMrEpQcx4g	2021-01-23 01:07:29.508007+00	2021-01-23 01:07:29.508035+00	\N	318	365
319	cdXUgoGcjTR4Ro398r1GEDeO5wbnl3FUtX2gQeDAu9w	2021-01-24 11:13:26.314986+00	2021-01-24 11:13:26.315013+00	\N	319	365
320	Oqh5gVCNZZd5_F_iSmOajIzUS_rqfHXqfCmK4WspahE	2021-01-24 14:15:30.151748+00	2021-01-24 14:15:30.151775+00	\N	320	365
321	qHqOoZx9WJ2L7gJdkLCAAX8VXI2V53GYDJM4HugmVoY	2021-01-24 16:45:36.350171+00	2021-01-24 16:45:36.350196+00	\N	321	364
322	e4QienBIbFeEK0rWxoecE3m9mpB6ioexERtWK7vmqqo	2021-01-24 16:53:26.245833+00	2021-01-24 16:53:26.24585+00	\N	322	365
323	awUytc1fIVRqLHiyIjnbTy08X0BBZspC7ptQ_SqZy8U	2021-01-24 16:59:40.087426+00	2021-01-24 16:59:40.087444+00	\N	323	364
324	QMwFNp0i6jFuI3Zgg93vxau88HGwuV9zFSHZYZfvddg	2021-01-24 18:14:57.496576+00	2021-01-24 18:14:57.496599+00	\N	324	365
325	oavzUowW1tufOkF22Z84RPhK7vTQ5tIEwyySDBEWc8Q	2021-01-24 19:02:28.539498+00	2021-01-24 19:02:28.539517+00	\N	325	365
326	ijD8x4BJ8ZKOL_h47yIxjcivL-j5fo34TmaQs31cFco	2021-01-24 19:14:03.353922+00	2021-01-24 19:14:03.353938+00	\N	326	374
327	P8qFw5cIjgLdvzFkKupqpPbLYLbKxOXpjyLDzSJWMcY	2021-01-24 19:15:19.891444+00	2021-01-24 19:15:19.891475+00	\N	327	257
328	74nlBB_6Pj8h_lXVFM6fODLU5syftbLZezeG6YQB5wQ	2021-01-24 19:16:45.432792+00	2021-01-24 19:16:45.432811+00	\N	328	257
329	UikSyJONUISdMInOjREdaC8TMtXjs8STxf_P54Y-yLo	2021-01-24 19:18:58.851358+00	2021-01-24 19:18:58.851375+00	\N	329	257
330	VsTHXNQx-Vp-is8y4XhE6mYopWKpJKhcsanr09MPg5E	2021-01-24 19:23:50.795924+00	2021-01-24 19:23:50.795952+00	\N	330	257
331	zEbyhOghoXiUCgLYtZIVXOyO4d1jVvpsotB59_ADiVQ	2021-01-24 19:26:23.323292+00	2021-01-24 19:26:23.323311+00	\N	331	374
332	Cz0dpNSwDbIPVaZdGm8ZFAKMC8Gmzmxfl-wdOQ9-2r0	2021-01-24 19:45:27.385478+00	2021-01-24 19:45:27.385497+00	\N	332	374
333	slu2yvUg2g-ykFaUj0kIdXBpMiq5BVWe0-amyygyXM8	2021-01-24 19:56:56.712317+00	2021-01-24 19:56:56.712398+00	\N	333	365
334	b_sBjs-n20o8vmVVUsZfLEoCt3eNOFiTX4jPdICtnno	2021-01-24 20:06:02.694542+00	2021-01-24 20:06:02.694559+00	\N	334	364
335	3G3dbNfwCJOKIDB5shba18MNcpqbyoOoQd8602CTv2c	2021-01-24 20:06:49.692438+00	2021-01-24 20:06:49.692458+00	\N	335	365
336	ZjS9MKBzBkn275vKAq1P2uzAx7Dc5iAyPz_15WPK9zE	2021-01-24 20:09:44.918135+00	2021-01-24 20:09:44.918155+00	\N	336	374
337	FKdG7IV-Nw810wau2iQG-4AAk0d7w92dTU91C_-ewmc	2021-01-24 20:20:06.276894+00	2021-01-24 20:20:06.276911+00	\N	337	364
338	xd_ABzCNs7FEQUuOWxgpKsU-PKzvcGbvUC6pLWjc0Ik	2021-01-24 20:23:42.544485+00	2021-01-24 20:23:42.544504+00	\N	338	364
339	XobKDvdY77o2YNzdc-Jv3_H3hjHX5jiOwfD-cP-t1SE	2021-01-24 20:29:18.295036+00	2021-01-24 20:29:18.295052+00	\N	339	365
340	JKaspi93u7Psd4u2E7WZgh-bWWg2IkcIZl6OT9mQaZI	2021-01-24 20:48:33.024121+00	2021-01-24 20:48:33.024154+00	\N	340	364
341	tsFS1cHLovJJKCAKZq6EexPbdj0Sl96lF1LyWDYistY	2021-01-24 21:11:01.196157+00	2021-01-24 21:11:01.196175+00	\N	341	365
342	AmjGvG69sg69EyrBjyM1GpXCT8vEX5FE-hSCE9FNVXk	2021-01-24 21:29:56.558524+00	2021-01-24 21:29:56.558552+00	\N	342	364
343	NDAnFA2ip4gLCbit742reUVzUYMzVSXSjcpBI5Vpzbo	2021-01-24 21:34:57.820629+00	2021-01-24 21:34:57.820647+00	\N	343	365
344	tnJraB1Uhfm2DEdItbAEPlAafWd32jCZSSwVH3MZLVQ	2021-01-24 21:37:32.831325+00	2021-01-24 21:37:32.831342+00	\N	344	365
345	kGi5e9a-UnnMFNKWN54bC3B8fDfY_15K2zC_2dPX6MY	2021-01-24 21:38:26.653264+00	2021-01-24 21:38:26.653282+00	\N	345	374
346	yDDZouiEI4wU1JGwV0rVcCPWnEGVY_G3kZ7rp3LlYOc	2021-01-24 21:43:11.14769+00	2021-01-24 21:43:11.147721+00	\N	346	365
347	qIN-3mkOxFII0fL9csQd4bJhe-w4QelGUO9k4gRuN3A	2021-01-24 22:02:26.32989+00	2021-01-24 22:02:26.329916+00	\N	347	365
348	5KkPh3MDcuuqI7lGMDr6alifgjarVWr1YDbdd7yT3XM	2021-01-24 22:08:08.773613+00	2021-01-24 22:08:08.77363+00	\N	348	364
349	4LK6CNdlzBrScNV1rPzLkXcmrbnD_kKU5RpZNMapUbE	2021-01-24 22:09:00.225435+00	2021-01-24 22:09:00.225453+00	\N	349	374
350	rFhMx3boX2_uXO15mpYnEUAzjbHCCjkfLYil8tRgFck	2021-01-24 22:15:55.981213+00	2021-01-24 22:15:55.98123+00	\N	350	365
351	t9lx6NC_FpOgDCLlKXmwTnCSgc6FrYO-UNDOF3MLTEc	2021-01-24 22:25:47.382516+00	2021-01-24 22:25:47.382535+00	\N	351	364
352	ZNn7LsFTg0TOFICPA4WmXgXbFBfv4wrHyg8z3GhBngw	2021-01-24 22:31:30.013225+00	2021-01-24 22:31:30.013247+00	\N	352	374
353	zfQqdihC_Nu05rFTeSC7BjfzgJW161FfZ06mRrELveA	2021-01-24 22:41:54.725247+00	2021-01-24 22:41:54.725269+00	\N	353	365
354	8Y7xRVpUEGgSZbGq6KTccr42vD7iTbT4UeGENS3H1gg	2021-01-24 22:43:32.854613+00	2021-01-24 22:43:32.854633+00	\N	354	364
355	CMoqxJ379YbgnSTqzTb6Q0MWz8n_8bBkaogm1ju56oM	2021-01-24 22:43:41.035518+00	2021-01-24 22:43:41.035535+00	\N	355	364
356	EajithYceayvdPQmj-NEcOyOV_AXcZSxi-ltwlNB2uc	2021-01-24 22:51:07.769627+00	2021-01-24 22:51:07.769644+00	\N	356	374
357	ATj9Xa5cVQmEH4QmkQwDca1mvCocR9swrvRKYaNObrM	2021-01-24 23:49:03.924266+00	2021-01-24 23:49:03.924396+00	\N	357	257
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_clockedschedule; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public.django_celery_beat_clockedschedule (id, clocked_time, enabled) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_crontabschedule; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public.django_celery_beat_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year, timezone) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_intervalschedule; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public.django_celery_beat_intervalschedule (id, every, period) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_periodictask; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public.django_celery_beat_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id, solar_id, one_off, start_time, priority, headers, clocked_id, expire_seconds) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_periodictasks; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public.django_celery_beat_periodictasks (ident, last_update) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_solarschedule; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public.django_celery_beat_solarschedule (id, event, latitude, longitude) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	contenttypes	contenttype
4	sessions	session
5	django_celery_beat	crontabschedule
6	django_celery_beat	intervalschedule
7	django_celery_beat	periodictask
8	django_celery_beat	periodictasks
9	django_celery_beat	solarschedule
10	django_celery_beat	clockedschedule
11	Profile	departments
12	Profile	discard_skills
13	Profile	profile
14	Profile	user
15	Profile	qualifications
16	Profile	passwordreset
17	Profile	emailconfirmation
18	Appraisals	appraisal
19	Appraisals	appraisal_category
20	Appraisals	overall_appraisal
21	Appraisals	peerappraisal
22	Appraisals	peerappraisalquestion
23	Appraisals	rating_scale
24	Appraisals	user_appraisal_list
25	Ticketing	ticket
27	Trainings	skill_category
28	Trainings	trainings
29	Trainings	training_courses
30	Trainings	survey_trainings
31	Trainings	skills
32	Trainings	career_discussion
33	Trainings	apply_trainings
34	sites	site
35	admin	logentry
26	Ticketing	ticketcomments
36	Profile	discardskills
37	GnC	competencies
38	GnC	competencycategory
39	GnC	departmentalcompetencies
40	GnC	goalcategory
41	GnC	goals
42	GnC	midyrcommentbox
43	GnC	kpi
44	GnC	goalcomment
45	GnC	departmentalgoals
46	GnC	departmentalgoalcomment
47	GnC	departmentalcompetenciescomment
48	GnC	competencycomment
49	GnC	commentbox
50	Trainings	skillcategory
51	Trainings	trainingcourses
52	Trainings	surveytrainings
53	Trainings	careerdiscussion
54	Trainings	applytrainings
55	Profile	accesstoken
56	Profile	refreshtoken
57	Profile	notification
58	GnC	endyrcommentbox
59	Profile	guide
60	Profile	resetpasswordtoken
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-12-19 17:52:11.049278+00
2	contenttypes	0002_remove_content_type_name	2020-12-19 17:52:11.070775+00
3	auth	0001_initial	2020-12-19 17:52:11.095107+00
4	auth	0002_alter_permission_name_max_length	2020-12-19 17:52:11.128277+00
5	auth	0003_alter_user_email_max_length	2020-12-19 17:52:11.13375+00
6	auth	0004_alter_user_username_opts	2020-12-19 17:52:11.139184+00
7	auth	0005_alter_user_last_login_null	2020-12-19 17:52:11.145115+00
8	auth	0006_require_contenttypes_0002	2020-12-19 17:52:11.146634+00
9	auth	0007_alter_validators_add_error_messages	2020-12-19 17:52:11.15319+00
10	auth	0008_alter_user_username_max_length	2020-12-19 17:52:11.158857+00
11	auth	0009_alter_user_last_name_max_length	2020-12-19 17:52:11.16421+00
12	auth	0010_alter_group_name_max_length	2020-12-19 17:52:11.171066+00
13	auth	0011_update_proxy_permissions	2020-12-19 17:52:11.179252+00
14	auth	0012_alter_user_first_name_max_length	2020-12-19 17:52:11.185638+00
15	Profile	0001_initial	2020-12-19 17:52:11.310281+00
16	Appraisals	0001_initial	2020-12-19 17:52:11.376268+00
17	Appraisals	0002_auto_20201219_2321	2020-12-19 17:52:11.604771+00
18	Ticketing	0001_initial	2020-12-19 17:52:11.65642+00
20	admin	0001_initial	2020-12-19 17:52:11.800143+00
21	admin	0002_logentry_remove_auto_add	2020-12-19 17:52:11.815461+00
22	admin	0003_logentry_add_action_flag_choices	2020-12-19 17:52:11.827863+00
23	django_celery_beat	0001_initial	2020-12-19 17:52:11.848951+00
24	django_celery_beat	0002_auto_20161118_0346	2020-12-19 17:52:11.866242+00
25	django_celery_beat	0003_auto_20161209_0049	2020-12-19 17:52:11.877844+00
26	django_celery_beat	0004_auto_20170221_0000	2020-12-19 17:52:11.883132+00
27	django_celery_beat	0005_add_solarschedule_events_choices	2020-12-19 17:52:11.889552+00
28	django_celery_beat	0006_auto_20180322_0932	2020-12-19 17:52:11.91327+00
29	django_celery_beat	0007_auto_20180521_0826	2020-12-19 17:52:11.925844+00
30	django_celery_beat	0008_auto_20180914_1922	2020-12-19 17:52:11.948452+00
31	django_celery_beat	0006_auto_20180210_1226	2020-12-19 17:52:11.962042+00
32	django_celery_beat	0006_periodictask_priority	2020-12-19 17:52:11.969235+00
33	django_celery_beat	0009_periodictask_headers	2020-12-19 17:52:11.976517+00
34	django_celery_beat	0010_auto_20190429_0326	2020-12-19 17:52:12.204248+00
35	django_celery_beat	0011_auto_20190508_0153	2020-12-19 17:52:12.217255+00
36	django_celery_beat	0012_periodictask_expire_seconds	2020-12-19 17:52:12.227051+00
37	sessions	0001_initial	2020-12-19 17:52:12.233233+00
38	sites	0001_initial	2020-12-19 17:52:12.240418+00
39	sites	0002_alter_domain_unique	2020-12-19 17:52:12.246937+00
46	GnC	0001_initial	2020-12-19 19:24:11.139128+00
47	Ticketing	0002_auto_20201220_0054	2020-12-19 19:24:11.300033+00
48	Profile	0008_auto_20201220_0057	2020-12-19 19:27:20.17743+00
49	Profile	0009_auto_20201220_0100	2020-12-19 19:30:54.558917+00
50	Trainings	0001_initial	2020-12-19 19:40:10.156186+00
51	Profile	0002_auto_20201220_0203	2020-12-19 20:34:51.092477+00
52	Profile	0003_auto_20201221_1408	2020-12-21 08:39:27.550931+00
53	Profile	0004_auto_20201223_1700	2020-12-23 11:31:08.721701+00
54	Profile	0005_auto_20201223_1717	2020-12-23 11:50:45.550927+00
55	Profile	0006_auto_20201223_1721	2020-12-23 11:51:15.280008+00
56	Appraisals	0003_user_appraisal_list_end_yearm_rejection	2021-01-07 19:40:54.565876+00
57	Profile	0007_auto_20201227_0343	2021-01-07 19:40:55.094034+00
58	GnC	0002_auto_20201227_0343	2021-01-07 19:40:57.350671+00
59	GnC	0003_goals_status	2021-01-07 19:40:58.884726+00
60	GnC	0004_auto_20210107_1446	2021-01-07 19:41:00.268349+00
61	Profile	0008_auto_20201231_0225	2021-01-07 19:41:01.326557+00
62	Profile	0009_auto_20210102_1931	2021-01-07 19:41:01.846119+00
63	Profile	0010_auto_20210105_2219	2021-01-07 19:41:02.923766+00
64	Profile	0011_auto_20210105_2234	2021-01-07 19:41:04.551163+00
65	Profile	0012_auto_20210106_1705	2021-01-07 19:41:05.395818+00
66	Profile	0013_auto_20210107_1431	2021-01-07 19:41:06.838434+00
67	Profile	0014_auto_20210107_1446	2021-01-07 19:41:07.651926+00
68	GnC	0005_auto_20210123_2114	2021-01-24 11:11:13.610249+00
69	Profile	0015_auto_20210123_2114	2021-01-24 11:11:13.748997+00
70	Profile	0016_auto_20210124_1730	2021-01-24 12:19:41.244969+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
l3zx9s0eqinb5hqul68gir7vs7h9n3mh	.eJxVjMEOwiAQRP-FsyELlAIevfcbyLILtmpoUtqT8d9tkx40c5v3Zt4i4raOcWt5iROLqzDi8tslpGeuB-AH1vssaa7rMiV5KPKkTQ4z59ftdP8ORmzjvi5AirTrtGHbY4JAKZiefdFUrALb6T7YPYEAiIHBKMzeMwR2Fh2KzxfUCjdw:1kqill:fq80xNzV7tEgbsoNNwvORVEsChooO4-u8hvChu9Z_bY	2021-01-02 20:24:01.145891+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: denselight
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: Appraisals_appraisal_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Appraisals_appraisal_category_id_seq"', 6, true);


--
-- Name: Appraisals_appraisal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Appraisals_appraisal_id_seq"', 1, false);


--
-- Name: Appraisals_overall_appraisal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Appraisals_overall_appraisal_id_seq"', 56, true);


--
-- Name: Appraisals_peerappraisal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Appraisals_peerappraisal_id_seq"', 4, true);


--
-- Name: Appraisals_peerappraisalquestion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Appraisals_peerappraisalquestion_id_seq"', 1, false);


--
-- Name: Appraisals_rating_scale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Appraisals_rating_scale_id_seq"', 1, false);


--
-- Name: Appraisals_user_appraisal_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Appraisals_user_appraisal_list_id_seq"', 291, true);


--
-- Name: GnC_commentbox_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."GnC_commentbox_id_seq"', 1, false);


--
-- Name: GnC_competencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."GnC_competencies_id_seq"', 279, true);


--
-- Name: GnC_competencycategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."GnC_competencycategory_id_seq"', 10, true);


--
-- Name: GnC_competencycomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."GnC_competencycomment_id_seq"', 1, false);


--
-- Name: GnC_departmentalcompetencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."GnC_departmentalcompetencies_id_seq"', 48, true);


--
-- Name: GnC_departmentalcompetenciescomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."GnC_departmentalcompetenciescomment_id_seq"', 1, false);


--
-- Name: GnC_departmentalgoalcomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."GnC_departmentalgoalcomment_id_seq"', 1, false);


--
-- Name: GnC_departmentalgoals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."GnC_departmentalgoals_id_seq"', 19, true);


--
-- Name: GnC_endyrcommentbox_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."GnC_endyrcommentbox_id_seq"', 1, false);


--
-- Name: GnC_goalcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."GnC_goalcategory_id_seq"', 6, true);


--
-- Name: GnC_goalcomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."GnC_goalcomment_id_seq"', 3, true);


--
-- Name: GnC_goals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."GnC_goals_id_seq"', 524, true);


--
-- Name: GnC_kpi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."GnC_kpi_id_seq"', 720, true);


--
-- Name: GnC_midyrcommentbox_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."GnC_midyrcommentbox_id_seq"', 436, true);


--
-- Name: Profile_departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Profile_departments_id_seq"', 26, true);


--
-- Name: Profile_discard_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Profile_discard_skills_id_seq"', 1, false);


--
-- Name: Profile_guide_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Profile_guide_id_seq"', 11, true);


--
-- Name: Profile_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Profile_notification_id_seq"', 109, true);


--
-- Name: Profile_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Profile_profile_id_seq"', 2125149273, true);


--
-- Name: Profile_qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Profile_qualifications_id_seq"', 6, true);


--
-- Name: Profile_resetpasswordtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Profile_resetpasswordtoken_id_seq"', 7, true);


--
-- Name: Profile_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Profile_user_groups_id_seq"', 1, false);


--
-- Name: Profile_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Profile_user_id_seq"', 374, true);


--
-- Name: Profile_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Profile_user_user_permissions_id_seq"', 1, false);


--
-- Name: Ticketing_ticket_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Ticketing_ticket_comments_id_seq"', 1, false);


--
-- Name: Ticketing_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Ticketing_ticket_id_seq"', 1, false);


--
-- Name: Trainings_applytrainings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Trainings_applytrainings_id_seq"', 1, false);


--
-- Name: Trainings_careerdiscussion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Trainings_careerdiscussion_id_seq"', 1, false);


--
-- Name: Trainings_skillcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Trainings_skillcategory_id_seq"', 137, true);


--
-- Name: Trainings_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Trainings_skills_id_seq"', 119, true);


--
-- Name: Trainings_surveytrainings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Trainings_surveytrainings_id_seq"', 1, false);


--
-- Name: Trainings_trainingcourses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Trainings_trainingcourses_id_seq"', 1, false);


--
-- Name: Trainings_trainings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public."Trainings_trainings_id_seq"', 1, false);


--
-- Name: auth_access_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public.auth_access_token_id_seq', 357, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 5, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 244, true);


--
-- Name: auth_refresh_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public.auth_refresh_token_id_seq', 357, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public.django_celery_beat_clockedschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public.django_celery_beat_crontabschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public.django_celery_beat_intervalschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public.django_celery_beat_periodictask_id_seq', 1, false);


--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public.django_celery_beat_solarschedule_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 60, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 70, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denselight
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: Appraisals_appraisal_category Appraisals_appraisal_category_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_appraisal_category"
    ADD CONSTRAINT "Appraisals_appraisal_category_pkey" PRIMARY KEY (id);


--
-- Name: Appraisals_appraisal Appraisals_appraisal_employee_list_id_key; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_appraisal"
    ADD CONSTRAINT "Appraisals_appraisal_employee_list_id_key" UNIQUE (employee_list_id);


--
-- Name: Appraisals_appraisal Appraisals_appraisal_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_appraisal"
    ADD CONSTRAINT "Appraisals_appraisal_pkey" PRIMARY KEY (id);


--
-- Name: Appraisals_overall_appraisal Appraisals_overall_appraisal_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_overall_appraisal"
    ADD CONSTRAINT "Appraisals_overall_appraisal_pkey" PRIMARY KEY (id);


--
-- Name: Appraisals_peerappraisal Appraisals_peerappraisal_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_peerappraisal"
    ADD CONSTRAINT "Appraisals_peerappraisal_pkey" PRIMARY KEY (id);


--
-- Name: Appraisals_peerappraisalquestion Appraisals_peerappraisalquestion_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_peerappraisalquestion"
    ADD CONSTRAINT "Appraisals_peerappraisalquestion_pkey" PRIMARY KEY (id);


--
-- Name: Appraisals_rating_scale Appraisals_rating_scale_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_rating_scale"
    ADD CONSTRAINT "Appraisals_rating_scale_pkey" PRIMARY KEY (id);


--
-- Name: Appraisals_user_appraisal_list Appraisals_user_appraisal_list_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_user_appraisal_list"
    ADD CONSTRAINT "Appraisals_user_appraisal_list_pkey" PRIMARY KEY (id);


--
-- Name: GnC_commentbox GnC_commentbox_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_commentbox"
    ADD CONSTRAINT "GnC_commentbox_pkey" PRIMARY KEY (id);


--
-- Name: GnC_competencies GnC_competencies_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_competencies"
    ADD CONSTRAINT "GnC_competencies_pkey" PRIMARY KEY (id);


--
-- Name: GnC_competencycategory GnC_competencycategory_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_competencycategory"
    ADD CONSTRAINT "GnC_competencycategory_pkey" PRIMARY KEY (id);


--
-- Name: GnC_competencycomment GnC_competencycomment_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_competencycomment"
    ADD CONSTRAINT "GnC_competencycomment_pkey" PRIMARY KEY (id);


--
-- Name: GnC_departmentalcompetencies GnC_departmentalcompetencies_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_departmentalcompetencies"
    ADD CONSTRAINT "GnC_departmentalcompetencies_pkey" PRIMARY KEY (id);


--
-- Name: GnC_departmentalcompetenciescomment GnC_departmentalcompetenciescomment_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_departmentalcompetenciescomment"
    ADD CONSTRAINT "GnC_departmentalcompetenciescomment_pkey" PRIMARY KEY (id);


--
-- Name: GnC_departmentalgoalcomment GnC_departmentalgoalcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_departmentalgoalcomment"
    ADD CONSTRAINT "GnC_departmentalgoalcomment_pkey" PRIMARY KEY (id);


--
-- Name: GnC_departmentalgoals GnC_departmentalgoals_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_departmentalgoals"
    ADD CONSTRAINT "GnC_departmentalgoals_pkey" PRIMARY KEY (id);


--
-- Name: GnC_endyrcommentbox GnC_endyrcommentbox_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_endyrcommentbox"
    ADD CONSTRAINT "GnC_endyrcommentbox_pkey" PRIMARY KEY (id);


--
-- Name: GnC_goalcategory GnC_goalcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_goalcategory"
    ADD CONSTRAINT "GnC_goalcategory_pkey" PRIMARY KEY (id);


--
-- Name: GnC_goalcomment GnC_goalcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_goalcomment"
    ADD CONSTRAINT "GnC_goalcomment_pkey" PRIMARY KEY (id);


--
-- Name: GnC_goals GnC_goals_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_goals"
    ADD CONSTRAINT "GnC_goals_pkey" PRIMARY KEY (id);


--
-- Name: GnC_kpi GnC_kpi_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_kpi"
    ADD CONSTRAINT "GnC_kpi_pkey" PRIMARY KEY (id);


--
-- Name: GnC_midyrcommentbox GnC_midyrcommentbox_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_midyrcommentbox"
    ADD CONSTRAINT "GnC_midyrcommentbox_pkey" PRIMARY KEY (id);


--
-- Name: Profile_departments Profile_departments_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_departments"
    ADD CONSTRAINT "Profile_departments_pkey" PRIMARY KEY (id);


--
-- Name: Profile_discard_skills Profile_discard_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_discard_skills"
    ADD CONSTRAINT "Profile_discard_skills_pkey" PRIMARY KEY (id);


--
-- Name: Profile_guide Profile_guide_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_guide"
    ADD CONSTRAINT "Profile_guide_pkey" PRIMARY KEY (id);


--
-- Name: Profile_notification Profile_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_notification"
    ADD CONSTRAINT "Profile_notification_pkey" PRIMARY KEY (id);


--
-- Name: Profile_profile Profile_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_profile"
    ADD CONSTRAINT "Profile_profile_pkey" PRIMARY KEY (id);


--
-- Name: Profile_profile Profile_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_profile"
    ADD CONSTRAINT "Profile_profile_user_id_key" UNIQUE (user_id);


--
-- Name: Profile_qualifications Profile_qualifications_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_qualifications"
    ADD CONSTRAINT "Profile_qualifications_pkey" PRIMARY KEY (id);


--
-- Name: Profile_resetpasswordtoken Profile_resetpasswordtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_resetpasswordtoken"
    ADD CONSTRAINT "Profile_resetpasswordtoken_pkey" PRIMARY KEY (id);


--
-- Name: Profile_user_groups Profile_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_user_groups"
    ADD CONSTRAINT "Profile_user_groups_pkey" PRIMARY KEY (id);


--
-- Name: Profile_user_groups Profile_user_groups_user_id_group_id_75298deb_uniq; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_user_groups"
    ADD CONSTRAINT "Profile_user_groups_user_id_group_id_75298deb_uniq" UNIQUE (user_id, group_id);


--
-- Name: Profile_user Profile_user_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_user"
    ADD CONSTRAINT "Profile_user_pkey" PRIMARY KEY (id);


--
-- Name: Profile_user_user_permissions Profile_user_user_permis_user_id_permission_id_234c349a_uniq; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_user_user_permissions"
    ADD CONSTRAINT "Profile_user_user_permis_user_id_permission_id_234c349a_uniq" UNIQUE (user_id, permission_id);


--
-- Name: Profile_user_user_permissions Profile_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_user_user_permissions"
    ADD CONSTRAINT "Profile_user_user_permissions_pkey" PRIMARY KEY (id);


--
-- Name: Profile_user Profile_user_username_key; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_user"
    ADD CONSTRAINT "Profile_user_username_key" UNIQUE (username);


--
-- Name: Ticketing_ticketcomments Ticketing_ticket_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Ticketing_ticketcomments"
    ADD CONSTRAINT "Ticketing_ticket_comments_pkey" PRIMARY KEY (id);


--
-- Name: Ticketing_ticket Ticketing_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Ticketing_ticket"
    ADD CONSTRAINT "Ticketing_ticket_pkey" PRIMARY KEY (id);


--
-- Name: Trainings_applytrainings Trainings_applytrainings_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_applytrainings"
    ADD CONSTRAINT "Trainings_applytrainings_pkey" PRIMARY KEY (id);


--
-- Name: Trainings_careerdiscussion Trainings_careerdiscussion_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_careerdiscussion"
    ADD CONSTRAINT "Trainings_careerdiscussion_pkey" PRIMARY KEY (id);


--
-- Name: Trainings_skillcategory Trainings_skillcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_skillcategory"
    ADD CONSTRAINT "Trainings_skillcategory_pkey" PRIMARY KEY (id);


--
-- Name: Trainings_skills Trainings_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_skills"
    ADD CONSTRAINT "Trainings_skills_pkey" PRIMARY KEY (id);


--
-- Name: Trainings_surveytrainings Trainings_surveytrainings_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_surveytrainings"
    ADD CONSTRAINT "Trainings_surveytrainings_pkey" PRIMARY KEY (id);


--
-- Name: Trainings_trainingcourses Trainings_trainingcourses_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_trainingcourses"
    ADD CONSTRAINT "Trainings_trainingcourses_pkey" PRIMARY KEY (id);


--
-- Name: Trainings_trainings Trainings_trainings_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_trainings"
    ADD CONSTRAINT "Trainings_trainings_pkey" PRIMARY KEY (id);


--
-- Name: auth_access_token auth_access_token_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.auth_access_token
    ADD CONSTRAINT auth_access_token_pkey PRIMARY KEY (id);


--
-- Name: auth_access_token auth_access_token_token_key; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.auth_access_token
    ADD CONSTRAINT auth_access_token_token_key UNIQUE (token);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_refresh_token auth_refresh_token_access_token_id_key; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.auth_refresh_token
    ADD CONSTRAINT auth_refresh_token_access_token_id_key UNIQUE (access_token_id);


--
-- Name: auth_refresh_token auth_refresh_token_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.auth_refresh_token
    ADD CONSTRAINT auth_refresh_token_pkey PRIMARY KEY (id);


--
-- Name: auth_refresh_token auth_refresh_token_token_revoked_8be04cf3_uniq; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.auth_refresh_token
    ADD CONSTRAINT auth_refresh_token_token_revoked_8be04cf3_uniq UNIQUE (token, revoked);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_clockedschedule django_celery_beat_clockedschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule
    ADD CONSTRAINT django_celery_beat_clockedschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_crontabschedule django_celery_beat_crontabschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule
    ADD CONSTRAINT django_celery_beat_crontabschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_intervalschedule django_celery_beat_intervalschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule
    ADD CONSTRAINT django_celery_beat_intervalschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_name_key; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_name_key UNIQUE (name);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictasks django_celery_beat_periodictasks_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_celery_beat_periodictasks
    ADD CONSTRAINT django_celery_beat_periodictasks_pkey PRIMARY KEY (ident);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq UNIQUE (event, latitude, longitude);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solarschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solarschedule_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: Appraisals_appraisal_created_by_id_3e175c99; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Appraisals_appraisal_created_by_id_3e175c99" ON public."Appraisals_appraisal" USING btree (created_by_id);


--
-- Name: Appraisals_appraisal_manager_id_a46f0385; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Appraisals_appraisal_manager_id_a46f0385" ON public."Appraisals_appraisal" USING btree (manager_id);


--
-- Name: Appraisals_appraisal_rating_scale_id_9524c390; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Appraisals_appraisal_rating_scale_id_9524c390" ON public."Appraisals_appraisal" USING btree (rating_scale_id);


--
-- Name: Appraisals_appraisal_user_id_d49ce642; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Appraisals_appraisal_user_id_d49ce642" ON public."Appraisals_appraisal" USING btree (user_id);


--
-- Name: Appraisals_overall_appraisal_appraisal_category_id_a8a548aa; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Appraisals_overall_appraisal_appraisal_category_id_a8a548aa" ON public."Appraisals_overall_appraisal" USING btree (appraisal_category_id);


--
-- Name: Appraisals_peerappraisal_appraisal_id_28d7ec5a; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Appraisals_peerappraisal_appraisal_id_28d7ec5a" ON public."Appraisals_peerappraisal" USING btree (appraisal_id);


--
-- Name: Appraisals_peerappraisal_created_by_id_5d13bf1c; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Appraisals_peerappraisal_created_by_id_5d13bf1c" ON public."Appraisals_peerappraisal" USING btree (created_by_id);


--
-- Name: Appraisals_peerappraisal_manager_id_a1f5a6f1; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Appraisals_peerappraisal_manager_id_a1f5a6f1" ON public."Appraisals_peerappraisal" USING btree (manager_id);


--
-- Name: Appraisals_peerappraisal_viewer_id_e8b84916; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Appraisals_peerappraisal_viewer_id_e8b84916" ON public."Appraisals_peerappraisal" USING btree (viewer_id);


--
-- Name: Appraisals_peerappraisalquestion_appraisal_id_2b7db054; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Appraisals_peerappraisalquestion_appraisal_id_2b7db054" ON public."Appraisals_peerappraisalquestion" USING btree (appraisal_id);


--
-- Name: Appraisals_user_appraisal_list_appraisal_category_id_6c4ae8cd; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Appraisals_user_appraisal_list_appraisal_category_id_6c4ae8cd" ON public."Appraisals_user_appraisal_list" USING btree (appraisal_category_id);


--
-- Name: Appraisals_user_appraisal_list_employee_id_da7a4baa; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Appraisals_user_appraisal_list_employee_id_da7a4baa" ON public."Appraisals_user_appraisal_list" USING btree (employee_id);


--
-- Name: Appraisals_user_appraisal_list_manager_id_ecd68e59; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Appraisals_user_appraisal_list_manager_id_ecd68e59" ON public."Appraisals_user_appraisal_list" USING btree (manager_id);


--
-- Name: Appraisals_user_appraisal_list_overall_appraisal_id_ba7766ac; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Appraisals_user_appraisal_list_overall_appraisal_id_ba7766ac" ON public."Appraisals_user_appraisal_list" USING btree (overall_appraisal_id);


--
-- Name: GnC_commentbox_created_by_id_df525b3e; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_commentbox_created_by_id_df525b3e" ON public."GnC_commentbox" USING btree (created_by_id);


--
-- Name: GnC_commentbox_goal_id_833c2b5b; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_commentbox_goal_id_833c2b5b" ON public."GnC_commentbox" USING btree (goal_id);


--
-- Name: GnC_competencies_appraisal_id_4538b174; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_competencies_appraisal_id_4538b174" ON public."GnC_competencies" USING btree (appraisal_id);


--
-- Name: GnC_competencies_competency_category_id_307d3c08; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_competencies_competency_category_id_307d3c08" ON public."GnC_competencies" USING btree (competency_category_id);


--
-- Name: GnC_competencies_employee_id_82fd6ae3; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_competencies_employee_id_82fd6ae3" ON public."GnC_competencies" USING btree (employee_id);


--
-- Name: GnC_competencycomment_competency_id_06907da5; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_competencycomment_competency_id_06907da5" ON public."GnC_competencycomment" USING btree (competency_id);


--
-- Name: GnC_competencycomment_created_by_id_8a812ac8; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_competencycomment_created_by_id_8a812ac8" ON public."GnC_competencycomment" USING btree (created_by_id);


--
-- Name: GnC_departmentalcompetenci_departmental_competencies__246b8571; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_departmentalcompetenci_departmental_competencies__246b8571" ON public."GnC_departmentalcompetenciescomment" USING btree (departmental_competencies_id);


--
-- Name: GnC_departmentalcompetencies_appraisal_id_50414707; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_departmentalcompetencies_appraisal_id_50414707" ON public."GnC_departmentalcompetencies" USING btree (appraisal_id);


--
-- Name: GnC_departmentalcompetencies_competency_category_id_1f342b4e; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_departmentalcompetencies_competency_category_id_1f342b4e" ON public."GnC_departmentalcompetencies" USING btree (competency_category_id);


--
-- Name: GnC_departmentalcompetencies_department_id_0942dabc; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_departmentalcompetencies_department_id_0942dabc" ON public."GnC_departmentalcompetencies" USING btree (department_id);


--
-- Name: GnC_departmentalcompetencies_manager_id_d6ca6877; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_departmentalcompetencies_manager_id_d6ca6877" ON public."GnC_departmentalcompetencies" USING btree (manager_id);


--
-- Name: GnC_departmentalcompetenciescomment_created_by_id_7b3837f5; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_departmentalcompetenciescomment_created_by_id_7b3837f5" ON public."GnC_departmentalcompetenciescomment" USING btree (created_by_id);


--
-- Name: GnC_departmentalgoalcomment_created_by_id_52ae5e02; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_departmentalgoalcomment_created_by_id_52ae5e02" ON public."GnC_departmentalgoalcomment" USING btree (created_by_id);


--
-- Name: GnC_departmentalgoalcomment_departmental_goal_id_efc4dc9f; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_departmentalgoalcomment_departmental_goal_id_efc4dc9f" ON public."GnC_departmentalgoalcomment" USING btree (departmental_goal_id);


--
-- Name: GnC_departmentalgoals_appraisal_id_88ec3dbb; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_departmentalgoals_appraisal_id_88ec3dbb" ON public."GnC_departmentalgoals" USING btree (appraisal_id);


--
-- Name: GnC_departmentalgoals_department_id_7a8977ff; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_departmentalgoals_department_id_7a8977ff" ON public."GnC_departmentalgoals" USING btree (department_id);


--
-- Name: GnC_departmentalgoals_goal_category_id_89eb4721; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_departmentalgoals_goal_category_id_89eb4721" ON public."GnC_departmentalgoals" USING btree (goal_category_id);


--
-- Name: GnC_departmentalgoals_manager_id_64078e44; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_departmentalgoals_manager_id_64078e44" ON public."GnC_departmentalgoals" USING btree (manager_id);


--
-- Name: GnC_endyrcommentbox_created_by_id_6e06643e; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_endyrcommentbox_created_by_id_6e06643e" ON public."GnC_endyrcommentbox" USING btree (created_by_id);


--
-- Name: GnC_endyrcommentbox_goal_id_13aa5963; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_endyrcommentbox_goal_id_13aa5963" ON public."GnC_endyrcommentbox" USING btree (goal_id);


--
-- Name: GnC_goalcomment_created_by_id_9f7cb244; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_goalcomment_created_by_id_9f7cb244" ON public."GnC_goalcomment" USING btree (created_by_id);


--
-- Name: GnC_goalcomment_goal_id_252b924c; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_goalcomment_goal_id_252b924c" ON public."GnC_goalcomment" USING btree (goal_id);


--
-- Name: GnC_goals_appraisal_id_f27b997d; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_goals_appraisal_id_f27b997d" ON public."GnC_goals" USING btree (appraisal_id);


--
-- Name: GnC_goals_employee_id_13965219; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_goals_employee_id_13965219" ON public."GnC_goals" USING btree (employee_id);


--
-- Name: GnC_goals_goal_category_id_a9e9cdc9; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_goals_goal_category_id_a9e9cdc9" ON public."GnC_goals" USING btree (goal_category_id);


--
-- Name: GnC_kpi_goal_id_4121a0f5; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_kpi_goal_id_4121a0f5" ON public."GnC_kpi" USING btree (goal_id);


--
-- Name: GnC_midyrcommentbox_created_by_id_4e5589b6; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_midyrcommentbox_created_by_id_4e5589b6" ON public."GnC_midyrcommentbox" USING btree (created_by_id);


--
-- Name: GnC_midyrcommentbox_goal_id_69555c50; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "GnC_midyrcommentbox_goal_id_69555c50" ON public."GnC_midyrcommentbox" USING btree (goal_id);


--
-- Name: Profile_departments_manager_id_e97442f4; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Profile_departments_manager_id_e97442f4" ON public."Profile_departments" USING btree (manager_id);


--
-- Name: Profile_notification_user_id_3bc564c6; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Profile_notification_user_id_3bc564c6" ON public."Profile_notification" USING btree (user_id);


--
-- Name: Profile_profile_department_id_eee178e7; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Profile_profile_department_id_eee178e7" ON public."Profile_profile" USING btree (department_id);


--
-- Name: Profile_profile_first_Reporting_Manager_id_64f9df34; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Profile_profile_first_Reporting_Manager_id_64f9df34" ON public."Profile_profile" USING btree ("first_Reporting_Manager_id");


--
-- Name: Profile_profile_second_Reporting_Manager_Link_id_34a23583; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Profile_profile_second_Reporting_Manager_Link_id_34a23583" ON public."Profile_profile" USING btree ("second_Reporting_Manager_id");


--
-- Name: Profile_qualifications_employee_id_c375f548; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Profile_qualifications_employee_id_c375f548" ON public."Profile_qualifications" USING btree (employee_id);


--
-- Name: Profile_resetpasswordtoken_user_id_47278309; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Profile_resetpasswordtoken_user_id_47278309" ON public."Profile_resetpasswordtoken" USING btree (user_id);


--
-- Name: Profile_user_groups_group_id_2b6bc8db; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Profile_user_groups_group_id_2b6bc8db" ON public."Profile_user_groups" USING btree (group_id);


--
-- Name: Profile_user_groups_user_id_3548702e; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Profile_user_groups_user_id_3548702e" ON public."Profile_user_groups" USING btree (user_id);


--
-- Name: Profile_user_user_permissions_permission_id_8f80e0ba; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Profile_user_user_permissions_permission_id_8f80e0ba" ON public."Profile_user_user_permissions" USING btree (permission_id);


--
-- Name: Profile_user_user_permissions_user_id_3087953f; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Profile_user_user_permissions_user_id_3087953f" ON public."Profile_user_user_permissions" USING btree (user_id);


--
-- Name: Profile_user_username_bc44af27_like; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Profile_user_username_bc44af27_like" ON public."Profile_user" USING btree (username varchar_pattern_ops);


--
-- Name: Ticketing_ticket_comments_ticket_id_3e9811ca; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Ticketing_ticket_comments_ticket_id_3e9811ca" ON public."Ticketing_ticketcomments" USING btree (ticket_id);


--
-- Name: Ticketing_ticket_comments_user_id_2376d04a; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Ticketing_ticket_comments_user_id_2376d04a" ON public."Ticketing_ticketcomments" USING btree (user_id);


--
-- Name: Ticketing_ticket_created_by_id_a8b998fe; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Ticketing_ticket_created_by_id_a8b998fe" ON public."Ticketing_ticket" USING btree (created_by_id);


--
-- Name: Trainings_applytrainings_employee_id_664fac96; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Trainings_applytrainings_employee_id_664fac96" ON public."Trainings_applytrainings" USING btree (employee_id);


--
-- Name: Trainings_applytrainings_training_id_1dd0e747; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Trainings_applytrainings_training_id_1dd0e747" ON public."Trainings_applytrainings" USING btree (training_id);


--
-- Name: Trainings_careerdiscussion_employee_id_09515827; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Trainings_careerdiscussion_employee_id_09515827" ON public."Trainings_careerdiscussion" USING btree (employee_id);


--
-- Name: Trainings_careerdiscussion_user_appraisal_id_5975b6bb; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Trainings_careerdiscussion_user_appraisal_id_5975b6bb" ON public."Trainings_careerdiscussion" USING btree (user_appraisal_id);


--
-- Name: Trainings_skills_appraisal_id_cd1ae658; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Trainings_skills_appraisal_id_cd1ae658" ON public."Trainings_skills" USING btree (appraisal_id);


--
-- Name: Trainings_skills_employee_id_3fda8559; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Trainings_skills_employee_id_3fda8559" ON public."Trainings_skills" USING btree (employee_id);


--
-- Name: Trainings_skills_skill_category_id_8fa3e7c9; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Trainings_skills_skill_category_id_8fa3e7c9" ON public."Trainings_skills" USING btree (skill_category_id);


--
-- Name: Trainings_surveytrainings_training_id_c3cfb220; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Trainings_surveytrainings_training_id_c3cfb220" ON public."Trainings_surveytrainings" USING btree (training_id);


--
-- Name: Trainings_trainingcourses_skill_category_id_3e328f8e; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Trainings_trainingcourses_skill_category_id_3e328f8e" ON public."Trainings_trainingcourses" USING btree (skill_category_id);


--
-- Name: Trainings_trainings_skill_category_id_2d85711f; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX "Trainings_trainings_skill_category_id_2d85711f" ON public."Trainings_trainings" USING btree (skill_category_id);


--
-- Name: auth_access_token_token_031da619_like; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX auth_access_token_token_031da619_like ON public.auth_access_token USING btree (token varchar_pattern_ops);


--
-- Name: auth_access_token_user_id_c480a680; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX auth_access_token_user_id_c480a680 ON public.auth_access_token USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_refresh_token_user_id_1e6f4813; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX auth_refresh_token_user_id_1e6f4813 ON public.auth_refresh_token USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_celery_beat_periodictask_clocked_id_47a69f82; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX django_celery_beat_periodictask_clocked_id_47a69f82 ON public.django_celery_beat_periodictask USING btree (clocked_id);


--
-- Name: django_celery_beat_periodictask_crontab_id_d3cba168; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX django_celery_beat_periodictask_crontab_id_d3cba168 ON public.django_celery_beat_periodictask USING btree (crontab_id);


--
-- Name: django_celery_beat_periodictask_interval_id_a8ca27da; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX django_celery_beat_periodictask_interval_id_a8ca27da ON public.django_celery_beat_periodictask USING btree (interval_id);


--
-- Name: django_celery_beat_periodictask_name_265a36b7_like; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX django_celery_beat_periodictask_name_265a36b7_like ON public.django_celery_beat_periodictask USING btree (name varchar_pattern_ops);


--
-- Name: django_celery_beat_periodictask_solar_id_a87ce72c; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX django_celery_beat_periodictask_solar_id_a87ce72c ON public.django_celery_beat_periodictask USING btree (solar_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: denselight
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: Appraisals_appraisal Appraisals_appraisal_created_by_id_3e175c99_fk_Profile_p; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_appraisal"
    ADD CONSTRAINT "Appraisals_appraisal_created_by_id_3e175c99_fk_Profile_p" FOREIGN KEY (created_by_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Appraisals_appraisal Appraisals_appraisal_employee_list_id_68c88d6d_fk_Appraisal; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_appraisal"
    ADD CONSTRAINT "Appraisals_appraisal_employee_list_id_68c88d6d_fk_Appraisal" FOREIGN KEY (employee_list_id) REFERENCES public."Appraisals_user_appraisal_list"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Appraisals_appraisal Appraisals_appraisal_manager_id_a46f0385_fk_Profile_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_appraisal"
    ADD CONSTRAINT "Appraisals_appraisal_manager_id_a46f0385_fk_Profile_profile_id" FOREIGN KEY (manager_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Appraisals_appraisal Appraisals_appraisal_rating_scale_id_9524c390_fk_Appraisal; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_appraisal"
    ADD CONSTRAINT "Appraisals_appraisal_rating_scale_id_9524c390_fk_Appraisal" FOREIGN KEY (rating_scale_id) REFERENCES public."Appraisals_rating_scale"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Appraisals_appraisal Appraisals_appraisal_user_id_d49ce642_fk_Profile_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_appraisal"
    ADD CONSTRAINT "Appraisals_appraisal_user_id_d49ce642_fk_Profile_profile_id" FOREIGN KEY (user_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Appraisals_overall_appraisal Appraisals_overall_a_appraisal_category_i_a8a548aa_fk_Appraisal; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_overall_appraisal"
    ADD CONSTRAINT "Appraisals_overall_a_appraisal_category_i_a8a548aa_fk_Appraisal" FOREIGN KEY (appraisal_category_id) REFERENCES public."Appraisals_appraisal_category"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Appraisals_peerappraisal Appraisals_peerappra_appraisal_id_28d7ec5a_fk_Appraisal; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_peerappraisal"
    ADD CONSTRAINT "Appraisals_peerappra_appraisal_id_28d7ec5a_fk_Appraisal" FOREIGN KEY (appraisal_id) REFERENCES public."Appraisals_user_appraisal_list"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Appraisals_peerappraisalquestion Appraisals_peerappra_appraisal_id_2b7db054_fk_Appraisal; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_peerappraisalquestion"
    ADD CONSTRAINT "Appraisals_peerappra_appraisal_id_2b7db054_fk_Appraisal" FOREIGN KEY (appraisal_id) REFERENCES public."Appraisals_peerappraisal"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Appraisals_peerappraisal Appraisals_peerappra_created_by_id_5d13bf1c_fk_Profile_p; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_peerappraisal"
    ADD CONSTRAINT "Appraisals_peerappra_created_by_id_5d13bf1c_fk_Profile_p" FOREIGN KEY (created_by_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Appraisals_peerappraisal Appraisals_peerappra_manager_id_a1f5a6f1_fk_Profile_p; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_peerappraisal"
    ADD CONSTRAINT "Appraisals_peerappra_manager_id_a1f5a6f1_fk_Profile_p" FOREIGN KEY (manager_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Appraisals_peerappraisal Appraisals_peerappra_viewer_id_e8b84916_fk_Profile_p; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_peerappraisal"
    ADD CONSTRAINT "Appraisals_peerappra_viewer_id_e8b84916_fk_Profile_p" FOREIGN KEY (viewer_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Appraisals_user_appraisal_list Appraisals_user_appr_appraisal_category_i_6c4ae8cd_fk_Appraisal; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_user_appraisal_list"
    ADD CONSTRAINT "Appraisals_user_appr_appraisal_category_i_6c4ae8cd_fk_Appraisal" FOREIGN KEY (appraisal_category_id) REFERENCES public."Appraisals_appraisal_category"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Appraisals_user_appraisal_list Appraisals_user_appr_employee_id_da7a4baa_fk_Profile_p; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_user_appraisal_list"
    ADD CONSTRAINT "Appraisals_user_appr_employee_id_da7a4baa_fk_Profile_p" FOREIGN KEY (employee_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Appraisals_user_appraisal_list Appraisals_user_appr_manager_id_ecd68e59_fk_Profile_p; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_user_appraisal_list"
    ADD CONSTRAINT "Appraisals_user_appr_manager_id_ecd68e59_fk_Profile_p" FOREIGN KEY (manager_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Appraisals_user_appraisal_list Appraisals_user_appr_overall_appraisal_id_ba7766ac_fk_Appraisal; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Appraisals_user_appraisal_list"
    ADD CONSTRAINT "Appraisals_user_appr_overall_appraisal_id_ba7766ac_fk_Appraisal" FOREIGN KEY (overall_appraisal_id) REFERENCES public."Appraisals_overall_appraisal"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_commentbox GnC_commentbox_created_by_id_df525b3e_fk_Profile_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_commentbox"
    ADD CONSTRAINT "GnC_commentbox_created_by_id_df525b3e_fk_Profile_profile_id" FOREIGN KEY (created_by_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_commentbox GnC_commentbox_goal_id_833c2b5b_fk_GnC_goals_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_commentbox"
    ADD CONSTRAINT "GnC_commentbox_goal_id_833c2b5b_fk_GnC_goals_id" FOREIGN KEY (goal_id) REFERENCES public."GnC_goals"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_competencies GnC_competencies_appraisal_id_4538b174_fk_Appraisal; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_competencies"
    ADD CONSTRAINT "GnC_competencies_appraisal_id_4538b174_fk_Appraisal" FOREIGN KEY (appraisal_id) REFERENCES public."Appraisals_user_appraisal_list"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_competencies GnC_competencies_competency_category__307d3c08_fk_GnC_compe; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_competencies"
    ADD CONSTRAINT "GnC_competencies_competency_category__307d3c08_fk_GnC_compe" FOREIGN KEY (competency_category_id) REFERENCES public."GnC_competencycategory"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_competencies GnC_competencies_employee_id_82fd6ae3_fk_Profile_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_competencies"
    ADD CONSTRAINT "GnC_competencies_employee_id_82fd6ae3_fk_Profile_profile_id" FOREIGN KEY (employee_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_competencycomment GnC_competencycommen_competency_id_06907da5_fk_GnC_compe; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_competencycomment"
    ADD CONSTRAINT "GnC_competencycommen_competency_id_06907da5_fk_GnC_compe" FOREIGN KEY (competency_id) REFERENCES public."GnC_competencies"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_competencycomment GnC_competencycommen_created_by_id_8a812ac8_fk_Profile_p; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_competencycomment"
    ADD CONSTRAINT "GnC_competencycommen_created_by_id_8a812ac8_fk_Profile_p" FOREIGN KEY (created_by_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_departmentalcompetencies GnC_departmentalcomp_appraisal_id_50414707_fk_Appraisal; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_departmentalcompetencies"
    ADD CONSTRAINT "GnC_departmentalcomp_appraisal_id_50414707_fk_Appraisal" FOREIGN KEY (appraisal_id) REFERENCES public."Appraisals_overall_appraisal"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_departmentalcompetencies GnC_departmentalcomp_competency_category__1f342b4e_fk_GnC_compe; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_departmentalcompetencies"
    ADD CONSTRAINT "GnC_departmentalcomp_competency_category__1f342b4e_fk_GnC_compe" FOREIGN KEY (competency_category_id) REFERENCES public."GnC_competencycategory"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_departmentalcompetenciescomment GnC_departmentalcomp_created_by_id_7b3837f5_fk_Profile_p; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_departmentalcompetenciescomment"
    ADD CONSTRAINT "GnC_departmentalcomp_created_by_id_7b3837f5_fk_Profile_p" FOREIGN KEY (created_by_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_departmentalcompetencies GnC_departmentalcomp_department_id_0942dabc_fk_Profile_d; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_departmentalcompetencies"
    ADD CONSTRAINT "GnC_departmentalcomp_department_id_0942dabc_fk_Profile_d" FOREIGN KEY (department_id) REFERENCES public."Profile_departments"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_departmentalcompetenciescomment GnC_departmentalcomp_departmental_compete_246b8571_fk_GnC_depar; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_departmentalcompetenciescomment"
    ADD CONSTRAINT "GnC_departmentalcomp_departmental_compete_246b8571_fk_GnC_depar" FOREIGN KEY (departmental_competencies_id) REFERENCES public."GnC_departmentalcompetencies"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_departmentalcompetencies GnC_departmentalcomp_manager_id_d6ca6877_fk_Profile_p; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_departmentalcompetencies"
    ADD CONSTRAINT "GnC_departmentalcomp_manager_id_d6ca6877_fk_Profile_p" FOREIGN KEY (manager_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_departmentalgoals GnC_departmentalgoal_appraisal_id_88ec3dbb_fk_Appraisal; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_departmentalgoals"
    ADD CONSTRAINT "GnC_departmentalgoal_appraisal_id_88ec3dbb_fk_Appraisal" FOREIGN KEY (appraisal_id) REFERENCES public."Appraisals_overall_appraisal"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_departmentalgoalcomment GnC_departmentalgoal_created_by_id_52ae5e02_fk_Profile_p; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_departmentalgoalcomment"
    ADD CONSTRAINT "GnC_departmentalgoal_created_by_id_52ae5e02_fk_Profile_p" FOREIGN KEY (created_by_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_departmentalgoals GnC_departmentalgoal_department_id_7a8977ff_fk_Profile_d; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_departmentalgoals"
    ADD CONSTRAINT "GnC_departmentalgoal_department_id_7a8977ff_fk_Profile_d" FOREIGN KEY (department_id) REFERENCES public."Profile_departments"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_departmentalgoalcomment GnC_departmentalgoal_departmental_goal_id_efc4dc9f_fk_GnC_depar; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_departmentalgoalcomment"
    ADD CONSTRAINT "GnC_departmentalgoal_departmental_goal_id_efc4dc9f_fk_GnC_depar" FOREIGN KEY (departmental_goal_id) REFERENCES public."GnC_departmentalgoals"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_departmentalgoals GnC_departmentalgoal_goal_category_id_89eb4721_fk_GnC_goalc; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_departmentalgoals"
    ADD CONSTRAINT "GnC_departmentalgoal_goal_category_id_89eb4721_fk_GnC_goalc" FOREIGN KEY (goal_category_id) REFERENCES public."GnC_goalcategory"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_departmentalgoals GnC_departmentalgoals_manager_id_64078e44_fk_Profile_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_departmentalgoals"
    ADD CONSTRAINT "GnC_departmentalgoals_manager_id_64078e44_fk_Profile_profile_id" FOREIGN KEY (manager_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_endyrcommentbox GnC_endyrcommentbox_created_by_id_6e06643e_fk_Profile_p; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_endyrcommentbox"
    ADD CONSTRAINT "GnC_endyrcommentbox_created_by_id_6e06643e_fk_Profile_p" FOREIGN KEY (created_by_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_endyrcommentbox GnC_endyrcommentbox_goal_id_13aa5963_fk_GnC_goals_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_endyrcommentbox"
    ADD CONSTRAINT "GnC_endyrcommentbox_goal_id_13aa5963_fk_GnC_goals_id" FOREIGN KEY (goal_id) REFERENCES public."GnC_goals"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_goalcomment GnC_goalcomment_created_by_id_9f7cb244_fk_Profile_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_goalcomment"
    ADD CONSTRAINT "GnC_goalcomment_created_by_id_9f7cb244_fk_Profile_profile_id" FOREIGN KEY (created_by_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_goalcomment GnC_goalcomment_goal_id_252b924c_fk_GnC_goals_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_goalcomment"
    ADD CONSTRAINT "GnC_goalcomment_goal_id_252b924c_fk_GnC_goals_id" FOREIGN KEY (goal_id) REFERENCES public."GnC_goals"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_goals GnC_goals_appraisal_id_f27b997d_fk_Appraisal; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_goals"
    ADD CONSTRAINT "GnC_goals_appraisal_id_f27b997d_fk_Appraisal" FOREIGN KEY (appraisal_id) REFERENCES public."Appraisals_user_appraisal_list"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_goals GnC_goals_employee_id_13965219_fk_Profile_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_goals"
    ADD CONSTRAINT "GnC_goals_employee_id_13965219_fk_Profile_profile_id" FOREIGN KEY (employee_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_goals GnC_goals_goal_category_id_a9e9cdc9_fk_GnC_goalcategory_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_goals"
    ADD CONSTRAINT "GnC_goals_goal_category_id_a9e9cdc9_fk_GnC_goalcategory_id" FOREIGN KEY (goal_category_id) REFERENCES public."GnC_goalcategory"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_kpi GnC_kpi_goal_id_4121a0f5_fk_GnC_goals_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_kpi"
    ADD CONSTRAINT "GnC_kpi_goal_id_4121a0f5_fk_GnC_goals_id" FOREIGN KEY (goal_id) REFERENCES public."GnC_goals"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_midyrcommentbox GnC_midyrcommentbox_created_by_id_4e5589b6_fk_Profile_p; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_midyrcommentbox"
    ADD CONSTRAINT "GnC_midyrcommentbox_created_by_id_4e5589b6_fk_Profile_p" FOREIGN KEY (created_by_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: GnC_midyrcommentbox GnC_midyrcommentbox_goal_id_69555c50_fk_GnC_goals_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."GnC_midyrcommentbox"
    ADD CONSTRAINT "GnC_midyrcommentbox_goal_id_69555c50_fk_GnC_goals_id" FOREIGN KEY (goal_id) REFERENCES public."GnC_goals"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Profile_departments Profile_departments_manager_id_e97442f4_fk_Profile_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_departments"
    ADD CONSTRAINT "Profile_departments_manager_id_e97442f4_fk_Profile_profile_id" FOREIGN KEY (manager_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Profile_notification Profile_notification_user_id_3bc564c6_fk_Profile_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_notification"
    ADD CONSTRAINT "Profile_notification_user_id_3bc564c6_fk_Profile_profile_id" FOREIGN KEY (user_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Profile_profile Profile_profile_department_id_eee178e7_fk_Profile_d; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_profile"
    ADD CONSTRAINT "Profile_profile_department_id_eee178e7_fk_Profile_d" FOREIGN KEY (department_id) REFERENCES public."Profile_departments"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Profile_profile Profile_profile_first_Reporting_Mana_64f9df34_fk_Profile_p; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_profile"
    ADD CONSTRAINT "Profile_profile_first_Reporting_Mana_64f9df34_fk_Profile_p" FOREIGN KEY ("first_Reporting_Manager_id") REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Profile_profile Profile_profile_second_Reporting_Man_23633937_fk_Profile_p; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_profile"
    ADD CONSTRAINT "Profile_profile_second_Reporting_Man_23633937_fk_Profile_p" FOREIGN KEY ("second_Reporting_Manager_id") REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Profile_profile Profile_profile_user_id_957ea2e4_fk_Profile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_profile"
    ADD CONSTRAINT "Profile_profile_user_id_957ea2e4_fk_Profile_user_id" FOREIGN KEY (user_id) REFERENCES public."Profile_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Profile_qualifications Profile_qualificatio_employee_id_c375f548_fk_Profile_p; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_qualifications"
    ADD CONSTRAINT "Profile_qualificatio_employee_id_c375f548_fk_Profile_p" FOREIGN KEY (employee_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Profile_resetpasswordtoken Profile_resetpasswordtoken_user_id_47278309_fk_Profile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_resetpasswordtoken"
    ADD CONSTRAINT "Profile_resetpasswordtoken_user_id_47278309_fk_Profile_user_id" FOREIGN KEY (user_id) REFERENCES public."Profile_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Profile_user_groups Profile_user_groups_group_id_2b6bc8db_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_user_groups"
    ADD CONSTRAINT "Profile_user_groups_group_id_2b6bc8db_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Profile_user_groups Profile_user_groups_user_id_3548702e_fk_Profile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_user_groups"
    ADD CONSTRAINT "Profile_user_groups_user_id_3548702e_fk_Profile_user_id" FOREIGN KEY (user_id) REFERENCES public."Profile_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Profile_user_user_permissions Profile_user_user_pe_permission_id_8f80e0ba_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_user_user_permissions"
    ADD CONSTRAINT "Profile_user_user_pe_permission_id_8f80e0ba_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Profile_user_user_permissions Profile_user_user_pe_user_id_3087953f_fk_Profile_u; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Profile_user_user_permissions"
    ADD CONSTRAINT "Profile_user_user_pe_user_id_3087953f_fk_Profile_u" FOREIGN KEY (user_id) REFERENCES public."Profile_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Ticketing_ticketcomments Ticketing_ticket_com_ticket_id_3e9811ca_fk_Ticketing; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Ticketing_ticketcomments"
    ADD CONSTRAINT "Ticketing_ticket_com_ticket_id_3e9811ca_fk_Ticketing" FOREIGN KEY (ticket_id) REFERENCES public."Ticketing_ticket"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Ticketing_ticketcomments Ticketing_ticket_com_user_id_2376d04a_fk_Profile_p; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Ticketing_ticketcomments"
    ADD CONSTRAINT "Ticketing_ticket_com_user_id_2376d04a_fk_Profile_p" FOREIGN KEY (user_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Ticketing_ticket Ticketing_ticket_created_by_id_a8b998fe_fk_Profile_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Ticketing_ticket"
    ADD CONSTRAINT "Ticketing_ticket_created_by_id_a8b998fe_fk_Profile_profile_id" FOREIGN KEY (created_by_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Trainings_applytrainings Trainings_applytrain_employee_id_664fac96_fk_Profile_p; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_applytrainings"
    ADD CONSTRAINT "Trainings_applytrain_employee_id_664fac96_fk_Profile_p" FOREIGN KEY (employee_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Trainings_applytrainings Trainings_applytrain_training_id_1dd0e747_fk_Trainings; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_applytrainings"
    ADD CONSTRAINT "Trainings_applytrain_training_id_1dd0e747_fk_Trainings" FOREIGN KEY (training_id) REFERENCES public."Trainings_trainings"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Trainings_careerdiscussion Trainings_careerdisc_employee_id_09515827_fk_Profile_p; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_careerdiscussion"
    ADD CONSTRAINT "Trainings_careerdisc_employee_id_09515827_fk_Profile_p" FOREIGN KEY (employee_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Trainings_careerdiscussion Trainings_careerdisc_user_appraisal_id_5975b6bb_fk_Appraisal; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_careerdiscussion"
    ADD CONSTRAINT "Trainings_careerdisc_user_appraisal_id_5975b6bb_fk_Appraisal" FOREIGN KEY (user_appraisal_id) REFERENCES public."Appraisals_user_appraisal_list"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Trainings_skills Trainings_skills_appraisal_id_cd1ae658_fk_Appraisal; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_skills"
    ADD CONSTRAINT "Trainings_skills_appraisal_id_cd1ae658_fk_Appraisal" FOREIGN KEY (appraisal_id) REFERENCES public."Appraisals_user_appraisal_list"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Trainings_skills Trainings_skills_employee_id_3fda8559_fk_Profile_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_skills"
    ADD CONSTRAINT "Trainings_skills_employee_id_3fda8559_fk_Profile_profile_id" FOREIGN KEY (employee_id) REFERENCES public."Profile_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Trainings_skills Trainings_skills_skill_category_id_8fa3e7c9_fk_Trainings; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_skills"
    ADD CONSTRAINT "Trainings_skills_skill_category_id_8fa3e7c9_fk_Trainings" FOREIGN KEY (skill_category_id) REFERENCES public."Trainings_skillcategory"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Trainings_surveytrainings Trainings_surveytrai_training_id_c3cfb220_fk_Trainings; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_surveytrainings"
    ADD CONSTRAINT "Trainings_surveytrai_training_id_c3cfb220_fk_Trainings" FOREIGN KEY (training_id) REFERENCES public."Trainings_trainings"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Trainings_trainingcourses Trainings_trainingco_skill_category_id_3e328f8e_fk_Trainings; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_trainingcourses"
    ADD CONSTRAINT "Trainings_trainingco_skill_category_id_3e328f8e_fk_Trainings" FOREIGN KEY (skill_category_id) REFERENCES public."Trainings_skillcategory"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Trainings_trainings Trainings_trainings_skill_category_id_2d85711f_fk_Trainings; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public."Trainings_trainings"
    ADD CONSTRAINT "Trainings_trainings_skill_category_id_2d85711f_fk_Trainings" FOREIGN KEY (skill_category_id) REFERENCES public."Trainings_skillcategory"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_access_token auth_access_token_user_id_c480a680_fk_Profile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.auth_access_token
    ADD CONSTRAINT "auth_access_token_user_id_c480a680_fk_Profile_user_id" FOREIGN KEY (user_id) REFERENCES public."Profile_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_refresh_token auth_refresh_token_access_token_id_4eee381f_fk_auth_acce; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.auth_refresh_token
    ADD CONSTRAINT auth_refresh_token_access_token_id_4eee381f_fk_auth_acce FOREIGN KEY (access_token_id) REFERENCES public.auth_access_token(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_refresh_token auth_refresh_token_user_id_1e6f4813_fk_Profile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.auth_refresh_token
    ADD CONSTRAINT "auth_refresh_token_user_id_1e6f4813_fk_Profile_user_id" FOREIGN KEY (user_id) REFERENCES public."Profile_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_Profile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_Profile_user_id" FOREIGN KEY (user_id) REFERENCES public."Profile_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_clocked_id_47a69f82_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_clocked_id_47a69f82_fk_django_ce FOREIGN KEY (clocked_id) REFERENCES public.django_celery_beat_clockedschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_crontab_id_d3cba168_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_crontab_id_d3cba168_fk_django_ce FOREIGN KEY (crontab_id) REFERENCES public.django_celery_beat_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_interval_id_a8ca27da_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_interval_id_a8ca27da_fk_django_ce FOREIGN KEY (interval_id) REFERENCES public.django_celery_beat_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_solar_id_a87ce72c_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: denselight
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_solar_id_a87ce72c_fk_django_ce FOREIGN KEY (solar_id) REFERENCES public.django_celery_beat_solarschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

