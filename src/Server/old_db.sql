--
-- PostgreSQL database dump
--

-- Dumped from database version 10.15 (Ubuntu 10.15-0ubuntu0.18.04.1)
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

--
-- Data for Name: Appraisals_appraisal_category; Type: TABLE DATA; Schema: public; Owner: benny6789
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
-- Data for Name: Appraisals_overall_appraisal; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."Appraisals_overall_appraisal" (id, name, goal_weightage, competency_weightage, skill_weightage, start_date, goals_setting_end_date, mid_year_start_date, mid_year_end_date, end_year_start_date, appraisal_end_date, reports_end_date, calibration_end_date, rating_scale, status, appraisal_category_id) FROM stdin;
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
32	2020 Performance Appraisal - David Chin	100	0	0	2020-09-01	2020-09-30	2020-10-01	2020-10-31	2021-01-01	2021-01-31	2021-02-01	2021-02-05	Denselight System	Stage 1B	3
29	2020 Performance Appraisal - Lam Yee Loy	100	0	0	2020-09-01	2020-09-30	2020-10-01	2020-10-31	2021-01-01	2021-01-31	2021-02-01	2021-02-05	Denselight System	Stage 1B	3
33	2020 Performance Appraisal - Andy Piper	100	0	0	2020-09-01	2020-09-30	2020-10-01	2020-10-31	2021-01-01	2021-01-31	2021-02-01	2021-02-05	Denselight System	Stage 1B	3
35	2020 Performance Appraisal - Chan TK	100	0	0	2020-09-01	2020-09-30	2020-10-01	2020-10-31	2021-01-01	2021-01-31	2021-02-01	2021-02-05	Denselight System	Stage 1B	3
48	Hunet Test 2	100	0	0	2020-11-20	2020-11-20	2020-11-20	2020-11-20	2020-11-20	2020-11-20	2020-11-20	2020-11-20	Denselight System	Stage 2	1
\.


--
-- Data for Name: Appraisals_rating_scale; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."Appraisals_rating_scale" (id, name, description, limiter) FROM stdin;
1	Denselight System	Denselight	5
\.


--
-- Data for Name: Appraisals_user_appraisal_list; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."Appraisals_user_appraisal_list" (id, status, appraisal_name, overall_board_comments, start_date, end_date, completion, "goals_settingM_rejection", "mid_yearM_rejection", "appraisalHR_rejection", mid_year_completion, "incrementRecommendation", "bonusRecommendation", "recommendationComments", final_employee_rating, final_manager_rating, final_board_rating, appraisal_category_id, employee_id, manager_id, overall_appraisal_id) FROM stdin;
168	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	2051658454	52374544	21
175	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1634575202	52374544	21
182	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	864267076	52374544	21
185	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1854222316	689543953	21
186	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1523161462	2107825133	21
193	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1887544512	689543953	21
171	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	9327697	1135328161	21
166	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	2107825133	430837474	21
165	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Please add core value goals.	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	985791817	1813823810	21
180	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Please provide KPI	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1611091001	1224448967	21
148	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	135493917	1813823810	21
154	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	534558467	1813823810	21
160	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	52374544	135493917	21
161	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	861437177	324340084	21
194	Manager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	290990818	439847763	21
176	Manager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	610693885	861437177	21
179	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1906914592	430837474	21
152	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	No KPI's. Please resubmit with KPI's	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	324340084	1813823810	21
169	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1352141850	861437177	21
149	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Address clear objective and KPI's.	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	759336758	1813823810	21
189	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	All in your hard copy PMP information must input	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1087181548	135493917	21
174	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1904933651	759336758	21
162	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1982477965	759336758	21
178	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1776097184	324340084	21
181	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Need to add in the smart goals	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1536568573	973701598	21
177	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1913240580	973701598	21
158	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Need to input KPI's.	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1135328161	1813823810	21
153	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	253052978	759336758	21
170	Manager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1207021661	931345185	21
183	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	711389827	1616831965	21
157	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Please add KPI's to each goal and add core value goals	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	25957709	1813823810	21
150	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1557152765	430837474	21
192	Manager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	206959734	1776097184	21
146	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1616831965	1813039923	21
167	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	973701598	759336758	21
195	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Please add KPI of the goals.	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1369735000	25957709	21
172	Manager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	364472470	931345185	21
188	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	50985924	759336758	21
144	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	430837474	1813823810	21
145	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Hi Kamal,\r\n\r\n1. you need to add the KPIs in the objectives\r\n2. where is the 40mW FBGL project\r\n3. What about the 10kHz NLW project (you can include that you hit the 30kHz and 50kHz goals)?	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1813039923	430837474	21
190	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1598293097	645448974	21
155	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	already spoken	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	931345185	430837474	21
164	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Please inlcude KPI	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1428738048	1224448967	21
202	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	249507857	689543953	21
210	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1436222314	689543953	21
212	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	305986913	52374544	21
216	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	397620336	534558467	21
221	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	726826699	52374544	21
223	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	708482014	689543953	21
226	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	418560939	689543953	21
228	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1539913308	52374544	21
229	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	410233054	52374544	21
230	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	619517776	52374544	21
231	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	29738722	689543953	21
232	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1798521118	1616831965	21
233	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1233462141	689543953	21
235	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	313243524	52374544	21
239	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	2035253683	52374544	21
240	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1536649866	689543953	21
242	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	148988561	689543953	21
243	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1575722891	52374544	21
245	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	620999160	689543953	21
246	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	781280338	52374544	21
247	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1916964989	689543953	21
244	Manager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1002214209	985791817	21
205	Manager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1602769597	2107825133	21
224	Manager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1710250857	985791817	21
200	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1777433913	1135328161	21
241	Manager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	2125149271	1776097184	21
197	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	pls see me this is quite different from the paper PMP	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1017729787	135493917	21
209	Manager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Please re-submit goals	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1723530200	1776097184	21
211	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1510925941	1373136557	21
238	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Need target and deliverable in KPI	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	539619816	430837474	21
204	Manager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	480020115	931345185	21
220	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Need to add KPI. Please look at the sample i provided	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	231731743	973701598	21
236	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	850138976	135493917	21
196	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	2047523461	135493917	21
213	Manager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	426739617	253052978	21
199	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	520727285	973701598	21
208	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1921197435	135493917	21
198	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	pls include the PMP	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1941685512	135493917	21
237	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	pls include the core value	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	22592094	135493917	21
207	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Need to add KPI into each goal so it can be tracked. Also add core value goals	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1779366736	1813823810	21
214	S2Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	1608216415	1428738048	21
217	Manager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1484926575	861437177	21
215	Manager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	161961016	253052978	21
225	Manager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1256890838	861437177	21
206	Manager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	31853750	1557152765	21
234	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	2076006951	539619816	21
248	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1106999016	534558467	21
251	Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1813823810	\N	21
218	Manager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Please write Goals properly. Same project appearing in 2 categories	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	673813648	439847763	21
227	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Please insert core value	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	104959828	988735390	21
201	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	As mentioned, please amend the categories, some of the due dates and also add the sub-categories  for 'Improve Standard Recruitment process'	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	163946503	534558467	21
156	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Did not fill up core values competencies category. Please fill up	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1224448967	324340084	21
151	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	No KPI's or core value goals	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	988735390	1813823810	21
159	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Please remove the KFA from your PMP. I don't think you are involve in them.	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	689543953	759336758	21
219	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Did not fill up core values competencies category. Need to fill up. Please fill and re-submit	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	439847763	324340084	21
250	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Please insert core value	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	6	988735390	21
283	Employee	dense	No Comments	2020-11-27	2020-11-27	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	1	18	534558467	51
184	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Please fill up core values and competencies category	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	249343659	324340084	21
252	Manager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	proceed to fill in the competency and skills	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	10	861437177	21
255	S1BReview	2020 Performance Appraisal	No Comments	2020-10-07	2020-10-07	null	NIL	Please re-submit as I'm testing yours with balvinder	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	163946503	534558467	26
261	S2Employee	2020 Performance Appraisal - David Chin	No Comments	2020-10-14	2020-10-14	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	988735390	1813823810	32
147	S1BEmployee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Hi Ashish,\r\n\r\nGood attempt. But for KPI, i need you to include targets you want to hit for all KPIs. I need targets to score against.\r\n\r\nFor example, something like for 3" wafer growth improvement, maybe you can say you will improve PL control to < 5nm within edge exclusion .	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	645448974	430837474	21
256	S2Employee	2020 Performance Appraisal - Helen Vincent	No Comments	2020-10-14	2020-10-14	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	534558467	1813823810	27
263	S2Employee	2020 Performance Appraisal - Chivukula Subrahmanya	No Comments	2020-10-14	2020-10-14	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	324340084	1813823810	34
284	S1BEmployee	dense	No Comments	2020-11-27	2020-11-27	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	1	17	18	51
258	S2Employee	2020 Performance Appraisal - Lam Yee Loy	No Comments	2020-10-14	2020-10-14	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	1135328161	1813823810	29
260	S2Employee	2020 Performance Appraisal - Soma Sankaran	No Comments	2020-10-14	2020-10-14	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	985791817	1813823810	31
262	S1BEmployee	2020 Performance Appraisal - Andy Piper	No Comments	2020-10-14	2020-10-14	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	430837474	1813823810	33
265	S1BEmployee	2020 Performance Appraisal - Kevin Yang	No Comments	2020-10-14	2020-10-14	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	25957709	1813823810	36
259	S2Employee	2020 Performance Appraisal - Chan Bor Shen	No Comments	2020-10-14	2020-10-14	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	135493917	1813823810	30
264	S1BManager	2020 Performance Appraisal - Chan TK	No Comments	2020-10-14	2020-10-14	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	759336758	1813823810	35
277	Employee	Hunet Test 2	No Comments	2020-11-20	2020-11-20	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	1	18	534558467	48
280	S2Employee	goodone	No Comments	2020-11-27	2020-11-27	null	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	1	17	18	49
281	Employee	doo	No Comments	2020-11-27	2020-11-27	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	1	18	534558467	50
278	S1BManager	Hunet Test 2	No Comments	2020-11-20	2020-11-20	null	NIL	Please change Goals	NIL	Completed	0	NIL	NIL	\N	\N	\N	1	17	18	48
279	Employee	goodone	No Comments	2020-11-27	2020-11-27	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	1	18	534558467	49
222	S2Employee	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	To include Wip Visibility thru ODOO for Fab A and APT in appraisal goals and measurement should have started in July 2020 onwards.  This is the biggest value of the projects driven by Syrex and shared at Rajan's level.	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	3	1014312820	1982477965	21
163	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	Hi Sang,\r\n\r\nFor KPIs, they need to be tangible.\r\n\r\n1. For example, for how many products are you going to have the SPC chart and process control?\r\n\r\n2. How many % of the tool SPC you are creating?\r\n\r\n3. How many product growth recipe  will you align with PE team ?	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	1373136557	430837474	21
282	S1BManager	doo	No Comments	2020-11-27	2020-11-27	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	1	17	18	50
288	Employee	appraisal new	No Comments	2020-12-11	2020-12-11	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	5	18	534558467	54
289	S2Manager	appraisal new	No Comments	2020-12-11	2020-12-11	MCompleted	NIL	NIL	NIL	Completed	0	NIL	NIL	\N	\N	\N	5	17	18	54
249	S1BManager	2020 Performance Appraisal	No Comments	2020-09-01	2020-09-01	null	NIL	NIL	NIL	Uncompleted	0	NIL	NIL	\N	\N	\N	3	5	135493917	21
\.


--
-- Data for Name: Appraisals_appraisal; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."Appraisals_appraisal" (id, status, created_by_id, employee_list_id, manager_id, rating_scale_id, user_id) FROM stdin;
\.


--
-- Data for Name: Appraisals_peerappraisal; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."Appraisals_peerappraisal" (id, title1, strength1, weaknessdevelopment1, title2, strength2, weaknessdevelopment2, title3, strength3, weaknessdevelopment3, completion, appraisal_id, created_by_id, manager_id, viewer_id) FROM stdin;
\.


--
-- Data for Name: Appraisals_peerappraisalquestion; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."Appraisals_peerappraisalquestion" (id, title, answer, completed, appraisal_id) FROM stdin;
\.


--
-- Data for Name: GnC_goal_category; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."GnC_goal_category" (id, name) FROM stdin;
1	Customer Engagement
3	New Product Introduction
4	Operation Efficiency/Cost Reduction
5	Organization Effectivness
6	Others
\.


--
-- Data for Name: GnC_goals; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."GnC_goals" (id, summary, description, due, weightage, "metrics_Used", "MID_user_comments", "MID_manager_comments", user_rating, manager_rating, board_rating, user_comments, manager_comments, board_comments, tracking_status, metrics_evidence, appraisal_id, employee_id, goal_category_id) FROM stdin;
141	Support key customer programs(CISCO, Almae, Huawei, Bandwidth 10, othere Laser and Quad PIN projects) As per time lines & deliverables	i) Litho process margin improvement, reduce defocus, resist footing, misalignment[Q2] \r\nLitho defocus/ resist footing reduced after optimize low vacuum contact procedure. Misalignment reduced through operators training\r\nii) SPR220 bonding process stabilization[Q2]\r\nFully implemented SPR220 smoothly with enough process margin. Engineering report: ER #: 20-WP-ER-0006	2020-06-30	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		178	1776097184	1
28	Achieve yield target for ELED/SLED/DFB16xx	To achieve the respective yield target set for ELED/SLED/DFB16xx to ensure timely released product revenue shipment and cost effectiveness	2020-12-31	30	weekly yield report (ELED/SLED) in weekly yield meeting and weekly yield update in DFB meeting	NIL	NIL	1	1	1	NIL	NIL	NIL	null		161	861437177	4
23	Application Support & Technical Marketing	1. Deliver 3 app notes or videos that show cases DenseLight???s expertise in the respecting markets.\r\n2. Work with the internal teams to deliver 2 Technical Marketing reports\r\n-template and organize ppt	2020-12-31	20	1.Publish app notes on web 2. Publish 2 technical marketing reports&organize seminar for team	NIL	NIL	1	1	1	NIL	NIL	NIL	null		244	1002214209	5
328	Production/cost improvement		2020-12-31	40		NIL	NIL	1	1	1	NIL	NIL	NIL	null		199	520727285	4
298	Projects	Driving performance management	2020-12-31	20	Dashboards	Done research and benchmarking on other renowned semiconductor companies around the globe to understand and more importantly, execute the Kaizen projects with results. \r\nThe mainframe has been created and presented to management during the Operational Excellence reviews. However, due to lack of intern or a 3rd headcount to establish and ensure continuity of this system, the project was placed on hold. There was no or very low application for an IE internship when it was posted. Next steps was to build a Job Description for a full time junior IE/IT role. The justification for this needs more thoughts to fill up the executive time fruitfully for 40-45 hrs a work week, and building more projects to accommodate this will be the key next step.\r\n                                              \r\nKFA 4.1 - WIP management thru ODOO was a success story and though there are many nicks along the way, it was overcame diligently. This road to fully cross between APT (Assy) to Fab B (Coating) back to APT (Assy and Test) right thru SubCon and back again to APT in various product form takes time to be developed inside the Odoo system. Traveller sheet has been re-designed, the sun-con invoice details is underway plus a few more milestones needs to be established before this goes life. A lot of time and resources has been used as a concerted effort to get this going, and once system wise ready, the journey will be to internalize the the new way of going things which is inline with the i4.0 where productivity thru automation replaces manual way of executing non value added jobs. \r\n\r\nKFA4.3 - Led by Nee Shiuan and he's on track with all his automation projects which by and large needs the expertise of PE\r\n\r\nBi Weekly Meeting has been setup with the President and CEO with the Head of Supply Chain to run thru the key projects and the deliverables in line with the company's objectives.	NIL	1	1	1	NIL	NIL	NIL	On Track		162	1982477965	4
186	New Design in	Get at least 4 design win in 16xx DFB???10G/25GD or SOA	2020-12-31	25	new orders.	NIL	NIL	1	1	1	NIL	NIL	NIL	null		157	25957709	3
16	Revenue	Meet Revenue Target of $1.5 Million	2020-12-20	50	Financial Report	Comment 1	Well done for being on track...!	3	5	1	I meet expectations	I think you did better than you think.	NIL	On Track		\N	\N	1
504	Test 5 Nov	Objective 1	2020-12-31	100	N/A	Mid Year Employee Comments	ABCD	1	2	1	NIL	ABCD	NIL	On Track		\N	17	1
37	Assist in monthly closing within 4 working days	assist to close month end accounts within 4 working days	2020-12-31	15	NIL	NIL	Agreed	1	1	1	NIL	NIL	NIL	On Track		227	104959828	6
17	Title 2	Objective 2	2020-12-20	20	Source 2	Comments 2	You should try to speed up !	4	2	1	I did quite well	You need improvement.	NIL	Not On Track		\N	\N	4
18	Goal 3	Objective 3	2020-12-20	30	Source 3	No Comments	Noted.	2	3	1	I may need more training	I think you are ok.	NIL	On Track		\N	\N	3
11	Increase Revenue by 100%	Increase revenue during all runs	2020-09-01	100	Monthly Financial Report	Covid struck at February, cannot visit clients	I agree	4	3	5	I think I am good :)	I dont think so	I think you are too good	Not On Track		\N	\N	6
15	Product Costing	Prepare product costing\r\n1)May20_FBGL\r\n2)July20_DFB(Sensing & Datacom)\r\n3)Sep20_SLED/ELED\r\n4)Nov20_COS/ILM	2020-12-31	25	Costing excel worksheet	NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	988735390	5
14	Sharing PNL and Costs	Ensure PNL and costs (Fab A, Fab B and ATP) is share with the staff, target not less than 12 times in 2020	2021-01-15	25	PPT presentation	NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	988735390	5
13	Monthly BOD Report	Ensure BOD receive the monthly/quarterly report by 2nd week of the following month	2021-01-15	25	PPT presentation	NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	988735390	4
12	Monthly Closing Dateline	Ensure the monthly closing /report is close at the 4th working day	2021-01-06	25	Date of closing and email out	NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	988735390	4
30	Follow PDM procedure to achieve new product release	Work with NPD to achieve the new product release on:\r\n1.DFB (Sicoya 1310nm) \r\n2.25G DML DFB \r\n3.OSI 1310nm & 1550nm - NRE\r\n4.1650nm pulse PF laser\r\n5.Eloira SLED 1550nm - NRE\r\n6.Panwoo low DOP SLED	2020-12-31	20	PDM documents of each project	NIL	NIL	1	1	1	NIL	NIL	NIL	null		161	861437177	3
33	Quality	1) CONC, NCMR, RMA, SPC, Bin level SPC, Audits, PRM/ORT set up	2020-12-31	25	quality indices	NIL	NIL	1	1	1	NIL	NIL	NIL	null		152	324340084	6
21	NEW PRODUCT WINs	To support design-wins in \r\n- ILM, \r\n- 16XX, \r\n- High poer DFB\r\n- Gain Chip / SOA	2020-12-31	20	1.PPT Presentation on ILM strategy, with list of customers, status; 2.Revenue report for design wins	NIL	NIL	1	1	1	NIL	NIL	NIL	null		244	1002214209	3
20	Revenue	1.Help sales team meet overall revenue goal\r\n2.Help sales team meet quarterly goals\r\n3.Meet 1 of the following:\r\nI. total $1M in ILM revenue ILM (WW) or\r\nII. $500K DFB (WW 16xx) or\r\nIII. $300K SOA/GC	2020-12-31	40	Revenue Report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		244	1002214209	1
31	Quality/Cost reduction/Operational support	To set quality goal to ensure timely support on production inline issues & customer quality issues; cost reduction goals to improve PE team resource efficiency and achieve operating cost reduction.	2020-12-31	20	RMA and NCMR tracking report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		161	861437177	4
29	Establish various system for PE team	System setup for PE team KPI tracking & org. effectiveness improvement	2020-12-31	30	Yield tracking report, yield dashboard, SPC	NIL	NIL	1	1	1	NIL	NIL	NIL	null		161	861437177	5
32	Revenue goal - Achieve > US$ 12.1M revenue in 2020 as per AOP	1) Support POET, 25G DML, Huawei SOA, Panwoo, Almae BH, BW10 and other Laser projects. 2) Help achieve 2 design wins for 1653DFB 10G i-temp & 25G DML or High power DFB c-temp, 3) Back up tools qual	2020-12-31	25	Revenue, design wins, back up tools	NIL	NIL	1	1	1	NIL	NIL	NIL	null		152	324340084	6
35	Personnel Development	File atleast one patent or paper or  trade secret from Process and Product groups per year , Cross training on another tool , Mentor ship by senior engineers to IA students	2020-12-31	15	patents, training, mentorship	NIL	NIL	1	1	1	NIL	NIL	NIL	null		152	324340084	5
34	Yield	DFB yield improvement to 70% and Others (SLED & ELED) to ~ 90%, Mechanical yield > 90%, Fix marginality issues (ripple issues, peeling, process consistency), 3 inch wafer demonstration,	2020-12-31	20	Yields, yield sigma	NIL	NIL	1	1	1	NIL	NIL	NIL	null		152	324340084	6
36	Operational efficiency	Denton I29 qual, Back up tools, Cost reduction activity, SOP implementation, SPS systems set up, Process control and monitoring,	2020-12-31	15	indices	NIL	NIL	1	1	1	NIL	NIL	NIL	null		152	324340084	4
25	Business Operations	Odoo sample request improvement and support DenseLight???s web page enhancement	2020-12-31	20	1.\tPublish updated sample request process playbook 2.\tUpdate of web page	NIL	NIL	1	1	1	NIL	NIL	NIL	null		244	1002214209	4
128	3 inch wafer convention	The whole production line is ready for 3inch wafers run	2020-12-30	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		192	206959734	4
144	Operations	- 100% SOP on backlap area[Done]\r\n- Certification of operators[Done for the lapping new operator]\r\n- Measure current productivity & improve by 10%\r\n- Audit finding closure[Done for lapping area]	2020-06-30	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		178	1776097184	4
44	Reduce Cost of Non-conformance (CoNC)	To reduce Cost of Non-conformance (CoNC) by <5% with respect to the total cost of goods sold (COGS)	2020-12-31	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		156	1224448967	4
46	Improvement to Process compliance	Reestablish Monthly Quality Patrol Audit to counter check process and manufacturing process compliance to requirement and standard.	2020-12-31	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		156	1224448967	4
47	Improvement to In-coming Quality Assurance	To centralize documentation and acceptance for incoming material inspection by creating google shared drive for all department incoming material documentations and approval	2020-12-31	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		156	1224448967	4
39	Accounts Receivable Management	DSO less than 45 days.	2020-12-31	15	NIL	NIL	Agreed, except 2 long o/s AR	1	1	1	NIL	NIL	NIL	On Track		227	104959828	6
49	Establish DenseLight Manufacturing Execution System (DMES)	To complete the DMES in Q4, 2020	2020-12-31	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		156	1224448967	4
50	Involvement of QA function to new product development	To establish QA gates for each New Product Development Phases	2020-12-31	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		156	1224448967	3
51	Improve and Centralize Documented Information	To Automate DCC utilizing Google Shared drive and/or Odoo System	2020-12-31	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		156	1224448967	5
52	Completion of ISO 9001:2015 QMS Surveillance Audit for year 2020	To pass the Third-party ISO 9001:2015 QMS Surveillance Audit	2020-12-31	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		156	1224448967	5
329	Data management for all NPD Lab Tester	???\tCentralized storage of all data\r\n???\tData backup\r\n???\tEase of data query	2020-04-30	25	Task1_Gantt.xlsx	NIL	NIL	1	1	1	NIL	NIL	NIL	null	Task1_Gantt.jpg	146	1616831965	3
45	Improvement of External Manufacturing Performance	Monitor (baseline gathering) Ext. Mfg. performance by;\r\na) Reduce Reject/Scrap rate by 2%\r\nb) Reduce Vendor CoNC by 2% from previous year (2019)\r\nc) Improve response time to quality issue	2020-12-31	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		156	1224448967	4
43	Reduction RMA closure cycle time (CAPA submission)	To respond faster to customer feedback	2020-12-31	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		156	1224448967	1
55	Project	1. Understand different laser process\r\n2. Able to dispose wafers independently\r\n3. Prepare FA report for the issues caught in the line	2020-09-30	15	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		184	249343659	4
56	Quality	1. Maintain Internal FA TAT to 1 day\r\n2. Maintain and ensure External FA TAT to 3 days\r\n3. Reduce wafer disposition time to 4 hours\r\n4. Organize internal and external FA data folder	2021-01-31	15	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		184	249343659	4
57	Operation	1. Maintain housekeeping/5S at all times\r\n2. Maintain machine handle in good condition\r\n3. Monitor FA consumables	2020-09-30	5	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		184	249343659	4
58	Operation	1. To support all types of FA request\r\n2. To support wafer fab process and other related works	2020-09-30	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		184	249343659	4
59	Personal Development	1. Familiarize and continue to learn various laser processes in the wafer fab process.\r\n2. Develop decision making on process related.	2020-09-30	15	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		184	249343659	6
40	Fixed Asset Tagging	Tidy up and tagging fixed asset using excel worksheet	2020-10-31	10	NIL	NIL	Not done	1	1	1	NIL	NIL	NIL	On Track		227	104959828	6
53	Expand the use of DenseLight network for remote access connection	Deployment of Virtual PC server to all indirect staff to be able to work from home	2020-12-31	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	null		156	1224448967	5
349	Production process control set up	1.1\tCreate a system for production wafer growth control that align with SPC charts build by Uma	2020-12-31	15		NIL	NIL	1	1	1	NIL	NIL	NIL	null		163	1373136557	4
63	Support Revenue Thru Critical Program Execution (25G DML-Santosh)	Develop process flow and module for 25G DML with FC (POET) and without FC (DLS) capability	2020-12-31	10	Produce 25G DML dies meeting program specification	NIL	NIL	1	1	1	NIL	NIL	NIL	null		219	439847763	3
61	Support Revenue Thru Critical Program Execution (BH)	Develop Buried Heterostructure (BH) Process	2020-12-31	10	Produce BH dies meeting program expectations	NIL	NIL	1	1	1	NIL	NIL	NIL	null		219	439847763	3
65	Support Revenue Thru Critical Program Execution (SOA-Simon)	Develop process flow and module for SOA	2020-12-31	10	Produce SOA dies meeting program specification	NIL	NIL	1	1	1	NIL	NIL	NIL	null		219	439847763	3
64	Support Revenue Thru Critical Program Execution (Low DOP-Simon)	Provide wafer fab process support on Panwoo low DOP wafers	2020-12-31	10	Produce Low DOP dies meeting program specification	NIL	NIL	1	1	1	NIL	NIL	NIL	null		219	439847763	3
66	Support Conversion of 2" to 3" Wafer Processing (Simon)	Support 3" wafer processing to help operations with capacity ramp	2020-12-31	10	3??? wafer fabrication successful with same/better  yield as 2"	NIL	NIL	1	1	1	NIL	NIL	NIL	null		219	439847763	4
67	Operator Certification on Wafer Process	Setup procedure for operator training and certification to reduce human error on wafer processing	2020-12-31	10	Operators properly trained and certified with regular recertification	NIL	NIL	1	1	1	NIL	NIL	NIL	null		219	439847763	5
68	Support Runsheet Conversion to DMES (Simon)	Support IT and production team in implementation of DMES	2020-09-30	10	Transfer all runsheets to DMES	NIL	NIL	1	1	1	NIL	NIL	NIL	null		219	439847763	4
69	Quality: Process FMEA and Window Checks	Implement FMEA/Delta FMEA assessment of new processes and all new modules with "window checks" based on Product Development Model (PDM) guidelines.	2021-06-30	10	Implement FMEA and "window checks" based on PDM guidelines	NIL	NIL	1	1	1	NIL	NIL	NIL	null		219	439847763	6
27	Organization/ Culture Change	???\tDevelop and improve standard recruitment process to reduce attrition by 50%. \r\n???\tIdentify and fill all 2020 budgeted positions. \r\n???\tContinue review of KFA???s and execution of DLS 2.0	2020-12-31	15	HR attrition report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		148	135493917	5
42	OPS Eff/Cost Reduction	???\tImplement in-house process runsheet software for production use by 1Q2020\r\n???\tTo ensure the production CT and OTD mean the 15 days for the standard product and the OTD given by the PC.	2020-12-31	15	MFG Operation reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		148	135493917	4
70	Quality: Process Integration Bluebook	Create Bluebook template and implement for process integration	2021-12-31	10	Implement bluebook for process integration	NIL	NIL	1	1	1	NIL	NIL	NIL	null		219	439847763	6
62	Support Revenue Thru Critical Program Execution (BH FC DFB-Santosh)	Develop process flow and module for Almae BH FC DFB	2020-12-31	10	Fabricate BH DFB with wafer level VI and IV yield at >90%	NIL	NIL	1	1	1	NIL	NIL	NIL	null		219	439847763	3
142	Quality(SPC)	i) Tool level SPC: Lapping tool SPC setup ok\r\nii) Product level, Product SPC setup ok\r\niii) Metrology level\r\n- CpK >1.33, OOC investigation\r\n- NCMR closure within 1 month\r\n- No recurrence of same issues\r\n- ECN SPR220 / BCB for Lapping[done]\r\n- DI GUIDELINE[done]\r\n- 15nXT negative resist evaluation[Q4]\r\n- Vernier mask for grating layer[Done]\r\n- Defect scan machine purchase[Q4]\r\n- Auto CD measurement software implementation[Done]\r\n- Mask & wafer solvent cleaner[Q4]\r\n- Combo tool for bond/debond[Q4]	2020-12-30	30		NIL	NIL	1	1	1	NIL	NIL	NIL	null		178	1776097184	4
90	Branding & Marketing	To implement a branding and marketing strategy to enhance DenseLight's branding image	2020-12-31	15	Presentation of branding activities	NIL	NIL	1	1	1	NIL	NIL	NIL	null		165	985791817	6
341	SOA Automation using Sigmakoki	Lead the development and release of SOA automation using Sigmakoki to support SOA prodution ramp.	2020-12-31	40		NIL	NIL	1	1	1	NIL	NIL	NIL	null		204	480020115	4
79	Monthly BOD report to be send out by 2nd week	Ensure Board will be update at the regular interval and progress of the company	2021-01-15	25	Date BOD ppt report email out	NIL	NIL	1	1	1	NIL	NIL	NIL	null	Finance_KPI_2_202009.JPG	151	988735390	5
511	Goal 2	test 2	2020-12-31	50		Mid Year Employee's Comments2	Mid Year Manager's Comments2	2	1	1	End Year Employee's Comments2	NIL	NIL	On Track		\N	17	1
80	Sharing of PNL with analysis and cost review - 12 times in 2020	To analysis and share with staff, Fab A, Fab B and ATP the costing related to the respective areas and progress therein.	2021-01-15	25	Data (costing) in excel	NIL	NIL	1	1	1	NIL	NIL	NIL	null	Finance_KPI_3_202009.JPG	151	988735390	4
84	Prepare product costing	Prepare product costing:\r\n1) May'20 - FBGL\r\n2) July'20 - DFB(Sensing & Datacom)\r\n3) Sept'20 - SLED/ELED\r\n4) Nov'20 - COS/ILM	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		250	6	6
77	Advancing DPHI Platform solutions offering	a)\tDPhi and Optical Engine solutions Technical Directions\r\nb)\tDLS-AMF MOU and POC1&2\r\nc)\tDPHI implementation, including HIPP to OE solutions engineering	2020-12-31	30	Presentations, reports, meetings pptx and minutes	3a) \tDPhi and Optical Engine solutions Technical Directions\r\n???\tDeveloping technical directions for Providing Turnkey Optical Engine Solutions (POC, OE1 & OE2) \r\n???\tDPhi trademark registration filed\r\n???\tContribution to DPhi collaterals and marketing effort\r\n\r\n\r\n3b) DLS-AMF MOU and POC1&2\r\n???\tMOU signing done on 24Aug2020\r\n???\tDeveloped POC1 & POC2 program directions, DLS POC team formed and POC work in progress \r\n \r\n3c)\tDPHI implementation, including HIPP to OE solutions engineering  \r\n???\tDiscussion in progress with Hisense and HGTech for 400G Intra-DCI FR4 OE	NIL	1	1	1	NIL	NIL	NIL	On Track		158	1135328161	3
81	Prepare product costing from May to Nov 2020	Prepare product costing for pricing and reference cover FBGL to ILM	2020-12-31	25	Costing excel worksheet	NIL	NIL	1	1	1	NIL	NIL	NIL	null	Finance_KPI_4_202009.JPG	151	988735390	4
317	Shipment and Revenue Support.	Review current OEE on APT test equipment and define actions to improve OEE ??? Q4	2020-12-31	30		NIL	NIL	1	1	1	NIL	NIL	NIL	null		181	1536568573	4
82	Monthly closing within 4 working days	Monthly closing within 4 working days	2021-01-15	50		NIL	Agreed	1	1	1	NIL	NIL	NIL	On Track		250	6	6
85	Make sure a smooth year end financial audit- YE2019	Make sure a smooth year end financial audit- YE2019	2020-05-31	30		NIL	Agreed	1	1	1	NIL	NIL	NIL	On Track		250	6	6
300	Production Planning (Inventory & Materials/Forecast)		2020-12-31	20	Inventory and Forecast Files	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		215	161961016	4
83	Tidy up & Tagging fixed assets	Tidy up & Tagging fixed assets - Using Excel worksheet by Dec'20	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		250	6	6
87	Channel Growth	Drive business through Channels, and grow DenseLight revenue in US	2020-12-31	20	Channel Growth (US)	NIL	NIL	1	1	1	NIL	NIL	NIL	null		165	985791817	5
88	New Product Design Wins	Win designs with new product	2020-12-31	20	Order from customer	NIL	NIL	1	1	1	NIL	NIL	NIL	null		165	985791817	3
86	Revenue	Meet company revenue goals for 2020	2020-12-31	30		NIL	NIL	1	1	1	NIL	NIL	NIL	null		165	985791817	1
89	Operational Efficiecy	To implement programs and or processes that enable sales to increase operational efficiency	2020-04-30	15	Presentation of system/s that increase efficiency	NIL	NIL	1	1	1	NIL	NIL	NIL	null		165	985791817	4
92	Sales KPI	Meet the following Sales KPI:\r\n1.  PO conversion rate of +12% (no of RFQs quoted versus no of PO received from customers not in forecast)\r\n2.  RFQ TAT ??? 48 hrs from request received to quote\r\n3.  Initiate and drive quarterly forecast review with ROW distributors: to be done 1x before the quarter starts and 1x middle of the quarter	2020-12-31	20	Sales & Marketing report or Accounting report, Distribution meeting minutes & emails	NIL	NIL	1	1	1	NIL	NIL	NIL	null		224	1710250857	1
93	RMA & Customer Returns	Attend weekly QA meetings and ensure:\r\nI.\tCustomer RMAs complains are acknowledge in time: within 1 working day\r\nII.\tWork with QA team to disposition on complaint, help them get the RMA questionnaire form, and work with QA team to come out with an 8D report where applicable\r\nIII.\tAttend the weekly QA meetings and be the voice of the customer for quality issues internally	2020-12-31	10	RMA report from QA Customer Survey report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		224	1710250857	1
54	Revenue Goal	To support WW Sales Team to meet:\r\n1. Denselight's overall  FY20 goal of $12.1m\r\n2. Meet Denselight's quarterly goal:\r\n      Q1 = $1.24m\r\n      Q2 = $2.04m\r\n      Q3 = $3.87m\r\n      Q4 = $4.59m	2020-12-31	40	Sales Revenue report or Accounts revenue report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		224	1710250857	5
91	Operational Efficiency	Lead the effort to improve sales efficiency in order & revenue management. \r\nFeatures of the system\r\na)\tImplement an automated system that links \r\ni.\tQuote\r\nii.\torder entry\r\niii.\torder acknowledgement\r\niv.\torder shipment\r\nv.\tinvoicing\r\nb)\tAutomatically generate sales reports that can give month to date, quarter to date & year to date revenue, give open backlog at any point\r\nc)\tTrack conversion rates of POs.	2020-12-31	30	New system implementation,  System operating manual	NIL	NIL	1	1	1	NIL	NIL	NIL	null		224	1710250857	5
94	Team management for MFG, Fab B & MOCVD  Equip and Facility	???\tEnsure all my team members always align to the company goals.  \r\n???\tMaintain employee work schedules including assignments, job rotation, training, vacations and paid time off, good team communication, coverage for absenteeism, and all other work related scheduling. Goal is to ensure there is always good equipment support to the MFG need.\r\n???\tEmpower employees to take responsibility for their jobs and goals. Delegate responsibility and expect accountability and regular feedback.\r\n???\tFoster a spirit of teamwork and unity among equip and other departments (MFG, Process, facility), allows for disagreement over ideas, conflict and expeditious conflict resolution, and the appreciation of diversity as well as cohesiveness, supportiveness , and working effectively together to enable each team members, other departments and company to succeed.	2020-12-31	10	Better team work and productivity	NIL	NIL	1	1	1	NIL	NIL	NIL	null		148	135493917	5
127	Back up tools qualification	ICP-02 TRION dielectric etcher release to product	2021-03-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		192	206959734	4
308	APT Manufacturing	Complete cross training for the production\r\nteam to support APT operation.	2020-12-31	25	To complete operators cross training by end of the year	NIL	NIL	1	1	1	NIL	NIL	NIL	null		159	689543953	4
105	Improve Company's Branding	Improve company???s image for better hiring sourcing and overall reputation of Denselight	2020-09-30	20	Implementation of the E-PMP and E-OT on schedule	NIL	NIL	1	1	1	NIL	NIL	NIL	null		154	534558467	5
110	Improve Company???s Branding	a. Attend at least 4 job fairs/talks to represent DLS (Total no. of attended by year end)	2020-12-31	20	Number of job fairs/talks held	NIL	NIL	1	1	1	NIL	NIL	NIL	null		201	163946503	1
102	Develop & Improve standard Recruitment Process to Reduce Attrition	1.  Set up a more robust KFA no.1 teams to lead by new energized leaders\r\n2. Look at Selection Assesmen tool to check for culture fit and commitment from final 2 candidates to 'Hire Right'.	2020-12-31	20	KFA Monthly meetings	NIL	NIL	1	1	1	NIL	NIL	NIL	null		154	534558467	5
103	Reduce Turnover	Retain effective employees and motivate them to higher productivity	2020-12-31	20	KFA 1.3 monthly report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		154	534558467	4
104	Benefit Reviews	To continue ensure the benefits for the employees are competitive with the market for retention and motivation	2020-12-31	20	Programs developed	NIL	NIL	1	1	1	NIL	NIL	NIL	null		154	534558467	6
106	Talent Succession Planning via Functional Reviews	Ensure sufficient Benchstrength	2020-09-30	20	Functional Reviews Minutes	NIL	NIL	1	1	1	NIL	NIL	NIL	null		154	534558467	5
510	Hunet test	test	2020-12-31	50		Mid Year Employee's Comments	Mid Year Manager's Comments1	2	1	1	End Year Employee's Comments1	NIL	NIL	On Track		\N	17	1
330	Equipment Management	???\tRegular Calibration\r\n???\tRegular Repair/Maintenance\r\n???\tUpdated NPD equipment inventory/list\r\n???\tConversion of DIV Matlab Software to C# application	2020-12-30	25	Task2_Gantt.xlsx	NIL	NIL	1	1	1	NIL	NIL	NIL	null	Task2_Gantt.jpg	146	1616831965	3
299	Production Planning (Achieve Target Revenue 2020)		2020-12-31	50	Revenue File	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		215	161961016	1
512	Goal 1	Objective 1	2021-01-31	50		Mid Year very good	Ok I agree	1	1	1	NIL	NIL	NIL	On Track		\N	17	6
111	Administrative support for COVID-19	Ensure compliance with government's regulations and advisories	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		201	163946503	6
117	Improvements of soft skills	1. Improve team's execution\r\n2. Motivate team's responsibility and ownership\r\n3. Alignment of reporting and communication\r\n4. Guidance of Team Managers\r\n5. Better tracking of team's task	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		144	430837474	6
108	Reduce Turnover	Reduce turnover against targeted turnover rate	2020-12-31	20	Monthly turnover rate	NIL	NIL	1	1	1	NIL	NIL	NIL	null		201	163946503	4
109	Benefits Reviews	Review employees' benefits benchmark against market practices	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		201	163946503	4
107	Increase recruitment efficiency	Improve standard recruitment process and fill up 2020 budgeted positions	2020-12-31	20	Monthly AOP actual hiring vs budget	NIL	NIL	1	1	1	NIL	NIL	NIL	null		201	163946503	4
96	Training	???\tTake ownership for the team training needs and attendance. \r\n???\tEnsure MFG Engineer and Equip SM assigned training for team member are follow through closely.\r\n???\tEnsure training received by team members are aligned and help in the execution of their work responsibility.\r\n???\tResponsible to ensure OJT for new comers to address their working needs	2020-12-31	10	Skill and training record	NIL	NIL	1	1	1	NIL	NIL	NIL	null		148	135493917	5
122	Cycle time and rework reductions, Cost reductions for ebeam	1) Improve cycle time by reducing as less holds in the run sheets as possible\r\n2) Develop the process by which low rework rate will be achieved\r\n3) eBeam passes reduction and convergence	2020-12-31	20	Cycle time, rework and cost reductions	NIL	NIL	1	1	1	NIL	NIL	NIL	null		218	673813648	4
125	A. Support Key Customer Programs	a.  Develop and Optimize Etch Process for key customers (Almae BH, 25G DML, PanWoo Low DOP, Renesas )\r\n- Dielectric etch new recipe characterization for higher selectivity of SiO2 to resist for BH process\r\n- SAMCO InP etch no trench new recipe characterization for BH process.	2020-12-30	15	FA	NIL	NIL	1	1	1	NIL	NIL	NIL	null		192	206959734	3
129	To complete qualification of chemical Remover 1165 to replace ACT410	To complete qualification of Remover 1165 for the replacement of ACT410 to achieve cost saving by 40%	2020-12-30	15		NIL	NIL	1	1	1	NIL	NIL	NIL	null		192	206959734	4
112	New Products for Sensing	1. 10KHz 1550nm NLW for Wind LIDAR and DAS \r\n\r\n2. 40mW High Power 200kHz 1550nm NLW for Auto LIDAR \r\n\r\n3. 1310nm Broadband (120nm at 10dB) SLED\r\n\r\n4. 1310nm Low DOP SLED for China FOG (> 1mW @ 100mA 8 pin BTF)	2021-03-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		144	430837474	3
319	Production Planning (Achieve Target Revenue 2020)		2020-12-30	50	Revenue File	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		213	426739617	1
113	New Products for Datacoms and Telecoms	1. High Power CWDM DFB 70mW@75C\r\n\r\n2. 10G CWDM DML c-temp and i-temp\r\n\r\n3. 25G CWDM DML c-temp and i-temp\r\n\r\n4. 25G CWDM6 DML e-temp and i-temp\r\n\r\n5. Standard High DOP SOA 1550nm - Single and 5-array \r\n\r\n6. Low DOP SOA 1310nm for 100ZR	2021-03-30	20	Weekly update reports by team and monthly updates to CEO for BOD	NIL	NIL	1	1	1	NIL	NIL	NIL	null		144	430837474	3
95	6S, Housekeeping and Safety	???\tTake ownership for the housekeeping compliance for the team and drive the team to achieve Zero NC due to housekeeping and Zero non-conformance for Safety\r\n???\tConstantly communicate with the team and align them on housekeeping and safety protocol\r\n???\tDrive the team for the ability to detect safety gaps and resolve them.\r\n???\tNeed to take ownership and responsibility for all safety related issues.\r\n???\tInform supervisor immediately for serious incidents. Need to ensure execution of preventive and corrective actions so that there is no reoccurrence of similar issues.\r\n???\tNeed to inform SM and above for Fab Evacuation and any Line Down issues	2020-12-31	10	Better 6S with reduced safety incident	NIL	NIL	1	1	1	NIL	NIL	NIL	null		148	135493917	5
119	Support Key customer programs to meet Revenue targets for 2020	POET Projects for revenue:\r\n1) Provide alpha wafers for 25G DML flip chip process \r\n2) Provide beta wafers for Almae BH process	2020-12-31	10	Wafer acceptance by POET	NIL	NIL	1	1	1	NIL	NIL	NIL	null		218	673813648	3
121	Yield	Improve Wafer yield after fixing the process issues	2020-12-31	30	Eliminate the issues	NIL	NIL	1	1	1	NIL	NIL	NIL	null		218	673813648	6
123	Personal development	1) Mentor new hires to bring them into working level\r\n2) Professional conversion program (PCP) for new employees\r\n3) Leadership skill development to lead the team	2020-12-31	10	Mentoring and PCP	NIL	NIL	1	1	1	NIL	NIL	NIL	null		218	673813648	5
118	NRE	1. POET (Almae BH wafer and 25G DML for interposer)\r\n\r\n2. Acacia (1550nm racetrack SOA) \r\n\r\n3. Hitachi 1550nm SOA with 50nm bandwidth and P down.\r\n \r\n4. ZTE 1550nm Gain Chip and SOA with Psat of 21dBm \r\n\r\n5. Huawei 1550 High DOP SOA with Flip Chip	2020-12-31	15	Weekly update reports by team	NIL	NIL	1	1	1	NIL	NIL	NIL	null		144	430837474	3
513	Goal 2	Objective 2	2021-01-31	50		Covid 19 is bad	Ok Very Good	1	1	1	NIL	NIL	NIL	Not On Track		\N	17	6
397	Revenue	Meet company revenue goals for 2020	2020-12-31	30		NIL	Must meet new AOP targets in 2020	1	1	1	NIL	NIL	NIL	On Track		260	985791817	1
514	Goal 1	Objective 1	2021-12-31	50		I followed everything as per instructed	Actually you did not follow my comments during Goal Settings	1	1	1	NIL	NIL	NIL	Not On Track		278	17	6
164	Aging WIP reduction and Establish Utilization tracking	1. To reduce the Aging WIP in both manual station and autobar station based on the PPC plan by fully utilizing the equipment usage. \r\n2. To establish utilization tracking to track operations performance.\r\n3. To establish OEE and achieve a target of 60%, using Auk solutions software.\r\n4. Achieving cleaving CT 95% percentile 5 days.\r\n\r\nTracking Source/Documents:\r\n * email and weekly presentation report in the ops meeting\r\n1. G:\\Shared drives\\APT Team Folder\\APT Reports and Tracking\\Aging WO Tracking\r\n2. G:\\Shared drives\\APT Team Folder\\APT Reports and Tracking\\Machine Utilization\r\n3. The program was on-hold after the pilot phase. It is found that it still require another set of sensor and AI to calculate the true OEE considering the 3 components such as Availability x Peformance x Quality.\r\n4. G:\\Shared drives\\APT Team Folder\\APT Reports and Tracking\\WO CT_excel	2020-05-13	50	1.) G:\\Shared drives\\APT Team Folder\\APT Reports and Tracking	NIL	Tracking of excel manually is being presented by APT supervisor on the Aging WIP and Utilization although data accuracy is really in question during the 1H of 2020. 2H of 2020 of further automating the various typical semiconductor WIP reports with data accuracy thru W/O automation in ODOO is pivotal for measurement of success. A lot of time and effort from various department has been consumed as a concerted effort and this needs to be delivered. This needs to be driven and well communicated , and must Go-Live after cleaning up the pathway and road-blocks faced by the end users. \r\nThe utilization tracking using IoT sensors is a success as the AutoBar and Manual Station reports are validated to be accurate. The plan is to have the utilization reports fully accurate and validated before 2H of 2020 ends.	1	1	1	NIL	NIL	NIL	On Track		222	1014312820	4
172	Achieve Revenue Target	Q Target        = Actual Revenue\r\nQ1: 1.2M       = 1.1M\r\nQ2: 2.2M       = 1M\r\nQ3: 4.2M       = 1.9M\r\nQ4: 3.4M       =	2020-12-31	15		NIL	To deliver any revenue goals, the contribution from Operational Excellence will come from ingenuity to deliver productivity improvement tools for the end user to use as a tool to improve their overall KPIs deliverables. Building accurate dashboards (Eg OTD Dashboards), Kaizen boards on the shop-floor, WIP management thru automation (Odoo) and thruput tracking thru automation (Odoo and in house sensors) becomes a key for this deliverable.	1	1	1	NIL	NIL	NIL	On Track		222	1014312820	6
177	Identify and Fill all 2020 budgeted positions	1. Hire technicians and operators to fill the vacant positions, a total of 3 headcounts to hired. Provide training to operators.\r\n- Hired technicians were stuck in Malaysia due to pandemic.\r\n\r\n2. Reduce Attrition rate by 50%\r\n- This is data driven. Must understand the reasons behind attrition rate. Secondly, need to determine which department is the main contributor of the attrition rate. \r\n-If related to APT and mainly because of the training. The data must be tabulated to prove the hypothesis. Besides, all the apt operators were trained and certified which the document is keep by HR.	2020-12-31	2		NIL	Supervisor has changed and this becomes not applicable	1	1	1	NIL	NIL	NIL	On Track		222	1014312820	5
146	Personal development	- File a patent / trade secret/publish technical paper\r\n- Cross training on each tools to have complete coverage\r\n- Mentor ship to IA students\r\n- Leadership participation from module side in 1 project that helps in revenue achievement.	2020-12-30	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		178	1776097184	6
333	Efficient facility operation	- Daily monitoring of facility equipment & machines to ensure it is working smoothly. \r\n- Regular preventive maintenance and servicing to prevent unscheduled downtime or breakdown.\r\n- Utilize internal capabilities to repair or service of breakdown machines or equipment to avoid unnecessary costs.\r\n- Source out parts and services that offer value for money. \r\n- Review any under-contract services to cut down costs. \r\n- Energy saving initiatives.	2020-12-30	20	Checklist, weekly reports and PM reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		196	2047523461	4
302	Maintain PRF system (TRX) and PO system (Quickbook). Ensure all POs are issued timely and track the status.	Maintain PRF system (TRX) and PO system (Quickbook). Ensure all POs are issued timely and track the status.	2020-12-31	30	PO Master data sheet	NIL	NIL	1	1	1	NIL	NIL	NIL	null		174	1904933651	4
198	New tools identification and purchase	For DL ramp up, quality improvement and cost reduction.	2020-12-30	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		178	1776097184	6
202	Back up tools qualification	Ridge etch in SAMCO qualification	2020-10-30	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		192	206959734	4
200	SLED production maintenance		2020-12-31	10	Produce SLED dies meeting program specification	NIL	NIL	1	1	1	NIL	NIL	NIL	null		194	290990818	4
205	Reduction of CoNC		2020-12-31	15	Achieve >50% reduction	NIL	NIL	1	1	1	NIL	NIL	NIL	null		194	290990818	4
136	TIBCO databased enhancement project	Kickoff TIBCO databased enhancement project by creating different scripts to extract data from different stations, and then consolidate together for better data accuracy, data traceability & fault investigation.	2020-12-31	40	MySQL Database	NIL	NIL	1	1	1	NIL	NIL	NIL	null		225	1256890838	4
137	Yield System Setup	Yield System Setup: \r\n1. Establish weekly yield meeting report structure & driving system\r\n1.1 Establish weekly yield reporting framework\r\n1.2 Clean up the data source to ensure data accuracy\r\n1.3 Establish & align cum yield calculation methodology and list of criterias for yield calculation. \r\n1.4 Based on 75% cum yield goal, breakdown & establish individual goals for test/APT/Coating with clear ownership	2020-12-31	30	Tracking File	NIL	NIL	1	1	1	NIL	NIL	NIL	null		225	1256890838	5
138	Procurement	Drive for cost savings with the suppliers and ensure supply assurance.	2020-12-31	25	Reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		149	759336758	4
350	Set up a model to simulate the AIX200 MOCVD	1.2\tUnderstand the behaviour of AIX200 MOCVD reactor, build a model to estimate the surface wafer temperature and process flow during each run with various III-V coating so that all process engineer can use to conduct production wafer growth in AIX200	2020-12-31	15		NIL	NIL	1	1	1	NIL	NIL	NIL	null		163	1373136557	4
145	Cost reduction	- Identify cost reduction opportunities \r\ni) Litho rework reduction[On track, current performance at <7%]\r\nii) Resist coverage(DUV to i-line)\r\niii) 3" process readiness[Done for litho area, 3" chuck and coating recipe]	2020-12-30	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		178	1776097184	4
163	COST: Cost saving	Cost saving\r\nReduce the cost of consumables\r\n1.Au in E-beam, sputter & Plating\r\n2. Pt in E-Beam	2020-12-15	10	SOP	NIL	NIL	1	1	1	NIL	NIL	NIL	null		209	1723530200	6
398	Branding & Marketing	To implement a branding and marketing strategy to enhance DenseLight's branding image	2020-12-31	15	Presentation of branding activities	NIL	Great work in improving brand image of DLS.	1	1	1	NIL	NIL	NIL	On Track		260	985791817	6
521	objective 1	description 1	2020-12-11	100	goal 2	NIL	NIL	3	1	1	NIL	NIL	NIL	On Track		\N	17	1
60	Production Planning (Achieve Target Revenue 2020)	Achieve US$7.6M revenue in 2020 as per AOP	2020-12-30	50	Revenue File	NIL	NIL	1	1	1	NIL	NIL	NIL	null		153	253052978	1
331	NPD Test Lab Operation	???\tImplementation of tester SPC\r\n???\tAutomate PER Test\r\n???\tAutomate SOA Test\r\n???\tDocumentation of new Tester Setup (SOA/PER/S21/RIN)	2020-12-30	25	Task3_Gantt.xlsx	NIL	NIL	1	1	1	NIL	NIL	NIL	null	Task3_Gantt.jpg	146	1616831965	3
515	Goal 2	Objective 2	2021-12-31	50		Due to Covid	OK noted	1	1	1	NIL	NIL	NIL	Not On Track		278	17	6
188	Support Revenue Thru Critical Program Execution (SOA)		2020-12-31	15	Produce SOA dies meeting program specification	NIL	NIL	1	1	1	NIL	NIL	NIL	null		194	290990818	3
301	Production Planning System Improvement(Odoo)		2020-12-31	30	Odoo System	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		215	161961016	5
139	APT	Achieve shipment goals and hit key metrics for APT	2020-12-31	25	Reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		149	759336758	4
342	Revenue Support	Recover CBT yield back to 85.6% (Q4) through baseline yield improvement breakthrough.\r\n\r\nQ3 Status:\r\nQ1 = 13 wafers tested, avg yield = 64.1%\r\nQ2 = 17 wafers tested, avg yield = 74.4%\r\nQ3 = 18 wafers tested, avg yield = 70.0%\r\nNo record of miss-shipment for first half of 2020.	2020-12-31	15	ELED Yield Improvement	NIL	NIL	1	1	1	NIL	NIL	NIL	null		169	1352141850	6
140	Projects	Drive KFA projects to conclusion	2020-12-31	25	Reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		149	759336758	6
229	KFA5.3	Efficient / effective integration between light source and agnostic platform (DPhi / optical interposer / fiber) for photonic integrated device application.	2021-01-01	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		234	2076006951	3
130	External Manufacturing	Improve and manage business relationship and KPIs with the subcons.	2020-12-31	25	Subcon Reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		149	759336758	4
173	Subcon Operational Management	To manage yield and cycle time of subcons	2020-12-31	25	QBR reports, SOWs	NIL	NIL	1	1	1	NIL	NIL	NIL	null		188	50985924	5
372	IT Management	Denselight???s Website on Google Analytics for Sales Department	2020-03-31	10	Configure automatically email to Sales Department for Analytics report monthly	NIL	NIL	1	1	1	NIL	NIL	NIL	null		164	1428738048	4
401	Monthly BOD report to be send out by 2nd week	Ensure Board will be update at the regular interval and progress of the company	2021-01-15	25	Date BOD ppt report email out	NIL	Good work here to send report on time.	1	1	1	NIL	NIL	NIL	On Track		261	988735390	5
402	Monthly closing within 4 working days	Financial reporting effectively close on the 4 working days after month end	2021-01-15	25	Date of closing and email out	NIL	Good job by the team here	1	1	1	NIL	NIL	NIL	On Track		261	988735390	5
358	Overcome the challenges in developing new products	1. Develop new products for DLS, start with high BW SLED product. \r\n2. Contribute to current DLS projects such as 25G DML, high power DFB and BH development to solve key issues in the growth of such wafers.	2020-12-31	10	Improve device's performances	NIL	NIL	1	1	1	NIL	NIL	NIL	null		163	1373136557	3
303	Achieve cost savings of >$250k for 2020	Achieve cost savings of >$250k for 2020	2020-12-31	30	PO Master data sheet	NIL	NIL	1	1	1	NIL	NIL	NIL	null		174	1904933651	4
309	APT Manufacturing		2020-12-31	25		NIL	NIL	1	1	1	NIL	NIL	NIL	null		159	689543953	5
332	Manpower Management	???\tContinuous training of new Process\r\n???\tTransparent & Regular communication\r\n???\tAutonomy in known work routine\r\n???\tOpen for suggestion in improving the testing process	2020-12-30	25	Task4_Gantt.xlsx	NIL	NIL	1	1	1	NIL	NIL	NIL	null	Task4_Gantt.jpg	146	1616831965	3
516	adi	aditya	2020-12-11	20	aishwary	NIL	NIL	1	1	1	NIL	NIL	NIL	null		277	18	3
247	Epi growth development for 25 G DFB based on AlGaInAs materials for 6 different wavelength for i-temp applications	Al based material growth in G4 MOCVD and device qualification\r\n\r\n- 10G/25G DML Al based epi structure qualification\r\n???\tD-version Epi structure optimization\r\n???\tR-version Epi structure optimization\r\n???\tB-version Epi structure optimization\r\n???\tB2-version Epi structure optimization (doped Barrier with 2E16 Zn)\r\n- High power CDWM DFB Al based Epi structure qualification (1270, 1290 nm, 1310, 1330 nm, 1350 nm and 1370 nm)\r\n- 25G DML for high speed \r\n- Create a SOP for Al materials growth \r\n- Develop a master recipe for Al based materials without any contamination such as Si, Zn and O free for each wavelength: Please follow the wafer list attached with this goal \r\n   a. Before any prime run , it is advisable to run one dummy run ( with high Al containing layers) to remove the O traces inside the reactor	2020-09-30	20	G4 log sheet	NIL	NIL	1	1	1	NIL	NIL	NIL	null		147	645448974	3
351	DFB 16xx: CBT yield goal	To achieve 75% of SMSR Yield for Almae wafer and 60% for Eulitha.	2020-12-31	20	To find out the best grating design for 16xx DFB	NIL	NIL	1	1	1	NIL	NIL	NIL	null	SMSR_vs_Kappa-L.JPG	252	10	3
364	Talent Succession Planning via Functional Reviews	Ensure sufficient Benchstrength	2020-09-30	20	Functional Reviews Minutes	We have finished the Functional Reviews for Operations, Process/Prod Engr, Supply Chain, Sales and we have identified 2 additional section managers - Aaron, Chuan Ye in Subbu's team.  We have also conducted 3 out of 6 leadership training to help the new leaders/supervisor improve their managerial knowledge.	Need to do annual talent ranking excercise	1	1	1	NIL	NIL	NIL	On Track		256	534558467	5
382	Team management for MFG, Fab B & MOCVD Equip and Facility	??? Ensure all my team members always align to the company goals. ??? Maintain employee work schedules including assignments, job rotation, training, vacations and paid time off, good team communication, coverage for absenteeism, and all other work related scheduling. Goal is to ensure there is always good equipment support to the MFG need. ??? Empower employees to take responsibility for their jobs and goals. Delegate responsibility and expect accountability and regular feedback. ??? Foster a spirit of teamwork and unity among equip and other departments (MFG, Process, facility), allows for disagreement over ideas, conflict and expeditious conflict resolution, and the appreciation of diversity as well as cohesiveness, supportiveness , and working effectively together to enable each team members, other departments and company to succeed.	2020-12-31	10	Better team work and productivity	NIL	BS is a good manager but attrition rate is high for direct staff	1	1	1	NIL	NIL	NIL	On Track		259	135493917	5
522	goal 1	objective 1	2020-12-11	100	goal 1	NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	17	1
335	Customer oriented, impartiality and honesty	- Serve internal customers at high satisfaction to meet performance expectations.  \r\n- Engage external customers with professionalism, fairness and honesty when doing activities and services.	2020-12-30	20	Checklist, Reports and documents	NIL	NIL	1	1	1	NIL	NIL	NIL	null		196	2047523461	1
392	DMES Phase 2 - Fab B Automation	Original Objective:\r\nDevelop/Write a program application using Microsoft Visual studio and C# Language with Maria DB Server\r\n1a. Operation Tool\r\n1b. Engineering Tool \r\n1c. Dashboard Tool \r\n1d. Production Scheduler\r\n\r\nNew Objective:\r\nTo improvise the DenseSoft system into new face with advanced features. DenseSoft is changed to DMES and divided to several Phases. \r\nPhase 1:\r\n1a) Operation Tool \r\n- Wafer Execution with separate functionality for each steps\r\n  > Generic\r\n  > QC Parameter Insertion\r\n  > Litho\r\n  > Litho Cleaning Procedure\r\n  > Transaction History\r\n  > Rework\r\n  > Event Log\r\n  > Rework History\r\n1b) Engineering Tool with advanced features\r\n- Enable Engineer to update and maintain Fab B Registry\r\n  > Mask\r\n  > Product Code\r\n  > Equipment\r\n  > Recipe\r\n  > Module\r\n  > Stage\r\n  > Block\r\n- Enable Engineer to Create Runsheet Template \r\n  > Modify Runsheet template using form view\r\n  > Modify Runsheet Template using Excel - Download and Upload\r\n- Enable Engineer to create Runsheet for Wafer Release\r\n  > Production Runsheet\r\n  > Engineering Runsheet\r\n  > Formula Selection\r\n  > Hold\r\n  > Skip	2020-05-01	35	DMES Phase 2	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track	Capture.PNG	214	1608216415	3
320	Production Planning (Inventory & Materials/Forecast)		2020-12-31	20	Inventory and Forecast Files	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		213	426739617	4
373	IT Management	Implementation Sales module in Odoo ??? Intranet for Sales Department	2020-09-30	10	Modify Sales Module as per Sales Department requirements	NIL	NIL	1	1	1	NIL	NIL	NIL	null		164	1428738048	4
379	Software Management	Synchronization from Odoo ??? Intranet Sales to Quickbook on new Customer Account creation. Currently sales team still have to do double work to create a customer account in Odoo ??? Intranet and Quickbook	2020-12-31	10	Follow up with external 3rd party Odoo vendor (Pragmatic - India) to fix the issues on synchronization from Odoo to Quickbook or find other work around solutions	NIL	NIL	1	1	1	NIL	NIL	NIL	null		164	1428738048	4
380	6S, Housekeeping and Safety	??? Take ownership for the housekeeping compliance for the team and drive the team to achieve Zero NC due to housekeeping and Zero non-conformance for Safety ??? Constantly communicate with the team and align them on housekeeping and safety protocol ??? Drive the team for the ability to detect safety gaps and resolve them. ??? Need to take ownership and responsibility for all safety related issues. ??? Inform supervisor immediately for serious incidents. Need to ensure execution of preventive and corrective actions so that there is no reoccurrence of similar issues. ??? Need to inform SM and above for Fab Evacuation and any Line Down issues	2020-12-31	10	Better 6S with reduced safety incident	NIL	Good safety record	1	1	1	NIL	NIL	NIL	On Track		259	135493917	5
304	Drive Subcon on time delivery and shorten lead time		2020-12-31	30	SUBCON WIP EXCEL TRACKING SHEET	NIL	NIL	1	1	1	NIL	NIL	NIL	null		174	1904933651	4
196	Facilty Project and repair	installation Of NEW new water cooling chiller system.\r\n\r\nRepair and install 13 new FFU for the clean room APT and FAB B.\r\n\r\nImplement at least 5 improvement projects by Dec 2020\r\n\r\nImplement 10 new SOP to improve the facility equipment???s reliability, be it hardware of system improvement.\r\n\r\nImprove Facilities maintenance program to zero out the facility breakdown. \r\n\r\nImprove the factory facility for better safety and work environment.	2020-12-30	35		NIL	NIL	1	1	1	NIL	NIL	NIL	null		197	1017729787	4
230	SOA	To assist in checking the device capability which meets the customer requirements.	2021-01-01	5		NIL	NIL	1	1	1	NIL	NIL	NIL	null		234	2076006951	3
295	NPD and NRE	To assist NPD in the process development samples execution to improve Time to Market	2020-12-31	10	NA	NIL	NIL	1	1	1	NIL	NIL	NIL	null		167	973701598	3
336	EHS improvement & compliance	- Implement DSL EHS policies.\r\n- Ensure DSL is a safe place to work.    \r\n- Comply with authorities requirements, such as permits, licenses, medical checks and safety measures. \r\n- Implement and improve existing EHS procedures and guidelines. \r\n- Ensure effective ERT (Emergency Response Team) organization\r\n- Review and improve ERP (Emergency Response Plan)\r\n- Regular EHS audit to monitor  effectiveness and performance.\r\n- Assist all departments to comply with the Risk Assessment, so as to identify and evaluate risks in their area and that the proper control measures are in place.	2021-12-30	40	Checklist, reports and EHS documents.	NIL	NIL	1	1	1	NIL	NIL	NIL	null		196	2047523461	6
314	ILM engineering and manufacturing processes and systems	ILM engineering and manufacturing processes and systems\r\n???\tPlan and Support on ILM engineering and manufacturing for production line.\r\nA lot of things to learn at same time, run for production to meet shipping date.\r\nQuality VS Time	2020-10-30	10	Meet Q3 for Yield of boxes	NIL	NIL	1	1	1	NIL	NIL	NIL	null		220	231731743	6
307	Achieve and Revenue	Achieve US$ 7.5M  Revenue in 2020 as per base AOP.  Stretch goal is $3.4M\r\nOperations for Q4\r\nKey measures:\r\n1)\tMeet monthly and quarterly target.\r\n2)\tMaintain 90% Box yield for box assembly on Q3\r\n3)\tEnsure and maintain supply of raw materials in follow up and estimate of based on Q4.	2020-09-30	70	Meet Q3 for Yield of boxes	NIL	NIL	1	1	1	NIL	NIL	NIL	null		220	231731743	1
412	Quality	1) CONC, NCMR, RMA, SPC, Bin level SPC, Audits, PRM/ORT set up	2020-12-31	25	quality indices	NIL	Progress made on PRM/ORT, Bin Level SPC, audits, CONC	1	1	1	NIL	NIL	NIL	On Track		263	324340084	6
184	Revenue	target to reach US$5M above revenue from Greater China in 2020	2020-12-31	50		NIL	NIL	1	1	1	NIL	NIL	NIL	null		157	25957709	6
517	fff	fff	2020-12-11	100	ff	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		280	17	3
199	ELED production maintenance		2020-12-31	10	Produce ELED dies meeting program specification	NIL	NIL	1	1	1	NIL	NIL	NIL	null		194	290990818	4
201	FBGL production maintenance		2020-12-31	10	Produce FBGL dies meeting program specification	NIL	NIL	1	1	1	NIL	NIL	NIL	null		194	290990818	4
204	Support Runsheet Conversion to DMES		2020-09-30	10	Transfer all runsheets to DMES	NIL	NIL	1	1	1	NIL	NIL	NIL	null		194	290990818	4
126	Back up tools qualification	Release Grating etch recipe in SAMCO tool	2021-03-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		192	206959734	4
381	Training	??? Take ownership for the team training needs and attendance. ??? Ensure MFG Engineer and Equip SM assigned training for team member are follow through closely. ??? Ensure training received by team members are aligned and help in the execution of their work responsibility. ??? Responsible to ensure OJT for new comers to address their working needs	2020-12-31	10	Skill and training record	NIL	Need to improve operator training in Fab B	1	1	1	NIL	NIL	NIL	On Track		259	135493917	5
374	IT Management	Implementation Manufacturing Order module in Odoo ??? Intranet for APT - Operation Department	2020-09-30	10	Modify Manufacturing Order Module as per APT - Operation Department requirements	NIL	NIL	1	1	1	NIL	NIL	NIL	null		164	1428738048	4
321	Production Planning System Improvement(Odoo)		2020-12-31	30	Odoo System	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		213	426739617	5
359	Train equipment engineer on MOCVD	1. Set up a procedure for AIX200 and G4 MOCVD reactor to work stable with proper maintenance schedule. \r\n2. Train equipment engineer the working principle of MOCVD and how AIX200 and G4 MOCVD reactor work. Explain key factors that need closely observation.	2020-12-31	10	MOCVD uptime	NIL	NIL	1	1	1	NIL	NIL	NIL	null		163	1373136557	5
523	goal 1	objective 1	2020-12-11	100		NIL	NIL	3	4	1	NIL	NIL	NIL	On Track		289	17	1
369	NLW Laser / FBGL	To support sales and achieve the revenue for the NLW laser product	2020-12-31	16	To support sales and achieve the revenue for ILM product	NIL	NIL	1	1	1	NIL	NIL	NIL	null		252	10	1
355	ILM	To support sales and achieve the revenue for ILM product	2020-12-31	16	To support sales and achieve the revenue for ILM product	NIL	NIL	1	1	1	NIL	NIL	NIL	null		252	10	1
452	DMES Phase 3 - Fab B Automation	Original Objective:\r\nDevelop/Write a program application using Microsoft Visual studio and C# Language with Maria DB Server\r\n2a. Analysis\r\n2b. Planning\r\n2c. Design\r\n2d. Execution\r\n2e. Testing (User Acceptance)\r\n2f. Deployment\r\n\r\nNew Objective:\r\nDue to Project reprioritization, objective is changed from GATR to DMES Phase 3.\r\n2a) Engineering Tool with advanced features\r\n - Enable engineers to modify the Runsheet after the runsheet is released to Production\r\n - Code QC Formula for all types of Runsheets \r\n - Enable Engineer to set \r\n2b) Implement all Fab B technologies in DMES\r\n  > FBGL\r\n  > DFB\r\n2c) Modify DMES Wafer Execution\r\n- DMES will compute the formula based on runsheet type\r\n- Enable Manufacturing team to select Equipment on certain steps	2020-09-30	35	DMES Phase 3	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track	2.PNG	214	1608216415	3
365	IT Management	Preparing Virtual Machine for 7 Virtual PC to hold 1 License of Windows 10 Pro, Ms Office 2019, JMP and Quickbook.	2020-03-31	10	Purchased Synology RS1619XS+	NIL	NIL	1	1	1	NIL	NIL	NIL	null		164	1428738048	4
377	Software Management	Tibco Spotfire and JMP implementation on Virtual PC	2020-09-30	10	Purchased 2 Virtual Machine (12 Virtual PC) to host 2 JMP licenses and also Tibco Spotfire installed on all VPC	NIL	NIL	1	1	1	NIL	NIL	NIL	null		164	1428738048	4
344	New Product Development	To add new product line-up in addition to company's existing product portfolio.	2020-12-31	15	Customer Engagement	NIL	NIL	1	1	1	NIL	NIL	NIL	null		169	1352141850	3
305	Reporting of Expense and Savings		2020-12-31	10	PO Master data sheet	NIL	NIL	1	1	1	NIL	NIL	NIL	null		174	1904933651	4
168	PDMS Data Migration	Continuously support the team to complete the PDMS Data Migration to the its  Database by \r\n1. Establishing a folder structure and naming convention.\r\n2. Rectifying issues found in the test folders.	2020-12-31	3	http://pdfwin.denselight.com:8080/spotfire/library?guid=3b65dd09-212a-47b7-9ebf-71d860a42337	NIL	Achieved goal in the 1H chipping in to validate structure driven by PE	1	1	1	NIL	NIL	NIL	On Track		222	1014312820	4
167	KFA 3.6 Timely Capacity Expansion for Revenue Ramp	To fulfill the goal of the KFA by \r\n1.) Establishing a capacity model, compute existing and forecasted volume.\r\n2.) Re-layout APT and ILM to improve efficiency	2020-12-31	20	G:\\Shared drives\\SBP Team Drive\\KFA 2020\\KFA 3 (Subbu and BS)\\KFA 3.6 (Syrex)	NIL	1) Need to fine tune the capacity model which has to be interactive with dynamic demand forecast , and the industrial parameters/ assumptions needs to refine - The weakness of the model is the UPH where there's no check and balance and accuracy is in question. Will need to improve this further as a overall capacity model in the 2H \r\n2) Re-Lay out underway by the APT team in the 2H.	1	1	1	NIL	NIL	NIL	On Track		222	1014312820	4
169	Office Administration	a. Ensure all Corporate Travel request are approved in FYLE before requestor can proceed to make travel booking. \r\nb. Overseeing general office operation ??? answering phone calls, purchasing and maintaining proper stock for office supplies??? Stationary, cleaning, pantry use, office furniture and fixture. \r\n    i. Managing office cleaner and part-time cleaner to maintain office hygiene. \r\nc. Manage and follow up on Company Safety License and Permit Renewal on yearly basis. \r\nd. Assisting Safety Officer on the application for TLD badge (Arsenic & Radiation test) with NEA. ??? [MOCVD staff]\r\ne. Support on ad hoc Project administration and coordination to the needs of CEO and the Senior management team. Maintaining the overall work plan, project plans and tracking key tasks. Example: COVID-19 CB planning, Follow-up and compiling Employees Travel & Health Declaration, Collate PMP from employees	2020-12-31	25		NIL	NIL	1	1	1	NIL	NIL	NIL	null		207	1779366736	6
166	Executive Assistant	a. Manage CEO???s calendar, advise on conflicting events and carry out multiple rescheduling as necessary.\r\nb. Prepare and compile monthly Townhall presentation decks\r\nc. Manage the Travel bookings timely, accurate and represent good value for money.	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		207	1779366736	6
170	Supply Chain - Goods Receiving	a. Ensure 100% goods received are processed in QuickBooks in a timely and accurate manner\r\nb. Process Improvement on Goods Received Flow	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		207	1779366736	6
171	Sales & Marketing	a. Project completion on revamping the website\r\nb. Work with PE and PPC team to clean up all Product lists and remove the obsolete ones. Also, to understand from them which products are difficult to build\r\n-\tUpdate all Product Brochures with up-to date Product list\r\n-\tMaintain the website with up-to date Product list\r\nc. Improve DenseLight branding through social media. Create social media contents and post it twice a month in LinkedIn\r\nd. Provide Customer Service support for USA region \r\n-\tQuote within 48hours after receive an inquiry\r\n-\tEnter Sales Order and then send Order confirmation to Customer within 48hours after PO receive.\r\n-\tSupport after-Sales support such as chase for payment and provide shipping document to Customer after shipment has shipped.	2020-12-31	55		NIL	NIL	1	1	1	NIL	NIL	NIL	null		207	1779366736	6
176	KFAs	To ensure objectives of participating KFAs are achieved	2020-12-31	25	KFA Reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		188	50985924	5
165	KFA 1.3 People's Development and KFA 4.3 Automation in APT	To support and fulfill the goal of KFA 1.3 and KFA 4.3	2020-12-31	10	G:\\Shared drives\\SBP Team Drive\\KFA 2020	NIL	Early Participation achieved in the KFA 1.3 , not much contribution on KFA 4.3 although both KFA's been led well by their leaders with some results.	1	1	1	NIL	NIL	NIL	On Track		222	1014312820	4
185	sale channels/distributors	Sign two or more distributors in Greater China	2020-12-31	25	Distribution contract documents	NIL	NIL	1	1	1	NIL	NIL	NIL	null		157	25957709	1
518	sss	ss	2020-12-11	100	ss	NIL	NIL	1	1	1	NIL	NIL	NIL	null		282	17	3
175	APT operational improvements	To commision and complete buy-off of new APT equipment and to create new recipes, if required.	2020-12-31	25	Buyoff reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		188	50985924	4
174	Development of new products at subcons	To develop new engineering products at various subcons	2020-12-31	25	SOWs, ATRs	NIL	NIL	1	1	1	NIL	NIL	NIL	null		188	50985924	3
322	Cost Reduction/Capex Avoidance	Yelo Burn-in Machine Qualification to COS ??? Q2\r\nILX Module Burn-in Capacity Improvement ??? Q3\r\nReview the gap between ST1 and ST4. Define actions that we can take to bring up ST1 to be as capable as ST4. Provide proposal to management.	2020-12-31	30		NIL	NIL	1	1	1	NIL	NIL	NIL	null		181	1536568573	4
310	Capacity Improvement	Implement Set-up for BFs Coil winding. Done\r\n\r\nBut I put addition foam to prevent from wobbly and also install holder fiber tool so that your hand can be brake for spool\r\n\r\nIt can work on FOS4X coil, I would like to experiment on it later or soon.	2020-10-30	10	Upgrade modify	NIL	NIL	1	1	1	NIL	NIL	NIL	null	Coil.jpeg	220	231731743	4
337	Development of Instrument class libraries for automation	To develop and maintain class modules and libraries for various hardware/instrument/devices available in lab and that procured for use in future projects.	2020-12-31	50	Kanban Board	NIL	NIL	1	1	1	NIL	NIL	NIL	null		183	711389827	4
475	40mW FBGL module		2020-12-31	15		NIL	NIL	1	1	1	NIL	NIL	NIL	null		145	1813039923	3
345	MOPA development	Develop 200mW MOPA prototype for WindLidar applications	2020-11-30	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		145	1813039923	3
505	Hunet Test	Hunet Test	2020-09-09	100		NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		\N	17	1
311	APT Manufacturing		2020-12-31	25		NIL	NIL	1	1	1	NIL	NIL	NIL	null		159	689543953	6
323	Production Cost Improvement	Process Yield Improvement/Scrap Reduction:	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		181	1536568573	4
182	DPHI implementation, including HIPP to OE solutions engineering	Design of OE solutions based on DPhi technology. \r\n- Optical Engine\r\n- Optical Transceiver\r\n- Narrow Linewidth Engine	2021-03-01	20	Patents/Design documents/Technical reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		200	1777433913	3
519	dd	dd	2020-12-11	100	dd	NIL	NIL	1	1	1	NIL	NIL	NIL	null		283	18	3
181	DLS-AMF MOU and POC1&2	To successfully complete collaborative project with AMF for \r\n1) POC1 - Demonstration and analysis of optical coupling between Mode field adapter (MFA) devices and edge coupler on AMF Silicon Photonics platform.\r\n \r\n2) POC2 - Deliver a Flip-chip solution for InP devices on Silicon photonics platform and demonstration of Flip-chip coupling on AMF Silicon Photonics platform.	2021-03-01	30	Design documents/Technical reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		200	1777433913	3
180	DPhi and Optical Engine solutions Technical Directions	To develop and contribute to the collective technology and know-how of DPhi which provides Denselight with the competitive edge in the integrated photonics market.	2021-03-01	30	Patents/Design documents/Technical reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		200	1777433913	3
183	Denselight Semiconductor Optical Amplifier (SOA) development program	Identifying and proactively provide technology development engineering support to NRE programs, NPI projects, Product Engineering, and APT, in the area of advanced packaging integration & related test engineering	2021-03-01	20	Design documents/Drawings/Technical reports	NIL	NIL	1	1	1	NIL	NIL	NIL	null		200	1777433913	3
38	Accounts Payable Management	Accounts payable e-payment to be done when term due or fund available, monitor closely of advance payment and accounts payable balance, notify vendor when payment made.	2020-12-31	60	NIL	NIL	Agreed within cash flow allow	1	1	1	NIL	NIL	NIL	On Track		227	104959828	6
203	Support Conversion of 2" to 3" Wafer Processing		2020-12-31	15	3" wafer fabrication successful with comparable yield as 2"	NIL	NIL	1	1	1	NIL	NIL	NIL	null		194	290990818	4
189	pico track qualification	1.already finished all coating recipe qualification and 1 develop recipe qualification at July-2020\r\n2.will finish other develop recipe qualification before Nov-30th-2020"	2020-11-30	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	589561367	5
338	DITA Platform Build	To develop, maintain and enhance DITA to cater to everyday needs of Test Automation.	2020-12-31	50	Kanban Board	NIL	NIL	1	1	1	NIL	NIL	NIL	null		183	711389827	4
207	Meet revenue target	To achieve revenue target in 2020. Revenue target is , for 16xx DFB US$1857K and for other products US$3285K in China market( Company's annual sales revenue is US$13440K).	2020-12-31	50		NIL	NIL	1	1	1	NIL	NIL	NIL	null		195	1369735000	1
206	To promote new products to customers	Promote new products( 25G CWDM4 DFB, 1550nm gain chip and SOA etc) to telecom customers, such as tranceiver makers, Huawei, ZTE etc.	2020-12-31	40		NIL	NIL	1	1	1	NIL	NIL	NIL	null		195	1369735000	3
394	Operational Efficiency	To implement programs and or processes that enable sales to increase operational efficiency	2020-04-30	15	Presentation of system/s that increase efficiency	NIL	Good job on the SOA, CRM implementation in Odoo.	1	1	1	NIL	NIL	NIL	On Track		260	985791817	4
187	Support Revenue Thru Critical Program Execution (Low DOP)		2020-12-31	15	Produce Low DOP dies meeting program specification	NIL	NIL	1	1	1	NIL	NIL	NIL	null		194	290990818	3
208	Routine work	Routine work, such as to join weekly revenue call, invite R&D engineer to introduce our new products to customers and provide forecast to factory etc	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		195	1369735000	6
354	KFA 3.2	To establish centralized database for Denselight starting from fab A to APT	2020-12-31	16	To establish centralized database for Denselight starting from Fab A to APT	NIL	NIL	1	1	1	NIL	NIL	NIL	null		252	10	4
375	IT Management	Implementation Inventory Planning module in Odoo ??? Intranet for PPC Department	2020-09-30	10	Modify Inventory Module as per PPC Department requirements	NIL	NIL	1	1	1	NIL	NIL	NIL	null		164	1428738048	4
370	IT Management	Telephone line upgrade, Starhub Telephone Lines configuration and tracing lines points	2020-03-31	10	Prepare rack for Starhub Gateway and lines hubs	NIL	NIL	1	1	1	NIL	NIL	NIL	null		164	1428738048	4
234	01) DPHI HIPP Process Engineering Optical Engine Development Documentation	Process capability development by implementation of HIPP packaging process technology for Silicon Photonics (SiPh) based optical engine products. HIPP process definition, process execution, technical analysis, reporting, and documentation.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		171	9327697	3
228	High Power DFB	To develop a disruptive, high power performance from CW DFB for the telecom/datacom/CWDM applications according to customer's requirements.	2021-01-01	80		NIL	NIL	1	1	1	NIL	NIL	NIL	null		234	2076006951	3
240	07) Quality System Audit	Support QA and External Manufacturing teams on Supplier & Customer Quality Audit and ISO9000 Internal Quality Audit.	2020-12-31	8		NIL	NIL	1	1	1	NIL	NIL	NIL	null		171	9327697	4
241	08) DenseLight Manufacturing Execution System (DMES) support	Support QA and IT teams in validating the changes in the runsheet to ensure no bugs and no issue will be encountered when production use the runsheet.	2020-12-31	2		NIL	NIL	1	1	1	NIL	NIL	NIL	null		171	9327697	4
242	Customer Quality: RMA/Customer Complaints and Feedback	1.\tReduction of customer Valid RMA\r\n-\tReduce customer RMA to 30% from the previous year (2019)\r\n2.\tReduction RMA closure cycle time (CAPA submission)\r\n-\tReduce RMA Interim report submission to 30days (upon received of complete information or RMA units)\r\n-\tReduce RMA Final CAPA closure time to 60days (upon received of complete information or RMA units)	2020-12-31	30	Customer Complaint/RMA Record	NIL	NIL	1	1	1	NIL	NIL	NIL	null		180	1611091001	1
346	1560nm Module	Develop 1560nm FBGL module	2020-12-31	15		NIL	NIL	1	1	1	NIL	NIL	NIL	null		145	1813039923	3
277	Equipment maintenance, CIPs and mindset change	???\tPerform at least 10 improvement to the machine for better productivities or machine reliability. \r\n???\tTo ensure the team login and update the Equipment status properly into the daily equipment status tracking file.   \r\n???\tTo be able make logical and decisive decision to safe guard the company need. \r\n???\tGood to raise concern, but always come up the work around solutions to get things moving.	2020-12-30	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		237	22592094	4
399	Prepare product costing from May to Nov 2020	Prepare product costing for pricing and reference cover FBGL to ILM	2020-12-31	25	Costing excel worksheet	NIL	David has done well in understanding the product costing	1	1	1	NIL	NIL	NIL	On Track		261	988735390	4
160	QUALITY: Documentation for Processes & Tools, Training of Operators and Asses them, NCMR closure	Documentation for all processes & tools\r\n\r\nTraining of Operators and Asses them\r\n\r\nNCMR closure on time	2021-03-01	10	No undocumented processes & tools- SOP, WI, ECN	NIL	NIL	1	1	1	NIL	NIL	NIL	null		209	1723530200	6
224	Perform In house ECV measurements on InP-InGaAsP layers	-Perform ECV measurements to check the doping level\r\n-Verify DLS measurements with that of CSDC measurements\r\n-Make sure ECV hardware is operational\r\n-Design a calibration procedure to maintain the accuracy of dopant profiles	2020-12-31	30	ECV Doping profile document	NIL	NIL	1	1	1	NIL	NIL	NIL	null		211	1510925941	6
312	APT Manufacturing		2020-12-31	25	Revenue (To achieve shipment goals)	NIL	NIL	1	1	1	NIL	NIL	NIL	null		159	689543953	6
179	NPD: 25G coating Qual (Alu DFB) in Denton I29, Low stress SiO2 film for 25G projects, Low Stress SION recipe in Oxford for 25G products/ Renesas projects, KFA 5.2 : BH development	25G Qualification in Denton I29\r\n 1. DOE for the Ar ablation \r\n 2. AR & HR coating stacks for Alu containing QWs in Denton I29\r\n 3. Coating Jig for 150um CL\r\n 4. Develop Ar sputter recipe and show no Al at interface\r\n 5. AR coating for Hermetic devices- HTOL + TS + ESD pass\r\n 6. AR/HR coating for non-Hermetic devices- Pass HTOL, TS, ESD & USDH\r\n\r\nLow stress SiO2 film for 25G projects\r\nSiO2 Film analysis: \r\n1. RI\r\n2. uniformity\r\n3. Stress\r\n4. Etch rate\r\n\r\nLow Stress SION recipe in Oxford for 25G products/ Renesas projects\r\nProcess optimization for SION recipe in Oxford\r\n\r\nKFA 5.2 : BH development	2021-03-01	30	Need to pass Qual criteria (HTOL, Thermal shock & UDH). Documentation for the processes in the tool	NIL	NIL	1	1	1	NIL	NIL	NIL	null		209	1723530200	3
178	OPERATIONS: Denton I29 complete Qualification ( Tool Qual & Product Qual),  AR & HR coating Jigs, Productivity improvement in Oxford and Trion, Back up tool, Oxford AR coating back up for Trion, Daitron Bar stacker Qual & Jig Duplication, Filmetrics F40-ERX Qual, Cary 5000 Spectrophotometer Qual	Denton I29 Tool qualification\r\n 1. Tool Installation: \r\n 2. Process development: calculate n and k values, TF, Recipe developments, \r\n 3. Coating designs for AR & HR\r\n 4. Deposition & spectral measurement for the stacks\r\n 5. Tool Qual: SLED & DFBs\r\n      ( Process development, Deposition ) \r\n      ( Pass- CBT, HTOL, TS & ESD )\r\n\r\nProduct Qual in Denton I29\r\n 1. ELEDs:  CBT & HTOl 2000Hrs Qual\r\n 2. SOA High Psat-  CBT & HTOl 2000Hrs Qual\r\n\r\nAR & HR coating Jigs\r\n\r\nProductivity improvement in Oxford and Trion\r\n\r\nBackup tool readiness\r\n\r\nOxford AR coating back up for Trion\r\n\r\nDaitron Bar stacker Qual & Jig Duplication\r\n\r\nFilmetrics F40 ERX new tool Qual and release for production\r\n\r\nCary 5000 Spectrophotometer Qualification	2021-03-01	50	Need to pass Qual criteria (HTOL, Thermal shock & UDH). Documentation for the processes in the tool	NIL	NIL	1	1	1	NIL	NIL	NIL	null		209	1723530200	4
225	Support activities focused on improvements of the workflow in Fab A	-Set up SPC for Fab A tools as well as various products to monitor and analyze process input parameters and output characteristics which affects the quality of epilayer growth\r\n-Work on monthly KPI reports and send it on time\r\n-Create/Revise procedures for measurement as well as preventive maintenance for various equipment in Fab A\r\n-Provide actual information about grown wafers to Fab B engineers	2020-12-31	30		NIL	NIL	1	1	1	NIL	NIL	NIL	null		211	1510925941	4
223	Conduct supervised growth campaign for standard DLS products (SLEDs and ELEDs) on Aix 200	- Write/modify recipes for single Q layer calibration runs\r\n- Write/modify recipes for MQW calibration runs\r\n-Perform standard characterization :PL,XRD, Visual Inspection\r\n-Interpret characterization results and do flow corrections for growth on Prime substrates\r\n-Prepare GATR reports for Prime wafer growths on Aix 200 and G4 reactor\r\n-Keep up to date information regarding growth runs, characterizations, and wafer transfer details	2020-12-31	40	Aix 200 logsheet, Wafer transfer form	NIL	NIL	1	1	1	NIL	NIL	NIL	null		211	1510925941	6
520	cc	cc	2020-12-11	100	cc	NIL	NIL	1	1	1	NIL	NIL	NIL	null		284	17	3
297	Work Order Automation	Introduce APT Work Order Automation thru ODOO	2020-12-31	30	DLS KPI Dashboard	Several charts has been created using limited data we had initially to build an APT WIP profile thru Odoo automation as a mini ERP system. This is not only limited to WIP profile, but also as aging WIP, Queue time pareto by tool type, and many other customizable charts and trends for analysis.\r\n\r\nTraveler has has been added into Odoo as opposed to hard copy. Invoicing thru Odoo for sub con and tracking is currently underway. \r\n\r\nSo far, the ODOO system is a working solution but is only 65%-70% completed. This journey will be part of a continuous improvement item where the sky will be the limit as new and improved solutions becomes available over time. The last 15%-20% will be the toughest as it will link up the overall structure from W/O release till shipment and linking materials and sub-con as a whole WIP management solution,	NIL	1	1	1	NIL	NIL	NIL	On Track		162	1982477965	6
116	KFA 5.1 - Product Development System	1. Improvement and Implementation PRA and RFC\r\n\r\n2. Improvement and Implementation of PDM\r\n\r\n3. Develop Benchmarking method \r\n \r\n4. Implement ROI template	2020-12-31	5	Monthly KFA 5 update to management	NIL	NIL	1	1	1	NIL	NIL	NIL	null		144	430837474	5
235	02) DPHI HIPP Process Engineering Optical Engine Suppliers Management	Develops engineering process capabilities of external outsource partners to execute HIPP for both prototyping and production phases. Establish outsourcing partners; qualified modular process building blocks, technical specifications, drawings, scope-of-work, reports and lots-compliance requirements.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		171	9327697	3
239	06) Technical Documentation (QA DCC)	Gap analysis to verify technical documents. Sales datasheet creation. Product Data Management Systems (PDMS) product specification QA support.  Product development model (PDM) documentation compliance for every phase gate before phase exit until production transfer.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		171	9327697	4
236	03) DPHI AMF(POC1&2) HIPP Process Engineering Support	Provide HIPP Process Engineering support for DPHI Silicon Wafer Backend Processing (POC2.3) and DPHI Flip Chip Assembly (POC2.4) activities.	2020-12-31	8		NIL	NIL	1	1	1	NIL	NIL	NIL	null		171	9327697	3
237	04) KFA5.3 HIPP Process Engineering Support	Development of new HIPP roadmap capabilities, processes and engineering advancements.	2020-12-31	2		NIL	NIL	1	1	1	NIL	NIL	NIL	null		171	9327697	3
238	05) Quality Management System (QMS)	QMS documentation gap analysis and document control centre QMS documentation reviews. Keep and control all document and data pertaining to QMS documentation procedure, work instructions and manufacturing specs.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		171	9327697	4
120	Operations	Create back up tool run path for one of a kind tools	2020-12-31	20	Wafer acceptance by NPD and pass reliability (2000hrs HTOL pass)	NIL	NIL	1	1	1	NIL	NIL	NIL	null		218	673813648	6
243	In-Process Quality Assurance Improvement Activities	1.\tImprovement to In-coming Quality Assurance\r\n-\tEstablish Incoming Process Control for direct materials (substrates, mask plates, chemicals, gases, others,) using the COC of these materials\r\n-\tCreate incoming inspection request google form and deploy to PPC for any materials required incoming inspection\r\n-\tCentralize documentation and acceptance for incoming material inspection by creating google shared drive for all department incoming material documentations and approval\r\n2.\tImprovement to Process compliance\r\n-\tRe-establish Monthly Quality Patrol Audit to counter check process and manufacturing process compliance to requirement and standard. To check Recipe, Runsheet, GATR, WAT and Test data & results (FMEA, Control Plan and SPC check included)\r\n-\tInclude 6S in the audit checklist to support the 6S program\r\n3.\tRe-institutionalize good housekeeping such as 6S program\r\n-\tConduct 6S orientation/training to all employee. \r\n-\tReward and commendation every townhall for best department 5S performance	2020-12-31	30	Incoming Record, Incident Notice Report, Audit Report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		180	1611091001	4
244	Supplier Quality and CoNC Improvement	1.\tReduction Cost of Non-conformance (CoNC)\r\n-\tReduce Cost of Non-conformance (CoNC) by <5% with respect to the total cost of goods sold (COGS)\r\n2.\tImprovement of External Manufacturing Performance\r\n-\ta)\tReduce Reject/Scrap rate by 2%\r\n-\tb)\tReduce Vendor CoNC by 2% from previous year (2019)\r\n-\tImprove response time to quality issue\r\no\tInterim Report submission 7 days\r\no\tFinal closure 30 days\r\n3.\tImprovement of external manufacturing change management\r\n-\tConduct on-site periodic audit for Ext. Mfg. to ensure change management is being practice\r\n-\tEstablish remote audit system for top tier (or with high quality issues) raw materials supplier	2020-12-31	30	CoNC Report, SCAR, Audit	NIL	NIL	1	1	1	NIL	NIL	NIL	null		180	1611091001	4
245	New Product Development (NPD) / Product Quality Engineering (PQE) / Quality System	1.\tInvolvement of QA function to new product development\r\n-\tEstablish QA gates for each New Product Development Phases\r\n\r\n2.\tEstablish a groundwork for Quality Management System align with automotive standard (TS16949)\r\n-\tAttend (if required) Automotive Industry Standard course/training\r\n-\tAssist QA Manager to prepare system documentations and system	2020-12-31	10	Updated PDM Procedure, QMS gap analysis	NIL	NIL	1	1	1	NIL	NIL	NIL	null		180	1611091001	5
249	Transfer the recipe for production run in DCC folder	Freeze the recipe for Low DOP products and production wafers (54708T high volume product) based on the inputs previously grown wafers.	2020-12-31	5	DCC folder	NIL	NIL	1	1	1	NIL	NIL	NIL	null		147	645448974	6
250	Regrowth recipe optimization in G4 MOCVD	RG recipe development in G4 MOCVD on grating written wafers\r\n- Bottom grating optimization (Grating optimization before active growth) \r\n- Top grating optimization (Grating RG on top of the Quantum wells)	2020-12-31	10	Qualification report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		147	645448974	6
252	Bottom grating optimization	Renesas growth development\r\nStep1A: bottom grating layer growth optimization	2020-06-30	10	Submitted report during Project with Renesas	NIL	NIL	1	1	1	NIL	NIL	NIL	null		147	645448974	3
253	Growth uniformity improvement	Evaluation and improve growth uniformity W2W and R2R for all 11 slots in G4 MOCVD	2020-12-31	5	Report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		147	645448974	3
254	25G(CWDM4) and 10G Direct Modulation DFB LD NPD	1.\t10G c-Temp & 10G i-Temp DML NPI\r\n-\tCompletion of alpha-phase\r\n-\tCompletion of gamma-phase\r\n \r\n2.\t25G c-Temp DML NPI \r\n-\tCompletion of alpha/beta-phase\r\n-\tCompletion of gamma-phase\r\n\r\n3.\tDemo of BH based 25G DML for i-Temp\r\n-\tIth < 10mA @ 25??C\r\n-\tS21 > 17GHz @ 85??C, for 55~70 mA	2020-09-30	30	1. Lean Six Sigma Report on the 0.5um-SiO2 Spacer 25G DML report. 2. Completion of 25G c-Temp DML Design Review 3. Device demo of DLS-G4 AlQ based25G DML (BH version)	NIL	NIL	1	1	1	NIL	NIL	NIL	null		205	1602769597	3
275	Equipment maintenance, CIPs and mindset change	???\tComplete all schedule PM and critical equipment PM by Q420, ensure that the integrity of the checklist is upheld and error free.\r\n???\tNew Equipment Hookups onsite by End Dec 2020\r\n???\tOxford PECVD and ICP PLC Upgrading work by End Nov2020 \r\n???\tReduce unplanned down-time by 5 % compare to 2019 for 2020	2020-12-30	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		237	22592094	4
288	Achieve US$ 12.1M revenue in 2020 as per base AOP.  Stretch goal is $14.1M	Key measures:\r\n1)\tMeet 100% forecast for FY20.\r\n2)\tMaintain 90% Box yield for box assembly.\r\n3)\tMaintain zero safety incidents per month\r\n4)\tEnsure and maintain supply of raw materials or COGS.\r\n5)\tDefine PM/Calibration schedule for all equipment used for ILM and ensure all machines are calibrated on time.	2020-12-31	1		NIL	NIL	1	1	1	NIL	NIL	NIL	null		177	1913240580	6
420	Revenue	target to reach US$5M above revenue from Greater China in 2020	2020-12-31	50		NIL	NIL	1	1	1	NIL	NIL	NIL	null		265	25957709	6
421	New Design in	Get at least 4 design win in 16xx DFB???10G/25GD or SOA	2020-12-31	25	new orders.	NIL	NIL	1	1	1	NIL	NIL	NIL	null		265	25957709	3
422	AXT Wafer Substrate/Almae Grating/Regrowth Qual	1. ESD\r\n\r\n2. 2000hrs HTOL	2020-04-09	1		NIL	NIL	1	1	1	NIL	NIL	NIL	null		155	931345185	3
425	Yelo System Set-Up/Acceptance	1. System delivered\r\n\r\n2. System buy-off	2020-02-07	1		NIL	NIL	1	1	1	NIL	NIL	NIL	null		155	931345185	5
426	Low DOP SLED Development	1. Panwoo 5000 parts delivery	2020-06-30	1		NIL	NIL	1	1	1	NIL	NIL	NIL	null		155	931345185	3
477	1310nm Broadband SLED Development	Successful development of a SLED with 3dB BW 115nm, Power 6mW	2021-07-01	1		NIL	NIL	1	1	1	NIL	NIL	NIL	null		155	931345185	3
395	New Product Design Wins	Win designs with new product	2020-12-31	20	Order from customer	NIL	27 new customer wins in Q1-Q3 in 2020. Good job.	1	1	1	NIL	NIL	NIL	On Track		260	985791817	3
415	Projects	Drive KFA projects to conclusion	2020-12-31	25	Reports	KFA1.4 (Improve communication amongst team)- In progress. Launched Google Chat and next steps is to introduce the entire google ecosystem to improve the collaboration amongst all Denselighters.\r\nKFA3.1 (Cost effective External Manufacturing Strategy) - Subcon strategy is defined. Qualifying new subcons to meet and deliver 25G products to our customers. 2nd source in AFR for FBGL.\r\nKFA4 (Lead KFA 4 Build and deliver effective and\r\nefficient business process??? and systems.) - Overall progress is good.	NIL	1	1	1	NIL	NIL	NIL	On Track		264	759336758	6
417	Procurement	Drive for cost savings with the suppliers and ensure supply assurance.	2020-12-31	25	Reports	2020 CAPEX is managed well and below AOP.\r\nSourced and selected FCM (Travel Management Company) that offer the lowest cost of travel.\r\nOn target to achieve cost savings target >$250k for 2020.\r\nDeveloped the mechanism to track cost savings with Finance.\r\nAll POs are issued timely to suppliers. \r\nGoods flow has been semi-automated to improve efficiency.	NIL	1	1	1	NIL	NIL	NIL	On Track		264	759336758	4
506	Hunet Test	hunet test	2020-09-09	100		hunet test	Hunet Test Manager	1	1	1	NIL	NIL	NIL	On Track		\N	17	1
231	Test Setup Familiarity	Familiarisation of different device requirements by understanding different test setup and program-respective critical parameters.	2021-01-01	5		NIL	NIL	1	1	1	NIL	NIL	NIL	null		234	2076006951	3
256	Design and Realization Flip-Chip-Capable MFA Integrated CW-DFB-LD for AMF-Denselight Collaboration :	Design and Realization Flip-Chip Capable MFA Integrated CW-DFB-LD for AMF-Denselight Collaboration :\r\n\r\nObjectives:\r\nPOC1:\r\n1.\tDelivery of LD chip mount on CoS with 50um protrusion\r\n2.\tOptical coupling measurement of LD+TWG and Si-Ph Edge-Coupler\r\n3.\tCoupling simulation of LD+TWG and Edge-Coupler\r\nPOC2:\r\n4.\tPropose and execute InGaAsP and AlGaInAs MQW???s based epi structures for high power FC CW-DFB-LD \r\n5.\tDesign and realization of MFA integrated InGaAsP and AlGaInAs MQW based CW-DFB with Lcav=1mm, \r\n5.1) Determination of grating InP-spacer\r\n5.2) Overall device integration\r\n6.\tFurther simulation of MFA with modal analysis of ridge on TWG devices\r\n7.\tOverall design consideration of the Z-Stop for LD+TWG and BH based CW-DFB-LD for Si-Photonic Platform	2020-12-31	30	1POC1 :  -Joint POC1 Report Generation  POC2: -Mask tape-out of MFA-integrated CW-DFB-LD  -Delivery of a flip-chip capable TWG-integrated Lcav=1mm CW-DFB-LD	NIL	NIL	1	1	1	NIL	NIL	NIL	null		205	1602769597	3
255	Design and Realization of Buried Heterostructure Platform	1.\tPhysical Parameter Design for BH Engineering Masks\r\n2.\tBH Device Structure Simulation/Analysis \r\n3.\tBH Device Structure Requirements\r\n4.\tCharacterization and optimization of Fe-InP via N-i-N \r\n5.\t1st demo of InGaAsP BH FP-LD\r\n-\tExperimental ???in, and modal gain to be comparable to Ridge-Based InGaAsP FP\r\n6.\t1st demo of InGaAsP BH LDOP SLED\r\n-\tLOP > 1.5mW @ 100mA\r\n-\tPER ~ 1.2 @ 100mA\r\n-\tBW >  30nm \r\n-\tFF <  42?? (v) x 30?? (h)\r\n7.\t1st demo of G4-AlQ based BH FP/DFB-LD, Lcav=250um\r\n-\tIth < 10mA @ RT, ??? 20mA @ 85??C\r\n-\tPout > 20mW for Iop=60mA @ RT	2020-12-31	30	1.\tBH Engineering Mask tapeout 2.\t1st demo of InGaAsP BH FP-LD 3.\tLaser material characterization of BH InGaAsP FP-LD 4.\tDevelop BH LDOP SLED to match Panwoo LDOP SLED spec.	NIL	NIL	1	1	1	NIL	NIL	NIL	null		205	1602769597	3
257	Strategic InP-PIC Platform (KFA5.4) Contribution:	1. Lead the Review of Strategic Building Blocks toward Photonic Integration on InP\r\n2. Evaluate Strength/weakness for the various techniques to Photonic Integration\r\n3. Evaluate if MFA can be implemented using the various PIC techniques\r\n4. Lead Strategic Plan of Development of Building Blocks for InP-PIC for Application in IoT and Next-Gen Transmit Lasers, using :\r\n- EML (DFB/EAM Integration)\r\n- Tunable LD (DBRs/PS Integration\r\n- SLED/PIN PIC Transceiver for FOG\r\n5. Provide the Work-Packages and the High-Level Strategy to Realize EML base on Selective-Area Epitaxy and Butt-Joint Approach	2020-12-31	10	1. Consolidated Report of PIC work-packages development	NIL	NIL	1	1	1	NIL	NIL	NIL	null		205	1602769597	3
261	Operational Cost Management	- Cost Saving Project  - to reduce the operation cost by 5%\r\n- To source for 2nd source material supplier and certify by process engineer\r\n- Collaborate with supplier for bulk purchase to avoid high freight / delivery charge\r\n- Reduce wastage by proper planning and batching wafers processing	2020-12-31	20	Weekly Operation report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		160	52374544	4
306	Facilty Team works	Expected behaviors traits for quality excellence \r\n???        Need to have initiative to learn, apply and improve\r\n???        Need to have Self-discipline in the works undertaken, this is to ensure max level of passion and pride, hunger and want.\r\n???        Adaptability - Continuously learning to adapt to changes in environmental factors and manage the given priorities and stay engage to allow moving in the same company???s direction to achieve the needed goals.\r\n???        Work with Urgency and Correct Priority - Continuously managing job priorities and working with urgency to match management priority\r\n???        Ability to Multi-Task - Constantly working and juggling between multiple tasks and people to deliver max results. \r\n???        Contribute to Team Success - Continuously providing service to equip, process and manufacturing team members to help them succeed in their	2021-01-30	35	Facilty Team works	NIL	NIL	1	1	1	NIL	NIL	NIL	null		197	1017729787	6
262	Equipment maintenance, CIPs and mindset change	???\tComplete all schedule PM and critical equipment PM by Q420, ensure that the integrity of the checklist is upheld and error free.\r\n???\tNew Equipment Hookups onsite by End Dec 2020\r\n???\tOxford PECVD and ICP PLC Upgrading work by End Nov2020 \r\n???\tReduce unplanned down-time by 5 % compare to 2019 for 2020\r\n???\tspare part tracking continuing plan by Q4 2020\r\n???\tPerform at least 10 improvement to the machine for better productivities or machine reliability. \r\n???\tTo ensure the team login and update the Equipment status properly into the daily equipment status tracking file.   \r\n???\tTo be able make logical and decisive decision to safe guard the company need. \r\n???\tGood to raise concern, but always come up the work around solutions to get things moving.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		249	5	4
260	Quality Improvement Management	???\tReduce wafer breakage and human error to <10% of total processed wafers, (>17% in 2019).\r\n???\tEnsure all SPC files updated daily (RID, PML/NML Evap, sputtering, AR/HR).\r\n???\tImplement at least 5 improvement projects for better MFG efficiency.\r\n???\t Create systems to eliminate operator???s related Human errors in wafer handling breakage\r\n???\t Ensure all operators are certified with in two months after they are on board.	2020-12-31	20	Weekly Operation report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		160	52374544	5
324	NPI/ Engineering build	On-time set-up of critical EWO and no issues on machines - Q2\r\nOn-time machine/fixture qual and buy-off to be use on new products- Q3\r\nWork with PE, Production and Fab to create EWO monitoring and disposition to avoid aging. Q3-Q4	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		181	1536568573	3
313	Track daily Non stop	1) Material Inventory every end of month with new ID number within only ILM dept. Done\r\n2) ILM activity by product boxes (Incoming and Outcoming). Done\r\n3) Implement every Work Instructions (10/ 18 WIs)\r\n4) New looks of Travelers for box. Done\r\n5) Update the whiteboard based on urgent box. Done	2020-11-30	10	Track daily	NIL	NIL	1	1	1	NIL	NIL	NIL	null		220	231731743	5
334	Sustainable support & commitment	- Full support of DSL goals and targets.\r\n- Engagement with other departments to assist in meeting performance.   \r\n- Continuous communication with facility & EHS team and other departments so as to work as one team.	2021-12-30	20	Checklist, reports and records	NIL	NIL	1	1	1	NIL	NIL	NIL	null		196	2047523461	5
339	GTM for 1310nm SLED design & development	Lead development team to successfully develop and ready go-to-market 1310nm SLED product	2020-12-31	30		NIL	NIL	1	1	1	NIL	NIL	NIL	null		204	480020115	3
265	Training	???\tTake ownership for the team training needs and attendance. \r\n???\tEnsure assigned training for team member are follow thoroughly closely.\r\n???\tEnsure training received by team members are aligned and help in the execution of their work responsibility.\r\n???\tResponsible to ensure OJT for new comers to address their working needs.	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		249	5	6
266	Expected behaviors traits for quality excellence	???\tNeed to have initiative to learn, apply and improve\r\n???\tNeed to have Self-discipline in the works undertaken, this is to ensure max level of passion and pride, hunger and want.\r\n???\tAdaptability - Continuously learning to adapt to changes in environmental factors and manage the given priorities and stay engage to allow moving in the same company???s direction to achieve the needed goals .\r\n???\tWork with Urgency and Correct Priority - Continuously managing job priorities and working with urgency to match management priority\r\n???\tAbility to Multi-Task - Constantly working and juggling between multiple tasks and people to deliver max results. \r\n???\tContribute to Team Success - Continuously providing service to equip, process and manufacturing team members to help them succeed in their works.	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		249	5	5
264	6S, Housekeeping and Safety	???\tTake ownership for the housekeeping compliance for the team and drive the team to achieve Zero NC due to housekeeping an safety.\r\n???\tConstantly communicate with the team and align them on housekeeping and safety protocol\r\n???\tTake ownership to ensure Zero non-conformance for Safety violations within the team\r\n???\tAbility to detect safety gaps and resolve them.\r\n???\tEnsure that the newcomers are briefed on the safety specs and the document needs to be signed off.\r\n???\tNeed to take ownership and responsibility for all safety related issues.\r\n???\tInform SM and above immediately for serious incidents. Need to ensure execution of preventive and corrective actions so that there is no reoccurrence of similar issues.\r\n???\tNeed to inform SM and above for Fab Evacuation and any Line Down issues	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		249	5	5
273	6S Housekeeping and Safety Management	???\tTake ownership for the housekeeping compliance for the team and drive the team to achieve Zero NC due to housekeeping and safety.\r\n???\tConstantly communicate with the team and align them on housekeeping and safety protocol\r\n???\tTake ownership to ensure Zero non-conformance for Safety violations within the team\r\n???\tAbility to detect safety gaps and resolve them.\r\n???\tEnsure that the newcomers are briefed on the safety specs and the document needs to be signed off.\r\n???\tTo take ownership and responsibility for all safety related issues.\r\n???\tInform SM and above immediately for serious incidents. Need to ensure execution of preventive and corrective actions so that there is no recurrence of similar issues.\r\n???\tNeed to inform SM and above for Fab Evacuation and any Line Down issues	2020-12-31	10	Weekly Operation report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		160	52374544	5
279	Equipment maintenance, CIPs and mindset change	???\tPECVD-02 powder flakes issue while run SiON recipe- clean shower head with below 10 Degree Celsius of H2O of soaking process. It can remove over 90% of debris faster than IPA and Acetone method. Under observation..,, \r\n???\tPLAT-01 convert to 3inch wafer test in progress..,,\r\n???\tRTP-02 convert to 3inch wafer test in progress..,\r\n???\tTRACK-01 machine back up for standalone DEVE-01 and DEVE-02- modification in progress..,,\r\n???\tRTP-02 3inch wafer test in progress..,,\r\n???\tPDS-01 machine to fix external ATM switch in progress..,,\r\n???\tMAL-03 Halogen lamp power OEM spec power extend to 750W, cost saving under observation..,,\r\n???\tFab-B machines that using MFC, to reduce cost all machine MFC consolidated into 5 spare MFC.	2020-12-30	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		237	22592094	4
276	6S, Housekeeping and Safety	???\tTake ownership for the housekeeping compliance for the team and drive the team to achieve Zero NC due to housekeeping a safety.\r\n???\tConstantly communicate with the team and align them on housekeeping and safety protocol\r\n???\tTake ownership to ensure Zero non-conformance for Safety violations within the team\r\n???\tAbility to detect safety gaps and resolve them.\r\n???\tEnsure that the newcomers are briefed on the safety specs and the document needs to be signed off.\r\n???\tNeed to take ownership and responsibility for all safety related issues.\r\n???\tInform SM and above immediately for serious incidents. Need to ensure execution of preventive and corrective actions so that there is no reoccurrence of similar issues.\r\n???\tNeed to inform SM and above for Fab Evacuation and any Line Down issues	2020-12-30	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		237	22592094	6
278	Expected behaviors traits for quality excellence	???\tNeed to have initiative to learn, apply and improve\r\n???\tNeed to have Self-discipline in the works undertaken, this is to ensure max level of passion and pride, hunger and want.\r\n???\tAdaptability - Continuously learning to adapt to changes in environmental factors and manage the given priorities and stay engage to allow moving in the same company???s direction to achieve the needed goals.\r\n???\tWork with Urgency and Correct Priority - Continuously managing job priorities and working with urgency to match management priority\r\n???\tAbility to Multi-Task - Constantly working and juggling between multiple tasks and people to deliver max results. \r\n???\tContribute to Team Success - Continuously providing service to equip, process and manufacturing team members to help them succeed in their works.	2020-12-30	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		237	22592094	4
290	Product Improvement	???\tIntroduce 10kHz ILM box for DAS market\r\n???\tSupport KFA5.5 Initiate capability development of System-in-box ILM solutions for key applications over (2- 3  year) mid-term roadmap.\r\n\r\nProduct Improvement\r\nKey measures:\r\n1)\tTroubleshoot, finalise and produce 10kHz ILM box for production	2020-12-31	1		NIL	NIL	1	1	1	NIL	NIL	NIL	null		177	1913240580	3
190	EBR process set-up and qualification	1.already finished dummy wafer single layer testing and result showed wafer edge cleanliness improved\r\n2.full loop wafer is running with every layer implement EBR. Pending the final result"	2020-10-20	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	589561367	5
272	Equipment maintenance, CIPs and mindset change	???\tComplete all schedule PM and critical equipment PM by Q420, ensure that \r\n         the integrity of the checklist is upheld and error free.\r\n???\tNew Equipment Hookups onsite by End Dec 2020\r\n???\tOxford PECVD and ICP PLC Upgrading work by End Nov2020 \r\n???\tReduce unplanned down-time by 5 % compare to 2019 for 2020	2020-12-31	25		NIL	NIL	1	1	1	NIL	NIL	NIL	null		189	1087181548	4
325	Meet Target Revenue of 7.6M		2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		199	520727285	1
291	Training for Siti	???\tTrain Siti on ILM engineering and manufacturing processes and systems. \r\n???\tDefine plans for Siti to support Yu Xiang on ILM engineering and manufacturing. \r\n\r\nKey measures:\r\n1)\tHand over management of materials to Siti\r\n2)\tHand over preparation of OGR for boxes\r\n3)\tHave Siti handle tracking of WIP	2020-12-31	1		NIL	NIL	1	1	1	NIL	NIL	NIL	null		177	1913240580	5
191	Ulitha tool move in and qualification	1.Acceptance criteria set-up\r\n2.PO raise\r\n3. tool qualification and release	2021-11-30	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	589561367	5
263	Team management	???\tMaintain employee work schedules including assignments, job rotation, training, vacations and paid time off, good team communication, coverage for absenteeism, and all other work-related scheduling. Goal is to ensure there is always good equipment support to the MFG need. \r\n???\tEmpower employees to take responsibility for their jobs and goals. Delegate responsibility and expect accountability and regular feedback.\r\n???\tFoster a spirit of teamwork and unity among equip and other departments (MFG, Process, facility), allows for disagreement over ideas, conflict and expeditious conflict resolution, and the appreciation of diversity as well as cohesiveness, supportiveness, and working effectively together to enable each team members, other departments and company to succeed.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		249	5	5
267	Managerial behavior:	1.\tTo manage align the operation requirement between the Equipment Process and Manufacturing teams to ultimately foster long term sustainability in terms of Morale and Synergy.  \r\n2.\tTo take the lead by being fair and sensitive to the other team???s needs and indices. This will foster trust and improved co-operation. The subordinates will see and learn that win-win situations can be achieve, thereby following suit. \r\n3.\tTo increase contact with the process and MFG engineers, to have balanced points of views. This will enhance the working relationships with understanding each other's problems and concerns. \r\n4.\tTo increase the contact with his engineers to listen to their feedback and problems. Avoid finger pointing to them unnecessary to foster trust. This gives the engineers the feeling that they are being heard and that their feedback is of value, which will encourage them to speak up and uplifts the engineer???s  self worth and foster ownership. \r\n5.\t Carry out individual conversation. Understand their issues and problems, but at the same time truthfully tell them their standing, strengths and weaknesses. Tell them on which areas to improve on. \r\n6.\tMet out punishments and rewards appropriately. This will create role models and also real life examples of wrong-doings. In managing the team, being firm and fair is the key. \r\n7.\tFollow up closely on feedbacks and suggestions, ensure you are on top of all of them, this will make the engineers feel engaged and important. \r\n8.\tCultivate and Demand consistent quality awareness and vigilance, put up sequence of events for every incidents to ensure a good coverage of CA/ PA.\r\n9.\tUnderstand and implement better methods in recovering tools from failure \r\n10.\tIdentification of Chronic Equipment issues and constraint and solving them in the faster possible time.\r\n11.\tNeed to ensure zero incident of part shortage to ensure will not run into capacity issue at all time	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		249	5	1
268	Managing Cost	1.\tAssign an Engineer to look at the cost, for the purpose of knowing real time if the purchase of a part or service will exceed the allocated budget. This is to determine the go ahead for the purchase or non-purchase of a part or service. \r\n2.\tPlan out a list of parts that are required, rank them in order of importance and plan the purchase over a period of time. \r\n3.\tEnsure prompt payment to vendors and keep outstanding PRPO to a low percentage. This will allow leverage in times of need.\r\n4.\tTo educate the Engineers on the affordability, we  need to spend within the given allocation. \r\n5.\t Support all the cost initiative with proper risk assessment and Speed, give solution instead of create obstacles.	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		249	5	4
326	NPD & NRE		2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		199	520727285	3
315	Production Planning (Inventory & Materials/Forecast)	Inventory & Materials/Forecast	2020-12-31	20	Inventory and Forecast Files	NIL	NIL	1	1	1	NIL	NIL	NIL	null		153	253052978	4
274	Training and Team Management	???\tMaintain employee work schedules including assignments, job rotation, training, vacations and paid time off, good team communication, coverage for absenteeism, and all other work-related scheduling. Goal is to ensure there is always good manpower support to the daily MFG need. \r\n???\tEmpower employees to take responsibility for their jobs and goals. Delegate responsibility and expect accountability and regular feedback.\r\n???\tFoster a spirit of teamwork and unity among MFG personnel and other departments (Equip, Process, facility), allows for disagreement over ideas, conflict and expeditious conflict resolution, and the appreciation of diversity as well as cohesiveness, support, and working effectively together to enable each team members, other departments and company to succeed.\r\n???\tPeople Engagement - Through continuous engagement to achieved more support and initiatives from operators and technician to provide feedback for all kinds of improvement opportunity and closure.\r\n???\tInstill good Behaviors traits for quality excellence to the entire MFG team members\r\n???\t Create systems to eliminate operator???s related Human errors in wafer handling breakage\r\n???\t Ensure all operators are certified with in two months after they are on board.\r\n???\tTake ownership for the team training needs and attendance. \r\n???\tEnsure assigned training for team member are follow through closely with certification.\r\n???\tEnsure training received by team members are aligned and help in the execution of their work responsibility.\r\n???\tResponsible to ensure OJT for new comers to address their working needs.	2020-12-31	20	Weekly Manufacturing report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		160	52374544	5
192	3 inch wafer coating & develop recipe set-up	set-up and qualification coating and develop recipes for 3 inch wafer	2021-11-30	5		NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	589561367	5
271	Equipment maintenance, CIPs and mindset change	???\tPerform at least 10 improvement to the machine for better productivities or machine reliability. \r\n???\tTo ensure the team login and update the Equipment status properly into the daily equipment status tracking file.   \r\n???\tTo be able make logical and decisive decision to safe guard the company need. \r\n???\tGood to raise concern, but always come up the work around solutions to get things moving.	2020-12-31	25		NIL	NIL	1	1	1	NIL	NIL	NIL	null		189	1087181548	4
292	Revenue and Shipment	To Meet Company Supply Revenue and Shipment objectives.	2020-12-31	40	Revenue File	NIL	NIL	1	1	1	NIL	NIL	NIL	null		167	973701598	4
259	Fab Capacity and Wafers Cycle Time Management	???\tTo effectively manage all the wafers start and ensure all tools utilize to its max capability.\r\n???\tTo constant review of the Cycle Times and Fab Capacity for SLED/ELED, DFB Production / Engineering wafers with process changes, equipment changes to ensure the capacity file are up to date. \r\n???\tTo create a manual tracking system to track process Hold Time when the Engineers delay releasing the wafer due to Rework / Tool Failure\r\n???\tTo work with IT team to link up all run sheets files, SPC files, OQC reports to reduce manual key in time.\r\n???\tTo work with IT on the Run sheet Automation, OQC report and Dashboard to broadcast wafer Processing status\r\n???\tTo ensure all direct material are managed with a good system with zero incident of direct materials shortage issues.\r\n???\tReporting Fab B Weekly Operation report with visual wafer yield trend and cycle time on time.\r\n???\tSubmit Fab B Month-end inventory and KPI on time.\r\n-       To follow up closely with Process team to ensure Process Tools backup qualification.\r\n        + Full backup and Flexibility for wafers to run in Oxford and Trion\r\n        + Full backup and Flexibility for wafers to run in Oxford III-V and \r\n            SAMCO\r\n         +Full release of Denton I29 to run AR coat \r\n         + Tool Backup for EBEAM or contingency plan	2020-12-31	30	Weekly Operation report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		160	52374544	5
193	A,B distance(first layer alignment) measurement improvement	The purpose of this project is to investigate and settle the 1st later alignment issue.\r\nFull loop dummy wafer is running, pending result.	2020-10-20	5		NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	589561367	5
282	Team management	???\tMaintain employee work schedules including assignments, job rotation, training, vacations and paid time off, good team communication, coverage for absenteeism, and all other work-related scheduling. Goal is to ensure there is always good manpower support to the daily MFG need. \r\n???\tEmpower employees to take responsibility for their jobs and goals. Delegate responsibility and expect accountability and regular feedback.\r\n???\tFoster a spirit of teamwork and unity among MFG personnel and other departments (Equip, Process, facility), allows for disagreement over ideas, conflict and expeditious conflict resolution, and the appreciation of diversity as well as cohesiveness, supportiveness, and working effectively together to enable each team members, other departments and company to succeed.\r\n???\tPeople Engagement - Through continuous engagement to achieved more support and initiatives from operators and technician to provide feedbacks for all kinds of improvement opportunity and closure.\r\n???\tInstill good Behaviors traits for quality excellence to the entire MFG team members.\r\n???\tInstill below critical work behaviors to all in the MFG team:\r\n\r\n1.\tInitiative to learn, apply and improve\r\n2.\tSelf discipline \r\n3.\tAdaptability\r\n4.\tWork with Urgency and Correct Priority\r\n5.\tAbility to Multi-Task\r\n6.\tContribute to Team Success	2020-12-31	15	Will be judged by bosses, colleagues of other divisions, operators. Teamwork Fab working environment harmony	NIL	NIL	1	1	1	NIL	NIL	NIL	null		208	1921197435	5
283	6S, Housekeeping and Safety	???\tTake ownership for the housekeeping compliance for the team and drive the team to achieve Zero NC due to housekeeping and safety.\r\n???\tConstantly communicate with the team and align them on housekeeping and safety protocol\r\n???\tTake ownership to ensure Zero non-conformance for Safety violations within the team\r\n???\tAbility to detect safety gaps and resolve them.\r\n???\tEnsure that the newcomers are briefed on the safety specs and the document needs to be signed off.\r\n???\tNeed to take ownership and responsibility for all safety related issues.\r\n???\tInform SM and above immediately for serious incidents. Need to ensure execution of preventive and corrective actions so that there is no reoccurrence of similar issues.\r\n???\tNeed to inform SM and above for Fab Evacuation and any Line Down issues	2020-12-31	10	Number of auditing findings on 6S and Safety incidents	NIL	NIL	1	1	1	NIL	NIL	NIL	null		208	1921197435	5
284	Training of subordinate	???\tTake ownership for the team training needs and attendance. \r\n???\tEnsure assigned training for team member are follow through closely with certification.\r\n???\tEnsure training received by team members are aligned and help in the execution of their work responsibility.\r\n???\tResponsible to ensure OJT for new comers to address their working needs.	2020-12-31	15	Training of new operators/ technicians, and ability to run wafers	NIL	NIL	1	1	1	NIL	NIL	NIL	null		208	1921197435	5
285	Expected behaviors traits for quality excellence	???\tNeed to have initiative to learn, apply and improve\r\n???\tNeed to have Self-discipline in the works undertaken, this is to ensure max level of passion and pride, hunger and want.\r\n???\tAdaptability - Continuously learning to adapt to changes in environmental factors and manage the given priorities and stay engage to allow moving in the same company???s direction to achieve the needed goals .\r\n???\tWork with Urgency and Correct Priority - Continuously managing job priorities and working with urgency to match management priority\r\n???\tAbility to Multi-Task - Constantly working and juggling between multiple tasks and people to deliver max results. \r\nContribute to Team Success - Continuously providing service to equip, process and manufacturing team members to help them succeed in their works.	2020-12-31	10	Will be judged/ rated by bosses	NIL	NIL	1	1	1	NIL	NIL	NIL	null		208	1921197435	5
286	Supervisor behavior	1.\tTo manage align the operation requirement between the Equipment, Process and Manufacturing teams to ultimately foster long term sustainability in terms of Morale and Synergy.  \r\n2.\tTo take the lead by being fair and sensitive to the other team???s needs and indices. This will foster trust and improved co-operation. The subordinates will see and learn that win-win situations can be achieve, thereby following suit. \r\n3.\tTo increase contact with the Process and Equip engineers, to have balanced points of views. This will enhance the working relationships with understanding each other's problems and concerns. \r\n4.\tTo increase the contact with the subodinate to listen to their feedback and problems. Avoid finger pointing to them unnecessary to foster trust. This gives the subordinate the feeling that they are being heard and that their feedback is of value, which will encourage them to speak up and uplifts their self worth and foster ownership. \r\n5.\t Carry out individual conversation. Understand their issues and problems, but at the same time truthfully tell them their standing, strengths and weaknesses. Tell them on which areas to improve on. \r\n6.\tMet out punishments and rewards appropriately. This will create role models and also real life examples of wrong-doings. In managing the team, being firm and fair is the key. \r\n7.\tFollow up closely on feedbacks and suggestions, ensure you are on top of all of them, this will make the engineers feel engaged and important. \r\n8.\tCultivate and Demand consistent quality awareness and vigilance, put up sequence of events for every incidents to ensure a good coverage of CA/ PA.\r\n9.\tUnderstand and implement better methods in recovering tools from failure \r\n10.\tIdentification of Chronic Equipment issues and constraint and solving them in the faster possible time.\r\n11.\tNeed to ensure zero incident of mistake to ensure will not run into quality issue at all time.	2020-12-31	10	Will be judged/ rated by bosses	NIL	NIL	1	1	1	NIL	NIL	NIL	null		208	1921197435	5
281	Reducing wafer breakage to 5% from 13% in 2019	1) Miniature Dryer with N2 Shower: ensure the wafer is thoroughly dry with a constant and consistent Nitrogen flow for every wafer.    \r\n2) To try new wafer boxes, cassette, carriers, jig, ??? to avoid wafer crash.\r\n3)  Training on wafer handling: video and hands-on.\r\n          Finish date: regular\r\n4) Regular auditing wafer handling.\r\n          Finish date: regular	2020-12-31	10	G:\\Shared drives\\Fab B Production\\Wafer Breakage	NIL	NIL	1	1	1	NIL	NIL	NIL	null	Wafer_Breakage_Percentage.png	208	1921197435	5
289	Capacity Improvement	1)\tSemi-automate OGR generation by software\r\n2)\tIncrease capacity by introducing third production line.\r\n3)\tImplement DAQ testing for High temp test (SLED) to free up operator\r\n4)\tImplement Set-up for BF10 Coil winding to free up operator\r\n5)\tQualify vendor for production of ILM Box Electrical Cables\r\n6)\tDefine alternate source plan for key material used in ILM\r\n7)\tOutsource testing of PCBA to PCBA vendor	2020-12-31	1		NIL	NIL	1	1	1	NIL	NIL	NIL	null		177	1913240580	6
197	6S, Housekeeping and Safety	???\tTake ownership for the housekeeping compliance for the team and drive the team to achieve Zero NC due to housekeeping an safety.\r\n???\tConstantly communicate with the team and align them on housekeeping and safety protocol\r\n???\tTake ownership to ensure Zero non-conformance for Safety violations within the team\r\n???\tAbility to detect safety gaps and resolve them.\r\n???\tEnsure that the newcomers are briefed on the safety specs and the document needs to be signed off.\r\n???\tNeed to take ownership and responsibility for all safety related issues.\r\n???\tInform SM and above immediately for serious incidents. Need to ensure execution of preventive and corrective actions so that there is no reoccurrence of similar issues.\r\n???\tNeed to inform SM and above for Fab Evacuation and any Line Down issues	2020-12-30	30	UPGARADE APT to 1 k clean room	NIL	NIL	1	1	1	NIL	NIL	NIL	null		197	1017729787	4
269	Expected behaviors traits for quality excellence	???\tNeed to have initiative to learn, apply and improve\r\n???\tNeed to have Self-discipline in the works undertaken, this is to ensure max level of passion and pride, hunger and want.\r\n???\tAdaptability - Continuously learning to adapt to changes in environmental factors and manage the given priorities and stay engage to allow moving in the same company???s direction to achieve the needed goals.\r\n???\tWork with Urgency and Correct Priority - Continuously managing job priorities and working with urgency to match management priority\r\n???\tAbility to Multi-Task - Constantly working and juggling between multiple tasks and people to deliver max results. \r\n???\tContribute to Team Success - Continuously providing service to equip, process and manufacturing team members to help them succeed in their works.	2020-12-31	25		NIL	NIL	1	1	1	NIL	NIL	NIL	null		189	1087181548	4
270	6S, Housekeeping and Safety	???\tTake ownership for the housekeeping compliance for the team and drive the team to achieve Zero NC due to housekeeping a safety.\r\n???\tConstantly communicate with the team and align them on housekeeping and safety protocol\r\n???\tTake ownership to ensure Zero non-conformance for Safety violations within the team\r\n???\tAbility to detect safety gaps and resolve them.\r\n???\tEnsure that the newcomers are briefed on the safety specs and the document needs to be signed off.\r\n???\tNeed to take ownership and responsibility for all safety related issues.\r\n???\tInform SM and above immediately for serious incidents. Need to ensure execution of preventive and corrective actions so that there is no reoccurrence of similar issues.\r\n???\tNeed to inform SM and above for Fab Evacuation and any Line Down issues	2020-12-31	25		NIL	NIL	1	1	1	NIL	NIL	NIL	null		189	1087181548	6
293	Production Efficiency and Capability	To improve the efficiency and reduce cost. To support the ramp to high volume for our core products.	2020-12-31	30	Project File	NIL	NIL	1	1	1	NIL	NIL	NIL	null		167	973701598	4
294	Production Cost Improvement	Improve Yields to reduce cost. Facilitate cross training to ensure better usage of resources.	2020-12-31	20	Training File, Yield file	NIL	NIL	1	1	1	NIL	NIL	NIL	null		167	973701598	4
316	Production Planning System Improvement(Odoo)	Ship to Order	2020-12-31	30	Odoo System	NIL	NIL	1	1	1	NIL	NIL	NIL	null		153	253052978	5
327	Production Efficiency and Capability		2020-12-31	30		NIL	NIL	1	1	1	NIL	NIL	NIL	null		199	520727285	4
194	wafer bask side cleanliness improvement: step by step check wafer back side and find the chance to add wafer back side clean action	1.The purpose of this project is to find the root cause of wafer backside contamination and  seek the chance to add clean step in wafer process flow.\r\n2.Full loop dummy wafer is running  and now we are collecting data step by step	2020-10-20	5		NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	589561367	4
195	low vacuum mode implementation reduction to lower the risk of wafer broken	1.to optimize the Nlof2070 PML and SPD layer;LD3 DRN layer process to make the layer never use low vacuum mode\r\n2.15NXT qualification to replace SU8 for SU8 process have high chance to use low vacuum mode	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	589561367	4
340	GTM for 1310nm Low PDG SOA	Lead development team to successfully develop and ready go-to-market 1310nm low PDG SOA product	2020-12-31	30		NIL	NIL	1	1	1	NIL	NIL	NIL	null		204	480020115	3
296	Operational Excellence	Establish methodology to introduce OEE and to drive improvement programs	2020-12-31	50	Improve OEE	Introduce OEE thru in house developed sensors. This is a major milestone in DLS APT as this is a real time measurement by the minute of a sensor hooked up . The dashboard is a very good indicator of the progress made in terms of automating solutions to boost productivity in APT first before moving across Fab A and Fab B.\r\n\r\nEngaged several government arms for support of grants, eg Enterprise Singapore, EDB , WSG , SSG to explore feasibility to enable i4.0 digital transformation to DLS. This is still work in progress. Although, the work done has not reaped any fruits in terms of financials, but the network which connected DLS to the next in-line projects in the near future to help boost either human capital building of to be given a grant for hardware/software solutions has been established	NIL	1	1	1	NIL	NIL	NIL	On Track		162	1982477965	4
356	Deliver all wafer requests from production team	Understand the parameters of most of SLED products in DLS and customer requirements so that a baseline growth can be set. Making a plan to improve current SLED products in their key parameters.	2020-12-31	50	Deliver production wafers	NIL	NIL	1	1	1	NIL	NIL	NIL	null		163	1373136557	1
423	25G DML Qual	1. 2000hrs HTOL	2020-07-30	1		NIL	NIL	1	1	1	NIL	NIL	NIL	null		155	931345185	3
371	IT Management	Preparing deployment of DMES (Denselight Manufacturing Execution System)	2020-12-31	10	Deployment DMES for manufacturing use a.\tFab-B Runsheet automation b.\tFab-A GATR automation c.\tFab-A Recipe generation d.\tDITA  e.\tWAT automation	NIL	NIL	1	1	1	NIL	NIL	NIL	null		164	1428738048	4
348	PE activities and Sales support	Support Sales for Product definition and sampling and for technical communications with clients.\r\nIn charge of all PE activities while position is not filled (Specs, ATRs, RMAs, NCMRs, Trainings...).	2020-12-31	15		NIL	NIL	1	1	1	NIL	NIL	NIL	null		145	1813039923	1
383	Organization/ Culture Change	??? Develop and improve standard recruitment process to reduce attrition by 50%. ??? Identify and fill all 2020 budgeted positions. ??? Continue review of KFA???s and execution of DLS 2.0	2020-12-31	15	HR attrition report	NIL	Need to reduce attrition in direct staff	1	1	1	NIL	NIL	NIL	On Track		259	135493917	5
507	hunet test1	test1	2020-09-09	50		NIL mid emp comm1	NIL	2	1	1	NIL	NIL	NIL	On Track		\N	17	1
75	CTO Role: Developing company technology strategy to support business goals	a)\tDirect R&D and Technology Transformation Roadmap to support Company Revenue growth (forecast) objectives: $12M in 2020, $19M in 2021, $28M in 2022\r\nb)\tCommunicate technology strategy and directions to employees, customers, partners and investors.\r\nc)\tLead KFA5 (Strategic Initiatives on New Product Technology Development)\r\nd)\tProvide technical guidance and mentorship to all engineering staff	2020-12-31	35	Company Technology Roadmap, technical presentations & meeting contributions, KFA Reviews with CEO	1a) \t(i) Regular updating of company technology roadmap ??? done\r\n\t(ii) Datacom: Mapping Datacom Type-A Intra-DCI (CW-DFB & EML), Type-B Inter-DCI Strategy (coherent)\r\n(iii) Sensing: Mapping for higher value: MOPA, Optical engine and Interrogators\r\n1b)\t(i) Presented Lunch-time Talk: March2020: Coherent Comms Pluggables\r\n(ii) Supported BOD on technical due diligence for HTOE acquisition\r\n1c) \tLead/Sponsor KFA5 (New Product Technology Development) ??? yes\r\n1d)\tYes, via various forum: NRE proposals, NPI mtgs, PE mtgs, KFA2.4(Tech mkt)	NIL	1	1	1	NIL	NIL	NIL	On Track		158	1135328161	5
76	Provide technical guidance on Technical Marketing, NRE, NPI and Applications	a)\tTAM/SAM & Tracking products, applications and market trends \r\nb)\tTechnical sales and applications support advisory\r\nc)\tTechnical mentorship to NRE proposals\r\nd)\tTechnical mentorship to members of NPD and PE teams\r\ne)\tRenesas-DLS Technology Transfer co-ordination	2020-12-31	35	TAM/SAM/market/product studies (pptx/excel), related NRE, NPD, PE meetings, pptx, minutes	2a)   TAM/SAM & Tracking products, applications and market trends\r\n\tPrepared TAM/SAM analysis for Sensing and Datacom market; joint SOM analysis with Sales\r\n???\tSensing (SLED, ILM, FOG, FBGS, DAS, Wind-Lidar)\r\n???\tCoherent Datacom (SOA/GC for Coherent 400ZR) & Intra-DCI (25G DML, EML, CW-DFB)\r\n???\tDatacom Roadmap {5G, Intra-DCI DML, 400G EML and new 50G PON standard}\r\n\r\n2b)\tTechnical sales and applications support advisory\r\n???\tTechnical sales & applications Advisory: SiLC, InPhi, Luxtera, Elbana, AvoPhotonics, Apple \r\n???\tInterrogators: ILM(MOPA), India Railway Project (using Redondo interrogator approach)\r\n\r\n\r\n2c) Technical mentorship to NRE proposals\r\n???\tAcacia NRE design proposal, Eloira NRE proposal\r\n???\tNorthrup Grumman NRE bid:  NRE Technical Proposal developed and presented to NG\r\n\r\n2d) Technical mentorship to members of NPD & PE teams\r\n???\tMOCVD Epitaxy Roadmap coordination with Technology Roadmap, KFA5.2 and KFA5.4\r\n???\tProvided bootstrap technical requirements guidance to internal BH NDP team (led by Isaac) \r\n???\tDenselight patent filing on flip-chip MFA racetrack SOA \r\n???\tFOS4X: technical sales support to Sales bid and advisory to APT for successful trial-build \r\n???\tSponsored lunch-time Talk: May2020 by Maumita/Longcheng on ???TEC design and application for module products???\r\n\r\n\r\n2e) Renesas-DLS Technology Transfer Co-ordination (Jan-May 2020)\r\n???\tSupported technical analysis for Renesas MOU signing on 11April2020\r\n???\tInitiated DLS activities for Phase1 technical transfer (done Phase1A)\r\n???\tRenesas stopped Transfer Program in May2020 due to Renesas???s corporate direction change	NIL	1	1	1	NIL	NIL	NIL	On Track		158	1135328161	1
403	KFA 5.1 - Product Development System	1. Improvement and Implementation PRA and RFC Mid Year - Implemented by Sales and NPD and are being used 2. Improvement and Implementation of PDM Mid Year - Implemented and being used by NPD Regular audit implemented by QA 3. Develop Benchmarking method Mid Year - Methodology and testing requirements completed Establish purchase channels for competitive devices 4. Implement ROI template Mid Year - Updated with financial content updated every quarter.	2020-12-31	5		NIL	NIL	1	1	1	NIL	NIL	NIL	null		262	430837474	5
404	New Products for Datacoms and Telecoms	1. High Power CWDM DFB 70mW@75C Mid-Year > 50mW at 75C achieved with 500um devices 1st iteration 1000um DFB to achieve > 70mW at 75C design completed. Plan to fab out 1st iteration by mid Q4 2. 10G CWDM DML c-temp and i-temp Mid-Year 1310nm and 1270nm done 1290nm and 1330nm awaiting processing at Almae for grating writing. 3. 25G CWDM DML c-temp and i-temp (by Q4 2020) Mid-Year CWDM c-temp and e-temp available. 1330nm i-temp samples shipped but to be improved with D - design. 1st iteration of Localised Passivation done. 1270nm wafer shown improved high temp operation. DLS successfully grown B and D version 25G AL EPI for CWDM4 Reverse ridge and Current Blocking in Q4 Externally written grating evaluation to complete by mid Q4 Rel. Qualification for 25G EPI (2500 hrs done) continue to 5000 hrs. To load new devices for reliability in Q4 once i-temp POR is completed. 4. 25G CWDM6 DML c-temp and i-temp (by Q1 2021) Mid Year DLS grown D version 25G AL EPI for 1350nm and 1370nm. Grating design completed Wafers to be sent out for grating writing at HXOPTO 5. High DOP SOA 1550nm - Single and 5-array (by Q4 2020) Mid Year Standard Product available. Improved Psat to 17dBm and also NF < 6.5dB SOA performance for straight design meets all Acacia specs. Initial racetrack device fabricated and evaluating performance now. Current specs meets OIF???s TROSA coherent SOA specs. New wafers have been fabricated to continue improvements for Psat, NF and output beam. Package BTFs for customer samples in early Q4 No information by Huawei 6. Low DOP SOA 1310nm (by Q4 2020) Standard Product available for low DOP 1310nm SOA Packaged into BTF and testing shows performance comparable to Antritsu Working on submount design similar to Antritsu Working to supply samples to 3 x China customer for 100ZR. Taclink, Xgiga and Source Photonics. Evaluation of new EPI (i.e. without undulations and PL shifted) to increase Gain to > 20dB at 25C and/or operation at 50C	2020-12-31	20	Weekly update reports by team and monthly updates to CEO for BOD	NIL	NIL	1	1	1	NIL	NIL	NIL	null		262	430837474	3
409	Improvements of soft skills	1. Improve team's execution 2. Motivate team's responsibility and ownership 3. Alignment of reporting and communication 4. Guidance of Team Managers 5. Better tracking of team's task	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		262	430837474	6
410	Operational efficiency	Denton I29 qual, Back up tools, Cost reduction activity, SOP implementation, SPS systems set up, Process control and monitoring,	2020-12-31	15	indices	NIL	Denton Qual has been a major issue	1	1	1	NIL	NIL	NIL	On Track		263	324340084	4
411	Personnel Development	File atleast one patent or paper or trade secret from Process and Product groups per year , Cross training on another tool , Mentor ship by senior engineers to IA students	2020-12-31	15	patents, training, mentorship	NIL	No progress here	1	1	1	NIL	NIL	NIL	On Track		263	324340084	5
384	OPS Eff/Cost Reduction	??? Implement in-house process runsheet software for production use by 1Q2020 ??? To ensure the production CT and OTD mean the 15 days for the standard product and the OTD given by the PC.	2020-12-31	15	MFG Operation reports	NIL	Delayed DMES to Q32020	1	1	1	NIL	NIL	NIL	On Track		259	135493917	4
385	Revenue	??? Achieve > US$ 12.1M revenue in 2020 as per base AOP. Stretch goal is $14.1M ??? Introduce new ILM boxes (BF9C/D, BF10..) into market and capture > US $1.00M in revenue ??? Capture > $1.0M for 16XX DFB, > $1.4M for CW, High speed DFB	2020-12-31	15	Sale report	Above was a common goals that every Department head must be embrace, the business situation is not looking good and we had adjusted down these business goals ....	Wafer capacity needs to increase for 2021.	1	1	1	NIL	NIL	NIL	Not On Track		259	135493917	1
416	APT	Achieve shipment goals and hit key metrics for APT	2020-12-31	25	Reports	Shipment goals are met for Q1, Q2 and Q3. On track to meet shipment goals for Q4. Overcome challenges that could have derailed our shipment plan like BF10 but we managed to resolve these issues as a team.\r\nAPT cost is below target.\r\nCross training for the engineering and production team on-going.\r\nAttrition rate for the whole department is low. \r\nOEE for test equipment is >60%.	NIL	1	1	1	NIL	NIL	NIL	On Track		264	759336758	4
405	New Products for Sensing	1. 10KHz 1550nm NLW for Wind LIDAR and DAS (by Q4 2020 using double grating and integrated isolator technology) Mid Year - < 30kHz 1550nm NLW available. To evaluate yield Yield issue with 1560nm 50kHz for BK Tel. Need to determine reason Digital board and driver done Initial development of NLW + Amplifier (i.e. MOPA with output at 100mW) done 10kHz box (a. Integrated Isolator prototype done and b. evaluating PIC solution) 2. High Power 200kHz 1550nm NLW for Auto LIDAR (by Q4 2020) Mid Year - 1mm fabricated and Benchtop test system completed Need to package 1mm device into BTF next. 3. 1310nm and 1550nm High DOP SLED for FOG (by Q2 2020) Mid Year - Eloira transferred to PE team Proposal submitted to Eloira Continue to support PE team to test new BTFs for more test data and to evaluate new TEC. 4. 1310nm Low DOP SLED for China FOG (by Q2 2020) Mid Year - Panwoo : >2mW, PER < 1dB done. > 0.8mW BTF achieved. To push product to Panwoo Shipped 6 pcs of > 0.7mW BTF to customer and have 6 > 0.8mW to ship > 1mW BTF sample order shipped to NuGrid. China Aerospace and Panwoo has approved BTF performance. Improvement to MOCVD growth without undulations is in progress BH development version is in progress 5. 1550nm High DOP SOA for LIDAR pre-amplifiers (by Q4 2020) Mid-Year Completed initial specifications of (Gain: 20dB, Psat >10dBm, NF < 7 dB, PDG >15dB, Ripple < 0.5dB) Achieved Psat of 17dBm and Gain > 20 dB. Trying to increase it to 21 dBm	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		262	430837474	3
406	NRE	1. POET (by Q4 2020) Mid Year PO for $500K to be signed. Deliverables agreed. WAT acceptance criteria for new objectives sent and in discussion 2. Acacia (by Sep 2020) Mid Year Technical specifications have been agreed with Acacia Budgetary pricing of initial unit cost have been communicated to Acacia for 2021-2022. Initial NRE pricing has been communicated with Acacia but to go back to them on details of pricing 1st iteration of Racetrack device has been fabricated with HIC + Q-layer and testing has been completed for FP devices. Analysing data now. 3. Hitachi 1550nm SOA with 50nm bandwidth and Flip Chip (by Q1 2021) Mid year Technical specifications have been proposed to Hitachi and awaiting response in Oct 2020 (3rd postponement by customer) 4. ZTE 1550nm Gain Chip and SOA with Psat of 21dBm (by Q3 2021) Mid Year Initial proposal with pricing has been made to ZTE for Gain Chip and SOA. ZTE responded and next meeting to finalise technical requirements on 23 Sep 2020. To follow-up with new NRE pricing after technical alignment. 5. Huawei 1550 High DOP SOA (ongoing) Mid Year Devices ready to ship Awaiting PO for devices	2021-12-31	20	Weekly update reports by team	NIL	NIL	1	1	1	NIL	NIL	NIL	null		262	430837474	3
407	New Technology and Capabilities Development	1. AL wafer growth (by 31/12/20) Mid year - Completed growth for o-band high power DFB and 25G DML. Fabricated and evaluated 1310nm DFB devices for high power DFB and 1290nm FP 25G DML. 2. Complete G4 qualification (by 6/20) Mid Year - Completed > 500hrs for ELEDs 3. BH Development for SLED, SOA and DFB (by Q4 2020 for SLED, Q1 2021 for SOA and Q2 2021 for DFB) Mid Year - Evaluated requirements for ridge width, Blocking layer, regrowth and FF for FP. Continue to evaluate etch with Dry+Wet and Full wet. 4. MFA Development (ongoing) Mid Year - Have not done much work on this. But going to provide some samples for Hisense for coupling evaluation and potentially an NRE. AMF MOU signed and we have completed the proposal for kickoff. We have fabricated an 1550 EPI to evaluate HIC with Q-layer to determine competitiveness against BH and SSC devices. 5. Regrowth (including SAE growth) (by Q2 2021) Mid Year - SAE growth and Fe growth completed. But still need to evaluate the impact of contamination of Fe growth in G4. 6. Grating development (by Q4 2020) Mid Year - Grating designs for high power DFB and 25G have completed 1st iteration and requirements for 2nd iterations have been confirmed including buffer thickness. Evaluating 2nd iteration devices end Sep 20. Besides Almae, additional grating vendor HXOPTO is under evaluation and we are evaluating gratings written by Phable in 25G.	2021-06-30	15	Weekly update reports by team including engineering builds	NIL	NIL	1	1	1	NIL	NIL	NIL	null		262	430837474	3
408	MOCVD Operational Improvement	1. G4 qualification Mid Year- > 500 hrs Completed using 54708T devices Continue to qualify with 10 wafer growths by Q4 2020 2. MOCVD Production Process Controls (Tool and Products) Mid Year - Tool SPC chart is done and being recorded SPC charts for products is on going. But higher volume products such as 54708T is completed. Continue process control development 3. MOCVD recipe consolidation Mid Year - Alignment for products in production (i.e. managed by PE) mainly completed. 4. Maintenance improvement Mid Year - Working on improving MOCVD uptime by improving PM a. Inlet and outlet gas management b. Chamber cleaning and prevention of contanmination c. Pump and cold trap 5. Characterisation of EPI Mid Year - Improvement of XRD, PL and ECV analysis still ongoing Periodic screening of EPI with TEM and SIMs analysis implemented for growth control	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		262	430837474	4
413	Revenue goal - Achieve > US$ 12.1M revenue in 2020 as per AOP	1) Support POET, 25G DML, Huawei SOA, Panwoo, Almae BH, BW10 and other Laser projects. 2) Help achieve 2 design wins for 1653DFB 10G i-temp & 25G DML or High power DFB c-temp, 3) Back up tools qual	2020-12-31	25	Revenue, design wins, back up tools	NIL	Good support by team for above projects	1	1	1	NIL	NIL	NIL	On Track		263	324340084	6
419	sale channels/distributors	Sign two or more distributors in Greater China	2020-12-31	25	Distribution contract documents	NIL	NIL	1	1	1	NIL	NIL	NIL	null		265	25957709	1
424	Hisense 7-Pin Qual	1. Mech shock/vibration shock/temp cycling\r\n\r\n2. ESD\r\n\r\n3. Thermal Shock\r\n\r\n4. High-temp storage	2020-04-15	1		NIL	NIL	1	1	1	NIL	NIL	NIL	null		155	931345185	3
433	25G BW10 DML, CWDM4, c-temp Program	2. 25G BW10 DML, CWDM4, c-temp Project Delivery\r\na. Leverage mainly on 1310nm Project Activities/Milestones\r\nb. Establish and Organize Regular Project Update, Planning, and Deliveries (Jul 2019)\r\nc. Project Milestone Plan Deliveries ??? Completed (July 2019)\r\nd. Alpha Phase Test Verification Build ??? On Going (Est Comp; Q1-2020)\r\ne. Rel-Qual Completion\r\n- Pre-Qual Completed\r\n- Beta-Qual Completed >2500 hrs\r\n- Lot#2, Lot#3 Submission\r\nf. Customer Beta Sample Shipment ??? On Going (Est Comp; Q3-2020)\r\ng. Beta Phase Exit - Q4-2020\r\nh. Release to Product Engineering Team - Q1-2021	2019-12-31	20	Release to Production	NIL	NIL	1	1	1	NIL	NIL	NIL	null		170	1207021661	3
378	Support Daily Fab A Process Operation	- Loading/Unloading wafers from MOCVD tool (G4 as well as AIX200)\r\n- Perform characterization using : XRD, PL, microscope & ECV\r\n- Start recipe if it is needed\r\n- Keeping up to date information of wafer transfers, growth runs and characterisation	2020-09-30	30	MOCVD Log sheets	NIL	NIL	1	1	1	NIL	NIL	NIL	null		190	1598293097	6
386	Making Sure MOCVD Tool Is Ready For Daily Operation	- Perform daily checks for MOCVD tool (G4 & AIX200)\r\n- Do checks on MO bath(chillers) and also perform glycol exchange when needed\r\n- Do linear change(AIX200) & ceiling change(G4) when required by process team.\r\n- Also perform aqua etching for linear and ceiling at respective wet benches\r\n- Maintain scrubber by topping up sodium hypochlorite(NACLO) every 5 days.\r\n- Perform hot water flush and drain the exhaust line of wet scrubber on a weekly basis to prevent choking of pipes.	2020-09-30	40	MOCVD Log sheets & excel sheets	NIL	NIL	1	1	1	NIL	NIL	NIL	null		190	1598293097	6
393	Support Activities On Improvements	- Data processing\r\n- SPC, maintenance \r\n- Monitoring tools behaviour\r\n- Conducting routine PM	2020-09-30	30	MOCVD Log sheets, excel sheets & word documents	NIL	NIL	1	1	1	NIL	NIL	NIL	null		190	1598293097	6
430	6S, Housekeeping and Safety	- Take ownership for the housekeeping compliance for the team and drive the team to achieve Zero NC due to housekeeping a safety.\r\n- Constantly communicate with the team and align them on housekeeping and safety protocol\r\n- Take ownership to ensure Zero non-conformance for Safety violations within the team\r\n- Ability to detect safety gaps and resolve them.\r\n- Ensure that the newcomers are briefed on the safety specs and the document needs to be signed off.\r\n- Need to take ownership and responsibility for all safety related issues.\r\n- Inform SM and above immediately for serious incidents. Need to ensure execution of preventive and corrective actions so that there is no reoccurrence of similar issues.\r\n- Need to inform SM and above for Fab Evacuation and any Line Down issues	2021-01-01	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		198	1941685512	6
414	Yield	DFB yield improvement to 70% and Others (SLED & ELED) to ~ 90%, Mechanical yield > 90%, Fix marginality issues (ripple issues, peeling, process consistency), 3 inch wafer demonstration,	2020-12-31	20	Yields, yield sigma	NIL	good work on DFB yield and 54708 yield. Need to do 3: demo by year end.	1	1	1	NIL	NIL	NIL	On Track		263	324340084	6
428	Communication, Teamwork and  Cost Reduction	- Communicates clearly and intelligently with vendor and collogues  on the machine issue to improve the machine performance.\r\n- Works well with the fellow employees without friction\r\n- Looking for the alternative vendor to provide same quality and performance\r\n- Looking for the higher durability parts with lower cost.	2021-01-01	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		198	1941685512	4
434	25G DLS-G4 DML, CWDM6, i-temp Program	1. 25G DLS-G4 DML, CWDM6, i-temp Project Delivery\r\na. Design Verification\r\nb. Process Verification\r\nc. Alpha Sample Readiness\r\nd. Initial Rel-Qual Verification	2019-12-31	30	Alpha Sample	NIL	NIL	1	1	1	NIL	NIL	NIL	null		170	1207021661	3
431	Expected behaviors traits for quality excellence	- Report to work on time\r\n- Use time constructively\r\n- Good working knowledge of job assignment\r\n- Organizes and performs work in a timely, professional manner\r\n- Willingly accepts work assignments.\r\n- Willingly accepts changes in assignments not directly related to job\r\n- Performs assigned duties with less or no supervision\r\n- Performs assigned duties with less or no supervision even under pressure and extra  time.	2021-01-01	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		198	1941685512	6
429	Machine operation, spec and history issue	- Maintains neat and orderly workstation\r\n- Maintains neat and orderly paperwork on the machine issue, spec and history.\r\n- From the history will have the effective troubleshooting on the machine issue and the performance.\r\n- Ensure all communication and documents are presented in an organized and professional manner.	2021-01-01	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		198	1941685512	5
432	POET Program	1. POET Project Delivery\r\n a. Establish and Organize Regular Project Update, Planning, and Deliveries\r\n b. Almae BH ??? Complete delivery of twelve (12) quarter-wafers\r\n - four (4) quarters of 1271nm\r\n - four (4) quarters of 1291nm\r\n - four (4) quarters of 1311/1331nm\r\nc. CWDM (Onix)\r\n- two (2) full wafers of 1271nm\r\n- two (2) full wafers of 1291nm\r\n- two (2) full wafers of 1311nm\r\n- two (2) full wafers of 1331nm	2019-12-31	20	1. weekly Project Update, 2. PO, 3. Sales Invoice, 4. Customer shipment acknowledgement	NIL	NIL	1	1	1	NIL	NIL	NIL	null		170	1207021661	1
435	InPhi High Power CW Laser Program	4. DBF, CWDM, 70mW, 300mA - CW\r\na. Establish and Organize Regular Project Update, Planning, and Deliveries\r\nb. Design Verification\r\nc. Process Verification\r\nd. Alpha Sample Shipment	2019-12-31	30	Alpha Sample	NIL	NIL	1	1	1	NIL	NIL	NIL	null		170	1207021661	3
436	Equipment maintenance, CIPs and mindset change	???\tFFU unit repair-Fab B completed. Other area in progress,\r\n???\tRepairing and testing on PCB, power supply, control board and motor for Fab B and MOCVD.\r\n???\tBuy and stock in electrical and electronics compound need for company.\r\n???\tOwnership for Lithography and metrology tools, prepare spare parts and improvement project ongoing.\r\n???\tPLAT-01 intermittent wafer breakage issue- to modify top assembly part in progress,\r\n???\tDEVE-01 spindle rotation issue- motor driver repair in progress,	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		236	850138976	4
418	External Manufacturing	Improve and manage business relationship and KPIs with the subcons.	2020-12-31	25	Subcon Reports	QBRs are held quarterly with the subcons.\r\nCycle time for all subcons have improved especially Allray, SFO and Coset. Work on going to improve the cycle time at PMS.\r\n1st pass yield for SFO has improved to > 90% with the transfer of ferruling process to the suppliers.\r\nSubcons yield are > 90% for all except PMS. Work in progress to improve their yield together with PE.	NIL	1	1	1	NIL	NIL	NIL	On Track		264	759336758	4
437	6S, Housekeeping and Safety	???\tTake ownership for the housekeeping compliance for the team and drive the team to achieve Zero NC due to housekeeping a safety.\r\n???\tConstantly communicate with the team and align them on housekeeping and safety protocol\r\n???\tTake ownership to ensure Zero non-conformance for Safety violations within the team\r\n???\tAbility to detect safety gaps and resolve them.\r\n???\tEnsure that the newcomers are briefed on the safety specs and the document needs to be signed off.\r\n???\tNeed to take ownership and responsibility for all safety related issues.\r\n???\tInform SM and above immediately for serious incidents. Need to ensure execution of preventive and corrective actions so that there is no reoccurrence of similar issues.\r\n???\tNeed to inform SM and above for Fab Evacuation and any Line Down issues	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		236	850138976	6
438	Equipment maintenance, CIPs and mindset change	???\tPerform at least 10 improvement to the machine for better productivities or machine reliability. \r\n???\tTo ensure the team login and update the Equipment status properly into the daily equipment status tracking file.   \r\n???\tTo be able make logical and decisive decision to safe guard the company need. \r\n???\tGood to raise concern, but always come up the work around solutions to get things moving.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		236	850138976	4
439	Expected behaviors traits for quality excellence	???\tNeed to have initiative to learn, apply and improve\r\n???\tNeed to have Self-discipline in the works undertaken, this is to ensure max level of passion and pride, hunger and want.\r\n???\tAdaptability - Continuously learning to adapt to changes in environmental factors and manage the given priorities and stay engage to allow moving in the same company???s direction to achieve the needed goals.\r\n???\tWork with Urgency and Correct Priority - Continuously managing job priorities and working with urgency to match management priority\r\n???\tAbility to Multi-Task - Constantly working and juggling between multiple tasks and people to deliver max results. \r\n???\tContribute to Team Success - Continuously providing service to equip, process and manufacturing team members to help them succeed in their works.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		236	850138976	4
440	Equipment maintenance, CIPs and mindset change	???\tMAL-03 x,y and z axis movement motor repaired and tested ok.\r\n???\tMOCVD scan profiler mother board issue-repaired and tested ok.\r\n???\tPDS-01 rf forward issue- rf controller board repaired and tested ok.\r\n???\tEBEV-02 thickness monitor controller- repaired and tested ok.\r\n???\tSPUT-01 pressure monitor controller-repaired and tested ok.\r\n???\tLearning all Fab B equipment Weekly and Monthly PM in progress,\r\n???\tFab B air shower auto close function completed.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		236	850138976	4
353	PDMS	Migrating from manual approval and excel/word based specs system to database system (PDMS)	2020-12-31	16	Enable the successful launching of PDMS in DLS	NIL	NIL	1	1	1	NIL	NIL	NIL	null		252	10	5
357	To support simulation capability in PE Department	To support simulation capability in PE Department	2020-12-31	16	To support simulation capability in PE Department	NIL	NIL	1	1	1	NIL	NIL	NIL	null		252	10	6
227	To document procedures for G4 and implement SPC control for G4	I will try to make the SPC ready for the processes in G4	2020-12-25	20	Readily available SPC charts to monitor the status of G4	NIL	NIL	1	1	1	NIL	NIL	NIL	null		179	1906914592	4
441	To develop a procedure for step 1b of SAG	To establish a procedure or model to characterize the materials deposited in mask opening by SAG.	2020-12-25	30		NIL	NIL	1	1	1	NIL	NIL	NIL	null		179	1906914592	3
226	To optimize the process for AlQ based BH	AlQ based BH is going to be a important building block for various applications including CW-DFB, DMLs etc. In addition, this will allow us to develop the Butt-Joint structures, where DFB laser can be integrated with other components such as EML, SSC, and waveguides.\r\nMy objective is to optimize the MOCVD growth conditions to obtain good morphology blocking layer growth with low leakage current.	2020-12-25	25	Reduce the leakage current in AlQ based BH structures	NIL	NIL	1	1	1	NIL	NIL	NIL	null		179	1906914592	3
427	Equipment maintenance and CIP	- Complete all schedule PM and critical equipment PM by Q420, ensure that the integrity of the checklist is up to date and error free\r\n- Reduce unplanned down-time by 5 % compare to 2019 for 2020\r\n- Perform at least 5 improvement to the machine for better productivities or machine reliability.\r\n- To ensure the team login and update the Equipment status properly into the daily equipment status tracking file.\r\n- To be able make logical and decisive decision to safe guard the company need.\r\n- Good to raise concern, but always come up the work around solutions to get things moving.\r\n- Increase the KPI for the MOCVD yearly 5 % or maintain the optimum  KPI.	2021-01-01	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		198	1941685512	4
442	To optimize growth recipe for AlQ based materials emitting at 1550 nm	To assess if AlQ based 1550 nm can be used for any i-temp applications	2020-12-25	25		NIL	NIL	1	1	1	NIL	NIL	NIL	null		179	1906914592	3
460	Cost Reduction	Develop and create projects and activities that will reduce the manufacturing cost and improve Product Engineering team productivity and efficiency in terms of Data Analysis and Data Mining	2020-12-31	25	Cost Reduction	NIL	NIL	1	1	1	NIL	NIL	NIL	null		217	1484926575	4
471	Quality	SLED and ELED RMA/NCMR technical support and timely response to customer.	2021-03-31	15	QA RMA Tracking	NIL	NIL	1	1	1	NIL	NIL	NIL	null		169	1352141850	6
484	Quality and Safety	ISO Compliance	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		181	1536568573	1
258	25G manual jig readiness and coating yield improvement	1) Improve jig capacity while maintaining high yield\r\n2) Improve bar loading speed\r\n3) Improve throughput per run in Denton I29\r\n4) support qualification process for all 25G products in Denton I29\r\n - AR / HR coating for Alu containing QWs in Denton I29\r\n - AR coating for non-hermetic devices.	2020-11-15	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		241	2125149271	3
486	Denton I29 Tool qualification	1. Tool Installation: Tool upgradation ongoing.\r\n2. Process development: calculate n and k values, TF, Recipe developments, \r\n3. Coating designs for AR & HR\r\n4. Deposition & spectral measurement for the stacks\r\n5. Tool Qual: SLED & DFBs\r\n     ( Process development, Deposition ) \r\n     ( Pass- CBT, HTOL, TS & ESD )\r\n"	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		241	2125149271	3
363	Benefit Reviews	To continue ensure the benefits for the employees are competitive with the market for retention and motivation	2020-12-31	20	Programs developed	To date, we have implemented the salary increment and market adjustment was executed on 01.07.2020. In Oct 2020, the proposal for the operators in-hire rate adjustment that required a compression exercise was discussed and, which will be implemented in Nov 2021.	NIL	1	1	1	NIL	NIL	NIL	On Track		256	534558467	6
444	Technical lead for Renesas process trial for fabrication of 25G BH-DML product	a) Epi process trial for Step-1A and Step-1B\r\n    - complete and clear both steps\r\nb) Epi process trial for Step-2A and Step-2B\r\n    - complete and clear both steps\r\nc) Transfer of full fabrication process to DLS	2020-12-31	20	1) Minutes and presentation slides of meeting between Renesas and DLS, and 2) Documentation of product transfer to manufacturing at DLS	NIL	NIL	1	1	1	NIL	NIL	NIL	null		150	1557152765	3
445	Development of low PDG SOA devices	a) Develop low PDG SOA chips for 1310nm and 1550nm\r\n    - mid-year: samples of 1310nm low PDG SOA chip (p-side up)\r\n    - year-end: samples of 1550nm low PDG SOA chip (p-side up)\r\nb) Develop chip for p-down flip-chip assembly onto SiPh platform (Huawei delivery)\r\nc) Develop test methodology for low PDG SOA to meet spec and throughput requirement\r\nd) Oversee reliability qualification and product transfer from NPD to manufacturing\r\ne) Provide subject-matter engineering support for SOA device	2020-12-31	35	1) Product design file documents, 2) test reports, 3) manufacturing transfer doc	NIL	NIL	1	1	1	NIL	NIL	NIL	null		150	1557152765	3
115	MOCVD Operational Improvement	1. G4 qualification\r\n\r\n2. MOCVD Production Process Controls (Tool and Products)\r\n\r\n3. MOCVD recipe consolidation\r\n\r\n4. Maintenance improvement\r\n\r\n5. Characterisation of EPI	2021-03-30	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		144	430837474	4
114	New Technology and Capabilities Development	1. AL wafer growth\r\n\r\n2. BH Development\r\n\r\n3. High power DFB and 25G DML Grating development	2021-03-30	20	Weekly update reports by team including engineering builds	NIL	NIL	1	1	1	NIL	NIL	NIL	null		144	430837474	3
446	Development of high PDG and high Psat C-band SOA devices	a) Develop SOA chip for p-side down flip-chip bonding\r\n    - samples of SOA chip that can be p-side down flip chip bonded\r\nb) Develop 1550nm high PDG SOA with high Psat\r\nc) Develop 1550nm high PDG SOA with wide bandwidth and tight ASE wavelength tolerance\r\nd) Develop 1550nm high PDG SOA based on loopback waveguide configuration with single-sided AR coating\r\ne) Develop good AR coating for high power requirement of SOA\r\nf) Develop test methodology and setup for high PDG high Psat SOA\r\ng) Oversee reliability qualification and product transfer to manufacturing\r\nh) Provide subject-matter engineering support for SOA device	2020-12-31	35	1) Product design file documents, 2) test reports, 3) manufacturing transfer doc	NIL	NIL	1	1	1	NIL	NIL	NIL	null		150	1557152765	3
464	NCMR	The SLED NCMR cases must 30% lower than 2019	2020-12-31	15	SLED NCMR summary by QA	NIL	NIL	1	1	1	NIL	NIL	NIL	null		176	610693885	6
472	Operation and Sales Support	Production Support and Sales Technical Inquiry Support	2020-12-31	15		NIL	NIL	1	1	1	NIL	NIL	NIL	null		169	1352141850	6
368	CTO Role: Developing company technology strategy to support business goals	a) Direct R&D and Technology Transformation Roadmap to support Company Revenue growth (forecast) objectives: $12M in 2020, $19M in 2021, $28M in 2022 b) Communicate technology strategy and directions to employees, customers, partners and investors. c) Lead KFA5 (Strategic Initiatives on New Product Technology Development) d) Provide technical guidance and mentorship to all engineering staff	2020-12-31	35	Company Technology Roadmap, technical presentations & meeting contributions, KFA Reviews with CEO	a) \t(i) Regular updating of company technology roadmap \r\n\t(ii) Datacom: Mapping Datacom Type-A Intra-DCI (CW-DFB & EML), Type-B Inter-DCI Strategy (coherent)\r\n       \t(iii) Sensing: Mapping for higher value: MOPA, Optical engine and Interrogators\r\nb)\t(i) Presented Lunch-time Talk: March2020: Coherent Comms Pluggables\r\n       \t(ii) Supported BOD on technical due diligence for HTOE acquisition\r\nc) \tLead/Sponsor KFA5 (New Product Technology Development) ??? yes\r\nd)\tYes, via various forum: NRE proposals, NPI mtgs, PE mtgs, KFA2.4(Tech mkt)	Need to develop requirements document for each new technology. Can vary from country to country.	1	1	1	NIL	NIL	NIL	On Track		258	1135328161	5
360	Improve Company's Branding	Improve company???s image for better hiring sourcing and overall reputation of Denselight	2020-09-30	20	Implementation of the E-PMP and E-OT on schedule	Participated a total of 4 Job fairs: a. 20/1/2020 NTU Job Fairs (F2F); NTU Virtual Job Fair 13 - 17.07.20; USPUR 1 - 31.08.20 (Virtual); SG Enable Virtual Training & Career Fair 5 19.09.20 (Virtual)	Hiring process still needs to be fine tuned. Need to get out of watch list of TAFEP.	1	1	1	NIL	NIL	NIL	On Track		256	534558467	5
361	Develop & Improve standard Recruitment Process to Reduce Attrition	1. Set up a more robust KFA no.1 teams to lead by new energized leaders \r\n2. Look at Selection Assesmen tool to check for culture fit and commitment from final 2 candidates to 'Hire Right'.	2020-12-31	20	KFA Monthly meetings	Revamped the entire KFA no.1 team leaders. Tirso has completed KFA no.1.1; remaining KFA 1.2 to KFA 1.5 still on-going.  For the Selection Assessment Tool - we will review if we can afford such a system to maintain cost expenditure. This may move to year 2021 for review.	Recruitment process, in particular interview process, needs to be looked at in 2021	1	1	1	NIL	NIL	NIL	On Track		256	534558467	5
362	Reduce Turnover	Retain effective employees and motivate them to higher productivity	2020-12-31	20	KFA 1.3 monthly report	To date the Voluntary average monthly Turnover for Indirects is at 0.9% (August 2020).  Target for voluntary average monthly indirects Turnover is 1.5%.   We have commenced on different programs e.g. Touch Points survey, HR Chit-chats with employees and Buddy System for new hires.	Attrition has dropped slightly but still above market standard	1	1	1	NIL	NIL	NIL	On Track		256	534558467	4
509	test	test	2020-12-31	100	test	Mid year employee comments	Mid Year Manager's Comments	3	1	1	End Year Employee's Comments	NIL	NIL	On Track		\N	17	1
508	test2	test2	2020-12-31	50		NIL mid comm2	NIL	3	1	1	NIL	NIL	NIL	On Track		\N	17	3
447	Technical support to development of high temperature high power CW DFB lasers	a) Design of epi-structure and gratings for CW DFB lasers\r\nb) Technical liaison and point of contact for ebeam grating writing, grating processing and cleave and coat by external vendors\r\nc) Provide subject-matter engineering support for DFB laser and DFB grating design and fabrication\r\nd) Provide subject-matter engineering support for BH devices, including BH-DFB and BH-SOA\r\ne) Continued support in development of high temperature CW DFB laser for Sicoya	2020-12-31	10	1) Design reports, 2) SOW requirement documents	NIL	NIL	1	1	1	NIL	NIL	NIL	null		150	1557152765	3
449	Enhancing good experience and engagement of the customer	A leader in KFA 5.3: Develop capabilities for MFA-embedded photonics to render disruptive performance in sensing modules (SLED device) and datacom lasers (SiPh power bank for DFB) \r\nScope:\r\n    i. Exploits embedded MFA technique to current P-Side up the device to attain disruptive performance for MFA enable sensing module\r\n       -Couple power BW enhancement  for SLED/DFB device during packaging \r\n    ii.  Exploits embedded MFA technique to high power density laser banks for data center and COBO applications \r\n       -Transmit laser through fiber / WG to integrate with SiPh platform\r\n   iii.  Seek and establish External collaboration with AMF, IMEC, COBO, etc. group to implement commercially viable Optical Engine \r\n\r\nResponsibilities:\r\n   1. Leading and managing a key functional area of the project\r\n   2. Collaborating and coordinating the workflow with the other groups (DLS and outside) related work package\r\n   3. Project deliverable/success criteria \r\n   4. Task assignment and consolidated summary	2021-12-31	15		NIL	NIL	1	1	1	NIL	NIL	NIL	null		238	539619816	1
448	Efficient leadership	A. \r\nSupervision of fellow engineers to bring the performance level of employees according to the management expectations - Weightage (25%)\r\nResponsibilities:\r\n1. Establish the capability of the team for New product development support by mentoring\r\n2. Build leadership engagement skills \r\n3. Create job scope and supervise fellow engineers accordingly\r\n4. Contributing towards goal alignment with management and create/ facilitate new ideas within the team according to project requirements\r\n5. Contribute to PMP settings for fellow juniors\r\n6. Performing administrative managerial job\r\n\r\nB.\r\nDepartmental audit - Weightage(5%)\r\n\r\nResponsibilities:\r\n1. Establish the capability by participating in training for Quality Management System (QMS)\r\n2. Audit the areas of DLS (eg. APT, Fab A, Fab B, etc.)\r\n3. Represent NPD for ISO9001:2015 and prepare required documents for audit submission (eg. Indigo for previous consecutive 2 years  and this year prepare the team for projects: 25G, SOA, High Power DFB)	2021-01-01	30		NIL	NIL	1	1	1	NIL	NIL	NIL	null		238	539619816	5
451	Leading technical team focusing project deliverable according to success criteria	A. High power  CW CWDM (1270, 1290, 1310, and 1330) DFB program \r\n\r\n  Customers: CISCO (40mW @80C, 35dB) and InPhi (70mW@75C, 35dB) \r\n\r\nResponsibilities:\r\n\r\n1. Technical team lead and manage project deliverables from March 2020 to 9th October 2020\r\n2. Technical team lead from 16th October 2020\r\n3. Customer engagement and decision making\r\n4. Risk assessment and mitigation\r\n5. Consolidate summary report\r\n\r\nB. High efficient SLED \r\n\r\nCustomer: ELOIRA (Enhance temperature performance -40C to 85C and reduce turn-on time <4s)\r\n\r\nResponsibility:\r\n1. Technical team lead and manage project deliverables from January 2020 to 15th September 2020\r\n2. Consultant 16th September 2020\r\n3. Transfer new product development to PE team\r\n4. Cost reduction on overall DLS SLED BTF packaging\r\n5. Consolidate summary report\r\n\r\nCustomer: Indigo (Enhance Wall Plug Efficiency by 1% for 1670 - 1690nm SLEDs)\r\n\r\nResponsibility:\r\n1. Technical team lead and manage project deliverables for upcoming customer demands\r\n2. Transfer new product development to PE team\r\n\r\nC. Transfering knowledge to the team members for POET project\r\n\r\nResponsibility:\r\n   \r\n1. Documentation on 1310 DFB+SSC (CISCO) development	2021-01-01	50		NIL	NIL	1	1	1	NIL	NIL	NIL	null		238	539619816	3
493	Daitron bar stacker qualification	1) 250 um, 300 um, 350 um, 1000 um & 1500 um cavity length bars qualification \r\n2) Training of operators/technician\r\n3) Standard operating procedure manual for operators & technicians	2020-12-31	5		NIL	NIL	1	1	1	NIL	NIL	NIL	null		241	2125149271	5
466	File paper	Finish at leave 2 paper before end of the year	2020-12-31	5	Paper acceptance letter	NIL	NIL	1	1	1	NIL	NIL	NIL	null		176	610693885	6
489	SLED & ELED AR Coating in Trion	???\tTo qualify Trion PECVD-02 for AR coating on SLED Products \r\n???\tTo complete 500 & 1000 hours of HTOL for SLED product    \r\n???\tOutput power reduction should be within 20 % range\r\n\r\n??? To qualify Trion PECVD-02 for AR coating on ELED Products\r\n??? To complete CMFG 500 hours of HTOL for ELED products\r\n??? Output power reduction should be within 20 % range	2020-08-31	5		NIL	NIL	1	1	1	NIL	NIL	NIL	null		241	2125149271	4
347	Digital board	Develop digital board for ILM boxes	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		145	1813039923	3
450	Support Sales for continuing DLS AOB	Collaborating with the Sales department to deliver the product demands in AOB\r\n\r\nResponsibilities: \r\n\r\n1. Co-ordinating task according to demands\r\n     a. OSI\r\n     b. Dust Photonics\r\n     c. RainTree\r\n     d. Sicoya\r\n     e. Trong Siang\r\n     f. Photolex\r\n2. Effective collaboration with operation and manufacturing to improve lead time forecasting\r\n3. Create suitable technical specification\r\n3. WO raise \r\n4.  Data analysis and create die picklist	2021-01-01	5		NIL	NIL	1	1	1	NIL	NIL	NIL	null		238	539619816	6
491	E-BEAM & RTP backup tool (External)	E-Beam: \r\n1) vendor at IMRE\r\n\r\nRTP backup:\r\n1) Purchased 4 point probe tool to measure sheet resistivity of metal films??before and after RTA \r\n3 temp linearity check using one of the metals in-house??and then at NTU later(to check if there is any offset)\r\n2) vendor at NTU	2020-11-16	5		NIL	NIL	1	1	1	NIL	NIL	NIL	null		241	2125149271	4
485	Automatic bar loading tool for 150 um cavity length	Collaboration with Singapore Institute of Manufacturing Technology to design and built automatic bar loading tool for 150 um cavity length bars\r\n1) Similar mechanism to current Daitron bar loading without the picking step	2021-02-28	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		241	2125149271	4
501	Hunettest	Testing	2020-12-12	100	N/A	All Okay	Good	1	1	1	NIL	NIL	NIL	On Track		\N	17	1
453	DMES Phase 4 - Fab B Auntomation	Original Objective:\r\nAPT WAT Automation\r\nDevelop/Write a program application using Microsoft Visual studio and C# Language with Maria DB Server\r\n3a. Analysis\r\n3b. Planning\r\n3c. Design\r\n3d. Execution\r\n3e. Testing (User Acceptance)\r\n3f. Deployment\r\n\r\nNew Objective:\r\nDMES Phase 4\r\n3a) Dashboard\r\n3b) XOR Tool\r\n3c) Production Scheduling	2020-12-31	15	DMES Phase 4	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		214	1608216415	3
454	Customize Google Form	Enhance Approval Workflow Form \r\nDevelop/Write a program application using Google App Script ??? Google Script language and Maria DB Server\r\n5a. Convert data from Google Sheet to Database\r\n5b. Submission Tracking\r\n5c. View Approved and Rejected record with filtered view	2020-08-31	7	Enhance Approval Workflow Form	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track	3.PNG	214	1608216415	3
455	DDA Web Application	Original Requirement:\r\nEnhance DDA Web App\r\nDevelop/Write a program application using Google App Script ??? Google Script Language and Maria DB Server\r\n4a. Document Submission\r\n4b. Document Approval\r\n4c. Digital Signature\r\n4d. Tracking Documents	2020-12-31	8	DMES Phase 4	NIL	NIL	1	1	1	NIL	NIL	NIL	On Track		214	1608216415	3
376	Software Management	Implementing publish trigger function on DMES, so any new updates/changes done by Rebecca able to be published directly to all client workstations (3 workstation at Fab-B plasma, 2 workstations at Litho, 2 user notebooks for Jason and The, and soon will also install for Process Engineer Notebooks), so when the users open DMES it will triggered update install automatically	2020-03-31	10	Proceed to install DMES on Process Engineer Notebooks	NIL	NIL	1	1	1	NIL	NIL	NIL	null		164	1428738048	4
78	Monthly closing within 4 working days	Financial reporting effectively close on the 4 working days after month end	2021-01-15	25	Date of closing and email out	NIL	NIL	1	1	1	NIL	NIL	NIL	null	Finance_KPI_1_202009.JPG	151	988735390	5
459	Testing Capability in Product Engineering	Enable test capability within the Product Engineering team\r\n\r\nBridge the gaps between new testing requirements from Customer and capability in house for Product Engineering.	2020-12-31	25	Testing Capability in Product Engineering	NIL	NIL	1	1	1	NIL	NIL	NIL	null		217	1484926575	4
468	25G DLS-G4 DML, CWDM6, I-temp Project Delivery	a. Design Verification\r\nb. Process Verification\r\nc. Alpha Sample Readiness\r\nd. Initial Rel-Qual Verification	2020-12-31	30	Alpha phase	NIL	NIL	1	1	1	NIL	NIL	NIL	null		166	2107825133	3
462	Eloira SLED 1550nm	Accomplish the Eloira module evaluation based on customer request (-40C/25C/85C), find the potential risk and find the solution. Provide qualified and competitive products to customer.	2020-12-31	15	Eloira test results and evaluation report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		176	610693885	3
467	25G BW10 DML, CWDM4, C-temp Project Delivery	a. Leverage mainly on 1310nm Project Activities/Milestones\r\nb. Establish and Organize Regular Project Update, Planning, and Deliveries (Jul 2019)\r\nc. Alpha Phase Test Verification Build ??? On Going (Est Comp; Q1-2020)\r\nd. Rel-Qual Completion\r\n- Pre-Qual Completed\r\n- Beta-Qual Completed >2500 hrs\r\n- Lot#2, Lot#3 Submission\r\ne. Customer Beta Sample Shipment ??? On Going (Est Comp; Q3-2020)\r\nf. Beta Phase Exit - Q4-2020\r\ng. Release to Product Engineering Team - Q1-2021	2020-12-31	30	Beta phase	NIL	NIL	1	1	1	NIL	NIL	NIL	null		166	2107825133	3
463	RMA technical support and timely response to customer	1. # of RMAs settled successfully per product group per year. \r\n2. No recurrence of RMA/NCMR upon implementing CA/PA\r\n3. 30%-50% reduction of RMA case from 2019\r\n4. Cycle time of closing the RMA: decreased to 2weeks	2020-12-31	15	RMA report by QA	NIL	NIL	1	1	1	NIL	NIL	NIL	null		176	610693885	6
465	Sales support	Support sales to finish the 2020 SLED technology and market share evaluation for KFA2.3\r\nUpdate all SLED product sheet based on sale's request\r\nComplaint free from sale's team	2020-12-31	10	YTD # of sales engagement supported	NIL	NIL	1	1	1	NIL	NIL	NIL	null		176	610693885	6
461	Yield improvement	To recover the CBT/COS cum yield to 84% (Q3'20)	2020-12-31	25	Major SLED products (CS5153A/CS5169A) must hit 84% CBT/COS integral test yield by Q4'20	NIL	NIL	1	1	1	NIL	NIL	NIL	null		176	610693885	6
470	Mask job	1. Complete the mask drawing requirement correctly\r\n2. Complete the mask drawing requirement on time	2020-12-31	20	Routine work	NIL	NIL	1	1	1	NIL	NIL	NIL	null		166	2107825133	5
469	InPhi high power laser	a. Establish and Organize Regular Project Update, Planning, and Deliveries\r\n\r\nb. Design Verification\r\n\r\nc. Process Verification\r\n\r\nd. Alpha Sample Shipment	2020-12-31	20	Alpha phase	NIL	NIL	1	1	1	NIL	NIL	NIL	null		166	2107825133	3
473	Team and Personal development	Train fellow PE team members on product knowledge and concepts of product engineering.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		169	1352141850	6
456	DFB Program Management	Test Yield Goal: 75% for Almae and Eulitha Grating\r\n\r\nSupport all revenue shipment; plan the packaged product ahead of time based on forecast\r\n\r\nWork with the team to come up with a robust design to meet the target yield\r\n\r\nAssist in analyzing Eulitha Tool, perform the evaluation and data collection\r\nAssist in finding other vendors and qualifying them for DFB Grating Writing	2020-06-02	25		NIL	NIL	1	1	1	NIL	NIL	NIL	null		217	1484926575	3
458	NPD to Production Handover	Attend meetings and monitor the situation of the Following products for production transfer:\r\n\r\nDFB Sicoya 1310nm\r\n- Review the Gamma Phase exit documents\r\nDML 25G DFB\r\n- Review the Characterization Report and Alpha/Beta Phase exit documents\r\nPanwoo 1310 Low DOP SLED\r\n- Establish production readiness and prepare the Data Analysis on all the DOE that comes out	2020-12-31	25	NPD to Production Handover	NIL	NIL	1	1	1	NIL	NIL	NIL	null		217	1484926575	3
474	10-30kHz Linewidth ILM box		2020-12-31	25		NIL	NIL	1	1	1	NIL	NIL	NIL	null		145	1813039923	3
502	testing 1	test	2020-12-12	100		NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	17	1
343	Yield Improvements	ELED Yield Improvements:\r\n\r\nQ3 Status:\r\n1. Found out there is a toggle in different etcher tools (Oxford vs Samco), channeled all production to Samco and it pulled the ripple baseline from 0.2dB to 0.1dB.\r\n 2. Record Yielding wafer 20023B from Samco is 87%.\r\n 3. Found a couple of tester issues that  like poor coupling to OSA and unreliable test result if autobar loading is more than 3 bars.\r\n 4. Reached yield of 77% with baseline design due to tester control improvements.\r\n 5. Found out the original design is not robust enough to handle process variations that induce ripple.\r\n 6. Designed an engineering mask with absorber and taper to make it robust to process variations.\r\n 7. 500um cavity length showed more coating thickness tolerance.\r\n\r\nDL-CS5153A Yield Improvement\r\n\r\nQ3 Status:\r\nDL-CS5153A COS WAT yield showed 40nm SCH thickness can bring back the yield back to 100%.\r\nNeed to reconfirm with full wafer.\r\n\r\n\r\nDL-CS5169A Yield Improvement\r\nQ3 Status:\r\nDL-CS5169A repeat build is yielding 100% in WAT using wafer 20040A.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		169	1352141850	4
476	Goals For The Program Management Team	The primary goal is to use the PDM as an effective tool to gate the different development phases and ensure schedule conformance.  The secondary goals is to develop the program managers overall technical capability in order that a broader perspective on the program outlook can be obtained.	2020-11-15	1	PDM Conformance	NIL	NIL	1	1	1	NIL	NIL	NIL	null		155	931345185	5
478	Acacia : Custom C band 4-port folded SOA Chip	1. Develop a  custom C band 4-port folded SOA Chip \r\n2. Meet key specs : Noise Figure; Output Saturation Power; Mode Field Adaptor / Bow Tie; Far Field & Temperature Performance requested by the customer\r\n3. Integrate P-down Flip chip development for the custom SOA chip\r\n4. Deliver alpha/mechanical samples to the customer in May'21. \r\n5. Deliver beta/ chip qual samples to the customer in Dec'21	2020-12-31	33	Complete SOA Die design by Dec'20	NIL	NIL	1	1	1	NIL	NIL	NIL	null		172	364472470	1
479	ZTE / Hitachi / Huawei  : Custom SOA/Gain Chip development	1. Close on one of the key SOA/Gain Chip custom projects from 1 of the 3 customers in 4Q'20\r\n2. Meet the deliverables as provided in the project plan and schedule by end-4Q'20	2020-12-31	33	Close and win one of the custom SOA/Gain Chip development projects from ZTE/Hitachi/Huawei	NIL	NIL	1	1	1	NIL	NIL	NIL	null		172	364472470	1
248	Training to other engineers or new comers	Transfer technical knowledge to junior engineers and technician so that they can work independently in FabA on both tools AIX200/4 MOCVD as well as G4 AIXTRON MOCVD tool\r\n-\tCreate a training program in FabA \r\n        Hardware exchange: ceiling, Collector ring, Diffusion barrier, susceptor, satellites, etc.\r\n-\tEstablish power point presentation for each and every new program\r\n        25 G slides\r\n        Low DOP slides	2020-10-31	10	G drive	NIL	NIL	1	1	1	NIL	NIL	NIL	null		147	645448974	6
251	BH RG epi deve	1.\tBH epi growth development for high power and high-speed devices\r\n        - Epi growth optimization of RG on pattern substrate\r\n        - Optimization of Fe doping level for the current blocking layers in order to avoid any kind of leakage\r\n         - Growth parameter optimization to avoid any further inter-diffusion between Fe and Zn during RG \r\n             (a) Growth temperature\r\n             (b) Zn doping level for p-clad\r\n             (c) Passivation of side wall with thin InP layer	2020-12-31	10	Dedicated slides to confirm each task	NIL	NIL	1	1	1	NIL	NIL	NIL	null		147	645448974	3
481	DLS-AMF Collaboration to integrate DLS laser chip to AMF SiPh platform to offer DLS customer SiP based solutions through a partnership with AMF	1. Meet the deliverables and schedule of Proof-of-Concept 1\r\n - Demonstrate optical coupling of DLS-MFA chip on AMF demo SiPh Edge-Coupler) \r\n2. Meet the deliverables and schedule of Proof-of-Concept 2\r\n- Demonstrate FC assembly of DFB FC chip on AMF demo SiPh platform	2020-12-31	33	Fabricate and supply of ready flip-chip lasers to match AMF SiPh wafers(edge couplers)	NIL	NIL	1	1	1	NIL	NIL	NIL	null		172	364472470	3
246	2800G4HT MOCVD tool qualification	1.\tTool qualification based on InGaAsP material growth\r\n              1a. 54708T ELEDs products @ 15XX\r\n              1b. Low DOP 1310 SLEDs for Panwoo @ 13XX\r\n\r\nThe objective is to qualify the G4 MOCVD tool by choosing two different wavelengths such as 15XX as well as 13XX products.\r\n- The low DOP SLEDs is based on complex QWs (the most complicated epi structures so far) , where we can qualify both types of QWs: compressive as well as tensile QWs in one reliability test\r\n\r\nMethods used: To qualify an epi growth tool for production, the HTOL (High temperature Operating life test) for 2000 hrs at maximum temperature (85C)/current (120 mA) in Automatic Current Control (ACC) mode were performed on dies packaged into TOCANs with external photo detector (PD)	2020-09-30	10	RELEASE AUTHORIZATION and QS-PED-PR001-FRM02 Engineering Report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		147	645448974	6
480	To achieve undulation free Quantum well structures for 13xx SLEDs as well as SOAs	Develop the epi growth recipe optimization to achieve undulation free 13xx SLEDs and SOA devices	2020-09-17	20	Panwoo device results, XSEM results	NIL	NIL	1	1	1	NIL	NIL	NIL	null		147	645448974	3
482	Daily Yield Dashboard	Establish & publish out daily yield dashboard using TIBCO database; ensure realtime test results capturing; highlight low yield wafers for PE/APT team to investigate.	2020-12-31	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		225	1256890838	5
483	Manpower savings with TIBCO databased enhancement	Revamp data upload process flow for data to be traceable, consistent and real time, and and amenable to addition of new testers.	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		225	1256890838	5
26	Revenue	???\tAchieve > US$ 12.1M revenue in 2020 as per base AOP.  Stretch goal is $14.1M\r\n???\t Introduce new ILM boxes (BF9C/D, BF10..) into market and capture > US $1.00M in revenue\r\n???\tCapture > $1.0M for 16XX DFB, > $1.4M for CW, High speed DFB	2020-12-31	15	Sale report	NIL	NIL	1	1	1	NIL	NIL	NIL	null		148	135493917	1
488	Low stress SiO2 for 25G	SiO2 Film analysis: \r\n1. Refractive Index\r\n2. Uniformity range\r\n3. Stress\r\n4. Wet Etch rate\r\n5. X-SEM thickness calibration with Filmetrics \r\n6. X-SEM Profile	2020-11-15	5		NIL	NIL	1	1	1	NIL	NIL	NIL	null		241	2125149271	3
490	Process backup tool readiness	1. AR coat for DFB in Oxford\r\n2. Low stress SiN HM in Oxford\r\n3. Develop low stress AR coating recipe in Oxford	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		241	2125149271	4
492	M+ plating tool	1) Tool acceptance plan\r\n2) Qualification plan\r\n3) Training of operators/technicians	2020-11-30	5		NIL	NIL	1	1	1	NIL	NIL	NIL	null		241	2125149271	3
494	SPC Monitoring for process and tool	1) Adding more process & tools into SPC monitoring\r\n2) Automate and reflect in real time chart monitoring\r\n3) Google sheets conversion	2020-12-31	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		241	2125149271	4
495	Ripple yield improvement	AR coating process optimization to improve ripple yield\r\nfront & back facet to improve bar thickness uniformity (5nm range)	2020-09-30	10		NIL	NIL	1	1	1	NIL	NIL	NIL	null		241	2125149271	1
503	testing	test	2022-02-21	100		NIL	NIL	1	1	1	NIL	NIL	NIL	null		\N	17	1
280	Target to fabout at around 400 wafers (of 8 process block type)	Target to fabout at around 400 wafers (of 8 process block type), while 257 wafers were fabout in 2019.\r\n\r\n???\tPerform Manufacturing training for new operators and re-train current operators. Train 03 operators skillful in each module/ area (Litho, Plasma, PVD, Litho, LAP, AR/HR). Assure total at least 14 operators/ technicians to run 40 wafers/ month.\r\n???\tParticipating in developing DMES software: dashboard for completed/ WIP wafers by monthly, yearly; WIP wafer tracking and planning. Generate auto OQC reports, and auto SPC from data in DMES runsheets.\r\n???\tReporting Fab B Weekly/ Monthly Operators performance, Equipment utilisation, numbers of processed wafers on each tools.\r\n???\tEmpower employees to take responsibility for their jobs and goals. Delegate responsibility and expect accountability and regular feedback.\r\n???\tImplement at least 10 improvement projects for better MFG efficiency.\r\n???\tCreate systems to eliminate operator???s related Human errors.\r\n???\tEnsure all SPC files updated daily (RID, PML/NML Evap, sputtering, AR/HR).	2020-12-31	30	Number of wafers fabout by end of 2020	NIL	NIL	1	1	1	NIL	NIL	NIL	null	Total_wafer_fabout_details.png	208	1921197435	5
500	Development of C-band High Gain and High Psat SOA	1) Simulate performance of various SOA designs, establish correlation with experimental data and trends with respect to variation of design parameters. \r\n2) Perform testing, characterization and analysis of fabricated SOA devices based on new epi and device designs.\r\n3) Working with team to build up new test setups, including Near Field measurement using IR camera on Sigma Koki station.	2021-01-30	20		NIL	NIL	1	1	1	NIL	NIL	NIL	null		206	31853750	3
499	Development of narrow linewidth ILM boxes.	1) Work with the team to develop the narrow line width laser modules.\r\n2) Work closely with the manufacturing team to handle the RMA and NCMR issues pertaining to ILM boxes.\r\n3) Simulation of the FBGL module (external cavity laser) based on single grating, to be followed by dual grating and parameter tuning for narrowing the linewidth.\r\n4) Test and characterize the performance of NLW laser with an EDFA- a preliminary study for the MOPA development.	2020-12-31	80		NIL	NIL	1	1	1	NIL	NIL	NIL	null		206	31853750	3
366	Advancing DPHI Platform solutions offering	a) DPhi and Optical Engine solutions Technical Directions b) DLS-AMF MOU and POC1&2 c) DPHI implementation, including HIPP to OE solutions engineering	2020-12-31	30	Presentations, reports, meetings pptx and minutes	a) (i) Develop concept for Turnkey Optical Engine Solutions (POC, OE1 & OE2)\r\n    (ii) DPhi trademark registration filed\r\n    (iii) Contribution to DPhi collaterals and marketing effort\r\nb) (i) MOU signing done on 24Aug2020 \r\n    (ii) Devt Phase-1 POC1 & POC2 program plan, DLS POC team formed, POC work in progress\r\nc) (i) DPhi & Optical Engine Phased-concept ppt\r\n    (ii) Discussion in progress with Hisense and HGTech for 400G Intra-DCI FR4 OE	Good progress to date with seminar being held in Oct 2020	1	1	1	NIL	NIL	NIL	On Track		258	1135328161	3
367	Provide technical guidance on Technical Marketing, NRE, NPI and Applications	a) TAM/SAM & Tracking products, applications and market trends b) Technical sales and applications support advisory c) Technical mentorship to NRE proposals d) Technical mentorship to members of NPD and PE teams e) Renesas-DLS Technology Transfer co-ordination	2020-12-31	35	TAM/SAM/market/product studies (pptx/excel), related NRE, NPD, PE meetings, pptx, minutes	a)  Prepared TAM/SAM analysis for Sensing and Datacom market; {coherent, intra-DCI, FOG, OCT) \r\nb)  (i) Technical sales & application advisory: SiLC, InPhi, Luxtera, Elbana, Avophotoics, FOS4X \r\n     (ii) Interrogators: ILM(MOPA), India Railway Project (Redondo & FFT-DAS)\r\nc)  (i) Acacia NRE design proposal, Eloira NRE proposal\r\n    (ii) Northrup Grumman NRE bid:  NRE Technical Proposal developed and presented to NG\r\nd) (i) MOCVD Epi Roadmapping with KFA5.2 & KFA5.4\r\n    (ii) Technical device guidance to NDP: CW-DFB, BH NDP, SOA/GC\r\n    (iii) Denselight patent filing on flip-chip MFA racetrack SOA\r\n    (iv) FOS4X Tech Sales bid and APT build-trail advisory \r\n    (v) Sponsored lunch-time Talk: May2020 by Maumita/KLC on TEC pkg\r\ne) (i) Renesas-DLS Technical analysis for MOU signing\r\n    (ii) Initiated DLS Phase1 technical transfer (done Phase1A)\r\n    (iii) Comment: Renesas corporate change stopped Transfer Program in May2020	Well supported in developing marketing collateral. Good work to date.	1	1	1	NIL	NIL	NIL	On Track		258	1135328161	1
396	Channel Growth	Drive business through Channels, and grow DenseLight revenue in US	2020-12-31	20	Channel Growth (US)	NIL	Not much progress made to date.	1	1	1	NIL	NIL	NIL	On Track		260	985791817	5
400	Sharing of PNL with analysis and cost review - 12 times in 2020	To analysis and share with staff, Fab A, Fab B and ATP the costing related to the respective areas and progress therein.	2021-01-15	25	Data (costing) in excel	NIL	Very dilligent in this area	1	1	1	NIL	NIL	NIL	On Track		261	988735390	4
\.


--
-- Data for Name: GnC_comment_box; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."GnC_comment_box" (id, created_on, goal_id, comment, created_by_id) FROM stdin;
7	2020-11-24 06:07:24.292099+00	514	hi the giid	18
8	2020-11-24 06:08:17.561342+00	514	hi though is good denselight	17
9	2020-11-24 06:14:32.487017+00	515	hi this is good	17
10	2020-11-24 06:16:04.157148+00	515	hi i am manager 1	18
11	2020-11-24 17:31:22.930203+00	516	Hi this is aishwary pratap singh	18
12	2020-11-27 07:02:23.510301+00	517	Hi this is foo	17
13	2020-11-27 07:02:28.638579+00	517	Hi this is foo	17
14	2020-11-27 07:02:50.538975+00	517	hi this	17
15	2020-11-27 07:03:21.036762+00	518	hi this	17
16	2020-11-27 07:12:35.652545+00	518	hi good	18
17	2020-11-27 07:16:42.108684+00	520	hi thi	17
18	2020-11-27 07:17:39.798927+00	520	good is good	18
22	2020-12-02 02:32:51.041551+00	342	asddffsd	861437177
19	2020-12-01 03:05:02.629034+00	464	Closed 7 NCMRs for ELED/SLED with average 77 days cycle time. Higher than 30 days target, but this is comparable to other department. \r\n\r\nPlease verify the NCMR trend under PE, has it increased or dropped 30%.	861437177
24	2020-12-02 02:45:52.776111+00	466	The COS level kink evaluation and improvement on FBGL chip is a good topic to write technical paper.	861437177
25	2020-12-02 02:52:30.022449+00	461	Please add in the current CBT/COS yield & forecast yield  & timeline by product family as we presented in the yield meeting. You can add in to the KPIs.	861437177
27	2020-12-02 06:53:40.045331+00	462	Xiaoyu's focus in 2020 on Eloira project is to support the test on both AFR & SFO samples and provide data to sales team to win the NRE business.	861437177
28	2020-12-02 06:57:19.304106+00	463	Get the quantity details from QA (SLED: # of RMAs, % RMA reduction compared to last year and cycle time on closure).	861437177
29	2020-12-02 07:01:33.159445+00	465	Xiaoyu did one round of good assessment on SLED opportunity in OCT market, and the joint effort with sales team has triggerd a product council review on the OCT opportunity and management team decision to develop super broadband SLED in the 1310nm wavelength range application	861437177
30	2020-12-02 07:16:40.627025+00	460	Agree with the goals that Ronaldo input. His contribution on cost reduction is mainly on team efficiency improvement by creating script to speed up the data pulling & compilation, test setup & test time reduction (UPH improvement) as well as enable CM to do test for us by establishing inhouse to CM test data correlation.	861437177
31	2020-12-02 07:32:02.909954+00	456	Ronaldo took over the DFB yield scope from Chai Hong since Mar'2020, and hand over to Zuhdi in Aug'20.	861437177
32	2020-12-02 07:54:04.620198+00	458	The goal on 25G DML is to ensure seamless transfer from NPD to PE by strictly following the PDM process established. This is also the first program in transferring mode that follow the new PDM flow, so need to follow the checklist to establish a a good example.	861437177
33	2020-12-02 08:15:24.363869+00	459	Agree with the KPI. One of Ronaldo's expertise and core strength is test setup and automation, therefore, he was assigned to support test setup & automation work on other project works.	861437177
34	2020-12-03 02:17:32.821098+00	229	hello	2076006951
35	2020-12-03 02:46:58.178469+00	230	This goal has been transferred to another colleague.	2076006951
36	2020-12-07 07:10:00.167246+00	344	All three projects were half-way taken over from Hafiz in May'20. For Eloira, project ownership was later transferred to Xiaoyu after he joined DSL.	861437177
37	2020-12-09 02:45:05.084911+00	471	Please get the detail RMA case closed/open cases for 2020, % increase or decrease compared to 2019, and cycle time for closure for ELED	861437177
38	2020-12-09 02:51:13.23854+00	472	Put down the number of sales engagement cases & revenue support cases for 2020 on ELED and SLED (first half of 2020)	861437177
39	2020-12-09 02:53:37.836373+00	473	Please also add in the ELED & SLED training to sales team as one of the KPI	861437177
40	2020-12-09 07:51:09.999741+00	351	The 75% Almae and 60% Eulitha yield goal is set by bench marking mature products ELED/SLED and the gap between Almae and Eulitha based on existing data at the time.	861437177
42	2020-12-10 03:50:07.319797+00	172	Businesses all around the world has been impacted with the pandemic. \r\nHence operations as well as sales are significantly affected. \r\nSo with Denselight, that the revenue is slightly off the target.	1014312820
46	2020-12-10 05:09:48.103363+00	168	Been actively involved in building up the structure. As a result, the PE team are continuously migrating the data and benefiting the availability of data using the platform.	1014312820
43	2020-12-10 04:52:54.265858+00	355	1. This is a new ownership that NPD transferred to PE, including both NLW and ASE box.\r\n2. Please put down clearly on the number of ILM products (including NPD products & production revenue support) you supported successfully from the Oct'20 till year end.	861437177
44	2020-12-10 04:56:09.164953+00	167	Have actively participated in the capacity computation in terms the number of tools required for the future expansion in China plant.	1014312820
45	2020-12-10 05:06:18.990762+00	165	KFA 1.3\r\nHave been successfully participated in the planning phase with regards to planning the company activities for the year 2020.\r\n\r\nKFA 4.3. \r\nHave participated in the planning phase and giving inputs to the team for the different avenues to get the project launched successfully.	1014312820
48	2020-12-10 05:20:52.667967+00	369	Please list down the KPI (sub-deliverables on projects, technical issues etc) with clear timeline/scope.	861437177
41	2020-12-10 02:21:23.587496+00	164	This has been established and monitored thru excel tracking in the 1H of the year and presented during the operations review. \r\nFurther steps to automate is underway and the new supervisor can use the data to measure the tool performance in the 2H of the year.	1014312820
49	2020-12-10 05:54:41.204218+00	354	This KFA kicked off early this year, and driver ownership handed over to Zuhdi since Sep'20 to match his expertise and interest in data management system.	861437177
50	2020-12-10 06:24:02.302188+00	357	Please list down the KPIs (sub-deliverables) in measureable way (timeline/scope).	861437177
51	2020-12-10 06:28:04.439694+00	353	This is a Product management system that kick off more than one year, and previously handled by Hafiz, and handed over to Zuhdi after he joined back DSL.\r\n\r\nPlease put down the details in KPI: UAT, safe launch etc.	861437177
20	2020-12-01 03:05:02.982961+00	464	List down the detail deliverables in KPI.	861437177
23	2020-12-02 02:32:59.330045+00	28	For SLED (CBT*COS) and ELED (CBT only) test yield goal, both were derived from 75% cum yield goal set since Q4 2019 by previous PE management. The difference on the yield target is due to different APT flow (SLED has more steps and two test steps, while ELED has much shorter APT flow with only CBT test).	861437177
21	2020-12-02 01:49:46.54445+00	92	NIL	1710250857
26	2020-12-02 02:56:57.052383+00	54	NIL	1710250857
53	2020-12-10 07:30:48.237102+00	82	On track	6
54	2020-12-10 08:17:45.286304+00	297	Several charts has been created using limited data we had initially to build an APT WIP profile thru Odoo automation as a mini ERP system. This is not only limited to WIP profile, but also as aging WIP, Queue time pareto by tool type, and many other customizable charts and trends for analysis.	1982477965
52	2020-12-10 06:47:50.992872+00	298	Done research and benchmarking on other renowned semiconductor companies around the globe to understand and more importantly, execute the Kaizen projects with results. \r\nThe mainframe has been created and presented to management during the Operational Excellence reviews. However, due to lack of intern or a 3rd headcount to establish and ensure continuity of this system, the project was placed on hold. There was no or very low application for an IE internship when it was posted. Next steps was to build a Job Description for a full time junior IE/IT role. The justification for this needs more thoughts to fill up the executive time fruitfully for 40-45 hrs a work week, and building more projects to accommodate this will be the key next step.	1982477965
47	2020-12-10 05:12:33.992492+00	177	Had been identified and filled all the budgeted positions in APT with a total 11 out 13 identified HC comprising of technician and operator. \r\nDue to pandemic, the remaining 2 HC shortlisted and offered a job didn't manage to get into Singapore due to the lockdown or boarder restriction way back then.	1014312820
55	2020-12-11 15:29:08.122262+00	317	1	1536568573
72	2020-12-14 08:11:20.120024+00	38	able to pay vendor within the constraint of cashflow and notify vendor when payment is made	104959828
56	2020-12-12 02:35:36.646333+00	128	NA	206959734
57	2020-12-12 06:57:14.23035+00	258	Denton I29 jig status:\r\n\r\nJig 1(modified): Now capable of loading 10 bars with overcoat within 10 nm. Significant improvement from original jig. \r\n\r\nJig 2: Jig currently with Matthew, pending 3 visual inspection before proceeding with modification	2125149271
58	2020-12-12 07:40:05.681571+00	486	All goals to be achieved, by first quarter of 2021.	2125149271
59	2020-12-14 02:14:32.209548+00	37	able to assist to close account within 4 days	104959828
60	2020-12-14 04:45:49.906231+00	136	This is part of KFA4.2 that Carlan is driving, and Jaslyn is working on the Autobar station database portion.	861437177
61	2020-12-14 04:57:31.569368+00	137	Jaslyn took over the weekly yield reporting from Chai Hong since Mar'2020.	861437177
62	2020-12-14 05:54:59.452099+00	482	Chai Hong/Jacquelyn came out the first version of yield dashboard template in Q1'20, this was later discussed in Q3'20 with the rest of PE and Subbu to tie down the final template for ELED, SLED and DFB.	861437177
63	2020-12-14 06:08:40.925533+00	483	PE Database needs to be real time and error free, the manpower saving is on the engineering resource savings related to the prevention of manual data pulling, data filtering, data integrity check etc.	861437177
64	2020-12-14 06:32:27.976139+00	141	Need to solve the frequent happen issues for different product development and improve the process margin to make customer satisfy with the new development/product quality and cycle time/delivery on time.	1776097184
65	2020-12-14 06:36:47.807377+00	144	To standardize the procedure/SOP is important to make sure the smooth operation/reduce human error. To evaluate the new bonding method can help to reduce the 80% of the job loading in lapping area.	1776097184
66	2020-12-14 06:45:03.964543+00	142	Multiple projects have been defined for Litho/Lap improvement. Some of them are the top issues the area is facing.	1776097184
67	2020-12-14 06:48:11.062233+00	146	Personal improvement is important to contribute more to the team.	1776097184
68	2020-12-14 06:51:34.643146+00	198	For company expansion and revenue increase target, to identify and purchase new high quality and throughput production tool is very important.	1776097184
69	2020-12-14 06:55:19.692189+00	145	To move from 2" to 3" process can help to save wafer cost by 1x directly. Also Litho rework rate reduction is important to save operator manpower and material waste.	1776097184
73	2020-12-14 08:16:05.528808+00	39	DSO less than 45days	104959828
71	2020-12-14 08:06:10.771878+00	179	NA	1723530200
74	2020-12-14 08:20:18.202441+00	40	not done, as circuit beaker, mostly work from home.	104959828
76	2020-12-14 14:31:50.087847+00	56	1. Target TAT for internal is not met.\r\n2. Target TAT for External is met\r\n3. Target wafer disposition is met.\r\n4. Created FA library for Internal and External FA data.	249343659
77	2020-12-14 14:32:43.356276+00	57	1. Housekeeping/5S are ensure are maintain and performed at all times.\r\n2. Machine is well maintain.\r\n3. FA consumables are monitored and used correctly.	249343659
78	2020-12-14 14:33:22.871864+00	58	1. Support for Internal and External FA are well ensured.\r\n2. Support from wafer Fab are ensured well executed.	249343659
79	2020-12-14 14:33:55.890423+00	59	1. Basic laser process in the Fab are able to understand and learned.\r\n2. Basic process related are able to give disposition.	249343659
81	2020-12-15 02:08:06.161257+00	82	Agreed	988735390
82	2020-12-15 02:16:29.149161+00	262	Percentage of equipment downtimes that meets our goal of within 4% (2020)	5
85	2020-12-15 02:38:00.495636+00	265	Setting up -Certain Equipment continuing Training Plan	5
70	2020-12-14 07:52:54.845782+00	163	NA	1723530200
83	2020-12-15 02:23:52.181754+00	119	-	673813648
80	2020-12-15 02:03:32.741661+00	122	-	673813648
75	2020-12-14 14:29:40.045524+00	55	1. Learned the basic process step for SLED/ELED.\r\n2. Actively involving process disposition.\r\n3. Report and highlight the abnormalities found on the wafer.	249343659
88	2020-12-15 02:48:57.940122+00	123	-	673813648
84	2020-12-15 02:35:09.01576+00	264	Safety Compliance to extend the Equipment???s life time\r\nTo understand and setup all equipment???s safety procedure to ensure we complied with all the up to date critical safety procedures.\r\n6S and House keeping	5
87	2020-12-15 02:46:42.880897+00	268	Manage Cost effective minimum stock up of spare part ( eg MFCs) -Fab B have 32 pcs of Different type of MFC. After some discussion with Vendors, We have cut down to 16 pcs. Presently we managed to reduce it further to 5 pcs with a simple modification fittings.\r\nCreate Weekly Cost Saving Table to control.	5
90	2020-12-15 03:28:37.473569+00	126	Still pending the full size wafer test result	206959734
91	2020-12-15 03:52:04.549668+00	266	1)Apply a long -term philosophy instead short-term. \r\n2) create continuous flow with little and no delay on work\r\n3) Heijunka ( equipments and my guys) - consistency is much essential the meeting demands\r\n4) Build the right culture in the company\r\n5) Standardize tasks with proper( updated) PM procedure and tested technology..\r\n6) Create visual control for different level ( easily understand by Operators)\r\n7) Accept feedback and comment from all level.\r\n8) Develop people and teams\r\n9) Decide slowly, implement fast	5
92	2020-12-15 04:02:59.336015+00	267	Lean Manufacturing - Quality, Cost, Lead times, Safety\r\nManage Right employee with the right work.\r\nIf possible upgrade my guys skills.	5
93	2020-12-15 04:06:55.235925+00	263	Clear, Effective Communication.\r\nEmotional Intelligence.\r\nOrganization. \r\nAbility to Delegate.\r\nOpenness. \r\nProblem-Solving. \r\nDecision-Making.	5
95	2020-12-15 08:53:15.214064+00	187	-	290990818
96	2020-12-15 08:56:42.571309+00	275	Percentage of equipment downtimes that meets our goal of within 4% (2020).	22592094
97	2020-12-15 09:01:35.896679+00	276	Safety Compliance to extend the Equipment???s life time.\r\nTo understand and setup all equipment???s safety procedure to ensure we complied with all the up to date critical safety procedures.\r\n6S and House keeping.	22592094
98	2020-12-15 09:07:47.433485+00	279	??? PECVD-02 powder flakes issue while run SiON recipe- clean shower head with below 10 Degree Celsius of H2O of soaking process. It can remove over 90% of debris faster than IPA and Acetone method. Under observation..,, ??? PLAT-01 convert to 3inch wafer test in progress..,, ??? RTP-02 convert to 3inch wafer test in progress.., ??? TRACK-01 machine back up for standalone DEVE-01 and DEVE-02- modification in progress..,, ??? RTP-02 3inch wafer test in progress..,, ??? PDS-01 machine to fix external ATM switch in progress..,, ??? MAL-03 Halogen lamp power OEM spec power extend to 750W, cost saving under observation..,, ??? Fab-B machines that using MFC, to reduce cost all machine MFC consolidated into 5 spare MFC.	22592094
99	2020-12-15 09:14:10.740057+00	278	Create continuous flow with little and no delay on work. Standardize tasks with proper( updated) PM procedure and tested technology. Build the right culture in the company.	22592094
94	2020-12-15 08:49:53.597382+00	277	Update the Equipment status properly into the daily equipment status tracking file using the Odoo system. To be able make logical and decisive decision to safe guard the company need. Good to raise concern, but always come up the work around solutions to get things moving.	22592094
100	2020-12-15 09:36:11.878237+00	272	Percentage of equipment downtimes that meets our goal of within 4% (2020)	1087181548
105	2020-12-15 09:56:15.40552+00	436	Cost saving and improvement plan.	850138976
102	2020-12-15 09:40:48.032715+00	269	Create continuous flow with little and no delay on work. Decide slowly, implement fast. Standardize tasks with proper( updated) PM procedure and tested technology.	1087181548
103	2020-12-15 09:42:39.206216+00	270	Safety Compliance to extend the Equipment???s life time.6S and House keeping. To understand and setup all equipment???s safety procedure to ensure we complied with all the up to date critical safety procedures.	1087181548
101	2020-12-15 09:38:31.627013+00	271	EBEV-02 3inch wafer conversion in progress..,\r\nSPUT-02 3inch wafer conversion in progress..,\r\nPLAT-01 3inch wafer conversion in progress..,\r\nGood to raise concern, but always come up the work around solutions to get things moving and update the Equipment status properly into the daily equipment status tracking file using Odoo software.	1087181548
106	2020-12-15 09:57:06.370466+00	437	Safety Compliance to extend the Equipment???s life time.6S and House keeping. To understand and setup all equipment???s safety procedure to ensure we complied with all the up to date critical safety procedures.	850138976
107	2020-12-15 09:59:03.444305+00	438	To be able make logical and decisive decision to safe guard the company need. Update the Equipment status properly into the daily equipment status tracking file. Good to raise concern, but always come up the work around solutions to get things moving.	850138976
108	2020-12-15 10:01:32.510367+00	439	Apply a long -term philosophy instead short-term. Accept feedback and comment from all level. Standardize tasks with proper( updated) PM procedure and tested technology.	850138976
109	2020-12-15 10:03:23.343538+00	440	Created weekly In-house repair cost saving table to encourage our guy to do improvement and awareness on cost saving.\r\n if possible inhouse repair like Plating motor repair. ongoing.	850138976
104	2020-12-15 09:53:38.25333+00	485	1) PP One bar stacker JFP Microtechnic - quotation given, next step is to evaluate loading capability by sending dummy and bars\r\n\r\n2) Process improvement & readiness for high volume production	2125149271
110	2020-12-15 11:09:01.496664+00	493	1) Operating procedure for Daitron on-going (by 31-12-20)   \r\n\r\n2) Technician & operators trained, certification required (by 31-12-20)\r\n\r\n3) Over-coating improvement by reducing shim/side plate thickness, helps to avoid any bar movement	2125149271
112	2020-12-15 11:30:45.160141+00	492	1) Acceptance report\r\n\r\n2) Evaluation of plated wafers	2125149271
111	2020-12-15 11:25:33.1517+00	489	1) Compilation of data and generate qualification report\r\n\r\n2) Raise ECN & gain approval from PE	2125149271
114	2020-12-15 11:39:10.46835+00	491	1) Conversion of TLM monitoring to sheet resistivity monitoring with Ossila 4 point probe\r\n\r\n2) To qualify RTP tool in NTU using Ossila 4 point probe comparing the sheet resistivity to RTP in DLS	2125149271
115	2020-12-15 11:45:24.646465+00	488	1) Fingerprint of SiO2 film (dep rate, stress, uniformity, range, etch rate)\r\n2) Delamination check with short loop wafer (RTP at 400 degC)	2125149271
116	2020-12-15 11:47:25.745172+00	490	1) SiN HM Oxford & Trion\r\n2) SiON PCO spacer Oxford & Trion\r\n3) SiO2 spacer Oxford & Trion	2125149271
113	2020-12-15 11:33:20.302192+00	494	1) Google sheets conversion for real time monitoring of process parameters\r\n2) SPC dashboard monitoring	2125149271
86	2020-12-15 02:40:15.862323+00	121	-	673813648
89	2020-12-15 02:58:15.732431+00	120	-	673813648
117	2020-12-16 01:34:31.366046+00	264	As a whole the 6S and safety awareness has been improved. \r\nBut I cant see any strong ownership on 6S and Safety practices, there is no clear system which I think we need one to be setup  ASAP.	135493917
118	2020-12-16 02:09:17.763304+00	392	This goal is completed by 1st May 2020. There are some modification included and those new requirements moved to new phase.	1608216415
119	2020-12-16 02:10:19.54884+00	452	This goal is completed by 30th Sep. 1st Oct onwards there had been more than 100 wafers have been released in to Fab using DMES.	1608216415
120	2020-12-16 02:11:22.47418+00	453	Phase 4 consist of 5 modules. 2 of the modules have been completed successfully. 3rd module is 60% in progress. This goal is expected to be completed by Jan 2021.	1608216415
121	2020-12-16 02:11:42.558107+00	454	This goal is completed by 31st August 2020.	1608216415
122	2020-12-16 02:13:39.464014+00	455	This goal is cancelled because third party is hired to develop this tool.	1608216415
136	2020-12-16 09:22:51.215828+00	429	Percentage of equipment downtimes that meets our goal of within 4% is 4.3 %, while 4.3 % that did not meets goals are mainly due to\r\nSystems/Parts obsolete issue(like Deve-01  parts ,Plating part).\r\nThe Unscheduled broke down for some major equipment .(like Sput tools, Deve tools, RTP and etchers.)\r\nDuring Oxford system upgrade, unforeseen Part broke down causing delay and huge downtime while waiting for obsoleted rf gens and Parts.\r\nDenton i29 system ???unstable??? condition causing downtime\r\nIn process in Some Tools upgrade to 3???\r\nOur guys (rated avg 50-66%) not well trained on all equipment.	1941685512
125	2020-12-16 03:08:10.997867+00	334	- Continuous improvement to attend technical, teamwork and leadership training.  \r\n- Support management goals and objectives , like to reduce costs and resources savings \r\n- Knowledge sharing	2047523461
123	2020-12-16 03:06:54.31232+00	335	- Respect to my co-workers and superior \r\n- Take responsibility in my work assignment\r\n- Commitment of work - such as punctuality, complete the task, submit reports\r\n- Focus in my job responsibility\r\n- Impartiality to all vendors and contractors. \r\n- Teamwork	2047523461
127	2020-12-16 05:23:00.754806+00	428	Clear, Effective Communication.\r\nEmotional Intelligence.\r\nOrganization. \r\nAbility to Delegate.\r\nOpenness. \r\nProblem-Solving. \r\nDecision-Making.	1941685512
128	2020-12-16 05:25:21.087965+00	431	1)Apply a long -term philosophy instead short-term. \r\n2) create continuous flow with little and no delay on work\r\n3) Heijunka ( equipments and my guys) - consistency is much essential the meeting demands\r\n4) Build the right culture in the company\r\n5) Standardize tasks with proper( updated) PM procedure and tested technology..\r\n6) Create visual control for different level ( easily understand by Operators)\r\n7) Accept feedback and comment from all level.\r\n8) Develop people and teams\r\n9) Decide slowly, implement fast	1941685512
129	2020-12-16 05:26:41.530587+00	430	Safety Compliance to extend the Equipment???s life time\r\nTo understand and setup all equipment???s safety procedure to ensure we complied with all the up to date critical safety procedures.\r\n6S and House keeping	1941685512
130	2020-12-16 05:27:44.680579+00	427	Percentage of equipment downtimes that meets our goal of within 4% is 4.3 %, while 4.3 % that did not meets goals are mainly due to\r\nSystems/Parts obsolete issue(like Deve-01  parts ,Plating part).\r\nThe Unscheduled broke down for some major equipment .(like Sput tools, Deve tools, RTP and etchers.)\r\nDuring Oxford system upgrade, unforeseen Part broke down causing delay and huge downtime while waiting for obsoleted rf gens and Parts.\r\nDenton i29 system ???unstable??? condition causing downtime\r\nIn process in Some Tools upgrade to 3???\r\nOur guys (rated avg 50-66%) not well trained on all equipment.	1941685512
131	2020-12-16 05:40:15.44921+00	349	This SPC chart setting was done. However, data in Woodstock was lost. We need to re-set and continue updating the charts for AIX200, XRD and PL. Work on G4 is in progress.	1373136557
132	2020-12-16 05:42:55.428337+00	350	Understand the blue shifting run to run with coating thickness. Applying this knowledge to control the output wafer quality	1373136557
133	2020-12-16 05:43:51.738848+00	358	Working is in progress. First DOE was grown and under testing.	1373136557
134	2020-12-16 05:45:58.158168+00	359	Some progress on this but the training is not successfully done. This task was failed.	1373136557
135	2020-12-16 05:46:58.8605+00	356	Provide the wafers PE team requested	1373136557
141	2020-12-17 04:01:22.583463+00	465	KFA2.3 market share evaluation\r\nNew business opportunity explore	610693885
126	2020-12-16 03:09:17.520704+00	333	- Daily inspection of facility equipment, such as Chiller, MAU, RCU, SEX, GEX, Scrubber, WWT, DIW / RO, CDA compressor, Vacuum compressor, PCW and others. \r\n- To ensure preventive maintenance of facility equipment and instrument are perform on time.\r\n- Maintain good housekeeping	2047523461
124	2020-12-16 03:07:43.662528+00	336	- Conduct safety awareness and internal training to improve safety culture in the organization.\r\n- Implement safe work procedures and risk assessment in all dept. to control hazards for a safer workplace\r\n- Regular inspection to identify and prevent unsafe act, unsafe condition and unsafe practices.\r\n- Monitor licenses and permits of HS and toxic gases and others to achieve safety and compliance requirement.  \r\n- Regular inspection of Fire safety equipment to ensure functionality, safety and to achieve compliance requirement.  \r\n- Waste management (Chem waste, toxic waste, E-waste, waste water) and control to ensure to dispose it in according to environmental regulation.	2047523461
137	2020-12-17 03:57:05.135914+00	466	Submit paper in major stream optical  journal to increase the exposure of DSL products and engage business  opportunity	610693885
138	2020-12-17 03:57:50.575633+00	461	Major yield KPI for SLED product:\r\n1. CS5169A yield improvement\r\n2. CS5153A yield improvement\r\n3. old product restoration and optimization\r\n4. new product  pilot run and hit rate	610693885
139	2020-12-17 03:59:09.285211+00	462	KPI: Test plan and evaluation report on Eloira product\r\nHelp sales engage Eloira from technology point of view	610693885
140	2020-12-17 03:59:44.744275+00	463	RMA case decrease 20%\r\ncycle time < 2weeks ((2019 average >1month)	610693885
142	2020-12-17 11:15:24.381526+00	260	a	52374544
143	2020-12-17 11:39:27.241109+00	261	Cost Saving Project - to reduce the operation cost by 5%\r\n - As at mid year , average CPM is reduced due to more Fab out wafers and more batching wafers at Ebeam, fully utilizing the Au consumption. \r\nTo source for 2nd source material supplier and certify by process engineer \r\n- Manage to source cheaper PM material and successfully qualified a cheaper supplier for the polishing cloth, almost 20% reduction\r\nCollaborate with supplier for bulk purchase to avoid high freight / delivery charge - Blanket order  purchase for cleanroom material and chemical to reduce freight charge and Reduce wastage by proper planning and batching wafers processing	52374544
144	2020-12-18 01:46:50.636342+00	314	GOOD WORK ON TRACKING OF WIP IN ILM BOXES	973701598
145	2020-12-18 03:58:06.346473+00	303	n/a	1904933651
146	2020-12-19 08:07:54.522836+00	181	Significant work has been done on both POC1 and 2 upon signing of MOU between Denselight and AMF.\r\n\r\nPOC1:\r\n- Has received edge coupler waveguide samples from AMF and developed test methodologies for optical coupling loss measurements.\r\n- Has made upgrades on the sigmakoki 6-axis alignment tool for characterization of fiber to SOI waveguide edge coupler to fiber coupling loss and finally between the laser diode and edge coupler in both air and index-matching gel medium.\r\n- The optical loss measurements were also supported with optical coupling simulations justified by near and far-field measurements of each optical interface.\r\n- Established estimated coupling loss between AMF FEC(fiber edge coupler) and Denselight standard ridge (with Q-layer) FP laser. Preliminary report shared with Denselight team internally.\r\n- Provided prompt support to help accelerate AMF coupling test with Denselight laser. Construct a COS laser test kit wirebonded to PCB for wired current drive (without probes)\r\n\r\nPOC2:\r\n- Provided flip-chip design inputs to the laser diode design (Canopus)\r\n- Understand and synchronized AMF platform requirement and translated the stack height interference issues with the laser device design team.\r\n- Provided 2D and 3D drawings for illustration and definition of the final die outline to AMF. This is effectively communicated to help AMF design the platform interface to Denselight die.\r\n- Provided layout designs of the platform test vehicles required for the completion of POC2.	1777433913
\.


--
-- Data for Name: GnC_competency_category; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."GnC_competency_category" (id, name, description) FROM stdin;
6	Customer First Mindset	Our customers, come first. We will strive to provide them with superior innovative products and will continuously improve their quality that will in turn see us win in our end markets.
7	Commitment to You	We are accountable in our commitment to achieve excellence.  We do what we say and behave with integrity at all time. We will uphold the ethical standards of the company always.  We respect each other and value every employee???s contribution.  Collaboration as a team is our motto and we celebrate small and big wins with appreciation.
8	Integrity with Passion & Tenacity	At DenseLight, we take pride in every job that we do by having the highest level of honesty and openness. We cultivate our entrepreneurial drive as a means to remain flexible, agile and willingness to change. We are passionate about DenseLight and have a never-say-die attitude!
9	People Development	Ability to transfer expertise and build the long-term leadership capability of others by teaching, coaching and/or mentoring
10	Demonstrate Leadership	Ensures that the team is focused, motivated and inspired to achieve organizational objectives
\.


--
-- Data for Name: GnC_competencies; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."GnC_competencies" (id, summary, description, weightage, user_rating, manager_rating, board_rating, user_comments, manager_comments, board_comments, appraisal_id, competency_category_id, employee_id) FROM stdin;
43	Reduce Turnover	Provide regular feedback to HODs on their 'People Issues'.	40	1	1	1	NIL	NIL	NIL	154	6	534558467
44	Improve Company's Branding	Develop a new HR team to excel in business partnering.	30	1	1	1	NIL	NIL	NIL	154	7	534558467
45	Improve COmpnay's Branding	Upload Denselight core values with fairness to all employees (regardless of rank) by giving feedback to anyone if seen to waiver from the values	30	1	1	1	NIL	NIL	NIL	154	8	534558467
46	People issues	Provide regular feedback to HODs on their ???people issues???	1	1	1	1	NIL	NIL	NIL	201	6	163946503
47	Business partnering	Business partnering with the HODs and managers of the assigned departments to provide advice pertaining to HR issues	1	1	1	1	NIL	NIL	NIL	201	7	163946503
48	Uphold Denselight core values with fairness	Uphold Denselight core values with fairness to all employees (regardless of rank) by giving feedback to anyone if seen to waiver from the values	1	1	1	1	NIL	NIL	NIL	201	8	163946503
52	Work closely with sales team, CTO and market reports	1. Getting involve with revenue meetings to understanding existing and new sales opportunities\r\n2. Regular meetings with sales team and CTO to determine current product performance and health.\r\n3. Being involve with KFA 2.4 to understand and provide inputs to company's product marketing strategy\r\n4. Engaging customers with Sales team both technically and commercially.	20	1	1	1	NIL	NIL	NIL	144	6	430837474
53	Communications and Engagement with external and internal parties	1. Communicate effectively and diplomatically\r\n2. Provide response to parties within 24hrs (if urgent) and within a week of deadlines\r\n3. Transparency of execution. Communication on common platform with entire NPD team.\r\n4. Do as i say and say as i do whilst engaging with my team and peers.	20	1	1	1	NIL	NIL	NIL	144	7	430837474
54	Efficiency and Urgency	1. Continual encouragement of urgency in getting revenue with existing and innovative technology.\r\n2. If possible, offer innovative and creative ideas to both customer for continual interest and opportunities. Not to give up unless customer gives up.\r\n3. Encourage team to take ownership daily and think creatively to resolve issues if required.	20	1	1	1	NIL	NIL	NIL	144	8	430837474
55	Small wins lead to big gains	1. Daily 930 pow wow with entire NPD team to motivate and keep track of achievements for weekly targets\r\n2. Send weekly targets to entire NPD team to help them focus\r\n3. Lead by example to show them that everyone matters and that everyone has a role to play and contribute. Provide daily examples and suggestions to improve and at meetings	20	1	1	1	NIL	NIL	NIL	144	10	430837474
56	Customer Mindset	???\tTo ensure all actions, improvement projects and plans are to ensure MFG and equipment are able to perform to its best capability to support the customer???s need.\r\n???\tEnsure proper communication and understanding from customer???s need, ensure 100% follow up for any committed actions. \r\n???\tEnsure all identified CA and PA are implemented and closed. Ensure implementation actions are feasible and effective.	10	1	1	1	NIL	NIL	NIL	148	6	135493917
57	Commitment to You	- Broaden collaborative partnership within team through open communication channel.\r\n- Intensify efforts to create greater ownership of tasks and responsibilities.	10	1	1	1	NIL	NIL	NIL	148	7	135493917
58	Integrity with Passion & Tenacity	???\tFeedback timely if goal are not able to achieve so that appropriate action can be taken. \r\n???\tPatiently listen to other problem; show more tolerance to accept reasonable explanation. \r\n???\tBe patient to listen to others suggestions and give yourself time before giving answer that you might not be sure. \r\n???\tSpeak up you views, allow debate and ultimate buy off by everybody and move as a team.	5	1	1	1	NIL	NIL	NIL	148	8	135493917
59	Zero complaint on account receivable from customer	Ensure there is no complaint on account receivable from customer by providing timely and accurate account receivable.	30	1	1	1	NIL	NIL	NIL	151	6	988735390
60	Sharing of PNL with analysis and cost review in staff meeting	Sharing of PNL with analysis with staff and to the Fab A, B and APT owner on the regular basis.	30	1	1	1	NIL	NIL	NIL	151	7	988735390
61	Ensure no finance violations	Monitor and ensure there is no finance violations within the company	30	1	1	1	NIL	NIL	NIL	151	8	988735390
50	We are accountable in our commitment to achieve excellence.  We do what we say and behave with integrity at all time. We will uphold the ethical standards of the company always.  We respect each other and value every employee???s contribution.  Collaboration as a team is our motto and we celebrate small and big wins with appreciation.	???\tBe punctual and adhere to company and fab rules. To inform by phone when needs to go for MC. Do not leave company early and do not have extended break time.\r\n???\tDon't do anything which is unrelated to work during your working hour.\r\n???\tWhen activated during times of need at work place, must be able to respond and come back if required.\r\n???\tAlways stay contactable\r\n???\tMotivate and be motivated by a passion to compete and win. Drive initiatives and take smart risks to achieve our goals.\r\n???\tSet parameters so actions and decisions can be taken by employees.Take initiative to decide, act and be accountable within the parameters given.	20	1	1	1	NIL	NIL	NIL	249	7	5
51	At DenseLight, we take pride in every job that we do by having the highest level of honesty and openness. We cultivate our entrepreneurial drive as a means to remain flexible, agile and willingness to change. We are passionate about DenseLight and have a never-say-die attitude!	???\tFeedback timely if goals are not able to achieve so that appropriate action can be taken. \r\n???\tPatiently listen to other problem; show more tolerance to accept reasonable explanation. \r\n???\tBe patient to listen to others suggestions and give yourself time before giving answer that you might not be sure. \r\n???\tSpeak up you views, allow debate and ultimate buy off by everybody and move as a team. \r\n???\tMaintain the highest standards of fairness, honesty, and transparency in everything we do, be it Technologically, Socially, Environmentally, As an Employer, As a Supplier, As a Partner.	20	1	1	1	NIL	NIL	NIL	249	8	5
278	Hunet Test	HunetTest	100	1	1	1	NIL	NIL	NIL	\N	6	17
62	Customer first mindset	Customer projects for POET, 25G DLS programs, high power DFB, production DFB, SSC laser processes are being executed with utmost priority. Existing processes are being optimized to meet the customer requirements and demands.	90	1	1	1	NIL	NIL	NIL	218	6	673813648
63	Commitment to excel	My personal commitment to achieve excellence is to maintain highest level of work ethics with passion and integrity and respect individuals with dignity irrespective of job level.	90	1	1	1	NIL	NIL	NIL	218	7	673813648
64	Passionate about work with strong work ethics	I always display willingness to learn and change and show passion in the jobs and proactively work and maintain the flexible and agile attitudes.	90	1	1	1	NIL	NIL	NIL	218	8	673813648
65	People skills	I posses people skill to work with people irrespective of the job level and get the job done. \r\nTransfer the processes to colleagues and operators without any process issues.	80	1	1	1	NIL	NIL	NIL	218	9	673813648
66	Leadership	Make sure the team is united and every individual in the team understands the organisation priorities to achieve revenue, NRE targets and meet the deadlines without dropping the balls. Laser focus is the key to the success.	80	1	1	1	NIL	NIL	NIL	218	10	673813648
67	Zero complain on account receivables from customer	Zero complain on account receivables from customer	33	1	1	1	NIL	NIL	NIL	250	6	6
68	Supporting with analysis/highlight on periodical expenses (actual vs budget/forecast)	Supporting with analysis/highlight on periodical expenses (actual vs budget/forecast)	33	1	1	1	NIL	NIL	NIL	250	7	6
69	Ensure no finance violations	Ensure no finance violations	34	1	1	1	NIL	NIL	NIL	250	8	6
70	zero complaint on accounts receivable from customer	zero complaint on accounts receivable from customer	33	1	1	1	NIL	NIL	NIL	227	6	104959828
71	Assist to monitor periodic expenses	Assist to monitor periodic expenses	33	1	1	1	NIL	NIL	NIL	227	7	104959828
72	Ensure no financial violations	Ensure no financial violations	34	1	1	1	NIL	NIL	NIL	227	8	104959828
73	Working with internal teams to win new designs at customer	Work with the engineering & production teams to deliver NPI to key customers, and work with ROW sales teams to win new designs. Ensure that what we commit to deliver is within our capability, and work to set customer expectations early in these deals	40	1	1	1	NIL	NIL	NIL	165	6	985791817
74	Active participation in Product Council	Be an active part of the product council. Ensure the council has all the relevant market information to make an investment decision. Work with both China & the ROW sales team to deliver these inputs from the field.	30	1	1	1	NIL	NIL	NIL	165	7	985791817
75	Branding & Marketing	Work with all the internal stake holders (PE, NPI, IT) to enhance DenseLight???s online presence, by presenting accurate and up to date information. Drive DenseLight???s branding efforts by showcasing individual???s expertise such that DenseLight is seen as a technology leader.	30	1	1	1	NIL	NIL	NIL	165	8	985791817
76	Cultivate customer first mindset within PE team	1. Cultivate customer first mindset within PE team, and always priotize job to support customer enquires, projects and engineering work;\r\n2. Drive aggressively & continuously on RMA issues for proper closure.\r\n3. For complicated customer related technical issues, form tiger team across functions for effective problem solving through leveraging capabilities & experience within DLS.	35	1	1	1	NIL	NIL	NIL	161	6	861437177
77	Build strong team	1. Cultivate a harmony culture within the team and urge all tem members to help each other with the best thye can;\r\n2. Coach PE engineer on critical communication skills and conflict resolving skills.	30	1	1	1	NIL	NIL	NIL	161	7	861437177
78	Build "CAN DO" mindset in PE team	Build a strong "CAN DO" mindset and culture within PE team: train every PE to think "what needs to get the job done" rather than "explain why job cannot be done" in their daily job.	35	1	1	1	NIL	NIL	NIL	161	8	861437177
79	Provide prompt quality response to both internal and external customers.		25	1	1	1	NIL	NIL	NIL	149	6	759336758
80	Drive team to work together in achieving Denselight???s corporate goals.		25	1	1	1	NIL	NIL	NIL	149	7	759336758
81	Promote a culture of ownership, collaboration and transparency.		25	1	1	1	NIL	NIL	NIL	149	8	759336758
84	Ownership and Teamwork	Collaboratively working with the team especially the NPD team by fulfilling their request and commit date as agreed in the ops meeting, providing inputs to the team to make things more efficient.	100	1	1	1	NIL	NIL	NIL	222	7	1014312820
86	Timeliness and good quality mindset	Actively highlight issues and work closely with engineers for closure in timely manner.	100	1	1	1	NIL	NIL	NIL	222	6	1014312820
85	Passion to others and being a good teamplayer	Supporting PPC by giving feedback regarding effective planning and scheduling work and priority. As well as giving them the capacity constraints. Sharing with them the calculated UPH and capacity model that had been developed to help them improve the planning aspect.	100	1	1	1	NIL	NIL	NIL	222	8	1014312820
83	Systems & design by establishing workflow and procedure	Create a procedure in managing cleanroom uniforms.	100	1	1	1	NIL	NIL	NIL	222	7	1014312820
87	Our customers, comes first. We will strive to provide them with superior innovative products and will continuously improve their quality that will in turn see us win in our end markets	Ensure and consider the quality of work all the time.	10	1	1	1	NIL	NIL	NIL	184	6	249343659
88	We are accountable in our commitment to achieve excellence. We do what we say and behave with integrity at all time. We will uphold the ethical standards of the company always. We respect each other and value every employee's contribution. Collaboration as a team is our motto and we celebrate small and big wins with appreciation.	Be a good team player and demonstrate initiatives in all task that may assign.	10	1	1	1	NIL	NIL	NIL	184	7	249343659
89	At DenseLight, we take pride in every job that we do by having the highest level of honesty and openness. We cultivate our entrepreneurial drive as a means to remain flexible, agile and willingness to change. We are passionate about DenseLight and have a never-say-die attitude!	Execute job responsibilities with strong passion at work.	10	1	1	1	NIL	NIL	NIL	184	8	249343659
90	1st time right, sense of urgency and quality of execution	i) Proper planning and execution of critical customer programs to ensure we deliver as per plan and within the timeline.\r\nii) Appraised team on the need to react fast and show sense of urgency. Proper execution for ???1st time right???	40	1	1	1	NIL	NIL	NIL	152	6	324340084
82	Mentor and coach team leads to take on more leadership role in the organization		25	1	1	1	NIL	NIL	NIL	149	9	759336758
279	testing	testing	100	1	1	1	NIL	NIL	NIL	\N	6	17
91	High level of honesty and openness	i) create an environment to share and solve problems together.\r\n\r\nii) Learnings from one program to be shared across all programs to ensure same issues are not repeated.	30	1	1	1	NIL	NIL	NIL	152	8	324340084
92	accountability to achieve excellence to our customers	Gaps are there in the quality of wafers coming out of Fab B. Set individual tasks to my team to ensure we give consistent quality wafers.	30	1	1	1	NIL	NIL	NIL	152	7	324340084
93	customer first	Our customers, come first. We will strive to provide them with superior innovative products and will continuously improve their quality that will in turn see us win in our end markets.\r\nAction plan???\r\nCycle time: reduce the long hold and rework, strive to deliver the goods on time, weekend coverage \r\nQuality: Focus on details, reduce defect, improve yield	5	1	1	1	NIL	NIL	NIL	178	6	1776097184
94	Commitment	We are accountable in our commitment to achieve excellence. We do what we say and behave with integrity at all time. We will uphold the ethical standards of the company always. We respect each other and value every employee's contribution. Collaboration as a team is our motto and we celebrate small and big wins with appreciation.\r\nAction plan: \r\nBeing accountable, take responsibility\r\nSay what we do and do what we say\r\nWork as a team, help each other	5	1	1	1	NIL	NIL	NIL	178	7	1776097184
95	Integrity	At Denselight, we take pride in every job that we do by having the highest level of honesty and openness. We cultivate our entrepreneurial drive as a means to remain flexible., agile and willingness to change. We are passionate about DenseLight and have a never-say-die attitude!\r\nAction plan:\r\nBeing a team member and contribute to the team with best of knowledge\r\nFollow company policy and rules, and respecting others.\r\nBe patient	5	1	1	1	NIL	NIL	NIL	178	8	1776097184
97	Alu DFB Qual in Denton I29	The development of non hermetic coating solutions will enhance our products into next level	25	1	1	1	NIL	NIL	NIL	209	6	1723530200
100	I support the new joiners to learn processes and involve into work as early as they can	I support new joiners in my team as well as the NPD, PE etc.	10	1	1	1	NIL	NIL	NIL	209	9	1723530200
102	New product development	To support and provide solutions for new product developments ??? 8-pin TO cans, narrow linewidth FBGL lasers, etc.	33	1	1	1	NIL	NIL	NIL	188	6	50985924
103	Team communication	To communicate and to facilitate requirements from engineering teams to the various subcons. To learn technical details on new product requirements to ease communication to subcons and internal team members.	33	1	1	1	NIL	NIL	NIL	188	7	50985924
104	Solutions across platforms	To look for solutions across multiple disciplines (mechanical, electrical, optical) and to remain open to ideas from colleagues	33	1	1	1	NIL	NIL	NIL	188	8	50985924
105	Process Discipline	Ensure discipline in any process flow and module change so as not to affect final product quality and reliability.	20	1	1	1	NIL	NIL	NIL	219	6	439847763
106	Communication	Spend more time discussing and communicating with fellow engineers on process engineering and development.	20	1	1	1	NIL	NIL	NIL	219	7	439847763
107	Tenacity in Process Development	Continue to pursue NPI process integration development regardless of setbacks.	20	1	1	1	NIL	NIL	NIL	219	8	439847763
108	Develop Team Expertise	Guide team to build expertise in process integration development.	20	1	1	1	NIL	NIL	NIL	219	9	439847763
109	Motivate Team to Achieve Development Goals	Motivate team to achieve process development goals and support revenue generation.	20	1	1	1	NIL	NIL	NIL	219	10	439847763
113	Ensure QA involvement in all facet of DLS operations to ensure the best possible quality outcome	Provide information to stakeholders by providing factual data which comes from reliable database/sources	30	1	1	1	NIL	NIL	NIL	156	6	1224448967
114	Ensure that all non-conforming materials are address and given a disposition on time	Ensure the completion of the critical projects that will help the company in the digital transformation	30	1	1	1	NIL	NIL	NIL	156	7	1224448967
115	Ensure that commitment is follow thoroughly to accomplish the desire results	Provide commitment date and give top priority and advise all stakeholder in advance if the commitment cannot meet	40	1	1	1	NIL	NIL	NIL	156	8	1224448967
110	Alignment of DenseLight solutions to Customer???s needs	Work attentively with DLS sales & mkt and NPD colleagues to customer???s inputs to ensure that their specs and application requirements are well understood and properly supported by our proposed solutions	35	1	1	1	NIL	NIL	NIL	158	6	1135328161
111	Technology mentorship to all DenseLight colleagues	Proactive in providing technical guidance to all technology and operation groups and colleagues	35	1	1	1	NIL	NIL	NIL	158	7	1135328161
112	Focus on meeting Stakeholders??? goals	To continue communicate our shared belief and aspiration in shaping DenseLight towards IPO	30	1	1	1	NIL	NIL	NIL	158	8	1135328161
117	Commitment	Be accountable, positive thinking and deliver on time	20	1	1	1	NIL	NIL	NIL	192	7	206959734
116	Customer first and Quality mindset	Always stick to customer first and quality mindset	20	1	1	1	NIL	NIL	NIL	192	6	206959734
119	Integrity	Always be honest, open mind, flexible and willingness to change.	20	1	1	1	NIL	NIL	NIL	192	8	206959734
96	25G coating Qual (Alu DFB) in Denton I29	Inhouse coating development for 25G can make us competitive in market in terms of performance and price	15	1	1	1	NIL	NIL	NIL	209	6	1723530200
98	Containment actions for coating related issues	Immediate containment actions for the all the Thin film deposition/ coating process related issues which helps the operations& manufacturing to ship the products on time.\r\n1. NML peel off issues resolved in a month\r\n2. Found the possible causes and added more checks to the AR coating peel off issues.\r\n3. OSA & LIV failures due to Coating Jig contaminations were rectified\r\n4. Support manufacturing for the RTP issues, Shower head change, E-Beam process optimizations	20	1	1	1	NIL	NIL	NIL	209	7	1723530200
99	Passionate about the work I am doing	I am extremely passionate and truthful to my job. \r\nI like the way things moving & would like to increase the speed in coming years. \r\nThe challenges are the stepping stone for tomorrows success and we will succeed.	10	1	1	1	NIL	NIL	NIL	209	8	1723530200
186	Plan production schedule according to sales forecast. Monitor the execution of production plan and work with team to resolve any potential issue that delays the customer schedule. Escalate road blocks to management.		100	1	1	1	NIL	NIL	NIL	213	7	426739617
121	We are accountable in our commitment to achieve excellence.  We do what we say and behave with integrity at all time. We will uphold the ethical standards of the company always.  We respect each other and value every employee???s contribution.  Collaboration as a team is our motto and we celebrate small and big wins with appreciation.	1.\tAlways be committed to timelines and tasks as communicated with the team.\r\n2.\tAlways report transparently with ethical data \r\n3.\tRepresent Denselight Semiconductors with pride and professionalism	20	1	1	1	NIL	NIL	NIL	200	7	1777433913
122	At DenseLight, we take pride in every job that we do by having the highest level of honesty and openness. We cultivate our entrepreneurial drive as a means to remain flexible, agile and willingness to change. We are passionate about DenseLight and have a never-say-die attitude!	1.\tBe responsible and committed to the task assigned with your team members\r\n2.\tAlways strive to be the subject matter expert in your field of work. \r\n3.\tConstantly innovate and improve	20	1	1	1	NIL	NIL	NIL	200	8	1777433913
123	Ability to transfer expertise and build the long-term leadership capability of others by teaching, coaching and/or mentoring	1. Conduct cross-department sharing sessions\r\n2. Conduct cross-training of simulation and design software for Product Engineers\r\n3. Peer coaching of fellow colleagues.	20	1	1	1	NIL	NIL	NIL	200	9	1777433913
124	Ensure that the team is focused, motivated and inspired to achieve organizational objectives	1. Take the lead and responsibility in completing own action items accountable to the team.\r\n2. Take the lead to organise and coordinate the team for schedule and work plan.\r\n3. Take initiative to motivate and drive the team to focus and achieve success in final objectives.	20	1	1	1	NIL	NIL	NIL	200	10	1777433913
120	Our customers, come first. We will strive to provide them with superior innovative products and will continuously improve their quality that will in turn see us win in our end markets.	1.\tStrive for excellence in quality and functionality in all of our products   \r\n2.\tTimely delivery\r\n3.\tBe effective in customer feedback to product iteration\r\n4.\tProvide relevant and effective technical sales support to our customers	20	1	1	1	NIL	NIL	NIL	200	6	1777433913
125	Customer First Mindset	Our customers, come first. We will strive to provide them with superior innovative products and will continuously improve their quality that will in turn see us win in our end markets.	34	1	1	1	NIL	NIL	NIL	171	6	9327697
127	Integrity with Passion & Tenacity	At DenseLight, we take pride in every job that we do by having the highest level of honesty and openness.\r\nWe cultivate our entrepreneurial drive as a means to remain flexible, agile and willingness to change.\r\nWe are passionate about DenseLight and have a never-say-die attitude!	33	1	1	1	NIL	NIL	NIL	171	8	9327697
126	Commitment to You	We are accountable in our commitment to achieve excellence.\r\nWe do what we say and behave with integrity at all time.\r\nWe will uphold the ethical standards of the company always.\r\nWe respect each other and value every employee???s contribution.\r\nCollaboration as a team is our motto and we celebrate small and big wins with appreciation.	33	1	1	1	NIL	NIL	NIL	171	7	9327697
128	Provide customers' request to internal team on time.	Provide customers' request to internal team on time.	40	1	1	1	NIL	NIL	NIL	195	6	1369735000
129	Work with different departments( NPD, Operation etc) as one team to win business.	Work with different departments( NPD, Operation etc) as one team to win business.	40	1	1	1	NIL	NIL	NIL	195	7	1369735000
130	Do it actively and never give up when facing customers.	Do it actively and never give up when facing customers.	20	1	1	1	NIL	NIL	NIL	195	8	1369735000
101	Motivation support and inspiration via daily Process meetings	I believe, I have personally learned (and learning) the FAB B processes and inter module activities through the Daily process meetings.  \r\nThe platform is to learn, analyze, brainstorm, understand in-depth, different perspective of problems and make discussions for the the problems we face day to day processing runs.	20	1	1	1	NIL	NIL	NIL	209	10	1723530200
131	Ability to meet or exceed customer service needs and expectations and provide excellent service in a direct or indirect manner.	Smooth co-operation with all that need assistance wit epi/wafer related problems	30	1	1	1	NIL	NIL	NIL	211	6	1510925941
132	Take pride in your work and strive to deliver the best possible results.	Take my job duties seriously and continually strive for excellence and maximum productivity. \r\nMaking Fab A, a place where people work with passion and engagement	40	1	1	1	NIL	NIL	NIL	211	7	1510925941
133	Gains the trust of others by taking responsibility for own actions and being honest	Take responsibility of my actions, always be willing to go the extra mile in work	30	1	1	1	NIL	NIL	NIL	211	8	1510925941
134	Improve the communication with Fab B	As a part of Fab A, we are highly interdependent with Fab B on various tasks. I will try to improve the work flow between Fab A and Fab B as smooth as possible	100	1	1	1	NIL	NIL	NIL	179	8	1906914592
135	Internal and External Customer First Mindset	To work well with colleagues and vendors to achieve my/team's/department's objectives by:\r\n1) prioritising to meet the deadlines\r\n2) serving with a good quality	33	1	1	1	NIL	NIL	NIL	234	6	2076006951
136	Quality results	Produce results with integrity, ethical standards, collaboration and dedication.	33	1	1	1	NIL	NIL	NIL	234	7	2076006951
137	Be a team player	Taking initiative in view of risk mitigation.\r\nShowing integrity to the team and coworkers.\r\nRespecting each other.	34	1	1	1	NIL	NIL	NIL	234	8	2076006951
140	Integrity with Passion	- To accept new challenges and work out of my comfort zone to contribute my best in each functional team that I supporting with the aim to increase DenseLight presence in the global marketplace.	30	1	1	1	NIL	NIL	NIL	207	8	1779366736
139	Commitment to You	- To be an effective ambassador for CEO and act as a conduit for managing many competing priorities and find smarter ways of getting things done.	30	1	1	1	NIL	NIL	NIL	207	7	1779366736
138	Customer First Mindset	- Work with the Sales, engineering and production team to win the deals.\r\n- Work with PPC to ensure customer orders are deliver as per our committed ship date.\r\n- Uses social platforms to help DenseLight to connect with the customers	40	1	1	1	NIL	NIL	NIL	207	6	1779366736
141	Provide products and supports above their expectation.	Always try to provide customers best products, and provide supports above their expectation.	40	1	1	1	NIL	NIL	NIL	157	6	25957709
142	Keep my commitment and behave with integrity.	Keep my commitment and behave with integrity.	30	1	1	1	NIL	NIL	NIL	157	7	25957709
143	Motivate people and ensure the team achieve our goal.	Motivate people and ensure the team achieve our goal.	30	1	1	1	NIL	NIL	NIL	157	10	25957709
183	APT Manufacturing	To promote ownership, team collaboration and transparency culture  for operators.	33	1	1	1	NIL	NIL	NIL	159	8	689543953
144	Action plan: Strive to  (a)\tbe open and be willing to listen and flexible to change (b)\tbe entrepreneurial in willingness to take calculated risks to achieve key objectives	Action plan: Strive to \r\n(a)\tbe open and be willing to listen and flexible to change\r\n(b)\tbe entrepreneurial in willingness to take calculated risks to achieve key objectives	30	1	1	1	NIL	NIL	NIL	205	8	1602769597
145	Commitment To You	Action plan: Strive to \r\n(a)\tdo it right the first time\r\n(b)\tachieve excellence the first time we do it\r\n(c)\tdo what we say to uphold integrity\r\n(d)\trespect and value contributions from other team members	30	1	1	1	NIL	NIL	NIL	205	7	1602769597
146	Customer Mindset	Action plan: Strive to \r\n(1) provide customer with products that are superior in performance, matching the requirement in product specification, \r\n(b) communicate to customer with clarity, succinct and focus to the point	30	1	1	1	NIL	NIL	NIL	205	10	1602769597
151	Spirit To Win	???\tDrive initiatives and take smart risks to achieve our goals.\r\n???\tTo believe that excellence is achievable if we put our hearts and minds to achieve it. \r\n???\tTo know that change is needed to improve situations. \r\n???\tTo set out goals and do what it takes to attain them. \r\n???\tTo challenge oneself continuously by setting higher targets after achieving the last set target	20	1	1	1	NIL	NIL	NIL	249	10	5
49	Our customers, come first. We will strive to provide them with superior innovative products and will continuously improve their quality that will in turn see us win in our end markets.	???\tTo ensure all actions, improvement projects and plans are to ensure equipment are perform to its best capability to support the customer???s need.\r\n???\tEnsure proper communication and understanding from your customer???s need, ensure 100% follow up for any committed actions. \r\n???\tEnsure all identified CA and PA are implemented and closed. Ensure implementation actions are feasible and effective.	20	1	1	1	NIL	NIL	NIL	249	6	5
156	Manage, leads and enables the process of developing excellence mindset and seek continuous improvement to contribute to company's need	???\tBe punctual and adhere to company and fab rules. To inform by phone when needs to go for MC. Do not leave company early and do not have extended break time.\r\n???\tDon't do anything which is unrelated to work during your working hour.\r\n???\tWhen activated during times of need at work place, must be able to respond and come back if required.\r\n???\tAlways stay contactable\r\n???\tMotivate and be motivated by a passion to compete and win. Drive initiatives and take smart risks to achieve our goals.\r\n???\tSet parameters so actions and decisions can be taken by employees.Take initiative to decide, act and be accountable within the parameters given.	20	1	1	1	NIL	NIL	NIL	160	7	52374544
155	Take personal responsibility and commitment for the quality and wafer cycle time to meet customer expectation.re carried out and to ensure the entire MFG team are performing to its best capability to support the customer???s need.	??? Ensure all actions, improvement projects are carried out and to ensure the entire MFG team are performing to its best capability to support the customer???s need.\r\n-  Ensure proper communication and understanding from your customer???s need, ensure 100% follow up for any committed actions. \r\n???\tEnsure all identified CA and PA are implemented and closed. Ensure implementation actions are feasible and effective.	20	1	1	1	NIL	NIL	NIL	160	6	52374544
157	Has always adapt to changing business need, condition and customer demand and work responsibilities with individual and group to meet the requirement	???\tFeedback timely if goals are not able to achieve so that appropriate action can be taken. \r\n???\tPatiently listen to other problem; show more tolerance to accept reasonable explanation. \r\n???\tBe patient to listen to others suggestions and give yourself time before giving answer that you might not be sure. \r\n???\tSpeak up you views, allow debate and ultimate buy off by everybody and move as a team. \r\n???\tMaintain the highest standards of fairness, honesty, and transparency in everything we do, be it Technologically, Socially, Environmentally, As an Employer, As a Supplier, As a Partner	20	1	1	1	NIL	NIL	NIL	160	8	52374544
158	Assigned training for team member are follow through closely with certification.	1.\tTo manage align the operation requirement between the Equipment, Process and Manufacturing teams to ultimately foster long term sustainability in terms of Morale and Synergy.  \r\n2.\tTo take the lead by being fair and sensitive to the other team???s needs and indices. This will foster trust and improved co-operation. The subordinates will see and learn that win-win situations can be achieve, thereby following suit. \r\n3.\tTo increase contact with the Process and Equip engineers, to have balanced points of views. This will enhance the working relationships with understanding each other's problems and concerns. \r\n4.\tTo increase the contact with the subordinate to listen to their feedback and problems. Avoid finger pointing to them unnecessary to foster trust. This gives the subordinate the feeling that they are being heard and that their feedback is of value, which will encourage them to speak up and uplifts their self worth and foster ownership. \r\n5.\t Carry out individual conversation. Understand their issues and problems, but at the same time truthfully tell them their standing, strengths and weaknesses. Tell them on which areas to improve on. \r\n6.\tMet out punishments and rewards appropriately. This will create role models and also real life examples of wrong-doings. In managing the team, being firm and fair is the key.	20	1	1	1	NIL	NIL	NIL	160	9	52374544
159	Closely following-up with operation status (operators, equipment, WIP status, planning,...) to assure meeting targets.	???\tTo ensure all actions, improvement projects and plans are to ensure the entire MFG team are perform to its best capability to support the customer???s need.\r\n???\tEnsure proper communication and understanding from your customer???s need, ensure 100% follow up for any committed actions. \r\n???\tEnsure all identified CA and PA are implemented and closed. Ensure implementation actions are feasible and effective.	35	1	1	1	NIL	NIL	NIL	208	6	1921197435
153	Commitment to You	We are accountable in our commitment to achieve excellence.  We do what we say and behave with integrity at all time. We will uphold the ethical standards of the company always.  We respect each other and value every employee???s contribution.  Collaboration as a team is our motto and we celebrate small and big wins with appreciation.\r\n \r\nAction plan:\r\nBroaden collaborative partnership within team through open communication channel.	40	1	1	1	NIL	NIL	NIL	189	7	1087181548
154	Integrity with Passion	At DenseLight, we take pride in every job that we do by having the highest level of honesty and openness. We cultivate our entrepreneurial drive as a means to remain flexible, agile and willingness to change. We are passionate about DenseLight and have a never-say-die attitude!\r\nAction plan:\r\nCreating innovation sandbox to tested, trial and field test new processes and initiatives.	20	1	1	1	NIL	NIL	NIL	189	8	1087181548
184	Provide good quality, be more responsive and improve delivery to internal and external customer???s desires and needs.		100	1	1	1	NIL	NIL	NIL	213	6	426739617
160	Strictly following fab disciplines and always response to Fab operation's need	???\tBe punctual and adhere to company and fab rules. To inform by phone when needs to go for MC. Do not leave company early and do not have extended break time.\r\n???\tDon't do anything which is unrelated to work during your working hour.\r\n???\tWhen activated during times of need at work place, must be able to respond and come back if required.\r\n???\tAlways stay contactable	35	1	1	1	NIL	NIL	NIL	208	7	1921197435
161	Focus on common goals, open mindset	???\tFeedback timely if goal are not able to achieve so that appropriate action can be taken. \r\n???\tPatiently listen to other problem; show more tolerance to accept reasonable explanation. \r\n???\tBe patient to listen to others suggestions and give yourself time before giving answer that you might not be sure. \r\n???\tSpeak up you views, allow debate and ultimate buy off by everybody and move as a team.	30	1	1	1	NIL	NIL	NIL	208	8	1921197435
164	Integrity with Passion	At DenseLight, we take pride in every job that we do by having the highest level of honesty and openness. We cultivate our entrepreneurial drive as a means to remain flexible, agile and willingness to change. We are passionate about DenseLight and have a never-say-die attitude! \r\n\r\nAction plan:\r\nCreating innovation sandbox to tested, trial and field test new processes and initiatives.	30	1	1	1	NIL	NIL	NIL	237	8	22592094
162	Customer Mindset	Our customers, come first. We will strive to provide them with superior innovative products and will continuously improve their quality that will in turn see us win in our end markets.\r\n\r\nAction plan: \r\nCommunicating with team. Clear and open communication within team to align team with customer???s needs. Accept feedback early to preempt issues and roadblocks.	30	1	1	1	NIL	NIL	NIL	237	6	22592094
178	We are accountable in our commitment to achieve excellence.  We do what we say and behave with integrity at all time. We will uphold the ethical standards of the company always.  We respect each other and value every employee???s contribution.  Collaboration as a team is our motto and we celebrate small and big wins with appreciation.	???\tBe punctual and adhere to company and fab rules. To inform by phone when needs to go for MC. Do not leave company early and do not have extended break time.\r\n???\tDon't do anything which is unrelated to work during your working hour.\r\n???\tWhen activated during times of need at work place, must be able to respond and come back if required.\r\n???\tAlways stay contactable	25	1	1	1	NIL	NIL	NIL	197	7	1017729787
163	Commitment to You	We are accountable in our commitment to achieve excellence.  We do what we say and behave with integrity at all time. We will uphold the ethical standards of the company always.  We respect each other and value every employee???s contribution.  Collaboration as a team is our motto and we celebrate small and big wins with appreciation.\r\n \r\nAction plan:\r\nBroaden collaborative partnership within team through open communication channel.	30	1	1	1	NIL	NIL	NIL	237	7	22592094
166	Collaboration as a team.	1)\tContinue working with Product and NPI to release new ILM boxes / Address Box issues.	1	1	1	1	NIL	NIL	NIL	177	7	1913240580
165	Our customers, come first	1)\tContinue to work with cross functional departments to address customer issues such as RMAs and product support.	1	1	1	1	NIL	NIL	NIL	177	6	1913240580
167	we take pride in every job that we do	1.\tFollow through with proper procedure and specifications when manufacturing.	1	1	1	1	NIL	NIL	NIL	177	8	1913240580
152	Customer Mindset	Our customers, come first. We will strive to provide them with superior innovative products and will continuously improve their quality that will in turn see us win in our end markets.\r\n\r\nAction plan: \r\nCommunicating with team. Clear and open communication within team to align team with customer???s needs. Accept feedback early to preempt issues and roadblocks.	40	1	1	1	NIL	NIL	NIL	189	6	1087181548
168	Collaboration improvement	To achieve and provide timely feedback on the engineering task to support the new prototypes\r\nbuilding.	40	1	1	1	NIL	NIL	NIL	167	7	973701598
169	Provide transparency and information clearly	Provided clear data analysis in yield meeting to tackle and resolve current assembly yield issues.	30	1	1	1	NIL	NIL	NIL	167	8	973701598
170	Improve communication	Team restructuring and development through cross training	30	1	1	1	NIL	NIL	NIL	167	10	973701598
171	Wip Visibility thru ODOO for Fab A and APT	To provide support thru visibility which then would enable expediting and producing quality shipment of new products, from MOCVD growth scheduling, Fab B and right thru APT, ext mfg and final test for shipment	40	1	1	1	NIL	NIL	NIL	162	6	1982477965
172	Build team spirit	Sit in occasionally in the 5pm operations meeting to contribute suggestions and recommendations to improve overall collaborations between teams and foster teamwork	30	1	1	1	NIL	NIL	NIL	162	7	1982477965
173	Improve OTD as a way of life	To promote DIFOT (Deliver in full on time) amongst my team and myself	30	1	1	1	NIL	NIL	NIL	162	8	1982477965
175	Deliver as commit and find ways.	Deliver parts as per commit date and find ways to bridge that gap if any disruption to meet it.	30	1	1	1	NIL	NIL	NIL	215	7	161961016
177	Our customers, come first. We will strive to provide them with superior innovative products and will continuously improve their quality that will in turn see us win in our end markets.	???\tTo ensure all actions, improvement projects and plans are to ensure equipment are perform to its best capability to support the customer???s need.\r\n???\tEnsure proper communication and understanding from your customer???s need, ensure 100% follow up for any committed actions. \r\n???\tEnsure all identified CA and PA are implemented and closed. Ensure implementation actions are feasible and effective.	25	1	1	1	NIL	NIL	NIL	197	6	1017729787
179	At DenseLight, we take pride in every job that we do by having the highest level of honesty and openness. We cultivate our entrepreneurial drive as a means to remain flexible, agile and willingness to change. We are passionate about DenseLight and have a never-say-die attitude!	???\tFeedback timely if goal are not able to achieve so that appropriate action can be taken. \r\n???\tPatiently listen to other problem; show more tolerance to accept reasonable explanation. \r\n???\tBe patient to listen to others suggestions and give yourself time before giving answer that you might not be sure. \r\n???\tSpeak up you views, allow debate and ultimate buy off by everybody and move as a team.	10	1	1	1	NIL	NIL	NIL	197	8	1017729787
180	APT Manufacturing	Escalate any quality issue in the production line and work closely with engineering team for closure in a timely manner.	34	1	1	1	NIL	NIL	NIL	159	6	689543953
182	APT Manufacturing	Working with PPC, PE, NPD, Wafer fab, and HR as a team to achieving Denselight's corporate goals.	33	1	1	1	NIL	NIL	NIL	159	7	689543953
185	Be positive, flexible and open minded to adopt the changes for better future of Denselight. Respect others and work as team to resolve the issues.		100	1	1	1	NIL	NIL	NIL	213	8	426739617
187	Customer obsession by delighting them through on time delivery of quality parts.	meet and deliver as per commit date	50	1	1	1	NIL	NIL	NIL	215	6	161961016
176	Deliver attune to customer needs while driving help achieve company goals.	work with cross-functional team to develop solution and organizational efficiencies	20	1	1	1	NIL	NIL	NIL	215	8	161961016
188	Flexibility and Core competency	Fast integration on Bar testing, Burn-in and other process to support productions/engineering build.	40	1	1	1	NIL	NIL	NIL	181	6	1536568573
189	Flexibility and Core competency	Hand-on training on burn-in oven to able to fix issues and restore the loss capacity.	30	1	1	1	NIL	NIL	NIL	181	7	1536568573
190	Teamwork	Review and Analyze the existing data for production and engineering build.  Then come up with Improvement plan on system and data baseline analysis.\r\n\r\nHighly committed for fixing recurring issues through improvement. Example of this are Die Bond long downtime with very old HDD and also replacement of Keithley Spheres into Newport spheres.\r\n\r\nWorking out to simplify SPC and Documentations	30	1	1	1	NIL	NIL	NIL	181	8	1536568573
181	quality against time	We, ILM, might commitment to build box with quality not target on time. We can manage if follow up process, step by step on time.\r\nNeed to discuss between teams which including before accept any order esp. new order.	50	1	1	1	NIL	NIL	NIL	220	7	231731743
193	Leadership & teamwork	- Lead by example by showing the team good working attitude, creativity, and going the extra mile.\r\n- Constant team motivation by holding regular discussions and meetings to encourage openness of ideas and allow them to voice their feedback.	20	1	1	1	NIL	NIL	NIL	196	10	2047523461
192	Work commitment & integrity	- Positive working attitude and honesty. \r\n- Work commitment to complete the job satisfactorily. \r\n- Constant self-improvement and innovation to achieve department targets and goals. \r\n- Follow company's policies and instructions, and encourage my team to do the same.	20	1	1	1	NIL	NIL	NIL	196	7	2047523461
191	Customer oriented	- Support internal customer to deliver EHS & facility services effectively. \r\n- Maintain professionalism and a friendly relationship with the customers. \r\n- Listen and note customers feedback and apply to service promptly, where possible and reasonable.	20	1	1	1	NIL	NIL	NIL	196	6	2047523461
197	Demonstrate commitment in leading NPI program	Commitment in leading 1310nm low PDG SOA and 1310nm low DOP SLED team & support technical lead to achieve full characterization needed in program objectives.	50	1	1	1	NIL	NIL	NIL	204	7	480020115
198	Demonstrate Passion & tenacity in program execution	Drive result per project plan & meet or exceed timeline expected. Promote collaboration among team members to achieve common objectives of organization.	50	1	1	1	NIL	NIL	NIL	204	8	480020115
199	Deliver devices/wafer better than expected from customers	Improve epi structure/growth wafers to have devices performing.	50	1	1	1	NIL	NIL	NIL	163	6	1373136557
200	Trust and gain trust from team members, managers		30	1	1	1	NIL	NIL	NIL	163	8	1373136557
210	Seeing your Coworkers as Customers and attend to their request and provide commitment	Had tried very best to accommodate all Customers / Coworkers requests and solved some issues with communication and solutions.	100	1	1	1	NIL	NIL	NIL	164	6	1428738048
211	1.\tTo plan and schedule work load to meet commitment completion date	Had tried very best to meet Time Lines of work load plans and schedules.	100	1	1	1	NIL	NIL	NIL	164	7	1428738048
201	Transfer knowledge to other process engineer and equipment engineer	Train Uma in MOCVD process; \r\nTrain Hameed to understand MOCVD from basic to advance levels.	20	1	1	1	NIL	NIL	NIL	163	9	1373136557
196	Development of In-house Knowledge base	To develop and maintain in-house knowledge base of various technical aspects of projects concerned.\r\nThis is achieved by active documentation and building and launching of documentation platform using wikimedia.\r\nhttp://dlvas/mediawiki/index.php?title=Main_Page	100	1	1	1	NIL	NIL	NIL	183	9	711389827
212	1.\tTo ensure what is being committed will be completed otherwise will inform or advise if commitment cannot be fulfilled.	What have committed has been done accordingly and within time lines given.	100	1	1	1	NIL	NIL	NIL	164	8	1428738048
195	Principled person, adheres to high standards	- Love every job and perform it to the highest standard. \r\n- Flexible, passionate for innovation and adaptable to new improvements.\r\n- On-time submission of reports and on-time completion of projects and tasks.	20	1	1	1	NIL	NIL	NIL	196	8	2047523461
194	Ability to train and coach effectively	- Share ideas and knowledge with my team by conducting trainings.\r\n- Ensure transfer and retention of knowledge by encouraging the practice of the practical skills shared during trainings.\r\n- Help the team to develop their situational awareness of unsafe conditions to improve their leadership qualities and decision making skills.	20	1	1	1	NIL	NIL	NIL	196	9	2047523461
204	Improve Company's Branding	Upload Denselight core values with fairness to all employees (regardless of rank) by giving feedback to anyone if seen to waiver from the values	30	1	1	1	NIL	NIL	NIL	256	8	534558467
205	Improve Company's Branding	Develop a new HR team to excel in business partnering.	30	1	1	1	NIL	NIL	NIL	256	7	534558467
206	Reduce Turnover	Provide regular feedback to HODs on their 'People Issues'.	40	1	1	1	NIL	NIL	NIL	256	6	534558467
207	Focus on meeting Stakeholders??? goals	To continue communicate our shared belief and aspiration in shaping DenseLight towards IPO	30	1	1	1	NIL	NIL	NIL	258	8	1135328161
208	Technology mentorship to all DenseLight colleagues	Proactive in providing technical guidance to all technology and operation groups and colleagues	35	1	1	1	NIL	NIL	NIL	258	7	1135328161
209	Alignment of DenseLight solutions to Customer???s needs	Work attentively with DLS sales & mkt and NPD colleagues to customer???s inputs to ensure that their specs and application requirements are well understood and properly supported by our proposed solutions	35	1	1	1	NIL	NIL	NIL	258	6	1135328161
213	Integrity with Passion & Tenacity	??? Feedback timely if goal are not able to achieve so that appropriate action can be taken. ??? Patiently listen to other problem; show more tolerance to accept reasonable explanation. ??? Be patient to listen to others suggestions and give yourself time before giving answer that you might not be sure. ??? Speak up you views, allow debate and ultimate buy off by everybody and move as a team.	5	1	1	1	NIL	NIL	NIL	259	8	135493917
214	Commitment to You	- Broaden collaborative partnership within team through open communication channel. - Intensify efforts to create greater ownership of tasks and responsibilities.	10	1	1	1	NIL	NIL	NIL	259	7	135493917
215	Customer Mindset	??? To ensure all actions, improvement projects and plans are to ensure MFG and equipment are able to perform to its best capability to support the customer???s need. ??? Ensure proper communication and understanding from customer???s need, ensure 100% follow up for any committed actions. ??? Ensure all identified CA and PA are implemented and closed. Ensure implementation actions are feasible and effective.	10	1	1	1	NIL	NIL	NIL	259	6	135493917
216	Always meeting customers needs.	Smooth cooperation with all that need assistance with wafer related problems.	40	1	1	1	NIL	NIL	NIL	190	6	1598293097
219	Branding & Marketing	Work with all the internal stake holders (PE, NPI, IT) to enhance DenseLight???s online presence, by presenting accurate and up to date information. Drive DenseLight???s branding efforts by showcasing individual???s expertise such that DenseLight is seen as a technology leader.	30	1	1	1	NIL	NIL	NIL	260	8	985791817
220	Active participation in Product Council	Be an active part of the product council. Ensure the council has all the relevant market information to make an investment decision. Work with both China & the ROW sales team to deliver these inputs from the field.	30	1	1	1	NIL	NIL	NIL	260	7	985791817
221	Working with internal teams to win new designs at customer	Work with the engineering & production teams to deliver NPI to key customers, and work with ROW sales teams to win new designs. Ensure that what we commit to deliver is within our capability, and work to set customer expectations early in these deals	40	1	1	1	NIL	NIL	NIL	260	6	985791817
222	Ensure no finance violations	Monitor and ensure there is no finance violations within the company	30	1	1	1	NIL	NIL	NIL	261	8	988735390
223	Sharing of PNL with analysis and cost review in staff meeting	Sharing of PNL with analysis with staff and to the Fab A, B and APT owner on the regular basis.	30	1	1	1	NIL	NIL	NIL	261	7	988735390
224	Zero complaint on account receivable from customer	Ensure there is no complaint on account receivable from customer by providing timely and accurate account receivable.	30	1	1	1	NIL	NIL	NIL	261	6	988735390
225	Small wins lead to big gains	1. Daily 930 pow wow with entire NPD team to motivate and keep track of achievements for weekly targets 2. Send weekly targets to entire NPD team to help them focus 3. Lead by example to show them that everyone matters and that everyone has a role to play and contribute. Provide daily examples and suggestions to improve and at meetings	20	1	1	1	NIL	NIL	NIL	262	10	430837474
226	Efficiency and Urgency	1. Continual encouragement of urgency in getting revenue with existing and innovative technology. 2. If possible, offer innovative and creative ideas to both customer for continual interest and opportunities. Not to give up unless customer gives up. 3. Encourage team to take ownership daily and think creatively to resolve issues if required.	20	1	1	1	NIL	NIL	NIL	262	8	430837474
227	Communications and Engagement with external and internal parties	1. Communicate effectively and diplomatically 2. Provide response to parties within 24hrs (if urgent) and within a week of deadlines 3. Transparency of execution. Communication on common platform with entire NPD team. 4. Do as i say and say as i do whilst engaging with my team and peers.	20	1	1	1	NIL	NIL	NIL	262	7	430837474
228	Work closely with sales team, CTO and market reports	1. Getting involve with revenue meetings to understanding existing and new sales opportunities 2. Regular meetings with sales team and CTO to determine current product performance and health. 3. Being involve with KFA 2.4 to understand and provide inputs to company's product marketing strategy 4. Engaging customers with Sales team both technically and commercially.	20	1	1	1	NIL	NIL	NIL	262	6	430837474
229	accountability to achieve excellence to our customers	Gaps are there in the quality of wafers coming out of Fab B. Set individual tasks to my team to ensure we give consistent quality wafers.	30	1	1	1	NIL	NIL	NIL	263	7	324340084
230	High level of honesty and openness	i) create an environment to share and solve problems together. ii) Learnings from one program to be shared across all programs to ensure same issues are not repeated.	30	1	1	1	NIL	NIL	NIL	263	8	324340084
231	1st time right, sense of urgency and quality of execution	i) Proper planning and execution of critical customer programs to ensure we deliver as per plan and within the timeline. ii) Appraised team on the need to react fast and show sense of urgency. Proper execution for ???1st time right???	40	1	1	1	NIL	NIL	NIL	263	6	324340084
232	Mentor and coach team leads to take on more leadership role in the organization		25	1	1	1	NIL	NIL	NIL	264	9	759336758
233	Promote a culture of ownership, collaboration and transparency.		25	1	1	1	NIL	NIL	NIL	264	8	759336758
234	Drive team to work together in achieving Denselight???s corporate goals.		25	1	1	1	NIL	NIL	NIL	264	7	759336758
235	Provide prompt quality response to both internal and external customers.		25	1	1	1	NIL	NIL	NIL	264	6	759336758
236	Motivate people and ensure the team achieve our goal.	Motivate people and ensure the team achieve our goal.	30	1	1	1	NIL	NIL	NIL	265	10	25957709
237	Keep my commitment and behave with integrity.	Keep my commitment and behave with integrity.	30	1	1	1	NIL	NIL	NIL	265	7	25957709
238	Provide products and supports above their expectation.	Always try to provide customers best products, and provide supports above their expectation.	40	1	1	1	NIL	NIL	NIL	265	6	25957709
217	To be able to work and contribute as a team.	Making Fab A a conducive environment not only for working but also for learning.	30	1	1	1	NIL	NIL	NIL	190	7	1598293097
218	Always striving to give your 100%	Making Fab A a learning environment where we learn from our mistakes and grow together as a team.	30	1	1	1	NIL	NIL	NIL	190	8	1598293097
240	Establish Organized Project Team Meeting Status Update and Plan	1. Review and Update of Project Deliverable with Core Team\r\n2. Summary Update of all Project Milestone/Delivery Review with the Management through PDM	30	1	1	1	NIL	NIL	NIL	170	7	1207021661
241	Translate Project Phase and Milestone/Deliverable into Revenue and Profit targets	Review and Update with Core Team All Project Deliverable/Milestones translated into Revenue and Profit Targets\r\n1. Initiate Business Case and Modeling with ROI template, Cost Modelling, and Development Cost inclusion into the PDM Process.\r\n2. On-Going implementation for 25G Program, rest of the Projects to follow-suit	30	1	1	1	NIL	NIL	NIL	170	8	1207021661
239	Implementation of PDM Process	1. Execution of NPD Phase  Process for each Project/Program\r\n2. Proper Documentation for each required Design/Process Structure\r\n3. Project/Program Alignment base on Customer commitments	40	1	1	1	NIL	NIL	NIL	170	6	1207021661
242	Core Values - Customer Mindset	Our customers, come first. We will strive to provide them with superior innovative products and will continuously improve their quality that will in turn see us win in our end markets.\r\n\r\nAction plan: \r\nCommunicating with team. Clear and open communication within team to align team with customer???s needs. Accept feedback early to preempt issues and roadblocks.	30	1	1	1	NIL	NIL	NIL	236	6	850138976
243	Core Values - Commitment to You	We are accountable in our commitment to achieve excellence.  We do what we say and behave with integrity at all time. We will uphold the ethical standards of the company always.  We respect each other and value every employee???s contribution.  Collaboration as a team is our motto and we celebrate small and big wins with appreciation.\r\n \r\nAction plan:\r\nBroaden collaborative partnership within team through open communication channel.	30	1	1	1	NIL	NIL	NIL	236	7	850138976
244	Core Values ??? Integrity with Passion	At DenseLight, we take pride in every job that we do by having the highest level of honesty and openness. We cultivate our entrepreneurial drive as a means to remain flexible, agile and willingness to change. We are passionate about DenseLight and have a never-say-die attitude! \r\n\r\nAction plan:\r\nCreating innovation sandbox to tested, trial and field test new processes and initiatives.	30	1	1	1	NIL	NIL	NIL	236	8	850138976
245	Customer Mindset	Our customers, come first. We will strive to provide them with superior innovative products and will\r\ncontinuously improve their quality that will in turn see us win in our end markets.	30	1	1	1	NIL	NIL	NIL	198	6	1941685512
246	Commitment to You	We are accountable in our commitment to achieve excellence. We do what we say and behave with integrity at\r\nall time. We will uphold the ethical standards of the company always. We respect each other and value every\r\nemployee???s contribution. Collaboration as a team is our motto and we celebrate small and big wins with\r\nappreciation.	30	1	1	1	NIL	NIL	NIL	198	7	1941685512
247	Integrity with Passion	At DenseLight, we take pride in every job that we do by having the highest level of honesty and openness. We\r\ncultivate our entrepreneurial drive as a means to remain flexible, agile and willingness to change. We are\r\npassionate about DenseLight and have a never-say-die attitude!	40	1	1	1	NIL	NIL	NIL	198	8	1941685512
257	Passion and interest in career	???\tHonesty and Openness\r\nI iterate all my projects progress and ???to do??? checklist inside my Google Sheet Planner in order to be transparent. By doing so, my superior and higher management are aware of my progress and will advise me accordingly incase there is deviation in the projects??? direction. \r\n???\tBeing Agile\r\nI will switch from one project to another based on the business needs, urgency and criticality. I am open to constant changes in project based on its urgency with my superiors??? consent and input. I am also vocal and opinionated in each of my actions and have the courage to voice out my thoughts to create an agile working environment between me, my peers and higher managements.\r\n???\tPassionate\r\nI love my job. I always love coding and creating applications because it gives me satisfaction in delivering an automation tool that ease my client???s workload. It also gives me joy to see, more and more people start approaching me to automate their manual procedures. I am so passionate to be in this work because I am being appreciated by my fellow superiors and the trust they have on me makes me motivated to deliver more. I have always dream of being a Programmer, I am so grateful that this company has given me this opportunity to be in the dream job I am always craved for.	30	1	1	1	NIL	NIL	NIL	214	8	1608216415
248	Deliver customer demands 100% on time and net promoter score 30% scoring 8-10 as customer experience	-Clear awareness of customer demands \r\n-Introduce new/modified disruptive performance compare to competitor \r\n- Deliver job on time\r\n- Keep monitoring the quality of the job	20	1	1	1	NIL	NIL	NIL	238	6	539619816
250	Honest and highly professional behavior	-Flexible towards changes and open for adaptation\r\n- Be positive\r\n-Showing integrity towards any relation to creating a WIN-WIN situation \r\n- passionate about work \r\n- Maintain work principle and discipline	20	1	1	1	NIL	NIL	NIL	238	8	539619816
251	Creating competent team	- Sharing and transferring the knowledge effectively\r\n- Mentoring colleagues who need the direction of coaching \r\n- Sharing the essence of team binding and care for each other\r\n- Understanding team members accountability and team achievement	20	1	1	1	NIL	NIL	NIL	238	9	539619816
252	Create values, not count values	- Building a focused competent team \r\n- Keeping in mind the company's   mission and product road map\r\n- Follow company philosophy \r\n- Accommodate different style of leadership based on the scenario \r\n- Follow the thumbs rule of Storming, forming, norming, and performing model \r\n- Use the SBI-I-D model	20	1	1	1	NIL	NIL	NIL	238	10	539619816
253	Product customization	Incorporating customers' requirements in new product design considerations and for derivative products\r\n  - mid-year: for at least 1 case; year-end: for at least 2 cases	50	1	1	1	NIL	NIL	NIL	150	6	1557152765
254	Engineer training	Continue to guide and mentor junior members of NPD/PE teams on optoelectronics and photonics background\r\n  - year-end: at least two new members in NPD/PE teams	35	1	1	1	NIL	NIL	NIL	150	7	1557152765
256	User Requirement	???\tTo learn how to use the Right question so that I can understand what my client really looking forward ??? to use Kanban table to list down my user requirements\r\n???\tTo have a Gantt chart using Agile & Scrum methodology ??? to follow the Software Cycle in accordance so that my clients will understand in each phase of my project\r\n???\tTo email the Management to progressively update on the project	30	1	1	1	NIL	NIL	NIL	214	6	1608216415
255	DenseLight promotion	Continued drive to promote DenseLight to all local and overseas stakeholders (customers, vendors, suppliers, collaborators and partners)\r\n  - year-end: for at least 1 case	15	1	1	1	NIL	NIL	NIL	150	8	1557152765
274	Always open and honest about the performance of our devices and schedules to the management and flexibility and agility to provide solutions and meet deadlines	Always share the actual status of the progress of the projects and performance of the devices being developed with the management. \r\nIf there is a delay in the schedule, will work outside working hours as well as go to the ground to help push and drive the completion of different stages of work. Share purpose and reasons for the expedition with the working level to help facilitate and speed up the work done especially in delivering samples to the customer.	33	1	1	1	NIL	NIL	NIL	172	8	364472470
258	Accountable for committed tasks	???\tBeing Accountable:\r\n-\tTo actively follow up with my fellow clients if they are facing any issue when using the system\r\n-\tApart from job scope, if there is any issues happening in office premises, I will inform HR or management if its beyond my capability to solve it\r\n???\tUpholding Integrity:\r\n-\tI anticipate earlier of some dead ends in my projects and will inform my clients on what are the consequences they might be facing if we proceed the pathway. I will counter propose to them what are the possibilities to achieve the goal of the projects in alternative ways. By doing this, I am being cautious and act with integrity to save my clients time and effort.\r\n???\tUpholding Ethical standards\r\n-\tI use the software that are compatible with company???s licensed standards. All the company solutions and created projects, are only kept within the company premises; in the company server. \r\n-\tApart from job related, I also do not disclose any passwords to any other employees without Ryan or Julius permission. \r\n???\tRespect and value other employees\r\n-\tI value each of the employees??? opinion and talk with respect with all my colleagues and pay attention when they have points to contribute. I attend meetings, trainings and presentation that I am invited to without bailing off. Especially all the trainings/events that Christine has arranged, I value her effort and attend to support her idea in bringing a brighter culture in this company. I also attend Rachel???s arranged training by Dr Chan to understand about the Denselight products. \r\n-\tI have sent acknowledgement emails to Subbu and respective team manager to recognize some employee???s efforts such as John helping me in understanding about Litho process in depth.\r\n???\tBeing Collaborative in Teamwork\r\n-\tI love being in teamwork. Once my team mate, Ryan has shared his advice of ???more brain, the better it is!??? I do agree with his statement and always approach the experts to seek their advice. I always check and balance with my team and manager, and also respective team so that I am able to solve an encountered project issue with ease.	40	1	1	1	NIL	NIL	NIL	214	7	1608216415
264	Ability to transfer expertise and build long-term leadership capability of others by teaching and/or mentoring	I strongly believe in teamwork and cooperation is one of the most important factors to success. That's why I share 100% all the knowledge I have and guide those who are in need to bring the team to a next level of competency.	20	1	1	1	NIL	NIL	NIL	169	9	1352141850
263	At DenseLight, we take pride in every job that we do by having the highest level of honesty and openness. We cultivate our entrepreneurial drive as a means to remain flexible, agile and willingness to change. We are passionate about DenseLight and have a never-say-die attitude!	I???m committed to deliver the best of my abilities to help Denselight and find ways to deliver without compromising quality. Continue to drive improvements and inspire others to collaborate to improve together.	20	1	1	1	NIL	NIL	NIL	169	8	1352141850
262	We are accountable in our commitment to achieve excellence.  We do what we say and behave with integrity at all time. We will uphold the ethical standards of the company always.  We respect each other and value every employee???s contribution.  Collaboration as a team is our motto and we celebrate small and big wins with appreciation.	Continue to build qualities such as trust, healthy conflict, commitment, accountability and attention to results.	20	1	1	1	NIL	NIL	NIL	169	7	1352141850
261	We will strive to provide them with superior innovative products and will continuously improve their quality that will in turn see us win in our end markets.	Continue to pursue quality product by timely response to customer complaints, proper closure of RMA???s and mindset to have zero RMA???s.	20	1	1	1	NIL	NIL	NIL	169	6	1352141850
265	Ensure that the team is focused, motivated and inspired to achieve organizational objective	In every aspect of work there is always distractions that derail our focus towards our objective.  This can be addressed by making sure each team member understand the value of what the team is doing. Make sure team members realize their work and their skills are valued and make certain they understand why their work is valuable in the context of the team, the company, and the industry.	20	1	1	1	NIL	NIL	NIL	169	10	1352141850
266	Never give up in finding a solution to achieve the goals set by the company	Action Plan: \r\nSeek help from other experts in the company if stuck in a particular problem to find out and efficient solution and work together to meet the company goal. Always look for a way and never give up	20	1	1	1	NIL	NIL	NIL	217	8	1484926575
260	Works well with the team; take over and help the people in the same department when they are not around. Respect everyone in the working place	Assist the team members who were on stay home notice\r\nAssists the team on testing related issues\r\nShares the knowledge on productivity tools and analysis tool\r\nAssisted the NPD in speedy analysis of the Panwoo Program	20	1	1	1	NIL	NIL	NIL	217	7	1484926575
259	Cultivate the culture to prioritize customer support	Customer first; speed up activities required by the PPC and Sales Team and respond quickly to emails.\r\nAssist the sales team on any information the customer requested. Work more with the External Manufacturing team and Sales team to understand the customer requirements and the design that we need to look out for	20	1	1	1	NIL	NIL	NIL	217	6	1484926575
267	Teach other members and mentor them on knowledge learned so far	Buddy system for the new hires\r\nTeach new members on learnings from the past	20	1	1	1	NIL	NIL	NIL	217	9	1484926575
268	Lead projects and achieve the target set by the company		20	1	1	1	NIL	NIL	NIL	217	10	1484926575
269	Customer First Mindset	1. To integrate the customer needs into my action plan\r\n2. To react fast and prompt on the customer inquiries	40	1	1	1	NIL	NIL	NIL	252	6	10
270	Commitment to You	1. To challenge myself to deliver and commit the best\r\n2. To avoid mediocrity mentality in every task that I do	30	1	1	1	NIL	NIL	NIL	252	7	10
271	Integrity with Passion and Tenacity	1. To share all the data and findings in shared folder so nothing is hidden\r\n2. To avoid 'hiding under the carpet' mentality when something is going wrong	30	1	1	1	NIL	NIL	NIL	252	8	10
272	Focused on delivering the information and hardware that have been requested by the customer based on the commit dates	As program manager, will worked with the Technical Lead, manufacturing and testing departments to prepare information and sample units that were requested by the customer at the required dates. \r\n.	33	1	1	1	NIL	NIL	NIL	172	7	364472470
249	Efficient and effective collaboration	-Always follow the thumb rule 'I say what I do and I do what I say' \r\n- Always feel accountable for the task which has been committed by me\r\n- Follow company philosophy\r\n- Appreciate colleagues with their contribution\r\n- Respect each and everybody irrespective of position	20	1	1	1	NIL	NIL	NIL	238	7	539619816
273	Putting the customer first in committing time and effort to assess and provide solution to their technical requirements	Will work with the technical lead to provide the solutions to the custom requests by the customer with a project proposal meeting their technical requirements.	33	1	1	1	NIL	NIL	NIL	172	6	364472470
275	Production Yield	Be more involved in production yield issues.	1	1	1	1	NIL	NIL	NIL	155	6	931345185
276	Customer Samples	Increase attention to detail when planning shipment of customer samples.	1	1	1	1	NIL	NIL	NIL	155	7	931345185
277	PDM Improvement	Propose methodology improvements to the alpha phase checkpoint of the PDM.	1	1	1	1	NIL	NIL	NIL	155	8	931345185
\.


--
-- Data for Name: GnC_competency_comment; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."GnC_competency_comment" (id, comments, created_on, competency_id, created_by_id) FROM stdin;
1	Up to Aug2020, no complaint.	2020-09-24 01:01:45.11728+00	61	988735390
\.


--
-- Data for Name: GnC_departmental_competencies; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."GnC_departmental_competencies" (id, summary, description, appraisal_id, competency_category_id, department_id, manager_id) FROM stdin;
\.


--
-- Data for Name: GnC_departmental_competencies_comment; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."GnC_departmental_competencies_comment" (id, comments, created_on, created_by_id, departmental_competencies_id) FROM stdin;
\.


--
-- Data for Name: GnC_departmental_goals; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."GnC_departmental_goals" (id, summary, description, due, appraisal_id, department_id, goal_category_id, manager_id) FROM stdin;
12	CTO Role: Direct company technology strategy	Under the personal responsibility of CTO	2020-12-31	21	10	5	1224448967
14	Advancing DPHI Platform solutions offering	a) DPhi and Optical Engine solutions Technical Directions\r\nb) DLS-AMF MOU and POC1&2\r\nc) DPHI implementation, including HIPP to OE solutions engineering	2020-12-31	21	13	3	1135328161
17	Providing development support on packaging integration & test engineering	Identifying and proactively provide technology development engineering support to NRE programs, NPI projects, Product Engineering, and APT, in the area of advanced packaging integration & related test engineering	2020-12-31	21	13	3	1135328161
18	Monthly closing within 4 working days	Ensure monthly closing by 4th working days	2021-01-06	21	6	5	988735390
19	Supply Chain Department Goals	Revenue - Meet shipment target\r\n\r\nOrganization - Reduce attrition by 50%, identify and fill all 2020 budgeted positions and review of KFA???s.\r\n\r\nCustomer Engagement - Secure capacity and capability for DFB at the subcons\r\n\r\nOps Efficiency / Cost Reduction - Achieve yield of 90% at the subcons, implement auto work order for APT and achieve $250k of cost savings.\r\n\r\nNPI - Qualify new subcons to support new products like 25G.	2020-12-31	21	5	6	759336758
20	Departmental Goal 1	Departmental Goals are to be observed	2021-12-31	48	9	6	18
\.


--
-- Data for Name: GnC_departmental_goal_comment; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."GnC_departmental_goal_comment" (id, comments, created_on, created_by_id, departmental_goal_id) FROM stdin;
\.


--
-- Data for Name: GnC_goal_comment; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."GnC_goal_comment" (id, comments, created_on, created_by_id, goal_id) FROM stdin;
1	comment1	2020-11-05 08:06:55.709471+00	17	504
2	perfect	2020-11-09 06:25:50.393802+00	17	506
3	Comment 1	2020-11-18 13:26:45.323748+00	17	510
\.


--
-- Data for Name: GnC_kpi; Type: TABLE DATA; Schema: public; Owner: benny6789
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
24	1. Deliver 3 new application notes or videos that show cases DenseLight???s expertise in the respecting markets.	2020-12-31	2020-09-10	Not Started	23
26	2. Work with the internal teams to deliver 2 Technical Marketing reports, and make recommendations on the direction DenseLight should take.	2020-12-31	2020-09-10	Not Started	23
27	1. Improve the existing sample request process within Odoo that allows different stake holders to acknowledge, tack and ship samples.	2020-12-31	2020-09-10	Working	25
28	2. DenseLight???s web page, to ensure customers can find information to help them in their design of DenseLight???s products.	2020-12-31	2020-09-10	Working	25
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
69	Improved NMTO and E-Boarding program in KFA no.1.1\r\nTop 10% identified form Functional Review - 0% turnover and are retained from KFA no.13	2020-12-31	2020-09-18	Not Started	103
70	Leadership Development\r\n- Conduct 4 supervisory training for potential managers/supervisors\r\n\r\nBy Q2,2020, 2 training to be completed.\r\nBy Q4, 2020, last 2 trainings conducted.	2020-12-31	2020-09-18	Not Started	103
71	Consistent welfare activities on alternate months to bond the people\r\n- 6 welfare activities to bey done by Q4,2020\r\n\r\nIntroduce workplace integration program (funded by WSG and administered by SNEF) to come up with integration activity for staff - Q3,2020\r\n\r\nTouch points with new hires 1st, 3rd and 6th month of service in DLS to be organized by HRBPs assigned.	\N	2020-09-18	Not Started	103
72	Improve Communication\r\n- During townhall, introduce pigeon-hole questions for people to ask Rajan (by Apr 2020)\r\n\r\n- Start a group-chat Buddy system (4 existing employee mentor 1 new hire) per KFA no.1.3 (By April 2020)\r\n\r\n- Evaluate EOS 2020 results and start focused group coffee talks to determine action plans. (By March 2020)	2020-12-31	2020-09-18	Not Started	103
73	a. Propose a sales incentive Plan for implementation twice a year (SIP) \r\n(By April 2020)\r\n\r\nb. Propose a general bonus proposal for the Board's approval (By April 2020)\r\n\r\nc. Prepare a Salary increment proposal in May for July 2020 Implementation (By May 2020)\r\n\r\nd. Conduct a market adjustment for key employees by March 2020 (By March 2020)	2020-07-31	2020-09-18	Working	104
74	a. Identify next set of potential leaders to develop and train them via the DLS supervisory Leadership program found in KRA (2) and reduce the no. of reports to HODs for better management.\r\n(BY Q3,2020 completed functional reviews)\r\n\r\nb. Ensure HODs rate and rank their employees under their charge during Functional Reviews and ensure top 10% identified as key personnel are retained. \r\n(By August 2020 functional reviews done and key talents identified)	2020-12-31	2020-09-18	Not Started	106
75	a. Identify next set of potential leaders to develop and train them via the DLS supervisory Leadership program found in KRA (2) and reduce the no. of reports to HODs for better management.\r\n(BY Q3,2020 completed functional reviews)\r\n\r\nb. Ensure HODs rate and rank their employees under their charge during Functional Reviews and ensure top 10% identified as key personnel are retained. \r\n(By August 2020 functional reviews done and key talents identified)	2020-12-31	2020-09-18	Not Started	106
77	Ensure adherence to requirements of job posting on government job portal	2020-12-31	2020-09-19	Working	107
89	Ensure on-time work pass applications according to latest MOM???s advisories	2020-12-31	2020-09-21	Not Started	107
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
87	E-OT system ??? working with IT and Hunet to automate the computation of directs overtime	2020-07-31	2020-09-19	Working	110
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
119	a)\t100% SOP set up for all steps / New Operator certification \r\nb)\tEnable 2 slot jig for AR/HR coat in Oxford / Trion for longer cavity lengths\r\nc)\tBack up tools qualification / deployment into production by Q2???20\r\nd)\tYield system set up by cleaning up using process mapping for SLED / ELED / DFB\r\ne)\tAssign One cost reduction activity per engineer (should cover material cost, gold reduction by integration and resist convergence)	2020-12-31	2020-09-26	Not Started	36
16	1. Establish weekly yield meeting report structure and driving system:  \r\n1.1 Establish weekly yield reporting framework\r\n1.2 Clean up the data source to ensure data accuracy\r\n1.3 Establish & align cum yield calculation methodology and list of criteria for yield calculation\r\n1.4 Based on 75% cum yield goal, breakdown & establish individual goals for test/APT/coating with clear ownership.	2020-12-31	2020-09-04	Working	29
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
116	a.\tDrive CONC to be less than 5% for Y2020.\r\nb.\tNCMR and RMA numbers to be reduced by 30% from last year???s\r\nc.\tSPC system set up at top 5 bins for matured products in Product group. \r\nd.\tSPC to next level in Fab B for i) tool level , ii) Product level, iii) Metrology level  - Achieve Cpk > 1.33 & OOC < 10% + investigation on all OOC points \r\ne.\tImprove Fab B WAT yield to 90% by fixing process related issues\r\nf.\tConduct routine audits and drive Audit findings to closure within 2 months\r\ng.\tPRM / ORT system set up for matured products (ELED / SLED / DFB)	2020-12-31	2020-09-26	Not Started	33
117	i)\tSupport ???key customer programs (Renesas, 25G DML, Huawei SOA, Panwoo, Almae BH, BW10 and other Laser projects) as per learning cycle plan. Scope issues and ensure successful wafer outcome for realizing revenue / NRE\r\nii)\tPrelim qualification of ONE Renesas product by end 2020\r\niii)\tDrive Fab B process, Product and QA groups to help achieve 2 design wins for 1653DFB, 10G i-temp and 25G DML or High power DFB c-temp.\r\niv)\tSmooth operations by ensuring back ups for all ???possible??? tools (at inhouse & at external sources) \r\nv)\tCumulative Yield target of 75% for the year 2020.	2020-12-31	2020-09-26	Not Started	32
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
228	KFA 5.2 : BH development\r\nWorking for the final report. \r\nInitial report regarding literature review- submitted 31 Jul 2020\r\nProcess capability analysis- 31 Oct 2020	2020-10-30	2020-09-29	Working	179
229	Operator training & Assessments\r\nTraining of Operators and Asses them	2021-03-01	2020-09-29	Not Started	160
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
289	Lead KFA 4 Build and deliver effective and efficient business process??? and systems.	2020-12-31	2020-10-07	Not Started	140
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
308	Hisense: To formalize 8-pin collimated TO Cans into production ??? documentation, test correlation, etc. [Provided product goes into manufacturing]	2020-12-31	2020-10-09	Not Started	173
309	SFO: To ensure that proper qualification of new ferrules and make sure objective 1 is achieved through this change	2020-12-31	2020-10-09	Not Started	173
310	Cycle time to be improved to 3 weeks (average) for TO-Can and 4 weeks (average) for Butterfly.	2020-12-31	2020-10-09	Not Started	173
311	Yield at subcons to be maintained or exceed 90%	2020-12-31	2020-10-09	Not Started	173
312	Generate baseline SOWs for all subcons	2020-12-31	2020-10-09	Not Started	173
313	Assisting the Panwoo deliverables to ensure testing and sampling is done on time.	2020-12-31	2020-10-09	Not Started	295
314	Establish new product development procedure for design and assembly at subcons	2020-12-31	2020-10-09	Not Started	174
315	Ensure proper assembly and qualification of subcontractors if build is successful (this does not include qualification of the product)	2020-12-31	2020-10-09	Not Started	174
316	ILM DAS development with discussion and new modules build for the\r\ndevelopment of the box.	2020-12-31	2020-10-09	Not Started	295
317	Key projects (main subcon and alternative subcon stated): \r\na. 14-pin BTF narrow linewidth laser with double grating ??? AFR, PMS \r\nb. 8-pin low DOP SLED ??? AFR. PMS \r\nc. 14-pin BTF with TEC from TEC Microsystems ??? PMS, SFO \r\nd. 8-pin DFB Cooled TO Can with aspherical lens \r\ne. 14-pin BTF narrow linewidth laser with double grating with isolator ??? AFR, PMS, SFO \r\nf. Semiconductor Optical Amplifier (SOA) ??? AFR \r\ng. 25G TO-can, TOSA - Allray	2020-12-31	2020-10-09	Not Started	174
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
343	On Time Delivery (Meet monthly and quarterly shipment\r\ntarget)	2020-12-31	2020-10-09	Working	60
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
341	Build die/CoS bank and Modules for high runner devices based on forecast	2020-12-31	2020-10-09	Working	60
361	Increase capacity by introducing third production line.	2020-12-31	2020-10-09	Not Started	289
353	Improve Subcon Planning and Forecasting considering yield issues and sales forecast	2020-12-31	2020-10-09	Working	315
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
379	Continuous support by cross training of operators and technician to provide flexibility on critical process/machines - Q3\r\nCome up of list the training to be completed by self into testing then to take over certification.??\r\n- Planned out the list training to be completed - Q4	2020-12-31	2020-10-09	Working	317
387	Regularly publish Yelo Engineering WO Utilization to support product HTOL and Fab machine qualification - Q3 & Q4	2020-12-31	2020-10-09	Working	324
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
491	a) 100% SOP set up for all steps / New Operator certification b) Enable 2 slot jig for AR/HR coat in Oxford / Trion for longer cavity lengths c) Back up tools qualification / deployment into production by Q2???20 d) Yield system set up by cleaning up using process mapping for SLED / ELED / DFB e) Assign One cost reduction activity per engineer (should cover material cost, gold reduction by integration and resist convergence)	2020-12-31	2020-10-14	Not Started	410
492	a) File atleast one patent or paper or trade secret from Process and Product groups per year b) Cross training on another tool c) Mentor ship by senior engineers to IA students	2020-12-31	2020-10-14	Not Started	411
493	a. Drive CONC to be less than 5% for Y2020. b. NCMR and RMA numbers to be reduced by 30% from last year???s c. SPC system set up at top 5 bins for matured products in Product group. d. SPC to next level in Fab B for i) tool level , ii) Product level, iii) Metrology level - Achieve Cpk > 1.33 & OOC < 10% + investigation on all OOC points e. Improve Fab B WAT yield to 90% by fixing process related issues f. Conduct routine audits and drive Audit findings to closure within 2 months g. PRM / ORT system set up for matured products (ELED / SLED / DFB)	2020-12-31	2020-10-14	Not Started	412
544	1. AL wafer growth (by 31/12/20)\r\n\r\na. CWDM4 high power DFB (6 MQW DFB) \r\nb. CWDM4 B and D version of 25G DML. \r\nc. CWDM6 D version of 25G DML	2020-12-31	2020-10-16	Not Started	114
459	Recipe already frozen for following products in AIX200\r\n- 3036H\r\n- 5169A\r\n- 54708T	2020-09-30	2020-10-14	Working	248
664	Reduce Vendor CoNC by 2% from previous year (2019)	2020-12-31	2020-10-22	Not Started	244
667	Establish remote audit system for top tier (or with high quality issues) raw materials supplier.	2020-12-31	2020-10-22	Not Started	244
471	Transferred the recipe for 3036H product on 21.02.2020.\r\nTo find recipe in DCC please visit below:\r\n\\\\192.168.1.253\\Hemera\\DCC Share\\DCC Approved Documents for all users\\QMS\\FAA Documents\\MOCVD Recipe\r\n\r\nTarget: to transferred all production recipe in DCC folder	2020-02-21	2020-10-14	Working	249
465	Already discussed with team and started working on this task.  The progress in ongoing and discussed during MOCVD meeting.\r\n\r\nTarget: To develop a recipe for RG on grating wafer for G4 MOCVD reactor	2020-11-30	2020-10-14	Working	250
466	Target: To achieve a working BH device by end of 2020\r\n- Growth parameters optimization for the blocking layer RG in MOCVD with minimum leakage	2020-12-31	2020-10-14	Working	251
494	i) Support ???key customer programs (Renesas, 25G DML, Huawei SOA, Panwoo, Almae BH, BW10 and other Laser projects) as per learning cycle plan. Scope issues and ensure successful wafer outcome for realizing revenue / NRE ii) Prelim qualification of ONE Renesas product by end 2020 iii) Drive Fab B process, Product and QA groups to help achieve 2 design wins for 1653DFB, 10G i-temp and 25G DML or High power DFB c-temp. iv) Smooth operations by ensuring back ups for all ???possible??? tools (at inhouse & at external sources) v) Cumulative Yield target of 75% for the year 2020.	2020-12-31	2020-10-14	Not Started	413
495	a. DFB yield improvement to 70% and others (SLED & ELED) to ~ 90% b. Fix process marginality issues (n metal peeling, Ripple fails, p-metal peeling with SiO2 scheme and others) c. WAT yield losses due to Fab B and Product related issues to be < 10% d. Qualify Eulitha for grating writing by end Q3 e. Demonstrate 3 inch wafer process	2020-12-31	2020-10-14	Not Started	414
496	Lead, define and fulfill goals set under KFA 3.1 Cost effective External Manufacturing Strategy	2020-12-31	2020-10-14	Not Started	415
497	Lead, define and fulfill goals set under KFA 1.4 Improve Communication Amongst Team	2020-12-31	2020-10-14	Not Started	415
498	Lead KFA 4 Build and deliver effective and efficient business process??? and systems.	2020-12-31	2020-10-14	Not Started	415
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
514	Reach US$1.54M in the first half of 2020 Reach US$3.6M in the second half of 2020	2020-12-31	2020-10-14	Not Started	420
516	At least 4 design in for 25G laser, SOA or DFB 16xx	2020-12-31	2020-10-14	Not Started	421
517	To determine the effect of MOCVD growth parameters (Fe-flow, V/III ratio) on the carrier concentration of Fe in InP_Fe blocking layers	2020-11-20	2020-10-16	Not Started	226
518	To standardize the in-situ oxide removal (pre-annealing) growth conditions	2020-11-30	2020-10-16	Not Started	226
519	To have a first draft ready for operating and maintenance procedures for G4	2020-11-20	2020-10-16	Not Started	227
521	To find partners or collaborators or place to do CL or u-PL characterization of our wafers.	2020-11-30	2020-10-16	Not Started	441
522	To establish a model to correlate the thickness and composition between planar area and growth in mask opening	2020-12-25	2020-10-16	Not Started	441
524	Increase the MOCVD KPI Yearly by 5 % or maintain the optimum KPI.	2021-01-01	2020-10-16	Not Started	427
525	To demonstrate the possibility of growing Al based 1550 nm devices with required strain and doping	2020-11-30	2020-10-16	Not Started	442
520	To implement SPC for G4:\r\nGrowth rate, Doping etc	2020-11-30	2020-10-16	Working	227
384	Facilitate all communications and setup for Manual and Auto Bar Testing Relay-out\r\n- Review problem of station 4 and station 1 discrepancy - Q4??\r\n- Create proper golden sample qualification system and management Q4.\r\n- Qualification of Fittech die tester.\r\n- Plan a target date  to move Autobar to assembly room	2020-12-31	2020-10-09	Working	322
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
604	First engineering samples of loopback SOA chip and CoS	2020-12-31	2020-10-19	Working	446
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
\.


--
-- Data for Name: GnC_mid_yr_comment_box; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."GnC_mid_yr_comment_box" (id, comment, created_on, appraisal_id, created_by_id, goal_id, user_id) FROM stdin;
9	NIL	2020-11-26 04:07:05.565377+00	\N	1813823810	104	246
13	NIL	2020-11-26 04:55:18.345973+00	\N	135493917	42	251
14	NIL	2020-11-26 04:55:30.837529+00	\N	135493917	27	251
15	NIL	2020-11-26 04:55:45.240997+00	\N	135493917	94	251
16	NIL	2020-11-26 04:55:57.588643+00	\N	135493917	96	251
17	NIL	2020-11-26 04:56:15.26671+00	\N	135493917	95	251
37	NIL	2020-11-26 05:40:36.247321+00	\N	324340084	34	255
38	NIL	2020-11-26 05:40:46.584554+00	\N	324340084	32	255
39	NIL	2020-11-26 05:41:00.929578+00	\N	324340084	33	255
40	NIL	2020-11-26 05:41:10.811982+00	\N	324340084	35	255
41	NIL	2020-11-26 05:41:21.81695+00	\N	324340084	36	255
47	NIL	2020-11-26 05:50:33.411482+00	\N	25957709	185	261
48	NIL	2020-11-26 05:50:45.024138+00	\N	25957709	184	261
49	NIL	2020-11-26 05:50:55.094832+00	\N	25957709	186	261
50	NIL	2020-11-26 05:51:48.376966+00	\N	1813823810	186	246
51	NIL	2020-11-26 05:52:17.166123+00	\N	1813823810	184	246
52	NIL	2020-11-26 05:52:39.783469+00	\N	1813823810	185	246
53	NIL	2020-11-26 05:55:38.012945+00	\N	985791817	90	269
54	NIL	2020-11-26 05:55:48.674734+00	\N	985791817	86	269
55	NIL	2020-11-26 05:56:05.464478+00	\N	985791817	87	269
56	NIL	2020-11-26 05:56:18.097242+00	\N	985791817	88	269
57	NIL	2020-11-26 05:56:29.906742+00	\N	985791817	89	269
59	NIL	2020-11-26 05:59:05.693918+00	\N	1813823810	88	246
42	NIL	2020-11-26 05:44:15.077906+00	\N	1813823810	34	246
43	NIL	2020-11-26 05:44:56.753222+00	\N	1813823810	32	246
46	NIL	2020-11-26 05:47:11.741961+00	\N	1813823810	33	246
44	NIL	2020-11-26 05:45:41.579695+00	\N	1813823810	35	246
45	NIL	2020-11-26 05:46:33.595979+00	\N	1813823810	36	246
4	NIL	2020-11-26 03:58:01.82478+00	\N	534558467	105	257
5	NIL	2020-11-26 04:00:27.560337+00	\N	534558467	102	257
6	NIL	2020-11-26 04:01:17.046723+00	\N	534558467	103	257
3	NIL	2020-11-26 03:56:56.955841+00	\N	534558467	104	257
1	NIL	2020-11-26 03:52:11.277441+00	\N	534558467	106	257
25	CTO Role: Developing company technology strategy to support business goals.\r\n1a) \t(i) Regular updating of company technology roadmap ??? done\r\n\t(ii) Datacom: Mapping Datacom Type-A Intra-DCI (CW-DFB & EML), Type-B Inter-DCI Strategy (coherent)\r\n        (iii) Sensing: Mapping for higher value: MOPA, Optical engine and Interrogators\r\n1b)\t(i) Presented Lunch-time Talk: March2020: Coherent Comms Pluggables\r\n       (ii) Supported BOD on technical due diligence for HTOE acquisition\r\n1c) \tLead/Sponsor KFA5 (New Product Technology Development) ??? yes\r\n1d)\tYes, via various forum: NRE proposals, NPI mtgs, PE mtgs, KFA2.4(Tech mkt)	2020-11-26 05:13:44.422285+00	\N	1135328161	75	262
8	NIL	2020-11-26 04:05:27.920524+00	\N	1813823810	102	246
7	NIL	2020-11-26 04:04:25.03126+00	\N	1813823810	103	246
2	NIL	2020-11-26 03:53:51.369742+00	\N	1813823810	106	246
33	NIL	2020-11-26 05:33:17.980306+00	\N	1813823810	79	246
34	NIL	2020-11-26 05:34:11.080478+00	\N	1813823810	80	246
35	NIL	2020-11-26 05:35:13.282323+00	\N	1813823810	81	246
36	NIL	2020-11-26 05:35:53.316439+00	\N	1813823810	78	246
24	No 3:.Advancing DPHI Platform solutions offering  (New Product Introductions)\r\n\r\n3a) \tDPhi and Optical Engine solutions Technical Directions\r\n???\tDeveloping technical directions for Providing Turnkey Optical Engine Solutions (POC, OE1 & OE2) \r\n???\tDPhi trademark registration filed\r\n???\tContribution to DPhi collaterals and marketing effort\r\n\r\n\r\n3b) DLS-AMF MOU and POC1&2\r\n???\tMOU signing done on 24Aug2020\r\n???\tDeveloped POC1 & POC2 program directions, DLS POC team formed and POC work in progress \r\n \r\n3c)\tDPHI implementation, including HIPP to OE solutions engineering  \r\n???\tDiscussion in progress with Hisense and HGTech for 400G Intra-DCI FR4 OE	2020-11-26 05:13:08.400641+00	\N	1135328161	77	262
30	On track so far	2020-11-26 05:21:05.358395+00	\N	988735390	80	254
26	NIL	2020-11-26 05:15:23.47805+00	\N	1813823810	75	246
27	NIL	2020-11-26 05:16:05.862064+00	\N	1813823810	76	246
28	NIL	2020-11-26 05:16:39.827056+00	\N	1813823810	77	246
11	NIL	2020-11-26 04:44:15.813579+00	\N	135493917	26	251
18	NIL	2020-11-26 05:02:59.646549+00	\N	1813823810	42	246
19	NIL	2020-11-26 05:03:53.877012+00	\N	1813823810	27	246
22	NIL	2020-11-26 05:06:51.792143+00	\N	1813823810	94	246
20	NIL	2020-11-26 05:04:49.40007+00	\N	1813823810	96	246
21	NIL	2020-11-26 05:05:41.200888+00	\N	1813823810	95	246
12	NIL	2020-11-26 04:45:40.507616+00	\N	1813823810	26	246
10	NIL	2020-11-26 04:09:05.828944+00	\N	1813823810	105	246
31	Costing prepared on track	2020-11-26 05:21:15.443183+00	\N	988735390	81	254
32	So far, all closing is within 4 working days	2020-11-26 05:21:32.506802+00	\N	988735390	78	254
29	On track	2020-11-26 05:20:55.863463+00	\N	988735390	79	254
63	NIL	2020-11-26 06:05:21.681328+00	\N	430837474	117	247
64	NIL	2020-11-26 06:05:28.770846+00	\N	430837474	118	247
65	NIL	2020-11-26 06:05:36.378512+00	\N	430837474	112	247
66	NIL	2020-11-26 06:05:49.374241+00	\N	430837474	113	247
67	NIL	2020-11-26 06:06:02.120863+00	\N	430837474	116	247
68	NIL	2020-11-26 06:06:19.042336+00	\N	430837474	115	247
69	NIL	2020-11-26 06:06:31.530888+00	\N	430837474	114	247
70	NIL	2020-11-26 06:07:34.76707+00	\N	1813823810	117	246
71	NIL	2020-11-26 06:07:51.665496+00	\N	1813823810	118	246
72	NIL	2020-11-26 06:08:15.265905+00	\N	1813823810	112	246
73	NIL	2020-11-26 06:08:38.230503+00	\N	1813823810	113	246
74	NIL	2020-11-26 06:08:56.021111+00	\N	1813823810	116	246
75	NIL	2020-11-26 06:09:16.597779+00	\N	1813823810	115	246
76	NIL	2020-11-26 06:09:45.285921+00	\N	1813823810	114	246
81	NIL	2020-11-26 06:17:05.967263+00	\N	1813823810	130	246
82	NIL	2020-11-26 06:17:40.588319+00	\N	1813823810	138	246
83	NIL	2020-11-26 06:18:17.184436+00	\N	1813823810	139	246
84	NIL	2020-11-26 06:18:33.655088+00	\N	1813823810	140	246
85	NIL	2020-11-29 16:04:31.901604+00	\N	985791817	397	269
86	NIL	2020-11-29 16:04:42.753983+00	\N	985791817	398	269
87	NIL	2020-11-29 16:04:59.865828+00	\N	985791817	394	269
88	NIL	2020-11-29 16:05:11.640604+00	\N	985791817	395	269
89	NIL	2020-11-29 16:05:22.094562+00	\N	985791817	396	269
61	NIL	2020-11-26 06:00:51.004696+00	\N	1813823810	90	246
62	NIL	2020-11-26 06:01:28.810268+00	\N	1813823810	86	246
58	NIL	2020-11-26 05:58:20.631936+00	\N	1813823810	87	246
60	NIL	2020-11-26 06:00:01.885886+00	\N	1813823810	89	246
90	Must meet new AOP targets in 2020	2020-11-29 16:12:29.222836+00	\N	1813823810	397	246
91	Great work in improving brand image of DLS.	2020-11-29 16:13:02.429703+00	\N	1813823810	398	246
92	Good job on the SOA, CRM implementation in Odoo.	2020-11-29 16:14:00.905373+00	\N	1813823810	394	246
93	27 new customer wins in Q1-Q3 in 2020. Good job.	2020-11-29 16:15:11.223893+00	\N	1813823810	395	246
94	Not much progress made to date	2020-11-29 16:15:52.17081+00	\N	1813823810	396	246
95	NIL	2020-11-29 16:18:13.011016+00	\N	25957709	420	261
96	NIL	2020-11-29 16:18:26.719663+00	\N	25957709	421	261
97	NIL	2020-11-29 16:18:40.7469+00	\N	25957709	419	261
98	NIL	2020-11-29 16:20:20.545655+00	\N	1813823810	420	246
99	NIL	2020-11-29 16:20:38.174838+00	\N	1813823810	421	246
100	NIL	2020-11-29 16:20:58.496118+00	\N	1813823810	419	246
101	NIL	2020-11-29 16:23:07.511804+00	\N	324340084	412	255
102	NIL	2020-11-29 16:23:19.077288+00	\N	324340084	410	255
103	NIL	2020-11-29 16:23:33.612041+00	\N	324340084	411	255
104	NIL	2020-11-29 16:23:50.239928+00	\N	324340084	413	255
105	NIL	2020-11-29 16:24:07.10871+00	\N	324340084	414	255
106	Progress made on PRM/ORT, Bin Level SPC, audits, CONC	2020-11-29 16:27:38.024769+00	\N	1813823810	412	246
107	Denton Qual has been a major issue	2020-11-29 16:28:42.007962+00	\N	1813823810	410	246
108	No progress here	2020-11-29 16:29:41.127424+00	\N	1813823810	411	246
109	Good support by team for above projects	2020-11-29 16:30:35.743754+00	\N	1813823810	413	246
110	good work on DFB yield and 54708 yield. Need to do 3: demo by year end.	2020-11-29 16:31:07.536189+00	\N	1813823810	414	246
112	Participated a total of 4 Job fairs: a. 20/1/2020 NTU Job Fairs (F2F); NTU Virtual Job Fair 13 - 17.07.20; USPUR 1 - 31.08.20 (Virtual); SG Enable Virtual Training & Career Fair 5 19.09.20 (Virtual)	2020-11-29 16:57:05.379979+00	\N	534558467	360	257
113	Revamped the entire KFA no.1 team leaders. Tirso has completed KFA no.1.1; remaining KFA 1.2 to KFA 1.5 still on-going.  For the Selection Assessment Tool - we will review if we can afford such a system to maintain cost expenditure. This may move to year 2021 for review.	2020-11-29 16:57:39.8112+00	\N	534558467	361	257
114	To date the Voluntary average monthly Turnover for Indirects is at 0.9% (August 2020).  Target for voluntary average monthly indirects Turnover is 1.5%.   We have commenced on different programs e.g. Touch Points survey, HR Chit-chats with employees and Buddy System for new hires.	2020-11-29 16:58:12.142209+00	\N	534558467	362	257
115	To date, we have implemented the salary increment and market adjustment was executed on 01.07.2020. In Oct 2020, the proposal for the operators in-hire rate adjustment that required a compression exercise was discussed and, which will be implemented in Nov 2021.	2020-11-29 16:58:44.906837+00	\N	534558467	363	257
116	Need to do annual talent ranking excercise	2020-11-29 17:24:10.549907+00	\N	1813823810	364	246
117	Hiring process still needs to be fine tuned. Need to get out of watch list of TAFEP.	2020-11-29 17:25:16.960723+00	\N	1813823810	360	246
118	Recruitment process, in particular interview process, needs to be looked at in 2021	2020-11-29 17:25:57.596154+00	\N	1813823810	361	246
119	Attrition has dropped slightly but still above market standard	2020-11-29 17:26:28.168184+00	\N	1813823810	362	246
120	NIL	2020-11-29 17:26:56.504539+00	\N	1813823810	363	246
121	NIL	2020-11-29 17:30:10.191519+00	\N	988735390	401	254
122	NIL	2020-11-29 17:30:26.773036+00	\N	988735390	402	254
123	NIL	2020-11-29 17:30:57.082185+00	\N	988735390	399	254
124	NIL	2020-11-29 17:31:08.953057+00	\N	988735390	400	254
125	Good work here to send report on time.	2020-11-29 17:37:28.166355+00	\N	1813823810	401	246
126	Good job by the team here	2020-11-29 17:37:59.422089+00	\N	1813823810	402	246
127	David has done well in understanding the product costing	2020-11-29 17:39:01.147956+00	\N	1813823810	399	246
128	Very dilligent in this area	2020-11-29 17:39:27.466341+00	\N	1813823810	400	246
77	NIL	2020-11-26 06:13:48.422293+00	\N	759336758	130	252
78	NIL	2020-11-26 06:14:09.492062+00	\N	759336758	138	252
79	NIL	2020-11-26 06:14:31.874084+00	\N	759336758	139	252
80	NIL	2020-11-26 06:14:51.925581+00	\N	759336758	140	252
111	We have finished the Functional Reviews for Operations, Process/Prod Engr, Supply Chain, Sales and we have identified 2 additional section managers - Aaron, Chuan Ye in Subbu's team.  We have also conducted 3 out of 6 leadership training to help the new leaders/supervisor improve their managerial knowledge.	2020-11-29 16:56:31.932722+00	\N	534558467	364	257
239	Based on the schedule given, goals can be achieved by end of the year.	2020-12-12 06:58:11.89996+00	\N	2125149271	258	346
402	Achieve total saving USD$272K for 2020	2020-12-18 03:58:30.32144+00	\N	1904933651	303	281
404	Have weekly meeting with Subcon together with Nee Shiuan. \r\nRequirement from DLS was communicated with Subcon clearly in time.\r\nRequested delivery date was always met.\r\nSUBCON WIP data was maintained properly.	2020-12-18 04:00:39.555547+00	\N	1904933651	304	281
129	a) \t(i) Regular updating of company technology roadmap \r\n\t(ii) Datacom: Mapping Datacom Type-A Intra-DCI (CW-DFB & EML), Type-B Inter-DCI Strategy (coherent)\r\n       \t(iii) Sensing: Mapping for higher value: MOPA, Optical engine and Interrogators\r\nb)\t(i) Presented Lunch-time Talk: March2020: Coherent Comms Pluggables\r\n       \t(ii) Supported BOD on technical due diligence for HTOE acquisition\r\nc) \tLead/Sponsor KFA5 (New Product Technology Development) ??? yes\r\nd)\tYes, via various forum: NRE proposals, NPI mtgs, PE mtgs, KFA2.4(Tech mkt)	2020-11-29 17:44:57.101918+00	\N	1135328161	368	262
130	a) (i) Develop concept for Turnkey Optical Engine Solutions (POC, OE1 & OE2)\r\n    (ii) DPhi trademark registration filed\r\n    (iii) Contribution to DPhi collaterals and marketing effort\r\nb) (i) MOU signing done on 24Aug2020 \r\n    (ii) Devt Phase-1 POC1 & POC2 program plan, DLS POC team formed, POC work in progress\r\nc) (i) DPhi & Optical Engine Phased-concept ppt\r\n    (ii) Discussion in progress with Hisense and HGTech for 400G Intra-DCI FR4 OE	2020-11-29 17:48:10.916543+00	\N	1135328161	366	262
131	a)  Prepared TAM/SAM analysis for Sensing and Datacom market; {coherent, intra-DCI, FOG, OCT) \r\nb)  (i) Technical sales & application advisory: SiLC, InPhi, Luxtera, Elbana, Avophotoics, FOS4X \r\n     (ii) Interrogators: ILM(MOPA), India Railway Project (Redondo & FFT-DAS)\r\nc)  (i) Acacia NRE design proposal, Eloira NRE proposal\r\n    (ii) Northrup Grumman NRE bid:  NRE Technical Proposal developed and presented to NG\r\nd) (i) MOCVD Epi Roadmapping with KFA5.2 & KFA5.4\r\n    (ii) Technical device guidance to NDP: CW-DFB, BH NDP, SOA/GC\r\n    (iii) Denselight patent filing on flip-chip MFA racetrack SOA\r\n    (iv) FOS4X Tech Sales bid and APT build-trail advisory \r\n    (v) Sponsored lunch-time Talk: May2020 by Maumita/KLC on TEC pkg\r\ne) (i) Renesas-DLS Technical analysis for MOU signing\r\n    (ii) Initiated DLS Phase1 technical transfer (done Phase1A)\r\n    (iii) Comment: Renesas corporate change stopped Transfer Program in May2020	2020-11-29 17:49:34.658988+00	\N	1135328161	367	262
132	Need to develop requirements document for each new technology. Can vary from country to country.	2020-11-29 18:44:27.967489+00	\N	1813823810	368	246
133	Good progress to date with seminar being held in Oct 2020	2020-11-29 18:46:07.692277+00	\N	1813823810	366	246
134	Well supported in developing marketing collateral. Good work to date.	2020-11-29 18:46:46.790234+00	\N	1813823810	367	246
135	NIL	2020-11-29 18:51:32.048662+00	\N	430837474	403	247
136	NIL	2020-11-29 18:52:06.289733+00	\N	430837474	404	247
137	NIL	2020-11-29 18:52:31.363565+00	\N	430837474	409	247
138	NIL	2020-11-29 18:53:08.986263+00	\N	430837474	405	247
139	NIL	2020-11-29 18:53:48.507175+00	\N	430837474	406	247
140	NIL	2020-11-29 18:54:07.016104+00	\N	430837474	407	247
141	NIL	2020-11-29 18:54:19.990855+00	\N	430837474	408	247
142	NIL	2020-11-29 18:57:20.851099+00	\N	1813823810	403	246
143	NIL	2020-11-29 18:57:41.019674+00	\N	1813823810	404	246
144	NIL	2020-11-29 18:58:12.998711+00	\N	1813823810	409	246
145	NIL	2020-11-29 18:58:31.708469+00	\N	1813823810	405	246
146	NIL	2020-11-29 18:58:48.460192+00	\N	1813823810	406	246
147	NIL	2020-11-29 18:59:06.53634+00	\N	1813823810	407	246
148	NIL	2020-11-29 18:59:24.800478+00	\N	1813823810	408	246
149	KFA1.4 (Improve communication amongst team)- In progress. Launched Google Chat and next steps is to introduce the entire google ecosystem to improve the collaboration amongst all Denselighters.\r\nKFA3.1 (Cost effective External Manufacturing Strategy) - Subcon strategy is defined. Qualifying new subcons to meet and deliver 25G products to our customers. 2nd source in AFR for FBGL.\r\nKFA4 (Lead KFA 4 Build and deliver effective and\r\nefficient business process??? and systems.) - Overall progress is good.	2020-11-29 19:07:08.418522+00	\N	759336758	415	252
150	2020 CAPEX is managed well and below AOP.\r\nSourced and selected FCM (Travel Management Company) that offer the lowest cost of travel.\r\nOn target to achieve cost savings target >$250k for 2020.\r\nDeveloped the mechanism to track cost savings with Finance.\r\nAll POs are issued timely to suppliers. \r\nGoods flow has been semi-automated to improve efficiency.	2020-11-29 19:07:38.445912+00	\N	759336758	417	252
151	Shipment goals are met for Q1, Q2 and Q3. On track to meet shipment goals for Q4. Overcome challenges that could have derailed our shipment plan like BF10 but we managed to resolve these issues as a team.\r\nAPT cost is below target.\r\nCross training for the engineering and production team on-going.\r\nAttrition rate for the whole department is low. \r\nOEE for test equipment is >60%.	2020-11-29 19:08:14.964522+00	\N	759336758	416	252
152	QBRs are held quarterly with the subcons.\r\nCycle time for all subcons have improved especially Allray, SFO and Coset. Work on going to improve the cycle time at PMS.\r\n1st pass yield for SFO has improved to > 90% with the transfer of ferruling process to the suppliers.\r\nSubcons yield are > 90% for all except PMS. Work in progress to improve their yield together with PE.	2020-11-29 19:08:54.055493+00	\N	759336758	418	252
153	NIL	2020-11-29 19:09:59.553748+00	\N	1813823810	415	246
154	NIL	2020-11-29 19:10:15.932732+00	\N	1813823810	417	246
155	NIL	2020-11-29 19:10:33.267801+00	\N	1813823810	416	246
156	NIL	2020-11-29 19:10:47.955229+00	\N	1813823810	418	246
157	Above was a common goals that every Department head must be embrace, the business situation is not looking good and we had adjusted down these business goals ....	2020-11-29 19:19:06.318717+00	\N	135493917	385	251
158	NIL	2020-11-29 19:19:22.89097+00	\N	135493917	384	251
159	NIL	2020-11-29 19:19:33.620716+00	\N	135493917	383	251
160	NIL	2020-11-29 19:19:44.040574+00	\N	135493917	381	251
161	NIL	2020-11-29 19:19:57.091092+00	\N	135493917	382	251
162	NIL	2020-11-29 19:20:10.57796+00	\N	135493917	380	251
163	Good safety record	2020-11-29 19:23:55.661209+00	\N	1813823810	380	246
164	BS is a good manager but attrition rate is high for direct staff	2020-11-29 19:24:56.325938+00	\N	1813823810	382	246
165	Need to improve operator training in Fab B	2020-11-29 19:25:30.241408+00	\N	1813823810	381	246
166	Need to reduce attrition in direct staff	2020-11-29 19:26:02.386065+00	\N	1813823810	383	246
167	Delayed DMES to Q32020	2020-11-29 19:26:54.906737+00	\N	1813823810	384	246
168	Wafer capacity needs to increase for 2021.	2020-11-29 19:27:41.926176+00	\N	1813823810	385	246
169	Good is good	2020-12-01 13:51:52.202055+00	\N	17	517	364
170	1)  Unable to achieve PO conversion rate of >12% due to COVID-19.\r\n2)  More than 98% RFQ responded within 48hrs with 2% due to delayed information from Engineering team.\r\n3)  Initiated virtual meeting with Optronsicence, EQ Photonics and Viavi during 1st half of 2020 discussing customer demand and potential business opportunities.	2020-12-02 01:50:28.308629+00	\N	1710250857	92	331
171	xiaoyu joined DSL in mid 2020, and can work proactively with Carlan (mentor) on NCMR, RMA and other PE engineering work with reasonably good quality.	2020-12-02 02:42:20.263406+00	\N	861437177	464	265
172	As xiaoyu joined DSL with strong semicon R&D background, I would like xiaoyu to demonstrate some leadership and initiatives on technical paper writing, and progressively help the team to build strong technical fundation for PE department	2020-12-02 02:49:44.595187+00	\N	861437177	466	265
173	For SLED, the challenge is the high mix-low vol nature of the product family, therefore, yield needs to manage by product family sharing the same Epi/chip design and process flow. \r\n\r\nThough most of the yield improvement actions were planned before Xiaoyu joined, xiaoyu picked up very fast, and he can carried out analysis independently most of time and provide direction for yield improvement. He is still learning through OJT, but performance so far is satisfactory.	2020-12-02 02:57:55.437386+00	\N	861437177	461	265
174	So far xiaoyu has completed 4 SFO & 3 AFR sample test, and concluded AFR has better response time (meeting 4s spec) and power stability is also better than SFO.\r\n\r\nXiaoyu: please put down hypothesis and action plan to validate the hypothesis on worse power stability on SFO samples (given the scenario that we win Eloira NRE business and need to qualify SFO)	2020-12-02 06:53:12.290302+00	\N	861437177	462	265
175	Closed  3 RMAs with average 21 days cycle time. Met the 30 days target set by QA.\r\n\r\nPlease get the exact SLED RMA cases closed by PE from QA.	2020-12-02 06:55:16.78155+00	\N	861437177	463	265
176	Upon receiving the task, xiaoyu was still relatively new in DSL, but he still went into details on the market report, and put in extra effort to search and consolidate BW information btw DSL and key competitors, which greatly helped the management team to see the super bandwidth opportunity in 1310nm wavelength range in OCT market.	2020-12-02 07:05:17.249601+00	\N	861437177	465	265
177	Ronaldo joined DSL with strong test and programming background, which can greatly help DSL to enable a lot of test capability setup inhouse, test automation or semi-automation for UPH and cycle time improvement, as well as engineering work efficiency improve through many small scripts to speed up the data collection & compilation. \r\n\r\nTo make full use of his skillset, Ronaldo needs to establish a broader & long term view on how to integrate the scattered efforts from each function, and integrate them into a synchronized direction. This is one level higher than what he is supporting today.	2020-12-02 07:25:04.606489+00	\N	861437177	460	265
178	Ronaldo's strength is the quick data pulling and consolidation, and ensure data accuracy. On this perspective, Ronaldo is probably the fastest among all PE engineers. However, his weakness is on putting up the data in a logical order with good story line. Many time, he tends to focus very much on one particular piece of data, and forget to let management team knows the big picturial view and how is that data link to this picture and direction. \r\n\r\nSecondly, on the low SMSR yield troubleshooting, Ronaldo has not yet shown his ability to deep dive into the grating profile to the SMSR yield. To do that, Ronaldo needs to expose more & learn the analytical skills in making correlation of test yield to Epi structure, Wafer fab process & parameters and x-SEM etc.	2020-12-02 07:50:07.848387+00	\N	861437177	456	265
179	To enable the smooth transfer, Ronaldo needs to study through the phase gate meaning and checklist in details, understand the requirement to exit each phase gate, and define list of outstanding actions that NPD needs to close by each phase gate. Also, basic program management skill training has been provided to him to help him handle this project.	2020-12-02 07:58:08.992285+00	\N	861437177	458	265
180	So far, Ronaldo is very open and readily to take up additional work load or adhoc job assignment on test setup and automation, and he can always help the team greatlly to get engineering test results in an efficient manner.	2020-12-02 08:20:21.446537+00	\N	861437177	459	265
181	I have received my new tasks:\r\n1) 2D Mechanical Drawing for Die Assembly Redesign with submount - done with concept drawing\r\n2) To find know-how on multifiber-to-single fiber technique- ongoing\r\n3) Comparison of different waveguides (AWG, Si waveguide, fiber, Y-branch) according to their specific performance - not started\r\n4) Collaboration with the platform team and light source team via weekly meetings	2020-12-03 02:43:49.730318+00	\N	2076006951	229	342
182	As mentioned above, I am not responsible any more for the above mentioned task.	2020-12-03 02:47:29.855555+00	\N	2076006951	230	342
183	For InPhi:\r\n1) Evaluation of 19141A - done\r\n2) Evaluation of 20132A - ongoing\r\n\r\nFor Raintree:\r\n1) Awaiting for wafer fab out\r\n\r\nFor Sicoya:\r\n1) 20-piece customer shipment - done	2020-12-03 02:53:32.394973+00	\N	2076006951	228	342
184	For High Speed DFB Device:\r\n1) participated in S21 calibration training\r\n\r\nFor High Power DFB Device:\r\n1) Familiarised myself with the test setups and methodology.\r\n2) Able to give feedback to the operator and supervisor after test observations.\r\n\r\nFor SOA:\r\nNo requirements so far	2020-12-03 02:58:46.069147+00	\N	2076006951	231	342
185	On track.	2020-12-03 09:25:40.018495+00	\N	539619816	229	312
187	Following is my observation on Keith performance:\r\n\r\nGood:\r\n1. He is much more confident on Test analysis\r\n2. He is much more familiar with TIBCO tools\r\n3. Taking initiative and ownership\r\n\r\nImprovement:\r\n1. Observation skills need to improve\r\n2. Work delivery is slow	2020-12-03 09:39:45.94931+00	\N	539619816	228	312
188	On track	2020-12-03 09:41:09.721835+00	\N	539619816	231	312
186	This year Keith will not contribute any work for SOA.	2020-12-03 09:26:48.477655+00	\N	539619816	230	312
190	1. 1000 DFB die shipment to Trong Siang for 10mW@85C\r\n2. 500 DFB die shipment to OSI for 20mW@75C\r\n3. a. 20 DFB die shipment to Dust Photonics for 70mW @25C\r\n   b. 20 DFB die shipment to Dust Photonics for 20mW @75C\r\n4. 10 DFB die shipment to Photolex for 20mW@85C\r\n5. 20 DFB die shipment to Sicoya for 25mW@95C\r\n6. Technical specification creation\r\n7. Technical support to Raintree and 500um grating design for Raintree to achieve 70mW@75C	2020-12-03 10:10:41.554734+00	\N	539619816	450	312
191	Leading 6 people from HiPP, PE, MOCVD, Fab B, Simulation, and NPD teams to bring up the broadband (1280 - 1700nm @ 70mW ) SLED for disruptive performance which will help DLS product road map.\r\n\r\nThe project is running at Phase 2.	2020-12-03 10:26:15.568347+00	\N	539619816	449	312
192	Supervising and mentoring 2 people bring their performances up to DLS expectations. \r\nIn addition, the product has been concentrated as follows: \r\n1. a. 1310 70mW@75C has been achieved by 500um (19141A). However, the die was not working as a DFB at 25C\r\n   b. 1310 70mW@75C has been achieved by 1000um (20132A). The previous issue has been eliminated by proper grating design and now die is showing DFB performance from 25C - 75C. However, due to high induced temp. die is misbehaving after 300mA driving current\r\nc. Few more wafers are in line to show the improvement in performance\r\n\r\n2. ELOIRA test results showed the 14PIN BTF works from -40C to 85C by fulfilling customer's requirements and shows turn on within 4s. - Project is successfully transferred to the PE team\r\n\r\n3. 70 pages Summary report for CISCO was submitted successfully.	2020-12-03 10:29:49.658201+00	\N	539619816	451	312
207	1)\tDone, now performing purchasing and basic tracking of materials. \r\n2)\tDone, can produce OGR on her own.\r\n3)\tDone, Siti gives daily update to PPC	2020-12-09 08:17:50.644119+00	\N	1913240580	291	284
208	1)\tFunctional and reduced OGR generation time from hours to tens of minutes. Need to write procedure. Minor bugs still to be fixed. Additional improvements will require process improvements to have all data recorded digitally.\r\n2)\tDone. Require dedicated OSA and Function generator for full capacity. Operator being trained. \r\n3)\tSchedule for Q4\r\n4)\tDone with Siti\r\n5)\tDone\r\n6)\tIn Progress\r\n7)\tIn Progress, may require redesign of PCBA	2020-12-09 08:18:21.719538+00	\N	1913240580	289	284
206	1)\tBuilding Engineering box for 30kHz BF9C Box. Pending development of 10kHz\r\n2)\tNo meeting on KFA	2020-12-09 08:17:22.410292+00	\N	1913240580	290	284
189	A. Create a 100% goal-oriented and task-driven focused organization by introducing disruptive 1310 CW 70mW @70C product compared to the competitors by Q4'20 \r\n1. a. 1310 70mW@75C has been achieved by 500um (19141A). However, the die was not working as a DFB at 25C\r\n   b. 1310 70mW@75C has been achieved by 1000um (20132A). The previous issue has been eliminated by proper grating design and now die is showing DFB performance from 25C - 75C. However, due to high induced temp. die is misbehaving after 300mA driving current\r\nc. Few more wafers are in line to show the improvement in performance\r\n\r\nB. All technical internal audit has been carried out and helped NPD to process through Audit check.	2020-12-03 10:03:04.249536+00	\N	539619816	448	312
193	ELED test yield is mainly dominated by unstable and high variation of ripple yield loss. Team was working in parallel on variation control by identifying toggling factors like test, ridge etch profile etc, as well as laser chip design optimization (by adopting the SLED absorber & tapered ridge design). Carlan was working proactively and diligently on both paths. He was also learning by OJT on process & design factors toggling ripple.	2020-12-07 06:58:38.901971+00	\N	861437177	342	265
200	Despite the heavy work load & pressure to recover back ELED yield while Carlan newly took over from Hafiz in May, Carlan stayed very positive and showed strong sense of ownership on these NPD/NRE project. For 1650nm FP laser, two customers engaged, and 10 samples order received as of Dec'20.  For OSI, 1310nm bulk design passed the customer's power and back reflection spec, but 1550nm need to re-design the bulk Epi structure to meet the power spec	2020-12-09 02:50:39.881955+00	\N	861437177	344	265
201	However, the ???proactive??? mindset still needs to enhance as part of working culture change needs for PE team especially on revenue support, as many times PE support were constrained by the mindset and way-of-working from PPC & supply chain (e.g the new epi growth needs, inventory status, PO status & gap, PE needs to proactively trigger PPC to share and make decision accordingly)	2020-12-09 02:52:43.683315+00	\N	861437177	472	265
202	1. Something commendable about Carlan is his leadership potential. Through the training of new staff, Carlan demonstrated a very good coaching skills by explaining things in a logical order, and easy for others to understand & hands on. Carlan also has the potential to see big picture, and put his insights in sharing knowledge and project direction with his big pictorial view. \r\n2. Through the training to sales team, it can also see that Carlan did a lot of home work to package him with strong technical background and understanding on ELED and SLED.	2020-12-09 02:54:07.477871+00	\N	861437177	473	265
203	Carlan is strong in data analysis and technical issue troubleshooting, and has been working extensively with MOCVD team and hafiz previously on SLED Epi structure optimization for Power/BW and yield improvement. He also worked aggressively on ELED chip design optimization for ripple baseline improvement. Carlan not only focus on data analysis, but would also deep dive into the technical background and mechanism to link or support the Epi or chip design improvement direction and test data validation. This is very good, and as he is gaining more & more experience and knowledge on design & process factors impact to test parameters, he will surely improve his efficiency on problem solving moving forward.	2020-12-09 02:55:09.731375+00	\N	861437177	343	265
204	1)\tMeet forecast but currently some issues to resolve on the BF10.\r\n2)\tCurrently 127 completed, 4 troubleshooting, 6 failed, 92.7%\r\n3)\tZero safety incidents to date\r\n4)\tWorking on obsolete parts (Power adaptor & Zarlink IC), otherwise ok.\r\n5)\tIn progress. PM checklist is defined but items need to be reviewed.	2020-12-09 08:07:39.972685+00	\N	1913240580	288	284
209	Despite the economy downturns. I have contributed to bring in $350k revenue to the company for winning the business with Polytech. \r\nThough this will not happen this year due to the long lead time of the components but its already a deliverables for next year.	2020-12-10 03:54:47.461394+00	\N	1014312820	172	329
205	1. Being the previous owner for DFB 16xx, and also the original owner who drove the Almae yield from 20% to 70% level through the grating profile optimization, Zuhdi has taken up the SMSR yield improvement role again when he joined back DSL in Aug???20. \r\n2. His analytical skills and knowledge in opto-electronics has fully demonstrated in this assignment, and he can do technical deep diving, create logical link to the big data base, and is able to filter noise data and guide management team to the right direction for improvement. This is clearly a strong area I observed on Zuhdi. He should keep it up and utilize his strength in other job assignment on technical issue troubleshooting and data analysis.	2020-12-09 08:09:31.67883+00	\N	861437177	351	265
194	1) Have shipped a number of BF9C box with linewidth lower than 50Khz for samples. NPD still working on the 10khz versions. \r\n\r\n2) For panwoo, we have actually packaged successful BTF units with AFR and sent samples to customer. Now we are in the optimization phase to get better yield wafers and to increase the power.	2020-12-07 07:05:36.261017+00	\N	973701598	295	271
195	1. Baseline SoWs have all been generated. Approval processes in progress.\r\n2. Yields - 90% yields seen generally for high runner production parts. Yield for FBGL is fluactuting partly due to engineering uncertainties. SFO still has low yield in ILM boxes.\r\n3. CT improved to 3 weeks at Allray and 4 weeks at SFO. Coset is 4-5 weeks, PMS is >6 weeks due mostly to FBGL yield issues.\r\n4. Qualification is done. Yield is >90% based on small sample sizes.\r\n5. Hisense documentation and test correlation are ready however manufacturing has not started due to no sale of parts yet.\r\n6. AFR identified as alternative subcon for 8-pin and 14-p[in FBGL lasers and already used as supplier for engineering parts. Full qualification for production parts in-progress. ELED TO Can suppliers have not been found but put on-hold since Allray can support full volume at the moment.	2020-12-08 07:51:20.364508+00	\N	50985924	173	295
196	- Except for 14-pin BTF narrow linewidth laser with isolator, all projects have been successful (they all have a working product).\r\n- New product development procedure for design and assembly at subcons has been established and agreed upon by NPD and PE groups.	2020-12-08 09:56:53.685547+00	\N	50985924	174	295
197	- Recipe for die attach of low DOP products have been developed.\r\n- Auto COS tester - Yelo--> supported development but Yelo is unable to come up with a working design\r\n- Chip tester - Fittech--> Buyoff is underway\r\n- VI system - on-hold	2020-12-08 10:02:03.315952+00	\N	50985924	175	295
198	- KFA1.4: Helped in implementing Google Suite and usage of Google Chat has increased\r\n- KFA3.1: Implemented main-backup supplier system and new suppliers have been used as backup\r\n- KFA4.3: STR report is complete. WAT and OGR have been completed but various improvements needed.	2020-12-08 10:04:51.087906+00	\N	50985924	176	295
199	1. Closed 3 RMAs with average 21 days cycle time. Met the 30 days target set by QA.\r\n2. Closed 7 NCMRs for ELED/SLED with average 77 days cycle time. Higher than 30 days target, but this is comparable to other department.\r\n3. Many of PE NCMR is low yield wafers, and yield target was set too high to trigger NCMR, PE has worked with QA to re-set the yield target to reflect the true yield performance & low yield triggering point.	2020-12-09 02:48:36.817507+00	\N	861437177	471	265
211	KFA 1.3 All the activities as per planned every month went well.\r\n\r\nKFA 4.3 only involved in the planning phase and embark with other automation projects as aligned to i4.0 such as WO automation and Utilization tracking.	2020-12-10 05:08:43.162614+00	\N	1014312820	165	329
213	1. Firstly, as one of the previous ILM Box owner, Zuhdi picked up very fast and rendered adequately good support to ensure the timely revenue shipment. Secondly, the ILM Box way of working and ownership is quite messy before NPD transfer ownership to PE. Despites the daily ???surprises??? here and there, Zuhdi is proactively taking up ownership to link up all broken pieces together to back fill the gaps.\r\n2. Overall, Zuhdi has the knowledge and deep diving ability on challenging technical issues. Moving forward, if Zuhdi can further improve in the ability to do multi-tasking, that will be even better for his own growth & development as well as creating more values to the PE team.	2020-12-10 05:15:11.322234+00	\N	861437177	355	265
215	Internally, the plan to re-layout APT to support the revenue ramp has been completed . \r\nAs a result, it reduces the distance travelled by operator from one workstation to another by 56% as test and assembly are already in the same area. By using the IE tool such as relationship diagram the relevant/related workstations are shifted near with each other which is also a factor in improvement process.\r\nThe progress of adhering to the proposed layout is currently at 95% progress.	2020-12-10 05:19:57.763599+00	\N	1014312820	167	329
216	1. There are still many unknown technical issues on NLW laser, COS to module process interaction, as well as COS & module to box assembly process interaction.\r\n2. Moving forward, in terms of PE resources, there is plan for another FBGL module/ILM box PE head count to be hired, and Zuhdi needs to coach and guide him/her on the ILM box related problem solving. The goal is to ultimately establish clear understanding on the various technical issues to ensure smooth production ramp, on time customer delivery and good quality products.	2020-12-10 05:32:20.982401+00	\N	861437177	369	265
214	Had already fulfilled the required number of headcount in APT for 1H of 2020 based on the actual APT loading. However, in 2H onwards I am no longer directly involve in APT headcount.\r\nAlthough, I have built up a model to determine the number of headcount required based on demand/forecast which can help the supervisor to determine the requirement.	2020-12-10 05:15:27.617336+00	\N	1014312820	177	329
217	With his data management background, Zuhdi hands on very fast after he re-joined back DSL. He has clear direction how to drive the individual database infrastructure, and bring all different blocks together. What he needs to learn moving forward is how to utilize higher management power to help him drive the work at the working level. It???s inevitably in a working place, many people need the top-down force to deliver tasks, especially areas not in their priority. It???s part of self-growing process that Zuhdi needs to learn.	2020-12-10 06:18:41.376446+00	\N	861437177	354	265
218	Again, with Zuhdi???s knowledge and experience in data management system, and in particular his past experience in partnering with Pointstar, Zuhdi contributed valuable inputs to guide the management team to negotiate on the software deliverables and make the right decision. Project was delayed few months due to some server migration issue at the vendor side, and now is back on track to launch by end of 2020.	2020-12-10 06:33:29.839404+00	\N	861437177	353	265
219	So far only one internal working meeting between Zuhdi and other PE engineers to deep dive into the simulation tool, need mid-long term plan to slowly establish the simulation capability within PE team. If need external support, let's put down the requirements as well.	2020-12-10 06:37:47.211541+00	\N	861437177	357	265
221	On track	2020-12-10 07:43:47.706947+00	\N	6	82	279
222	Not done due to circuit breaker mostly working from home.	2020-12-10 07:45:13.776849+00	\N	6	83	279
223	On track	2020-12-10 07:49:36.887902+00	\N	6	85	279
224	To be done by year end.	2020-12-10 07:50:16.849567+00	\N	6	84	279
212	Considerably, my deliverables and involvement has been completed at this way back then.	2020-12-10 05:11:47.278512+00	\N	1014312820	168	329
238	Initial qualification data and the trial run on engineering wafers are good. TECN was raised to use for production for one month. Pending  TECN execution.	2020-12-12 03:00:02.780603+00	\N	206959734	129	297
243	Clean process with SRD shows good results for epi regrowth. However, need to work on solution for non-full wafers or wafers with cracks that cannot use SRD.\r\n\r\nWet etch process uniformity and repeatability is still a challenge. Will need to evaluate new etch recipe with Br2.\r\n\r\nEngineering mask with different biases and designs have been tapeout for BH (Octans, Sika)	2020-12-14 02:39:49.890716+00	\N	439847763	61	325
242	Simon has provided support in running multiple wafers requested from the program. \r\n\r\nUnfortunately, PCO attack from Trion SiON has resulted in inconsistent wafer quality. However, he has done well in compiling the data on PCO attack.	2020-12-14 02:34:10.926888+00	\N	439847763	64	325
241	Santosh has qualified flow for 25G. Progress has been made to localised passivation which is being implemented as the new POR for i-temp. \r\n\r\nExperiments for current blocking and reverse ridge have been supported but put on hold as they may not be required. No requirements on FC for now.	2020-12-14 02:30:11.298282+00	\N	439847763	63	325
244	Need to work on this aspect more, especially on window checks. Several problems in the line now are due to process/equipment variability that are failing due to lack of process margin (e.g. nodules, SiON delamination).	2020-12-14 02:43:09.293778+00	\N	439847763	69	325
245	Simon has provided support in running wafers requested by the program.\r\n\r\nNo requirements to run FC yet.	2020-12-14 02:46:01.207785+00	\N	439847763	65	325
246	Simon has provided support in running the 3" wafers. Main delays have been from scheduling priority. Most 3" processing completed except for final obstacles on 3" RTP. Work on 3" plating (not required for current wafer) is also still ongoing.	2020-12-14 02:50:21.158908+00	\N	439847763	66	325
247	Need to finalise and work with module team on training materials, especially due to high turnover rate. Will work together with updating documents for ISO.	2020-12-14 02:52:13.903989+00	\N	439847763	67	325
248	Simon has worked well with Rebecca to implement features in DMES required for supporting engineering wafers. There are still some minor bugs that need to be ironed out but DMES is now being used for all production wafers and most engineering wafers.	2020-12-14 02:55:32.445902+00	\N	439847763	68	325
249	Some initial discussions have been done with Santosh and Simon. No progress so far.	2020-12-14 02:58:11.862395+00	\N	439847763	70	325
250	Santosh has supported runsheet creation of multiple flows and masksets requested from POET. Need to work with him to check process margins which had led to issues such as HME over etch and plating nodules/horns.	2020-12-14 03:05:13.515038+00	\N	439847763	62	325
272	1. Created presentation for SLED/ELED process step.\r\n2. Currently supporting disposition for Litho step.\r\n3. Continuously participated and highlighted to the group the abnormalities found on the wafer.	2020-12-14 14:30:10.780593+00	\N	249343659	55	291
273	1. Target TAT for Internal is more 1 day due to high volume of request.\r\n2. Target TAT for External is continuously met of less than 3 days\r\n3. Continuously maintaining wafer disposition to 4 hours.\r\n4. Continuously organizing FA library for Internal and External FA data.	2020-12-14 14:32:22.668917+00	\N	249343659	56	291
220	Done research and benchmarking on other renowned semiconductor companies around the globe to understand and more importantly, execute the Kaizen projects with results. \r\nThe mainframe has been created and presented to management during the Operational Excellence reviews. However, due to lack of intern or a 3rd headcount to establish and ensure continuity of this system, the project was placed on hold. There was no or very low application for an IE internship when it was posted. Next steps was to build a Job Description for a full time junior IE/IT role. The justification for this needs more thoughts to fill up the executive time fruitfully for 40-45 hrs a work week, and building more projects to accommodate this will be the key next step.\r\n                                              \r\nKFA 4.1 - WIP management thru ODOO was a success story and though there are many nicks along the way, it was overcame diligently. This road to fully cross between APT (Assy) to Fab B (Coating) back to APT (Assy and Test) right thru SubCon and back again to APT in various product form takes time to be developed inside the Odoo system. Traveller sheet has been re-designed, the sun-con invoice details is underway plus a few more milestones needs to be established before this goes life. A lot of time and resources has been used as a concerted effort to get this going, and once system wise ready, the journey will be to internalize the the new way of going things which is inline with the i4.0 where productivity thru automation replaces manual way of executing non value added jobs. \r\n\r\nKFA4.3 - Led by Nee Shiuan and he's on track with all his automation projects which by and large needs the expertise of PE\r\n\r\nBi Weekly Meeting has been setup with the President and CEO with the Head of Supply Chain to run thru the key projects and the deliverables in line with the company's objectives.	2020-12-10 06:55:01.810857+00	\N	1982477965	298	266
225	Several charts has been created using limited data we had initially to build an APT WIP profile thru Odoo automation as a mini ERP system. This is not only limited to WIP profile, but also as aging WIP, Queue time pareto by tool type, and many other customizable charts and trends for analysis.\r\n\r\nTraveler has has been added into Odoo as opposed to hard copy. Invoicing thru Odoo for sub con and tracking is currently underway. \r\n\r\nSo far, the ODOO system is a working solution but is only 65%-70% completed. This journey will be part of a continuous improvement item where the sky will be the limit as new and improved solutions becomes available over time. The last 15%-20% will be the toughest as it will link up the overall structure from W/O release till shipment and linking materials and sub-con as a whole WIP management solution,	2020-12-10 08:22:10.794233+00	\N	1982477965	297	266
226	Introduce OEE thru in house developed sensors. This is a major milestone in DLS APT as this is a real time measurement by the minute of a sensor hooked up . The dashboard is a very good indicator of the progress made in terms of automating solutions to boost productivity in APT first before moving across Fab A and Fab B.\r\n\r\nEngaged several government arms for support of grants, eg Enterprise Singapore, EDB , WSG , SSG to explore feasibility to enable i4.0 digital transformation to DLS. This is still work in progress. Although, the work done has not reaped any fruits in terms of financials, but the network which connected DLS to the next in-line projects in the near future to help boost either human capital building of to be given a grant for hardware/software solutions has been established	2020-12-10 08:27:58.299209+00	\N	1982477965	296	266
227	-\tCurrently averaging around 75% cumulative yield but challenge is the BTD VI yield and the CBT test yield.\r\n-\tWAT program done by ronaldo. In trials and raise document for procedure.\r\n-\tCurrently with Daitron the cycle time has actually improved for ELED by already more than 15%.  From previous 1.5 weeks to 5-7 days.\r\n-       Training plan in development.	2020-12-11 02:13:36.363804+00	\N	973701598	294	271
232	1) Maintain >90% machine uptime through regular maintenance  and prompt \r\n    corrective/proactive action on breakdown occurrence.\r\n2) Maintain >85% overall yield by regularly visual Inspection buy-off and \r\n    implement corrective action. Avoid tester related defects by implementing SPC \r\n     and OCAP.\r\n3) Trained and certified 3 new operators and 1 flex operator into ILX and Yelo \r\n    Burn-in.	2020-12-11 15:45:38.678523+00	\N	1536568573	323	288
228	-\tCurrent total revenue 2.2mil vs the revised target of 10.8mil \r\n-\tILM engineering samples from sales requirement were shipped.\r\n-       Met shipment for the shipment of required engineering samples available for DFB and 25G.	2020-12-11 02:17:28.01417+00	\N	973701598	292	271
229	Chip tester will be delivered in August. To install by Q3. VI station replaced with internal improvement activities\r\nAutomated CoS tester expect to complete by mid August.  Re-layout plan complete delayed due to thermostream test for Eloria. \r\nNo additional expansion activities for 2020.	2020-12-11 02:21:31.950118+00	\N	973701598	293	271
210	The method of tracking the WIP and Utilization has been successfully automated thru Odoo and with our very own inhouse solution for tracking utilization.\r\nData can now be used for tracking tool performance from 2H onwards. \r\n\r\nKey benefits on the other hand, is efficiency. It makes the supervisor more efficient, time save after having this system is equivalent to 13 man-hours per month since the data is already available in real-time and in a few clicks.	2020-12-10 04:01:49.124025+00	\N	1014312820	164	329
231	Q2 -Manage to maximize Yelo Burn-in utilization/capacity per slot (32pcs) by qualifying to load multiple WO per JIG with same temperature. Before, we load one jig per EWO that limits only into ~15pcs per jig.                 \r\nQ2 - Drive the ILX burn-in restoration resulting to 5-10% capacity improvement on \r\nboth COS and Module.\r\nQ3 - Qualify additional 2 COS jig capacity for Yelo Burn-in.\r\nQ3 - Additional ILX module capacity from 20pcs to 30pcs by converting and \r\n         repairing COS farm into module\r\nQ4: Facilitate the transfer of Manual Station1 and 4 by doing before and after GRR and reference units buy-off. This include also the manual labor transfer and \r\nset up of the machines.\r\nQ4 Drive the detail investigation and finding the 1-3mW power delta between 2 \r\n   station and fixing it through TEC, PD and Source meter calibration. This entails \r\n    saving 35KUSD by not buying new instrument.	2020-12-11 15:38:57.052884+00	\N	1536568573	322	288
233	Regularly monitor and publish Yelo EWO for HTOL and Machine qualification and support the Burn-in profile generations. This contributes to qualification of new machines (Trion, G4 and Denton) and products (TO can & DFB)\r\n\r\nDedicated 4Pin TO can Jig to avoid wrong DUT insertion and cause damage to the parts. Also evaluate the splitter concept.	2020-12-11 15:55:03.661639+00	\N	1536568573	324	288
230	1) Flexibility -2 Burn-in operators were now qualified to run ILX and Yelo Burn-in \r\n2) Productivity ??? Improve the Auto Bar UPH by installation of Cooler. Also attend \r\n    to critical ILX module conversion from DIL to BTF14 that increase capacity from\r\n    18pcs to 24pcs.	2020-12-11 15:29:50.500703+00	\N	1536568573	317	288
234	APT representative for KFA 3, S.I. # 3.5 Develop Quality Management System for Manufacturing (Internal & External)	2020-12-11 16:00:34.565619+00	\N	1536568573	484	288
235	1st 3" product wafer completed and pending for the yield result.	2020-12-12 02:42:17.032628+00	\N	206959734	128	297
236	Successfully delivered the requests based on the process requirement from different process owner.	2020-12-12 02:47:03.8564+00	\N	206959734	125	297
237	Due to hard ware issue, process qualification had stopped and pending for the parts	2020-12-12 02:52:04.159889+00	\N	206959734	127	297
267	To deliver any revenue goals, the contribution from Operational Excellence will come from ingenuity to deliver productivity improvement tools for the end user to use as a tool to improve their overall KPIs deliverables. Building accurate dashboards (Eg OTD Dashboards), Kaizen boards on the shop-floor, WIP management thru automation (Odoo) and thruput tracking thru automation (Odoo and in house sensors) becomes a key for this deliverable.	2020-12-14 08:35:50.938246+00	\N	1982477965	172	266
252	As the key person building up PE database, Jaslyn's main focus was on improving the timeliness of ELED/SLED database in TIBCO, as this is extremely important to enable real time product test issue troubleshooting and engineering data characterization and analysis. For this project, Jaslyn is supporting Carlan on the Autobar station database enhancement. Moving forward, Jaslyn should take more initiative to understand the database needs from PE end users (all the product owners), and come out strategical plan to improve database integrity and timeliness. She should also work proactively to drive other functions (like APT) to improve data accuracy & speed on data readiness in TIBCO.	2020-12-14 04:53:25.485394+00	\N	861437177	136	265
253	Jaslyn is new to yield reporting system and yield management system. For 2020, Jacquelyn was leading the effort to establish ELED, SLED process flow, established & aligned the integral yield calculation model, and guidelines on managing the yield  data, while Jaslyn is supporting Jacquelyn to pull the data, follow the yield model to do weekly yield reporting. Moving forward in 2021, as Jaslyn is now familiar with the yield management system concept, she needs to put more thought process, and give her insights how to improve the yield reporting system, and strategy to incorporate more new products going to release into production next year.	2020-12-14 05:35:41.35416+00	\N	861437177	137	265
254	Again Jaslyn is new to the yield management & yield dashboard. Main effort led by Jacquelyn with the rest of PE and Subbu to establish the yield dashboard template. As Jaslyn holds a role on PE data management system/improvement, her role is critical and also linked tightly with the yield reporting & management. Therefore, the expection to her is to demonstrate more initiative & drive to contribute on the strategical plan and road map on yield management system moving forward. Today, she is working as a supporting role mainly.	2020-12-14 06:05:39.727781+00	\N	861437177	482	265
255	I would say from Q1-Q3???20, PE product engineers were still struggling pretty much to ask for ???case-by-case??? basis on the data readiness in TIBCO for weekly yield analysis, engineering DOE and issue troubleshooting, as there are weeks delay on the data readiness in TIBCO. Situation improved in earlier Q4???20 with more structural way to review and highlight the gaps in database system. Now the data readiness gap improved to be within 24hrs.\r\n\r\nMoving forward, expectation for Jaslyn as the key person on data management system, needs to drive the database gap by proactively working with PE product owners, understand the big pictorial view of database future direction, and come out breakthrough ideas, improvement plan and drive all parties to bring the whole database system to the next level.	2020-12-14 06:32:58.002001+00	\N	861437177	483	265
257	The procedure wise already setup for lapping area. The ESC bonding method is pending for the money release to get the new tool, estimate end of Q1 can do the evaluation.	2020-12-14 06:37:53.262836+00	\N	1776097184	144	285
258	Most of the projects have been finished. Mainly left 15nXT project due to resist difficult to remove after PLT process. To evaluate PG/Ultrosonic+APT ASH to solve the issue since 15nXT can define the pattern much better than SU8.	2020-12-14 06:46:06.75222+00	\N	1776097184	142	285
259	Trained operator ZQ and Sri for Litho process. Trained Sri for lapping process. Trained the internship student for lapping process.	2020-12-14 06:49:23.170846+00	\N	1776097184	146	285
256	The frequent happen issues in litho/lap area already reduced and improved with the new material/method. \r\nFor personal: TF process learning is ongoing. Estimate to involve more after Litho new engineer join.	2020-12-14 06:34:00.192804+00	\N	1776097184	141	285
260	All the identified projects have been gone through and confirmed the tool need. Now pending the budget release in Q1'21 to purchase.	2020-12-14 06:52:36.472456+00	\N	1776097184	198	285
261	Litho 3" chuck sourcing and purchase ok. coating recipes all optimized ok with good patterning. And litho rework rate continue improve to less than 5% level. Once 15nXT can qualify ok, rework rate can further reduce to ~1% level.	2020-12-14 06:57:06.886159+00	\N	1776097184	145	285
251	Sputter-02:\r\ni) run as batch of 4-wafer- implemented\r\nii) Dummy run wafer thickness from 2000 A to 500A- Recipe modified\r\niii) Eliminate dummy run- Now, only after PM\r\niv) Eliminate calibration wafer & use Actual run instead - Implemented & added in SPC\r\nv) Amend SOP-Pending\r\nPlating:\r\nUpdated the criteria for Au solution top up and added in SPC table. \r\nDummy run for 5 minutes daily. Need to reduce to 2 minutes- Jan-21\r\nAmend SOP- Pending- Jan 21\r\nE-Beam: \r\n1.  Plan for the new stem implementation\r\n2. Qty for evaporation is fixed for every run.\r\n3. Implemented batch run.\r\n4. Tool modification-\r\ni) remove mask in chamber -pending\r\nii) reduce distance between wafer and crucible -pending\r\n5. SOP pending\r\nNew time line: Jan-21	2020-12-14 04:05:30.189733+00	\N	1723530200	163	315
268	Supervisor has changed and this becomes not applicable	2020-12-14 08:36:28.022781+00	\N	1982477965	177	266
262	able to assist to close account within 4 days	2020-12-14 08:08:08.791648+00	\N	104959828	37	334
263	able to pay vendor within the constraint of cashflow and notify vendor when payment is made	2020-12-14 08:11:07.728126+00	\N	104959828	38	334
264	DSO less than 45days	2020-12-14 08:16:15.038961+00	\N	104959828	39	334
265	not done, as circuit beaker, mostly work from home.	2020-12-14 08:20:32.3199+00	\N	104959828	40	334
266	Tracking of excel manually is being presented by APT supervisor on the Aging WIP and Utilization although data accuracy is really in question during the 1H of 2020. 2H of 2020 of further automating the various typical semiconductor WIP reports with data accuracy thru W/O automation in ODOO is pivotal for measurement of success. A lot of time and effort from various department has been consumed as a concerted effort and this needs to be delivered. This needs to be driven and well communicated , and must Go-Live after cleaning up the pathway and road-blocks faced by the end users. \r\nThe utilization tracking using IoT sensors is a success as the AutoBar and Manual Station reports are validated to be accurate. The plan is to have the utilization reports fully accurate and validated before 2H of 2020 ends.	2020-12-14 08:34:29.017592+00	\N	1982477965	164	266
269	1) Need to fine tune the capacity model which has to be interactive with dynamic demand forecast , and the industrial parameters/ assumptions needs to refine - The weakness of the model is the UPH where there's no check and balance and accuracy is in question. Will need to improve this further as a overall capacity model in the 2H \r\n2) Re-Lay out underway by the APT team in the 2H.	2020-12-14 08:37:20.261398+00	\N	1982477965	167	266
270	Early Participation achieved in the KFA 1.3 , not much contribution on KFA 4.3 although both KFA's been led well by their leaders with some results with help from Syrex	2020-12-14 08:38:06.026895+00	\N	1982477965	165	266
271	Achieved goal in the 1H chipping in to validate structure driven by PE	2020-12-14 08:38:54.937234+00	\N	1982477965	168	266
392	Colleague shows good commitment on Revenue delivery. Materials are also well managed	2020-12-18 01:40:40.001871+00	\N	973701598	307	271
274	1. Housekeeping/5S are continuously maintained and performed.\r\n2. Machine is continuously well maintain.\r\n3. FA consumables are still control and did not purchase any consumables.	2020-12-14 14:32:59.944349+00	\N	249343659	57	291
275	1. Continuously support Internal and External FA request.\r\n2. Currently supporting Litho disposition and other assigned task.	2020-12-14 14:33:39.536719+00	\N	249343659	58	291
276	1. Continuously learning and familiarizing various laser process on the Fab.\r\n2. Currently giving disposition on Litho step	2020-12-14 14:34:12.398593+00	\N	249343659	59	291
278	Agreed	2020-12-15 02:09:03.162728+00	\N	988735390	82	254
280	Percentage of equipment downtimes that meets our goal of within 4% is 4.3 %, while 4.3 % that did not meets goals are mainly due to\r\nSystems/Parts obsolete issue(like Deve-01  parts ,Plating part).\r\nThe Unscheduled broke down for some major equipment .(like Sput tools, Deve tools, RTP and etchers.)\r\nDuring Oxford system upgrade, unforeseen Part broke down causing delay and huge downtime while waiting for obsoleted rf gens and Parts.\r\nDenton i29 system ???unstable??? condition causing downtime\r\nIn process in Some Tools upgrade to 3???\r\nOur guys (rated avg 50-66%) not well trained on all equipment.	2020-12-15 02:28:52.67109+00	\N	5	262	260
282	Deliver wafers on time with quality to realize NRE milestones :\r\n1) Develop 25G DML FC process to meet customer product requirements : 4 AXEW full wafers have been processed. Wafers are functional. Matched the physical specifications, which was confirmed by POET.\r\n2) Develop BH DFB FC process to meet customer product requirements: Burmy wafers have been processed successfully and Deino full loop and short loop wafers have been processed. Pending customer feedback.\r\n3) 25G non-FC process developments are as below: a) Solved gold step coverage issue for 25G DML non-FC process for POR process (c-temp) without any Au wet etch b) Passed 2825hrs HTOL , 9 devices continue stable. TO Package passed 25C, 75C and 85C for POR process (c-temp) c) Developed the 25G DML non-FC process with Localized Passivation: met the requirements of i-temp and more wafers are running. d) Developed the 25G DML non-FC process with reverse ridge formation and the result is not so positive. e) Developed the 25G DML non-FC process with current blocking etch and is pending for testing.	2020-12-15 02:38:15.814084+00	\N	673813648	119	324
283	Understand every individual (engineers) capabilities/weakness with rated chart and provide better training program(OJT) to individual and group. - done .\r\nIdentify right training program for our engineer. Budget need for external Training if possible - ongoing	2020-12-15 02:39:03.913985+00	\N	5	265	260
284	1) Fix PML and SION/SiO2 film peeling issues for 25G DML process : Low stress film is being developed. Evaluation wafer SIO2 film in Oxford passed delamination verification after p-RTP. 2) PCO SION spacer shoulder drop cause wafer yield issue: Evaluation is on going. \r\n3) Fix HME Wet etch over etch issues: Monitoring dummy InP etch rate before processing POET wafers.	2020-12-15 02:43:43.344573+00	\N	673813648	121	324
281	Safety -Review and Improvement on the Preventive Maintenance. Ongoing\r\nReview and Improvement on the Work procedure on the equipment with it???s safety concern. Ongoing  \r\nReview and Improvement on the existing Equipment Risk Assessment. Ongoing\r\n6S and House keeping -Self conduct regularly check and Maintain.	2020-12-15 02:34:24.056857+00	\N	5	264	260
285	Good work on shipment delivery. Yields are on target but need to improve as production volume increases	2020-12-15 02:46:01.355552+00	\N	973701598	288	271
286	Good support to NPD on the sample builds. As the progress becomes closer to development need to work on improving cycle time.	2020-12-15 02:47:38.546533+00	\N	973701598	290	271
287	Good job in all the actions required to improve the cycle time on shipment. Next quarter need to focus on getting the replacement materials for the boxes.	2020-12-15 02:48:24.186918+00	\N	973701598	289	271
288	Very good job training and educating the AE. Need to keep it up.	2020-12-15 02:49:27.971622+00	\N	973701598	291	271
290	1) Mentor new hires to bring them into working level:  mentored Loui Fan.\r\n2) Professional conversion program (PCP) for new employees : PCP completed for Simon Huang. \r\n3) Learn Laser device physics : Continuous\r\n4) Develop leadership skills to lead the team: Learning (continuous)	2020-12-15 02:52:53.774587+00	\N	673813648	123	324
240	1) Recipe development and optimization with optilayer software on-going. \r\n\r\n2) Currently able to operate Denton I29 independently without supervision. \r\n\r\n3) Tool hardware and software upgrade on-going	2020-12-12 07:42:28.725144+00	\N	2125149271	486	346
291	1) Provide the back up tool run path for Samco and Oxford for ALM, grating and RID etch process : Production run sheets for DFB and 25G programs are running with back up tool run path.\r\n2) Provide the back up tool run path for Trion and Oxford SION, SIO2 and SIN processes: Evaluation is on going	2020-12-15 03:00:07.062678+00	\N	673813648	120	324
289	Manage Cost effective minimum stock up of spare part ( eg MFCs) -Fab B have 32 pcs of Different type of MFC. After some discussion with Vendors, We have cut down to 16 pcs. Presently we managed to reduce it further to 5 pcs with a simple modification fittings. 80% completed ( left one MFC pending for Part in)\r\nAlso Created weekly InHouse repair cost saving table to encourage our guy to do improvement and awareness on cost saving.\r\n if possible inhouse repair like Plating motor repair. ongoing.	2020-12-15 02:50:42.205558+00	\N	5	268	260
292	Both DFB and ELED qualification unit passed 1000hrs  HTOL test.	2020-12-15 03:27:49.169225+00	\N	206959734	202	297
277	1) Cycle time improvement : Currently, all production, short loop run sheets are being created using DMES to reduce the cycle time. Furthermore, Litho and Etch recipes are created at critical steps where wafers are being hold for engineers. Deep trench processes which need special recipes for Ebeam, PLT and SMR, SOO and Samco etch recipes for RID, ZST have been created and wafers are running.\r\n2) Cost and rework rate reduction: Reworks are being avoided by creating the proper recipes and communicating with engineers and clear remarks in the run sheets.\r\n3) eBeam passes reduction and convergence: Engineering data collection has been completed. Pending to buy off whether it can be implemented in the production wafer first.	2020-12-15 02:05:06.31592+00	\N	673813648	122	324
293	1)Apply a long -term philosophy instead short-term. -On going\r\n2) create continuous flow with little and no delay on work -On going\r\n3) Heijunka ( equipments and my guys) - consistency is much essential the meeting demands -On going\r\n4) Build the right culture in the company -On going\r\n5) Standardize tasks with proper( updated) PM procedure and tested technology.. -On going\r\n6) Create visual control for different level ( easily understand by Operators)- On going\r\n7) Accept feedback and comment from all level. -On going\r\n8) Develop people and teams-  On going\r\n9) Decide slowly, implement fast -On going	2020-12-15 03:53:46.110902+00	\N	5	266	260
294	Lean Manufacturing - Quality, Cost, Lead times, Safety -on going\r\nManage Right employee with the right work. -ongoing\r\nIf possible upgrade my guys skills.	2020-12-15 04:05:12.698191+00	\N	5	267	260
295	Clear, Effective Communication. 60%\r\nEmotional Intelligence. 50%\r\nOrganization. 65%\r\nAbility to Delegate. 70%\r\nOpenness. 85%\r\nProblem-Solving. 90%\r\nDecision-Making. 80%	2020-12-15 04:11:51.605167+00	\N	5	263	260
279	NIL	2020-12-15 02:09:35.593259+00	\N	988735390	83	254
400	Though the sensitiveness toward spending has been there through repair and recycle, but more can be done to ensure we do even better.	2020-12-18 03:33:40.942059+00	\N	135493917	268	251
23	Provide Technical guidance on Technical Marketing, NRE, NPI and Applications (customer engagement)\r\n2a)   TAM/SAM & Tracking products, applications and market trends\r\n\tPrepared TAM/SAM analysis for Sensing and Datacom market; joint SOM analysis with Sales\r\n       ???\tSensing (SLED, ILM, FOG, FBGS, DAS, Wind-Lidar)\r\n       ???\tCoherent Datacom (SOA/GC for Coherent 400ZR) & Intra-DCI (25G DML, EML, CW-DFB)\r\n       ???\tDatacom Roadmap {5G, Intra-DCI DML, 400G EML and new 50G PON standard}\r\n\r\n2b)\tTechnical sales and applications support advisory\r\n       ???\tTechnical sales & applications Advisory: SiLC, InPhi, Luxtera, Elbana, AvoPhotonics, Apple \r\n       ???\tInterrogators: ILM(MOPA), India Railway Project (using Redondo interrogator approach)\r\n\r\n\r\n2c) Technical mentorship to NRE proposals\r\n      ???\tAcacia NRE design proposal, Eloira NRE proposal\r\n      ???\tNorthrup Grumman NRE bid:  NRE Technical Proposal developed and presented to NG\r\n\r\n2d) Technical mentorship to members of NPD & PE teams\r\n      ???\tMOCVD Epitaxy Roadmap coordination with Technology Roadmap, KFA5.2 and KFA5.4\r\n      ???\tProvided bootstrap technical requirements guidance to internal BH NDP team (led by Isaac) \r\n      ???\tDenselight patent filing on flip-chip MFA racetrack SOA \r\n      ???\tFOS4X: technical sales support to Sales bid and advisory to APT for successful trial-build \r\n      ???\tSponsored lunch-time Talk: May2020 by Maumita/Longcheng on ???TEC design and application for module products???\r\n\r\n\r\n2e) Renesas-DLS Technology Transfer Co-ordination (Jan-May 2020)\r\n      ???\tSupported technical analysis for Renesas MOU signing on 11April2020\r\n      ???\tInitiated DLS activities for Phase1 technical transfer (done Phase1A)\r\n      ???\tRenesas stopped Transfer Program in May2020 due to Renesas???s corporate direction change	2020-11-26 05:12:14.730053+00	\N	1135328161	76	262
296	1) Reduce RMA Final CAPA closure time to 60days (upon received of complete information or RMA units\r\n   Actual: Jan-Nov, RMA closure cycle time average is 41 days (not including OPEN RMAs yet) \r\n2) Reduce RMA Interim report submission to 30days (upon received of complete information or RMA units)\r\n   Actual: Jan-Nov, Final CAPA submission is average of 27.5 days\r\n3) Reduce customer RMA to 30% from the previous year (2019)\r\n   Actual: Target for 2020 is 12, Jan-Nov actual is 8	2020-12-15 06:00:16.798661+00	\N	1611091001	242	287
297	1) Re-establish Monthly Quality Patrol Audit to counter check process and manufacturing process compliance to requirement and standard. To check Recipe, Runsheet, GATR, WAT and Test data & results (FMEA, Control Plan and SPC check included)\t\r\n   Actual: Quality Patrol Audit re-established and ongoing since March 2020.\r\n2) Establish Incoming Process Control for direct materials (substrates, mask plates, chemicals, gases, others,) using the COC of these materials\t\r\nActual: Incoming Quality Control inspection ongoing since Jan 2020.\r\n3) Re-institutionalize good housekeeping such as 6S program - Conduct 6S orientation/training to all employee. - Reward and commendation every townhall for best department 5S performance\t\r\nActual: 6S program almost completed. First reward will be in Dec 2020 Townhall\r\n4) Include 6S in the audit checklist to support the 6S program\r\nActual: Included and ongoing\r\n5) Centralize documentation and acceptance for incoming material inspection by creating google shared drive for all department incoming material documentations and approval.\t\r\nActual: Electronic filing of IQC records in google drive.\r\n6) Create incoming inspection request google form and deploy to PPC for any materials required incoming inspection.\t\r\nActual: Established and ongoing	2020-12-15 06:07:21.517168+00	\N	1611091001	243	287
298	1) Establish remote audit system for top tier (or with high quality issues) raw materials supplier\t\r\n   Comment: This is under KFA3.5 and will continue until 2021\r\n2) Conduct on-site periodic audit for Ext. Mfg. to ensure change management is being practice.\t\r\n   Comment: No on-site audit for subcon due to COVID-19 pandemic\r\n3) Improve response time to quality issue: Interim Report submission 7 days o Final closure 30 days\t\r\n   Comment: Jan-Nov, average SCAR closure cycle time is 27 days\r\n4) Reduce Vendor CoNC by 2% from previous year (2019)\t\r\n   Comment: CoNC scrap of subcon in 2019=$3,828 while in 2020=$5,804. Increased of 51% due to higher volume.\r\n5) Reduce Subcon-related Reject/Scrap rate by 2%\t\r\n   Comment: CoNC scrap of subcon in 2019=$3,828 while in 2020=$5,804. Increased of 51% due to higher volume.\r\n6) Reduce Cost of Non-conformance (CoNC) by <5% with respect to the total cost of goods sold (COGS)\r\n   Comment: Jan-Nov, CoNC is 2.53%, lower than 5% target.	2020-12-15 06:20:45.711572+00	\N	1611091001	244	287
299	1) Establish a groundwork for Quality Management System align with automotive standard (TS16949) - Attend (if required) Automotive Industry Standard course/training - Assist QA Manager to prepare system documentations and system\r\nComment: This is no longer pursued as discussed during 2020 Management Review Meeting.\r\n2) Involvement of QA function to new product development - Establish QA gates for each New Product Development Phases\r\nComment: James Chang is appointed as QA representative of NPD phases gate.	2020-12-15 06:22:31.318003+00	\N	1611091001	245	287
300	1. ELED: overall CBT test yield capability improved by ~5% looking at the monthly trend from 2019 to 2020: best yielding month is at 72.1%, while the best yield month for 2020 is at 77.3%; However the yield is not stable mainly due to poor design margin for ripple. Yield trended low in Q1 and Q3, and managed to recover back to ~75% level in Q4???20. \r\n\r\n1.1\t By quarter performance:\r\n???\tQ1 = 13 wafers (27,765 dies) tested, avg yield = 65.1%\r\n???\tQ2 = 17 wafers (28, 753 dies) tested, avg yiled = 77.7%\r\n???\tQ3 = 18 wafers (24,716 dies) tested, avg yield = 71.5%\r\n???\tQ4 QTD: 20 wafers tested avg yield = 75.2%\r\n???\tQ4 met the 75% ELED/SLED cum yield target with ELED yield on 53084H/3036H normalized to 54708T.\r\n\r\n1.2 Record yield:\r\n1. Record yielding wafer is 20023B with 87% CBT test yield from Samco etcher in Q3.\r\n2. Record yielding week is wk17 at 84.1% with 2829 dies tested.\r\n3. Stably recovered the ELED CBT test yield back to 79.6% after flushing out Oxford & tester issue with total 5351 dies tested.\r\n\r\n1.3\tNo record of mis-shipment for first half of 2020.\r\n\r\n2.\tSLED: \r\n???\tQ1: CBT: 50.1%/COS: 85.1% -> CBT*COS: 42.6%: CBT (14 wfrs); COS: (19 wfrs)\r\n???\tQ2: CBT: 89.3%/COS:91.5% -> CBT*COS: 81.7%: CBT (11 wfrs); COS: (17 wfrs)\r\n???\tQ3: CBT: 82.8%/COS:79..5% -> CBT*COS: 65.8%: CBT (5 wfrs); COS: (13 wfrs)\r\n\r\n2.1 Not meeting yield target of 87.5% (CBT*COS). To meet the yield goal Need further improvement on power and bandwidth on weaker products and flushing out the old low yield wafers. \r\n2.2 The quarter to quarter yield variation comes from different products loading with different yield capability. \r\n2.3 Yield improvement plan:\r\n- CS5153A family: bandwidth improvement through SCH thin down from 50nm to 40nm; lead wafer on 5153A new Epi QW design showed promising BW & power results meeting the product spec. \r\n- CS68M5A: key challenge is to hit the +/-10nm wavelength range, while no capability current at this wavelength range to measure PL. Started 3 wafers with PL, PL+10nm, PL-10nm to enable cherry pick units for this +/-10nm wavelength spec. \r\n-  CS5169A family: latest wafer (20041A) copied the golden wafer (19070A) EPI scheme, but power still fail, and is likely related to wafer broken (20041A) and Samco etcher (30% lower power compared to Oxford), need to monitor more wafer.\r\n- Wavelength centering CS68M5A, first wafer 16086A PL off target >15nm, fine tuning for potential requirement.\r\n- CS 5169A-FA: need to grow new epi wafer with 45nm SCH (to improve power) + wavelength centering.\r\n- CS3504A/CS3452A family: grown new Epi wafer based on golden wafer 14069A Epi scheme. Pending test results.\r\n\r\n3. DFB16xx: no production volume on DFB16xx as sales has yet to engage any successful customers yet. Overall, total 8 wafers tested for Q1~Q3, overall average yield is 38.6%. Excluding one wafer hit by RTP excursion, the average yield is 43.1%.\r\n??? Almae: 3 wafers (excluding RTP affected wafer) is at 49%\r\n??? Eulitha: 4 wafers is at 38.8%.\r\nDidn't meet the yield target for both Almae and Eulitha. However, direction is clear to further improve the SMSR yield. Pending lead wafer on 20nm grating thickness to confirm.  \r\n\r\nNew technical learnings/breakthrough:\r\n??? Almae: altogether 3 wafers with optimum grating design (30nm grating height) yielded ~69% in average from Q2 & Q3. Yield is very consistent.\r\n??? Eulitha: so far only two wafers tested, best yielding wafer is at 63% with 30nm grating height. Expect yield will be even better with 20nm Grating height by Q4. \r\n??? Established the correlation of Kappa-L to SMSR yield with Kappa-L > 3, SMSR yield will drop to below 40% level. Waiting for more data out to establish the Kappa-L sweet spot.  \r\n??? Established capability & automate the multi-current SMSR testing.  \r\n??? Established testing methodology for bar test and packaged TOCAN with TEC	2020-12-15 07:31:00.053368+00	\N	861437177	28	265
301	1. PRM/ORT: \r\n??? Drove two rounds of ORT procedure for ELED/SLED/DFB, focusing on major vol runner ELED 54708T. \r\n??? Updated WAT work flow to include the ORT data collection into the flow for ELED;\r\n??? Kicked off 1st ELED ORT data collection by end of Aug (Xiao yu/Dheepeka).  \r\n2. Product Bin SPC: \r\n??? drive through KFA3.2 as part of BIC yield capability. Script done in Oct'20. SPC dashboard template finalized in Nov'20. cpk/cpU data enabled in Nov'20. Plan for first launch by end of Dec'20 (Ronaldo).\r\n3. Yield dashboard:\r\n??? Script done. Plan to launch in Dec???20. \r\n4. Database enhancement:\r\n??? Manual Station Auto logging in Database (Fairoz): Software is updated, pending implementation due to movement of manual stations to cleaving area. \r\n??? Auto-bar station (Jaslyn/Ken): done\r\n??? Rajan requested to enable Fittech data to directly upload in SQL: APT is working on it\r\n5. Yield reporting structure & yield management system:\r\n??? Established the APT process flow, proposed and finalized the yield calculation methodology, defined a list of criterias for first version of integral yield calculation model for ELED & SLED in wk10'20. \r\n??? Aligned cross-functionally with APT on the APT process yield target and test yield targets in Mar'20.\r\n??? Optimized the yield calculation model by taking out non DLS processes and non-yield off step, and recalibrated the test yield target based on 75% cum yield goal in wk28'20.\r\n??? Segregated SLED to update the yield by product family on a monthly basis based on it's high mix low vol nature.\r\n??? Established the yield reporting framework & ILM BOX flow, and triggerd to kick off ILM BOX yield update by CBT/COS (PE), Module (external manufacturing) and BOX (APT process) in Oct'20.	2020-12-15 07:34:19.277722+00	\N	861437177	29	265
302	1. 25G DML: project delayed ~ 1Q from NPD, and is now in Alpha cum Beta -phase exit review now. Very limited engineering data collected, though data showed capability to meet the product spec with ~50% integral yield, more statistical data needed to fully prove the feasibility in Gamma phase.\r\n2. 25G DML is the first program going through PDM process. As Alpha/beta phase exit is not done yet, FMEA/ORT is not ready yet. \r\n3. So far, no successful customer engagement on both DFB 1653nm and 25G DML. 10G i-temp is not in 2020 deliverables from NPD.	2020-12-15 07:36:34.33463+00	\N	861437177	30	265
303	Agreed	2020-12-15 07:59:42.469549+00	\N	988735390	84	254
393	GOOD PROCESS SUPPORT FROM THE OPERATOR AND PICKS UP PROCESS WELL	2020-12-18 01:41:19.399952+00	\N	973701598	314	271
304	1. RMA/NCMR:\r\n??? Closed 6 RMAs on ELED/SLED with average 29.8 days CAPA lead time. Met QA 30 days lead time. Total RMA cases under PE ownership improved by 40% (2019-> 2020: 10 -> 6)\r\n??? Closed 8 NCMRs on ELED/SLED with average 101 days lead time. Higher than 30 days target from QA. One aging NCMR case took pretty long time due to isolated case. Total NCMR cases under PE ownership improved by 43% (2019-> 2020: 14 -> 8)\r\n??? CONC: CONC% in 2020 is 2.53%, while 2019 CONC% is 4.44%, both met the 5% goal, and there is 43% reduction in 2020. Data from QA. \r\n\r\n2. Cost down:\r\n??? With the hiring of one AE under SG#united pgm, the PE engineer???s working efficiency improved 10~20% from logistic (e.g. raising WO), documentation (data sheet clean up), new data sheet creation & hands on (test/VI inspection) support.\r\n??? In terms of data system, this year PE team is still struggling pretty much on manual data pulling and consolidation due to data delay into TIBCO in Q1~Q3, Q4 showed some improvement from weeks delay to within 24hrs. \r\n??? PDMS: project delayed few months due to vendor server change issue, UAT is in progress and first launch target in Dec???20.\r\n??? For DFB, the test correlation with vendor (Hisense) is fully established and in-house sampling test.	2020-12-15 08:02:05.730954+00	\N	861437177	31	265
307	Percentage of equipment downtimes that meets our goal of within 4% is 4.3 %, while 4.3 % that did not meets goals are mainly due to Systems/Parts obsolete issue(like Deve-01  parts ,Plating part).\r\nThe Unscheduled broke down for some major equipment .(like Sput tools, Deve tools, RTP and etchers.)\r\nDuring Oxford system upgrade, unforeseen Part broke down causing delay and huge downtime while waiting for obsoleted rf gens and Parts.\r\nDenton i29 system ???unstable??? condition causing downtime.\r\nIn process in Some Tools upgrade to 3???\r\nOur guys (rated avg 50-66%) not well trained on all equipment.	2020-12-15 08:57:00.737163+00	\N	22592094	275	336
316	Create continuous flow with little and no delay on work, on going,\r\nDecide slowly, implement fast. on going,\r\nStandardize tasks with proper( updated) PM procedure and tested technology. on going,	2020-12-15 09:41:25.428296+00	\N	1087181548	269	276
308	Review and Improvement on the Work procedure on the equipment with it???s safety concern. Ongoing  \r\n6S and House keeping -Self conduct regularly check and Maintain.\r\nSafety -Review and Improvement on the Preventive Maintenance. Ongoing	2020-12-15 09:02:31.210694+00	\N	22592094	276	336
306	- Total 51 wafers were fab out/running inline\r\n- Found out the Low DOP(Panwoo) project performance unstable root cause from MQW undulation and brought the team to the right trouble shooting direction\r\n- Need continue work with modules on process robustness improvement (PCO InP attack, RID Ridge profile/footing...)	2020-12-15 08:53:40.458063+00	\N	290990818	187	299
309	1.PECVD-02 powder flakes issue while run SiON recipe- clean shower head with below 10 Degree Celsius of H2O of soaking process. It can remove over 90% of debris faster than IPA and Acetone method. Monitored for 3months, chamber down PM at 30rf. Earlier down less than10rf unscheduled PM.\r\n2.PLAT-01 convert to 3inch wafer test in progress.,\r\n3.RTP-02 convert to 3inch wafer test in progress.., \r\n4.TRACK-01 machine back up for standalone DEVE-01 and DEVE-02- Modification done and running production.\r\n5.PDS-01 machine to fix external ATM switch in progress..\r\n6.MAL-03 Halogen lamp power OEM spec power extend to 750W, cost saving under observation..,, \r\n7.Fab-B machines that using MFC, to reduce cost all machine MFC consolidated into 5 spare MFC. Completed.	2020-12-15 09:12:17.534336+00	\N	22592094	279	336
310	Create continuous flow with little and no delay on work. On going.\r\nStandardize tasks with proper( updated) PM procedure and tested technology. On going.\r\nBuild the right culture in the company. On going.	2020-12-15 09:15:45.362944+00	\N	22592094	278	336
311	- Total 38 wafers were fab out/running inline\r\n- Need continue work with modules on process robustness improvement (PCO InP attack, RID Ridge profile/footing...)	2020-12-15 09:19:30.399476+00	\N	290990818	199	299
305	Update the Equipment status properly into the daily equipment status tracking file using the Odoo system, On going\r\nTo be able make logical and decisive decision to safe guard the company need- In progress\r\nGood to raise concern, but always come up the work around solutions to get things moving, in progress.	2020-12-15 08:51:54.12491+00	\N	22592094	277	336
312	- Total 25 wafers were fab out/running inline\r\n- Need continue work with modules on process robustness improvement (PCO InP attack, RID Ridge profile/footing...)	2020-12-15 09:23:42.621958+00	\N	290990818	200	299
318	Safety Compliance to extend the Equipment???s life time, on going\r\n6S and House keeping., on going.\r\nTo understand and setup all equipment???s safety procedure to ensure we complied with all the up to date critical safety procedures. on going.	2020-12-15 09:43:17.320671+00	\N	1087181548	270	276
314	Percentage of equipment downtimes that meets our goal of within 4% is 4.3 %, while 4.3 % that did not meets goals are mainly due to Systems/Parts obsolete issue(like Deve-01  parts ,Plating part).\r\nThe Unscheduled broke down for some major equipment .(like Sput tools, Deve tools, RTP and etchers.)\r\nDuring Oxford system upgrade, unforeseen Part broke down causing delay and huge downtime while waiting for obsoleted rf gens and Parts.\r\nDenton i29 system ???unstable??? condition causing downtime.\r\nIn process in Some Tools upgrade to 3???	2020-12-15 09:37:27.874488+00	\N	1087181548	272	276
315	EBEV-02 3inch wafer conversion in progress..,\r\nSPUT-02 3inch wafer conversion in progress..,\r\nPLAT-01 3inch wafer conversion in progress..,\r\nGood to raise concern, but always come up the work around solutions to get things moving- in progress.,\r\nUpdate the Equipment status properly into the daily equipment status tracking file using Odoo software, ongoing,	2020-12-15 09:39:35.02331+00	\N	1087181548	271	276
319	FFU unit repair-Fab B completed. Other area in progress, \r\nRepairing and testing on PCB, power supply, control board and motor for Fab B and MOCVD, in progress\r\nBuy and stock in electrical and electronics compound need for company, on going.\r\nOwnership for Lithography and metrology tools, prepare spare parts and improvement project ongoing. \r\nPLAT-01 intermittent wafer breakage issue- to modify top assembly and completed. Monitored few months ok.\r\nDEVE-01 spindle rotation issue- motor driver repair in progress,\r\nPLAT-01 3 inch wafer upgrade in progress..,,	2020-12-15 09:55:24.901376+00	\N	850138976	436	328
320	Safety Compliance to extend the Equipment???s life time.in progress.\r\n6S and House keeping. ongoing,\r\nTo understand and setup all equipment???s safety procedure to ensure we complied with all the up to date critical safety procedures.in progress,	2020-12-15 09:57:37.61194+00	\N	850138976	437	328
321	To be able make logical and decisive decision to safe guard the company need. in progress\r\nUpdate the Equipment status properly into the daily equipment status tracking file. in progress\r\nGood to raise concern, but always come up the work around solutions to get things moving. on going.	2020-12-15 09:59:36.484021+00	\N	850138976	438	328
322	Apply a long -term philosophy instead short-term, in progress,\r\nAccept feedback and comment from all level. on going,\r\nStandardize tasks with proper( updated) PM procedure and tested technology. on going,	2020-12-15 10:02:07.042895+00	\N	850138976	439	328
317	- Narrowed down major NCMR PCO InP attack issue to Trion SION dep tool\r\n- Need continue work with modules on PCO InP attack issue root cause finding	2020-12-15 09:41:46.81131+00	\N	290990818	205	299
323	MAL-03 x,y and z axis movement motor repaired and tested ok. \r\nMOCVD scan profiler mother board issue-repaired and tested ok.  \r\nPDS-01 rf forward issue- rf controller board repaired and tested ok. \r\nEBEV-02 thickness monitor controller- repaired and tested ok. \r\nSPUT-01 pressure monitor controller-repaired and tested ok. \r\nLearning all Fab B equipment Weekly and Monthly PM in progress, \r\nFab B air shower auto close function completed	2020-12-15 10:04:09.595947+00	\N	850138976	440	328
324	- Total 5 wafers were fab out/running inline\r\n- Need continue work with modules on process robustness improvement (PCO InP attack, RID Ridge profile/footing...)	2020-12-15 10:04:51.072535+00	\N	290990818	201	299
325	JFP Microtechnic - evaluation plan & shipment of bars and dummy to vendor for stacking evaluation\r\n\r\nSimTech - process template for high volume production	2020-12-15 10:05:58.819598+00	\N	2125149271	485	346
327	- Leading minesweeper wafer at NML and will be fab out soon\r\n- 3 inch PLT mask tape out on going and forecast mask will ready in two weeks\r\n- Slow wafer movement due to priorities were given to production wafers and other projects(POET, 25G, Panwoo...)	2020-12-15 10:31:26.798019+00	\N	290990818	203	299
338	Equipment going down is a common issue, bring up machine is just part of the problem. \r\nWe need to have the ability to anticipate issues in advance and the follow through of CA and PA after each failure to ensure we are better prepare in future.  I would like to see a improvement in this aspect.	2020-12-16 01:28:26.94766+00	\N	135493917	262	251
313	- Total 7 wafers were fab out/running inline\r\n- HIC process and FC capability not required yet for the project at this moment\r\n- Need continue work with modules on process robustness improvement (PCO InP attack, RID Ridge profile/footing...)	2020-12-15 09:26:03.402909+00	\N	290990818	188	299
339	This goal is completed by 1st May 2020. There are some modification included and those new requirements moved to new phase.	2020-12-16 02:09:22.420411+00	\N	1608216415	392	320
326	- Successfully fully released DMES by Q3\r\n- Need work with IT on DMES continuous improvement	2020-12-15 10:12:23.65376+00	\N	290990818	204	299
329	ECN approved by PE	2020-12-15 11:27:40.109869+00	\N	2125149271	489	346
328	Target for goals achievement by end of the year 2020	2020-12-15 11:23:36.73543+00	\N	2125149271	493	346
330	1) Acceptance report approved\r\n\r\n2) Evaluation report approved\r\n\r\n3) Final quotation received	2020-12-15 11:31:52.077679+00	\N	2125149271	492	346
332	1) sheet resistance correlation with reference TLM data\r\n\r\n2) Sample preparation at 3 temperatures for N-metal & P-Metal\r\n\r\n3) sheet resistance comparison between DLS & NTU	2020-12-15 11:41:16.425384+00	\N	2125149271	491	346
333	1) Finger print of SiO2 film completed\r\n2) No delamination observed after RTP 400 degC	2020-12-15 11:46:11.364757+00	\N	2125149271	488	346
331	1) Google sheets conversion on-going\r\n2) Monthly update for SPC dashboard	2020-12-15 11:34:28.240528+00	\N	2125149271	494	346
334	1) SiN HM in oxford qualification on-going (ECN to be raised & approved)	2020-12-15 11:54:09.369798+00	\N	2125149271	490	346
340	This goal is completed by 30th Sep. 1st Oct onwards there had been more than 100 wafers have been released in to Fab using DMES.	2020-12-16 02:10:25.49564+00	\N	1608216415	452	320
341	1. Released Daitron Operation Procedures and updated other assembly process documents like die shear/Test/Wire Bond etc.\r\n2.  Re-layout the assembly line as per manufacturing flow , improved 6'S in assembly/ test area by implementing proper cable routing/labeling  etc,.\r\n3. Installed and verified new OSA Jig in auto bar and results were satisfying/improved high speed & reliable 100% testing of ELEDs dies\r\n4. updated all production Die attach recipes for automated mounting process to improve capacity and quality of process\r\n5. Successfully recovered palomar PC and other assembly and test PC , backup done, recently Station 4 PC HDD crash, Previous Clone helpful to restore.\r\n6. Manual stations qualified with Newport spheres by performing GRR , reduced station 1 & 4 variation below 2%. Restored manual stations with new probes /positioners/cable routings/new TEC etc,,Successfully calibrated Station 1 instruments and verified results and met product specs. \r\n7. Provide OJT to Rong feng /Alex on other process and equipment\r\n8. SPC excel tracking implemented and monitored for assembly and test \r\n9. Closely Monitoring OEE performance to meet assembly/test equipment efficiency and yield tracking monitoring  weekly. \r\n10. Workwith supervisor & Certified Yumiao /Yangting/Wongwei/QueXin etc on assembly process	2020-12-16 02:11:18.82181+00	\N	520727285	328	303
335	KFA 5.2: \r\n1. Develop the Building block for devices compactible with BH structure\r\n2. Submit the proposal to the management\r\nInitial report regarding literature review- submitted\r\nProcess capability analysis- Oct 20\r\n\r\nLow Stress SION recipe for Oxford\r\nEngineering report Pending- Jan21\r\n\r\nLow Stress SIO2 recipe for Oxford\r\nEngineering report Pending- Jan21\r\n\r\n25G Qualification in Denton I29 \r\n4. Develop Ar sputter recipe and show no Al at interface - pending \r\n5. AR coating for Hermetic devices- HTOL: 1168Hrs passed ,  TS & ESD: pending	2020-12-15 12:54:12.262721+00	\N	1723530200	179	315
336	NML peel off -NCMR closed. No recurrence \r\nAR coating peel off: closed, chamber leak issues-Equipment PM updated\r\nSputter run peel off 20002B: clossed, Equipment issue, CDA leak\r\n\r\nOperator training & Assessments Training of Operators and Asses them- Mar21\r\n\r\nBar unloading and inspection. Operators are following APT documents now. Need to document for FAB B- Jan21\r\n\r\nRapid Thermal Process VI and Image Capture- Waiting for the Vendor field service, SOP pending- Jan 21\r\n\r\nAR coating Jig cleaning- SOP\t-Dec 21\r\n\r\nSOP for Trion AR coating- Documentation done. -Pending approvals\r\n\r\nTECN for Sputter-02 for low vacuum ECN pending- Jan21	2020-12-15 12:56:12.543673+00	\N	1723530200	160	315
337	Denton I29 Tool qualification \r\nTool upgradation is going on- Jan 2021\r\nSLED Qual completed- 2000Hrs BI \r\nDFB Qual: 668Hrs passed. TS & ESD- Dec 20 , 2000Hrs BI- Jan 21\t\r\n\r\nProduct Qual in Denton I29 1. ELEDs-Pending  2. SOA High Psat-pending\r\n\r\nSetup clean frequency and no contamination due to coating Jigs Back up for AR & HR coating Jigs- \t\r\n\r\nNew Quartz plate for Trion & Oxford . Two wafer/ run Clean recipe optimization going on Increase to three wafer per run- Mar21\t\r\n\r\nSIN HM in Oxford: Documentation pending\r\n\r\nDeveloped a new low stress AR recipe in Oxford. DA simulation Jan21 (delayed due to Oxford refurbishment) \r\nNeed to proceed the Qual with new recipe- Jan21 \r\n\r\n1. Daitron bar stacker is capable of loading bars which the CL more than 250um Duplicated (Xtreme) Jig Qual For the 150um CL- manual loading Jig is ready- 15 Nov 2020\t\r\n\r\nTrion AR coating back up for Oxford HTOL: Qaulified for SLEDs & ELEDs\t\r\n\r\nCary 5000 Spectrophotometer Qualification Installation going on-Jan21 Process recipes- Production release- Jan21 (Need network connections)	2020-12-15 13:03:31.228634+00	\N	1723530200	178	315
342	Phase 4 consist of 5 modules. 2 of the modules have been completed successfully. 3rd module is 60% in progress. This goal is expected to be completed by Jan 2021.	2020-12-16 02:11:28.473321+00	\N	1608216415	453	320
343	This goal is completed by 31st August 2020.	2020-12-16 02:12:37.337882+00	\N	1608216415	454	320
344	This goal is cancelled because third party is hired to develop this tool.	2020-12-16 02:13:46.808424+00	\N	1608216415	455	320
394	GOOD EFFORT FROM THE COLLEAGUE TO DESIGN AND HEP IMPROVE THE PRODUCTION	2020-12-18 01:45:36.55477+00	\N	973701598	310	271
345	1. Support assembly and test process to run engineering and production Work orders in person to meet monthly shipment commits\r\n2. Lias with PPC to ensure meet quarterly revenue as planned without failing by keeping the machine up and available for production	2020-12-16 02:19:05.07875+00	\N	520727285	325	303
346	1. setup the Daitron and assembly machines like die attach and wire bond for New designs mask like high power CW/SOA/PDGSOA/PANWOO etc.\r\n2. Support to optimize the die attach recipe as per NPD request every time/Wo e.g. waveguide angle change, sub mount design change, barcelona steps etc\r\n3. Provide assembly process including Cleaving/CBT/Die Attach/Wire Bond/ Submounts engineering suggestions and feedback difficulties of process if any\r\n4. Run engineering Work orders like 25G/High Power CW/SOA for cleaving Since mask is not standard design which need to change machine parameters for every cleave steps/die attach	2020-12-16 02:27:21.455007+00	\N	520727285	326	303
348	Facilty Project and repair	2020-12-16 03:05:40.02218+00	\N	1017729787	196	302
349	Facilty Team works	2020-12-16 03:06:07.160437+00	\N	1017729787	306	302
351	6S, Housekeeping and Safety	2020-12-16 03:06:34.489958+00	\N	1017729787	197	302
347	1. Engauge the external vendor to calibrate the test instruments ,DAGE and oven etc,\r\n2. attend machine down time and faults asap to ensure no production stoppages\r\n3. Schedule and perform Monthly PM for assembly and test machines\r\n4. Arranged & Calibrated Station 1 instruments to meet ISO and internal audits\r\n5. Support to keep up the assembly process and 6S in production line \r\n6. Work with Fab to ensure APT assembly and test has smooth process flow and ensure no process difficulties	2020-12-16 02:35:02.408634+00	\N	520727285	327	303
350	- Daily inspection of facility equipment, such as Chiller, MAU, RCU, SEX, GEX, Scrubber, WWT, DIW / RO, CDA compressor, Vacuum compressor, PCW and others. \r\n- To ensure preventive maintenance of facility equipment and instrument are perform on time.\r\n- Maintain good housekeeping	2020-12-16 03:06:18.487167+00	\N	2047523461	333	301
353	- Conduct safety awareness and internal training to improve safety culture in the organization.\r\n- Implement safe work procedures and risk assessment in all dept. to control hazards for a safer workplace\r\n- Regular inspection to detect and identify unsafe act, unsafe condition and unsafe practices.\r\n- Monitor licenses and permits of HS and toxic gases and others to achieve safety and compliance requirement.  \r\n- Regular inspection of Fire safety equipment to ensure functionality, safety and to achieve compliance requirement.  \r\n- Waste management (Chem waste, toxic waste, E-waste, waste water) and control to ensure to dispose it in according to environmental regulation.	2020-12-16 03:07:55.031303+00	\N	2047523461	336	301
355	Clear, Effective Communication. 60%\r\nEmotional Intelligence. 50%\r\nOrganization. 65%\r\nAbility to Delegate. 70%\r\nOpenness. 85%\r\nProblem-Solving. 90%\r\nDecision-Making. 80%	2020-12-16 05:23:34.475118+00	\N	1941685512	428	307
356	1)Apply a long -term philosophy instead short-term. -On going\r\n2) create continuous flow with little and no delay on work -On going\r\n3) Heijunka ( equipments and my guys) - consistency is much essential the meeting demands -On going\r\n4) Build the right culture in the company -On going\r\n5) Standardize tasks with proper( updated) PM procedure and tested technology.. -On going\r\n6) Create visual control for different level ( easily understand by Operators)- On going\r\n7) Accept feedback and comment from all level. -On going\r\n8) Develop people and teams-  On going\r\n9) Decide slowly, implement fast -On going	2020-12-16 05:25:47.407927+00	\N	1941685512	431	307
357	Safety -Review and Improvement on the Preventive Maintenance. Ongoing\r\nReview and Improvement on the Work procedure on the equipment with it???s safety concern. Ongoing  \r\nReview and Improvement on the existing Equipment Risk Assessment. Ongoing\r\n6S and House keeping -Self conduct regularly check and Maintain.	2020-12-16 05:27:00.346375+00	\N	1941685512	430	307
358	Colleague is very proactive in new solutions. \r\nThe movement and relayout is very neat. \r\nQualification of the Daitron was smooth and Daitron is in production for SLED and ELED.	2020-12-16 08:22:57.986748+00	\N	973701598	328	271
359	Provides very good follow up with work orders. Deliver the task on time with good quality.	2020-12-16 08:23:55.047228+00	\N	973701598	325	271
360	Very familiar with the production process and is able to do complex customizations to support engineering as well as production improvements. Sometimes even giving out of the box solutions which is very effective.	2020-12-16 08:25:25.932754+00	\N	973701598	326	271
361	Good follow up with plant ISO activities. Equipment well maintained and looked after.	2020-12-16 08:26:18.225958+00	\N	973701598	327	271
362	No current OEE tracking. Need to improve knowledge on Autobar. Need to ensure DIL will be directly convertible to BTF	2020-12-16 08:36:36.595058+00	\N	973701598	317	271
363	Restoration of ILX chambers is poor not much additional channels established.\r\n\r\nGood job on qualifying the New burn-in jigs from Yelo.\r\n\r\nNeed to improve understanding on Manual stations to expedite future issues between station performance and repeatability\r\n\r\nNeed to improve on knowledge for manual stations.	2020-12-16 08:37:17.264606+00	\N	973701598	322	271
364	Need to improve on the database for the maintainence of equipment and calibration.\r\n\r\nNeeds to be more independent and take ownership when resolving equipment downtimes.  Reduce reliance on colleagues.	2020-12-16 08:40:01.837673+00	\N	973701598	323	271
365	Yelo system is well maintained and tracked	2020-12-16 08:40:42.14893+00	\N	973701598	324	271
366	Limited focus to clear ISO issues need to improve on this to ensure follow up with existing requirements	2020-12-16 08:52:12.479022+00	\N	973701598	484	271
369	I have been keep ongoing support ILM production and engineering by co-op with PPC most time.\r\n\r\nMake plan for Quarterly in production line.\r\nAlso planning for training for Operators too.\r\nHope to learning in engineering manufacturing support.\r\n\r\nAlways last min to interrupt in schedule/ planning to mess. Always make schedule/ planning again and again.	2020-12-16 09:38:32.882762+00	\N	231731743	314	326
354	- Continuous improvement to attend technical, teamwork and leadership training.  \r\n- Support management goals and objectives , like to reduce costs and resources savings \r\n- Knowledge sharing	2020-12-16 03:08:29.812398+00	\N	2047523461	334	301
352	- Respect to my co-workers and superior \r\n- Take responsibility in my work assignment\r\n- Commitment of work - such as punctuality, complete the task, submit reports\r\n- Focus in my job responsibility\r\n- Impartiality to all vendors and contractors. \r\n- Teamwork	2020-12-16 03:07:21.974963+00	\N	2047523461	335	301
370	Completed.\r\nNo more wobbly and noise. Now ok to use. Hopefully can help Foxs4 coil too..	2020-12-16 09:39:04.357403+00	\N	231731743	310	326
367	As of WW#50, there are 311 completed wafers. Expecting around 325 wafers completed in 2020 vs 257 fab-out wafers in 2019. Which is estimated ~81% of the Y20 target. Estimated Increase 47% compared to Y2019.\r\n\r\nFor more details, please refer to the link:\r\nG:\\Shared drives\\MFG (FAB B) (C-J-T)\\Fab B Operation Report\\Fab B Report 2020 WW5x.xlsx	2020-12-16 09:19:31.454972+00	\N	1921197435	280	314
396	As a whole Anthony do provide the necessary guidance to his people on the equipment knowledge, but I need a more systematic approach and tracking on the people???s progress and skill level.	2020-12-18 02:54:38.214831+00	\N	135493917	265	251
373	1) Always flexibly assigned and arranged operators and technicians on time work OT late at nights or afternoon shift or night shifts to clear more wafers/WOs when there were many urgent WOs in Trion/Oxford PECVD, Litho, Lap, EBEV, plating to meet time target or minimize the delays.\r\n2) 2 Fab MFG supervisors always made sure coverage for absenteeism 7 days/week\r\n3) Helped/assisted Equipment on Equipment related issues (like Lapping, Plasma tools, Sput tools, MAL-03) \r\n4) Closely following up with operators on Work with Urgency and Correct Priority (daily instanstanly let operators know the wafer priority/wafer criticality and daily checked the priority operators were following.	2020-12-16 10:25:35.171018+00	\N	1921197435	282	314
374	??? Performed 6S in the whole Fab:\r\n-Removed unwanted/used items, replaced new one on work tables at all workstation in the Fab\r\n-Litho: Removed and seal non cleanroom materials (carton box for APT, ILM??? special glue) in Fab Litho fridge and old expired chemicals bottles since 2012.\r\n-LAP room: Chemical bottles in RTP room for ~2 years without any intention to remove. These bottles belongs to Fab A\r\n-WB: cleaned Chemical leak in Solvent wet bench SWB, \r\n-Informed Facility to regularly check Emergency Eye Rinse Shower\r\n-Be self discipline to Fab disciplines to put wafer labware's back to the cabinet by end of the day\r\n-Tidy up cleaved unused wafers as source of contamination particles and cleaned cleaving area\r\n-Remove used parts after Equipment Repair work at all machines\r\n\r\n??? Regularly reminded operators to maintain 6S housekeeping and safety protocol\r\n??? Regularly asked operators check hazardous signs labeled on the chemicals bottles before they take and use, especially for newcomers.\r\n\r\nFor details of 6S performance, please refer to the link\r\nG:\\Shared drives\\MFG (FAB B) (C-J-T)\\5S Report - Fab B NOV-2020.pptx	2020-12-16 10:53:51.24895+00	\N	1921197435	283	314
375	???Trained Ragu, HS, YS, Sri on lapping process\r\n???Followed up certification for Sri on Lapping process; certification for Joey and Sherry on Plasma process. And partially trained them on plasma process.\r\n???Arranged and monitored cross training JH-Sri on litho\r\n???Trained on wafer handling, reading runsheets, Process SOP,... regularly for all operators, especially newcomers.	2020-12-16 11:04:07.957635+00	\N	1921197435	284	314
376	-Worked with Urgency and Correct Priority - Continuously managing job priorities and working with urgency to match management priority (always reacted quickly new urgent wafers/ urgent WOs requests from important projects/ customer delivery; arranged quickly on time operators to work later OT, night shifts, afternoon shifts when the urgent situations comes)\r\n-Continuously providing service to equip, process and manufacturing team members to help them on Equipment related issues (like Lapping, Plasma tools, Sput tools, MAL-03, AR/HR coating)	2020-12-16 11:11:49.146466+00	\N	1921197435	285	314
377	1. To manage align the operation requirement between the Equipment, Process and Manufacturing teams to ultimately foster long term sustainability in terms of Morale and Synergy. \r\n--> Ok\r\n2. To take the lead by being fair and sensitive to the other team???s needs and indices. This will foster trust and improved co-operation. The subordinates will see and learn that win-win situations can be achieve, thereby following suit. \r\n--> Ok\r\n3. To increase contact with the Process and Equip engineers, to have balanced points of views. This will enhance the working relationships with understanding each other's problems and concerns. \r\n--> Ok\r\n4. To increase the contact with the subodinate to listen to their feedback and problems. Avoid finger pointing to them unnecessary to foster trust. This gives the subordinate the feeling that they are being heard and that their feedback is of value, which will encourage them to speak up and uplifts their self worth and foster ownership. \r\n--> Ok\r\n5. Carry out individual conversation. Understand their issues and problems, but at the same time truthfully tell them their standing, strengths and weaknesses. Tell them on which areas to improve on. \r\n--> Ok\r\n6. Met out punishments and rewards appropriately. This will create role models and also real life examples of wrong-doings. In managing the team, being firm and fair is the key. \r\n--> will try to improve\r\n7. Follow up closely on feedbacks and suggestions, ensure you are on top of all of them, this will make the engineers feel engaged and important. \r\n--> Ok\r\n8. Cultivate and Demand consistent quality awareness and vigilance, put up sequence of events for every incidents to ensure a good coverage of CA/ PA. \r\n--> Ok\r\n9. Understand and implement better methods in recovering tools from failure \r\n--> Ok (always tried to arranged setup quickly, prepare dummy wafers,...)\r\n10. Identification of Chronic Equipment issues and constraint and solving them in the faster possible time. \r\n--> Ok, but still need to improve further.\r\n11. Need to ensure zero incident of mistake to ensure will not run into quality issue at all time.\r\n--> improved, but still need to improve further.	2020-12-16 11:22:19.412247+00	\N	1921197435	286	314
378	This is comment for midyear	2020-12-16 12:38:51.546868+00	\N	17	520	364
372	As of WW#50, wafer breakage % is 11.6% vs 13% in 2019. The wafer breakage percentage was reduced 1.4%.\r\nMain causes: \r\n1) Prolift fabrication is discontinued, bubble bonding issues during new material evaluation (Protek, SPR220, BSP) caused multiple wafers broken.\r\n2) Wafer weakness by many-litho mask process flow, Litho low-vac compression, residue PG/410 swabbing/drying rework, incoming wafers got many spike protruding defects.\r\n3) Mishandling by operators, especially those new operators in Litho, Wet, taping/removing tape on thinned wafers at EBEV/Sput\r\n4) Plating machine fault: misalignment of plating/holding pins and too much compression force of holding pins on the wafers.\r\n\r\nFor more details, please refer to the link:\r\nG:\\Shared drives\\MFG (FAB B) (C-J-T)\\Fab B Operation Report\\Fab B Report 2020 WW5x.xlsx	2020-12-16 09:39:44.693962+00	\N	1921197435	281	314
379	As a whole the 6S and safety awareness has been improved. \r\nBut I cant see any strong ownership on 6S and Safety practices, there is no clear system which I think we need one to be setup  ASAP.	2020-12-17 02:17:47.47693+00	\N	135493917	264	251
380	KPI NCMR: cycle time < 30 days . \r\nMost NCMRs took place the first half of 2020, total 8cases. With help of direct manager	2020-12-17 03:56:41.485957+00	\N	610693885	464	283
381	Papers for 2020 were focused on study of Eloria thermal reaction and FBGL kink optimization. The data collection and analysis was finished , pending compile into submit able paper.	2020-12-17 03:57:32.621376+00	\N	610693885	466	283
391	Successfully implemented automation for order management using Odoo for quote, order confirmation, shipment and invoicing, eliminated manual process and improved operation efficiency.	2020-12-18 01:13:58.91269+00	\N	1710250857	91	331
397	Technically Anthony is pretty adaptable. But more need to be done to polish up his management skill with the key topic of lead by example and lead courageously.	2020-12-18 03:14:58.265263+00	\N	135493917	266	251
398	As a whole management skill need to polish up, therefore have to proactively participate in the management training as and when available.	2020-12-18 03:18:08.754099+00	\N	135493917	267	251
399	As a whole Anthony???s team management skill has been improved but in term of Empowered his subordinate to take responsibility, he needs to improve the follow up to ensure things are moving in the correct direction. \r\nA lot of simple management ownership needed in this aspect of job scope.	2020-12-18 03:29:13.148901+00	\N	135493917	263	251
401	Both ELED and SLED missed target yields. Need yield improvement (ripple, BW, pwr) and demonstrate in Q1'21	2020-12-18 03:55:55.254838+00	\N	324340084	28	255
403	Indeed Hari provide quite a key helping hand to the entire equip team in the aspect of up time tracking and Udoo implementation. But I think it will be good for him to update the improvement promptly in the weekly report for better tracking and visibility.	2020-12-18 04:00:21.770142+00	\N	135493917	277	251
382	1. CS5169A baseline yield 82% (golden 19070A), major yield loss by power, latest repeated wafer 20041A yield is low (5%) for SAMCO reduction condition (power -30%), also wafer broke during plating (not clear impact) . The current EPI SCH=50nm, the next plan is to increase the QWL number and QWL thickness to increase the output power. Children product CS5169A-FA has stricter requirement on power density, the current EPI SCH=40nm, new plan with SCH=45nm was started, pending GATR from FAB A\r\n\r\n2. CS5153A: bandwidth improvement was finished by adopting 6QWL with 7.5nm thickness, latest yield from this wafer is 95% (20146A), pending long term monitor to confirm this result. Further improvement can be done by  centering the wavelength to meet more strict request of children product CS5103A-LU\r\n\r\n3. old product restoration CS68M5A/CS3504A: CS68M5A  wavelength re-centering and was done by DOE PL+/-10nm, the PL is not detectable for PL > 1640nm, pending COS EL to confirm the result. CS3504A EPI restoration condition was confirmed,  wafer is running in FAB B, pending early reading E/Dec\r\n\r\n4. New wafer for FBGL CLS101B-S1550: repeated wafer of 20094A, pending result to confirm	2020-12-17 03:58:20.668659+00	\N	610693885	461	283
383	1. Total 9 modules from SFO and AFR were evaluated. test report was finished before first engagement (E/Sep)\r\n2. Engage AFR as better sub-con than SFO for better thermal response and stability (indirect proof help engage AFR as second source sub-con)\r\n\r\n3. Proposed and proved that the SFO thermal instability was caused by misalignment between FIBR and device front facet.  New power test by PD was done under three different temperature. The result was compared between SFO and AFR and confirmed comparable.\r\n\r\nTwo subcons adopted different material to hold the ferule (SFO -metal  AFR -glass).  The PD results indirectly prooved that the CTE induced mis-alignment in SFO may caused the power difference under different temperature .	2020-12-17 03:59:28.787593+00	\N	610693885	462	283
384	The RMA cases in 2019 is  22 (SLEDS) while 2020 RMA case is 15, decrease 30%.	2020-12-17 04:00:02.268485+00	\N	610693885	463	283
385	Help sales understand the technology specs and assist their engagement activities\r\nFinish the KFA 2.3 SLED marked share analysis , share the knowledge with all related team	2020-12-17 04:00:16.092423+00	\N	610693885	465	283
388	To effectively manage all the wafers start and ensure all tools utilize to its max capability. ??? To constant review of the Cycle Times and Fab Capacity for SLED/ELED, DFB Production / Engineering wafers with process changes, equipment changes to ensure the capacity file are up to date.\r\n- YTD, total start has increase to 10 wafers per week and holding Active WIP is uphold to 50 wafers monthly. All CT is  updated and aligned with process counterpart.\r\n ??? To create a manual tracking system to track process Hold Time when the Engineers delay releasing the wafer due to Rework / Tool Failure ??? To work with IT team to link up all run sheets files, SPC files, OQC reports to reduce manual key in time. ??? To work with IT on the Run sheet Automation, OQC report and Dashboard to broadcast wafer Processing status ??? To ensure all direct material are managed with a good system with zero incident of direct materials shortage issues. \r\n- In progress towards continuous improvement and working with T to achieve the target goal\r\n??? Reporting Fab B Weekly Operation report with visual wafer yield trend and cycle time on time. ??? Submit Fab B Month-end inventory and KPI on time.\r\n - To follow up closely with Process team to ensure Process Tools backup qualification. + Full backup and Flexibility for wafers to run in Oxford and Trion + Full backup and Flexibility for wafers to run in Oxford III-V and SAMCO +Full release of Denton I29 to run AR coat + Tool Backup for EBEAM or contingency plan\r\n- In progress towards continuous improvement and working with T to achieve the target goal	2020-12-17 12:06:51.104166+00	\N	52374544	259	264
371	I still working on Work Instructions and Travellers for re-revise and hope i can have a time to spend on this.. As well as I need to learn myself as part time operator. More fun to learn along  and get know with ILM operators.\r\n\r\nFinally settled down with whiteboard for which urgent to build.\r\n\r\nKeep up-to-date on WIP and Tracking Out of ILM non stop.\r\n\r\nQuite useful for ILM operator to take record down if need to update for inventory on based of ILM000XX within ILM dept only.	2020-12-16 09:39:26.536859+00	\N	231731743	313	326
368	Managed to target for Quarterly completion, 90% shipment.\r\n\r\nWill try to balance time for RMA and Product. Hope they do email and CC to me in together for keep a up to date.\r\n\r\nNeed to get plan about material check once reach 10pcs then asap RAISE together with other.\r\nPrevent from delivery lead time delay.\r\nI also keep update for issue of production boxes.\r\n\r\nTry my best to be on time to delivery	2020-12-16 09:38:04.74133+00	\N	231731743	307	326
386	Take ownership for the housekeeping compliance for the team and drive the team to achieve Zero NC due to housekeeping and safety. \r\n- Achieved and compliance\r\n??? Constantly communicate with the team and align them on housekeeping and safety protocol\r\n- Achieved and compliance\r\n??? Take ownership to ensure Zero non-conformance for Safety violations within the team \r\n- Achieved and compliance\r\n??? Ability to detect safety gaps and resolve them. ??? Ensure that the newcomers are briefed on the safety specs and the document needs to be signed off. ??? To take ownership and responsibility for all safety related issues. \r\n- Achieved and compliance	2020-12-17 11:52:55.787718+00	\N	52374544	273	264
387	Maintain employee work schedules including assignments, job rotation, training, vacations and paid time off, good team communication, coverage for absenteeism, and all other work-related scheduling. \r\nGoal is to ensure there is always good manpower support to the daily MFG need. \r\n- Individual operator job scope and skillset are assigned appropriately in respective station. Operators are trained in different skillset and multi-tasking is assigned to have full coverage and support in all area\r\n??? Empower employees to take responsibility for their jobs and goals. Delegate responsibility and expect accountability and regular feedback. ??? Foster a spirit of teamwork and unity among MFG personnel and other departments (Equip, Process, facility), allows for disagreement over ideas, conflict and expeditious conflict resolution, and the appreciation of diversity as well as cohesiveness, support, and working effectively together to enable each team members, other departments and company to succeed.\r\n- Good team spirit and team work achieved \r\n ??? People Engagement - Through continuous engagement to achieved more support and initiatives from operators and technician to provide feedback for all kinds of improvement opportunity and closure. ??? Instill good Behaviors traits for quality excellence to the entire MFG team members ??? Create systems to eliminate operator???s related Human errors in wafer handling breakage ??? Ensure all operators are certified with in two months after they are on board. ??? Take ownership for the team training needs and attendance. ??? Ensure assigned training for team member are follow through closely with certification. ??? Ensure training received by team members are aligned and help in the execution of their work responsibility. ??? Responsible to ensure OJT for new comers to address their working needs.\r\n- Achieved and in compliance	2020-12-17 12:01:10.248481+00	\N	52374544	274	264
389	Revenue revised to $8m due to COVID-19, most customers are hit by the pandemic with business slowing down.	2020-12-18 00:53:38.583647+00	\N	1710250857	54	331
390	Some RMA cases (eg. Bandweaver, EQ Photonics) taking too long to close, especially replacement units.	2020-12-18 01:05:41.933988+00	\N	1710250857	93	331
405	Expense report was done as requested by boss.\r\nExpense tracking was maintained properly.	2020-12-18 04:02:01.596645+00	\N	1904933651	305	281
395	PO was issued on time and shipping schedule was followed closely to meet requestor requirement.\r\nPO master data sheet was maintained properly to track the status.	2020-12-18 02:09:23.722626+00	\N	1904933651	302	281
406	As a whole Hari provide a good equip support to the MFG, he was remarked by the MFG team as the most outstanding and willing to follow through closely if any issue encountered. The Oxford delay is unfortunate due to the RF Gen failure, but I see Hari as the equipment engineer need to take some responsibility for the part availability issue, as this is common part that was used across four machines.	2020-12-18 04:13:26.527279+00	\N	135493917	275	251
407	In this aspect of goal, Hari is doing pretty well with good commitment.	2020-12-18 04:18:23.042332+00	\N	135493917	278	251
408	In term of equip improvement I think Hari is really one of the better performed engineer. But he need to improve his abilities to resolve those issue that is a bit ambiguous, he need to be technically competent and confident to explain and convince the process that though the equip performance changed a little but the process team should be able to run the tool with some monitoring  to ensure the quality are still intact, this will eliminate a lot of unnecessary equip down, parts change and cost.	2020-12-18 04:31:41.584844+00	\N	135493917	279	251
409	In term of housekeeping , the effort is rather minimum, need to improve.\r\nAs for the safety, I need Hari to watch our when working on tools that is not of Etch nature, as the safety requirement might be quite different, therefore it is good to read and ask for help when working on the high voltage region.	2020-12-18 06:38:47.179704+00	\N	135493917	276	251
410	Wesley is doing a good jobs in all this aspect, he is well like by his team mate due his selfless commitment given to ensure his tool perform up to the necessary standard. All encountered or observed was follow up closely with good CA and PA to ensure reduced the chance of repeated issue.	2020-12-18 06:44:15.123019+00	\N	135493917	428	251
412	Wesley provided a great help to improved the equip's performance through his effort of, always kept a record and procedure of what has been done, with better understanding of the equipment's behaviors and his continues close up on all the important CAs and PAs, both MOCVD and the Fab B Equipment are performing much better stability.	2020-12-18 07:20:25.157571+00	\N	135493917	429	251
414	1) Daily work order tracking is on track met above 90 %.\r\n2) ELED cycle time had met below 6 days, QTD is 4.8 days.	2020-12-18 07:36:29.851005+00	\N	689543953	311	263
415	Writing procedure is upkeep all the record is Wesley's usual strength, no different to the safety requirement.	2020-12-18 07:53:22.112045+00	\N	135493917	430	251
416	Wesley always submit his weekly report on time, with good reflection of what has been done during the week. keep up the good job.	2020-12-18 07:55:03.303221+00	\N	135493917	431	251
417	Wesley not only diligently follow thorough the  PM procedure and schedule, he has been constantly suggest improvement as and when gap observed.	2020-12-18 07:57:15.830736+00	\N	135493917	427	251
418	Q4 revenue had re-adjusted to lower due to economic down turn . \r\nWhat production team can continue contribute to this revenue is provide manpower (O/T) support and flexibilities of tools usage ( high utilization )through multi-skill training.	2020-12-18 07:59:35.814636+00	\N	689543953	312	263
411	1) Quarterly and Monthly shipment target are on red especially ILM shipment still behind the schedule, Production will provide full OT support from now to end of the year.\r\n2) Tester OEE (Machine utilization) : for auto bar and Manual stn 4 testers both testers machine utilization are above 60%, will continue monitor these two testers performance. For Manual tester stn 1 collecting the data since w50 ( w50 close to 60% utilization) now to close monitor it performance.	2020-12-18 07:15:20.892587+00	\N	689543953	308	263
419	in term of scheduled PM, Prabhu was able follow very closely without much problem. \r\nBut I really need his help to improve his trouble shooting capability, skill is just a problem ability to apply good technical logic to decide what to next is very critical in our old tool environment, as any mistake will ligely casue a major down to the tool which we have limited knowledge an parts to get it back to work.	2020-12-18 08:04:52.41708+00	\N	135493917	272	251
420	Many of your mentioned work are a shared task, therefore it is very difficult to differential you capability. \r\nTherefore I suggest try to identify project or improvement in your area of Equipment responsibility, come out the idea and make it happen and chart down all the obstacles you encountered and detail how you over come them.	2020-12-18 08:11:33.000111+00	\N	135493917	271	251
421	I saw some improvement in your commitment your daily work,  but yet to see a good improvement in term of your tools spare control and improvement ideas .	2020-12-18 08:14:28.359949+00	\N	135493917	269	251
422	Prabhu, Every things that you commented here are true to some extend, but my concern is,  I cant see any system to ensure its continuity	2020-12-18 08:18:27.913474+00	\N	135493917	270	251
423	Good team spirit, not calculative with good attitude. Render lots of help to the Facility to repair the obsoleted FFU, Scrubber controller, Air shower. These have resulted a sizeable cost avoidance. \r\nNot limited to facility, Siva also provide lots of repair support to the Fab B equip, particularly with his commitment given, his peers are influenced unknowingly with significant improved commitment in their work.	2020-12-18 08:40:45.328568+00	\N	135493917	436	251
424	In term of housekeeping, I think Siva need to improved and manage his small repair center better. As much as I understand that the PCB repair are a messy work, no matter what the minimum standard of tidiness after his work is a must to maintain. So pls do something here for better 5S.	2020-12-18 08:44:48.814462+00	\N	135493917	437	251
425	I seems Siva always try to resolev issue to it roots. But he tracking and record of his improvement is very lacking, I understand Siva thinks that - paper work should not be the out most important things, but I would like to remind him again, the record is a necessary process to justify each and any individual's performance and ability to keep a record can also improve the alignment within the teams and will aid his job progress, therefore I urge him to spent some time to improve his record and report writing.	2020-12-18 08:50:15.520323+00	\N	135493917	438	251
413	1) Operator cross training 100 % completed (excluded Fiftech tester still not release)  now 5 operators ( 6 work stations) awaiting for trainers certification.\r\n2) Operator's attrition from June to Dec 2020 is 4 out of 12 = 33% therefore from now to next year June 2021 the  attrition rate to reduce 50% will be 2 out of 12.	2020-12-18 07:31:36.840742+00	\N	689543953	309	263
426	Siva has lots of initiative to learn and deep dive to think of encountered issue, the only problem I see in him is the lacking of the actual hands on experience in equipment maintenance, without that exposure his trouble shooting thinking process is always concluded issue likely best on the electronic issue,  but in actual situation, electronic issue is only a fraction of our daily encountered issue. Therefore I see a urgency for Siva to really able to relate him self to the hard true of day to day equip issue that will make him a very holistic and prefect engineer.	2020-12-18 09:05:39.273436+00	\N	135493917	439	251
427	The hardware and software issue are Siva's area of expertise , Thx and keep up the good job.	2020-12-18 09:08:26.615454+00	\N	135493917	440	251
428	Managed overall assembly planning by executing the plan based on the forecast to meet the revenue goal. Aligned the plan between production and engineering build to ensure meet the plan and priority for both. Daily monitoring on the plan by each process in assembly and ensure production execute per plan.	2020-12-18 09:28:57.122501+00	\N	426739617	319	319
429	Manage inventory of materials in-house and consigned parts to ensure availability at the right time and in the right quantity.	2020-12-18 09:30:10.95643+00	\N	161961016	300	321
430	Inventory availability of high runner products are manage considerably even with the event of some production issues encountered.	2020-12-18 09:30:40.310436+00	\N	161961016	299	321
431	No issue. Shipped per plan to meet the revenue. There are few products with yield issue but managed to work with PE to close the gap and minimize the losses.	2020-12-18 09:31:50.854546+00	\N	426739617	320	319
432	- Odoo Work Order is now being rolled out to be used by production.\r\n- SOA Scheduling to Shipment is now fully implemented. Managing the commit dates for customer and at the same time also visibility of manufacturing schedules is being done.\r\n- Intregration of Tier category in PPC Odoo in aid as reference for manufacturing preferential treatment in terms of urgency & priority	2020-12-18 09:32:35.603968+00	\N	161961016	301	321
433	Ongoing and continue to work with team to close all the issues.	2020-12-18 09:32:55.790319+00	\N	426739617	321	319
434	Significant work has been done on both POC1 and 2 upon signing of MOU between Denselight and AMF.\r\n\r\nPOC1:\r\n- Has received edge coupler waveguide samples from AMF and developed test methodologies for optical coupling loss measurements.\r\n- Has made upgrades on the sigmakoki 6-axis alignment tool for characterization of fiber to SOI waveguide edge coupler to fiber coupling loss and finally between the laser diode and edge coupler in both air and index-matching gel medium.\r\n- The optical loss measurements were also supported with optical coupling simulations justified by near and far-field measurements of each optical interface.\r\n- Established estimated coupling loss between AMF FEC(fiber edge coupler) and Denselight standard ridge (with Q-layer) FP laser. Preliminary report shared with Denselight team internally.\r\n- Provided prompt support to help accelerate AMF coupling test with Denselight laser. Construct a COS laser test kit wirebonded to PCB for wired current drive (without probes)\r\n\r\nPOC2:\r\n- Provided flip-chip design inputs to the laser diode design (Canopus)\r\n- Understand and synchronized AMF platform requirement and translated the stack height interference issues with the laser device design team.\r\n- Provided 2D and 3D drawings for illustration and definition of the final die outline to AMF. This is effectively communicated to help AMF design the platform interface to Denselight die.\r\n- Provided layout designs of the platform test vehicles required for the completion of POC2.	2020-12-19 08:08:44.728406+00	\N	1777433913	181	304
435	So far, the DPhi design outlines which encompasses of the laser flip-chip design and solder stack height has been documented. To provide effective coordination of flip-chip laser design work, a generic work flow has been constructed to specify the key die interface parameters which are important in communication with potential customers and SiPh partners. \r\n\r\nVarious platform integration designs have been made for projects with AMF, KFA5.3 and for SOA-SiPh applications. \r\n\r\nAs part of future plans to engage further with SiPh customers, evaluation of Luceda SiPh design platform has been made. \r\n\r\nAlso several patent drafts has been submitted, pending for review with patent office.	2020-12-19 08:27:06.993589+00	\N	1777433913	180	304
436	DPhi knowledge base has been heavily implemented in the area of KFA5.3 so far.\r\n\r\nAs part of the KFA5.3 initiative to consolidate existing knowhow on spot size convertor technology in Denselight, an extensive technical paper has been published internally in contribution to the collective Denselight knowledge base. \r\n\r\nKFA5.3 has been a effective forum in the sharing of DPhi flip-chip design process which involves heavily on optical coupling alignment requirements, bonding interface and solder process, platform layout design.\r\n\r\nKFA5.3 have then repositioned itself towards implementation of DPhi in realising an Ultra-broadband integrated SLED module.	2020-12-19 08:40:56.197096+00	\N	1777433913	182	304
\.


--
-- Data for Name: Profile_discard_skills; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."Profile_discard_skills" (id, name, "course_Attended") FROM stdin;
\.


--
-- Data for Name: Profile_qualifications; Type: TABLE DATA; Schema: public; Owner: benny6789
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
-- Data for Name: Ticketing_ticket; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."Ticketing_ticket" (id, category, title, description, status, created_by_id) FROM stdin;
\.


--
-- Data for Name: Ticketing_ticket_comments; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."Ticketing_ticket_comments" (id, comment, created_on, ticket_id, user_id) FROM stdin;
\.


--
-- Data for Name: Trainings_skill_category; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."Trainings_skill_category" (id, name) FROM stdin;
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
-- Data for Name: Trainings_trainings; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."Trainings_trainings" (id, name, provider, cost, ratings, skill_category_id) FROM stdin;
\.


--
-- Data for Name: Trainings_apply_trainings; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."Trainings_apply_trainings" (id, status, date_start, date_end, approved_by, employee_id, training_id) FROM stdin;
\.


--
-- Data for Name: Trainings_career_discussion; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."Trainings_career_discussion" (id, "Q1", "Q2", "Q3", "Q4", "Q5", "Q6", "Q7", "Q8", employee_id, user_appraisal_id) FROM stdin;
9	NIL	NIL	NIL	NIL	NIL	NIL	NIL	NIL	17	280
\.


--
-- Data for Name: Trainings_skills; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."Trainings_skills" (id, description, weightage, "recommended_Trainings_user", "recommended_Trainings_manager", "recommended_Trainings_board", user_rating, manager_rating, board_rating, user_comments, manager_comments, board_comments, appraisal_id, employee_id, skill_category_id) FROM stdin;
23	Collaboration Skills\r\nTeam work is the force that helps any organization succeed, and learning to collaborate well will bring in the results you need	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	224	1710250857	72
22	Managing Your Priorities\r\nAs work load gets larger, we need to develop the ability to manage priorities	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	224	1710250857	72
24	Behaviour Observation and conflict Resolution - Managing difficult conversations with talking with employee at termination or grievance handling.\r\n\r\nTo attend course: SNEF - Managing Harassment in the work place.	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	154	534558467	19
3	Accounting Standards is very future-proof	100	Accounting Standards Training Part 1, Accounting Standards Training Part 2	Accounting	NIL	4	3	4	I think this is a good skill	I dont think so	NIL	\N	\N	1
35	Got training for the Audit management	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	209	1723530200	4
4	Skills Description 1	100	NIL	You need to go for accounting course 101	NIL	3	2	1	NIL	You need some training.	NIL	\N	\N	2
7	Bridging Strategy to Outcomes\r\nTo support the successful implement of company strategies.\r\nDevelop improved action skills for business development strategy.	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	244	1002214209	91
6	Adapting to Constant Change\r\nTo lead positive attitude and actions during change.\r\nDevelop improved flexibility to adapt changing economy environment.	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	244	1002214209	18
5	Denselight Supervisor training 101: A Supervisor role\r\nTo improve management skills to ensure more collaborative and effective work space.\r\nDevelop improved coaching skills.	40	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	244	1002214209	71
10	Digital Transformation focus on Document Automation	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	156	1224448967	63
11	Personal Data Protection Act 2012 (PDPA),	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	156	1224448967	30
12	Identifying Work Priorities and Setting Verifiable Goals (Individual) (VILT)	40	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	156	1224448967	15
13	Continuously support day to day process related activity to learn and familiarize on the process and issue.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	184	249343659	23
15	Achieve Forum training: Collaboration Skills	20	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	219	439847763	127
16	Be more articulate in presentations so as to communicate with others more effectively	40	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	219	439847763	19
17	Make use of Tibco Spotfire more for wafer level data analysis in development work	40	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	219	439847763	137
18	Supervisor training 101	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	151	988735390	71
19	Singapore Corporate Tax Training course	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	151	988735390	124
9	GST latest changes - free workshop by IRAS when available.	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	227	104959828	2
8	attended course on Effective Cash flow Management, Budgeting on 19 Aug 2020.	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	227	104959828	132
21	GST seminar	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	250	6	2
20	Virtual : Strategy For Costing & Budgeting	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	250	6	2
25	Building Commitment to Result\r\n09 & 12.06.2020	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	222	1014312820	72
26	Supervisory 101 Training\r\n28.03.2020	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	222	1014312820	72
30	Lead the team	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	218	673813648	71
31	Find out the loop hole in the existing process and propose solutions	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	218	673813648	23
32	Deep dive and fully understand ELED/SLED/DFB procoess flow, die design, product application , test spec & charaterization, lesson learnt.	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	161	861437177	129
33	Work closely with QA, NPD and sales to establish and improve the business creation process flow (PDM requirement) for new product development by milestone phase exit.	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	161	861437177	11
28	Improving operations efficiency by 56.19% in terms of distance travel reduction thru the proposed production layout in APT. The data was presented during one of the KFA session.	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	222	1014312820	9
27	Integrating and implementing Odoo in DLS as alternative of ERP system to enhance WIP visibility across departments in DLS and to improve productivity of the employees by doing other value adding task after automating certain process steps such as creating WO and tracking the WO.	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	222	1014312820	122
34	1. Masking process development, resist film thickness tuning/exposure&developer condition optimization\r\n2. Etch process understanding/backup\r\n3. Integration understanding\r\n4. Backlap/N-metal peeling off understanding	5	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	178	1776097184	69
36	By using Tibco Automated the SPC charts for FAB B processes	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	209	1723530200	7
37	Designing the packaging of the NPI products tendered from FOS4x.	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	222	1014312820	74
38	Supervisory training	33	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	188	50985924	93
39	Technical capability for new products at external manufacturers	33	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	188	50985924	82
40	External manufacturing management - costs, MOQs, inventories, etc.	33	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	188	50985924	24
42	Dilemma Management is a strategic tool, not only for leaders, but also for teams, work groups, stakeholders to apply a focused, collaborative approach for analyzing complex business issues where there is no "right" answer or "best" solution, but rather two opposing positions or points of view, each with distinct advantages and disadvantages. The key to dilemma management is to develop a strategy that achieves the advantages of both positions while minimizing the disadvantages.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	200	1777433913	34
43	Storytelling is a communication tool that enhances the meaning, impact, and energy behind ideas. Stories take typical messages and bring them to life, engaging people???s minds and evoking their emotions. Stories transform traditional business communication into exchanges that capture the imagination and build commitment. This module is designed to help.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	200	1777433913	19
41	Research of laser feedback mechanisms to achieve narrow linewidth.	80	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	200	1777433913	109
44	Learn our products' well and do presentation to customers when to visit customers.	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	195	1369735000	128
45	Silicon Photonics e-Learning	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	171	9327697	96
46	Improve knowledge of SLEDs and ELEDs design, processing and testing	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	211	1510925941	74
47	Improve and acquire more knowledge of MOCVD wafer epitaxy	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	211	1510925941	75
48	Technical writing\r\nProject management methodologies	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	179	1906914592	103
76	- Articulate and experienced  in managing hazard and risk control. \r\n- Effective teaching and knowledge sharing skills, and ensures that the team fully understands the big picture.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	196	2047523461	58
50	Skills development on:\r\n1) analytical aspect\r\n2) understanding priority of given tasks	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	234	2076006951	72
49	To develop a project plan starting from scratch (i.e. work package division, key milestone)	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	234	2076006951	103
51	People management skill. \r\nMotive people\r\nhelp people succeed.	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	157	25957709	71
52	Close the deal\r\nPush for the best for Denselight	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	157	25957709	12
29	In depth of all Critical equipment	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	249	5	46
54	???\tDrive initiatives and take smart risks to achieve our goals.\r\n???\tTo believe that excellence is achievable if we put our hearts and minds to achieve it. \r\n???\tTo know that change is needed to improve situations. \r\n???\tTo set out goals and do what it takes to attain them. \r\n???\tTo challenge oneself continuously by setting higher targets after achieving the last set target	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	160	52374544	84
55	Coach & Develop	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	167	973701598	42
56	Buidling commitment to Results	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	167	973701598	41
57	Embark on multiple automation companies to understand better how it can help improve DLS state of operations automation thru online demo or site visits	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	162	1982477965	5
58	Understand and execute Kaizen in line with Best In Class practises	40	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	162	1982477965	18
59	Develop KPI dashboards to drive performance thru data, eg output from the Rapsberry Pi with sensors to measure utilization	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	162	1982477965	94
60	Lead with Influence\r\n(Lead with Influence)	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	215	161961016	34
61	Leading Virtually	40	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	215	161961016	72
62	Communication with Impact\r\n(Communication with Impact)	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	215	161961016	41
64	Building team pride & purpose	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	159	689543953	71
65	Making Collaborative Decisions	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	159	689543953	127
67	Leading Complex Decisions,Making Collaborative Decisions & Problem-Solving Results	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	213	426739617	95
66	Develop a Leadership Mindset	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	213	426739617	71
63	Coil spool for BF 50m and ASE 10m.\r\nPlan to do coil for fosx	60	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	220	231731743	23
68	Build up hardware and software solutions for dataflow pipeline from data source, into storage and eventually into data visualization tools.	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	183	711389827	81
69	Build up hardware and software solutions for dataflow pipeline from data source, into storage and eventually into data visualization tools.	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	183	711389827	122
73	- Demonstrate good leadership and good listening skills. \r\n- Lead by example by showing the team good working attitude, creativity, and going the extra mile. \r\n- Constant team motivation by holding regular discussions and meetings to encourage openness of ideas and allow them to voice their feedback.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	196	2047523461	71
71	Display characteristics of good leadership such as integrity & honesty, positive attitude, work commitment, impartiality and humility.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	196	2047523461	71
72	Multiple disciplines in facilities management to ensure effective and efficient operations, such as operational, preventive maintenance & services, EHS, Fire safety, planning, project management and 6S.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	196	2047523461	47
77	- Constant learning and skills upgrading, so as to ensure the sustainability and updatedness of my ideas and contributions to DSL.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	196	2047523461	73
78	- Vast knowledge of maintenance and management of  different machines / equipment in the semiconductor wafer fab industries.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	196	2047523461	46
70	Experienced and knowledgeable in Workplace Safety & Heath regulations and best practices.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	196	2047523461	136
75	- Consider all factors behind any decisions and avoid rash decision making.\r\n- Ensure decision makings are aligned to DSL or team targets and goals.\r\n- Take decision making initiatives and avoid unnecessary delays while waiting on other parties.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	196	2047523461	34
74	- Be inclusive and friendly to all team members.\r\n- Practice cooperation and democracy at all times.\r\n- Encourage and motivate others to practice the spirit of teamwork.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	196	2047523461	127
79	- Constant communication with team and management to ensure unity and effective teamwork.\r\n- Improve ideas sharing and work relationship.\r\n- Constant communication to ensure up-to-date information and awareness at all times and prevent miscommunication. \r\n- Friendliness, respectfulness, humility and professionalism when communicating with each other to avoid conflict and misunderstanding.	10	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	196	2047523461	19
80	\N	80	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	145	1813039923	109
82	SLED - Photonic Device Physic & Design understanding\r\n1.\tLearn the design aspects of SLED & optimization\r\nTest & measurement of photonic devices	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	204	480020115	82
81	SOA -Photonic device physic & design understanding\r\n1.\tLearn the design aspects of SOA & optimization\r\n2.\tTest & measurement of photonic devices	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	204	480020115	82
83	Understand six sigma and other process control method (SPC) to control the process	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	163	1373136557	75
84	Learning to use Crosslight software to simulate SLED structure and devices	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	163	1373136557	109
85	Behaviour Observation and conflict Resolution - Managing difficult conversations with talking with employee at termination or grievance handling. To attend course: SNEF - Managing Harassment in the work place.	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	256	534558467	19
86	Cyber Security Masterclass	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	164	1428738048	63
87	Privacy Information Management System (PIMS)	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	164	1428738048	63
89	Supervisor training 101	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	261	988735390	71
90	Singapore Corporate Tax Training course	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	261	988735390	124
91	Close the deal Push for the best for Denselight	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	265	25957709	12
92	People management skill. Motive people help people succeed.	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	265	25957709	71
93	To learn & pick up process of MOCVD.	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	190	1598293097	72
88	To have strong knowledge on MOCVD tool.	40	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	190	1598293097	72
94	To learn and pick up skills on making improvements.	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	190	1598293097	72
95	Improvement of Customer Relationship	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	170	1207021661	29
96	Customer experience management to oversees customer interactions	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	170	1207021661	28
98	Safety ERT involvement	20	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	198	1941685512	45
97	Learn from Vendor and through online information as well as the machine Menu provided.	20	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	198	1941685512	95
99	- Communicate with impact\r\n   - Customers\r\n   - Management\r\n   - Managers\r\n   - Team members and fellow colleagues \r\n- Effective engagement \r\n- Efficient usage of leadership style, mainly directing, coaching, and supporting \r\n- Creating organizational values	34	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	238	539619816	71
100	- Organisational needs for disruptive performance compared to competitors\r\n- Effective Product roadmap \r\n- Efficient decision for successful project completion	33	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	238	539619816	90
101	-  Create the highest level of efficiency within the organization\r\n- administration of effective business practices \r\n-  services as efficiently as possible to maximize the profit of an organization.	11	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	238	539619816	14
102	- Presentation Preparation\r\n   - identify goal\r\n   - Know time limit\r\n   - Create value aids if necessary\r\n   - Write in the text about the lecture\r\n   - Memorise\r\n   - Practice\r\n\r\n- Understand the Audience \r\n- Engage the audience	11	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	238	539619816	17
103	-Ideas / Innovation\r\n- Strategy planning\r\n-Target / Goal\r\n-Leadership\r\n- Communication\r\n-Organisation\r\n-People / Team\r\n-Outcome\r\n-Success criteria\r\n-Profit	11	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	238	539619816	16
104	Knowledge\r\n - InP and related materials and devices\r\n - Attendance at international conferences to keep abreast on latest development in materials and device	20	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	150	1557152765	82
105	Advance C# \r\n- To create application with higher and excellent performance	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	214	1608216415	6
107	Be familiar with product issue diagnosis and debug \r\nSetup different test plan to analyse the issue	5	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	176	610693885	98
108	Leaning the data analysis software to improve the efficiency of data summarizing	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	166	2107825133	137
109	To improve the efficiency of problem solving and find out the root cause	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	166	2107825133	95
110	Database Management	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	169	1352141850	31
111	Advance Program Management	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	169	1352141850	103
112	Data Modeling for defect Analysis	40	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	169	1352141850	32
106	Learn how to present a good program for DFB products and new product introduced	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	217	1484926575	103
113	Understand the Fab A and Fab B process and their impact on the yield to deliver timely and correct analysis	50	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	217	1484926575	95
114	Data Analytics, being careful on the data integrity, cleaning the data if there is any noise.	40	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	252	10	31
115	Describe the problem clearly, form a team of expert, look for the root cause, and look for the corrective actions	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	252	10	95
116	Creating Test Plan, Execute the test carefully and in detail manner, Document the test steps.	30	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	252	10	115
117	\N	70	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	241	2125149271	137
118	Hunet Test	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	17	1
119	testing	100	NIL	NIL	NIL	1	1	1	NIL	NIL	NIL	\N	17	1
\.


--
-- Data for Name: Trainings_survey_trainings; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."Trainings_survey_trainings" (id, objectives_met, content_design, trainer_knowledge, training_relevance, recommend_training, training_id) FROM stdin;
\.


--
-- Data for Name: Trainings_training_courses; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public."Trainings_training_courses" (id, name, provider, cost, ratings, skill_category_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public.auth_group (id, name) FROM stdin;
1	HR manager
2	HR
5	Manager
3	Employee
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	GnC	competencies
8	GnC	CompetencyCategory
9	GnC	departmental_competencies
10	GnC	GoalCategory
11	GnC	goals
12	GnC	kpi
13	GnC	GoalComment
14	GnC	departmental_goals
15	GnC	DepartmentalGoalComment
16	GnC	departmental_competencies_comment
17	GnC	CompetencyComment
18	Profile	departments
19	Profile	discard_skills
20	Profile	profile
21	Profile	qualifications
22	Trainings	SkillCategory
23	Trainings	trainings
24	Trainings	training_courses
25	Trainings	survey_trainings
26	Trainings	skills
27	Trainings	career_discussion
28	Trainings	apply_trainings
29	Ticketing	ticket
30	Ticketing	ticket_comments
31	Appraisals	appraisal_category
32	Appraisals	overall_appraisal
33	Appraisals	peerappraisal
34	Appraisals	rating_scale
35	Appraisals	user_appraisal_list
36	Appraisals	peerappraisalquestion
37	Appraisals	appraisal
38	thumbnail	kvstore
39	GnC	comment_box
40	GnC	mid_yr_comment_box
\.







--
-- Data for Name: thumbnail_kvstore; Type: TABLE DATA; Schema: public; Owner: benny6789
--

COPY public.thumbnail_kvstore (key, value) FROM stdin;
\.


--
-- Name: Appraisals_appraisal_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."Appraisals_appraisal_category_id_seq"', 6, true);


--
-- Name: Appraisals_appraisal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."Appraisals_appraisal_id_seq"', 1, false);


--
-- Name: Appraisals_overall_appraisal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."Appraisals_overall_appraisal_id_seq"', 54, true);


--
-- Name: Appraisals_peerappraisal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."Appraisals_peerappraisal_id_seq"', 1, false);


--
-- Name: Appraisals_peerappraisalquestion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."Appraisals_peerappraisalquestion_id_seq"', 1, false);


--
-- Name: Appraisals_rating_scale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."Appraisals_rating_scale_id_seq"', 1, true);


--
-- Name: Appraisals_user_appraisal_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."Appraisals_user_appraisal_list_id_seq"', 289, true);


--
-- Name: GnC_comment_box_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."GnC_comment_box_id_seq"', 146, true);


--
-- Name: GnC_competencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."GnC_competencies_id_seq"', 279, true);


--
-- Name: GnC_competency_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."GnC_competency_category_id_seq"', 10, true);


--
-- Name: GnC_competency_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."GnC_competency_comment_id_seq"', 1, true);


--
-- Name: GnC_departmental_competencies_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."GnC_departmental_competencies_comment_id_seq"', 1, false);


--
-- Name: GnC_departmental_competencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."GnC_departmental_competencies_id_seq"', 8, true);


--
-- Name: GnC_departmental_goal_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."GnC_departmental_goal_comment_id_seq"', 1, false);


--
-- Name: GnC_departmental_goals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."GnC_departmental_goals_id_seq"', 20, true);


--
-- Name: GnC_goal_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."GnC_goal_category_id_seq"', 6, true);


--
-- Name: GnC_goal_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."GnC_goal_comment_id_seq"', 3, true);


--
-- Name: GnC_goals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."GnC_goals_id_seq"', 523, true);


--
-- Name: GnC_kpi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."GnC_kpi_id_seq"', 719, true);


--
-- Name: GnC_mid_yr_comment_box_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."GnC_mid_yr_comment_box_id_seq"', 436, true);


--
-- Name: Profile_departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."Profile_departments_id_seq"', 26, true);


--
-- Name: Profile_discard_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."Profile_discard_skills_id_seq"', 1, false);


--
-- Name: Profile_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."Profile_profile_id_seq"', 20, true);


--
-- Name: Profile_qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."Profile_qualifications_id_seq"', 6, true);


--
-- Name: Ticketing_ticket_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."Ticketing_ticket_comments_id_seq"', 1, false);


--
-- Name: Ticketing_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."Ticketing_ticket_id_seq"', 1, false);


--
-- Name: Trainings_apply_trainings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."Trainings_apply_trainings_id_seq"', 1, false);


--
-- Name: Trainings_career_discussion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."Trainings_career_discussion_id_seq"', 9, true);


--
-- Name: Trainings_skill_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."Trainings_skill_category_id_seq"', 137, true);


--
-- Name: Trainings_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."Trainings_skills_id_seq"', 119, true);


--
-- Name: Trainings_survey_trainings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."Trainings_survey_trainings_id_seq"', 1, false);


--
-- Name: Trainings_training_courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."Trainings_training_courses_id_seq"', 1, false);


--
-- Name: Trainings_trainings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public."Trainings_trainings_id_seq"', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 5, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 306, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 160, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 268, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 368, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 152, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 847, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 40, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benny6789
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 31, true);


--
-- PostgreSQL database dump complete
--

