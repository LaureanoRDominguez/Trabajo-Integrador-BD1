--
-- PostgreSQL database dump
--

\restrict wA2driMd0dbesvWvAe0IMyHyQDPDM6M0kRFSiyhzVHy0xscpsVlRrtPiX96qZox

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: accesos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accesos (
    id_punto_acceso integer NOT NULL,
    nombre character varying(50) NOT NULL,
    tipo character varying(20) NOT NULL,
    id_area integer NOT NULL
);


ALTER TABLE public.accesos OWNER TO postgres;

--
-- Name: areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.areas (
    id_area integer NOT NULL,
    nombre_area character varying(50) NOT NULL
);


ALTER TABLE public.areas OWNER TO postgres;

--
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id_categoria integer NOT NULL,
    nombre_categoria character varying(20) NOT NULL,
    beneficios character varying(255)
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id_usuario integer NOT NULL,
    datos_biometricos bytea,
    puntos integer NOT NULL,
    id_categoria integer NOT NULL
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- Name: corresponde; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.corresponde (
    id_reserva integer NOT NULL,
    id_evento integer NOT NULL
);


ALTER TABLE public.corresponde OWNER TO postgres;

--
-- Name: cuentas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuentas (
    id_cuenta integer NOT NULL,
    usuario character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    tipo_cuenta character varying(10) NOT NULL,
    estado character varying(20) NOT NULL,
    id_rol integer NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE public.cuentas OWNER TO postgres;

--
-- Name: empleados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleados (
    id_usuario integer NOT NULL,
    id_area integer NOT NULL
);


ALTER TABLE public.empleados OWNER TO postgres;

--
-- Name: eventos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eventos (
    id_evento integer NOT NULL,
    nombre_evento character varying(100) NOT NULL,
    fecha_hora timestamp without time zone NOT NULL,
    lugar character varying(100) NOT NULL,
    capacidad integer NOT NULL
);


ALTER TABLE public.eventos OWNER TO postgres;

--
-- Name: incidentes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incidentes (
    id_incidente integer NOT NULL,
    descripcion text NOT NULL,
    fecha_hora timestamp without time zone NOT NULL,
    id_usuario integer NOT NULL,
    id_area integer NOT NULL
);


ALTER TABLE public.incidentes OWNER TO postgres;

--
-- Name: logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs (
    id_log integer NOT NULL,
    fecha_hora_acceso timestamp without time zone NOT NULL,
    terminal character varying(50),
    ip character varying(45),
    id_usuario integer NOT NULL
);


ALTER TABLE public.logs OWNER TO postgres;

--
-- Name: maquinas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maquinas (
    id_maquina integer NOT NULL,
    modelo character varying(50),
    ubicacion character varying(100),
    estado character varying(20) NOT NULL,
    id_area integer NOT NULL
);


ALTER TABLE public.maquinas OWNER TO postgres;

--
-- Name: notificaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notificaciones (
    id_notificacion integer NOT NULL,
    mensaje text NOT NULL,
    tipo character varying(10) NOT NULL,
    fecha_hora_envio timestamp without time zone NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE public.notificaciones OWNER TO postgres;

--
-- Name: otorga; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.otorga (
    id_categoria integer NOT NULL,
    id_promocion integer NOT NULL
);


ALTER TABLE public.otorga OWNER TO postgres;

--
-- Name: promociones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promociones (
    id_promocion integer NOT NULL,
    nombre_promocion character varying(50) NOT NULL,
    descripcion character varying(255) NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_final date NOT NULL
);


ALTER TABLE public.promociones OWNER TO postgres;

--
-- Name: puntos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.puntos (
    id_usuario integer NOT NULL,
    fecha_hora timestamp without time zone NOT NULL,
    cantidad_puntos integer NOT NULL,
    motivo character varying(100) NOT NULL
);


ALTER TABLE public.puntos OWNER TO postgres;

--
-- Name: reservas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservas (
    id_reserva integer NOT NULL,
    fecha_hora_reserva timestamp without time zone NOT NULL,
    tipo_reserva character varying(20) NOT NULL,
    estado character varying(15) NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE public.reservas OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id_rol integer NOT NULL,
    nombre_rol character varying(50) NOT NULL,
    permisos text
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    dni character varying(20) NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    fecha_registro date NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: visitas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visitas (
    id_usuario integer NOT NULL,
    fecha_hora_entrada timestamp without time zone NOT NULL,
    fecha_hora_salida timestamp without time zone,
    id_punto_acceso integer NOT NULL
);


ALTER TABLE public.visitas OWNER TO postgres;

--
-- Data for Name: accesos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accesos (id_punto_acceso, nombre, tipo, id_area) FROM stdin;
1	Acceso 1	Molinete	7
2	Acceso 2	Lector QR	3
3	Acceso 3	Molinete	9
4	Acceso 4	Puerta	9
5	Acceso 5	Molinete	4
6	Acceso 6	Molinete	3
7	Acceso 7	Lector QR	5
8	Acceso 8	Puerta	3
9	Acceso 9	Lector QR	2
10	Acceso 10	Puerta	5
11	Acceso 11	Lector QR	7
12	Acceso 12	Puerta	2
13	Acceso 13	Lector QR	3
14	Acceso 14	Lector QR	5
15	Acceso 15	Puerta	5
16	Acceso 16	Molinete	3
17	Acceso 17	Lector QR	6
18	Acceso 18	Lector QR	3
19	Acceso 19	Lector QR	7
20	Acceso 20	Lector QR	4
\.


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.areas (id_area, nombre_area) FROM stdin;
1	Area 1
2	Area 2
3	Area 3
4	Area 4
5	Area 5
6	Area 6
7	Area 7
8	Area 8
9	Area 9
10	Area 10
\.


--
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id_categoria, nombre_categoria, beneficios) FROM stdin;
1	EstÃ¡ndar	Acceso a promociones generales
2	Oro	Acceso a salon VIP y 10% descuento en restaurante
3	Platino	Todo Oro + shows privados y parking gratis
\.


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id_usuario, datos_biometricos, puntos, id_categoria) FROM stdin;
1	\N	3368	1
2	\N	4544	1
3	\N	3795	3
4	\N	1607	3
5	\N	4003	3
6	\N	3689	2
7	\N	462	3
8	\N	3580	2
9	\N	2412	3
10	\N	1308	3
11	\N	1895	1
12	\N	2529	1
13	\N	3589	3
14	\N	1016	3
15	\N	1370	3
16	\N	3357	3
17	\N	481	3
18	\N	4152	1
19	\N	809	3
20	\N	2796	3
21	\N	2127	1
22	\N	4219	1
23	\N	1408	3
24	\N	2340	1
25	\N	955	3
26	\N	228	1
27	\N	566	2
28	\N	1704	1
29	\N	4348	2
30	\N	4076	3
31	\N	636	1
32	\N	1391	3
33	\N	3983	3
34	\N	583	3
35	\N	1872	3
36	\N	339	3
37	\N	3508	2
38	\N	500	2
39	\N	3516	3
40	\N	2461	3
41	\N	2337	2
42	\N	1145	3
43	\N	3716	3
44	\N	559	3
45	\N	924	2
46	\N	1460	3
47	\N	1894	3
48	\N	4333	1
49	\N	1419	1
50	\N	1466	3
51	\N	3556	3
52	\N	1035	3
53	\N	1625	3
54	\N	1977	1
55	\N	3125	3
56	\N	210	3
57	\N	4956	2
58	\N	1332	3
59	\N	4273	1
60	\N	474	2
61	\N	4777	3
62	\N	441	2
63	\N	4515	1
64	\N	3576	3
65	\N	1279	2
66	\N	2126	1
67	\N	3199	3
68	\N	4126	3
69	\N	963	3
70	\N	1432	3
71	\N	2022	2
72	\N	4211	3
73	\N	2816	2
74	\N	4314	1
75	\N	1784	1
76	\N	929	1
77	\N	638	1
78	\N	1565	1
79	\N	2945	2
80	\N	606	3
81	\N	2089	1
82	\N	889	3
83	\N	2221	3
84	\N	189	2
85	\N	3084	3
86	\N	4575	1
87	\N	909	1
88	\N	3498	1
89	\N	2874	3
90	\N	2082	3
91	\N	1677	3
92	\N	3740	1
93	\N	2659	1
94	\N	3729	3
95	\N	811	1
96	\N	3420	2
97	\N	1427	3
98	\N	2246	3
99	\N	3162	2
100	\N	2889	1
101	\N	1485	3
102	\N	3489	1
103	\N	1772	3
104	\N	4737	2
105	\N	1015	1
106	\N	4380	2
107	\N	4986	3
108	\N	601	1
109	\N	576	2
110	\N	389	3
111	\N	1051	1
112	\N	1958	2
113	\N	374	3
114	\N	2028	1
115	\N	3844	2
116	\N	3153	2
117	\N	4760	3
118	\N	1397	2
119	\N	1385	3
120	\N	4252	1
121	\N	73	1
122	\N	875	1
123	\N	2564	2
124	\N	2535	3
125	\N	4389	3
126	\N	587	1
127	\N	4920	3
128	\N	989	3
129	\N	404	2
130	\N	805	1
131	\N	4930	3
132	\N	3020	2
133	\N	593	3
134	\N	482	1
135	\N	2263	1
136	\N	283	3
137	\N	3547	3
138	\N	3252	1
139	\N	89	2
140	\N	950	2
141	\N	4429	3
142	\N	2881	1
143	\N	189	3
144	\N	3212	2
145	\N	2354	3
146	\N	412	3
147	\N	2158	3
148	\N	2205	2
149	\N	1129	3
150	\N	56	3
151	\N	2246	1
152	\N	2312	2
153	\N	1866	1
154	\N	1412	2
155	\N	944	1
156	\N	2405	2
157	\N	636	2
158	\N	1200	1
159	\N	2169	2
160	\N	3921	2
161	\N	2462	2
162	\N	1419	3
163	\N	3279	2
164	\N	2065	3
165	\N	2896	3
166	\N	2477	2
167	\N	3631	2
168	\N	4596	3
169	\N	3552	1
170	\N	1252	1
171	\N	3569	2
172	\N	4446	2
173	\N	462	1
174	\N	550	3
175	\N	3184	3
176	\N	1155	3
177	\N	2429	2
178	\N	902	2
179	\N	2707	1
180	\N	931	1
181	\N	3255	1
182	\N	2150	2
183	\N	1746	3
184	\N	467	2
185	\N	3594	3
186	\N	469	1
187	\N	4104	3
188	\N	4952	1
189	\N	2683	2
190	\N	4836	2
191	\N	3741	3
192	\N	2594	1
193	\N	1613	3
194	\N	2440	3
195	\N	4668	3
196	\N	2127	3
197	\N	1277	3
198	\N	537	1
199	\N	4285	3
200	\N	3438	2
201	\N	3259	2
202	\N	1706	3
203	\N	734	3
204	\N	4236	2
205	\N	2417	2
206	\N	2940	3
207	\N	2504	3
208	\N	4906	3
209	\N	2962	2
210	\N	3746	2
211	\N	4215	1
212	\N	1900	1
213	\N	1174	2
214	\N	1106	1
215	\N	4725	2
216	\N	1347	2
217	\N	4025	2
218	\N	4543	3
219	\N	1161	3
220	\N	338	3
221	\N	3894	2
222	\N	678	3
223	\N	3695	2
224	\N	1105	1
225	\N	689	2
226	\N	3584	1
227	\N	1678	2
228	\N	4891	3
229	\N	1450	2
230	\N	2218	2
231	\N	1763	1
232	\N	969	1
233	\N	322	1
234	\N	1466	2
235	\N	1370	1
236	\N	2570	3
237	\N	4137	3
238	\N	4901	1
239	\N	701	1
240	\N	1292	1
241	\N	3364	1
242	\N	1297	3
243	\N	2827	2
244	\N	4674	3
245	\N	2944	3
246	\N	1174	2
247	\N	4018	3
248	\N	651	1
249	\N	2191	2
250	\N	2531	1
251	\N	4719	1
252	\N	1376	3
253	\N	1503	2
254	\N	3569	2
255	\N	2685	3
256	\N	4924	3
257	\N	4486	3
258	\N	4133	1
259	\N	4171	3
260	\N	2314	1
261	\N	1048	3
262	\N	60	2
263	\N	372	2
264	\N	4205	3
265	\N	800	2
266	\N	4804	1
267	\N	2862	2
268	\N	4737	1
269	\N	566	3
270	\N	1993	3
271	\N	1901	2
272	\N	2026	2
273	\N	2076	3
274	\N	2030	1
275	\N	4310	2
276	\N	42	3
277	\N	3466	3
278	\N	1598	2
279	\N	3480	3
280	\N	2578	1
281	\N	2948	1
282	\N	929	1
283	\N	3495	2
284	\N	3240	3
285	\N	1611	1
286	\N	302	3
287	\N	3220	2
288	\N	3082	3
289	\N	4533	1
290	\N	4457	1
291	\N	2787	3
292	\N	886	3
293	\N	40	2
294	\N	4567	1
295	\N	3269	1
296	\N	727	2
297	\N	4488	1
298	\N	4821	2
299	\N	4518	1
300	\N	4245	2
301	\N	3070	2
302	\N	4161	3
303	\N	3698	1
304	\N	1407	2
305	\N	2822	2
306	\N	1220	1
307	\N	1644	2
308	\N	1543	2
309	\N	2937	2
310	\N	3010	2
311	\N	802	2
312	\N	2723	1
313	\N	486	2
314	\N	4870	2
315	\N	1001	1
316	\N	3250	1
317	\N	1488	3
318	\N	3562	1
319	\N	3011	3
320	\N	2536	3
321	\N	3971	1
322	\N	2640	2
323	\N	183	2
324	\N	4170	1
325	\N	4038	3
326	\N	757	2
327	\N	342	2
328	\N	70	2
329	\N	3719	3
330	\N	320	1
331	\N	4267	3
332	\N	3726	3
333	\N	3019	3
334	\N	1043	3
335	\N	4070	2
336	\N	3448	2
337	\N	1907	1
338	\N	3302	3
339	\N	2941	1
340	\N	4337	2
341	\N	240	2
342	\N	1562	1
343	\N	609	2
344	\N	1670	3
345	\N	3435	3
346	\N	4692	1
347	\N	1158	2
348	\N	1526	1
349	\N	207	2
350	\N	3820	3
351	\N	1868	2
352	\N	1041	2
353	\N	541	2
354	\N	1865	1
355	\N	2130	3
356	\N	3729	3
357	\N	356	2
358	\N	1385	3
359	\N	3598	3
360	\N	2633	1
361	\N	3700	2
362	\N	750	2
363	\N	3183	3
364	\N	1643	3
365	\N	4128	1
366	\N	206	1
367	\N	1541	1
368	\N	1433	3
369	\N	871	1
370	\N	4017	3
371	\N	1883	3
372	\N	1871	2
373	\N	2554	3
374	\N	4033	3
375	\N	3083	3
376	\N	1707	1
377	\N	1716	2
378	\N	749	2
379	\N	2595	2
380	\N	2866	2
381	\N	3994	2
382	\N	1664	2
383	\N	1786	2
384	\N	356	1
385	\N	700	3
386	\N	2323	1
387	\N	4427	2
388	\N	2118	3
389	\N	233	2
390	\N	4619	3
391	\N	492	3
392	\N	4133	2
393	\N	4068	1
394	\N	4103	3
395	\N	791	3
396	\N	2067	3
397	\N	3340	1
398	\N	1575	1
399	\N	2548	2
400	\N	2964	1
\.


--
-- Data for Name: corresponde; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.corresponde (id_reserva, id_evento) FROM stdin;
3	14
8	17
9	13
10	18
12	6
14	15
25	14
26	3
28	18
31	11
36	17
38	10
42	3
43	4
50	16
52	7
60	14
62	19
74	19
75	12
77	11
79	19
80	20
88	18
89	8
90	16
91	6
92	12
93	15
98	12
102	20
103	19
108	14
112	12
116	10
119	15
122	18
123	20
125	3
132	8
134	20
135	6
144	13
145	19
153	7
157	15
164	18
168	6
169	4
172	20
176	6
177	7
180	4
185	20
188	2
190	11
194	19
196	19
197	1
198	3
205	13
214	12
215	12
217	1
225	6
226	13
228	16
230	18
231	17
232	5
233	16
236	7
247	2
250	11
253	19
257	16
262	3
263	14
268	6
275	12
279	16
280	12
282	10
284	19
285	20
288	10
290	8
294	11
295	18
300	19
306	17
309	10
310	10
313	10
317	13
320	16
325	1
327	14
331	18
332	7
335	4
341	7
345	19
346	14
348	2
353	6
358	10
363	8
367	19
372	7
374	2
379	12
386	10
395	15
396	18
397	15
401	3
408	20
412	13
413	14
414	1
423	14
425	10
429	3
432	5
436	20
437	17
441	5
442	11
449	10
459	17
464	4
465	5
467	4
469	13
473	14
475	10
476	6
478	18
479	8
484	20
488	10
491	8
494	3
500	8
\.


--
-- Data for Name: cuentas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuentas (id_cuenta, usuario, password, tipo_cuenta, estado, id_rol, id_usuario) FROM stdin;
1	cliente1	hash_password_cliente_1	APP	Activa	3	1
2	cliente2	hash_password_cliente_2	APP	Activa	3	2
3	cliente3	hash_password_cliente_3	APP	Activa	3	3
4	cliente4	hash_password_cliente_4	APP	Activa	3	4
5	cliente5	hash_password_cliente_5	APP	Activa	3	5
6	cliente6	hash_password_cliente_6	APP	Activa	3	6
7	cliente7	hash_password_cliente_7	APP	Activa	3	7
8	cliente8	hash_password_cliente_8	APP	Activa	3	8
9	cliente9	hash_password_cliente_9	APP	Activa	3	9
10	cliente10	hash_password_cliente_10	APP	Activa	3	10
11	cliente11	hash_password_cliente_11	APP	Activa	3	11
12	cliente12	hash_password_cliente_12	APP	Activa	3	12
13	cliente13	hash_password_cliente_13	APP	Activa	3	13
14	cliente14	hash_password_cliente_14	APP	Activa	3	14
15	cliente15	hash_password_cliente_15	APP	Activa	3	15
16	cliente16	hash_password_cliente_16	APP	Activa	3	16
17	cliente17	hash_password_cliente_17	APP	Activa	3	17
18	cliente18	hash_password_cliente_18	APP	Activa	3	18
19	cliente19	hash_password_cliente_19	APP	Activa	3	19
20	cliente20	hash_password_cliente_20	APP	Activa	3	20
21	cliente21	hash_password_cliente_21	APP	Activa	3	21
22	cliente22	hash_password_cliente_22	APP	Activa	3	22
23	cliente23	hash_password_cliente_23	APP	Activa	3	23
24	cliente24	hash_password_cliente_24	APP	Activa	3	24
25	cliente25	hash_password_cliente_25	APP	Activa	3	25
26	cliente26	hash_password_cliente_26	APP	Activa	3	26
27	cliente27	hash_password_cliente_27	APP	Activa	3	27
28	cliente28	hash_password_cliente_28	APP	Activa	3	28
29	cliente29	hash_password_cliente_29	APP	Activa	3	29
30	cliente30	hash_password_cliente_30	APP	Activa	3	30
31	cliente31	hash_password_cliente_31	APP	Activa	3	31
32	cliente32	hash_password_cliente_32	APP	Activa	3	32
33	cliente33	hash_password_cliente_33	APP	Activa	3	33
34	cliente34	hash_password_cliente_34	APP	Activa	3	34
35	cliente35	hash_password_cliente_35	APP	Activa	3	35
36	cliente36	hash_password_cliente_36	APP	Activa	3	36
37	cliente37	hash_password_cliente_37	APP	Activa	3	37
38	cliente38	hash_password_cliente_38	APP	Activa	3	38
39	cliente39	hash_password_cliente_39	APP	Activa	3	39
40	cliente40	hash_password_cliente_40	APP	Activa	3	40
41	cliente41	hash_password_cliente_41	APP	Activa	3	41
42	cliente42	hash_password_cliente_42	APP	Activa	3	42
43	cliente43	hash_password_cliente_43	APP	Activa	3	43
44	cliente44	hash_password_cliente_44	APP	Activa	3	44
45	cliente45	hash_password_cliente_45	APP	Activa	3	45
46	cliente46	hash_password_cliente_46	APP	Activa	3	46
47	cliente47	hash_password_cliente_47	APP	Activa	3	47
48	cliente48	hash_password_cliente_48	APP	Activa	3	48
49	cliente49	hash_password_cliente_49	APP	Activa	3	49
50	cliente50	hash_password_cliente_50	APP	Activa	3	50
51	cliente51	hash_password_cliente_51	APP	Activa	3	51
52	cliente52	hash_password_cliente_52	APP	Activa	3	52
53	cliente53	hash_password_cliente_53	APP	Activa	3	53
54	cliente54	hash_password_cliente_54	APP	Activa	3	54
55	cliente55	hash_password_cliente_55	APP	Activa	3	55
56	cliente56	hash_password_cliente_56	APP	Activa	3	56
57	cliente57	hash_password_cliente_57	APP	Activa	3	57
58	cliente58	hash_password_cliente_58	APP	Activa	3	58
59	cliente59	hash_password_cliente_59	APP	Activa	3	59
60	cliente60	hash_password_cliente_60	APP	Activa	3	60
61	cliente61	hash_password_cliente_61	APP	Activa	3	61
62	cliente62	hash_password_cliente_62	APP	Activa	3	62
63	cliente63	hash_password_cliente_63	APP	Activa	3	63
64	cliente64	hash_password_cliente_64	APP	Activa	3	64
65	cliente65	hash_password_cliente_65	APP	Activa	3	65
66	cliente66	hash_password_cliente_66	APP	Activa	3	66
67	cliente67	hash_password_cliente_67	APP	Activa	3	67
68	cliente68	hash_password_cliente_68	APP	Activa	3	68
69	cliente69	hash_password_cliente_69	APP	Activa	3	69
70	cliente70	hash_password_cliente_70	APP	Activa	3	70
71	cliente71	hash_password_cliente_71	APP	Activa	3	71
72	cliente72	hash_password_cliente_72	APP	Activa	3	72
73	cliente73	hash_password_cliente_73	APP	Activa	3	73
74	cliente74	hash_password_cliente_74	APP	Activa	3	74
75	cliente75	hash_password_cliente_75	APP	Activa	3	75
76	cliente76	hash_password_cliente_76	APP	Activa	3	76
77	cliente77	hash_password_cliente_77	APP	Activa	3	77
78	cliente78	hash_password_cliente_78	APP	Activa	3	78
79	cliente79	hash_password_cliente_79	APP	Activa	3	79
80	cliente80	hash_password_cliente_80	APP	Activa	3	80
81	cliente81	hash_password_cliente_81	APP	Activa	3	81
82	cliente82	hash_password_cliente_82	APP	Activa	3	82
83	cliente83	hash_password_cliente_83	APP	Activa	3	83
84	cliente84	hash_password_cliente_84	APP	Activa	3	84
85	cliente85	hash_password_cliente_85	APP	Activa	3	85
86	cliente86	hash_password_cliente_86	APP	Activa	3	86
87	cliente87	hash_password_cliente_87	APP	Activa	3	87
88	cliente88	hash_password_cliente_88	APP	Activa	3	88
89	cliente89	hash_password_cliente_89	APP	Activa	3	89
90	cliente90	hash_password_cliente_90	APP	Activa	3	90
91	cliente91	hash_password_cliente_91	APP	Activa	3	91
92	cliente92	hash_password_cliente_92	APP	Activa	3	92
93	cliente93	hash_password_cliente_93	APP	Activa	3	93
94	cliente94	hash_password_cliente_94	APP	Activa	3	94
95	cliente95	hash_password_cliente_95	APP	Activa	3	95
96	cliente96	hash_password_cliente_96	APP	Activa	3	96
97	cliente97	hash_password_cliente_97	APP	Activa	3	97
98	cliente98	hash_password_cliente_98	APP	Activa	3	98
99	cliente99	hash_password_cliente_99	APP	Activa	3	99
100	cliente100	hash_password_cliente_100	APP	Activa	3	100
101	cliente101	hash_password_cliente_101	APP	Activa	3	101
102	cliente102	hash_password_cliente_102	APP	Activa	3	102
103	cliente103	hash_password_cliente_103	APP	Activa	3	103
104	cliente104	hash_password_cliente_104	APP	Activa	3	104
105	cliente105	hash_password_cliente_105	APP	Activa	3	105
106	cliente106	hash_password_cliente_106	APP	Activa	3	106
107	cliente107	hash_password_cliente_107	APP	Activa	3	107
108	cliente108	hash_password_cliente_108	APP	Activa	3	108
109	cliente109	hash_password_cliente_109	APP	Activa	3	109
110	cliente110	hash_password_cliente_110	APP	Activa	3	110
111	cliente111	hash_password_cliente_111	APP	Activa	3	111
112	cliente112	hash_password_cliente_112	APP	Activa	3	112
113	cliente113	hash_password_cliente_113	APP	Activa	3	113
114	cliente114	hash_password_cliente_114	APP	Activa	3	114
115	cliente115	hash_password_cliente_115	APP	Activa	3	115
116	cliente116	hash_password_cliente_116	APP	Activa	3	116
117	cliente117	hash_password_cliente_117	APP	Activa	3	117
118	cliente118	hash_password_cliente_118	APP	Activa	3	118
119	cliente119	hash_password_cliente_119	APP	Activa	3	119
120	cliente120	hash_password_cliente_120	APP	Activa	3	120
121	cliente121	hash_password_cliente_121	APP	Activa	3	121
122	cliente122	hash_password_cliente_122	APP	Activa	3	122
123	cliente123	hash_password_cliente_123	APP	Activa	3	123
124	cliente124	hash_password_cliente_124	APP	Activa	3	124
125	cliente125	hash_password_cliente_125	APP	Activa	3	125
126	cliente126	hash_password_cliente_126	APP	Activa	3	126
127	cliente127	hash_password_cliente_127	APP	Activa	3	127
128	cliente128	hash_password_cliente_128	APP	Activa	3	128
129	cliente129	hash_password_cliente_129	APP	Activa	3	129
130	cliente130	hash_password_cliente_130	APP	Activa	3	130
131	cliente131	hash_password_cliente_131	APP	Activa	3	131
132	cliente132	hash_password_cliente_132	APP	Activa	3	132
133	cliente133	hash_password_cliente_133	APP	Activa	3	133
134	cliente134	hash_password_cliente_134	APP	Activa	3	134
135	cliente135	hash_password_cliente_135	APP	Activa	3	135
136	cliente136	hash_password_cliente_136	APP	Activa	3	136
137	cliente137	hash_password_cliente_137	APP	Activa	3	137
138	cliente138	hash_password_cliente_138	APP	Activa	3	138
139	cliente139	hash_password_cliente_139	APP	Activa	3	139
140	cliente140	hash_password_cliente_140	APP	Activa	3	140
141	cliente141	hash_password_cliente_141	APP	Activa	3	141
142	cliente142	hash_password_cliente_142	APP	Activa	3	142
143	cliente143	hash_password_cliente_143	APP	Activa	3	143
144	cliente144	hash_password_cliente_144	APP	Activa	3	144
145	cliente145	hash_password_cliente_145	APP	Activa	3	145
146	cliente146	hash_password_cliente_146	APP	Activa	3	146
147	cliente147	hash_password_cliente_147	APP	Activa	3	147
148	cliente148	hash_password_cliente_148	APP	Activa	3	148
149	cliente149	hash_password_cliente_149	APP	Activa	3	149
150	cliente150	hash_password_cliente_150	APP	Activa	3	150
151	cliente151	hash_password_cliente_151	APP	Activa	3	151
152	cliente152	hash_password_cliente_152	APP	Activa	3	152
153	cliente153	hash_password_cliente_153	APP	Activa	3	153
154	cliente154	hash_password_cliente_154	APP	Activa	3	154
155	cliente155	hash_password_cliente_155	APP	Activa	3	155
156	cliente156	hash_password_cliente_156	APP	Activa	3	156
157	cliente157	hash_password_cliente_157	APP	Activa	3	157
158	cliente158	hash_password_cliente_158	APP	Activa	3	158
159	cliente159	hash_password_cliente_159	APP	Activa	3	159
160	cliente160	hash_password_cliente_160	APP	Activa	3	160
161	cliente161	hash_password_cliente_161	APP	Activa	3	161
162	cliente162	hash_password_cliente_162	APP	Activa	3	162
163	cliente163	hash_password_cliente_163	APP	Activa	3	163
164	cliente164	hash_password_cliente_164	APP	Activa	3	164
165	cliente165	hash_password_cliente_165	APP	Activa	3	165
166	cliente166	hash_password_cliente_166	APP	Activa	3	166
167	cliente167	hash_password_cliente_167	APP	Activa	3	167
168	cliente168	hash_password_cliente_168	APP	Activa	3	168
169	cliente169	hash_password_cliente_169	APP	Activa	3	169
170	cliente170	hash_password_cliente_170	APP	Activa	3	170
171	cliente171	hash_password_cliente_171	APP	Activa	3	171
172	cliente172	hash_password_cliente_172	APP	Activa	3	172
173	cliente173	hash_password_cliente_173	APP	Activa	3	173
174	cliente174	hash_password_cliente_174	APP	Activa	3	174
175	cliente175	hash_password_cliente_175	APP	Activa	3	175
176	cliente176	hash_password_cliente_176	APP	Activa	3	176
177	cliente177	hash_password_cliente_177	APP	Activa	3	177
178	cliente178	hash_password_cliente_178	APP	Activa	3	178
179	cliente179	hash_password_cliente_179	APP	Activa	3	179
180	cliente180	hash_password_cliente_180	APP	Activa	3	180
181	cliente181	hash_password_cliente_181	APP	Activa	3	181
182	cliente182	hash_password_cliente_182	APP	Activa	3	182
183	cliente183	hash_password_cliente_183	APP	Activa	3	183
184	cliente184	hash_password_cliente_184	APP	Activa	3	184
185	cliente185	hash_password_cliente_185	APP	Activa	3	185
186	cliente186	hash_password_cliente_186	APP	Activa	3	186
187	cliente187	hash_password_cliente_187	APP	Activa	3	187
188	cliente188	hash_password_cliente_188	APP	Activa	3	188
189	cliente189	hash_password_cliente_189	APP	Activa	3	189
190	cliente190	hash_password_cliente_190	APP	Activa	3	190
191	cliente191	hash_password_cliente_191	APP	Activa	3	191
192	cliente192	hash_password_cliente_192	APP	Activa	3	192
193	cliente193	hash_password_cliente_193	APP	Activa	3	193
194	cliente194	hash_password_cliente_194	APP	Activa	3	194
195	cliente195	hash_password_cliente_195	APP	Activa	3	195
196	cliente196	hash_password_cliente_196	APP	Activa	3	196
197	cliente197	hash_password_cliente_197	APP	Activa	3	197
198	cliente198	hash_password_cliente_198	APP	Activa	3	198
199	cliente199	hash_password_cliente_199	APP	Activa	3	199
200	cliente200	hash_password_cliente_200	APP	Activa	3	200
201	cliente201	hash_password_cliente_201	APP	Activa	3	201
202	cliente202	hash_password_cliente_202	APP	Activa	3	202
203	cliente203	hash_password_cliente_203	APP	Activa	3	203
204	cliente204	hash_password_cliente_204	APP	Activa	3	204
205	cliente205	hash_password_cliente_205	APP	Activa	3	205
206	cliente206	hash_password_cliente_206	APP	Activa	3	206
207	cliente207	hash_password_cliente_207	APP	Activa	3	207
208	cliente208	hash_password_cliente_208	APP	Activa	3	208
209	cliente209	hash_password_cliente_209	APP	Activa	3	209
210	cliente210	hash_password_cliente_210	APP	Activa	3	210
211	cliente211	hash_password_cliente_211	APP	Activa	3	211
212	cliente212	hash_password_cliente_212	APP	Activa	3	212
213	cliente213	hash_password_cliente_213	APP	Activa	3	213
214	cliente214	hash_password_cliente_214	APP	Activa	3	214
215	cliente215	hash_password_cliente_215	APP	Activa	3	215
216	cliente216	hash_password_cliente_216	APP	Activa	3	216
217	cliente217	hash_password_cliente_217	APP	Activa	3	217
218	cliente218	hash_password_cliente_218	APP	Activa	3	218
219	cliente219	hash_password_cliente_219	APP	Activa	3	219
220	cliente220	hash_password_cliente_220	APP	Activa	3	220
221	cliente221	hash_password_cliente_221	APP	Activa	3	221
222	cliente222	hash_password_cliente_222	APP	Activa	3	222
223	cliente223	hash_password_cliente_223	APP	Activa	3	223
224	cliente224	hash_password_cliente_224	APP	Activa	3	224
225	cliente225	hash_password_cliente_225	APP	Activa	3	225
226	cliente226	hash_password_cliente_226	APP	Activa	3	226
227	cliente227	hash_password_cliente_227	APP	Activa	3	227
228	cliente228	hash_password_cliente_228	APP	Activa	3	228
229	cliente229	hash_password_cliente_229	APP	Activa	3	229
230	cliente230	hash_password_cliente_230	APP	Activa	3	230
231	cliente231	hash_password_cliente_231	APP	Activa	3	231
232	cliente232	hash_password_cliente_232	APP	Activa	3	232
233	cliente233	hash_password_cliente_233	APP	Activa	3	233
234	cliente234	hash_password_cliente_234	APP	Activa	3	234
235	cliente235	hash_password_cliente_235	APP	Activa	3	235
236	cliente236	hash_password_cliente_236	APP	Activa	3	236
237	cliente237	hash_password_cliente_237	APP	Activa	3	237
238	cliente238	hash_password_cliente_238	APP	Activa	3	238
239	cliente239	hash_password_cliente_239	APP	Activa	3	239
240	cliente240	hash_password_cliente_240	APP	Activa	3	240
241	cliente241	hash_password_cliente_241	APP	Activa	3	241
242	cliente242	hash_password_cliente_242	APP	Activa	3	242
243	cliente243	hash_password_cliente_243	APP	Activa	3	243
244	cliente244	hash_password_cliente_244	APP	Activa	3	244
245	cliente245	hash_password_cliente_245	APP	Activa	3	245
246	cliente246	hash_password_cliente_246	APP	Activa	3	246
247	cliente247	hash_password_cliente_247	APP	Activa	3	247
248	cliente248	hash_password_cliente_248	APP	Activa	3	248
249	cliente249	hash_password_cliente_249	APP	Activa	3	249
250	cliente250	hash_password_cliente_250	APP	Activa	3	250
251	cliente251	hash_password_cliente_251	APP	Activa	3	251
252	cliente252	hash_password_cliente_252	APP	Activa	3	252
253	cliente253	hash_password_cliente_253	APP	Activa	3	253
254	cliente254	hash_password_cliente_254	APP	Activa	3	254
255	cliente255	hash_password_cliente_255	APP	Activa	3	255
256	cliente256	hash_password_cliente_256	APP	Activa	3	256
257	cliente257	hash_password_cliente_257	APP	Activa	3	257
258	cliente258	hash_password_cliente_258	APP	Activa	3	258
259	cliente259	hash_password_cliente_259	APP	Activa	3	259
260	cliente260	hash_password_cliente_260	APP	Activa	3	260
261	cliente261	hash_password_cliente_261	APP	Activa	3	261
262	cliente262	hash_password_cliente_262	APP	Activa	3	262
263	cliente263	hash_password_cliente_263	APP	Activa	3	263
264	cliente264	hash_password_cliente_264	APP	Activa	3	264
265	cliente265	hash_password_cliente_265	APP	Activa	3	265
266	cliente266	hash_password_cliente_266	APP	Activa	3	266
267	cliente267	hash_password_cliente_267	APP	Activa	3	267
268	cliente268	hash_password_cliente_268	APP	Activa	3	268
269	cliente269	hash_password_cliente_269	APP	Activa	3	269
270	cliente270	hash_password_cliente_270	APP	Activa	3	270
271	cliente271	hash_password_cliente_271	APP	Activa	3	271
272	cliente272	hash_password_cliente_272	APP	Activa	3	272
273	cliente273	hash_password_cliente_273	APP	Activa	3	273
274	cliente274	hash_password_cliente_274	APP	Activa	3	274
275	cliente275	hash_password_cliente_275	APP	Activa	3	275
276	cliente276	hash_password_cliente_276	APP	Activa	3	276
277	cliente277	hash_password_cliente_277	APP	Activa	3	277
278	cliente278	hash_password_cliente_278	APP	Activa	3	278
279	cliente279	hash_password_cliente_279	APP	Activa	3	279
280	cliente280	hash_password_cliente_280	APP	Activa	3	280
281	cliente281	hash_password_cliente_281	APP	Activa	3	281
282	cliente282	hash_password_cliente_282	APP	Activa	3	282
283	cliente283	hash_password_cliente_283	APP	Activa	3	283
284	cliente284	hash_password_cliente_284	APP	Activa	3	284
285	cliente285	hash_password_cliente_285	APP	Activa	3	285
286	cliente286	hash_password_cliente_286	APP	Activa	3	286
287	cliente287	hash_password_cliente_287	APP	Activa	3	287
288	cliente288	hash_password_cliente_288	APP	Activa	3	288
289	cliente289	hash_password_cliente_289	APP	Activa	3	289
290	cliente290	hash_password_cliente_290	APP	Activa	3	290
291	cliente291	hash_password_cliente_291	APP	Activa	3	291
292	cliente292	hash_password_cliente_292	APP	Activa	3	292
293	cliente293	hash_password_cliente_293	APP	Activa	3	293
294	cliente294	hash_password_cliente_294	APP	Activa	3	294
295	cliente295	hash_password_cliente_295	APP	Activa	3	295
296	cliente296	hash_password_cliente_296	APP	Activa	3	296
297	cliente297	hash_password_cliente_297	APP	Activa	3	297
298	cliente298	hash_password_cliente_298	APP	Activa	3	298
299	cliente299	hash_password_cliente_299	APP	Activa	3	299
300	cliente300	hash_password_cliente_300	APP	Activa	3	300
301	cliente301	hash_password_cliente_301	APP	Activa	3	301
302	cliente302	hash_password_cliente_302	APP	Activa	3	302
303	cliente303	hash_password_cliente_303	APP	Activa	3	303
304	cliente304	hash_password_cliente_304	APP	Activa	3	304
305	cliente305	hash_password_cliente_305	APP	Activa	3	305
306	cliente306	hash_password_cliente_306	APP	Activa	3	306
307	cliente307	hash_password_cliente_307	APP	Activa	3	307
308	cliente308	hash_password_cliente_308	APP	Activa	3	308
309	cliente309	hash_password_cliente_309	APP	Activa	3	309
310	cliente310	hash_password_cliente_310	APP	Activa	3	310
311	cliente311	hash_password_cliente_311	APP	Activa	3	311
312	cliente312	hash_password_cliente_312	APP	Activa	3	312
313	cliente313	hash_password_cliente_313	APP	Activa	3	313
314	cliente314	hash_password_cliente_314	APP	Activa	3	314
315	cliente315	hash_password_cliente_315	APP	Activa	3	315
316	cliente316	hash_password_cliente_316	APP	Activa	3	316
317	cliente317	hash_password_cliente_317	APP	Activa	3	317
318	cliente318	hash_password_cliente_318	APP	Activa	3	318
319	cliente319	hash_password_cliente_319	APP	Activa	3	319
320	cliente320	hash_password_cliente_320	APP	Activa	3	320
321	cliente321	hash_password_cliente_321	APP	Activa	3	321
322	cliente322	hash_password_cliente_322	APP	Activa	3	322
323	cliente323	hash_password_cliente_323	APP	Activa	3	323
324	cliente324	hash_password_cliente_324	APP	Activa	3	324
325	cliente325	hash_password_cliente_325	APP	Activa	3	325
326	cliente326	hash_password_cliente_326	APP	Activa	3	326
327	cliente327	hash_password_cliente_327	APP	Activa	3	327
328	cliente328	hash_password_cliente_328	APP	Activa	3	328
329	cliente329	hash_password_cliente_329	APP	Activa	3	329
330	cliente330	hash_password_cliente_330	APP	Activa	3	330
331	cliente331	hash_password_cliente_331	APP	Activa	3	331
332	cliente332	hash_password_cliente_332	APP	Activa	3	332
333	cliente333	hash_password_cliente_333	APP	Activa	3	333
334	cliente334	hash_password_cliente_334	APP	Activa	3	334
335	cliente335	hash_password_cliente_335	APP	Activa	3	335
336	cliente336	hash_password_cliente_336	APP	Activa	3	336
337	cliente337	hash_password_cliente_337	APP	Activa	3	337
338	cliente338	hash_password_cliente_338	APP	Activa	3	338
339	cliente339	hash_password_cliente_339	APP	Activa	3	339
340	cliente340	hash_password_cliente_340	APP	Activa	3	340
341	cliente341	hash_password_cliente_341	APP	Activa	3	341
342	cliente342	hash_password_cliente_342	APP	Activa	3	342
343	cliente343	hash_password_cliente_343	APP	Activa	3	343
344	cliente344	hash_password_cliente_344	APP	Activa	3	344
345	cliente345	hash_password_cliente_345	APP	Activa	3	345
346	cliente346	hash_password_cliente_346	APP	Activa	3	346
347	cliente347	hash_password_cliente_347	APP	Activa	3	347
348	cliente348	hash_password_cliente_348	APP	Activa	3	348
349	cliente349	hash_password_cliente_349	APP	Activa	3	349
350	cliente350	hash_password_cliente_350	APP	Activa	3	350
351	cliente351	hash_password_cliente_351	APP	Activa	3	351
352	cliente352	hash_password_cliente_352	APP	Activa	3	352
353	cliente353	hash_password_cliente_353	APP	Activa	3	353
354	cliente354	hash_password_cliente_354	APP	Activa	3	354
355	cliente355	hash_password_cliente_355	APP	Activa	3	355
356	cliente356	hash_password_cliente_356	APP	Activa	3	356
357	cliente357	hash_password_cliente_357	APP	Activa	3	357
358	cliente358	hash_password_cliente_358	APP	Activa	3	358
359	cliente359	hash_password_cliente_359	APP	Activa	3	359
360	cliente360	hash_password_cliente_360	APP	Activa	3	360
361	cliente361	hash_password_cliente_361	APP	Activa	3	361
362	cliente362	hash_password_cliente_362	APP	Activa	3	362
363	cliente363	hash_password_cliente_363	APP	Activa	3	363
364	cliente364	hash_password_cliente_364	APP	Activa	3	364
365	cliente365	hash_password_cliente_365	APP	Activa	3	365
366	cliente366	hash_password_cliente_366	APP	Activa	3	366
367	cliente367	hash_password_cliente_367	APP	Activa	3	367
368	cliente368	hash_password_cliente_368	APP	Activa	3	368
369	cliente369	hash_password_cliente_369	APP	Activa	3	369
370	cliente370	hash_password_cliente_370	APP	Activa	3	370
371	cliente371	hash_password_cliente_371	APP	Activa	3	371
372	cliente372	hash_password_cliente_372	APP	Activa	3	372
373	cliente373	hash_password_cliente_373	APP	Activa	3	373
374	cliente374	hash_password_cliente_374	APP	Activa	3	374
375	cliente375	hash_password_cliente_375	APP	Activa	3	375
376	cliente376	hash_password_cliente_376	APP	Activa	3	376
377	cliente377	hash_password_cliente_377	APP	Activa	3	377
378	cliente378	hash_password_cliente_378	APP	Activa	3	378
379	cliente379	hash_password_cliente_379	APP	Activa	3	379
380	cliente380	hash_password_cliente_380	APP	Activa	3	380
381	cliente381	hash_password_cliente_381	APP	Activa	3	381
382	cliente382	hash_password_cliente_382	APP	Activa	3	382
383	cliente383	hash_password_cliente_383	APP	Activa	3	383
384	cliente384	hash_password_cliente_384	APP	Activa	3	384
385	cliente385	hash_password_cliente_385	APP	Activa	3	385
386	cliente386	hash_password_cliente_386	APP	Activa	3	386
387	cliente387	hash_password_cliente_387	APP	Activa	3	387
388	cliente388	hash_password_cliente_388	APP	Activa	3	388
389	cliente389	hash_password_cliente_389	APP	Activa	3	389
390	cliente390	hash_password_cliente_390	APP	Activa	3	390
391	cliente391	hash_password_cliente_391	APP	Activa	3	391
392	cliente392	hash_password_cliente_392	APP	Activa	3	392
393	cliente393	hash_password_cliente_393	APP	Activa	3	393
394	cliente394	hash_password_cliente_394	APP	Activa	3	394
395	cliente395	hash_password_cliente_395	APP	Activa	3	395
396	cliente396	hash_password_cliente_396	APP	Activa	3	396
397	cliente397	hash_password_cliente_397	APP	Activa	3	397
398	cliente398	hash_password_cliente_398	APP	Activa	3	398
399	cliente399	hash_password_cliente_399	APP	Activa	3	399
400	cliente400	hash_password_cliente_400	APP	Activa	3	400
401	empleado401	hash_password_empleado_401	INTERNA	Activa	1	401
402	empleado402	hash_password_empleado_402	INTERNA	Activa	2	402
403	empleado403	hash_password_empleado_403	INTERNA	Activa	2	403
404	empleado404	hash_password_empleado_404	INTERNA	Activa	1	404
405	empleado405	hash_password_empleado_405	INTERNA	Activa	2	405
406	empleado406	hash_password_empleado_406	INTERNA	Activa	1	406
407	empleado407	hash_password_empleado_407	INTERNA	Activa	2	407
408	empleado408	hash_password_empleado_408	INTERNA	Activa	2	408
409	empleado409	hash_password_empleado_409	INTERNA	Activa	1	409
410	empleado410	hash_password_empleado_410	INTERNA	Activa	1	410
411	empleado411	hash_password_empleado_411	INTERNA	Activa	1	411
412	empleado412	hash_password_empleado_412	INTERNA	Activa	1	412
413	empleado413	hash_password_empleado_413	INTERNA	Activa	1	413
414	empleado414	hash_password_empleado_414	INTERNA	Activa	1	414
415	empleado415	hash_password_empleado_415	INTERNA	Activa	1	415
416	empleado416	hash_password_empleado_416	INTERNA	Activa	1	416
417	empleado417	hash_password_empleado_417	INTERNA	Activa	2	417
418	empleado418	hash_password_empleado_418	INTERNA	Activa	2	418
419	empleado419	hash_password_empleado_419	INTERNA	Activa	2	419
420	empleado420	hash_password_empleado_420	INTERNA	Activa	1	420
421	empleado421	hash_password_empleado_421	INTERNA	Activa	1	421
422	empleado422	hash_password_empleado_422	INTERNA	Activa	1	422
423	empleado423	hash_password_empleado_423	INTERNA	Activa	1	423
424	empleado424	hash_password_empleado_424	INTERNA	Activa	1	424
425	empleado425	hash_password_empleado_425	INTERNA	Activa	2	425
426	empleado426	hash_password_empleado_426	INTERNA	Activa	1	426
427	empleado427	hash_password_empleado_427	INTERNA	Activa	2	427
428	empleado428	hash_password_empleado_428	INTERNA	Activa	1	428
429	empleado429	hash_password_empleado_429	INTERNA	Activa	2	429
430	empleado430	hash_password_empleado_430	INTERNA	Activa	2	430
431	empleado431	hash_password_empleado_431	INTERNA	Activa	2	431
432	empleado432	hash_password_empleado_432	INTERNA	Activa	2	432
433	empleado433	hash_password_empleado_433	INTERNA	Activa	1	433
434	empleado434	hash_password_empleado_434	INTERNA	Activa	2	434
435	empleado435	hash_password_empleado_435	INTERNA	Activa	2	435
436	empleado436	hash_password_empleado_436	INTERNA	Activa	2	436
437	empleado437	hash_password_empleado_437	INTERNA	Activa	1	437
438	empleado438	hash_password_empleado_438	INTERNA	Activa	1	438
439	empleado439	hash_password_empleado_439	INTERNA	Activa	2	439
440	empleado440	hash_password_empleado_440	INTERNA	Activa	1	440
441	empleado441	hash_password_empleado_441	INTERNA	Activa	2	441
442	empleado442	hash_password_empleado_442	INTERNA	Activa	2	442
443	empleado443	hash_password_empleado_443	INTERNA	Activa	1	443
444	empleado444	hash_password_empleado_444	INTERNA	Activa	1	444
445	empleado445	hash_password_empleado_445	INTERNA	Activa	2	445
446	empleado446	hash_password_empleado_446	INTERNA	Activa	1	446
447	empleado447	hash_password_empleado_447	INTERNA	Activa	1	447
448	empleado448	hash_password_empleado_448	INTERNA	Activa	2	448
449	empleado449	hash_password_empleado_449	INTERNA	Activa	2	449
450	empleado450	hash_password_empleado_450	INTERNA	Activa	2	450
451	empleado451	hash_password_empleado_451	INTERNA	Activa	2	451
452	empleado452	hash_password_empleado_452	INTERNA	Activa	2	452
453	empleado453	hash_password_empleado_453	INTERNA	Activa	1	453
454	empleado454	hash_password_empleado_454	INTERNA	Activa	1	454
455	empleado455	hash_password_empleado_455	INTERNA	Activa	2	455
456	empleado456	hash_password_empleado_456	INTERNA	Activa	2	456
457	empleado457	hash_password_empleado_457	INTERNA	Activa	1	457
458	empleado458	hash_password_empleado_458	INTERNA	Activa	1	458
459	empleado459	hash_password_empleado_459	INTERNA	Activa	2	459
460	empleado460	hash_password_empleado_460	INTERNA	Activa	2	460
461	empleado461	hash_password_empleado_461	INTERNA	Activa	2	461
462	empleado462	hash_password_empleado_462	INTERNA	Activa	1	462
463	empleado463	hash_password_empleado_463	INTERNA	Activa	1	463
464	empleado464	hash_password_empleado_464	INTERNA	Activa	2	464
465	empleado465	hash_password_empleado_465	INTERNA	Activa	2	465
466	empleado466	hash_password_empleado_466	INTERNA	Activa	2	466
467	empleado467	hash_password_empleado_467	INTERNA	Activa	2	467
468	empleado468	hash_password_empleado_468	INTERNA	Activa	1	468
469	empleado469	hash_password_empleado_469	INTERNA	Activa	1	469
470	empleado470	hash_password_empleado_470	INTERNA	Activa	1	470
471	empleado471	hash_password_empleado_471	INTERNA	Activa	2	471
472	empleado472	hash_password_empleado_472	INTERNA	Activa	1	472
473	empleado473	hash_password_empleado_473	INTERNA	Activa	2	473
474	empleado474	hash_password_empleado_474	INTERNA	Activa	2	474
475	empleado475	hash_password_empleado_475	INTERNA	Activa	2	475
476	empleado476	hash_password_empleado_476	INTERNA	Activa	2	476
477	empleado477	hash_password_empleado_477	INTERNA	Activa	1	477
478	empleado478	hash_password_empleado_478	INTERNA	Activa	2	478
479	empleado479	hash_password_empleado_479	INTERNA	Activa	1	479
480	empleado480	hash_password_empleado_480	INTERNA	Activa	1	480
481	empleado481	hash_password_empleado_481	INTERNA	Activa	2	481
482	empleado482	hash_password_empleado_482	INTERNA	Activa	2	482
483	empleado483	hash_password_empleado_483	INTERNA	Activa	2	483
484	empleado484	hash_password_empleado_484	INTERNA	Activa	2	484
485	empleado485	hash_password_empleado_485	INTERNA	Activa	2	485
486	empleado486	hash_password_empleado_486	INTERNA	Activa	1	486
487	empleado487	hash_password_empleado_487	INTERNA	Activa	2	487
488	empleado488	hash_password_empleado_488	INTERNA	Activa	2	488
489	empleado489	hash_password_empleado_489	INTERNA	Activa	2	489
490	empleado490	hash_password_empleado_490	INTERNA	Activa	1	490
491	empleado491	hash_password_empleado_491	INTERNA	Activa	1	491
492	empleado492	hash_password_empleado_492	INTERNA	Activa	1	492
493	empleado493	hash_password_empleado_493	INTERNA	Activa	1	493
494	empleado494	hash_password_empleado_494	INTERNA	Activa	2	494
495	empleado495	hash_password_empleado_495	INTERNA	Activa	2	495
496	empleado496	hash_password_empleado_496	INTERNA	Activa	2	496
497	empleado497	hash_password_empleado_497	INTERNA	Activa	2	497
498	empleado498	hash_password_empleado_498	INTERNA	Activa	1	498
499	empleado499	hash_password_empleado_499	INTERNA	Activa	1	499
500	empleado500	hash_password_empleado_500	INTERNA	Activa	1	500
\.


--
-- Data for Name: empleados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleados (id_usuario, id_area) FROM stdin;
401	1
402	1
403	7
404	10
405	6
406	7
407	9
408	3
409	7
410	2
411	5
412	5
413	6
414	2
415	4
416	1
417	5
418	5
419	1
420	9
421	8
422	9
423	7
424	2
425	10
426	5
427	3
428	6
429	1
430	8
431	7
432	3
433	8
434	10
435	3
436	4
437	4
438	7
439	3
440	3
441	9
442	9
443	7
444	3
445	3
446	4
447	7
448	7
449	5
450	10
451	6
452	8
453	5
454	6
455	5
456	10
457	3
458	4
459	7
460	2
461	1
462	4
463	1
464	7
465	2
466	5
467	4
468	4
469	6
470	8
471	5
472	4
473	10
474	7
475	5
476	5
477	3
478	3
479	5
480	4
481	6
482	2
483	9
484	9
485	7
486	2
487	1
488	6
489	10
490	8
491	3
492	2
493	6
494	5
495	4
496	10
497	3
498	1
499	1
500	9
\.


--
-- Data for Name: eventos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.eventos (id_evento, nombre_evento, fecha_hora, lugar, capacidad) FROM stdin;
1	Evento Especial 1	2024-01-06 10:33:28.813469	Salon Principal	129
2	Evento Especial 2	2026-04-30 16:37:50.745131	Salon Principal	171
3	Evento Especial 3	2026-08-14 07:26:42.652841	Salon Principal	129
4	Evento Especial 4	2026-01-27 01:52:38.708605	Salon Principal	178
5	Evento Especial 5	2026-08-17 15:37:44.397409	Salon Principal	118
6	Evento Especial 6	2025-05-21 12:47:24.317967	Salon Principal	183
7	Evento Especial 7	2023-11-20 13:56:26.206093	Salon Principal	139
8	Evento Especial 8	2025-08-07 07:28:45.457307	Salon Principal	123
9	Evento Especial 9	2024-11-12 02:40:15.180097	Salon Principal	136
10	Evento Especial 10	2025-12-27 00:37:39.047408	Salon Principal	176
11	Evento Especial 11	2024-07-23 08:12:58.999313	Salon Principal	144
12	Evento Especial 12	2024-07-04 10:01:09.036997	Salon Principal	193
13	Evento Especial 13	2026-05-20 14:24:41.980283	Salon Principal	161
14	Evento Especial 14	2024-11-26 04:40:51.307062	Salon Principal	122
15	Evento Especial 15	2025-12-29 10:44:45.586486	Salon Principal	143
16	Evento Especial 16	2025-05-27 00:49:53.391098	Salon Principal	187
17	Evento Especial 17	2026-07-22 16:01:35.163108	Salon Principal	166
18	Evento Especial 18	2023-12-03 03:00:08.567092	Salon Principal	188
19	Evento Especial 19	2024-12-28 05:16:14.367349	Salon Principal	104
20	Evento Especial 20	2023-09-23 22:01:41.08329	Salon Principal	197
\.


--
-- Data for Name: incidentes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incidentes (id_incidente, descripcion, fecha_hora, id_usuario, id_area) FROM stdin;
1	Descripcion del incidente 1	2025-12-27 01:53:42.292567	429	1
2	Descripcion del incidente 2	2024-12-23 09:48:35.549064	472	3
3	Descripcion del incidente 3	2023-11-20 13:23:04.491642	454	7
4	Descripcion del incidente 4	2023-10-05 01:21:50.913297	413	9
5	Descripcion del incidente 5	2025-03-17 22:09:54.249093	446	7
6	Descripcion del incidente 6	2024-08-15 02:33:03.058538	413	3
7	Descripcion del incidente 7	2025-06-26 23:01:43.675135	440	6
8	Descripcion del incidente 8	2026-06-18 07:25:57.577505	420	4
9	Descripcion del incidente 9	2024-04-11 16:30:42.618147	484	3
10	Descripcion del incidente 10	2024-05-17 22:05:25.420097	490	10
11	Descripcion del incidente 11	2024-04-24 17:43:04.360816	453	5
12	Descripcion del incidente 12	2025-12-24 10:55:49.706479	459	5
13	Descripcion del incidente 13	2024-12-31 18:46:19.972583	475	3
14	Descripcion del incidente 14	2026-02-13 05:46:48.482743	465	2
15	Descripcion del incidente 15	2023-11-04 16:59:52.51092	481	10
16	Descripcion del incidente 16	2024-10-28 05:43:20.021096	466	5
17	Descripcion del incidente 17	2024-04-26 11:18:06.532699	447	1
18	Descripcion del incidente 18	2023-10-28 05:58:51.968729	446	6
19	Descripcion del incidente 19	2024-07-26 01:35:31.276584	413	9
20	Descripcion del incidente 20	2026-09-14 04:52:05.165856	435	8
21	Descripcion del incidente 21	2023-12-14 02:07:08.503423	483	6
22	Descripcion del incidente 22	2024-11-10 21:12:21.059168	467	3
23	Descripcion del incidente 23	2026-06-12 11:26:51.001601	404	1
24	Descripcion del incidente 24	2025-08-25 14:49:24.702509	435	5
25	Descripcion del incidente 25	2024-06-15 01:18:47.315604	419	4
26	Descripcion del incidente 26	2025-08-16 11:24:00.218405	418	10
27	Descripcion del incidente 27	2026-04-08 23:39:01.011748	454	10
28	Descripcion del incidente 28	2026-02-28 12:41:19.684542	453	10
29	Descripcion del incidente 29	2026-06-14 06:23:01.311839	453	7
30	Descripcion del incidente 30	2026-03-03 15:00:43.581425	491	10
31	Descripcion del incidente 31	2023-12-30 00:42:23.183466	494	10
32	Descripcion del incidente 32	2026-01-12 04:26:37.831551	433	6
33	Descripcion del incidente 33	2025-06-28 20:07:15.243913	415	6
34	Descripcion del incidente 34	2024-07-16 18:18:29.900101	441	1
35	Descripcion del incidente 35	2026-03-27 11:15:47.71861	473	2
36	Descripcion del incidente 36	2025-04-22 18:51:28.749073	415	1
37	Descripcion del incidente 37	2024-06-18 23:05:33.111081	471	7
38	Descripcion del incidente 38	2026-08-16 16:08:34.731511	458	7
39	Descripcion del incidente 39	2026-05-07 12:30:53.954404	487	8
40	Descripcion del incidente 40	2026-07-05 14:19:52.542196	491	2
41	Descripcion del incidente 41	2026-04-02 02:33:00.608738	491	1
42	Descripcion del incidente 42	2026-07-18 04:48:42.975123	457	6
43	Descripcion del incidente 43	2023-10-01 19:24:29.126684	484	10
44	Descripcion del incidente 44	2023-11-26 20:26:23.18436	417	7
45	Descripcion del incidente 45	2026-05-21 11:38:30.062403	430	10
46	Descripcion del incidente 46	2024-07-02 19:33:10.257288	433	2
47	Descripcion del incidente 47	2025-09-17 07:51:35.470767	500	2
48	Descripcion del incidente 48	2026-09-18 02:27:50.005917	439	4
49	Descripcion del incidente 49	2026-05-29 15:36:18.145072	445	2
50	Descripcion del incidente 50	2024-06-18 21:20:51.301545	430	7
51	Descripcion del incidente 51	2024-08-01 15:02:39.147445	490	5
52	Descripcion del incidente 52	2025-10-24 06:23:54.311709	435	1
53	Descripcion del incidente 53	2026-04-01 01:10:07.226932	406	5
54	Descripcion del incidente 54	2024-07-25 07:07:35.695117	443	4
55	Descripcion del incidente 55	2023-09-26 15:06:36.197474	498	5
56	Descripcion del incidente 56	2026-01-30 22:26:45.124014	419	9
57	Descripcion del incidente 57	2025-11-30 05:06:46.253476	468	2
58	Descripcion del incidente 58	2025-05-21 15:08:30.309341	463	8
59	Descripcion del incidente 59	2024-04-21 11:52:13.826154	413	9
60	Descripcion del incidente 60	2024-01-31 18:28:16.295025	484	2
61	Descripcion del incidente 61	2025-08-02 01:52:53.978813	420	3
62	Descripcion del incidente 62	2024-05-27 04:31:39.263355	459	1
63	Descripcion del incidente 63	2026-06-01 08:00:12.222238	493	4
64	Descripcion del incidente 64	2025-06-30 18:42:21.667286	430	4
65	Descripcion del incidente 65	2023-10-08 21:41:51.602431	460	4
66	Descripcion del incidente 66	2024-11-13 18:16:16.124438	428	10
67	Descripcion del incidente 67	2026-07-09 11:13:16.148451	473	4
68	Descripcion del incidente 68	2023-12-17 03:53:35.512963	492	2
69	Descripcion del incidente 69	2026-01-09 14:40:43.010537	472	10
70	Descripcion del incidente 70	2024-11-13 08:29:09.068049	468	7
71	Descripcion del incidente 71	2025-11-13 10:21:53.853285	438	4
72	Descripcion del incidente 72	2024-06-20 16:34:43.245662	422	8
73	Descripcion del incidente 73	2025-07-19 21:54:27.029325	407	10
74	Descripcion del incidente 74	2024-04-18 05:55:38.214316	403	5
75	Descripcion del incidente 75	2026-02-22 20:43:10.661014	417	3
76	Descripcion del incidente 76	2026-05-24 01:23:12.510257	439	1
77	Descripcion del incidente 77	2024-08-02 20:16:56.40513	463	7
78	Descripcion del incidente 78	2026-01-01 03:14:30.204123	473	10
79	Descripcion del incidente 79	2026-06-05 07:38:03.904721	474	5
80	Descripcion del incidente 80	2026-09-01 05:15:56.373768	498	5
81	Descripcion del incidente 81	2024-12-18 16:57:09.076927	490	10
82	Descripcion del incidente 82	2024-04-30 12:07:54.503002	456	6
83	Descripcion del incidente 83	2024-09-24 20:16:11.011573	427	3
84	Descripcion del incidente 84	2026-08-26 14:07:17.918982	469	5
85	Descripcion del incidente 85	2026-02-10 20:37:44.803382	421	1
86	Descripcion del incidente 86	2023-09-22 18:02:26.019316	410	5
87	Descripcion del incidente 87	2023-10-02 11:11:28.731858	446	4
88	Descripcion del incidente 88	2026-03-02 03:01:22.433363	471	1
89	Descripcion del incidente 89	2024-08-15 02:22:21.860347	494	8
90	Descripcion del incidente 90	2025-10-11 02:17:35.834213	451	2
91	Descripcion del incidente 91	2025-12-01 02:57:42.967219	414	6
92	Descripcion del incidente 92	2025-12-07 16:24:44.870521	421	8
93	Descripcion del incidente 93	2025-07-14 10:37:43.211092	472	10
94	Descripcion del incidente 94	2024-11-26 03:52:43.862473	422	7
95	Descripcion del incidente 95	2026-05-26 13:16:49.405961	442	1
96	Descripcion del incidente 96	2026-04-23 11:43:18.383618	474	6
97	Descripcion del incidente 97	2024-01-15 19:39:14.42707	415	6
98	Descripcion del incidente 98	2025-07-31 10:32:50.749466	473	7
99	Descripcion del incidente 99	2026-07-03 01:52:34.274441	461	1
100	Descripcion del incidente 100	2025-11-15 05:10:50.530306	419	10
101	Descripcion del incidente 101	2024-10-21 03:59:19.982432	403	9
102	Descripcion del incidente 102	2024-04-25 11:47:25.269987	415	1
103	Descripcion del incidente 103	2025-02-14 21:33:41.426253	473	7
104	Descripcion del incidente 104	2026-07-23 15:19:54.548814	463	8
105	Descripcion del incidente 105	2025-04-20 15:04:13.794833	424	1
106	Descripcion del incidente 106	2024-09-28 17:11:28.801325	439	5
107	Descripcion del incidente 107	2026-01-23 13:47:59.63189	499	2
108	Descripcion del incidente 108	2024-04-29 17:22:16.926243	424	2
109	Descripcion del incidente 109	2025-04-28 15:48:03.042223	414	3
110	Descripcion del incidente 110	2023-12-14 16:35:53.955164	436	6
111	Descripcion del incidente 111	2026-03-28 04:37:45.315156	487	9
112	Descripcion del incidente 112	2025-01-30 17:55:06.670439	461	9
113	Descripcion del incidente 113	2026-02-04 03:47:41.96837	429	4
114	Descripcion del incidente 114	2025-11-03 17:34:10.561932	434	10
115	Descripcion del incidente 115	2024-03-07 00:58:06.336941	432	8
116	Descripcion del incidente 116	2023-12-25 00:03:03.868888	450	2
117	Descripcion del incidente 117	2024-10-27 09:19:24.652024	498	10
118	Descripcion del incidente 118	2026-01-12 15:09:20.892036	459	3
119	Descripcion del incidente 119	2026-04-13 21:57:24.767863	422	5
120	Descripcion del incidente 120	2026-01-28 14:30:17.114882	425	3
121	Descripcion del incidente 121	2024-03-09 09:41:06.120068	469	1
122	Descripcion del incidente 122	2024-07-27 19:23:52.82898	496	6
123	Descripcion del incidente 123	2025-01-21 15:21:56.697817	413	8
124	Descripcion del incidente 124	2024-10-12 23:49:13.361605	463	4
125	Descripcion del incidente 125	2025-06-28 09:52:42.268488	468	3
126	Descripcion del incidente 126	2024-06-10 04:10:38.76014	474	4
127	Descripcion del incidente 127	2024-10-15 04:31:26.107512	408	3
128	Descripcion del incidente 128	2024-04-03 23:22:29.774097	452	10
129	Descripcion del incidente 129	2025-02-16 02:52:32.564086	436	4
130	Descripcion del incidente 130	2025-10-13 10:57:01.25697	460	9
131	Descripcion del incidente 131	2023-11-21 05:31:43.575926	432	9
132	Descripcion del incidente 132	2025-04-18 06:57:53.82583	471	4
133	Descripcion del incidente 133	2025-08-22 07:35:03.792949	401	2
134	Descripcion del incidente 134	2025-07-12 19:19:40.606728	418	9
135	Descripcion del incidente 135	2025-01-18 09:30:20.303435	487	9
136	Descripcion del incidente 136	2025-09-14 08:23:23.873713	417	2
137	Descripcion del incidente 137	2025-09-11 19:02:53.3442	451	6
138	Descripcion del incidente 138	2024-10-22 23:31:09.076665	416	10
139	Descripcion del incidente 139	2024-02-17 13:23:43.71964	440	6
140	Descripcion del incidente 140	2026-07-27 22:48:41.761376	402	3
141	Descripcion del incidente 141	2025-09-17 18:53:34.135299	454	3
142	Descripcion del incidente 142	2024-10-24 06:08:17.491489	442	1
143	Descripcion del incidente 143	2026-04-12 14:43:57.426818	465	5
144	Descripcion del incidente 144	2024-02-11 19:31:45.799872	446	7
145	Descripcion del incidente 145	2023-10-11 02:39:45.655027	466	10
146	Descripcion del incidente 146	2024-01-04 09:03:29.78132	412	7
147	Descripcion del incidente 147	2024-02-09 21:10:54.592635	445	7
148	Descripcion del incidente 148	2024-06-17 06:08:16.762999	476	4
149	Descripcion del incidente 149	2026-01-16 20:58:23.830732	442	4
150	Descripcion del incidente 150	2025-11-01 01:50:42.650257	470	6
151	Descripcion del incidente 151	2026-05-06 22:17:23.188995	454	5
152	Descripcion del incidente 152	2024-09-04 04:51:55.333526	434	10
153	Descripcion del incidente 153	2026-04-22 14:24:34.471236	491	8
154	Descripcion del incidente 154	2025-09-04 21:30:21.604861	460	5
155	Descripcion del incidente 155	2024-04-04 17:03:07.017851	485	4
156	Descripcion del incidente 156	2026-07-28 15:45:56.314324	443	9
157	Descripcion del incidente 157	2024-05-01 22:11:06.086005	470	3
158	Descripcion del incidente 158	2023-12-19 07:39:24.452301	496	7
159	Descripcion del incidente 159	2023-12-12 23:15:21.627952	413	10
160	Descripcion del incidente 160	2026-01-10 08:15:11.712019	475	6
161	Descripcion del incidente 161	2026-06-21 02:14:49.395484	414	8
162	Descripcion del incidente 162	2024-04-05 23:21:54.985203	472	5
163	Descripcion del incidente 163	2026-09-16 03:15:38.39919	435	1
164	Descripcion del incidente 164	2026-05-06 14:31:50.828242	437	10
165	Descripcion del incidente 165	2023-11-28 03:03:49.28987	419	7
166	Descripcion del incidente 166	2023-10-16 19:29:46.359732	493	7
167	Descripcion del incidente 167	2024-09-17 04:13:07.062439	409	5
168	Descripcion del incidente 168	2025-08-17 06:26:12.21339	424	8
169	Descripcion del incidente 169	2025-10-06 20:41:24.6849	409	10
170	Descripcion del incidente 170	2024-08-19 01:49:23.883123	433	10
171	Descripcion del incidente 171	2023-11-23 20:03:02.913545	461	7
172	Descripcion del incidente 172	2024-04-07 16:17:50.719193	443	7
173	Descripcion del incidente 173	2024-12-11 17:24:37.080149	462	7
174	Descripcion del incidente 174	2023-12-21 18:08:15.785167	456	7
175	Descripcion del incidente 175	2026-01-30 04:03:51.732634	444	6
176	Descripcion del incidente 176	2024-11-21 22:38:04.621247	475	7
177	Descripcion del incidente 177	2024-05-03 00:45:14.251283	466	10
178	Descripcion del incidente 178	2025-04-11 05:07:23.352742	469	1
179	Descripcion del incidente 179	2026-04-08 04:16:26.47484	484	10
180	Descripcion del incidente 180	2025-05-27 19:10:31.895545	467	8
181	Descripcion del incidente 181	2025-07-13 15:22:01.713002	410	5
182	Descripcion del incidente 182	2024-09-13 14:38:43.63735	487	1
183	Descripcion del incidente 183	2025-04-28 20:48:08.842155	455	5
184	Descripcion del incidente 184	2026-04-19 10:52:52.168561	401	4
185	Descripcion del incidente 185	2025-06-14 09:07:08.89279	441	10
186	Descripcion del incidente 186	2026-01-22 13:09:21.910314	424	1
187	Descripcion del incidente 187	2025-03-20 19:24:10.836759	405	10
188	Descripcion del incidente 188	2026-01-22 21:33:38.00628	432	7
189	Descripcion del incidente 189	2026-09-05 03:43:57.688615	497	3
190	Descripcion del incidente 190	2026-09-14 12:07:13.508889	480	4
191	Descripcion del incidente 191	2023-09-22 17:42:37.371736	410	7
192	Descripcion del incidente 192	2026-05-09 23:20:22.395968	435	1
193	Descripcion del incidente 193	2026-06-28 01:14:06.989099	475	7
194	Descripcion del incidente 194	2025-04-26 15:04:18.655073	440	3
195	Descripcion del incidente 195	2023-11-29 18:57:40.228134	466	1
196	Descripcion del incidente 196	2026-01-26 15:43:05.066099	440	6
197	Descripcion del incidente 197	2024-08-15 18:35:33.439245	457	7
198	Descripcion del incidente 198	2023-12-05 18:35:57.627701	447	7
199	Descripcion del incidente 199	2025-04-04 13:47:26.413438	451	3
200	Descripcion del incidente 200	2026-01-03 23:40:40.481715	486	10
201	Descripcion del incidente 201	2025-11-27 17:18:15.526432	484	10
202	Descripcion del incidente 202	2024-06-16 00:04:21.043905	494	6
203	Descripcion del incidente 203	2025-12-08 07:00:25.824157	411	1
204	Descripcion del incidente 204	2026-05-23 04:42:40.851976	423	9
205	Descripcion del incidente 205	2024-10-14 08:49:55.481956	491	10
206	Descripcion del incidente 206	2024-10-29 03:29:40.22933	461	5
207	Descripcion del incidente 207	2026-02-06 08:53:59.15129	483	9
208	Descripcion del incidente 208	2023-11-26 21:27:05.822807	481	5
209	Descripcion del incidente 209	2023-12-25 00:03:18.234759	471	8
210	Descripcion del incidente 210	2025-05-08 14:32:12.319615	462	8
211	Descripcion del incidente 211	2025-03-27 07:52:57.137349	476	9
212	Descripcion del incidente 212	2025-01-09 16:54:12.878199	446	8
213	Descripcion del incidente 213	2024-02-22 04:23:37.326131	499	6
214	Descripcion del incidente 214	2026-08-12 22:13:23.522961	487	8
215	Descripcion del incidente 215	2024-01-14 20:07:38.804946	414	6
216	Descripcion del incidente 216	2026-04-20 20:17:18.430247	461	5
217	Descripcion del incidente 217	2025-03-21 23:01:47.582508	487	10
218	Descripcion del incidente 218	2025-11-04 23:27:14.827901	472	7
219	Descripcion del incidente 219	2024-02-24 08:37:04.220235	479	6
220	Descripcion del incidente 220	2026-03-21 14:01:38.775062	431	5
221	Descripcion del incidente 221	2023-09-26 00:56:46.20758	405	4
222	Descripcion del incidente 222	2026-01-06 12:24:56.756253	476	5
223	Descripcion del incidente 223	2024-03-14 10:20:20.994581	429	10
224	Descripcion del incidente 224	2024-06-26 02:37:30.108512	467	3
225	Descripcion del incidente 225	2024-08-14 08:18:39.811663	438	5
226	Descripcion del incidente 226	2025-12-22 16:54:37.245411	446	7
227	Descripcion del incidente 227	2025-09-28 15:11:17.260551	407	1
228	Descripcion del incidente 228	2024-10-31 17:18:02.028233	475	1
229	Descripcion del incidente 229	2024-08-16 09:10:08.362259	464	4
230	Descripcion del incidente 230	2025-11-17 19:11:16.536095	459	7
231	Descripcion del incidente 231	2024-05-12 13:46:18.916737	432	8
232	Descripcion del incidente 232	2025-07-25 14:33:07.534661	500	5
233	Descripcion del incidente 233	2024-11-25 19:09:33.00399	477	3
234	Descripcion del incidente 234	2026-03-06 16:32:51.409927	457	1
235	Descripcion del incidente 235	2024-06-23 01:48:19.628595	484	4
236	Descripcion del incidente 236	2025-01-27 10:38:46.396034	460	1
237	Descripcion del incidente 237	2024-08-25 12:34:00.315109	490	1
238	Descripcion del incidente 238	2024-04-03 16:49:52.660914	440	7
239	Descripcion del incidente 239	2024-05-18 22:23:07.319561	410	2
240	Descripcion del incidente 240	2025-01-12 13:59:47.179912	431	4
241	Descripcion del incidente 241	2023-12-12 12:27:10.689507	464	5
242	Descripcion del incidente 242	2024-07-09 04:33:03.686774	414	9
243	Descripcion del incidente 243	2026-03-29 23:30:34.214853	440	9
244	Descripcion del incidente 244	2024-03-20 08:54:47.955735	455	10
245	Descripcion del incidente 245	2026-07-09 03:57:37.800927	410	10
246	Descripcion del incidente 246	2025-06-04 19:39:38.923415	458	8
247	Descripcion del incidente 247	2026-05-08 00:34:17.752379	466	10
248	Descripcion del incidente 248	2025-07-14 05:44:01.548417	435	4
249	Descripcion del incidente 249	2024-07-19 18:11:14.389421	483	3
250	Descripcion del incidente 250	2023-12-03 03:16:02.699777	463	9
251	Descripcion del incidente 251	2025-07-12 05:00:07.222533	458	2
252	Descripcion del incidente 252	2024-06-09 23:37:20.18848	409	1
253	Descripcion del incidente 253	2026-01-25 03:23:33.469707	446	9
254	Descripcion del incidente 254	2025-01-04 08:49:47.092767	465	2
255	Descripcion del incidente 255	2024-06-18 21:43:32.451408	423	2
256	Descripcion del incidente 256	2026-01-18 15:01:28.198185	431	2
257	Descripcion del incidente 257	2026-09-05 06:08:02.83023	427	6
258	Descripcion del incidente 258	2026-02-09 16:49:30.865243	414	7
259	Descripcion del incidente 259	2023-12-19 18:22:59.057401	473	3
260	Descripcion del incidente 260	2024-07-29 15:08:07.197687	423	10
261	Descripcion del incidente 261	2024-08-19 19:07:46.229965	498	8
262	Descripcion del incidente 262	2026-01-16 15:12:17.351413	492	3
263	Descripcion del incidente 263	2024-07-04 02:33:35.545379	466	1
264	Descripcion del incidente 264	2024-07-26 16:22:25.224105	401	2
265	Descripcion del incidente 265	2026-02-05 00:07:55.131414	444	6
266	Descripcion del incidente 266	2026-05-18 17:50:17.318763	422	2
267	Descripcion del incidente 267	2025-10-10 11:56:20.716171	420	7
268	Descripcion del incidente 268	2023-12-24 10:33:15.299449	426	2
269	Descripcion del incidente 269	2024-02-19 12:50:00.665271	446	5
270	Descripcion del incidente 270	2024-04-21 17:30:01.989589	500	7
271	Descripcion del incidente 271	2024-04-27 15:33:12.859868	442	2
272	Descripcion del incidente 272	2025-11-11 16:04:36.953494	495	9
273	Descripcion del incidente 273	2023-10-18 08:46:41.414913	462	4
274	Descripcion del incidente 274	2024-11-27 19:04:24.509768	497	2
275	Descripcion del incidente 275	2026-06-26 20:10:42.866087	489	2
276	Descripcion del incidente 276	2023-12-26 16:02:22.93688	410	6
277	Descripcion del incidente 277	2026-09-05 10:48:01.692328	455	5
278	Descripcion del incidente 278	2026-03-11 03:09:56.981756	410	7
279	Descripcion del incidente 279	2025-03-28 20:43:18.123977	439	3
280	Descripcion del incidente 280	2026-08-15 17:55:42.996721	460	6
281	Descripcion del incidente 281	2024-02-10 19:21:09.28138	443	3
282	Descripcion del incidente 282	2024-11-08 19:14:00.188234	408	9
283	Descripcion del incidente 283	2024-04-11 04:13:08.878526	445	6
284	Descripcion del incidente 284	2025-03-05 16:40:52.716878	407	8
285	Descripcion del incidente 285	2025-10-22 01:47:36.723493	493	2
286	Descripcion del incidente 286	2026-08-25 13:06:15.134509	450	8
287	Descripcion del incidente 287	2024-07-02 08:58:26.349567	462	9
288	Descripcion del incidente 288	2026-08-27 22:45:20.679082	480	3
289	Descripcion del incidente 289	2024-02-04 23:02:25.983052	492	6
290	Descripcion del incidente 290	2024-03-28 20:23:11.429071	411	10
291	Descripcion del incidente 291	2026-03-14 08:36:32.428955	474	9
292	Descripcion del incidente 292	2025-10-11 16:33:36.274115	466	2
293	Descripcion del incidente 293	2024-03-19 14:21:18.951135	428	8
294	Descripcion del incidente 294	2026-04-08 05:32:43.115511	490	3
295	Descripcion del incidente 295	2024-10-07 02:06:05.377889	484	2
296	Descripcion del incidente 296	2024-05-05 09:16:28.407534	433	6
297	Descripcion del incidente 297	2025-04-29 02:33:45.941708	455	3
298	Descripcion del incidente 298	2026-06-01 03:33:12.056562	475	7
299	Descripcion del incidente 299	2023-12-06 07:41:23.15893	428	3
300	Descripcion del incidente 300	2024-12-28 02:49:06.824321	453	4
301	Descripcion del incidente 301	2025-11-18 12:44:14.069854	495	5
302	Descripcion del incidente 302	2025-08-29 11:28:21.108688	460	8
303	Descripcion del incidente 303	2025-10-27 04:56:41.646501	496	6
304	Descripcion del incidente 304	2026-01-20 01:45:38.069954	436	3
305	Descripcion del incidente 305	2024-04-04 07:29:53.02107	482	9
306	Descripcion del incidente 306	2026-06-15 18:37:32.930258	449	1
307	Descripcion del incidente 307	2024-12-29 15:45:17.931279	462	3
308	Descripcion del incidente 308	2026-03-07 04:42:19.516171	500	7
309	Descripcion del incidente 309	2026-04-05 01:01:07.6996	409	8
310	Descripcion del incidente 310	2023-11-14 03:00:35.21268	487	7
311	Descripcion del incidente 311	2025-09-21 08:52:04.447911	443	9
312	Descripcion del incidente 312	2025-01-29 12:28:05.199738	420	2
313	Descripcion del incidente 313	2026-03-31 06:23:32.957155	485	9
314	Descripcion del incidente 314	2026-08-04 01:06:11.325779	500	1
315	Descripcion del incidente 315	2025-10-10 22:40:35.430119	485	2
316	Descripcion del incidente 316	2026-08-30 15:11:20.672604	441	1
317	Descripcion del incidente 317	2024-11-16 13:25:13.691583	495	4
318	Descripcion del incidente 318	2026-06-27 09:34:32.115287	468	5
319	Descripcion del incidente 319	2024-09-13 18:53:03.787653	482	6
320	Descripcion del incidente 320	2025-07-17 18:13:43.376717	447	2
321	Descripcion del incidente 321	2025-05-23 08:45:35.724792	429	4
322	Descripcion del incidente 322	2026-01-13 13:55:58.817275	443	5
323	Descripcion del incidente 323	2026-03-17 11:07:36.333703	433	8
324	Descripcion del incidente 324	2024-12-25 04:53:24.589304	425	7
325	Descripcion del incidente 325	2026-05-05 05:51:38.921742	445	8
326	Descripcion del incidente 326	2026-07-07 08:06:50.125199	439	2
327	Descripcion del incidente 327	2025-02-22 01:39:39.254432	496	10
328	Descripcion del incidente 328	2025-11-03 11:43:04.965672	429	3
329	Descripcion del incidente 329	2023-11-15 12:40:45.206856	406	2
330	Descripcion del incidente 330	2024-09-27 12:02:05.296984	451	1
331	Descripcion del incidente 331	2025-05-29 03:54:42.702921	435	5
332	Descripcion del incidente 332	2024-04-18 13:34:27.169157	436	3
333	Descripcion del incidente 333	2024-01-21 11:54:33.104926	470	7
334	Descripcion del incidente 334	2026-06-14 10:33:34.27376	420	3
335	Descripcion del incidente 335	2024-03-23 08:31:35.877914	405	9
336	Descripcion del incidente 336	2025-10-05 17:39:42.326632	479	10
337	Descripcion del incidente 337	2025-06-23 02:44:52.848271	427	2
338	Descripcion del incidente 338	2025-02-19 16:00:55.222551	419	10
339	Descripcion del incidente 339	2025-12-19 08:08:35.618852	493	8
340	Descripcion del incidente 340	2026-04-18 11:45:13.227437	404	8
341	Descripcion del incidente 341	2024-03-16 07:17:04.917757	409	3
342	Descripcion del incidente 342	2024-07-18 17:40:21.571611	476	4
343	Descripcion del incidente 343	2024-11-30 08:36:56.577343	414	7
344	Descripcion del incidente 344	2026-01-15 10:22:36.869277	403	10
345	Descripcion del incidente 345	2024-03-16 10:31:58.465639	477	4
346	Descripcion del incidente 346	2025-05-01 22:16:26.732488	473	8
347	Descripcion del incidente 347	2025-05-26 22:16:32.067808	414	4
348	Descripcion del incidente 348	2024-01-07 06:57:03.263753	465	2
349	Descripcion del incidente 349	2025-01-27 04:03:02.297575	448	9
350	Descripcion del incidente 350	2023-09-28 11:23:38.069042	444	4
351	Descripcion del incidente 351	2024-04-02 03:36:23.915038	427	5
352	Descripcion del incidente 352	2026-02-16 07:23:48.449839	422	8
353	Descripcion del incidente 353	2024-10-18 12:11:36.578953	493	1
354	Descripcion del incidente 354	2023-12-02 01:02:24.444219	431	8
355	Descripcion del incidente 355	2026-08-20 18:28:35.484714	421	9
356	Descripcion del incidente 356	2023-12-23 11:27:40.788177	456	9
357	Descripcion del incidente 357	2024-02-15 04:20:45.525124	408	4
358	Descripcion del incidente 358	2024-04-03 18:11:56.652029	415	8
359	Descripcion del incidente 359	2025-07-05 02:34:20.756983	436	2
360	Descripcion del incidente 360	2025-11-08 10:58:37.715637	422	8
361	Descripcion del incidente 361	2024-09-18 20:29:53.042646	467	8
362	Descripcion del incidente 362	2026-03-04 19:16:27.789565	436	5
363	Descripcion del incidente 363	2025-10-15 02:53:02.331047	417	4
364	Descripcion del incidente 364	2024-09-30 13:43:46.786983	483	5
365	Descripcion del incidente 365	2025-01-10 06:47:35.560222	415	1
366	Descripcion del incidente 366	2026-08-09 22:08:48.217317	469	1
367	Descripcion del incidente 367	2024-02-04 04:23:45.478335	402	2
368	Descripcion del incidente 368	2026-04-09 09:19:42.414774	479	7
369	Descripcion del incidente 369	2024-01-21 19:29:21.740924	440	8
370	Descripcion del incidente 370	2023-11-01 07:05:34.102367	486	6
371	Descripcion del incidente 371	2025-06-04 22:55:33.580417	483	8
372	Descripcion del incidente 372	2025-04-30 08:10:45.984258	476	8
373	Descripcion del incidente 373	2025-02-09 11:53:48.253009	465	5
374	Descripcion del incidente 374	2024-06-07 16:01:31.952803	452	4
375	Descripcion del incidente 375	2025-09-11 12:31:42.054958	488	4
376	Descripcion del incidente 376	2025-04-22 08:28:25.632668	472	5
377	Descripcion del incidente 377	2025-07-16 15:26:23.55851	459	4
378	Descripcion del incidente 378	2026-02-10 09:05:19.363133	458	3
379	Descripcion del incidente 379	2026-08-20 03:52:53.79009	482	10
380	Descripcion del incidente 380	2025-09-11 17:27:19.9078	423	4
381	Descripcion del incidente 381	2026-01-29 18:52:17.214032	432	5
382	Descripcion del incidente 382	2026-02-28 14:45:11.062454	462	7
383	Descripcion del incidente 383	2023-12-05 09:04:34.650188	500	1
384	Descripcion del incidente 384	2025-08-28 05:44:41.078852	472	7
385	Descripcion del incidente 385	2025-08-18 21:41:39.410108	448	3
386	Descripcion del incidente 386	2026-04-27 22:06:13.325145	480	9
387	Descripcion del incidente 387	2025-12-12 13:29:29.611947	460	1
388	Descripcion del incidente 388	2025-03-19 03:42:37.274137	440	5
389	Descripcion del incidente 389	2025-10-04 20:10:49.122125	496	9
390	Descripcion del incidente 390	2024-05-12 20:10:12.785631	473	2
391	Descripcion del incidente 391	2025-07-18 07:19:16.355769	454	4
392	Descripcion del incidente 392	2023-09-29 16:34:35.064557	500	7
393	Descripcion del incidente 393	2025-05-13 23:10:25.661468	447	5
394	Descripcion del incidente 394	2024-11-10 01:32:24.303394	417	8
395	Descripcion del incidente 395	2026-04-04 06:05:59.66167	489	2
396	Descripcion del incidente 396	2026-02-28 19:04:03.24374	404	5
397	Descripcion del incidente 397	2026-02-24 16:29:04.882548	464	6
398	Descripcion del incidente 398	2026-03-26 10:59:41.516543	412	10
399	Descripcion del incidente 399	2026-02-01 02:50:47.115809	463	7
400	Descripcion del incidente 400	2024-06-11 08:56:10.492262	450	6
401	Descripcion del incidente 401	2025-05-16 04:04:45.176141	453	2
402	Descripcion del incidente 402	2024-07-15 04:08:56.012814	411	6
403	Descripcion del incidente 403	2024-05-01 14:03:44.104812	483	3
404	Descripcion del incidente 404	2024-07-26 00:57:38.688898	420	5
405	Descripcion del incidente 405	2025-01-29 17:50:13.604842	469	10
406	Descripcion del incidente 406	2025-05-04 11:08:39.781092	478	5
407	Descripcion del incidente 407	2023-10-31 01:51:27.715477	452	6
408	Descripcion del incidente 408	2024-09-15 12:59:41.407159	403	5
409	Descripcion del incidente 409	2026-06-24 14:42:15.619104	412	4
410	Descripcion del incidente 410	2026-07-23 20:43:16.076052	462	3
411	Descripcion del incidente 411	2024-12-31 22:23:36.499564	448	3
412	Descripcion del incidente 412	2024-10-23 17:41:30.515572	459	1
413	Descripcion del incidente 413	2024-10-20 17:50:22.655291	405	1
414	Descripcion del incidente 414	2025-09-09 10:34:08.340715	442	2
415	Descripcion del incidente 415	2024-03-03 19:57:32.410602	452	10
416	Descripcion del incidente 416	2024-09-11 00:13:16.758259	413	2
417	Descripcion del incidente 417	2026-01-05 14:19:50.115578	453	6
418	Descripcion del incidente 418	2025-05-26 17:26:30.117431	450	3
419	Descripcion del incidente 419	2026-08-23 15:15:57.093179	426	4
420	Descripcion del incidente 420	2025-11-04 23:13:03.026592	476	1
421	Descripcion del incidente 421	2024-07-21 16:55:25.478474	430	8
422	Descripcion del incidente 422	2026-01-14 07:34:25.078346	462	3
423	Descripcion del incidente 423	2024-09-05 19:04:27.112943	453	2
424	Descripcion del incidente 424	2025-03-28 18:07:53.905162	452	6
425	Descripcion del incidente 425	2026-02-04 17:50:40.312697	487	5
426	Descripcion del incidente 426	2025-12-26 21:51:24.256618	426	6
427	Descripcion del incidente 427	2023-12-24 14:42:17.862187	490	4
428	Descripcion del incidente 428	2026-07-30 05:22:37.070307	405	1
429	Descripcion del incidente 429	2026-08-07 23:44:44.569631	500	7
430	Descripcion del incidente 430	2025-08-16 15:24:48.463463	495	2
431	Descripcion del incidente 431	2024-07-29 21:55:07.557857	488	8
432	Descripcion del incidente 432	2026-09-11 02:33:54.130459	428	6
433	Descripcion del incidente 433	2026-07-01 09:35:38.863988	463	8
434	Descripcion del incidente 434	2025-07-06 16:28:53.079427	403	7
435	Descripcion del incidente 435	2024-01-21 09:09:15.802421	487	2
436	Descripcion del incidente 436	2025-07-23 15:33:28.769527	433	10
437	Descripcion del incidente 437	2026-01-12 15:21:07.609655	418	1
438	Descripcion del incidente 438	2026-06-05 15:29:45.128101	411	2
439	Descripcion del incidente 439	2026-02-14 21:20:59.533051	408	4
440	Descripcion del incidente 440	2026-04-28 00:39:16.501733	472	3
441	Descripcion del incidente 441	2024-02-25 06:20:49.220631	441	6
442	Descripcion del incidente 442	2024-06-17 05:21:44.901778	475	4
443	Descripcion del incidente 443	2023-10-31 20:06:04.986271	416	7
444	Descripcion del incidente 444	2023-11-01 20:13:36.662841	412	10
445	Descripcion del incidente 445	2026-04-16 02:32:03.381508	474	2
446	Descripcion del incidente 446	2024-04-05 16:18:57.779975	423	3
447	Descripcion del incidente 447	2026-03-08 16:24:05.258494	444	9
448	Descripcion del incidente 448	2025-12-24 23:44:18.783685	441	1
449	Descripcion del incidente 449	2023-12-14 10:11:50.577005	484	6
450	Descripcion del incidente 450	2024-11-26 19:58:17.661163	456	7
451	Descripcion del incidente 451	2024-02-24 19:50:40.737188	431	9
452	Descripcion del incidente 452	2025-06-12 20:30:07.398835	441	5
453	Descripcion del incidente 453	2024-11-29 00:04:37.137005	482	10
454	Descripcion del incidente 454	2026-04-26 21:54:18.448822	489	1
455	Descripcion del incidente 455	2024-02-29 04:43:04.122218	419	5
456	Descripcion del incidente 456	2025-07-06 01:23:43.891491	469	2
457	Descripcion del incidente 457	2025-12-06 06:09:51.692609	462	6
458	Descripcion del incidente 458	2025-10-22 09:04:05.15142	456	9
459	Descripcion del incidente 459	2023-10-04 10:22:13.107164	430	5
460	Descripcion del incidente 460	2024-08-19 16:22:03.091197	469	8
461	Descripcion del incidente 461	2024-11-11 09:33:46.526939	405	10
462	Descripcion del incidente 462	2024-08-19 05:53:11.338828	475	8
463	Descripcion del incidente 463	2023-12-21 09:36:08.591412	411	6
464	Descripcion del incidente 464	2023-09-21 07:53:22.912719	431	8
465	Descripcion del incidente 465	2023-12-21 17:03:19.060897	425	8
466	Descripcion del incidente 466	2024-06-17 10:44:28.855438	411	2
467	Descripcion del incidente 467	2026-07-28 00:47:11.288115	488	1
468	Descripcion del incidente 468	2024-01-04 16:33:49.349081	406	9
469	Descripcion del incidente 469	2025-03-13 22:00:05.351873	473	5
470	Descripcion del incidente 470	2024-01-10 14:32:19.447524	442	8
471	Descripcion del incidente 471	2025-10-27 01:40:01.769673	458	10
472	Descripcion del incidente 472	2026-07-23 13:48:47.061582	445	7
473	Descripcion del incidente 473	2024-02-09 13:06:48.547973	420	8
474	Descripcion del incidente 474	2025-10-14 03:57:02.765524	456	9
475	Descripcion del incidente 475	2026-04-24 15:42:41.173205	493	7
476	Descripcion del incidente 476	2026-07-05 04:29:05.617215	429	3
477	Descripcion del incidente 477	2025-08-09 15:58:37.501131	433	2
478	Descripcion del incidente 478	2024-11-03 23:40:49.927337	404	3
479	Descripcion del incidente 479	2024-12-18 22:25:25.894169	489	6
480	Descripcion del incidente 480	2025-08-05 19:14:28.716142	494	8
481	Descripcion del incidente 481	2025-05-13 20:17:57.380735	476	6
482	Descripcion del incidente 482	2026-01-23 07:14:11.215582	416	7
483	Descripcion del incidente 483	2023-10-20 22:28:33.867701	460	9
484	Descripcion del incidente 484	2023-12-04 11:56:59.140566	493	6
485	Descripcion del incidente 485	2025-12-17 05:42:07.644284	486	7
486	Descripcion del incidente 486	2025-10-10 15:24:14.64099	453	8
487	Descripcion del incidente 487	2024-03-26 22:17:58.451022	452	10
488	Descripcion del incidente 488	2025-07-22 20:36:26.726698	447	4
489	Descripcion del incidente 489	2025-05-22 07:54:27.183528	434	10
490	Descripcion del incidente 490	2024-11-18 22:02:43.865587	495	6
491	Descripcion del incidente 491	2025-10-09 15:28:54.682636	495	9
492	Descripcion del incidente 492	2026-02-06 14:32:51.952364	427	9
493	Descripcion del incidente 493	2025-07-08 07:01:40.044282	499	2
494	Descripcion del incidente 494	2026-02-04 05:28:40.261648	405	4
495	Descripcion del incidente 495	2026-03-24 14:52:27.766715	470	10
496	Descripcion del incidente 496	2025-02-10 21:09:59.673674	411	9
497	Descripcion del incidente 497	2023-11-23 00:04:12.222472	455	3
498	Descripcion del incidente 498	2025-10-22 20:06:31.270825	460	9
499	Descripcion del incidente 499	2025-07-15 23:12:07.976768	404	8
500	Descripcion del incidente 500	2024-03-31 12:23:36.493618	411	8
\.


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs (id_log, fecha_hora_acceso, terminal, ip, id_usuario) FROM stdin;
1	2026-05-05 18:53:21.123021	Terminal-8	192.168.1.14	434
2	2026-03-01 03:04:48.089595	Terminal-1	192.168.1.14	499
3	2024-05-19 04:59:59.302024	Terminal-10	192.168.1.59	471
4	2025-07-07 06:12:21.678528	Terminal-10	192.168.1.32	421
5	2026-05-19 08:44:30.751108	Terminal-5	192.168.1.40	459
6	2023-11-17 04:19:46.73693	Terminal-5	192.168.1.69	491
7	2024-10-15 11:12:07.986004	Terminal-8	192.168.1.68	490
8	2025-11-26 05:59:14.143525	Terminal-2	192.168.1.60	457
9	2026-08-03 17:58:51.842511	Terminal-8	192.168.1.17	452
10	2024-03-21 12:55:22.555835	Terminal-9	192.168.1.12	498
11	2025-05-16 18:04:34.262678	Terminal-8	192.168.1.71	483
12	2025-09-11 16:41:30.083297	Terminal-6	192.168.1.96	420
13	2025-06-24 19:09:56.5528	Terminal-4	192.168.1.72	437
14	2025-07-02 10:30:30.454645	Terminal-9	192.168.1.106	429
15	2024-03-24 13:50:44.630325	Terminal-8	192.168.1.80	481
16	2025-08-25 08:27:38.135615	Terminal-5	192.168.1.60	403
17	2025-09-24 08:18:22.168607	Terminal-7	192.168.1.108	435
18	2026-09-15 10:59:11.165294	Terminal-6	192.168.1.44	453
19	2026-04-13 20:06:49.758793	Terminal-8	192.168.1.29	404
20	2024-10-12 18:11:46.199386	Terminal-8	192.168.1.67	489
21	2025-03-11 01:29:02.545309	Terminal-2	192.168.1.67	422
22	2025-04-08 07:12:54.690613	Terminal-10	192.168.1.31	435
23	2023-11-11 15:17:40.493463	Terminal-9	192.168.1.76	499
24	2024-12-03 22:10:27.171507	Terminal-2	192.168.1.12	500
25	2024-05-04 05:11:48.842797	Terminal-7	192.168.1.70	481
26	2025-01-17 08:26:46.832339	Terminal-1	192.168.1.11	404
27	2024-09-25 01:10:23.837432	Terminal-2	192.168.1.65	470
28	2026-03-12 23:05:22.204695	Terminal-7	192.168.1.30	428
29	2024-02-02 14:41:13.034881	Terminal-6	192.168.1.63	444
30	2024-03-14 21:58:44.690451	Terminal-4	192.168.1.61	455
31	2024-04-04 06:37:56.888287	Terminal-2	192.168.1.76	408
32	2024-02-15 08:12:59.744365	Terminal-10	192.168.1.31	484
33	2025-07-12 13:01:19.516153	Terminal-4	192.168.1.90	407
34	2024-06-01 06:18:25.994986	Terminal-5	192.168.1.95	471
35	2023-12-12 22:52:39.001679	Terminal-9	192.168.1.78	483
36	2025-03-18 11:49:03.454099	Terminal-3	192.168.1.30	499
37	2025-06-08 16:23:16.320192	Terminal-4	192.168.1.42	464
38	2024-10-27 07:41:33.510558	Terminal-5	192.168.1.109	473
39	2026-07-27 04:17:42.173939	Terminal-9	192.168.1.91	500
40	2024-02-26 23:26:02.42805	Terminal-7	192.168.1.79	477
41	2024-03-15 05:21:56.222203	Terminal-7	192.168.1.85	475
42	2026-01-03 17:54:41.132985	Terminal-6	192.168.1.72	424
43	2025-07-07 04:10:53.647108	Terminal-10	192.168.1.88	484
44	2024-07-04 11:35:21.052513	Terminal-10	192.168.1.105	500
45	2026-09-09 18:08:55.375712	Terminal-8	192.168.1.102	465
46	2024-10-04 01:41:04.531959	Terminal-10	192.168.1.56	499
47	2025-08-29 09:24:28.402592	Terminal-4	192.168.1.104	437
48	2026-09-01 19:30:22.604862	Terminal-4	192.168.1.90	440
49	2024-02-04 14:34:15.279053	Terminal-10	192.168.1.87	486
50	2025-07-11 22:09:53.804386	Terminal-9	192.168.1.37	493
51	2024-06-28 12:49:00.074471	Terminal-5	192.168.1.34	493
52	2025-05-14 16:18:23.469691	Terminal-2	192.168.1.76	434
53	2025-07-11 14:14:09.508937	Terminal-2	192.168.1.104	484
54	2026-05-20 22:50:33.498029	Terminal-3	192.168.1.90	402
55	2025-10-25 14:26:08.691249	Terminal-5	192.168.1.24	460
56	2024-02-24 18:24:54.559412	Terminal-10	192.168.1.18	484
57	2024-06-30 02:26:42.468003	Terminal-8	192.168.1.44	449
58	2026-01-07 08:38:56.41876	Terminal-9	192.168.1.87	440
59	2025-03-31 11:12:37.929994	Terminal-6	192.168.1.28	401
60	2024-06-29 22:55:07.821187	Terminal-10	192.168.1.20	403
61	2026-01-03 02:14:00.961852	Terminal-6	192.168.1.31	453
62	2023-10-28 15:25:03.237114	Terminal-5	192.168.1.44	467
63	2024-09-03 19:12:26.650738	Terminal-9	192.168.1.42	467
64	2024-10-11 01:30:21.664753	Terminal-3	192.168.1.41	418
65	2025-03-13 23:43:26.404472	Terminal-2	192.168.1.95	432
66	2025-05-02 15:28:00.374244	Terminal-9	192.168.1.82	442
67	2024-05-20 23:20:08.570092	Terminal-8	192.168.1.83	413
68	2026-08-03 11:53:47.697315	Terminal-5	192.168.1.107	422
69	2025-03-10 03:53:22.805694	Terminal-5	192.168.1.11	434
70	2025-10-15 07:47:37.051733	Terminal-7	192.168.1.60	434
71	2023-12-15 20:49:39.327309	Terminal-7	192.168.1.62	440
72	2026-01-19 11:11:21.755703	Terminal-7	192.168.1.43	486
73	2023-12-24 19:05:27.214673	Terminal-5	192.168.1.96	474
74	2024-11-03 19:07:30.260806	Terminal-5	192.168.1.14	448
75	2023-12-07 10:05:21.749158	Terminal-5	192.168.1.80	471
76	2025-01-15 14:39:18.25689	Terminal-6	192.168.1.66	403
77	2024-08-06 00:55:04.746669	Terminal-9	192.168.1.33	418
78	2024-06-29 06:02:44.384056	Terminal-1	192.168.1.21	454
79	2025-12-10 01:49:51.866185	Terminal-4	192.168.1.30	483
80	2026-09-18 02:56:50.884846	Terminal-4	192.168.1.96	416
81	2025-08-25 20:47:20.202796	Terminal-2	192.168.1.41	498
82	2023-12-28 07:24:56.060872	Terminal-3	192.168.1.31	495
83	2023-11-24 18:22:15.868876	Terminal-2	192.168.1.107	494
84	2024-08-12 17:01:52.564248	Terminal-4	192.168.1.70	428
85	2026-03-05 01:08:08.149241	Terminal-2	192.168.1.15	429
86	2025-04-22 00:58:29.91654	Terminal-3	192.168.1.104	430
87	2024-11-26 23:58:43.893065	Terminal-7	192.168.1.96	466
88	2024-02-19 23:13:58.1818	Terminal-2	192.168.1.64	401
89	2024-09-08 11:19:51.127443	Terminal-4	192.168.1.105	464
90	2026-05-31 12:53:14.791464	Terminal-8	192.168.1.88	459
91	2024-09-22 01:08:24.111011	Terminal-6	192.168.1.59	471
92	2025-05-18 11:50:29.354613	Terminal-8	192.168.1.101	467
93	2026-07-29 19:39:56.847768	Terminal-4	192.168.1.39	499
94	2023-11-25 21:12:46.661558	Terminal-1	192.168.1.99	488
95	2026-04-15 11:08:23.371264	Terminal-7	192.168.1.52	404
96	2023-09-21 10:58:45.00128	Terminal-10	192.168.1.41	407
97	2023-12-01 10:03:33.733867	Terminal-7	192.168.1.45	475
98	2024-06-03 22:36:28.441983	Terminal-3	192.168.1.63	403
99	2026-03-01 08:57:16.002485	Terminal-10	192.168.1.68	460
100	2023-10-19 22:57:27.023107	Terminal-10	192.168.1.13	472
101	2026-06-18 18:00:51.930301	Terminal-10	192.168.1.23	443
102	2025-12-18 13:46:50.734263	Terminal-2	192.168.1.64	438
103	2024-07-31 21:34:49.2497	Terminal-1	192.168.1.62	406
104	2023-12-24 08:55:52.387682	Terminal-10	192.168.1.61	455
105	2024-04-11 09:04:26.759022	Terminal-8	192.168.1.96	465
106	2024-08-10 18:21:20.366251	Terminal-8	192.168.1.75	470
107	2024-12-05 10:21:36.679595	Terminal-5	192.168.1.21	470
108	2026-02-11 21:58:46.935691	Terminal-7	192.168.1.19	421
109	2024-08-09 05:08:24.162609	Terminal-7	192.168.1.21	441
110	2025-07-25 07:40:15.312341	Terminal-9	192.168.1.101	487
111	2026-02-04 13:31:23.063289	Terminal-2	192.168.1.75	447
112	2024-12-01 10:29:06.963602	Terminal-1	192.168.1.70	455
113	2026-05-12 22:32:54.061908	Terminal-3	192.168.1.82	451
114	2024-01-02 06:19:30.322767	Terminal-6	192.168.1.77	489
115	2024-09-24 11:03:54.902459	Terminal-3	192.168.1.52	422
116	2026-01-16 06:22:15.517275	Terminal-9	192.168.1.88	407
117	2026-08-14 13:25:21.557215	Terminal-6	192.168.1.28	452
118	2026-05-15 20:06:47.120648	Terminal-1	192.168.1.46	405
119	2026-01-21 11:00:57.733723	Terminal-7	192.168.1.80	409
120	2026-02-12 10:51:55.318745	Terminal-10	192.168.1.109	444
121	2024-05-16 07:17:18.456035	Terminal-7	192.168.1.104	402
122	2025-09-20 06:28:13.661434	Terminal-4	192.168.1.107	408
123	2023-12-24 17:51:19.25435	Terminal-8	192.168.1.49	441
124	2025-01-14 00:41:24.374954	Terminal-4	192.168.1.92	468
125	2025-02-13 07:20:41.506378	Terminal-8	192.168.1.23	423
126	2024-02-27 15:18:51.469316	Terminal-4	192.168.1.70	409
127	2024-11-04 22:48:39.794073	Terminal-9	192.168.1.100	403
128	2026-03-24 21:40:32.749356	Terminal-3	192.168.1.62	474
129	2025-11-05 19:18:54.785607	Terminal-7	192.168.1.109	469
130	2024-02-03 10:55:56.432836	Terminal-5	192.168.1.62	404
131	2023-10-06 16:20:11.014001	Terminal-2	192.168.1.32	428
132	2026-05-07 19:23:00.377302	Terminal-5	192.168.1.94	489
133	2026-04-08 01:03:56.305736	Terminal-1	192.168.1.80	466
134	2024-03-25 07:35:28.927302	Terminal-4	192.168.1.70	485
135	2026-07-19 15:11:05.308186	Terminal-3	192.168.1.108	479
136	2025-06-29 12:55:39.816126	Terminal-10	192.168.1.105	446
137	2025-05-26 08:24:30.238868	Terminal-4	192.168.1.58	473
138	2024-11-24 14:42:05.40961	Terminal-2	192.168.1.88	421
139	2025-09-13 21:06:14.461563	Terminal-2	192.168.1.23	431
140	2023-12-06 15:31:50.85542	Terminal-4	192.168.1.90	442
141	2024-03-09 20:05:53.193734	Terminal-9	192.168.1.42	423
142	2026-03-13 20:45:41.888633	Terminal-9	192.168.1.85	438
143	2024-09-14 03:05:33.634282	Terminal-2	192.168.1.20	450
144	2024-09-23 09:43:12.24996	Terminal-5	192.168.1.63	432
145	2023-10-25 16:07:29.839605	Terminal-7	192.168.1.19	484
146	2024-01-10 01:25:02.697976	Terminal-5	192.168.1.59	461
147	2025-09-24 20:34:47.378796	Terminal-4	192.168.1.77	446
148	2025-08-18 21:47:40.927104	Terminal-7	192.168.1.81	456
149	2025-09-16 12:32:50.392909	Terminal-1	192.168.1.30	436
150	2024-07-26 04:38:46.908124	Terminal-4	192.168.1.65	417
151	2025-06-02 14:38:23.918145	Terminal-1	192.168.1.61	457
152	2024-02-17 13:39:09.467333	Terminal-8	192.168.1.103	406
153	2024-11-28 20:49:18.959149	Terminal-6	192.168.1.68	444
154	2024-01-22 16:40:00.389657	Terminal-4	192.168.1.71	451
155	2023-12-01 19:25:38.645096	Terminal-1	192.168.1.66	439
156	2026-01-26 16:06:07.447076	Terminal-8	192.168.1.51	458
157	2026-09-14 10:37:13.321266	Terminal-9	192.168.1.62	480
158	2025-08-13 04:11:36.166442	Terminal-5	192.168.1.50	493
159	2025-06-22 05:27:53.132572	Terminal-2	192.168.1.59	446
160	2025-04-18 02:23:38.343502	Terminal-8	192.168.1.75	500
161	2026-01-06 06:39:35.682986	Terminal-3	192.168.1.48	460
162	2024-04-07 19:42:38.856806	Terminal-7	192.168.1.22	499
163	2026-03-10 10:56:52.064882	Terminal-3	192.168.1.101	407
164	2026-06-23 01:23:00.642649	Terminal-2	192.168.1.50	475
165	2026-01-21 05:23:13.133584	Terminal-1	192.168.1.41	406
166	2024-12-09 22:21:36.572227	Terminal-8	192.168.1.90	468
167	2024-08-03 14:16:35.763174	Terminal-1	192.168.1.30	454
168	2023-12-31 01:50:31.906412	Terminal-10	192.168.1.24	451
169	2025-02-28 14:31:54.418887	Terminal-1	192.168.1.33	494
170	2026-08-05 18:56:35.66895	Terminal-9	192.168.1.25	426
171	2025-03-18 13:35:19.166343	Terminal-4	192.168.1.51	487
172	2024-06-21 17:34:58.283349	Terminal-6	192.168.1.58	408
173	2024-10-27 09:36:18.798808	Terminal-7	192.168.1.13	497
174	2025-01-04 19:31:55.712481	Terminal-8	192.168.1.57	450
175	2025-05-03 14:57:24.421002	Terminal-5	192.168.1.81	408
176	2024-07-29 00:42:22.234467	Terminal-1	192.168.1.28	493
177	2025-12-03 18:16:12.066727	Terminal-5	192.168.1.39	404
178	2024-06-08 11:24:48.929357	Terminal-2	192.168.1.45	498
179	2025-12-19 16:35:23.358632	Terminal-4	192.168.1.56	499
180	2024-09-08 18:57:57.165758	Terminal-7	192.168.1.18	482
181	2026-04-10 16:32:52.551037	Terminal-7	192.168.1.102	425
182	2024-04-06 03:25:22.289571	Terminal-10	192.168.1.74	476
183	2025-08-19 23:13:08.520527	Terminal-10	192.168.1.11	476
184	2024-05-01 15:20:21.803089	Terminal-6	192.168.1.18	467
185	2025-05-05 06:18:36.121212	Terminal-5	192.168.1.106	488
186	2025-03-02 10:44:22.029197	Terminal-7	192.168.1.62	488
187	2024-06-05 16:42:30.707291	Terminal-1	192.168.1.14	443
188	2026-08-13 08:46:16.187048	Terminal-3	192.168.1.12	416
189	2024-10-15 03:01:58.75946	Terminal-1	192.168.1.83	458
190	2023-10-22 22:54:02.535928	Terminal-9	192.168.1.34	475
191	2025-02-22 08:40:23.468346	Terminal-7	192.168.1.61	450
192	2025-09-09 16:29:31.333404	Terminal-7	192.168.1.88	464
193	2026-02-06 18:00:22.866851	Terminal-4	192.168.1.16	444
194	2026-01-18 23:27:58.191058	Terminal-4	192.168.1.96	409
195	2025-04-24 14:37:02.023252	Terminal-9	192.168.1.64	416
196	2023-10-31 12:08:14.270997	Terminal-7	192.168.1.37	424
197	2024-02-18 17:46:49.082444	Terminal-1	192.168.1.71	414
198	2024-04-18 08:45:51.009701	Terminal-6	192.168.1.37	421
199	2024-06-20 05:26:56.300006	Terminal-6	192.168.1.75	413
200	2026-04-15 18:44:21.585342	Terminal-3	192.168.1.79	441
201	2024-10-10 17:23:53.860597	Terminal-7	192.168.1.107	461
202	2025-12-27 23:15:57.833521	Terminal-3	192.168.1.10	474
203	2024-04-27 14:48:03.961006	Terminal-7	192.168.1.60	408
204	2024-01-18 06:22:59.947048	Terminal-2	192.168.1.16	429
205	2024-06-16 08:13:42.570637	Terminal-4	192.168.1.85	423
206	2024-09-08 14:37:40.343309	Terminal-3	192.168.1.48	451
207	2026-08-15 00:28:37.324499	Terminal-10	192.168.1.82	417
208	2025-09-30 02:56:52.648206	Terminal-1	192.168.1.97	494
209	2026-02-05 09:48:51.615089	Terminal-7	192.168.1.79	457
210	2026-05-04 14:24:05.777114	Terminal-5	192.168.1.60	402
211	2025-06-28 20:09:16.378041	Terminal-10	192.168.1.108	486
212	2023-12-04 15:07:05.476562	Terminal-1	192.168.1.67	418
213	2025-04-15 22:20:26.65618	Terminal-7	192.168.1.74	466
214	2024-08-06 21:22:15.499699	Terminal-1	192.168.1.10	452
215	2023-09-25 17:06:46.952292	Terminal-3	192.168.1.71	483
216	2024-06-09 22:28:35.67051	Terminal-6	192.168.1.95	457
217	2023-09-28 16:03:46.782332	Terminal-10	192.168.1.43	449
218	2026-08-09 14:36:47.919545	Terminal-7	192.168.1.66	433
219	2025-12-03 10:41:00.02525	Terminal-7	192.168.1.46	492
220	2024-07-29 16:28:21.525987	Terminal-4	192.168.1.74	495
221	2025-04-09 11:02:57.038954	Terminal-1	192.168.1.68	463
222	2025-08-30 23:44:55.871256	Terminal-3	192.168.1.40	425
223	2026-09-09 04:02:00.3858	Terminal-9	192.168.1.29	477
224	2025-11-16 16:26:01.178623	Terminal-2	192.168.1.60	428
225	2024-05-09 17:15:51.81877	Terminal-5	192.168.1.41	450
226	2025-03-18 10:17:33.485382	Terminal-2	192.168.1.33	452
227	2026-08-14 06:20:57.193248	Terminal-3	192.168.1.63	425
228	2026-07-15 20:21:40.736327	Terminal-4	192.168.1.30	454
229	2025-10-14 06:43:39.144152	Terminal-2	192.168.1.19	496
230	2024-04-10 05:43:29.241179	Terminal-5	192.168.1.55	498
231	2026-03-30 04:10:10.502917	Terminal-8	192.168.1.89	471
232	2024-12-15 06:46:05.633914	Terminal-4	192.168.1.26	499
233	2024-05-07 21:21:09.758261	Terminal-9	192.168.1.98	449
234	2023-10-12 13:21:56.069746	Terminal-2	192.168.1.79	441
235	2024-08-11 01:47:55.515088	Terminal-6	192.168.1.104	459
236	2024-03-28 02:11:04.609021	Terminal-10	192.168.1.62	432
237	2026-05-29 10:46:19.751561	Terminal-2	192.168.1.99	445
238	2026-08-04 09:51:51.436136	Terminal-7	192.168.1.106	440
239	2026-07-29 22:04:37.892912	Terminal-9	192.168.1.53	451
240	2024-02-19 17:48:24.53408	Terminal-2	192.168.1.23	419
241	2026-07-25 18:11:46.001599	Terminal-7	192.168.1.75	465
242	2026-09-04 03:10:25.895546	Terminal-9	192.168.1.29	429
243	2025-02-18 20:16:51.807828	Terminal-4	192.168.1.20	485
244	2023-10-15 19:59:47.987982	Terminal-2	192.168.1.22	457
245	2024-12-26 01:57:39.322752	Terminal-7	192.168.1.10	493
246	2025-06-20 23:29:55.415411	Terminal-10	192.168.1.86	437
247	2026-08-15 07:58:32.63368	Terminal-3	192.168.1.51	485
248	2026-07-04 22:28:10.298227	Terminal-8	192.168.1.54	411
249	2024-05-27 11:13:24.320594	Terminal-5	192.168.1.102	417
250	2024-01-29 11:06:38.861899	Terminal-10	192.168.1.105	406
251	2025-07-30 19:14:52.555792	Terminal-1	192.168.1.42	440
252	2025-08-10 01:47:18.605516	Terminal-10	192.168.1.83	449
253	2024-06-06 00:03:55.005019	Terminal-10	192.168.1.31	431
254	2025-10-24 16:21:26.319813	Terminal-5	192.168.1.78	478
255	2024-12-25 03:14:21.940691	Terminal-8	192.168.1.46	486
256	2025-09-29 03:47:50.647739	Terminal-9	192.168.1.20	466
257	2026-04-29 18:58:18.311773	Terminal-10	192.168.1.34	486
258	2025-07-02 09:10:22.803876	Terminal-5	192.168.1.36	403
259	2025-02-14 13:27:09.63475	Terminal-9	192.168.1.75	448
260	2024-11-27 07:33:08.837763	Terminal-10	192.168.1.66	489
261	2026-07-04 11:06:05.625759	Terminal-4	192.168.1.83	432
262	2025-06-14 04:31:24.59286	Terminal-5	192.168.1.48	407
263	2024-10-11 01:42:42.910238	Terminal-2	192.168.1.23	486
264	2024-08-09 21:17:14.006844	Terminal-9	192.168.1.46	428
265	2024-09-15 17:32:25.752619	Terminal-9	192.168.1.22	481
266	2023-11-06 08:02:20.780102	Terminal-2	192.168.1.77	422
267	2024-08-08 22:09:23.774321	Terminal-10	192.168.1.76	467
268	2025-07-07 16:02:27.375959	Terminal-7	192.168.1.90	455
269	2023-12-10 06:14:26.586297	Terminal-5	192.168.1.49	480
270	2024-12-29 17:47:41.904754	Terminal-2	192.168.1.72	481
271	2026-09-12 04:18:15.078418	Terminal-9	192.168.1.80	457
272	2024-10-05 11:07:57.868712	Terminal-10	192.168.1.27	427
273	2024-03-16 06:18:09.026255	Terminal-1	192.168.1.67	471
274	2024-01-11 12:01:10.963262	Terminal-1	192.168.1.18	432
275	2024-12-09 13:37:49.63683	Terminal-1	192.168.1.44	410
276	2024-11-18 13:48:43.783121	Terminal-6	192.168.1.90	446
277	2025-05-05 01:30:55.2254	Terminal-4	192.168.1.23	462
278	2024-05-13 17:42:41.140467	Terminal-7	192.168.1.58	460
279	2026-05-07 04:57:04.727589	Terminal-9	192.168.1.24	495
280	2024-11-08 18:27:48.096169	Terminal-10	192.168.1.13	403
281	2026-02-14 04:24:07.850791	Terminal-9	192.168.1.64	432
282	2024-03-17 01:23:02.063556	Terminal-9	192.168.1.53	483
283	2024-10-21 22:09:43.883441	Terminal-5	192.168.1.93	466
284	2023-10-03 02:49:19.801313	Terminal-10	192.168.1.60	472
285	2025-10-25 09:48:19.702765	Terminal-5	192.168.1.82	441
286	2025-07-12 05:22:47.997463	Terminal-6	192.168.1.74	454
287	2025-04-01 02:09:57.515466	Terminal-5	192.168.1.72	487
288	2025-08-16 20:51:42.435191	Terminal-5	192.168.1.42	500
289	2025-10-17 18:09:18.607601	Terminal-1	192.168.1.91	493
290	2024-01-24 00:54:40.06708	Terminal-7	192.168.1.57	454
291	2026-02-20 02:07:25.186642	Terminal-9	192.168.1.50	471
292	2024-08-14 15:35:12.742642	Terminal-1	192.168.1.26	421
293	2026-08-23 17:02:34.505936	Terminal-1	192.168.1.96	476
294	2025-02-19 11:59:41.555044	Terminal-10	192.168.1.17	441
295	2024-10-27 19:11:37.012325	Terminal-7	192.168.1.72	474
296	2025-07-14 06:30:16.562178	Terminal-8	192.168.1.69	489
297	2024-08-02 10:30:55.079157	Terminal-6	192.168.1.81	495
298	2025-01-19 20:12:35.495491	Terminal-7	192.168.1.76	410
299	2026-03-23 03:24:55.752781	Terminal-6	192.168.1.35	417
300	2024-11-23 08:24:09.288339	Terminal-2	192.168.1.90	471
301	2024-05-10 15:08:40.076707	Terminal-8	192.168.1.61	439
302	2024-07-26 07:36:46.938132	Terminal-9	192.168.1.40	445
303	2026-04-08 01:29:31.307523	Terminal-10	192.168.1.66	483
304	2023-10-09 00:29:06.788166	Terminal-3	192.168.1.97	465
305	2023-10-07 12:22:57.31856	Terminal-10	192.168.1.59	471
306	2024-12-19 08:22:57.857165	Terminal-4	192.168.1.102	467
307	2024-12-01 21:38:40.929432	Terminal-1	192.168.1.84	458
308	2024-06-17 08:56:46.267639	Terminal-9	192.168.1.34	418
309	2023-10-28 21:05:39.623424	Terminal-8	192.168.1.37	478
310	2024-07-06 03:13:59.093983	Terminal-6	192.168.1.105	492
311	2024-02-01 04:32:52.251386	Terminal-2	192.168.1.16	482
312	2025-03-05 00:11:00.040023	Terminal-4	192.168.1.12	487
313	2026-06-22 01:23:47.826829	Terminal-4	192.168.1.21	483
314	2024-11-15 02:17:09.037821	Terminal-4	192.168.1.90	426
315	2025-11-23 14:53:45.999607	Terminal-2	192.168.1.59	487
316	2024-06-20 16:43:27.533517	Terminal-1	192.168.1.56	453
317	2026-03-11 19:57:08.180505	Terminal-6	192.168.1.64	402
318	2024-02-13 10:59:33.471024	Terminal-10	192.168.1.107	498
319	2025-10-21 13:47:35.844546	Terminal-3	192.168.1.56	433
320	2024-08-18 12:14:36.646452	Terminal-9	192.168.1.44	404
321	2025-11-16 03:32:58.817283	Terminal-3	192.168.1.78	442
322	2023-12-25 17:44:15.896779	Terminal-9	192.168.1.80	461
323	2026-08-22 05:43:35.599421	Terminal-3	192.168.1.34	461
324	2025-12-26 22:59:51.745965	Terminal-6	192.168.1.60	436
325	2024-09-08 12:18:39.472763	Terminal-7	192.168.1.89	427
326	2024-07-16 10:33:37.235148	Terminal-6	192.168.1.109	442
327	2026-02-02 18:28:00.887759	Terminal-10	192.168.1.22	433
328	2024-11-18 07:11:46.398629	Terminal-2	192.168.1.29	428
329	2026-09-17 22:38:55.734515	Terminal-1	192.168.1.53	479
330	2026-03-20 14:15:23.887091	Terminal-8	192.168.1.95	425
331	2025-02-25 04:28:02.108889	Terminal-6	192.168.1.31	460
332	2025-01-02 00:22:52.179383	Terminal-9	192.168.1.47	484
333	2024-12-14 17:20:32.916741	Terminal-4	192.168.1.27	479
334	2025-06-12 04:23:33.453076	Terminal-9	192.168.1.84	494
335	2026-01-20 13:52:05.581452	Terminal-9	192.168.1.108	416
336	2025-04-15 01:41:13.04695	Terminal-1	192.168.1.66	426
337	2025-06-22 00:43:43.204261	Terminal-7	192.168.1.38	442
338	2025-07-08 04:17:05.162126	Terminal-9	192.168.1.92	447
339	2026-07-16 11:51:12.463175	Terminal-10	192.168.1.39	413
340	2024-12-22 17:19:47.0669	Terminal-5	192.168.1.23	423
341	2026-07-09 21:12:48.831854	Terminal-5	192.168.1.43	434
342	2026-05-02 00:37:10.994877	Terminal-10	192.168.1.88	483
343	2025-05-08 13:19:12.491394	Terminal-8	192.168.1.16	453
344	2025-02-23 17:36:29.641923	Terminal-9	192.168.1.85	420
345	2025-06-18 11:40:04.560959	Terminal-2	192.168.1.40	402
346	2023-10-01 12:00:38.882787	Terminal-4	192.168.1.54	407
347	2024-10-10 06:53:49.3654	Terminal-1	192.168.1.41	486
348	2025-09-14 02:16:23.386325	Terminal-2	192.168.1.37	484
349	2023-11-29 07:17:33.582833	Terminal-8	192.168.1.34	408
350	2024-07-14 03:52:33.365722	Terminal-9	192.168.1.109	421
351	2026-06-28 23:08:13.78029	Terminal-2	192.168.1.52	439
352	2026-04-12 05:13:22.649466	Terminal-9	192.168.1.37	451
353	2026-03-27 08:01:06.596491	Terminal-3	192.168.1.100	417
354	2026-07-29 07:42:33.511339	Terminal-5	192.168.1.49	452
355	2024-05-02 23:48:15.094319	Terminal-10	192.168.1.100	493
356	2025-09-05 09:33:38.83686	Terminal-5	192.168.1.54	487
357	2025-04-13 20:10:34.756169	Terminal-8	192.168.1.81	404
358	2024-10-12 00:21:20.922097	Terminal-5	192.168.1.90	495
359	2025-08-09 14:05:48.130244	Terminal-10	192.168.1.86	463
360	2024-03-12 09:43:46.126448	Terminal-1	192.168.1.13	424
361	2024-12-12 19:20:20.375875	Terminal-7	192.168.1.72	465
362	2025-03-22 00:49:43.813137	Terminal-1	192.168.1.108	452
363	2025-12-18 23:20:13.251604	Terminal-3	192.168.1.96	440
364	2023-09-25 16:35:22.06084	Terminal-2	192.168.1.102	406
365	2024-03-18 10:59:43.349507	Terminal-1	192.168.1.14	403
366	2024-04-13 07:48:37.202549	Terminal-2	192.168.1.63	435
367	2025-02-06 02:33:30.232293	Terminal-4	192.168.1.11	430
368	2024-09-09 00:23:55.250603	Terminal-3	192.168.1.27	435
369	2025-12-08 11:51:55.598048	Terminal-8	192.168.1.98	467
370	2023-11-16 22:25:11.272983	Terminal-4	192.168.1.44	494
371	2025-09-12 16:22:47.616848	Terminal-9	192.168.1.51	479
372	2026-09-14 19:12:21.708631	Terminal-5	192.168.1.31	446
373	2024-07-24 17:42:28.626516	Terminal-9	192.168.1.86	465
374	2024-12-14 12:36:47.013232	Terminal-9	192.168.1.98	410
375	2025-07-24 04:57:31.170323	Terminal-8	192.168.1.56	482
376	2024-10-28 16:50:08.287976	Terminal-9	192.168.1.71	456
377	2024-12-04 08:38:15.200484	Terminal-5	192.168.1.49	469
378	2023-12-06 06:47:55.246809	Terminal-10	192.168.1.10	461
379	2024-08-19 16:12:35.00857	Terminal-7	192.168.1.60	500
380	2024-02-03 22:32:29.891829	Terminal-6	192.168.1.11	495
381	2025-02-28 13:40:21.615043	Terminal-10	192.168.1.38	407
382	2024-08-29 01:06:22.914431	Terminal-7	192.168.1.14	496
383	2026-05-14 22:32:07.033963	Terminal-4	192.168.1.48	448
384	2025-03-13 12:00:12.220893	Terminal-2	192.168.1.40	481
385	2024-04-02 08:24:40.120452	Terminal-5	192.168.1.52	410
386	2025-07-14 04:03:44.612915	Terminal-7	192.168.1.63	455
387	2024-10-17 12:28:15.586315	Terminal-4	192.168.1.27	453
388	2025-02-08 04:39:35.530596	Terminal-1	192.168.1.48	468
389	2023-12-23 15:48:10.59527	Terminal-4	192.168.1.107	434
390	2024-09-18 08:34:04.357515	Terminal-3	192.168.1.71	487
391	2025-07-28 19:44:07.693984	Terminal-3	192.168.1.28	473
392	2025-10-16 00:19:09.527125	Terminal-10	192.168.1.75	404
393	2024-03-12 19:12:54.141122	Terminal-3	192.168.1.67	482
394	2025-11-01 05:27:00.949264	Terminal-8	192.168.1.79	495
395	2026-01-03 15:04:44.595952	Terminal-6	192.168.1.64	480
396	2025-06-01 07:41:21.112296	Terminal-9	192.168.1.24	444
397	2024-03-11 17:16:54.731098	Terminal-1	192.168.1.91	449
398	2025-07-17 08:01:32.589611	Terminal-8	192.168.1.56	456
399	2023-11-28 06:35:15.843943	Terminal-5	192.168.1.103	438
400	2025-03-10 02:17:07.852568	Terminal-4	192.168.1.71	496
401	2026-05-08 17:03:18.630573	Terminal-3	192.168.1.31	460
402	2025-04-07 20:02:03.829466	Terminal-3	192.168.1.73	492
403	2024-08-31 03:53:25.324461	Terminal-6	192.168.1.73	433
404	2024-12-01 01:30:23.749396	Terminal-10	192.168.1.66	447
405	2023-12-07 13:46:55.108102	Terminal-1	192.168.1.24	439
406	2025-02-07 19:22:45.910113	Terminal-3	192.168.1.44	497
407	2024-09-04 13:00:30.592803	Terminal-4	192.168.1.70	445
408	2024-12-12 18:42:42.800919	Terminal-8	192.168.1.81	413
409	2024-09-07 12:01:18.885077	Terminal-3	192.168.1.65	438
410	2026-05-14 02:00:23.103286	Terminal-3	192.168.1.91	471
411	2024-02-10 02:34:33.6247	Terminal-3	192.168.1.30	450
412	2023-09-30 08:57:49.009003	Terminal-7	192.168.1.15	422
413	2024-08-17 13:06:36.774105	Terminal-2	192.168.1.49	470
414	2025-08-27 14:08:01.505528	Terminal-1	192.168.1.69	421
415	2023-09-20 22:17:02.31346	Terminal-7	192.168.1.27	403
416	2023-10-26 06:08:50.608484	Terminal-6	192.168.1.26	448
417	2024-07-16 09:59:54.760836	Terminal-2	192.168.1.98	500
418	2024-11-02 14:00:58.432793	Terminal-4	192.168.1.102	481
419	2024-06-22 16:58:28.469952	Terminal-3	192.168.1.77	454
420	2025-12-18 21:55:18.182332	Terminal-8	192.168.1.73	489
421	2025-06-17 06:47:38.872888	Terminal-2	192.168.1.75	449
422	2026-04-23 00:22:41.315429	Terminal-4	192.168.1.76	463
423	2024-10-02 00:10:11.700684	Terminal-4	192.168.1.67	450
424	2024-12-04 20:43:26.903671	Terminal-1	192.168.1.69	418
425	2024-11-26 03:00:37.215315	Terminal-2	192.168.1.68	424
426	2025-04-29 05:46:27.036839	Terminal-7	192.168.1.80	405
427	2023-12-04 04:39:39.151488	Terminal-1	192.168.1.19	455
428	2024-04-18 20:04:53.452317	Terminal-10	192.168.1.38	415
429	2026-02-04 01:27:03.452545	Terminal-4	192.168.1.49	449
430	2024-11-21 07:53:29.720669	Terminal-10	192.168.1.19	497
431	2025-05-03 19:05:40.074621	Terminal-10	192.168.1.17	494
432	2026-02-06 04:13:43.155453	Terminal-2	192.168.1.76	432
433	2026-05-12 02:47:53.433574	Terminal-2	192.168.1.29	447
434	2026-04-30 17:30:59.688388	Terminal-2	192.168.1.58	477
435	2023-09-21 17:39:02.15916	Terminal-6	192.168.1.64	406
436	2025-08-25 21:55:29.313448	Terminal-5	192.168.1.69	468
437	2025-01-18 17:26:01.829867	Terminal-3	192.168.1.79	483
438	2024-04-14 08:32:58.777795	Terminal-6	192.168.1.91	452
439	2026-05-29 08:36:45.690247	Terminal-9	192.168.1.45	487
440	2024-03-15 03:41:24.344032	Terminal-2	192.168.1.14	487
441	2025-12-10 04:01:26.012949	Terminal-2	192.168.1.87	437
442	2025-04-26 23:28:44.839948	Terminal-4	192.168.1.94	455
443	2026-04-02 04:23:11.995494	Terminal-3	192.168.1.59	420
444	2025-03-24 16:29:05.176597	Terminal-3	192.168.1.57	488
445	2026-08-22 15:38:30.656627	Terminal-9	192.168.1.10	445
446	2026-02-13 05:01:43.610198	Terminal-4	192.168.1.56	454
447	2026-01-18 05:08:02.59462	Terminal-7	192.168.1.56	485
448	2026-03-23 09:29:35.423764	Terminal-9	192.168.1.93	458
449	2024-04-21 09:21:15.670403	Terminal-2	192.168.1.97	423
450	2024-10-20 23:23:06.957019	Terminal-3	192.168.1.74	484
451	2025-02-18 21:23:31.086315	Terminal-7	192.168.1.91	432
452	2023-12-13 02:49:21.199592	Terminal-3	192.168.1.75	424
453	2026-04-29 13:50:33.010596	Terminal-8	192.168.1.63	432
454	2026-03-05 07:49:25.601767	Terminal-8	192.168.1.74	455
455	2025-11-13 22:42:37.27652	Terminal-10	192.168.1.65	452
456	2023-12-26 09:13:26.831593	Terminal-8	192.168.1.18	490
457	2026-07-14 20:52:25.622581	Terminal-8	192.168.1.24	485
458	2024-10-04 14:17:03.881965	Terminal-3	192.168.1.63	496
459	2024-02-28 14:32:06.842254	Terminal-8	192.168.1.81	442
460	2024-05-07 14:51:06.486538	Terminal-10	192.168.1.65	446
461	2025-08-05 12:39:43.532636	Terminal-10	192.168.1.83	440
462	2026-02-19 04:27:02.797927	Terminal-7	192.168.1.51	475
463	2024-07-19 10:19:41.5849	Terminal-6	192.168.1.77	410
464	2023-12-03 18:16:19.578832	Terminal-3	192.168.1.44	460
465	2025-09-16 20:59:51.423275	Terminal-5	192.168.1.17	471
466	2024-10-11 12:42:59.236213	Terminal-6	192.168.1.25	427
467	2025-05-06 12:33:40.204538	Terminal-6	192.168.1.78	481
468	2026-08-10 21:36:33.284083	Terminal-9	192.168.1.81	438
469	2025-05-28 19:24:45.109892	Terminal-4	192.168.1.79	481
470	2026-08-18 22:51:24.414036	Terminal-7	192.168.1.104	425
471	2024-12-14 11:38:28.726206	Terminal-1	192.168.1.105	403
472	2025-12-05 02:05:19.558087	Terminal-8	192.168.1.88	437
473	2025-10-14 10:59:51.657486	Terminal-7	192.168.1.95	488
474	2025-10-31 05:46:44.094621	Terminal-7	192.168.1.100	439
475	2025-02-12 21:17:06.847993	Terminal-1	192.168.1.97	416
476	2023-12-25 12:22:23.190855	Terminal-4	192.168.1.31	478
477	2025-01-14 16:43:29.549747	Terminal-3	192.168.1.86	457
478	2023-11-01 07:58:39.784275	Terminal-6	192.168.1.43	463
479	2026-04-01 12:13:11.730128	Terminal-6	192.168.1.93	430
480	2026-03-03 06:04:49.374005	Terminal-6	192.168.1.80	446
481	2024-04-30 06:17:45.518241	Terminal-3	192.168.1.15	428
482	2024-04-08 09:04:19.218168	Terminal-10	192.168.1.81	490
483	2025-03-03 09:07:45.453605	Terminal-6	192.168.1.53	467
484	2024-06-22 06:32:21.610676	Terminal-5	192.168.1.61	422
485	2026-02-20 00:54:50.277713	Terminal-7	192.168.1.10	492
486	2025-10-10 12:42:09.786656	Terminal-8	192.168.1.16	487
487	2026-01-07 11:32:16.089415	Terminal-10	192.168.1.26	483
488	2023-10-04 05:29:31.824664	Terminal-9	192.168.1.106	479
489	2026-01-22 21:23:29.736566	Terminal-9	192.168.1.17	409
490	2025-02-13 10:29:38.700786	Terminal-8	192.168.1.54	493
491	2026-02-09 13:01:58.505871	Terminal-4	192.168.1.78	452
492	2023-10-09 17:42:20.164269	Terminal-8	192.168.1.87	469
493	2026-09-02 07:34:03.483662	Terminal-2	192.168.1.79	459
494	2024-01-01 09:24:04.534263	Terminal-8	192.168.1.59	419
495	2025-05-26 09:01:59.772429	Terminal-10	192.168.1.61	421
496	2024-08-18 22:40:18.022028	Terminal-4	192.168.1.33	480
497	2025-02-18 11:36:03.372899	Terminal-1	192.168.1.76	454
498	2025-02-24 20:26:51.992086	Terminal-10	192.168.1.109	498
499	2025-09-12 19:32:57.723842	Terminal-9	192.168.1.12	488
500	2025-04-07 00:21:45.735666	Terminal-7	192.168.1.47	408
\.


--
-- Data for Name: maquinas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maquinas (id_maquina, modelo, ubicacion, estado, id_area) FROM stdin;
1	Modelo 1	Fila 10	Fuera de Servicio	5
2	Modelo 9	Fila 9	Fuera de Servicio	8
3	Modelo 2	Fila 16	En Mantenimiento	4
4	Modelo 3	Fila 17	En Mantenimiento	8
5	Modelo 3	Fila 8	Activa	6
6	Modelo 9	Fila 1	En Mantenimiento	5
7	Modelo 8	Fila 18	En Mantenimiento	9
8	Modelo 5	Fila 7	En Mantenimiento	2
9	Modelo 1	Fila 5	Fuera de Servicio	7
10	Modelo 9	Fila 9	Activa	5
11	Modelo 2	Fila 7	En Mantenimiento	7
12	Modelo 9	Fila 15	En Mantenimiento	9
13	Modelo 6	Fila 17	En Mantenimiento	10
14	Modelo 2	Fila 3	En Mantenimiento	3
15	Modelo 5	Fila 8	En Mantenimiento	5
16	Modelo 6	Fila 15	Activa	10
17	Modelo 9	Fila 18	Fuera de Servicio	10
18	Modelo 6	Fila 11	En Mantenimiento	9
19	Modelo 7	Fila 8	Fuera de Servicio	10
20	Modelo 3	Fila 6	En Mantenimiento	8
21	Modelo 9	Fila 2	Activa	2
22	Modelo 5	Fila 19	En Mantenimiento	7
23	Modelo 4	Fila 16	Fuera de Servicio	9
24	Modelo 3	Fila 7	En Mantenimiento	10
25	Modelo 6	Fila 6	En Mantenimiento	3
26	Modelo 3	Fila 11	Fuera de Servicio	10
27	Modelo 5	Fila 10	Activa	7
28	Modelo 1	Fila 3	En Mantenimiento	8
29	Modelo 7	Fila 6	Fuera de Servicio	7
30	Modelo 3	Fila 1	Activa	3
31	Modelo 3	Fila 5	Activa	2
32	Modelo 2	Fila 16	Fuera de Servicio	6
33	Modelo 6	Fila 9	En Mantenimiento	4
34	Modelo 5	Fila 9	En Mantenimiento	1
35	Modelo 1	Fila 19	En Mantenimiento	5
36	Modelo 1	Fila 3	Fuera de Servicio	5
37	Modelo 4	Fila 20	En Mantenimiento	6
38	Modelo 5	Fila 10	Fuera de Servicio	8
39	Modelo 8	Fila 15	Activa	4
40	Modelo 5	Fila 13	Fuera de Servicio	9
41	Modelo 2	Fila 4	En Mantenimiento	1
42	Modelo 2	Fila 16	En Mantenimiento	8
43	Modelo 1	Fila 3	Fuera de Servicio	7
44	Modelo 5	Fila 20	En Mantenimiento	8
45	Modelo 5	Fila 2	En Mantenimiento	5
46	Modelo 8	Fila 11	Fuera de Servicio	6
47	Modelo 5	Fila 15	En Mantenimiento	8
48	Modelo 4	Fila 7	Fuera de Servicio	1
49	Modelo 6	Fila 4	En Mantenimiento	4
50	Modelo 3	Fila 7	Activa	3
51	Modelo 4	Fila 9	En Mantenimiento	7
52	Modelo 2	Fila 3	Fuera de Servicio	2
53	Modelo 9	Fila 20	En Mantenimiento	3
54	Modelo 4	Fila 19	Activa	1
55	Modelo 3	Fila 8	En Mantenimiento	2
56	Modelo 1	Fila 3	En Mantenimiento	3
57	Modelo 4	Fila 4	Fuera de Servicio	9
58	Modelo 1	Fila 6	Activa	6
59	Modelo 1	Fila 15	Activa	6
60	Modelo 5	Fila 16	En Mantenimiento	5
61	Modelo 3	Fila 20	Activa	4
62	Modelo 5	Fila 14	En Mantenimiento	4
63	Modelo 1	Fila 19	En Mantenimiento	1
64	Modelo 8	Fila 19	En Mantenimiento	4
65	Modelo 8	Fila 13	Activa	3
66	Modelo 7	Fila 19	Fuera de Servicio	9
67	Modelo 9	Fila 4	Activa	5
68	Modelo 1	Fila 7	En Mantenimiento	2
69	Modelo 1	Fila 19	En Mantenimiento	4
70	Modelo 6	Fila 8	En Mantenimiento	9
71	Modelo 9	Fila 8	En Mantenimiento	7
72	Modelo 2	Fila 5	En Mantenimiento	3
73	Modelo 5	Fila 8	En Mantenimiento	5
74	Modelo 3	Fila 12	En Mantenimiento	1
75	Modelo 6	Fila 17	Activa	7
76	Modelo 9	Fila 14	En Mantenimiento	1
77	Modelo 3	Fila 15	Activa	3
78	Modelo 4	Fila 1	Fuera de Servicio	4
79	Modelo 1	Fila 15	En Mantenimiento	8
80	Modelo 6	Fila 15	Fuera de Servicio	1
81	Modelo 9	Fila 7	Fuera de Servicio	8
82	Modelo 2	Fila 11	En Mantenimiento	10
83	Modelo 1	Fila 20	Fuera de Servicio	1
84	Modelo 3	Fila 15	En Mantenimiento	8
85	Modelo 6	Fila 16	En Mantenimiento	8
86	Modelo 1	Fila 6	En Mantenimiento	8
87	Modelo 2	Fila 16	Activa	9
88	Modelo 4	Fila 2	Fuera de Servicio	4
89	Modelo 9	Fila 20	En Mantenimiento	4
90	Modelo 7	Fila 5	Fuera de Servicio	8
91	Modelo 9	Fila 17	En Mantenimiento	1
92	Modelo 6	Fila 11	Activa	6
93	Modelo 7	Fila 17	Fuera de Servicio	6
94	Modelo 1	Fila 18	Fuera de Servicio	10
95	Modelo 1	Fila 9	En Mantenimiento	1
96	Modelo 6	Fila 17	En Mantenimiento	7
97	Modelo 4	Fila 3	En Mantenimiento	5
98	Modelo 3	Fila 8	Activa	6
99	Modelo 4	Fila 5	En Mantenimiento	10
100	Modelo 6	Fila 6	En Mantenimiento	10
101	Modelo 5	Fila 5	Activa	8
102	Modelo 1	Fila 20	Fuera de Servicio	3
103	Modelo 6	Fila 11	En Mantenimiento	6
104	Modelo 2	Fila 7	Fuera de Servicio	3
105	Modelo 2	Fila 13	Fuera de Servicio	2
106	Modelo 4	Fila 12	Activa	4
107	Modelo 2	Fila 19	En Mantenimiento	9
108	Modelo 4	Fila 2	Fuera de Servicio	9
109	Modelo 7	Fila 7	En Mantenimiento	8
110	Modelo 4	Fila 9	Activa	8
111	Modelo 3	Fila 9	Fuera de Servicio	6
112	Modelo 9	Fila 20	En Mantenimiento	4
113	Modelo 3	Fila 19	Activa	8
114	Modelo 4	Fila 12	En Mantenimiento	2
115	Modelo 3	Fila 6	Fuera de Servicio	1
116	Modelo 7	Fila 2	En Mantenimiento	4
117	Modelo 2	Fila 18	Fuera de Servicio	9
118	Modelo 8	Fila 10	Fuera de Servicio	3
119	Modelo 5	Fila 5	En Mantenimiento	5
120	Modelo 2	Fila 20	Fuera de Servicio	5
121	Modelo 2	Fila 10	Fuera de Servicio	7
122	Modelo 2	Fila 18	En Mantenimiento	7
123	Modelo 2	Fila 20	En Mantenimiento	4
124	Modelo 2	Fila 19	Activa	4
125	Modelo 1	Fila 13	Activa	1
126	Modelo 4	Fila 9	Activa	5
127	Modelo 7	Fila 7	En Mantenimiento	10
128	Modelo 1	Fila 14	En Mantenimiento	8
129	Modelo 2	Fila 10	En Mantenimiento	6
130	Modelo 9	Fila 9	Activa	9
131	Modelo 4	Fila 10	En Mantenimiento	9
132	Modelo 8	Fila 5	En Mantenimiento	8
133	Modelo 2	Fila 12	Activa	5
134	Modelo 6	Fila 5	En Mantenimiento	3
135	Modelo 6	Fila 8	Fuera de Servicio	6
136	Modelo 4	Fila 18	Activa	8
137	Modelo 8	Fila 7	Activa	7
138	Modelo 6	Fila 16	En Mantenimiento	4
139	Modelo 3	Fila 5	Fuera de Servicio	4
140	Modelo 7	Fila 15	Fuera de Servicio	10
141	Modelo 7	Fila 5	En Mantenimiento	8
142	Modelo 8	Fila 12	En Mantenimiento	8
143	Modelo 7	Fila 5	Fuera de Servicio	7
144	Modelo 9	Fila 14	Fuera de Servicio	1
145	Modelo 2	Fila 14	Fuera de Servicio	10
146	Modelo 9	Fila 20	Fuera de Servicio	3
147	Modelo 8	Fila 17	Activa	3
148	Modelo 1	Fila 9	En Mantenimiento	7
149	Modelo 6	Fila 17	Fuera de Servicio	10
150	Modelo 4	Fila 16	Activa	1
151	Modelo 7	Fila 3	Fuera de Servicio	7
152	Modelo 9	Fila 13	Activa	5
153	Modelo 9	Fila 14	Activa	3
154	Modelo 5	Fila 15	En Mantenimiento	3
155	Modelo 2	Fila 18	En Mantenimiento	2
156	Modelo 8	Fila 20	En Mantenimiento	1
157	Modelo 2	Fila 3	En Mantenimiento	9
158	Modelo 6	Fila 14	Fuera de Servicio	5
159	Modelo 3	Fila 11	Fuera de Servicio	4
160	Modelo 3	Fila 4	Fuera de Servicio	5
161	Modelo 9	Fila 2	Fuera de Servicio	9
162	Modelo 1	Fila 4	Activa	10
163	Modelo 3	Fila 20	Fuera de Servicio	2
164	Modelo 3	Fila 2	Activa	6
165	Modelo 7	Fila 19	Activa	1
166	Modelo 1	Fila 20	Fuera de Servicio	6
167	Modelo 5	Fila 1	En Mantenimiento	8
168	Modelo 6	Fila 17	En Mantenimiento	4
169	Modelo 1	Fila 3	En Mantenimiento	4
170	Modelo 4	Fila 12	En Mantenimiento	4
171	Modelo 9	Fila 7	En Mantenimiento	2
172	Modelo 3	Fila 2	Activa	3
173	Modelo 2	Fila 5	En Mantenimiento	2
174	Modelo 2	Fila 6	En Mantenimiento	2
175	Modelo 7	Fila 16	En Mantenimiento	8
176	Modelo 8	Fila 14	En Mantenimiento	5
177	Modelo 3	Fila 18	Fuera de Servicio	9
178	Modelo 8	Fila 2	Activa	1
179	Modelo 1	Fila 10	En Mantenimiento	1
180	Modelo 7	Fila 6	En Mantenimiento	10
181	Modelo 4	Fila 13	En Mantenimiento	8
182	Modelo 1	Fila 17	Fuera de Servicio	2
183	Modelo 7	Fila 3	En Mantenimiento	8
184	Modelo 4	Fila 13	Fuera de Servicio	6
185	Modelo 7	Fila 12	En Mantenimiento	2
186	Modelo 8	Fila 7	Activa	10
187	Modelo 5	Fila 15	En Mantenimiento	4
188	Modelo 3	Fila 8	En Mantenimiento	3
189	Modelo 7	Fila 3	En Mantenimiento	7
190	Modelo 4	Fila 2	En Mantenimiento	1
191	Modelo 9	Fila 1	Activa	2
192	Modelo 1	Fila 5	Activa	3
193	Modelo 5	Fila 10	En Mantenimiento	2
194	Modelo 1	Fila 7	Fuera de Servicio	1
195	Modelo 9	Fila 2	En Mantenimiento	3
196	Modelo 8	Fila 6	En Mantenimiento	8
197	Modelo 8	Fila 5	Fuera de Servicio	6
198	Modelo 5	Fila 1	En Mantenimiento	5
199	Modelo 6	Fila 9	Activa	4
200	Modelo 7	Fila 5	En Mantenimiento	9
201	Modelo 2	Fila 11	En Mantenimiento	3
202	Modelo 6	Fila 7	Fuera de Servicio	9
203	Modelo 5	Fila 16	En Mantenimiento	4
204	Modelo 8	Fila 20	En Mantenimiento	2
205	Modelo 5	Fila 20	En Mantenimiento	6
206	Modelo 8	Fila 20	Activa	1
207	Modelo 7	Fila 10	Activa	8
208	Modelo 2	Fila 6	En Mantenimiento	5
209	Modelo 6	Fila 5	Fuera de Servicio	9
210	Modelo 9	Fila 18	Fuera de Servicio	9
211	Modelo 4	Fila 15	En Mantenimiento	6
212	Modelo 2	Fila 7	En Mantenimiento	8
213	Modelo 8	Fila 5	En Mantenimiento	10
214	Modelo 7	Fila 1	Activa	10
215	Modelo 4	Fila 20	Activa	10
216	Modelo 2	Fila 7	Activa	9
217	Modelo 8	Fila 6	Fuera de Servicio	5
218	Modelo 9	Fila 18	Fuera de Servicio	5
219	Modelo 3	Fila 15	En Mantenimiento	9
220	Modelo 4	Fila 4	En Mantenimiento	5
221	Modelo 4	Fila 17	En Mantenimiento	4
222	Modelo 3	Fila 16	Activa	5
223	Modelo 6	Fila 5	Fuera de Servicio	4
224	Modelo 3	Fila 20	Activa	4
225	Modelo 7	Fila 19	Activa	5
226	Modelo 2	Fila 19	En Mantenimiento	5
227	Modelo 8	Fila 1	En Mantenimiento	5
228	Modelo 3	Fila 15	En Mantenimiento	1
229	Modelo 7	Fila 20	Fuera de Servicio	4
230	Modelo 1	Fila 12	Activa	9
231	Modelo 5	Fila 4	En Mantenimiento	8
232	Modelo 5	Fila 20	En Mantenimiento	3
233	Modelo 4	Fila 7	Activa	5
234	Modelo 9	Fila 20	Activa	2
235	Modelo 7	Fila 7	En Mantenimiento	7
236	Modelo 3	Fila 19	Activa	5
237	Modelo 5	Fila 6	Fuera de Servicio	7
238	Modelo 7	Fila 6	Fuera de Servicio	10
239	Modelo 5	Fila 16	En Mantenimiento	5
240	Modelo 4	Fila 6	Fuera de Servicio	10
241	Modelo 4	Fila 10	Fuera de Servicio	5
242	Modelo 2	Fila 19	En Mantenimiento	3
243	Modelo 7	Fila 4	Activa	2
244	Modelo 8	Fila 3	En Mantenimiento	3
245	Modelo 8	Fila 6	En Mantenimiento	10
246	Modelo 3	Fila 4	En Mantenimiento	6
247	Modelo 4	Fila 10	Fuera de Servicio	1
248	Modelo 9	Fila 19	En Mantenimiento	10
249	Modelo 4	Fila 19	Activa	5
250	Modelo 7	Fila 9	En Mantenimiento	1
251	Modelo 8	Fila 11	En Mantenimiento	1
252	Modelo 1	Fila 11	Activa	1
253	Modelo 4	Fila 13	En Mantenimiento	9
254	Modelo 5	Fila 14	En Mantenimiento	9
255	Modelo 8	Fila 11	En Mantenimiento	1
256	Modelo 4	Fila 19	En Mantenimiento	2
257	Modelo 5	Fila 8	En Mantenimiento	1
258	Modelo 6	Fila 12	Activa	4
259	Modelo 3	Fila 15	Activa	4
260	Modelo 1	Fila 6	En Mantenimiento	3
261	Modelo 7	Fila 14	Activa	7
262	Modelo 3	Fila 10	En Mantenimiento	2
263	Modelo 9	Fila 9	Fuera de Servicio	7
264	Modelo 7	Fila 9	En Mantenimiento	5
265	Modelo 5	Fila 17	Activa	8
266	Modelo 7	Fila 4	Activa	8
267	Modelo 2	Fila 17	Activa	4
268	Modelo 4	Fila 15	En Mantenimiento	6
269	Modelo 7	Fila 2	En Mantenimiento	7
270	Modelo 7	Fila 7	Activa	3
271	Modelo 2	Fila 18	Activa	9
272	Modelo 1	Fila 12	En Mantenimiento	2
273	Modelo 6	Fila 3	En Mantenimiento	3
274	Modelo 7	Fila 17	Activa	5
275	Modelo 5	Fila 9	Activa	3
276	Modelo 7	Fila 8	En Mantenimiento	5
277	Modelo 9	Fila 4	Activa	7
278	Modelo 2	Fila 5	En Mantenimiento	1
279	Modelo 9	Fila 5	En Mantenimiento	10
280	Modelo 1	Fila 14	En Mantenimiento	3
281	Modelo 8	Fila 6	Fuera de Servicio	5
282	Modelo 1	Fila 16	En Mantenimiento	10
283	Modelo 5	Fila 17	En Mantenimiento	1
284	Modelo 3	Fila 10	Fuera de Servicio	5
285	Modelo 8	Fila 17	En Mantenimiento	4
286	Modelo 2	Fila 2	Activa	3
287	Modelo 3	Fila 16	Fuera de Servicio	8
288	Modelo 5	Fila 13	En Mantenimiento	5
289	Modelo 7	Fila 20	Activa	2
290	Modelo 8	Fila 1	Fuera de Servicio	8
291	Modelo 5	Fila 11	En Mantenimiento	6
292	Modelo 8	Fila 11	En Mantenimiento	4
293	Modelo 8	Fila 20	En Mantenimiento	1
294	Modelo 6	Fila 20	Activa	3
295	Modelo 4	Fila 2	Fuera de Servicio	8
296	Modelo 7	Fila 18	En Mantenimiento	2
297	Modelo 6	Fila 17	Activa	10
298	Modelo 5	Fila 6	Activa	5
299	Modelo 1	Fila 11	En Mantenimiento	5
300	Modelo 6	Fila 6	En Mantenimiento	2
301	Modelo 7	Fila 9	Fuera de Servicio	8
302	Modelo 2	Fila 7	Fuera de Servicio	6
303	Modelo 7	Fila 14	En Mantenimiento	7
304	Modelo 6	Fila 12	En Mantenimiento	9
305	Modelo 3	Fila 18	En Mantenimiento	9
306	Modelo 7	Fila 2	En Mantenimiento	1
307	Modelo 1	Fila 3	En Mantenimiento	9
308	Modelo 7	Fila 13	Fuera de Servicio	5
309	Modelo 7	Fila 13	En Mantenimiento	2
310	Modelo 5	Fila 12	Activa	10
311	Modelo 3	Fila 15	Activa	4
312	Modelo 6	Fila 12	En Mantenimiento	7
313	Modelo 6	Fila 6	Fuera de Servicio	10
314	Modelo 8	Fila 2	Fuera de Servicio	5
315	Modelo 1	Fila 7	En Mantenimiento	10
316	Modelo 9	Fila 6	Fuera de Servicio	2
317	Modelo 8	Fila 14	En Mantenimiento	10
318	Modelo 8	Fila 9	En Mantenimiento	8
319	Modelo 5	Fila 14	Fuera de Servicio	9
320	Modelo 6	Fila 20	En Mantenimiento	1
321	Modelo 1	Fila 9	Fuera de Servicio	8
322	Modelo 9	Fila 12	En Mantenimiento	1
323	Modelo 5	Fila 13	En Mantenimiento	10
324	Modelo 7	Fila 18	En Mantenimiento	1
325	Modelo 8	Fila 12	Fuera de Servicio	10
326	Modelo 1	Fila 6	En Mantenimiento	9
327	Modelo 7	Fila 5	En Mantenimiento	2
328	Modelo 4	Fila 14	Activa	6
329	Modelo 4	Fila 12	Activa	9
330	Modelo 9	Fila 6	Fuera de Servicio	9
331	Modelo 7	Fila 4	Activa	6
332	Modelo 2	Fila 12	En Mantenimiento	6
333	Modelo 3	Fila 1	Activa	1
334	Modelo 2	Fila 1	En Mantenimiento	3
335	Modelo 9	Fila 1	En Mantenimiento	5
336	Modelo 7	Fila 17	Activa	8
337	Modelo 3	Fila 12	Activa	4
338	Modelo 1	Fila 12	Activa	9
339	Modelo 7	Fila 5	En Mantenimiento	6
340	Modelo 2	Fila 13	Activa	8
341	Modelo 6	Fila 15	En Mantenimiento	10
342	Modelo 7	Fila 12	Activa	7
343	Modelo 2	Fila 8	Activa	3
344	Modelo 6	Fila 16	Fuera de Servicio	4
345	Modelo 3	Fila 11	En Mantenimiento	7
346	Modelo 4	Fila 14	En Mantenimiento	5
347	Modelo 8	Fila 17	Activa	7
348	Modelo 7	Fila 14	En Mantenimiento	9
349	Modelo 4	Fila 10	En Mantenimiento	5
350	Modelo 9	Fila 15	En Mantenimiento	8
351	Modelo 2	Fila 18	En Mantenimiento	6
352	Modelo 9	Fila 1	Fuera de Servicio	1
353	Modelo 9	Fila 18	Fuera de Servicio	4
354	Modelo 4	Fila 13	Activa	9
355	Modelo 8	Fila 12	Activa	8
356	Modelo 2	Fila 15	Activa	7
357	Modelo 4	Fila 1	En Mantenimiento	10
358	Modelo 4	Fila 3	En Mantenimiento	10
359	Modelo 2	Fila 15	En Mantenimiento	3
360	Modelo 4	Fila 16	En Mantenimiento	7
361	Modelo 6	Fila 19	En Mantenimiento	3
362	Modelo 4	Fila 9	En Mantenimiento	9
363	Modelo 2	Fila 5	En Mantenimiento	9
364	Modelo 4	Fila 11	En Mantenimiento	7
365	Modelo 6	Fila 6	Fuera de Servicio	6
366	Modelo 8	Fila 7	En Mantenimiento	2
367	Modelo 1	Fila 19	En Mantenimiento	6
368	Modelo 8	Fila 20	En Mantenimiento	7
369	Modelo 3	Fila 9	En Mantenimiento	1
370	Modelo 3	Fila 16	Activa	1
371	Modelo 4	Fila 6	Activa	9
372	Modelo 8	Fila 1	En Mantenimiento	4
373	Modelo 8	Fila 16	En Mantenimiento	8
374	Modelo 7	Fila 9	En Mantenimiento	1
375	Modelo 1	Fila 17	Activa	10
376	Modelo 1	Fila 17	Activa	6
377	Modelo 5	Fila 17	En Mantenimiento	1
378	Modelo 6	Fila 20	En Mantenimiento	7
379	Modelo 5	Fila 4	Fuera de Servicio	6
380	Modelo 7	Fila 8	En Mantenimiento	7
381	Modelo 1	Fila 20	Activa	6
382	Modelo 6	Fila 14	En Mantenimiento	4
383	Modelo 7	Fila 18	Activa	8
384	Modelo 4	Fila 20	En Mantenimiento	1
385	Modelo 4	Fila 6	Fuera de Servicio	10
386	Modelo 5	Fila 8	En Mantenimiento	5
387	Modelo 1	Fila 2	En Mantenimiento	10
388	Modelo 1	Fila 9	En Mantenimiento	7
389	Modelo 1	Fila 19	Activa	6
390	Modelo 5	Fila 4	En Mantenimiento	7
391	Modelo 3	Fila 14	En Mantenimiento	1
392	Modelo 5	Fila 2	Fuera de Servicio	6
393	Modelo 6	Fila 4	Activa	4
394	Modelo 2	Fila 19	En Mantenimiento	6
395	Modelo 2	Fila 18	Fuera de Servicio	6
396	Modelo 1	Fila 14	Activa	8
397	Modelo 7	Fila 18	Activa	3
398	Modelo 2	Fila 5	En Mantenimiento	10
399	Modelo 6	Fila 16	Fuera de Servicio	1
400	Modelo 9	Fila 15	Fuera de Servicio	9
401	Modelo 7	Fila 4	Fuera de Servicio	6
402	Modelo 7	Fila 1	Fuera de Servicio	2
403	Modelo 4	Fila 5	Fuera de Servicio	9
404	Modelo 1	Fila 17	Activa	2
405	Modelo 6	Fila 1	En Mantenimiento	7
406	Modelo 4	Fila 19	Fuera de Servicio	9
407	Modelo 2	Fila 19	Activa	3
408	Modelo 2	Fila 9	En Mantenimiento	6
409	Modelo 4	Fila 10	Activa	7
410	Modelo 2	Fila 17	En Mantenimiento	6
411	Modelo 7	Fila 15	Fuera de Servicio	9
412	Modelo 9	Fila 10	En Mantenimiento	8
413	Modelo 4	Fila 12	En Mantenimiento	4
414	Modelo 2	Fila 19	Activa	2
415	Modelo 9	Fila 1	Fuera de Servicio	5
416	Modelo 2	Fila 4	Fuera de Servicio	10
417	Modelo 6	Fila 14	En Mantenimiento	5
418	Modelo 2	Fila 20	Fuera de Servicio	5
419	Modelo 9	Fila 14	En Mantenimiento	7
420	Modelo 9	Fila 10	Activa	9
421	Modelo 2	Fila 17	Fuera de Servicio	9
422	Modelo 2	Fila 17	En Mantenimiento	1
423	Modelo 9	Fila 12	En Mantenimiento	9
424	Modelo 8	Fila 1	En Mantenimiento	6
425	Modelo 8	Fila 8	Fuera de Servicio	6
426	Modelo 1	Fila 3	En Mantenimiento	7
427	Modelo 8	Fila 9	Fuera de Servicio	10
428	Modelo 6	Fila 2	En Mantenimiento	4
429	Modelo 7	Fila 11	Fuera de Servicio	4
430	Modelo 1	Fila 14	Activa	8
431	Modelo 7	Fila 14	Fuera de Servicio	6
432	Modelo 6	Fila 17	En Mantenimiento	3
433	Modelo 1	Fila 16	Activa	7
434	Modelo 5	Fila 10	Activa	9
435	Modelo 6	Fila 13	En Mantenimiento	1
436	Modelo 1	Fila 12	En Mantenimiento	8
437	Modelo 1	Fila 11	En Mantenimiento	10
438	Modelo 7	Fila 20	Activa	8
439	Modelo 6	Fila 9	Fuera de Servicio	4
440	Modelo 6	Fila 20	Fuera de Servicio	3
441	Modelo 1	Fila 17	En Mantenimiento	3
442	Modelo 8	Fila 1	Activa	7
443	Modelo 4	Fila 4	Activa	5
444	Modelo 9	Fila 16	Activa	2
445	Modelo 5	Fila 12	Activa	3
446	Modelo 5	Fila 19	Fuera de Servicio	10
447	Modelo 3	Fila 9	En Mantenimiento	2
448	Modelo 7	Fila 18	Activa	2
449	Modelo 1	Fila 14	Fuera de Servicio	8
450	Modelo 6	Fila 14	En Mantenimiento	9
451	Modelo 6	Fila 11	Activa	7
452	Modelo 4	Fila 9	Fuera de Servicio	8
453	Modelo 7	Fila 16	Activa	8
454	Modelo 7	Fila 15	En Mantenimiento	4
455	Modelo 5	Fila 2	En Mantenimiento	6
456	Modelo 1	Fila 6	Fuera de Servicio	7
457	Modelo 9	Fila 17	Activa	7
458	Modelo 9	Fila 18	Activa	8
459	Modelo 9	Fila 16	En Mantenimiento	3
460	Modelo 6	Fila 5	Activa	1
461	Modelo 5	Fila 5	Fuera de Servicio	8
462	Modelo 3	Fila 4	En Mantenimiento	2
463	Modelo 1	Fila 17	En Mantenimiento	3
464	Modelo 4	Fila 13	En Mantenimiento	7
465	Modelo 3	Fila 20	En Mantenimiento	4
466	Modelo 2	Fila 10	Activa	1
467	Modelo 3	Fila 18	Fuera de Servicio	1
468	Modelo 5	Fila 8	Activa	6
469	Modelo 7	Fila 15	En Mantenimiento	10
470	Modelo 5	Fila 20	En Mantenimiento	4
471	Modelo 4	Fila 4	En Mantenimiento	1
472	Modelo 5	Fila 16	Fuera de Servicio	6
473	Modelo 4	Fila 3	Activa	3
474	Modelo 5	Fila 18	Activa	7
475	Modelo 3	Fila 8	Fuera de Servicio	6
476	Modelo 8	Fila 14	Activa	9
477	Modelo 7	Fila 11	Fuera de Servicio	7
478	Modelo 1	Fila 3	En Mantenimiento	6
479	Modelo 2	Fila 13	En Mantenimiento	5
480	Modelo 7	Fila 10	En Mantenimiento	2
481	Modelo 3	Fila 9	En Mantenimiento	3
482	Modelo 1	Fila 6	En Mantenimiento	4
483	Modelo 1	Fila 5	Fuera de Servicio	5
484	Modelo 6	Fila 3	Activa	2
485	Modelo 6	Fila 5	Activa	2
486	Modelo 1	Fila 15	Activa	10
487	Modelo 3	Fila 20	En Mantenimiento	3
488	Modelo 1	Fila 6	En Mantenimiento	1
489	Modelo 1	Fila 13	En Mantenimiento	5
490	Modelo 9	Fila 6	En Mantenimiento	3
491	Modelo 7	Fila 1	En Mantenimiento	8
492	Modelo 4	Fila 5	En Mantenimiento	1
493	Modelo 1	Fila 15	Fuera de Servicio	8
494	Modelo 3	Fila 16	Activa	7
495	Modelo 7	Fila 15	Fuera de Servicio	1
496	Modelo 6	Fila 12	En Mantenimiento	10
497	Modelo 9	Fila 18	En Mantenimiento	1
498	Modelo 1	Fila 6	En Mantenimiento	2
499	Modelo 7	Fila 4	Activa	5
500	Modelo 1	Fila 18	En Mantenimiento	1
\.


--
-- Data for Name: notificaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notificaciones (id_notificacion, mensaje, tipo, fecha_hora_envio, id_usuario) FROM stdin;
1	Mensaje de notificacion 1	Email	2024-08-04 11:20:19.891386	180
2	Mensaje de notificacion 2	Interna	2026-06-05 19:12:49.103347	39
3	Mensaje de notificacion 3	Interna	2024-01-06 17:36:32.439428	262
4	Mensaje de notificacion 4	Interna	2024-10-07 08:12:11.356416	107
5	Mensaje de notificacion 5	Email	2024-04-28 16:38:46.914373	47
6	Mensaje de notificacion 6	Email	2023-09-28 14:28:27.378185	467
7	Mensaje de notificacion 7	Email	2024-04-10 19:54:29.950236	56
8	Mensaje de notificacion 8	Interna	2024-10-11 12:30:11.51558	197
9	Mensaje de notificacion 9	Interna	2024-07-18 04:44:28.95474	70
10	Mensaje de notificacion 10	Interna	2024-10-04 17:18:54.014991	370
11	Mensaje de notificacion 11	Interna	2023-10-07 19:25:31.274043	3
12	Mensaje de notificacion 12	Email	2025-03-09 23:19:09.568392	13
13	Mensaje de notificacion 13	Email	2024-07-11 01:54:22.535943	363
14	Mensaje de notificacion 14	Push	2026-09-07 18:59:57.286119	169
15	Mensaje de notificacion 15	Interna	2025-05-23 16:15:12.251353	467
16	Mensaje de notificacion 16	Email	2023-11-07 10:40:00.868961	27
17	Mensaje de notificacion 17	Push	2025-01-29 08:16:31.081532	7
18	Mensaje de notificacion 18	Push	2024-05-24 09:32:06.089185	62
19	Mensaje de notificacion 19	Email	2024-10-06 01:27:41.78789	334
20	Mensaje de notificacion 20	Email	2024-10-21 13:52:30.394217	373
21	Mensaje de notificacion 21	Email	2024-01-27 23:32:21.05321	267
22	Mensaje de notificacion 22	Email	2024-02-22 13:24:00.287962	125
23	Mensaje de notificacion 23	Push	2026-08-05 18:30:55.173056	427
24	Mensaje de notificacion 24	Interna	2025-06-20 22:33:58.806759	234
25	Mensaje de notificacion 25	Interna	2025-07-14 06:07:01.915364	363
26	Mensaje de notificacion 26	Push	2024-01-20 23:56:25.067088	1
27	Mensaje de notificacion 27	Email	2024-12-06 08:26:53.751957	45
28	Mensaje de notificacion 28	Email	2024-11-15 03:19:55.747789	267
29	Mensaje de notificacion 29	Email	2024-05-13 07:28:42.494231	360
30	Mensaje de notificacion 30	Push	2025-07-18 17:24:57.857706	161
31	Mensaje de notificacion 31	Interna	2023-10-18 09:13:19.648702	112
32	Mensaje de notificacion 32	Push	2025-07-28 08:49:17.602207	420
33	Mensaje de notificacion 33	Email	2026-08-29 13:55:29.296393	254
34	Mensaje de notificacion 34	Email	2025-08-13 08:50:12.799196	203
35	Mensaje de notificacion 35	Email	2024-05-08 03:12:07.709854	477
36	Mensaje de notificacion 36	Push	2024-03-02 23:38:53.729428	80
37	Mensaje de notificacion 37	Email	2026-06-25 17:44:13.597459	73
38	Mensaje de notificacion 38	Interna	2024-05-20 12:47:09.005638	451
39	Mensaje de notificacion 39	Email	2026-03-18 16:38:39.587766	84
40	Mensaje de notificacion 40	Email	2025-04-09 08:50:53.43215	353
41	Mensaje de notificacion 41	Email	2024-02-08 09:53:18.725155	284
42	Mensaje de notificacion 42	Email	2026-01-31 21:15:19.204993	215
43	Mensaje de notificacion 43	Interna	2024-01-20 19:22:29.100678	188
44	Mensaje de notificacion 44	Email	2024-09-26 02:19:56.294407	35
45	Mensaje de notificacion 45	Push	2026-07-10 07:47:09.069644	62
46	Mensaje de notificacion 46	Email	2024-07-22 00:44:48.967188	241
47	Mensaje de notificacion 47	Email	2026-08-06 08:19:38.164754	111
48	Mensaje de notificacion 48	Email	2026-07-10 13:16:57.781257	239
49	Mensaje de notificacion 49	Email	2025-01-21 15:46:39.197204	461
50	Mensaje de notificacion 50	Email	2024-08-24 06:58:47.567911	185
51	Mensaje de notificacion 51	Email	2024-03-29 16:48:51.536975	299
52	Mensaje de notificacion 52	Interna	2024-10-22 12:38:33.226513	491
53	Mensaje de notificacion 53	Push	2026-04-11 03:28:42.316601	9
54	Mensaje de notificacion 54	Email	2024-08-18 04:12:08.85985	159
55	Mensaje de notificacion 55	Push	2026-02-26 10:02:38.625923	218
56	Mensaje de notificacion 56	Email	2024-02-21 17:35:10.289475	227
57	Mensaje de notificacion 57	Email	2023-12-01 02:59:05.799652	159
58	Mensaje de notificacion 58	Interna	2025-11-11 11:02:52.935067	302
59	Mensaje de notificacion 59	Email	2026-09-15 21:52:19.26604	69
60	Mensaje de notificacion 60	Email	2024-10-09 22:38:36.519791	200
61	Mensaje de notificacion 61	Push	2026-03-10 15:14:53.155924	342
62	Mensaje de notificacion 62	Interna	2025-11-20 14:19:20.862663	88
63	Mensaje de notificacion 63	Email	2025-08-05 00:15:29.666242	129
64	Mensaje de notificacion 64	Interna	2025-10-18 18:34:52.296741	54
65	Mensaje de notificacion 65	Email	2024-08-02 17:32:15.192711	73
66	Mensaje de notificacion 66	Email	2024-02-10 16:39:20.137773	314
67	Mensaje de notificacion 67	Email	2024-02-20 21:50:32.839591	280
68	Mensaje de notificacion 68	Email	2026-04-30 14:41:12.839762	247
69	Mensaje de notificacion 69	Interna	2023-11-01 16:18:03.090924	452
70	Mensaje de notificacion 70	Push	2023-12-19 23:13:00.490033	456
71	Mensaje de notificacion 71	Push	2024-05-06 14:37:49.492974	113
72	Mensaje de notificacion 72	Email	2025-08-24 07:02:02.742635	314
73	Mensaje de notificacion 73	Interna	2026-01-07 00:25:36.739726	332
74	Mensaje de notificacion 74	Email	2024-07-06 15:45:10.155614	62
75	Mensaje de notificacion 75	Email	2025-03-18 21:35:33.675511	14
76	Mensaje de notificacion 76	Email	2025-11-05 01:12:03.22342	125
77	Mensaje de notificacion 77	Email	2025-07-22 01:58:15.619924	469
78	Mensaje de notificacion 78	Email	2026-01-29 13:29:36.876844	118
79	Mensaje de notificacion 79	Push	2025-02-01 17:09:10.191033	93
80	Mensaje de notificacion 80	Email	2024-01-17 19:03:27.519521	75
81	Mensaje de notificacion 81	Email	2025-05-02 12:25:22.137824	117
82	Mensaje de notificacion 82	Push	2024-06-29 16:59:03.275133	394
83	Mensaje de notificacion 83	Email	2024-09-28 20:15:15.538868	62
84	Mensaje de notificacion 84	Email	2025-10-14 22:45:21.214597	36
85	Mensaje de notificacion 85	Push	2024-04-29 12:08:12.827398	238
86	Mensaje de notificacion 86	Email	2024-02-11 05:02:54.97073	348
87	Mensaje de notificacion 87	Push	2024-11-17 01:37:04.134629	399
88	Mensaje de notificacion 88	Email	2024-08-27 23:08:37.673508	304
89	Mensaje de notificacion 89	Email	2026-01-18 15:10:18.34253	149
90	Mensaje de notificacion 90	Interna	2025-04-22 03:14:13.336206	172
91	Mensaje de notificacion 91	Interna	2024-01-18 17:33:21.43054	448
92	Mensaje de notificacion 92	Interna	2024-02-21 13:35:26.984942	493
93	Mensaje de notificacion 93	Push	2026-02-13 06:18:02.589965	172
94	Mensaje de notificacion 94	Email	2025-06-18 05:35:23.800964	102
95	Mensaje de notificacion 95	Email	2026-01-06 10:43:02.61765	277
96	Mensaje de notificacion 96	Interna	2026-05-24 15:43:50.199619	114
97	Mensaje de notificacion 97	Email	2025-09-26 20:31:32.718829	117
98	Mensaje de notificacion 98	Push	2026-08-20 00:46:27.727761	445
99	Mensaje de notificacion 99	Push	2024-06-28 14:38:40.314458	59
100	Mensaje de notificacion 100	Interna	2025-11-23 11:08:04.591103	70
101	Mensaje de notificacion 101	Email	2024-06-09 20:52:29.584287	135
102	Mensaje de notificacion 102	Push	2024-07-21 04:09:56.426097	83
103	Mensaje de notificacion 103	Interna	2026-02-13 04:47:44.76728	396
104	Mensaje de notificacion 104	Email	2026-03-28 02:59:18.562612	197
105	Mensaje de notificacion 105	Email	2025-08-29 03:22:16.291391	312
106	Mensaje de notificacion 106	Push	2025-09-04 03:32:34.381039	93
107	Mensaje de notificacion 107	Push	2024-01-13 06:06:30.199112	371
108	Mensaje de notificacion 108	Email	2025-02-21 06:12:45.97464	380
109	Mensaje de notificacion 109	Interna	2026-06-18 11:06:53.956873	322
110	Mensaje de notificacion 110	Email	2026-02-27 07:06:29.46121	97
111	Mensaje de notificacion 111	Push	2026-03-10 07:56:20.076154	288
112	Mensaje de notificacion 112	Email	2026-03-13 00:41:05.537255	180
113	Mensaje de notificacion 113	Push	2024-01-31 03:06:50.026788	147
114	Mensaje de notificacion 114	Email	2026-09-15 18:31:38.094586	172
115	Mensaje de notificacion 115	Email	2025-05-25 17:41:22.821725	144
116	Mensaje de notificacion 116	Push	2025-12-29 14:00:27.327653	468
117	Mensaje de notificacion 117	Interna	2026-06-09 04:29:58.703955	259
118	Mensaje de notificacion 118	Email	2025-10-02 12:19:06.837592	411
119	Mensaje de notificacion 119	Email	2026-08-30 08:05:38.138375	77
120	Mensaje de notificacion 120	Email	2024-02-24 15:38:47.542872	172
121	Mensaje de notificacion 121	Push	2025-09-22 21:13:49.844578	68
122	Mensaje de notificacion 122	Push	2024-03-31 02:57:27.103559	364
123	Mensaje de notificacion 123	Email	2023-09-22 21:38:54.053726	87
124	Mensaje de notificacion 124	Email	2023-12-31 05:11:39.4734	36
125	Mensaje de notificacion 125	Interna	2025-12-30 17:31:38.036545	143
126	Mensaje de notificacion 126	Email	2026-07-08 08:22:22.229713	449
127	Mensaje de notificacion 127	Email	2026-03-12 00:16:35.525317	196
128	Mensaje de notificacion 128	Email	2026-01-22 15:52:05.992167	258
129	Mensaje de notificacion 129	Email	2025-06-16 00:39:45.935163	314
130	Mensaje de notificacion 130	Email	2023-10-04 01:41:21.783574	211
131	Mensaje de notificacion 131	Email	2026-06-21 07:24:26.91519	5
132	Mensaje de notificacion 132	Push	2025-01-25 22:55:28.217832	14
133	Mensaje de notificacion 133	Email	2025-03-19 02:05:30.417634	306
134	Mensaje de notificacion 134	Interna	2026-01-14 19:47:51.70217	444
135	Mensaje de notificacion 135	Email	2024-12-06 07:39:09.494034	54
136	Mensaje de notificacion 136	Push	2025-12-30 10:46:43.145662	245
137	Mensaje de notificacion 137	Email	2026-08-30 11:29:37.07339	428
138	Mensaje de notificacion 138	Interna	2023-12-19 20:43:37.398762	152
139	Mensaje de notificacion 139	Email	2024-12-30 09:05:26.502594	181
140	Mensaje de notificacion 140	Email	2026-05-05 21:28:16.544486	208
141	Mensaje de notificacion 141	Email	2025-07-17 03:20:57.869307	213
142	Mensaje de notificacion 142	Push	2023-11-19 03:07:31.354303	6
143	Mensaje de notificacion 143	Interna	2023-10-29 03:47:45.307775	345
144	Mensaje de notificacion 144	Email	2025-07-29 19:41:42.358488	58
145	Mensaje de notificacion 145	Email	2025-10-02 18:34:20.961888	456
146	Mensaje de notificacion 146	Push	2025-02-07 00:57:45.256655	203
147	Mensaje de notificacion 147	Interna	2026-08-08 23:40:13.616474	84
148	Mensaje de notificacion 148	Interna	2025-01-11 16:47:41.371477	208
149	Mensaje de notificacion 149	Email	2026-06-06 22:11:59.535563	38
150	Mensaje de notificacion 150	Email	2026-06-13 22:39:02.945812	100
151	Mensaje de notificacion 151	Email	2026-05-31 05:53:39.431852	40
152	Mensaje de notificacion 152	Email	2026-06-01 12:01:08.403935	313
153	Mensaje de notificacion 153	Email	2023-11-06 10:19:10.838572	127
154	Mensaje de notificacion 154	Email	2026-04-24 11:17:04.463181	172
155	Mensaje de notificacion 155	Interna	2026-08-09 08:00:59.869375	362
156	Mensaje de notificacion 156	Email	2026-09-03 13:05:23.507126	431
157	Mensaje de notificacion 157	Push	2024-01-29 06:49:04.892719	319
158	Mensaje de notificacion 158	Interna	2024-04-08 17:26:28.61491	306
159	Mensaje de notificacion 159	Push	2025-08-20 04:03:31.738542	369
160	Mensaje de notificacion 160	Email	2026-09-02 13:56:02.627016	268
161	Mensaje de notificacion 161	Email	2024-01-16 08:06:06.611632	381
162	Mensaje de notificacion 162	Push	2024-08-13 00:51:21.59999	437
163	Mensaje de notificacion 163	Email	2024-07-05 16:55:41.884753	365
164	Mensaje de notificacion 164	Interna	2026-03-15 16:25:14.914435	267
165	Mensaje de notificacion 165	Email	2024-05-17 07:27:04.696195	16
166	Mensaje de notificacion 166	Push	2025-02-22 23:12:32.773733	98
167	Mensaje de notificacion 167	Email	2025-09-11 21:59:27.255741	460
168	Mensaje de notificacion 168	Interna	2024-03-22 01:34:22.189352	297
169	Mensaje de notificacion 169	Push	2026-02-03 21:08:57.32237	442
170	Mensaje de notificacion 170	Push	2024-07-22 07:34:31.002473	59
171	Mensaje de notificacion 171	Email	2024-12-08 16:37:39.002175	154
172	Mensaje de notificacion 172	Push	2023-12-05 04:22:59.923938	84
173	Mensaje de notificacion 173	Interna	2026-07-24 01:20:41.575784	23
174	Mensaje de notificacion 174	Email	2025-03-27 16:00:50.016627	364
175	Mensaje de notificacion 175	Interna	2025-06-16 06:40:07.380898	319
176	Mensaje de notificacion 176	Email	2026-03-14 10:36:23.124467	79
177	Mensaje de notificacion 177	Interna	2025-08-24 23:06:14.444833	193
178	Mensaje de notificacion 178	Interna	2025-01-18 16:57:43.650855	379
179	Mensaje de notificacion 179	Email	2026-07-17 02:46:25.789383	202
180	Mensaje de notificacion 180	Push	2025-03-27 06:00:41.049752	256
181	Mensaje de notificacion 181	Email	2025-01-26 05:06:17.480586	329
182	Mensaje de notificacion 182	Push	2024-01-14 03:37:34.918035	62
183	Mensaje de notificacion 183	Push	2024-01-12 08:27:04.50507	425
184	Mensaje de notificacion 184	Interna	2025-04-12 09:29:49.62654	484
185	Mensaje de notificacion 185	Email	2026-05-26 09:14:33.801909	252
186	Mensaje de notificacion 186	Email	2026-09-01 10:26:43.007312	301
187	Mensaje de notificacion 187	Push	2024-11-28 23:41:09.07298	154
188	Mensaje de notificacion 188	Email	2026-03-16 23:19:33.555742	363
189	Mensaje de notificacion 189	Interna	2026-03-14 19:10:43.067849	141
190	Mensaje de notificacion 190	Push	2025-07-08 21:17:45.521229	365
191	Mensaje de notificacion 191	Push	2023-09-30 05:22:14.568391	23
192	Mensaje de notificacion 192	Email	2024-03-19 23:01:46.787479	428
193	Mensaje de notificacion 193	Email	2024-02-21 12:08:17.563277	319
194	Mensaje de notificacion 194	Interna	2026-08-02 05:57:26.312766	48
195	Mensaje de notificacion 195	Interna	2023-12-27 00:36:41.234291	151
196	Mensaje de notificacion 196	Email	2024-08-29 20:56:52.045086	174
197	Mensaje de notificacion 197	Email	2026-06-06 04:43:11.727475	110
198	Mensaje de notificacion 198	Email	2026-02-18 08:17:54.385847	325
199	Mensaje de notificacion 199	Interna	2024-04-25 20:23:45.074186	158
200	Mensaje de notificacion 200	Interna	2024-11-06 06:36:21.140876	456
201	Mensaje de notificacion 201	Email	2023-11-07 17:18:16.14322	211
202	Mensaje de notificacion 202	Email	2026-01-11 00:34:48.33798	112
203	Mensaje de notificacion 203	Push	2026-03-09 06:04:18.024177	454
204	Mensaje de notificacion 204	Email	2025-05-28 07:22:10.11311	279
205	Mensaje de notificacion 205	Email	2024-05-09 08:43:00.94061	2
206	Mensaje de notificacion 206	Email	2025-07-26 06:28:09.584999	200
207	Mensaje de notificacion 207	Email	2026-02-07 02:43:16.800837	144
208	Mensaje de notificacion 208	Email	2025-12-24 19:03:56.006439	471
209	Mensaje de notificacion 209	Email	2024-04-13 04:22:05.057555	373
210	Mensaje de notificacion 210	Email	2025-09-05 08:33:07.259133	408
211	Mensaje de notificacion 211	Interna	2025-03-19 19:21:19.575313	286
212	Mensaje de notificacion 212	Email	2026-04-19 09:57:59.501293	344
213	Mensaje de notificacion 213	Email	2024-02-15 14:40:20.673223	45
214	Mensaje de notificacion 214	Email	2026-06-18 21:14:53.511116	206
215	Mensaje de notificacion 215	Email	2026-04-25 14:33:08.318563	213
216	Mensaje de notificacion 216	Push	2025-11-09 12:47:33.724867	197
217	Mensaje de notificacion 217	Email	2025-09-22 15:32:56.030603	499
218	Mensaje de notificacion 218	Email	2023-12-16 07:16:28.230905	112
219	Mensaje de notificacion 219	Push	2024-02-18 06:35:09.75988	229
220	Mensaje de notificacion 220	Interna	2025-06-16 12:13:04.050994	333
221	Mensaje de notificacion 221	Interna	2025-10-08 16:36:01.283323	317
222	Mensaje de notificacion 222	Push	2025-10-12 01:05:53.816216	389
223	Mensaje de notificacion 223	Interna	2024-09-18 11:29:36.411495	279
224	Mensaje de notificacion 224	Interna	2024-11-09 10:30:31.662322	118
225	Mensaje de notificacion 225	Interna	2025-02-16 23:23:14.90972	33
226	Mensaje de notificacion 226	Interna	2025-09-01 03:13:28.666554	166
227	Mensaje de notificacion 227	Email	2024-05-11 01:33:55.413563	498
228	Mensaje de notificacion 228	Email	2026-01-12 20:47:35.939512	83
229	Mensaje de notificacion 229	Email	2025-08-17 17:15:02.170753	142
230	Mensaje de notificacion 230	Email	2026-03-23 20:49:06.240283	46
231	Mensaje de notificacion 231	Email	2024-08-29 17:06:06.678048	121
232	Mensaje de notificacion 232	Interna	2026-06-24 10:04:10.303687	492
233	Mensaje de notificacion 233	Push	2026-08-04 02:37:12.777611	472
234	Mensaje de notificacion 234	Push	2025-02-23 20:23:00.204313	351
235	Mensaje de notificacion 235	Interna	2026-08-27 14:50:01.484674	265
236	Mensaje de notificacion 236	Push	2024-03-02 11:36:25.489342	281
237	Mensaje de notificacion 237	Email	2025-05-15 18:48:54.932161	85
238	Mensaje de notificacion 238	Email	2025-11-13 20:09:53.780761	219
239	Mensaje de notificacion 239	Push	2024-02-13 15:37:12.111601	248
240	Mensaje de notificacion 240	Email	2025-01-07 18:10:28.148586	458
241	Mensaje de notificacion 241	Email	2025-03-18 20:39:37.011263	185
242	Mensaje de notificacion 242	Email	2026-02-19 05:54:17.484588	442
243	Mensaje de notificacion 243	Interna	2025-01-09 06:38:28.30806	76
244	Mensaje de notificacion 244	Email	2024-11-28 17:52:41.201613	152
245	Mensaje de notificacion 245	Interna	2026-04-29 17:04:05.796866	339
246	Mensaje de notificacion 246	Email	2024-08-02 05:17:12.902045	452
247	Mensaje de notificacion 247	Push	2025-09-30 05:44:40.908755	338
248	Mensaje de notificacion 248	Interna	2024-05-22 08:34:46.613524	99
249	Mensaje de notificacion 249	Interna	2024-04-01 02:57:32.983729	122
250	Mensaje de notificacion 250	Email	2025-02-21 09:55:20.209829	367
251	Mensaje de notificacion 251	Interna	2026-02-15 18:30:32.071098	103
252	Mensaje de notificacion 252	Push	2025-11-05 05:38:08.360289	333
253	Mensaje de notificacion 253	Email	2025-01-12 02:54:12.631654	61
254	Mensaje de notificacion 254	Interna	2024-09-07 14:01:00.95318	338
255	Mensaje de notificacion 255	Email	2025-12-01 16:33:52.067755	288
256	Mensaje de notificacion 256	Push	2025-03-07 02:25:15.430817	134
257	Mensaje de notificacion 257	Email	2025-03-30 14:45:48.395384	295
258	Mensaje de notificacion 258	Email	2024-02-27 08:04:25.332495	427
259	Mensaje de notificacion 259	Email	2025-08-14 20:24:59.657242	51
260	Mensaje de notificacion 260	Push	2025-12-01 12:08:31.678874	189
261	Mensaje de notificacion 261	Email	2024-05-24 15:25:06.261009	263
262	Mensaje de notificacion 262	Interna	2024-02-04 07:09:19.148805	234
263	Mensaje de notificacion 263	Email	2023-12-16 20:14:35.602095	411
264	Mensaje de notificacion 264	Email	2023-10-21 19:43:23.505165	322
265	Mensaje de notificacion 265	Push	2024-08-17 12:38:33.892568	444
266	Mensaje de notificacion 266	Email	2024-11-29 10:40:51.030755	427
267	Mensaje de notificacion 267	Push	2024-02-04 02:28:03.241592	460
268	Mensaje de notificacion 268	Email	2026-06-10 01:16:00.38587	115
269	Mensaje de notificacion 269	Push	2026-07-08 04:20:11.937534	342
270	Mensaje de notificacion 270	Push	2025-03-02 01:39:24.706619	39
271	Mensaje de notificacion 271	Email	2025-12-06 13:30:13.877197	423
272	Mensaje de notificacion 272	Interna	2024-01-28 03:39:22.256303	362
273	Mensaje de notificacion 273	Interna	2024-09-22 20:01:22.266795	337
274	Mensaje de notificacion 274	Push	2024-09-22 22:14:47.506075	181
275	Mensaje de notificacion 275	Push	2025-10-09 03:19:06.041653	282
276	Mensaje de notificacion 276	Interna	2026-07-15 14:31:40.041493	147
277	Mensaje de notificacion 277	Email	2025-07-03 03:42:57.490353	20
278	Mensaje de notificacion 278	Push	2024-10-10 02:34:51.097753	40
279	Mensaje de notificacion 279	Interna	2025-01-20 20:41:42.94112	295
280	Mensaje de notificacion 280	Push	2026-05-20 06:54:16.981195	127
281	Mensaje de notificacion 281	Push	2026-07-06 04:32:31.068972	200
282	Mensaje de notificacion 282	Email	2025-05-04 07:42:58.24574	490
283	Mensaje de notificacion 283	Email	2026-02-23 18:28:15.440942	25
284	Mensaje de notificacion 284	Push	2023-10-23 03:17:50.82704	396
285	Mensaje de notificacion 285	Push	2026-04-06 12:29:14.870788	28
286	Mensaje de notificacion 286	Push	2024-08-10 23:11:32.620276	226
287	Mensaje de notificacion 287	Email	2024-08-24 18:10:59.534528	491
288	Mensaje de notificacion 288	Email	2024-09-21 06:07:23.073497	253
289	Mensaje de notificacion 289	Push	2026-03-13 19:47:31.579358	498
290	Mensaje de notificacion 290	Email	2025-10-10 06:29:07.410407	47
291	Mensaje de notificacion 291	Push	2025-03-02 08:10:57.192986	122
292	Mensaje de notificacion 292	Interna	2025-09-13 23:49:18.81686	330
293	Mensaje de notificacion 293	Email	2025-01-20 10:32:15.655283	366
294	Mensaje de notificacion 294	Interna	2024-06-11 01:48:30.752604	401
295	Mensaje de notificacion 295	Email	2026-04-02 09:01:12.581377	207
296	Mensaje de notificacion 296	Interna	2026-06-11 03:42:47.076796	15
297	Mensaje de notificacion 297	Push	2024-09-20 02:48:59.621621	21
298	Mensaje de notificacion 298	Push	2025-04-05 06:13:01.463143	324
299	Mensaje de notificacion 299	Email	2026-04-29 15:06:12.180296	338
300	Mensaje de notificacion 300	Email	2025-03-24 12:51:02.87059	229
301	Mensaje de notificacion 301	Email	2026-04-03 19:12:20.893036	173
302	Mensaje de notificacion 302	Email	2025-12-23 11:27:03.40696	133
303	Mensaje de notificacion 303	Email	2025-03-17 13:55:06.088308	56
304	Mensaje de notificacion 304	Email	2025-09-09 04:59:40.659993	292
305	Mensaje de notificacion 305	Email	2025-12-21 06:37:25.267553	107
306	Mensaje de notificacion 306	Interna	2026-06-14 19:51:05.120619	137
307	Mensaje de notificacion 307	Email	2026-01-04 15:32:09.006512	206
308	Mensaje de notificacion 308	Push	2023-11-04 01:11:44.144446	133
309	Mensaje de notificacion 309	Interna	2026-07-26 09:25:42.288752	275
310	Mensaje de notificacion 310	Email	2025-02-10 12:41:13.452663	435
311	Mensaje de notificacion 311	Email	2024-02-06 10:33:30.457239	404
312	Mensaje de notificacion 312	Email	2023-10-15 10:43:35.756582	254
313	Mensaje de notificacion 313	Email	2025-05-14 03:19:39.765699	330
314	Mensaje de notificacion 314	Email	2024-05-03 10:37:45.595734	348
315	Mensaje de notificacion 315	Email	2025-10-11 22:06:33.239483	241
316	Mensaje de notificacion 316	Email	2026-03-02 20:31:58.167273	423
317	Mensaje de notificacion 317	Push	2024-02-10 14:38:07.746103	151
318	Mensaje de notificacion 318	Email	2024-07-10 03:44:58.758861	78
319	Mensaje de notificacion 319	Email	2026-04-21 02:01:16.397281	136
320	Mensaje de notificacion 320	Push	2025-01-04 17:14:20.885306	265
321	Mensaje de notificacion 321	Push	2024-01-26 00:48:29.2912	73
322	Mensaje de notificacion 322	Email	2025-11-02 08:22:37.006272	205
323	Mensaje de notificacion 323	Email	2026-06-21 14:23:38.586189	263
324	Mensaje de notificacion 324	Interna	2025-01-03 22:19:16.72432	198
325	Mensaje de notificacion 325	Interna	2026-08-11 18:18:58.134365	478
326	Mensaje de notificacion 326	Email	2023-12-08 07:40:54.749796	471
327	Mensaje de notificacion 327	Push	2026-01-26 16:00:14.246694	2
328	Mensaje de notificacion 328	Push	2025-11-06 20:41:07.139218	362
329	Mensaje de notificacion 329	Push	2025-03-03 19:15:29.138163	388
330	Mensaje de notificacion 330	Email	2025-07-24 08:56:37.685466	259
331	Mensaje de notificacion 331	Interna	2026-07-09 07:05:04.421887	52
332	Mensaje de notificacion 332	Interna	2024-11-03 10:39:49.767744	173
333	Mensaje de notificacion 333	Email	2026-01-23 06:34:32.80581	468
334	Mensaje de notificacion 334	Email	2024-04-03 20:34:16.672653	85
335	Mensaje de notificacion 335	Email	2024-01-18 19:48:35.397484	140
336	Mensaje de notificacion 336	Email	2026-01-17 16:29:55.621546	373
337	Mensaje de notificacion 337	Email	2025-12-17 00:34:31.767219	498
338	Mensaje de notificacion 338	Interna	2024-04-08 23:51:11.600844	161
339	Mensaje de notificacion 339	Email	2025-10-12 11:36:57.722328	388
340	Mensaje de notificacion 340	Interna	2025-11-08 11:23:05.204154	121
341	Mensaje de notificacion 341	Interna	2024-11-15 14:29:53.023616	302
342	Mensaje de notificacion 342	Push	2024-11-19 07:30:57.896114	170
343	Mensaje de notificacion 343	Push	2025-06-26 08:24:15.266011	234
344	Mensaje de notificacion 344	Interna	2024-08-31 05:33:08.900212	415
345	Mensaje de notificacion 345	Email	2025-05-15 00:39:42.610665	75
346	Mensaje de notificacion 346	Push	2025-09-13 20:06:55.767235	371
347	Mensaje de notificacion 347	Push	2025-12-19 04:17:11.105194	104
348	Mensaje de notificacion 348	Interna	2024-07-30 22:53:32.549014	334
349	Mensaje de notificacion 349	Interna	2023-12-04 06:43:26.385104	243
350	Mensaje de notificacion 350	Interna	2024-08-03 12:45:49.295464	465
351	Mensaje de notificacion 351	Email	2023-12-09 01:58:57.995834	336
352	Mensaje de notificacion 352	Email	2026-01-14 16:37:16.020781	200
353	Mensaje de notificacion 353	Email	2024-11-19 15:29:56.826808	489
354	Mensaje de notificacion 354	Email	2026-03-20 07:22:43.441393	24
355	Mensaje de notificacion 355	Interna	2025-10-26 05:59:33.773217	196
356	Mensaje de notificacion 356	Interna	2024-12-06 21:48:52.747518	126
357	Mensaje de notificacion 357	Push	2026-08-05 07:29:49.711194	303
358	Mensaje de notificacion 358	Email	2024-12-23 02:27:33.79225	164
359	Mensaje de notificacion 359	Email	2023-12-05 16:53:01.237036	36
360	Mensaje de notificacion 360	Email	2026-09-08 00:28:33.198497	356
361	Mensaje de notificacion 361	Email	2023-12-22 15:11:37.218519	475
362	Mensaje de notificacion 362	Interna	2024-09-27 00:09:50.518082	335
363	Mensaje de notificacion 363	Interna	2025-07-26 22:52:52.302837	269
364	Mensaje de notificacion 364	Push	2024-12-30 14:56:22.175539	173
365	Mensaje de notificacion 365	Email	2026-06-13 13:21:42.904202	145
366	Mensaje de notificacion 366	Push	2024-10-31 12:01:43.836686	315
367	Mensaje de notificacion 367	Interna	2025-08-22 11:04:18.222329	482
368	Mensaje de notificacion 368	Email	2023-11-30 03:23:46.246901	221
369	Mensaje de notificacion 369	Email	2023-10-19 17:44:23.788892	308
370	Mensaje de notificacion 370	Interna	2024-05-08 08:10:51.741642	350
371	Mensaje de notificacion 371	Email	2024-11-13 01:35:35.027283	434
372	Mensaje de notificacion 372	Email	2025-03-08 06:22:52.003022	37
373	Mensaje de notificacion 373	Push	2025-04-18 13:57:40.115165	120
374	Mensaje de notificacion 374	Email	2024-07-05 12:14:22.224288	29
375	Mensaje de notificacion 375	Email	2025-03-27 06:59:16.455535	304
376	Mensaje de notificacion 376	Email	2024-02-23 16:46:05.878869	6
377	Mensaje de notificacion 377	Push	2023-11-22 00:40:48.674782	63
378	Mensaje de notificacion 378	Email	2024-02-05 12:01:54.056253	402
379	Mensaje de notificacion 379	Interna	2026-02-03 20:12:32.304985	288
380	Mensaje de notificacion 380	Email	2025-07-19 20:36:45.982925	230
381	Mensaje de notificacion 381	Push	2023-11-30 14:53:04.807011	303
382	Mensaje de notificacion 382	Email	2025-05-27 19:40:47.210531	224
383	Mensaje de notificacion 383	Push	2026-01-16 00:45:17.711023	93
384	Mensaje de notificacion 384	Interna	2024-12-26 15:43:53.773489	194
385	Mensaje de notificacion 385	Email	2026-01-19 08:25:53.490456	228
386	Mensaje de notificacion 386	Push	2026-06-17 21:11:04.27444	375
387	Mensaje de notificacion 387	Email	2025-02-07 02:34:26.982308	55
388	Mensaje de notificacion 388	Interna	2023-11-14 02:08:12.041768	294
389	Mensaje de notificacion 389	Push	2025-07-22 22:14:41.340292	254
390	Mensaje de notificacion 390	Interna	2025-10-04 06:03:17.505485	101
391	Mensaje de notificacion 391	Push	2025-11-04 00:06:17.462992	185
392	Mensaje de notificacion 392	Email	2026-07-21 18:46:34.232036	322
393	Mensaje de notificacion 393	Email	2026-03-21 11:19:24.312453	486
394	Mensaje de notificacion 394	Interna	2025-08-17 16:50:48.305734	88
395	Mensaje de notificacion 395	Interna	2024-10-10 11:16:53.229599	405
396	Mensaje de notificacion 396	Email	2025-03-15 01:27:54.765231	431
397	Mensaje de notificacion 397	Interna	2024-11-04 21:18:23.952302	225
398	Mensaje de notificacion 398	Email	2025-03-15 10:37:26.584064	261
399	Mensaje de notificacion 399	Interna	2026-03-06 08:30:16.748525	333
400	Mensaje de notificacion 400	Interna	2023-09-25 05:40:45.541886	282
401	Mensaje de notificacion 401	Email	2026-07-18 09:28:11.105342	406
402	Mensaje de notificacion 402	Email	2024-06-12 11:04:24.352248	405
403	Mensaje de notificacion 403	Interna	2026-05-27 17:18:14.717029	413
404	Mensaje de notificacion 404	Interna	2025-01-15 11:29:18.492161	97
405	Mensaje de notificacion 405	Email	2026-03-06 15:30:29.073029	56
406	Mensaje de notificacion 406	Push	2026-05-04 09:01:01.965049	101
407	Mensaje de notificacion 407	Interna	2025-10-23 09:58:47.410099	296
408	Mensaje de notificacion 408	Push	2025-01-02 01:01:35.203679	139
409	Mensaje de notificacion 409	Push	2026-05-12 15:44:20.550216	82
410	Mensaje de notificacion 410	Email	2024-08-27 11:44:30.677088	81
411	Mensaje de notificacion 411	Email	2024-12-21 11:41:05.059762	437
412	Mensaje de notificacion 412	Interna	2024-12-21 10:41:49.879878	331
413	Mensaje de notificacion 413	Interna	2025-03-30 19:58:29.763672	317
414	Mensaje de notificacion 414	Push	2024-09-05 15:14:44.686367	448
415	Mensaje de notificacion 415	Interna	2025-06-11 19:13:05.637889	442
416	Mensaje de notificacion 416	Interna	2024-02-03 08:20:07.293205	300
417	Mensaje de notificacion 417	Push	2023-10-29 12:39:40.549922	456
418	Mensaje de notificacion 418	Interna	2023-10-28 13:32:17.354545	112
419	Mensaje de notificacion 419	Push	2026-01-30 05:41:03.020427	194
420	Mensaje de notificacion 420	Interna	2024-05-31 04:36:19.788716	180
421	Mensaje de notificacion 421	Email	2025-09-01 19:38:57.346787	251
422	Mensaje de notificacion 422	Email	2026-03-14 21:28:42.053199	115
423	Mensaje de notificacion 423	Interna	2025-02-04 06:18:33.714069	296
424	Mensaje de notificacion 424	Push	2026-07-29 20:49:54.432584	240
425	Mensaje de notificacion 425	Email	2025-08-28 11:29:18.210301	433
426	Mensaje de notificacion 426	Email	2024-06-21 18:09:50.182995	108
427	Mensaje de notificacion 427	Push	2023-12-10 05:59:38.313248	422
428	Mensaje de notificacion 428	Interna	2026-03-04 05:12:13.624683	160
429	Mensaje de notificacion 429	Email	2026-02-23 10:26:31.207671	486
430	Mensaje de notificacion 430	Email	2025-06-24 04:48:25.979267	265
431	Mensaje de notificacion 431	Push	2026-03-12 01:25:55.879268	77
432	Mensaje de notificacion 432	Email	2024-01-27 21:19:28.255745	463
433	Mensaje de notificacion 433	Push	2024-11-04 02:01:33.850565	255
434	Mensaje de notificacion 434	Interna	2026-01-02 14:57:57.805239	139
435	Mensaje de notificacion 435	Interna	2024-06-22 07:49:39.712357	186
436	Mensaje de notificacion 436	Interna	2025-02-28 06:32:08.056294	346
437	Mensaje de notificacion 437	Email	2024-04-06 18:46:17.400434	369
438	Mensaje de notificacion 438	Email	2025-06-10 18:55:44.418788	173
439	Mensaje de notificacion 439	Interna	2025-11-27 03:21:06.488755	232
440	Mensaje de notificacion 440	Email	2025-05-03 00:27:22.566408	225
441	Mensaje de notificacion 441	Email	2025-06-28 17:18:34.912439	217
442	Mensaje de notificacion 442	Email	2025-08-19 19:50:19.524496	86
443	Mensaje de notificacion 443	Push	2025-02-09 04:40:14.325514	83
444	Mensaje de notificacion 444	Push	2025-12-28 05:31:49.930294	67
445	Mensaje de notificacion 445	Push	2024-05-24 23:31:29.688457	57
446	Mensaje de notificacion 446	Email	2023-09-28 11:55:49.335609	204
447	Mensaje de notificacion 447	Email	2025-11-22 04:20:22.666736	78
448	Mensaje de notificacion 448	Email	2026-02-08 22:57:44.39421	417
449	Mensaje de notificacion 449	Email	2024-10-31 12:11:37.487118	165
450	Mensaje de notificacion 450	Interna	2025-12-07 01:59:01.724482	295
451	Mensaje de notificacion 451	Push	2023-10-14 05:35:38.71768	445
452	Mensaje de notificacion 452	Email	2024-10-02 12:34:59.301611	220
453	Mensaje de notificacion 453	Interna	2025-03-11 10:45:44.096822	388
454	Mensaje de notificacion 454	Email	2024-07-09 16:03:06.055731	345
455	Mensaje de notificacion 455	Email	2026-07-10 22:06:43.438828	132
456	Mensaje de notificacion 456	Email	2026-09-15 15:23:21.189787	178
457	Mensaje de notificacion 457	Email	2025-10-28 03:48:35.647822	475
458	Mensaje de notificacion 458	Interna	2025-01-11 18:13:32.393173	369
459	Mensaje de notificacion 459	Email	2024-05-02 14:37:32.845462	493
460	Mensaje de notificacion 460	Email	2026-01-27 04:24:55.075086	305
461	Mensaje de notificacion 461	Email	2024-04-07 11:02:11.41772	357
462	Mensaje de notificacion 462	Push	2024-04-21 10:57:21.394355	324
463	Mensaje de notificacion 463	Email	2025-04-21 05:19:21.604039	349
464	Mensaje de notificacion 464	Email	2023-12-04 02:59:11.495281	71
465	Mensaje de notificacion 465	Email	2025-11-22 05:37:35.681596	42
466	Mensaje de notificacion 466	Email	2026-09-17 20:13:39.636582	300
467	Mensaje de notificacion 467	Email	2024-07-01 00:56:28.062626	232
468	Mensaje de notificacion 468	Email	2023-10-27 07:41:00.156646	252
469	Mensaje de notificacion 469	Interna	2025-10-17 23:27:27.201756	336
470	Mensaje de notificacion 470	Push	2024-05-16 10:29:24.870027	215
471	Mensaje de notificacion 471	Push	2024-03-01 17:38:34.434254	104
472	Mensaje de notificacion 472	Interna	2025-10-22 08:11:34.113694	124
473	Mensaje de notificacion 473	Interna	2026-05-05 08:06:26.652791	392
474	Mensaje de notificacion 474	Push	2024-03-26 22:12:41.610009	172
475	Mensaje de notificacion 475	Push	2024-06-02 02:23:37.227896	447
476	Mensaje de notificacion 476	Email	2026-07-28 13:40:18.307985	237
477	Mensaje de notificacion 477	Email	2026-04-10 10:04:34.671448	172
478	Mensaje de notificacion 478	Email	2026-05-02 04:13:27.846401	343
479	Mensaje de notificacion 479	Interna	2024-10-29 19:48:12.572492	191
480	Mensaje de notificacion 480	Email	2025-06-22 00:41:11.070937	472
481	Mensaje de notificacion 481	Email	2024-12-27 05:56:03.670252	492
482	Mensaje de notificacion 482	Interna	2024-07-02 20:25:38.982744	312
483	Mensaje de notificacion 483	Email	2026-05-19 17:40:32.021842	351
484	Mensaje de notificacion 484	Email	2025-10-23 21:44:18.629649	31
485	Mensaje de notificacion 485	Push	2024-06-29 23:48:58.554116	439
486	Mensaje de notificacion 486	Email	2024-08-08 09:46:45.292235	81
487	Mensaje de notificacion 487	Push	2024-04-30 08:56:18.913123	239
488	Mensaje de notificacion 488	Email	2024-04-13 06:34:41.571404	362
489	Mensaje de notificacion 489	Email	2026-07-18 22:09:38.759421	167
490	Mensaje de notificacion 490	Interna	2024-12-22 18:01:57.854401	221
491	Mensaje de notificacion 491	Interna	2026-04-18 23:06:43.293066	190
492	Mensaje de notificacion 492	Interna	2024-02-11 14:32:49.269382	58
493	Mensaje de notificacion 493	Email	2025-09-22 00:41:28.482573	328
494	Mensaje de notificacion 494	Push	2023-10-06 18:56:12.284648	459
495	Mensaje de notificacion 495	Push	2024-06-25 20:43:00.702902	40
496	Mensaje de notificacion 496	Interna	2023-11-15 20:41:24.176228	166
497	Mensaje de notificacion 497	Interna	2025-12-16 05:41:28.942589	70
498	Mensaje de notificacion 498	Interna	2025-12-04 01:15:25.175046	125
499	Mensaje de notificacion 499	Push	2024-03-05 23:22:02.716916	15
500	Mensaje de notificacion 500	Interna	2026-01-17 02:34:56.962351	431
\.


--
-- Data for Name: otorga; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.otorga (id_categoria, id_promocion) FROM stdin;
2	1
3	3
1	5
\.


--
-- Data for Name: promociones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promociones (id_promocion, nombre_promocion, descripcion, fecha_inicio, fecha_final) FROM stdin;
1	Promocion 1	Descripcion de la promo 1	2023-10-05	2026-08-12
2	Promocion 2	Descripcion de la promo 2	2024-06-05	2026-02-24
3	Promocion 3	Descripcion de la promo 3	2024-01-28	2024-11-11
4	Promocion 4	Descripcion de la promo 4	2024-07-28	2024-02-02
5	Promocion 5	Descripcion de la promo 5	2025-06-22	2025-04-19
6	Promocion 6	Descripcion de la promo 6	2026-01-29	2025-03-02
7	Promocion 7	Descripcion de la promo 7	2026-08-05	2024-08-18
8	Promocion 8	Descripcion de la promo 8	2024-01-07	2024-07-31
9	Promocion 9	Descripcion de la promo 9	2024-04-27	2025-03-25
10	Promocion 10	Descripcion de la promo 10	2025-10-19	2024-07-18
11	Promocion 11	Descripcion de la promo 11	2026-05-26	2024-08-22
12	Promocion 12	Descripcion de la promo 12	2023-12-07	2026-03-24
13	Promocion 13	Descripcion de la promo 13	2024-11-18	2025-09-09
14	Promocion 14	Descripcion de la promo 14	2025-12-09	2025-09-23
15	Promocion 15	Descripcion de la promo 15	2026-06-07	2025-08-16
16	Promocion 16	Descripcion de la promo 16	2026-07-09	2026-01-02
17	Promocion 17	Descripcion de la promo 17	2025-08-14	2024-10-18
18	Promocion 18	Descripcion de la promo 18	2024-06-14	2024-03-06
19	Promocion 19	Descripcion de la promo 19	2025-02-03	2026-05-28
20	Promocion 20	Descripcion de la promo 20	2025-09-15	2025-10-20
21	Promocion 21	Descripcion de la promo 21	2025-06-17	2026-08-01
22	Promocion 22	Descripcion de la promo 22	2026-09-08	2026-07-27
23	Promocion 23	Descripcion de la promo 23	2025-05-20	2025-01-15
24	Promocion 24	Descripcion de la promo 24	2025-06-04	2025-06-28
25	Promocion 25	Descripcion de la promo 25	2024-04-11	2026-06-10
26	Promocion 26	Descripcion de la promo 26	2024-04-01	2026-09-03
27	Promocion 27	Descripcion de la promo 27	2025-01-28	2026-04-22
28	Promocion 28	Descripcion de la promo 28	2025-11-13	2025-07-24
29	Promocion 29	Descripcion de la promo 29	2025-05-29	2024-06-03
30	Promocion 30	Descripcion de la promo 30	2024-12-18	2024-08-18
31	Promocion 31	Descripcion de la promo 31	2026-04-10	2025-01-12
32	Promocion 32	Descripcion de la promo 32	2024-09-25	2026-07-27
33	Promocion 33	Descripcion de la promo 33	2023-12-25	2024-06-30
34	Promocion 34	Descripcion de la promo 34	2025-04-27	2026-05-05
35	Promocion 35	Descripcion de la promo 35	2025-03-31	2026-09-09
36	Promocion 36	Descripcion de la promo 36	2025-08-17	2024-07-19
37	Promocion 37	Descripcion de la promo 37	2026-07-22	2025-01-17
38	Promocion 38	Descripcion de la promo 38	2024-09-12	2026-01-16
39	Promocion 39	Descripcion de la promo 39	2025-05-22	2024-11-07
40	Promocion 40	Descripcion de la promo 40	2026-09-10	2024-12-27
41	Promocion 41	Descripcion de la promo 41	2026-08-11	2025-06-06
42	Promocion 42	Descripcion de la promo 42	2024-08-06	2025-02-04
43	Promocion 43	Descripcion de la promo 43	2026-07-26	2024-11-11
44	Promocion 44	Descripcion de la promo 44	2026-01-26	2024-07-12
45	Promocion 45	Descripcion de la promo 45	2025-09-23	2025-05-05
46	Promocion 46	Descripcion de la promo 46	2025-07-24	2025-09-28
47	Promocion 47	Descripcion de la promo 47	2024-04-07	2024-04-25
48	Promocion 48	Descripcion de la promo 48	2025-01-09	2026-04-21
49	Promocion 49	Descripcion de la promo 49	2024-09-13	2025-01-26
50	Promocion 50	Descripcion de la promo 50	2023-10-19	2024-07-24
\.


--
-- Data for Name: puntos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.puntos (id_usuario, fecha_hora, cantidad_puntos, motivo) FROM stdin;
241	2023-12-01 06:10:26.956141	246	Acumulacion por juego
368	2026-04-11 08:29:22.459576	527	Canje en restaurante
118	2025-03-01 22:27:05.834265	-160	Canje en restaurante
251	2025-04-27 04:17:24.197117	342	Canje en restaurante
208	2023-10-02 19:15:16.367822	89	Acumulacion por juego
49	2023-11-30 00:03:49.788498	-107	Canje en restaurante
356	2026-01-20 09:27:51.227941	303	Acumulacion por juego
371	2026-01-11 12:04:23.888346	-183	Acumulacion por juego
215	2024-06-14 01:58:19.17903	178	Canje en restaurante
186	2026-08-20 07:11:40.800295	767	Acumulacion por juego
57	2023-11-02 23:32:43.992554	66	Acumulacion por juego
286	2025-04-20 01:16:02.305675	598	Acumulacion por juego
357	2026-07-25 01:34:26.191692	599	Acumulacion por juego
29	2025-10-08 10:44:56.115648	744	Acumulacion por juego
399	2024-05-02 13:22:32.384832	384	Canje en restaurante
8	2025-12-22 07:51:02.662876	-59	Canje en restaurante
370	2025-01-31 20:33:36.336772	313	Canje en restaurante
268	2026-05-27 02:40:08.853	270	Acumulacion por juego
239	2024-09-10 23:09:15.455541	286	Acumulacion por juego
194	2025-11-14 01:24:23.866662	305	Acumulacion por juego
259	2026-07-30 05:04:59.704203	721	Acumulacion por juego
180	2026-03-16 22:51:52.490153	161	Acumulacion por juego
145	2023-10-22 20:23:00.716939	300	Canje en restaurante
98	2025-01-22 06:37:44.966782	552	Acumulacion por juego
291	2024-12-30 15:39:22.484534	531	Canje en restaurante
262	2024-05-16 13:18:02.90898	-131	Canje en restaurante
116	2024-03-18 15:10:33.098373	3	Acumulacion por juego
240	2025-10-01 05:51:33.71476	593	Canje en restaurante
365	2024-05-19 15:12:41.039836	-67	Canje en restaurante
340	2026-03-27 16:44:33.422674	487	Canje en restaurante
317	2025-01-20 14:29:53.359363	382	Canje en restaurante
2	2025-08-30 19:09:30.722436	588	Acumulacion por juego
174	2025-11-18 20:44:17.767713	197	Acumulacion por juego
309	2025-08-21 20:33:56.720381	-4	Acumulacion por juego
301	2024-06-27 19:58:14.334419	-83	Canje en restaurante
121	2026-07-15 22:28:47.97715	285	Acumulacion por juego
343	2026-02-21 00:44:14.33702	486	Acumulacion por juego
132	2026-01-05 10:57:36.025206	207	Acumulacion por juego
100	2023-12-31 06:14:15.35426	-94	Acumulacion por juego
140	2024-03-31 05:49:06.171683	-10	Acumulacion por juego
266	2024-05-12 21:35:29.431402	367	Canje en restaurante
236	2026-03-31 21:07:11.828817	248	Acumulacion por juego
163	2026-02-19 19:59:41.344889	305	Acumulacion por juego
139	2024-06-11 17:41:45.739185	447	Acumulacion por juego
78	2025-04-12 09:31:47.416429	406	Canje en restaurante
247	2026-02-17 04:30:47.558395	235	Acumulacion por juego
37	2025-09-22 00:15:06.467428	185	Acumulacion por juego
175	2025-04-13 12:26:06.794856	37	Acumulacion por juego
266	2024-02-02 07:53:47.94047	622	Acumulacion por juego
255	2025-10-14 00:23:14.692934	423	Acumulacion por juego
279	2026-02-18 14:31:31.172411	366	Canje en restaurante
25	2024-05-14 23:29:01.096414	480	Canje en restaurante
395	2026-07-26 07:08:34.209796	-6	Canje en restaurante
337	2025-01-02 05:38:29.911075	591	Acumulacion por juego
362	2024-11-30 16:55:38.478789	594	Acumulacion por juego
363	2024-12-17 03:23:49.632918	-161	Acumulacion por juego
146	2025-02-17 10:53:59.27221	625	Canje en restaurante
119	2024-10-29 19:36:38.774543	438	Acumulacion por juego
43	2025-02-01 20:37:40.613452	-119	Canje en restaurante
201	2026-07-24 16:07:02.727611	609	Canje en restaurante
279	2025-06-19 08:39:25.46506	145	Acumulacion por juego
167	2024-07-16 05:01:29.732189	-154	Acumulacion por juego
196	2025-04-07 14:39:46.307462	383	Acumulacion por juego
233	2025-05-31 13:27:20.998882	242	Acumulacion por juego
127	2025-11-15 03:11:59.923104	-3	Canje en restaurante
395	2024-03-02 07:32:41.300286	226	Canje en restaurante
114	2025-07-17 13:42:27.50929	659	Acumulacion por juego
245	2025-08-12 13:15:40.589017	-46	Canje en restaurante
207	2024-08-07 18:43:02.021307	12	Acumulacion por juego
344	2024-11-13 14:49:04.153356	430	Canje en restaurante
175	2026-05-08 02:28:01.278422	577	Acumulacion por juego
362	2025-02-28 08:28:08.529299	217	Acumulacion por juego
397	2026-07-22 05:14:09.129802	163	Canje en restaurante
137	2025-06-09 17:14:23.967034	344	Canje en restaurante
36	2026-07-01 18:34:55.713281	215	Canje en restaurante
346	2024-11-15 00:55:18.802921	651	Canje en restaurante
222	2026-08-19 22:26:21.470841	-148	Canje en restaurante
356	2025-11-16 16:32:37.369815	719	Acumulacion por juego
39	2023-10-30 02:25:26.496923	-61	Acumulacion por juego
183	2024-12-25 04:40:45.113381	-66	Acumulacion por juego
58	2024-05-17 23:45:25.787965	51	Canje en restaurante
152	2024-02-28 23:37:53.131151	129	Canje en restaurante
344	2024-12-15 07:38:57.839195	710	Acumulacion por juego
362	2025-06-05 03:56:13.059693	238	Canje en restaurante
283	2026-05-03 18:02:39.404209	364	Canje en restaurante
101	2025-07-31 02:00:46.24021	586	Canje en restaurante
262	2025-02-24 00:20:51.392199	324	Canje en restaurante
333	2024-03-25 02:19:56.077635	-164	Canje en restaurante
23	2023-10-16 00:39:17.112576	701	Acumulacion por juego
394	2025-06-01 09:08:47.673587	677	Canje en restaurante
315	2025-01-08 05:16:09.770564	329	Acumulacion por juego
400	2026-01-17 21:19:57.072992	-12	Canje en restaurante
71	2026-09-05 19:44:08.248227	770	Canje en restaurante
332	2026-04-27 13:59:31.996821	790	Acumulacion por juego
223	2025-03-07 05:39:52.046331	418	Canje en restaurante
112	2024-03-03 02:45:12.72045	151	Acumulacion por juego
379	2025-04-08 19:14:10.729333	429	Canje en restaurante
239	2025-11-27 12:56:45.690538	123	Acumulacion por juego
363	2024-02-04 16:35:51.001373	240	Acumulacion por juego
218	2025-03-06 07:28:14.023015	567	Acumulacion por juego
65	2025-04-11 18:20:05.316568	540	Canje en restaurante
376	2026-01-22 17:55:41.125868	287	Canje en restaurante
22	2023-11-20 19:24:00.261155	-178	Canje en restaurante
301	2025-06-08 18:21:11.158168	279	Acumulacion por juego
309	2024-06-06 14:01:33.998638	158	Acumulacion por juego
338	2025-01-19 12:45:52.297219	205	Acumulacion por juego
368	2025-06-06 22:19:56.461022	449	Canje en restaurante
10	2025-07-31 23:36:52.908015	141	Acumulacion por juego
317	2023-10-17 13:06:21.39951	633	Acumulacion por juego
66	2024-01-17 12:00:46.078265	239	Acumulacion por juego
352	2026-03-21 14:43:17.396636	143	Acumulacion por juego
289	2025-01-19 21:56:12.686857	419	Acumulacion por juego
215	2023-11-29 14:45:28.389805	592	Canje en restaurante
227	2026-08-25 04:16:11.821288	545	Acumulacion por juego
322	2025-05-16 20:42:13.418978	180	Canje en restaurante
134	2024-08-29 05:02:53.607753	99	Acumulacion por juego
58	2025-10-20 14:42:25.815909	206	Acumulacion por juego
31	2025-03-06 15:35:59.049002	-29	Acumulacion por juego
148	2026-06-04 11:48:01.460358	465	Acumulacion por juego
222	2025-11-15 20:03:11.390811	99	Acumulacion por juego
396	2025-02-01 07:36:25.85095	220	Canje en restaurante
342	2025-02-01 05:50:33.128184	50	Acumulacion por juego
368	2026-06-10 12:41:39.623178	-189	Canje en restaurante
3	2024-03-16 02:05:51.275721	768	Acumulacion por juego
260	2024-08-18 04:47:32.247656	220	Acumulacion por juego
241	2024-02-26 13:04:57.701001	-181	Canje en restaurante
205	2025-01-07 16:13:19.337886	205	Canje en restaurante
382	2024-05-27 13:29:59.359495	700	Acumulacion por juego
57	2026-06-14 02:26:22.266184	455	Canje en restaurante
347	2026-03-28 01:18:50.324625	592	Acumulacion por juego
226	2024-04-21 01:34:19.141253	512	Canje en restaurante
204	2025-10-21 15:42:10.396152	193	Acumulacion por juego
13	2025-04-19 12:47:14.054186	-141	Canje en restaurante
347	2025-02-09 08:31:58.113081	510	Acumulacion por juego
299	2025-12-05 14:42:10.625269	264	Canje en restaurante
214	2023-09-27 12:46:56.084789	-81	Canje en restaurante
172	2024-02-26 11:18:43.944949	-134	Canje en restaurante
281	2024-07-07 06:51:03.524876	275	Canje en restaurante
276	2024-06-05 05:33:05.374195	607	Canje en restaurante
74	2025-11-18 20:40:24.645531	143	Acumulacion por juego
400	2025-04-10 00:14:35.027974	402	Acumulacion por juego
190	2024-04-04 04:51:57.261549	551	Canje en restaurante
120	2025-06-18 05:12:24.805632	490	Canje en restaurante
197	2025-04-19 18:01:58.928736	239	Acumulacion por juego
114	2026-05-18 14:14:50.498818	303	Canje en restaurante
56	2026-08-04 04:18:44.447692	481	Acumulacion por juego
119	2025-09-15 11:32:03.008448	713	Canje en restaurante
390	2024-02-21 17:08:14.011104	253	Acumulacion por juego
335	2024-01-13 21:58:44.226017	224	Canje en restaurante
253	2026-09-09 05:28:41.702749	249	Canje en restaurante
73	2026-08-01 22:34:09.789672	637	Canje en restaurante
252	2024-09-09 21:44:05.809583	-93	Canje en restaurante
396	2026-05-19 06:55:47.492861	32	Canje en restaurante
119	2024-12-11 23:59:15.264144	329	Canje en restaurante
345	2025-10-24 13:33:59.855581	263	Acumulacion por juego
15	2026-03-22 09:24:57.510979	446	Acumulacion por juego
41	2024-12-12 17:45:27.609101	82	Canje en restaurante
318	2025-03-15 18:29:59.997262	510	Canje en restaurante
222	2025-09-06 07:26:42.48493	-132	Acumulacion por juego
311	2024-11-11 23:46:39.208865	615	Canje en restaurante
288	2026-08-05 20:29:29.129948	167	Canje en restaurante
11	2025-02-10 15:52:21.037714	566	Acumulacion por juego
55	2023-12-13 04:28:23.445678	-139	Acumulacion por juego
342	2026-03-19 12:03:19.485458	-103	Acumulacion por juego
42	2023-11-12 04:29:23.984564	-87	Acumulacion por juego
357	2026-04-02 16:39:42.281433	-196	Canje en restaurante
54	2026-08-23 11:34:07.663507	137	Acumulacion por juego
96	2026-04-17 03:14:28.233893	646	Acumulacion por juego
388	2025-04-15 01:12:53.231513	668	Acumulacion por juego
294	2026-08-24 22:04:23.107652	353	Canje en restaurante
232	2024-07-24 05:42:13.402754	-192	Acumulacion por juego
139	2025-12-07 19:51:30.916914	178	Canje en restaurante
312	2024-06-01 14:13:48.253514	470	Acumulacion por juego
99	2026-01-22 17:57:55.139438	711	Acumulacion por juego
279	2024-08-21 12:31:46.624027	630	Canje en restaurante
380	2025-05-04 21:31:45.292328	118	Canje en restaurante
13	2024-01-14 21:20:33.468404	380	Acumulacion por juego
9	2023-12-10 22:39:43.869212	133	Canje en restaurante
353	2025-10-12 13:10:18.687446	299	Acumulacion por juego
8	2025-06-25 04:25:30.938826	155	Acumulacion por juego
71	2025-10-28 01:17:32.851588	-39	Acumulacion por juego
136	2024-05-13 15:30:16.969427	337	Canje en restaurante
328	2026-01-28 20:28:19.385283	565	Acumulacion por juego
86	2025-02-04 07:26:58.945167	380	Canje en restaurante
167	2026-06-05 03:02:25.110386	105	Acumulacion por juego
247	2026-08-06 15:32:35.142783	422	Canje en restaurante
121	2024-09-27 10:48:31.705557	2	Canje en restaurante
112	2024-09-21 21:03:53.43374	115	Canje en restaurante
9	2025-05-19 22:50:00.660433	559	Canje en restaurante
259	2025-06-28 00:30:27.656109	500	Canje en restaurante
26	2024-01-22 17:59:17.257599	529	Canje en restaurante
269	2025-07-26 09:21:41.105153	564	Canje en restaurante
390	2024-06-16 13:37:12.033543	480	Acumulacion por juego
304	2026-07-19 21:27:32.17901	412	Acumulacion por juego
23	2025-07-13 08:32:44.963026	-21	Canje en restaurante
298	2026-07-15 09:09:41.841937	122	Canje en restaurante
249	2026-03-03 20:47:18.447644	725	Acumulacion por juego
271	2025-10-31 03:07:27.272932	253	Acumulacion por juego
102	2024-11-06 09:49:33.459596	446	Canje en restaurante
30	2025-12-28 22:15:59.807255	-153	Acumulacion por juego
328	2025-11-24 12:21:12.77917	340	Canje en restaurante
265	2024-10-22 18:32:46.675866	614	Canje en restaurante
17	2024-07-07 21:55:48.866794	-115	Canje en restaurante
51	2026-02-12 01:16:16.882256	-150	Canje en restaurante
104	2026-03-06 05:51:13.384247	395	Acumulacion por juego
388	2026-02-08 17:52:22.118919	419	Acumulacion por juego
94	2024-05-10 16:59:45.877177	705	Canje en restaurante
239	2024-04-28 23:27:35.992793	605	Acumulacion por juego
197	2023-10-30 22:19:07.376249	670	Canje en restaurante
304	2025-02-21 05:46:54.422988	-50	Canje en restaurante
111	2025-08-29 06:30:51.753023	-99	Acumulacion por juego
375	2025-03-25 10:57:11.034621	-109	Acumulacion por juego
335	2025-07-29 10:59:22.734551	315	Acumulacion por juego
187	2025-05-31 02:03:16.356604	-140	Acumulacion por juego
282	2024-07-01 16:46:59.164825	377	Canje en restaurante
385	2024-02-05 15:56:54.696103	-34	Acumulacion por juego
140	2026-05-18 17:12:32.052142	-129	Acumulacion por juego
130	2025-10-05 06:58:38.845058	22	Canje en restaurante
44	2024-01-28 04:12:45.682991	388	Canje en restaurante
253	2026-07-14 14:08:38.398507	230	Acumulacion por juego
117	2025-03-12 12:50:32.713194	297	Acumulacion por juego
358	2026-02-17 13:34:01.850086	265	Acumulacion por juego
271	2026-06-20 02:39:56.891719	620	Acumulacion por juego
218	2025-02-13 19:04:59.2579	-124	Acumulacion por juego
21	2026-07-02 20:56:48.903805	595	Acumulacion por juego
328	2026-01-25 17:16:23.625432	798	Canje en restaurante
15	2024-11-16 13:04:47.628744	321	Acumulacion por juego
100	2026-02-07 05:27:19.102733	440	Canje en restaurante
143	2025-04-28 14:28:03.660992	779	Acumulacion por juego
368	2026-07-10 21:37:37.10478	26	Canje en restaurante
275	2024-01-01 07:57:08.111406	368	Acumulacion por juego
273	2024-07-27 15:38:35.596026	349	Canje en restaurante
25	2023-11-22 16:40:07.04237	455	Acumulacion por juego
306	2025-01-19 02:19:39.916866	50	Canje en restaurante
263	2024-07-14 20:08:25.572729	446	Acumulacion por juego
8	2026-03-08 23:56:00.472496	243	Acumulacion por juego
70	2024-06-25 11:49:48.168889	662	Canje en restaurante
315	2026-02-15 14:17:15.233865	39	Acumulacion por juego
52	2025-09-04 22:01:59.641806	558	Canje en restaurante
389	2025-05-11 18:37:24.180666	559	Canje en restaurante
109	2024-08-10 19:17:10.42398	67	Acumulacion por juego
255	2025-06-19 00:57:27.9989	689	Canje en restaurante
314	2026-05-08 06:57:53.713469	477	Acumulacion por juego
106	2026-08-18 11:23:05.334752	626	Acumulacion por juego
16	2026-08-08 17:55:05.706953	431	Canje en restaurante
400	2025-10-13 07:44:27.176956	272	Acumulacion por juego
240	2023-10-09 01:45:52.984274	489	Acumulacion por juego
100	2026-01-10 07:06:28.320435	-4	Acumulacion por juego
375	2025-07-02 22:49:34.432598	102	Acumulacion por juego
303	2024-09-26 14:43:36.5724	-80	Acumulacion por juego
62	2025-11-02 00:47:13.461765	411	Acumulacion por juego
41	2026-07-15 14:13:42.185436	448	Canje en restaurante
296	2025-03-08 13:53:35.819589	300	Canje en restaurante
16	2025-12-31 14:32:49.813885	452	Canje en restaurante
117	2025-05-29 01:26:21.046319	171	Canje en restaurante
352	2025-04-29 14:37:56.185669	78	Acumulacion por juego
76	2026-04-02 14:17:58.32037	-81	Acumulacion por juego
213	2025-09-11 00:00:53.761137	257	Acumulacion por juego
179	2025-06-13 14:35:35.669297	579	Acumulacion por juego
65	2024-09-20 12:54:59.379338	380	Acumulacion por juego
266	2026-05-24 09:30:36.659401	672	Acumulacion por juego
258	2025-04-03 23:55:08.222849	434	Canje en restaurante
94	2025-05-26 10:34:41.053407	461	Canje en restaurante
90	2024-02-03 22:28:35.337622	74	Acumulacion por juego
270	2025-12-30 14:08:48.648138	90	Acumulacion por juego
69	2025-12-20 01:55:14.399891	315	Canje en restaurante
368	2025-04-04 14:27:20.61196	593	Canje en restaurante
162	2024-09-30 13:15:35.557638	-172	Acumulacion por juego
133	2024-05-24 06:04:29.178303	-143	Acumulacion por juego
400	2025-06-07 23:02:28.406524	778	Canje en restaurante
77	2023-12-16 12:46:31.317895	-104	Acumulacion por juego
132	2024-03-28 15:28:05.986131	637	Canje en restaurante
199	2024-12-26 15:05:46.213977	578	Acumulacion por juego
156	2025-04-05 21:01:46.739353	605	Canje en restaurante
5	2024-04-02 01:27:57.266717	721	Acumulacion por juego
367	2025-01-18 04:49:31.227268	760	Acumulacion por juego
316	2026-08-01 14:14:11.207763	-175	Acumulacion por juego
226	2025-07-17 09:27:44.743678	143	Canje en restaurante
304	2025-06-17 02:14:27.165003	-131	Canje en restaurante
69	2025-04-15 20:01:09.2785	725	Acumulacion por juego
195	2024-04-23 08:29:36.673374	216	Canje en restaurante
143	2025-01-14 06:00:44.063038	394	Canje en restaurante
233	2024-04-14 06:27:46.049089	669	Canje en restaurante
192	2024-10-24 13:02:04.761032	-196	Canje en restaurante
304	2024-08-18 09:08:34.62161	431	Canje en restaurante
192	2024-10-19 03:18:28.814064	292	Canje en restaurante
255	2025-08-07 09:23:44.815351	377	Acumulacion por juego
163	2025-05-06 06:20:25.85071	261	Acumulacion por juego
34	2025-11-29 19:23:36.517873	18	Canje en restaurante
360	2024-11-29 15:51:35.916683	200	Canje en restaurante
264	2025-01-18 11:58:53.191347	101	Canje en restaurante
348	2026-01-22 12:07:50.181409	4	Canje en restaurante
376	2024-08-15 03:14:12.352525	546	Acumulacion por juego
253	2026-06-21 04:54:36.906861	-76	Canje en restaurante
391	2023-11-17 07:43:45.100282	184	Acumulacion por juego
211	2024-05-28 08:51:37.769369	184	Acumulacion por juego
228	2024-07-02 06:11:20.928405	322	Canje en restaurante
269	2023-10-20 23:45:39.152007	141	Canje en restaurante
145	2023-11-16 03:59:00.383047	447	Acumulacion por juego
236	2024-01-18 04:32:33.624103	-49	Acumulacion por juego
5	2026-06-17 16:32:48.178128	-161	Acumulacion por juego
133	2025-06-21 15:28:15.413089	350	Canje en restaurante
234	2024-02-20 05:30:00.763682	416	Canje en restaurante
50	2025-02-02 14:12:03.99365	-12	Acumulacion por juego
148	2024-10-09 20:16:01.791844	300	Canje en restaurante
113	2024-04-27 08:00:01.695452	-79	Canje en restaurante
267	2026-07-26 15:06:02.462843	736	Acumulacion por juego
138	2026-08-02 12:38:48.22936	441	Acumulacion por juego
291	2025-10-25 02:15:46.137276	37	Canje en restaurante
353	2024-12-04 11:50:16.820851	-78	Canje en restaurante
397	2025-05-06 16:00:20.967157	0	Canje en restaurante
95	2025-04-25 22:37:10.671449	-177	Acumulacion por juego
200	2025-05-24 12:21:01.193328	-113	Canje en restaurante
133	2025-12-27 08:28:56.562287	612	Canje en restaurante
234	2024-03-20 09:15:25.828286	-9	Acumulacion por juego
72	2024-09-13 08:01:04.634802	666	Acumulacion por juego
351	2026-01-30 00:02:42.156376	605	Canje en restaurante
390	2025-08-15 19:06:02.975722	-113	Canje en restaurante
314	2024-03-02 08:32:28.353694	-150	Canje en restaurante
346	2024-01-05 22:24:17.866709	477	Canje en restaurante
394	2025-10-11 16:15:20.165459	708	Acumulacion por juego
94	2025-08-29 02:46:24.86084	793	Acumulacion por juego
233	2026-01-02 05:46:05.337825	98	Acumulacion por juego
107	2025-02-12 23:39:36.075174	193	Canje en restaurante
367	2026-01-14 23:51:23.018763	163	Canje en restaurante
230	2025-09-20 02:57:48.002082	82	Canje en restaurante
94	2024-12-19 18:43:19.925678	580	Acumulacion por juego
54	2025-11-13 02:11:40.60996	732	Acumulacion por juego
308	2024-07-19 16:23:19.416634	-17	Acumulacion por juego
180	2025-04-28 14:33:56.07626	-124	Canje en restaurante
318	2024-05-20 19:55:59.767058	299	Canje en restaurante
68	2025-05-18 11:18:34.527896	563	Acumulacion por juego
325	2026-05-06 12:41:40.697732	422	Acumulacion por juego
102	2025-03-06 07:09:59.350309	312	Acumulacion por juego
255	2026-01-03 02:25:45.802996	702	Acumulacion por juego
225	2024-03-19 06:17:14.041534	197	Canje en restaurante
214	2026-05-21 08:48:04.321079	789	Canje en restaurante
331	2023-11-05 12:45:18.454554	258	Acumulacion por juego
374	2026-03-24 12:38:01.558481	636	Acumulacion por juego
147	2024-02-03 14:55:37.687658	428	Acumulacion por juego
18	2024-05-21 07:50:20.160456	291	Canje en restaurante
384	2024-05-13 17:11:54.509119	-18	Canje en restaurante
340	2026-06-12 11:07:50.019599	627	Canje en restaurante
303	2025-04-25 17:47:49.167972	127	Canje en restaurante
147	2023-11-28 16:31:07.810588	686	Acumulacion por juego
225	2025-12-02 13:49:46.698239	-3	Acumulacion por juego
134	2025-09-18 05:13:03.846291	351	Canje en restaurante
137	2026-09-02 20:03:21.451665	411	Acumulacion por juego
218	2024-04-23 07:50:20.499572	-14	Canje en restaurante
224	2026-01-17 23:41:46.823349	188	Acumulacion por juego
270	2024-11-29 15:23:52.275093	290	Canje en restaurante
180	2026-02-15 07:35:07.99596	653	Acumulacion por juego
59	2024-04-30 13:01:05.062986	-93	Canje en restaurante
171	2026-01-02 22:23:40.011618	746	Canje en restaurante
95	2025-12-22 01:10:30.801385	144	Acumulacion por juego
383	2026-02-14 03:24:21.121606	552	Canje en restaurante
192	2025-04-03 02:55:22.600446	-6	Canje en restaurante
224	2024-01-11 20:56:28.904641	658	Canje en restaurante
241	2024-06-29 05:35:12.755355	710	Canje en restaurante
53	2026-07-20 14:43:07.153918	532	Canje en restaurante
204	2024-03-21 14:33:41.943224	720	Acumulacion por juego
281	2026-03-18 09:39:53.87455	579	Canje en restaurante
2	2024-11-27 14:17:47.783224	573	Canje en restaurante
8	2026-02-08 05:18:13.20013	240	Canje en restaurante
395	2025-06-12 04:34:13.234312	-131	Acumulacion por juego
295	2024-10-01 00:11:35.752386	637	Canje en restaurante
330	2026-03-02 07:30:18.865641	353	Canje en restaurante
225	2024-07-28 16:03:33.027314	366	Canje en restaurante
363	2024-12-23 05:01:55.606796	216	Canje en restaurante
101	2025-11-04 12:48:17.562242	241	Canje en restaurante
159	2026-05-07 00:05:11.061226	-78	Acumulacion por juego
376	2023-12-05 10:26:05.705802	-93	Canje en restaurante
157	2025-08-31 22:01:18.62259	430	Canje en restaurante
195	2025-08-12 17:52:50.036895	178	Acumulacion por juego
313	2026-04-27 23:32:59.170957	288	Canje en restaurante
376	2024-08-01 18:00:43.992533	667	Canje en restaurante
100	2025-06-24 07:33:48.332813	37	Canje en restaurante
102	2024-04-17 14:32:07.368134	771	Acumulacion por juego
281	2024-03-19 18:03:13.87771	62	Acumulacion por juego
75	2023-10-11 00:37:45.08665	-110	Canje en restaurante
360	2026-07-13 04:10:39.186546	352	Canje en restaurante
296	2025-05-15 11:15:09.232162	-68	Canje en restaurante
218	2025-10-03 14:32:23.875262	435	Canje en restaurante
312	2025-11-24 23:17:40.224642	551	Acumulacion por juego
177	2024-11-26 13:42:54.791846	700	Acumulacion por juego
195	2023-10-14 14:58:50.729513	399	Acumulacion por juego
199	2025-06-01 15:59:46.479656	322	Acumulacion por juego
85	2025-10-05 13:07:54.766307	568	Canje en restaurante
232	2024-11-16 11:57:17.680838	-75	Acumulacion por juego
215	2024-04-07 09:47:25.392113	472	Canje en restaurante
28	2024-06-01 15:19:52.102738	351	Acumulacion por juego
382	2024-10-09 06:28:13.961017	154	Acumulacion por juego
381	2025-09-28 08:17:03.038164	280	Canje en restaurante
299	2026-08-26 15:27:19.196548	237	Acumulacion por juego
28	2026-04-07 23:29:19.095733	579	Canje en restaurante
111	2023-11-11 00:53:13.626996	-26	Acumulacion por juego
93	2025-09-15 00:01:33.217709	260	Canje en restaurante
115	2024-01-08 09:33:05.755517	560	Acumulacion por juego
2	2026-04-09 17:39:31.453529	329	Acumulacion por juego
87	2023-12-29 00:15:21.696626	201	Canje en restaurante
95	2026-07-16 06:37:05.407902	381	Acumulacion por juego
290	2024-05-13 06:49:02.640654	-81	Canje en restaurante
39	2025-12-10 10:59:00.058053	-5	Canje en restaurante
267	2026-05-27 12:26:55.780375	140	Canje en restaurante
95	2026-02-24 16:57:54.047648	679	Acumulacion por juego
5	2025-09-24 22:52:24.170786	491	Canje en restaurante
131	2024-02-24 04:45:03.638693	732	Canje en restaurante
23	2024-11-12 01:59:21.347731	601	Acumulacion por juego
319	2026-01-05 17:35:57.342382	415	Acumulacion por juego
88	2025-09-14 02:22:04.705547	609	Canje en restaurante
304	2025-08-13 14:18:12.33611	526	Canje en restaurante
46	2026-08-10 19:37:46.594216	703	Canje en restaurante
191	2026-09-09 04:40:33.905831	656	Canje en restaurante
11	2026-08-01 06:49:27.76336	-37	Canje en restaurante
137	2026-08-30 18:56:16.448173	743	Acumulacion por juego
254	2023-12-26 06:05:51.584484	787	Canje en restaurante
254	2023-11-14 06:31:20.281715	150	Canje en restaurante
395	2026-08-05 06:42:07.722294	10	Acumulacion por juego
101	2026-05-01 06:59:54.118496	491	Acumulacion por juego
345	2024-08-29 18:21:06.147092	56	Acumulacion por juego
16	2025-08-26 09:27:10.484551	316	Canje en restaurante
41	2025-12-17 22:43:37.53048	117	Canje en restaurante
145	2023-12-28 08:43:51.399682	37	Acumulacion por juego
309	2024-06-28 15:00:15.42257	596	Acumulacion por juego
343	2025-03-16 22:05:56.156155	45	Acumulacion por juego
290	2026-09-02 22:49:53.648795	223	Acumulacion por juego
65	2026-06-04 15:43:49.295487	493	Acumulacion por juego
177	2026-07-25 08:18:42.798664	732	Acumulacion por juego
296	2025-01-28 12:48:18.905595	-120	Acumulacion por juego
193	2025-05-24 17:51:53.892549	457	Acumulacion por juego
19	2023-11-13 20:04:35.481347	589	Acumulacion por juego
351	2025-01-29 23:12:00.352323	626	Canje en restaurante
116	2024-04-05 06:05:43.680438	-126	Acumulacion por juego
111	2025-07-29 01:06:36.303259	495	Canje en restaurante
235	2025-10-29 07:15:17.002379	379	Canje en restaurante
12	2026-07-27 13:42:08.909172	209	Canje en restaurante
112	2024-08-01 02:35:04.683097	-149	Canje en restaurante
167	2024-11-24 03:59:50.141755	-181	Canje en restaurante
196	2024-08-09 02:32:56.930557	-31	Acumulacion por juego
7	2025-04-14 13:46:48.115662	218	Acumulacion por juego
359	2025-04-03 13:19:48.013061	678	Acumulacion por juego
191	2025-02-01 00:05:53.857074	-146	Acumulacion por juego
299	2024-02-03 21:35:39.391179	496	Acumulacion por juego
28	2024-03-09 02:06:43.143855	-32	Acumulacion por juego
183	2025-12-27 12:38:39.000632	722	Acumulacion por juego
14	2025-08-14 05:37:10.271884	94	Canje en restaurante
120	2026-07-21 19:17:07.694969	608	Acumulacion por juego
37	2024-08-19 09:04:41.657739	198	Acumulacion por juego
356	2025-11-06 21:30:53.811407	436	Acumulacion por juego
136	2023-12-22 22:41:03.453526	620	Acumulacion por juego
49	2025-07-28 01:19:07.544202	216	Acumulacion por juego
167	2026-01-11 09:28:29.263437	394	Canje en restaurante
18	2024-09-20 02:23:25.083957	-151	Acumulacion por juego
136	2024-06-14 12:44:34.932411	328	Canje en restaurante
206	2026-01-27 17:02:43.894917	499	Acumulacion por juego
96	2025-01-07 12:17:11.986337	633	Acumulacion por juego
112	2025-07-26 21:48:50.428657	-151	Acumulacion por juego
179	2024-03-10 18:03:02.482937	36	Acumulacion por juego
170	2025-03-03 01:31:19.276549	190	Canje en restaurante
40	2026-02-27 08:59:23.533931	658	Canje en restaurante
150	2026-06-01 22:43:13.46631	754	Canje en restaurante
55	2024-11-02 13:38:07.626697	725	Acumulacion por juego
77	2025-10-18 16:28:49.114096	-61	Acumulacion por juego
252	2025-11-16 07:52:37.305135	767	Canje en restaurante
124	2026-01-04 02:47:36.567359	642	Canje en restaurante
198	2025-03-07 19:35:33.167261	81	Acumulacion por juego
308	2025-12-06 20:26:24.476631	735	Canje en restaurante
250	2025-02-28 09:34:48.295616	693	Acumulacion por juego
240	2024-10-10 02:31:43.767371	306	Acumulacion por juego
148	2023-10-16 08:44:39.523929	699	Canje en restaurante
291	2025-01-17 20:50:13.914972	675	Canje en restaurante
7	2023-10-02 07:02:17.973711	449	Canje en restaurante
205	2023-10-26 11:45:19.308917	101	Acumulacion por juego
292	2026-07-30 02:54:53.290993	541	Canje en restaurante
370	2024-08-08 13:57:17.498669	71	Acumulacion por juego
278	2023-12-27 12:03:04.342594	-143	Canje en restaurante
131	2025-01-25 08:13:21.33473	405	Canje en restaurante
240	2026-03-08 16:33:54.676501	245	Canje en restaurante
40	2024-06-13 12:48:57.830144	-51	Canje en restaurante
103	2025-02-09 12:52:33.825375	730	Canje en restaurante
4	2026-03-14 05:53:56.692317	19	Canje en restaurante
313	2025-03-29 21:18:08.171459	148	Acumulacion por juego
378	2024-12-18 08:06:08.680593	515	Acumulacion por juego
72	2025-03-01 15:31:26.346397	3	Acumulacion por juego
35	2024-02-11 08:13:51.999969	323	Canje en restaurante
231	2024-06-04 07:30:20.756736	74	Canje en restaurante
136	2026-08-22 19:29:15.329633	293	Canje en restaurante
379	2025-05-30 15:14:33.114854	621	Acumulacion por juego
256	2024-02-10 05:41:46.63227	240	Acumulacion por juego
167	2024-06-11 22:37:00.037607	376	Acumulacion por juego
201	2026-01-14 18:13:35.777477	229	Canje en restaurante
153	2023-12-14 19:50:00.94895	156	Acumulacion por juego
191	2024-10-22 11:06:15.222737	-30	Canje en restaurante
365	2024-11-11 04:56:36.855487	135	Acumulacion por juego
168	2025-03-24 16:01:31.098972	-160	Acumulacion por juego
217	2023-09-23 04:55:49.019119	453	Canje en restaurante
368	2025-06-27 00:37:40.438726	380	Canje en restaurante
11	2023-11-12 07:07:49.955684	199	Acumulacion por juego
309	2024-05-05 00:01:02.102757	267	Canje en restaurante
3	2024-12-21 12:41:58.406379	669	Acumulacion por juego
\.


--
-- Data for Name: reservas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservas (id_reserva, fecha_hora_reserva, tipo_reserva, estado, id_usuario) FROM stdin;
1	2024-04-10 13:11:30.449489	Hotel	Pendiente	155
2	2025-02-17 06:48:28.126814	Hotel	Pendiente	53
3	2024-07-17 12:27:31.152361	Hotel	Pendiente	321
4	2026-07-11 13:40:09.672414	Hotel	Pendiente	330
5	2024-01-11 01:58:56.992467	Hotel	Confirmada	174
6	2024-07-17 00:51:14.250268	Hotel	Cancelada	365
7	2025-04-08 03:54:34.284041	Show	Pendiente	321
8	2026-03-26 09:53:07.282745	Show	Confirmada	246
9	2024-02-19 21:18:09.182946	Hotel	Confirmada	359
10	2026-02-03 08:41:12.98575	Restaurante	Pendiente	148
11	2023-10-18 20:05:40.749977	Hotel	Pendiente	384
12	2023-10-02 15:51:11.733661	Restaurante	Pendiente	309
13	2024-11-25 01:59:45.860843	Hotel	Pendiente	321
14	2023-10-06 09:43:17.173865	Show	Cancelada	109
15	2026-05-18 01:19:12.75273	Hotel	Confirmada	331
16	2024-10-21 18:22:13.926611	Restaurante	Pendiente	369
17	2024-12-25 22:35:20.056823	Hotel	Pendiente	381
18	2024-02-29 22:43:43.317071	Hotel	Confirmada	32
19	2025-10-22 00:19:55.216853	Hotel	Pendiente	296
20	2025-01-01 07:01:38.824903	Hotel	Pendiente	112
21	2024-04-05 11:39:07.791619	Restaurante	Pendiente	214
22	2025-11-02 15:33:04.347656	Show	Cancelada	25
23	2026-03-30 01:31:16.743849	Show	Pendiente	87
24	2024-04-05 00:01:45.490791	Restaurante	Confirmada	369
25	2024-04-08 00:15:57.063775	Restaurante	Cancelada	306
26	2024-08-09 15:16:01.961541	Restaurante	Cancelada	181
27	2026-08-30 20:39:46.286428	Show	Confirmada	50
28	2024-11-25 17:38:48.608813	Hotel	Cancelada	248
29	2024-11-13 04:21:03.977712	Show	Confirmada	23
30	2024-03-12 11:35:09.931694	Show	Pendiente	107
31	2024-09-17 14:35:36.711289	Hotel	Pendiente	60
32	2026-07-01 21:35:02.707272	Hotel	Confirmada	226
33	2024-12-30 14:03:43.813738	Hotel	Confirmada	391
34	2026-01-21 06:24:24.681896	Hotel	Confirmada	331
35	2024-06-15 13:36:00.91307	Hotel	Cancelada	45
36	2026-03-29 14:06:04.77534	Hotel	Confirmada	182
37	2024-02-07 12:04:49.008727	Hotel	Cancelada	52
38	2024-12-07 16:56:41.76354	Hotel	Pendiente	352
39	2025-02-02 12:30:28.491891	Hotel	Pendiente	235
40	2024-09-24 00:39:50.975039	Hotel	Confirmada	293
41	2025-10-16 20:51:33.666424	Hotel	Confirmada	88
42	2025-07-26 07:46:07.238517	Hotel	Cancelada	400
43	2025-06-06 20:23:07.746684	Show	Confirmada	206
44	2026-01-13 18:47:09.696145	Hotel	Cancelada	100
45	2026-01-24 08:10:39.456457	Hotel	Cancelada	96
46	2025-11-13 22:07:50.861337	Hotel	Cancelada	142
47	2026-09-19 04:28:22.866285	Hotel	Pendiente	152
48	2025-01-09 19:40:12.317264	Hotel	Confirmada	36
49	2026-07-01 09:48:57.719731	Restaurante	Cancelada	151
50	2025-04-11 00:23:18.825457	Hotel	Pendiente	168
51	2025-10-10 00:02:39.618271	Hotel	Cancelada	20
52	2023-10-25 15:08:17.361193	Hotel	Cancelada	210
53	2025-01-16 16:19:35.20742	Hotel	Pendiente	163
54	2026-07-22 08:37:16.647069	Hotel	Pendiente	28
55	2025-07-15 23:13:16.566357	Hotel	Pendiente	24
56	2024-08-01 01:03:12.750852	Hotel	Cancelada	209
57	2026-04-26 02:59:23.812489	Show	Pendiente	256
58	2026-08-07 12:13:57.361729	Show	Pendiente	94
59	2025-07-10 10:10:21.456038	Show	Pendiente	228
60	2026-07-18 01:32:04.013832	Hotel	Pendiente	40
61	2025-09-26 14:51:01.809311	Hotel	Pendiente	86
62	2026-02-01 10:05:51.768686	Show	Confirmada	393
63	2024-12-19 05:47:05.256816	Hotel	Cancelada	38
64	2024-02-03 10:44:10.894384	Hotel	Pendiente	256
65	2024-04-15 05:11:44.620031	Restaurante	Cancelada	54
66	2024-06-06 14:25:17.981415	Hotel	Confirmada	59
67	2026-01-30 19:32:46.11043	Hotel	Confirmada	394
68	2023-11-15 21:17:17.68379	Show	Pendiente	316
69	2024-06-15 15:39:36.979603	Show	Confirmada	243
70	2025-11-21 09:48:34.734079	Show	Pendiente	162
71	2023-10-13 17:04:10.237623	Show	Pendiente	258
72	2024-12-15 15:15:56.568324	Show	Pendiente	163
73	2025-05-02 20:09:43.328752	Hotel	Cancelada	309
74	2025-01-25 21:19:53.612207	Hotel	Confirmada	294
75	2025-07-26 03:50:47.467132	Restaurante	Cancelada	98
76	2026-03-10 20:59:05.735988	Hotel	Cancelada	271
77	2024-09-16 23:35:30.333849	Hotel	Cancelada	42
78	2024-03-31 20:09:40.034435	Hotel	Cancelada	368
79	2024-02-02 01:22:09.918666	Hotel	Pendiente	127
80	2024-03-12 21:32:13.060443	Show	Cancelada	93
81	2024-07-16 21:25:57.596438	Show	Confirmada	55
82	2026-01-30 10:00:30.909887	Hotel	Confirmada	338
83	2025-10-04 18:26:15.001214	Hotel	Pendiente	207
84	2026-03-13 08:41:19.247133	Restaurante	Pendiente	89
85	2024-12-19 20:47:27.318411	Restaurante	Pendiente	227
86	2024-11-12 12:20:39.59176	Hotel	Cancelada	80
87	2026-07-12 08:13:14.616528	Hotel	Pendiente	112
88	2026-01-07 19:33:06.368531	Hotel	Pendiente	248
89	2025-08-13 23:14:57.40675	Hotel	Cancelada	243
90	2024-09-02 20:30:03.676167	Hotel	Cancelada	358
91	2024-01-12 20:41:11.40768	Hotel	Pendiente	159
92	2024-07-20 03:43:35.802379	Hotel	Pendiente	147
93	2026-03-31 04:41:28.648324	Hotel	Pendiente	316
94	2025-04-29 05:52:42.005274	Restaurante	Confirmada	269
95	2024-11-21 02:45:56.699904	Hotel	Cancelada	181
96	2024-11-30 17:03:43.02021	Hotel	Pendiente	393
97	2024-03-14 16:17:33.197142	Show	Pendiente	277
98	2025-12-26 03:23:03.372235	Show	Confirmada	235
99	2025-01-21 12:49:12.762718	Restaurante	Pendiente	159
100	2024-08-29 14:51:53.301405	Hotel	Pendiente	48
101	2025-10-27 03:35:53.971797	Hotel	Cancelada	375
102	2025-06-08 10:47:40.362348	Hotel	Cancelada	302
103	2026-03-28 23:46:55.733555	Restaurante	Cancelada	212
104	2026-07-28 18:13:15.576491	Hotel	Cancelada	281
105	2025-10-28 06:54:56.582737	Hotel	Confirmada	178
106	2026-03-29 12:27:39.362763	Restaurante	Cancelada	4
107	2025-12-29 10:06:27.789529	Hotel	Cancelada	112
108	2024-09-27 19:54:51.189246	Hotel	Pendiente	276
109	2025-04-08 07:16:17.552749	Show	Cancelada	262
110	2025-07-10 04:55:59.251871	Restaurante	Pendiente	100
111	2024-07-10 20:58:20.751501	Hotel	Pendiente	31
112	2026-05-16 18:22:39.231456	Hotel	Cancelada	328
113	2025-05-25 21:40:14.808056	Show	Pendiente	366
114	2026-07-02 23:07:49.745603	Show	Pendiente	180
115	2026-01-27 19:07:27.974244	Hotel	Pendiente	233
116	2025-06-07 03:49:33.276727	Restaurante	Cancelada	172
117	2025-01-18 08:18:38.491384	Hotel	Cancelada	3
467	2025-11-09 02:12:14.856657	Hotel	Pendiente	119
118	2023-09-25 20:26:32.183283	Restaurante	Pendiente	58
119	2024-04-09 10:11:43.498279	Hotel	Cancelada	400
120	2024-02-11 04:29:51.943734	Show	Cancelada	343
121	2023-10-06 21:35:30.636122	Restaurante	Pendiente	378
122	2026-06-24 15:41:03.879305	Restaurante	Cancelada	97
123	2025-06-19 14:48:23.656368	Restaurante	Cancelada	153
124	2025-11-17 14:44:44.099012	Show	Cancelada	243
125	2025-12-02 23:10:07.276903	Show	Cancelada	235
126	2025-12-15 18:48:16.060582	Hotel	Confirmada	314
127	2024-03-23 00:07:28.560202	Hotel	Confirmada	219
128	2023-12-28 15:38:55.402419	Show	Pendiente	228
129	2024-03-22 11:24:00.693108	Restaurante	Confirmada	188
130	2026-07-18 18:48:30.444383	Hotel	Pendiente	40
131	2025-04-27 10:25:05.754375	Show	Confirmada	384
132	2026-03-01 03:32:15.314852	Restaurante	Pendiente	318
133	2024-04-19 20:05:44.308141	Hotel	Pendiente	250
134	2025-05-12 22:17:04.080463	Hotel	Pendiente	80
135	2025-05-12 17:50:21.551512	Restaurante	Pendiente	73
136	2024-04-21 11:32:17.791455	Hotel	Pendiente	8
137	2026-08-26 16:10:52.742045	Hotel	Confirmada	26
138	2026-09-13 17:25:02.718537	Hotel	Pendiente	163
139	2026-05-21 14:29:52.723007	Hotel	Cancelada	199
140	2026-01-28 19:24:22.962988	Hotel	Confirmada	198
141	2025-08-05 01:04:05.917154	Hotel	Pendiente	79
142	2025-01-01 17:06:28.204268	Show	Pendiente	226
143	2026-07-20 17:02:41.528164	Show	Pendiente	247
144	2024-06-24 15:29:40.209244	Show	Cancelada	3
145	2025-01-24 06:30:04.013081	Show	Pendiente	211
146	2026-02-03 14:47:37.065381	Hotel	Pendiente	252
147	2025-03-12 03:45:04.436838	Restaurante	Confirmada	281
148	2023-10-31 18:19:41.246679	Show	Pendiente	139
149	2024-10-19 08:40:49.427389	Hotel	Cancelada	303
150	2026-01-18 17:34:52.324274	Show	Confirmada	40
151	2023-10-07 10:01:33.756181	Show	Confirmada	163
152	2025-02-08 01:16:59.461572	Hotel	Confirmada	372
153	2024-03-12 18:12:57.873108	Restaurante	Pendiente	48
154	2026-06-12 13:45:54.192306	Hotel	Pendiente	293
155	2026-06-04 09:57:56.043351	Hotel	Cancelada	141
156	2026-04-10 02:00:57.606598	Hotel	Pendiente	374
157	2026-01-07 17:00:55.234636	Hotel	Pendiente	178
158	2025-11-29 07:19:30.753777	Hotel	Confirmada	361
159	2025-09-06 05:32:40.424607	Hotel	Pendiente	27
160	2023-12-11 10:32:27.034715	Hotel	Pendiente	160
161	2026-09-04 12:39:54.083448	Hotel	Cancelada	198
162	2023-10-10 01:09:09.00917	Show	Pendiente	299
163	2024-05-05 06:03:34.785269	Hotel	Pendiente	5
164	2024-06-08 16:04:53.559156	Hotel	Pendiente	343
165	2025-05-01 23:04:18.465778	Hotel	Pendiente	179
166	2024-02-19 06:46:08.846848	Show	Pendiente	8
167	2024-06-22 01:33:26.809659	Show	Cancelada	29
168	2024-01-29 11:00:48.980554	Hotel	Confirmada	103
169	2025-09-24 19:27:19.841375	Hotel	Pendiente	83
170	2025-08-15 03:49:11.736058	Hotel	Cancelada	191
171	2026-08-13 13:51:13.855134	Hotel	Pendiente	127
172	2025-03-24 03:12:29.946924	Restaurante	Cancelada	366
173	2026-01-23 00:15:38.128282	Restaurante	Confirmada	275
174	2025-07-15 12:17:36.099314	Show	Confirmada	231
175	2026-03-21 05:16:24.253122	Restaurante	Cancelada	304
176	2026-09-19 04:38:42.975917	Hotel	Pendiente	36
177	2025-03-20 05:12:00.024612	Restaurante	Confirmada	158
178	2024-07-08 02:11:54.186307	Restaurante	Cancelada	138
179	2025-05-22 21:45:56.875365	Hotel	Confirmada	393
180	2023-12-21 05:21:05.998173	Hotel	Cancelada	21
181	2023-10-24 10:44:31.400827	Restaurante	Cancelada	316
182	2025-03-13 23:06:21.663933	Restaurante	Pendiente	114
183	2025-12-30 06:24:17.95136	Hotel	Pendiente	197
184	2025-04-07 00:41:23.557483	Restaurante	Cancelada	325
185	2023-10-30 12:28:58.406875	Show	Cancelada	291
186	2026-06-27 00:28:01.792571	Hotel	Confirmada	100
187	2025-12-11 06:34:37.986169	Hotel	Pendiente	157
188	2026-02-11 13:12:50.213537	Hotel	Pendiente	269
189	2024-03-06 00:08:08.292138	Show	Cancelada	348
190	2023-10-21 06:22:05.210607	Hotel	Cancelada	290
191	2026-04-22 21:10:57.461674	Restaurante	Pendiente	386
192	2025-11-26 06:27:35.602861	Hotel	Confirmada	49
193	2024-07-01 15:18:52.139781	Restaurante	Pendiente	266
194	2026-07-06 03:07:09.243045	Restaurante	Pendiente	392
195	2025-11-04 21:41:01.087692	Restaurante	Confirmada	376
196	2026-06-19 04:10:38.900607	Hotel	Confirmada	341
197	2024-05-05 10:09:35.308446	Restaurante	Confirmada	292
198	2023-12-29 23:58:57.052961	Show	Confirmada	398
199	2026-01-26 03:58:21.332959	Hotel	Pendiente	98
200	2026-04-27 17:19:32.31393	Hotel	Pendiente	244
201	2026-09-04 09:32:11.32053	Show	Confirmada	212
202	2025-02-13 10:31:42.45674	Show	Pendiente	370
203	2026-01-30 23:02:20.491508	Show	Pendiente	5
204	2023-11-24 15:37:49.860537	Hotel	Pendiente	222
205	2025-05-02 22:41:16.915381	Hotel	Confirmada	226
206	2025-09-25 11:51:26.814588	Restaurante	Pendiente	274
207	2026-07-19 17:55:08.210939	Hotel	Pendiente	288
208	2024-02-09 05:18:47.444506	Show	Confirmada	127
209	2024-06-08 07:48:15.645574	Hotel	Confirmada	167
210	2026-01-23 11:00:20.043764	Restaurante	Cancelada	86
211	2024-08-24 13:59:40.882603	Show	Cancelada	395
212	2025-01-31 08:21:42.419781	Show	Pendiente	236
213	2025-04-02 12:02:51.751507	Show	Pendiente	265
214	2024-12-14 19:23:11.450511	Hotel	Confirmada	399
215	2025-06-30 03:09:40.203679	Show	Confirmada	358
216	2024-03-26 07:44:33.23327	Hotel	Confirmada	310
217	2024-02-29 05:45:52.508822	Restaurante	Pendiente	374
218	2026-02-07 19:03:49.171358	Restaurante	Cancelada	369
219	2024-06-24 10:25:55.091862	Restaurante	Confirmada	34
220	2025-11-20 07:53:50.883658	Hotel	Confirmada	382
221	2024-12-02 11:05:13.325821	Restaurante	Cancelada	349
222	2025-03-22 13:06:44.711503	Restaurante	Cancelada	306
223	2025-08-11 21:22:34.526811	Restaurante	Confirmada	40
224	2024-07-26 11:19:48.004707	Hotel	Pendiente	138
225	2025-04-12 18:16:01.96506	Restaurante	Cancelada	83
226	2026-05-10 21:43:16.778473	Restaurante	Pendiente	98
227	2025-01-19 05:04:23.737305	Restaurante	Pendiente	135
228	2025-03-09 01:26:57.648869	Hotel	Pendiente	255
229	2025-11-04 06:50:34.262037	Hotel	Pendiente	139
230	2024-05-05 01:15:07.080857	Hotel	Pendiente	138
231	2024-12-09 03:34:33.614849	Show	Pendiente	206
232	2026-06-24 11:33:15.850819	Hotel	Confirmada	269
233	2024-07-24 11:41:22.314651	Restaurante	Pendiente	49
234	2024-03-10 16:20:16.593643	Restaurante	Confirmada	359
235	2024-09-13 15:34:24.783617	Show	Pendiente	211
236	2025-12-19 02:05:10.958452	Restaurante	Pendiente	210
237	2023-11-08 11:26:07.968293	Hotel	Pendiente	366
238	2024-01-04 17:57:57.963164	Restaurante	Pendiente	51
239	2026-03-13 23:38:52.84564	Hotel	Cancelada	252
240	2024-08-09 02:15:20.178702	Hotel	Confirmada	246
241	2026-06-20 19:52:06.332191	Hotel	Confirmada	390
242	2024-10-26 18:23:15.345733	Hotel	Cancelada	74
243	2024-01-16 21:55:16.519827	Hotel	Pendiente	305
244	2025-11-14 01:05:28.338462	Restaurante	Pendiente	335
245	2024-01-12 07:19:38.569913	Hotel	Pendiente	317
246	2026-07-26 22:04:25.077672	Hotel	Confirmada	224
247	2024-01-13 16:23:24.62569	Hotel	Cancelada	179
248	2023-10-28 12:32:37.825056	Hotel	Cancelada	400
249	2025-12-27 16:24:00.363128	Hotel	Cancelada	388
250	2025-02-25 23:09:23.229643	Hotel	Pendiente	4
251	2024-08-15 19:28:12.225135	Hotel	Pendiente	31
252	2026-09-08 01:03:47.463231	Show	Confirmada	145
253	2024-05-18 18:18:03.152894	Hotel	Cancelada	265
254	2026-05-21 20:17:58.090645	Hotel	Pendiente	73
255	2026-04-03 21:08:04.611	Restaurante	Pendiente	154
256	2024-05-31 10:51:52.106063	Restaurante	Cancelada	26
257	2024-09-19 03:26:04.133368	Show	Cancelada	9
258	2023-09-27 03:46:49.308776	Restaurante	Cancelada	194
259	2024-02-07 20:51:15.543708	Hotel	Cancelada	148
260	2025-05-09 16:24:50.04253	Restaurante	Pendiente	310
261	2024-03-26 09:53:44.728175	Restaurante	Confirmada	164
262	2023-09-28 18:29:38.313513	Show	Confirmada	238
263	2025-12-28 20:20:43.361376	Hotel	Confirmada	301
264	2026-05-30 09:22:44.016556	Restaurante	Pendiente	154
265	2026-03-21 09:53:23.646421	Show	Confirmada	12
266	2026-04-03 09:51:50.517972	Hotel	Confirmada	69
267	2026-09-11 20:34:58.504345	Show	Pendiente	364
268	2025-09-27 07:27:51.514124	Show	Pendiente	371
269	2024-06-10 01:17:18.774009	Hotel	Pendiente	19
270	2024-08-23 23:30:25.704023	Hotel	Pendiente	81
271	2026-01-01 21:05:00.352429	Restaurante	Cancelada	107
272	2025-07-31 06:23:32.686671	Hotel	Pendiente	194
273	2023-10-16 15:50:47.574202	Show	Cancelada	350
274	2025-03-03 13:16:33.188825	Hotel	Pendiente	369
275	2025-11-13 22:40:55.37491	Hotel	Confirmada	149
276	2024-09-22 20:56:49.152109	Hotel	Cancelada	138
277	2025-03-31 17:41:33.375479	Hotel	Cancelada	322
278	2024-11-25 04:47:14.047028	Restaurante	Cancelada	296
279	2025-09-25 23:26:59.509323	Restaurante	Confirmada	41
280	2024-11-04 07:13:39.31085	Restaurante	Pendiente	313
281	2026-07-04 05:00:56.535793	Hotel	Confirmada	323
282	2025-08-31 01:22:10.320536	Show	Confirmada	263
283	2026-08-17 23:00:09.908403	Show	Confirmada	146
284	2025-11-05 09:54:19.874711	Show	Cancelada	242
285	2024-11-05 07:11:14.467171	Hotel	Pendiente	324
286	2023-10-29 05:45:39.384371	Hotel	Cancelada	394
287	2026-03-27 21:49:15.505124	Restaurante	Cancelada	155
288	2026-02-21 18:11:22.536557	Show	Pendiente	217
289	2024-11-14 21:12:25.148845	Hotel	Pendiente	336
290	2025-06-04 16:43:10.284528	Show	Pendiente	375
291	2025-09-03 04:36:16.065739	Hotel	Confirmada	212
292	2024-11-09 02:28:47.401043	Hotel	Pendiente	272
293	2025-08-26 20:51:56.396603	Hotel	Confirmada	47
294	2025-02-20 16:23:43.087565	Hotel	Pendiente	269
295	2023-11-23 22:52:44.753417	Hotel	Cancelada	8
296	2026-08-14 05:13:38.70316	Hotel	Pendiente	5
297	2026-09-16 05:42:36.444123	Restaurante	Cancelada	384
298	2025-09-21 20:22:39.30326	Restaurante	Cancelada	253
299	2025-11-14 06:04:56.578486	Hotel	Confirmada	246
300	2024-01-27 19:27:48.357516	Hotel	Cancelada	112
301	2025-08-19 00:29:51.193586	Restaurante	Confirmada	175
302	2024-01-23 14:42:11.608479	Hotel	Pendiente	201
303	2025-08-21 10:16:47.671633	Show	Pendiente	11
304	2024-10-05 01:06:04.24949	Hotel	Cancelada	149
305	2023-11-25 04:54:31.124789	Hotel	Cancelada	326
306	2026-06-30 07:34:30.894326	Restaurante	Pendiente	251
307	2025-12-09 14:18:27.503785	Restaurante	Pendiente	321
308	2024-03-29 06:38:24.732575	Hotel	Pendiente	31
309	2024-04-10 05:40:33.970338	Restaurante	Pendiente	45
310	2026-04-02 10:53:07.147891	Restaurante	Pendiente	299
311	2025-02-05 03:34:31.802999	Hotel	Confirmada	192
312	2024-08-18 14:58:50.85361	Show	Cancelada	133
313	2025-08-13 10:42:27.500213	Restaurante	Pendiente	29
314	2024-12-23 03:37:01.969631	Hotel	Pendiente	263
315	2024-02-08 15:34:07.356837	Hotel	Pendiente	16
316	2023-12-18 01:47:11.10767	Restaurante	Confirmada	304
317	2025-05-03 11:00:37.901153	Restaurante	Pendiente	131
318	2024-09-11 19:35:41.590625	Restaurante	Cancelada	166
319	2025-01-08 01:47:02.645231	Hotel	Pendiente	288
320	2026-04-16 18:01:45.043948	Show	Cancelada	242
321	2025-07-29 00:56:55.367286	Show	Confirmada	244
322	2025-11-26 19:25:57.304028	Hotel	Confirmada	179
323	2026-09-18 11:29:08.847434	Hotel	Pendiente	275
324	2024-12-17 07:00:15.992876	Restaurante	Cancelada	165
325	2024-12-12 09:50:03.600535	Hotel	Pendiente	383
326	2024-02-26 22:26:28.604371	Hotel	Pendiente	188
327	2024-11-09 00:02:41.034593	Restaurante	Pendiente	4
328	2026-09-13 03:33:16.730737	Show	Pendiente	235
329	2025-05-17 01:24:12.922175	Show	Pendiente	84
330	2023-09-26 15:42:56.227337	Hotel	Confirmada	168
331	2026-08-01 05:26:24.218675	Hotel	Pendiente	348
332	2025-10-06 09:21:25.764738	Show	Confirmada	271
333	2025-11-12 16:47:31.689948	Show	Cancelada	321
334	2024-09-06 15:06:30.290291	Hotel	Confirmada	254
335	2024-12-24 14:36:24.992243	Show	Confirmada	270
336	2024-11-14 19:31:04.997061	Hotel	Cancelada	15
337	2025-11-08 14:13:57.489207	Hotel	Pendiente	347
338	2026-09-06 05:25:51.522842	Restaurante	Confirmada	188
339	2025-03-06 00:19:16.816681	Show	Cancelada	230
340	2026-02-14 22:21:41.829652	Hotel	Confirmada	13
341	2024-08-07 01:18:55.949308	Restaurante	Pendiente	364
342	2025-09-08 07:58:04.831095	Hotel	Pendiente	358
343	2026-01-25 18:07:02.101142	Restaurante	Cancelada	153
344	2025-10-04 07:23:45.305853	Restaurante	Pendiente	239
345	2025-04-03 10:46:26.468281	Show	Confirmada	35
346	2024-10-03 18:14:23.160136	Restaurante	Cancelada	378
347	2025-11-29 01:47:28.953462	Restaurante	Confirmada	297
348	2024-09-09 13:09:18.544605	Show	Pendiente	157
349	2025-01-04 18:49:12.67942	Hotel	Confirmada	235
350	2025-07-30 19:02:45.212235	Restaurante	Pendiente	287
351	2024-05-10 04:17:08.31256	Hotel	Confirmada	128
352	2023-09-21 15:33:32.556877	Hotel	Confirmada	169
353	2025-04-18 05:45:07.281422	Hotel	Pendiente	394
354	2024-04-12 05:13:58.830505	Hotel	Confirmada	271
355	2025-10-12 08:57:54.374219	Show	Confirmada	37
356	2024-10-11 07:16:37.667422	Show	Pendiente	280
357	2025-07-21 20:42:54.256222	Hotel	Pendiente	197
358	2024-08-01 18:17:10.598107	Hotel	Cancelada	278
359	2024-02-03 10:38:56.51607	Hotel	Confirmada	205
360	2025-07-30 20:29:47.076152	Show	Cancelada	189
361	2025-07-14 20:16:42.103182	Restaurante	Pendiente	291
362	2023-11-27 00:39:38.697022	Hotel	Pendiente	259
363	2024-02-11 22:24:50.740597	Restaurante	Pendiente	389
364	2026-01-18 00:28:13.303752	Show	Confirmada	285
365	2025-09-15 13:29:31.111584	Hotel	Pendiente	336
366	2026-06-01 06:26:18.073701	Restaurante	Pendiente	9
367	2025-12-21 23:56:55.818651	Hotel	Pendiente	83
368	2025-08-17 21:55:35.253628	Show	Confirmada	293
369	2025-09-02 05:14:20.68326	Show	Confirmada	234
370	2024-10-11 15:31:56.480091	Hotel	Confirmada	97
371	2024-10-21 08:18:14.187922	Show	Cancelada	186
372	2025-09-26 18:29:14.810158	Restaurante	Pendiente	385
373	2026-01-21 04:34:10.603405	Hotel	Confirmada	357
374	2025-04-25 05:58:52.648327	Hotel	Confirmada	148
375	2026-06-28 12:40:00.886775	Restaurante	Pendiente	128
376	2026-03-18 00:01:08.97075	Hotel	Confirmada	26
377	2024-06-30 16:26:48.969381	Hotel	Cancelada	17
378	2023-11-13 19:36:58.55615	Hotel	Cancelada	162
379	2023-11-03 05:38:52.088331	Restaurante	Pendiente	197
380	2026-01-20 09:28:28.859904	Hotel	Pendiente	148
381	2024-03-13 23:44:47.99901	Hotel	Confirmada	84
382	2024-01-03 16:05:46.282236	Hotel	Cancelada	391
383	2024-04-26 20:34:36.315283	Show	Cancelada	203
384	2026-03-30 16:46:13.093616	Hotel	Cancelada	49
385	2023-10-24 04:44:40.980666	Hotel	Cancelada	383
386	2024-06-05 03:35:52.420181	Restaurante	Cancelada	80
387	2024-07-27 19:59:28.174004	Hotel	Cancelada	97
388	2025-05-20 21:25:13.320849	Hotel	Pendiente	140
389	2024-07-17 15:19:55.870618	Hotel	Confirmada	237
390	2026-03-30 21:24:48.276524	Show	Pendiente	336
391	2025-07-24 01:07:49.888834	Show	Pendiente	175
392	2026-07-05 06:59:37.727068	Hotel	Pendiente	214
393	2025-01-23 08:58:33.527993	Hotel	Pendiente	138
394	2024-12-24 14:33:45.43458	Hotel	Confirmada	269
395	2024-03-23 00:14:26.021828	Hotel	Pendiente	18
396	2024-04-12 01:11:13.195926	Hotel	Pendiente	160
397	2024-02-22 06:15:04.875512	Hotel	Pendiente	85
398	2024-03-23 19:54:31.270412	Hotel	Confirmada	258
399	2025-02-09 10:50:50.46124	Hotel	Confirmada	256
400	2025-09-10 03:32:17.57678	Restaurante	Confirmada	85
401	2025-07-14 04:31:11.839174	Show	Confirmada	162
402	2026-04-10 12:41:35.055826	Hotel	Confirmada	275
403	2025-12-05 10:47:19.322334	Hotel	Confirmada	380
404	2025-03-25 16:02:32.40483	Restaurante	Pendiente	226
405	2024-03-12 21:57:59.090491	Hotel	Cancelada	373
406	2024-08-05 09:26:41.675978	Hotel	Confirmada	380
407	2026-05-14 02:33:46.870677	Show	Pendiente	158
408	2024-07-17 04:10:42.706117	Hotel	Pendiente	383
409	2026-02-19 00:43:38.409765	Show	Confirmada	258
410	2026-02-27 23:19:23.398455	Restaurante	Confirmada	346
411	2024-08-12 16:48:55.690331	Hotel	Cancelada	48
412	2026-06-24 03:03:54.94887	Show	Pendiente	346
413	2026-06-15 14:39:05.006233	Hotel	Confirmada	65
414	2024-01-14 09:25:52.197675	Hotel	Cancelada	145
415	2025-10-29 01:08:06.189534	Hotel	Pendiente	95
416	2024-05-14 12:10:26.573934	Hotel	Pendiente	107
417	2026-04-28 21:44:36.177122	Show	Pendiente	4
418	2024-05-14 08:35:29.380795	Restaurante	Cancelada	203
419	2026-03-12 16:59:04.640024	Show	Pendiente	260
420	2025-01-13 00:12:36.403823	Hotel	Pendiente	187
421	2026-09-13 07:21:53.724759	Hotel	Confirmada	18
422	2025-01-31 19:33:45.640663	Restaurante	Pendiente	90
423	2024-07-03 14:47:39.121355	Hotel	Confirmada	76
424	2024-03-11 08:34:47.894273	Hotel	Pendiente	178
425	2026-04-18 04:38:01.167827	Restaurante	Confirmada	213
426	2025-10-22 02:55:10.076178	Hotel	Pendiente	355
427	2023-10-07 16:30:34.847489	Restaurante	Cancelada	68
428	2024-01-14 20:58:23.958019	Restaurante	Confirmada	110
429	2023-11-19 15:44:44.815829	Restaurante	Confirmada	318
430	2025-11-16 13:29:24.930831	Show	Pendiente	189
431	2025-05-06 20:18:34.942617	Hotel	Pendiente	57
432	2024-04-21 16:35:58.406398	Hotel	Cancelada	372
433	2026-03-02 02:59:28.730589	Show	Cancelada	266
434	2025-11-12 18:58:24.30472	Restaurante	Confirmada	4
435	2025-11-24 11:47:48.809149	Hotel	Pendiente	26
436	2026-05-08 17:31:37.634899	Restaurante	Cancelada	118
437	2025-06-26 20:41:23.456123	Show	Cancelada	129
438	2024-01-10 17:35:23.033622	Show	Confirmada	332
439	2026-05-02 06:35:52.490864	Hotel	Pendiente	310
440	2023-10-15 21:44:06.178704	Hotel	Confirmada	295
441	2025-09-21 21:14:05.528998	Show	Pendiente	103
442	2026-01-11 20:58:57.010182	Show	Confirmada	201
443	2025-08-26 02:36:36.053842	Hotel	Pendiente	310
444	2025-05-10 14:38:29.483577	Restaurante	Pendiente	336
445	2024-07-29 10:43:59.083848	Show	Pendiente	336
446	2025-12-26 08:17:39.526483	Restaurante	Cancelada	149
447	2023-10-20 00:07:47.895948	Hotel	Cancelada	15
448	2025-11-17 11:51:39.111686	Restaurante	Pendiente	22
449	2024-02-01 02:15:44.588606	Hotel	Pendiente	307
450	2025-03-06 20:43:03.986304	Hotel	Confirmada	202
451	2024-01-07 22:56:23.43055	Hotel	Pendiente	260
452	2023-09-30 20:06:53.644364	Restaurante	Pendiente	351
453	2023-11-13 19:18:58.895002	Show	Pendiente	327
454	2025-09-30 06:21:12.390365	Hotel	Pendiente	33
455	2024-01-07 00:44:21.445976	Hotel	Confirmada	387
456	2025-12-08 14:53:36.336698	Restaurante	Confirmada	235
457	2024-06-12 07:32:18.102232	Show	Confirmada	124
458	2025-01-05 15:47:00.628447	Hotel	Pendiente	39
459	2026-06-28 12:58:34.428469	Hotel	Pendiente	83
460	2025-03-29 20:29:53.499873	Show	Pendiente	356
461	2024-12-09 14:03:00.572378	Hotel	Cancelada	45
462	2024-01-31 12:57:22.602097	Restaurante	Cancelada	107
463	2026-08-07 09:39:02.485783	Show	Confirmada	66
464	2023-12-25 01:57:39.50244	Show	Pendiente	244
465	2023-10-16 18:15:05.473596	Hotel	Pendiente	178
466	2024-04-12 18:10:13.458906	Restaurante	Confirmada	134
468	2025-04-03 12:48:52.018081	Restaurante	Pendiente	108
469	2024-12-24 04:51:56.754637	Restaurante	Pendiente	154
470	2024-11-24 08:23:09.573419	Restaurante	Confirmada	370
471	2026-03-08 18:21:26.45229	Show	Pendiente	304
472	2024-12-11 13:05:44.309844	Hotel	Cancelada	294
473	2024-08-28 00:10:45.355779	Restaurante	Confirmada	320
474	2025-12-20 15:15:09.145473	Hotel	Pendiente	280
475	2025-02-23 13:27:59.930943	Show	Pendiente	292
476	2023-12-02 19:12:24.278103	Hotel	Cancelada	79
477	2026-01-26 11:32:09.243349	Hotel	Pendiente	364
478	2026-01-16 07:39:03.032368	Restaurante	Confirmada	288
479	2024-11-29 03:34:02.321697	Hotel	Pendiente	328
480	2026-02-27 09:48:31.098035	Hotel	Confirmada	321
481	2024-09-22 04:25:40.852703	Hotel	Cancelada	373
482	2025-11-23 15:32:28.434427	Restaurante	Pendiente	374
483	2024-07-26 12:31:00.032622	Hotel	Pendiente	69
484	2025-10-20 11:00:02.87354	Hotel	Confirmada	340
485	2024-03-16 18:38:37.385769	Restaurante	Confirmada	190
486	2024-05-17 08:40:15.938355	Hotel	Pendiente	382
487	2024-12-13 01:16:48.500648	Show	Pendiente	26
488	2026-07-03 16:27:53.437981	Hotel	Confirmada	288
489	2026-01-16 18:42:57.771011	Show	Pendiente	284
490	2025-12-22 20:17:45.768123	Restaurante	Confirmada	172
491	2024-01-07 07:28:47.547744	Hotel	Cancelada	387
492	2025-07-23 03:35:08.952483	Hotel	Pendiente	100
493	2024-12-30 06:46:40.829422	Hotel	Confirmada	48
494	2024-05-09 09:08:19.280451	Hotel	Pendiente	90
495	2025-02-08 00:42:53.016414	Show	Pendiente	285
496	2026-03-07 17:42:35.441582	Show	Cancelada	48
497	2026-09-03 14:27:11.569507	Hotel	Pendiente	107
498	2024-07-10 19:21:14.123897	Show	Pendiente	393
499	2025-02-10 01:26:21.474322	Hotel	Confirmada	34
500	2026-02-04 11:10:53.014047	Restaurante	Pendiente	249
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id_rol, nombre_rol, permisos) FROM stdin;
1	Gerencia	Acceso total
2	Seguridad	Acceso a logs, incidentes y cÃ¡maras
3	Cliente_App	Acceso a perfil personal, puntos y reservas
4	Operador	Acceso a gestion de maquinas
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id_usuario, dni, nombre, apellido, email, fecha_registro) FROM stdin;
1	10000001	Maria	Guerrero	maria.guerrero1@casino.com	2025-01-01
2	10000002	Juan	Gomez	juan.gomez2@casino.com	2026-03-30
3	10000003	Sofia	Gonzalez	sofia.gonzalez3@casino.com	2025-09-14
4	10000004	Pedro	Sanchez	pedro.sanchez4@casino.com	2025-02-06
5	10000005	Maria	Guerrero	maria.guerrero5@casino.com	2024-03-16
6	10000006	Carmen	Rodriguez	carmen.rodriguez6@casino.com	2025-10-20
7	10000007	Sofia	Soto	sofia.soto7@casino.com	2025-03-28
8	10000008	Pedro	Reyes	pedro.reyes8@casino.com	2026-03-04
9	10000009	Lucia	Vargas	lucia.vargas9@casino.com	2024-08-27
10	10000010	Maria	Garcia	maria.garcia10@casino.com	2023-09-30
11	10000011	Daniel	Vargas	daniel.vargas11@casino.com	2024-10-25
12	10000012	Pedro	Gonzalez	pedro.gonzalez12@casino.com	2025-10-26
13	10000013	Florencia	Soto	florencia.soto13@casino.com	2026-05-29
14	10000014	Maria	Vega	maria.vega14@casino.com	2024-03-02
15	10000015	Andres	Ruiz	andres.ruiz15@casino.com	2026-07-30
16	10000016	Carmen	Torres	carmen.torres16@casino.com	2024-08-13
17	10000017	Valeria	Soto	valeria.soto17@casino.com	2026-05-13
18	10000018	Juan	Perez	juan.perez18@casino.com	2026-06-01
19	10000019	Carmen	Navarro	carmen.navarro19@casino.com	2025-11-20
20	10000020	Paula	Ramirez	paula.ramirez20@casino.com	2025-04-02
21	10000021	David	Martinez	david.martinez21@casino.com	2024-05-07
22	10000022	Javier	Castillo	javier.castillo22@casino.com	2025-05-30
23	10000023	Carlos	Rodriguez	carlos.rodriguez23@casino.com	2025-10-24
24	10000024	Pedro	Molina	pedro.molina24@casino.com	2026-06-21
25	10000025	Juan	Mora	juan.mora25@casino.com	2024-01-29
26	10000026	Elena	Reyes	elena.reyes26@casino.com	2026-02-27
27	10000027	Sofia	Lopez	sofia.lopez27@casino.com	2024-03-10
28	10000028	Laura	Reyes	laura.reyes28@casino.com	2023-10-14
29	10000029	Florencia	Fernandez	florencia.fernandez29@casino.com	2026-03-08
30	10000030	Valeria	Torres	valeria.torres30@casino.com	2026-01-02
31	10000031	Laura	Mora	laura.mora31@casino.com	2025-05-06
32	10000032	Carmen	Martinez	carmen.martinez32@casino.com	2025-05-14
33	10000033	Ana	Lopez	ana.lopez33@casino.com	2024-03-23
34	10000034	Miguel	Ruiz	miguel.ruiz34@casino.com	2025-10-22
35	10000035	Andres	Rodriguez	andres.rodriguez35@casino.com	2025-03-18
36	10000036	Javier	Ortega	javier.ortega36@casino.com	2026-08-13
37	10000037	Florencia	Gonzalez	florencia.gonzalez37@casino.com	2024-03-31
38	10000038	Jose	Torres	jose.torres38@casino.com	2026-06-21
39	10000039	Juan	Castillo	juan.castillo39@casino.com	2025-04-22
40	10000040	Valeria	Lopez	valeria.lopez40@casino.com	2025-09-27
41	10000041	Valeria	Romero	valeria.romero41@casino.com	2024-03-27
42	10000042	David	Garcia	david.garcia42@casino.com	2024-06-13
43	10000043	Daniel	Martinez	daniel.martinez43@casino.com	2024-08-10
44	10000044	Camila	Martinez	camila.martinez44@casino.com	2026-08-28
45	10000045	Paula	Gomez	paula.gomez45@casino.com	2026-02-03
46	10000046	Elena	Rodriguez	elena.rodriguez46@casino.com	2026-02-18
47	10000047	Camila	Soto	camila.soto47@casino.com	2025-02-19
48	10000048	Javier	Diaz	javier.diaz48@casino.com	2024-05-11
49	10000049	Carmen	Molina	carmen.molina49@casino.com	2025-07-23
50	10000050	Ana	Mora	ana.mora50@casino.com	2025-06-09
51	10000051	Pedro	Perez	pedro.perez51@casino.com	2025-04-09
52	10000052	Martin	Gomez	martin.gomez52@casino.com	2025-11-30
53	10000053	Martin	Perez	martin.perez53@casino.com	2023-11-25
54	10000054	Carmen	Reyes	carmen.reyes54@casino.com	2024-12-20
55	10000055	Carmen	Rodriguez	carmen.rodriguez55@casino.com	2026-09-01
56	10000056	Marta	Torres	marta.torres56@casino.com	2026-08-15
57	10000057	Javier	Mora	javier.mora57@casino.com	2026-08-06
58	10000058	Maria	Vega	maria.vega58@casino.com	2024-06-03
59	10000059	Elena	Navarro	elena.navarro59@casino.com	2024-03-22
60	10000060	Jose	Diaz	jose.diaz60@casino.com	2026-02-13
61	10000061	Lucia	Navarro	lucia.navarro61@casino.com	2024-03-30
62	10000062	Carlos	Ruiz	carlos.ruiz62@casino.com	2024-01-27
63	10000063	Paula	Fernandez	paula.fernandez63@casino.com	2025-03-29
64	10000064	Luis	Navarro	luis.navarro64@casino.com	2023-11-26
65	10000065	Pedro	Gomez	pedro.gomez65@casino.com	2024-04-19
66	10000066	Juan	Molina	juan.molina66@casino.com	2026-03-01
67	10000067	Valeria	Castillo	valeria.castillo67@casino.com	2024-08-16
68	10000068	Carlos	Alvarez	carlos.alvarez68@casino.com	2025-04-30
69	10000069	Pedro	Romero	pedro.romero69@casino.com	2025-05-18
70	10000070	Marta	Garcia	marta.garcia70@casino.com	2025-09-07
71	10000071	Daniel	Gonzalez	daniel.gonzalez71@casino.com	2024-10-11
72	10000072	Juan	Perez	juan.perez72@casino.com	2024-03-03
73	10000073	Javier	Rodriguez	javier.rodriguez73@casino.com	2024-12-14
74	10000074	Marcos	Martinez	marcos.martinez74@casino.com	2024-04-02
75	10000075	Pedro	Torres	pedro.torres75@casino.com	2023-09-26
76	10000076	Jose	Martinez	jose.martinez76@casino.com	2024-05-04
77	10000077	Diego	Mora	diego.mora77@casino.com	2026-02-26
78	10000078	Javier	Ortega	javier.ortega78@casino.com	2025-12-20
79	10000079	Andres	Ramirez	andres.ramirez79@casino.com	2024-02-22
80	10000080	Paula	Castillo	paula.castillo80@casino.com	2026-02-22
81	10000081	Martin	Ramirez	martin.ramirez81@casino.com	2025-02-23
82	10000082	Javier	Guerrero	javier.guerrero82@casino.com	2023-09-25
83	10000083	Camila	Sanchez	camila.sanchez83@casino.com	2025-10-11
84	10000084	David	Sanchez	david.sanchez84@casino.com	2024-01-16
85	10000085	Juan	Torres	juan.torres85@casino.com	2026-07-23
86	10000086	Miguel	Torres	miguel.torres86@casino.com	2024-10-21
87	10000087	Valeria	Gomez	valeria.gomez87@casino.com	2025-08-26
88	10000088	Elena	Diaz	elena.diaz88@casino.com	2024-06-27
89	10000089	Jose	Vargas	jose.vargas89@casino.com	2024-04-28
90	10000090	Diego	Romero	diego.romero90@casino.com	2024-06-22
91	10000091	Camila	Vega	camila.vega91@casino.com	2023-12-12
92	10000092	Carmen	Ramirez	carmen.ramirez92@casino.com	2024-07-20
93	10000093	Javier	Gonzalez	javier.gonzalez93@casino.com	2024-02-27
94	10000094	Camila	Gomez	camila.gomez94@casino.com	2025-05-19
95	10000095	Maria	Alvarez	maria.alvarez95@casino.com	2026-04-22
96	10000096	Lucia	Soto	lucia.soto96@casino.com	2025-10-06
97	10000097	Miguel	Gomez	miguel.gomez97@casino.com	2024-05-03
98	10000098	Diego	Mora	diego.mora98@casino.com	2024-06-30
99	10000099	Daniel	Guerrero	daniel.guerrero99@casino.com	2026-04-18
100	10000100	Daniel	Navarro	daniel.navarro100@casino.com	2024-05-18
101	10000101	Paula	Guerrero	paula.guerrero101@casino.com	2023-10-04
102	10000102	Camila	Ramirez	camila.ramirez102@casino.com	2025-05-29
103	10000103	Pedro	Reyes	pedro.reyes103@casino.com	2025-11-25
104	10000104	Valeria	Gonzalez	valeria.gonzalez104@casino.com	2023-12-02
105	10000105	Javier	Garcia	javier.garcia105@casino.com	2024-07-25
106	10000106	Martin	Reyes	martin.reyes106@casino.com	2025-06-13
107	10000107	Miguel	Rodriguez	miguel.rodriguez107@casino.com	2024-08-30
108	10000108	Juan	Gonzalez	juan.gonzalez108@casino.com	2024-04-15
109	10000109	Andres	Rodriguez	andres.rodriguez109@casino.com	2024-03-29
110	10000110	Jose	Rodriguez	jose.rodriguez110@casino.com	2024-12-14
111	10000111	Maria	Vargas	maria.vargas111@casino.com	2025-04-07
112	10000112	Florencia	Reyes	florencia.reyes112@casino.com	2023-10-22
113	10000113	Luis	Gomez	luis.gomez113@casino.com	2025-09-15
114	10000114	Sofia	Mora	sofia.mora114@casino.com	2024-04-28
115	10000115	Maria	Lopez	maria.lopez115@casino.com	2024-05-07
116	10000116	Pedro	Rodriguez	pedro.rodriguez116@casino.com	2026-03-25
117	10000117	Jose	Castillo	jose.castillo117@casino.com	2026-06-01
118	10000118	Miguel	Vega	miguel.vega118@casino.com	2024-12-10
119	10000119	Maria	Rodriguez	maria.rodriguez119@casino.com	2026-02-25
120	10000120	Andres	Mora	andres.mora120@casino.com	2024-01-24
121	10000121	Jose	Lopez	jose.lopez121@casino.com	2025-09-26
122	10000122	Florencia	Soto	florencia.soto122@casino.com	2026-04-11
123	10000123	Andres	Mora	andres.mora123@casino.com	2025-09-19
124	10000124	Camila	Reyes	camila.reyes124@casino.com	2024-12-05
125	10000125	Camila	Castillo	camila.castillo125@casino.com	2025-07-22
126	10000126	Luis	Molina	luis.molina126@casino.com	2025-06-22
127	10000127	Maria	Romero	maria.romero127@casino.com	2024-04-12
128	10000128	Paula	Lopez	paula.lopez128@casino.com	2025-01-06
129	10000129	Florencia	Guerrero	florencia.guerrero129@casino.com	2023-12-15
130	10000130	Maria	Castillo	maria.castillo130@casino.com	2024-11-20
131	10000131	Marta	Rodriguez	marta.rodriguez131@casino.com	2024-03-14
132	10000132	Laura	Alvarez	laura.alvarez132@casino.com	2025-05-18
133	10000133	David	Navarro	david.navarro133@casino.com	2026-05-27
134	10000134	Daniel	Ruiz	daniel.ruiz134@casino.com	2025-10-06
135	10000135	Laura	Rodriguez	laura.rodriguez135@casino.com	2024-01-25
136	10000136	Sofia	Rodriguez	sofia.rodriguez136@casino.com	2026-03-09
137	10000137	Marta	Ramirez	marta.ramirez137@casino.com	2024-10-11
138	10000138	Daniel	Alvarez	daniel.alvarez138@casino.com	2024-01-04
139	10000139	Valeria	Romero	valeria.romero139@casino.com	2025-02-03
140	10000140	Javier	Alvarez	javier.alvarez140@casino.com	2026-04-10
141	10000141	David	Fernandez	david.fernandez141@casino.com	2024-02-15
142	10000142	Javier	Garcia	javier.garcia142@casino.com	2026-03-16
143	10000143	Daniel	Reyes	daniel.reyes143@casino.com	2023-10-02
144	10000144	Lucia	Reyes	lucia.reyes144@casino.com	2024-04-16
145	10000145	Diego	Ortega	diego.ortega145@casino.com	2025-03-08
146	10000146	Valeria	Perez	valeria.perez146@casino.com	2025-12-29
147	10000147	Martin	Guerrero	martin.guerrero147@casino.com	2025-07-08
148	10000148	Juan	Gomez	juan.gomez148@casino.com	2026-07-27
149	10000149	Valeria	Lopez	valeria.lopez149@casino.com	2025-06-23
150	10000150	Maria	Rodriguez	maria.rodriguez150@casino.com	2024-05-21
151	10000151	Lucia	Lopez	lucia.lopez151@casino.com	2024-12-11
152	10000152	Miguel	Castillo	miguel.castillo152@casino.com	2024-10-20
153	10000153	Jose	Molina	jose.molina153@casino.com	2026-06-12
154	10000154	Martin	Rodriguez	martin.rodriguez154@casino.com	2025-03-04
155	10000155	Juan	Guerrero	juan.guerrero155@casino.com	2023-11-24
156	10000156	David	Alvarez	david.alvarez156@casino.com	2024-03-16
157	10000157	Marcos	Perez	marcos.perez157@casino.com	2024-11-12
158	10000158	Carlos	Garcia	carlos.garcia158@casino.com	2026-01-12
159	10000159	Martin	Vargas	martin.vargas159@casino.com	2026-01-22
160	10000160	Carmen	Mora	carmen.mora160@casino.com	2026-04-23
161	10000161	David	Soto	david.soto161@casino.com	2024-06-24
162	10000162	Jose	Ortega	jose.ortega162@casino.com	2024-05-09
163	10000163	Miguel	Ramirez	miguel.ramirez163@casino.com	2025-07-17
164	10000164	Camila	Vega	camila.vega164@casino.com	2026-05-24
165	10000165	Lucia	Rodriguez	lucia.rodriguez165@casino.com	2025-03-31
166	10000166	Juan	Ramirez	juan.ramirez166@casino.com	2026-02-14
167	10000167	David	Sanchez	david.sanchez167@casino.com	2026-08-14
168	10000168	Maria	Gonzalez	maria.gonzalez168@casino.com	2025-02-09
169	10000169	Carmen	Reyes	carmen.reyes169@casino.com	2025-08-01
170	10000170	Miguel	Mora	miguel.mora170@casino.com	2026-03-25
171	10000171	Carlos	Mora	carlos.mora171@casino.com	2026-06-01
172	10000172	Ana	Castillo	ana.castillo172@casino.com	2024-10-11
173	10000173	Sofia	Mora	sofia.mora173@casino.com	2023-09-21
174	10000174	Andres	Martinez	andres.martinez174@casino.com	2024-03-31
175	10000175	Paula	Romero	paula.romero175@casino.com	2024-02-22
176	10000176	Carlos	Diaz	carlos.diaz176@casino.com	2026-01-28
177	10000177	Juan	Ruiz	juan.ruiz177@casino.com	2024-10-08
178	10000178	Marcos	Gonzalez	marcos.gonzalez178@casino.com	2024-12-28
179	10000179	Marcos	Reyes	marcos.reyes179@casino.com	2025-11-01
180	10000180	Sofia	Vega	sofia.vega180@casino.com	2025-09-08
181	10000181	Javier	Romero	javier.romero181@casino.com	2025-02-03
182	10000182	Martin	Romero	martin.romero182@casino.com	2026-08-26
183	10000183	Florencia	Diaz	florencia.diaz183@casino.com	2024-01-15
184	10000184	Ana	Diaz	ana.diaz184@casino.com	2026-07-03
185	10000185	Pedro	Diaz	pedro.diaz185@casino.com	2025-07-26
186	10000186	Diego	Gonzalez	diego.gonzalez186@casino.com	2024-05-20
187	10000187	Ana	Garcia	ana.garcia187@casino.com	2025-09-25
188	10000188	Laura	Diaz	laura.diaz188@casino.com	2026-03-29
189	10000189	Javier	Vargas	javier.vargas189@casino.com	2026-05-12
190	10000190	Carlos	Garcia	carlos.garcia190@casino.com	2025-04-19
191	10000191	Luis	Garcia	luis.garcia191@casino.com	2026-01-14
192	10000192	Miguel	Martinez	miguel.martinez192@casino.com	2024-04-09
193	10000193	Daniel	Sanchez	daniel.sanchez193@casino.com	2023-10-04
194	10000194	Carmen	Martinez	carmen.martinez194@casino.com	2024-02-01
195	10000195	Javier	Castillo	javier.castillo195@casino.com	2026-03-21
196	10000196	Ana	Alvarez	ana.alvarez196@casino.com	2024-06-06
197	10000197	Florencia	Ortega	florencia.ortega197@casino.com	2024-05-16
198	10000198	Lucia	Mora	lucia.mora198@casino.com	2024-12-03
199	10000199	Pedro	Gonzalez	pedro.gonzalez199@casino.com	2023-12-30
200	10000200	Elena	Vega	elena.vega200@casino.com	2025-03-20
201	10000201	Javier	Garcia	javier.garcia201@casino.com	2025-09-28
202	10000202	Andres	Castillo	andres.castillo202@casino.com	2024-06-13
203	10000203	Luis	Rodriguez	luis.rodriguez203@casino.com	2025-11-19
204	10000204	Andres	Reyes	andres.reyes204@casino.com	2026-02-18
205	10000205	Juan	Torres	juan.torres205@casino.com	2026-03-12
206	10000206	Ana	Soto	ana.soto206@casino.com	2023-10-14
207	10000207	Elena	Diaz	elena.diaz207@casino.com	2025-07-31
208	10000208	Marcos	Romero	marcos.romero208@casino.com	2025-05-12
209	10000209	Carlos	Gonzalez	carlos.gonzalez209@casino.com	2025-07-17
210	10000210	Marta	Lopez	marta.lopez210@casino.com	2024-03-05
211	10000211	Marta	Martinez	marta.martinez211@casino.com	2025-08-29
212	10000212	Daniel	Soto	daniel.soto212@casino.com	2025-09-21
213	10000213	Pedro	Perez	pedro.perez213@casino.com	2023-10-24
214	10000214	Javier	Gonzalez	javier.gonzalez214@casino.com	2024-06-25
215	10000215	David	Navarro	david.navarro215@casino.com	2025-12-21
216	10000216	Paula	Vega	paula.vega216@casino.com	2023-12-12
217	10000217	Elena	Alvarez	elena.alvarez217@casino.com	2026-02-16
218	10000218	Marta	Sanchez	marta.sanchez218@casino.com	2026-09-10
219	10000219	Carmen	Ortega	carmen.ortega219@casino.com	2026-04-23
220	10000220	Valeria	Gomez	valeria.gomez220@casino.com	2023-12-06
221	10000221	Ana	Garcia	ana.garcia221@casino.com	2024-05-31
222	10000222	Paula	Alvarez	paula.alvarez222@casino.com	2025-07-05
223	10000223	Martin	Reyes	martin.reyes223@casino.com	2024-02-07
224	10000224	Carmen	Gonzalez	carmen.gonzalez224@casino.com	2024-07-01
225	10000225	Laura	Navarro	laura.navarro225@casino.com	2026-04-25
226	10000226	Ana	Ruiz	ana.ruiz226@casino.com	2026-02-02
227	10000227	Maria	Ruiz	maria.ruiz227@casino.com	2025-02-05
228	10000228	Marta	Molina	marta.molina228@casino.com	2024-01-11
229	10000229	Andres	Gomez	andres.gomez229@casino.com	2024-04-22
230	10000230	Valeria	Lopez	valeria.lopez230@casino.com	2026-01-11
231	10000231	Camila	Castillo	camila.castillo231@casino.com	2024-12-18
232	10000232	Javier	Ramirez	javier.ramirez232@casino.com	2026-09-08
233	10000233	Martin	Vargas	martin.vargas233@casino.com	2026-05-20
234	10000234	Martin	Mora	martin.mora234@casino.com	2024-12-05
235	10000235	Laura	Ruiz	laura.ruiz235@casino.com	2024-05-29
236	10000236	Luis	Perez	luis.perez236@casino.com	2026-05-05
237	10000237	David	Romero	david.romero237@casino.com	2026-09-05
238	10000238	Valeria	Romero	valeria.romero238@casino.com	2025-04-02
239	10000239	Carlos	Fernandez	carlos.fernandez239@casino.com	2025-08-07
240	10000240	Paula	Molina	paula.molina240@casino.com	2026-05-31
241	10000241	Lucia	Molina	lucia.molina241@casino.com	2025-04-23
242	10000242	Carlos	Perez	carlos.perez242@casino.com	2024-10-29
243	10000243	Pedro	Guerrero	pedro.guerrero243@casino.com	2025-07-26
244	10000244	Ana	Guerrero	ana.guerrero244@casino.com	2026-01-10
245	10000245	Juan	Romero	juan.romero245@casino.com	2026-03-28
246	10000246	Luis	Molina	luis.molina246@casino.com	2023-11-30
247	10000247	Jose	Romero	jose.romero247@casino.com	2025-10-29
248	10000248	Pedro	Mora	pedro.mora248@casino.com	2025-01-09
249	10000249	Laura	Gonzalez	laura.gonzalez249@casino.com	2026-07-26
250	10000250	Sofia	Navarro	sofia.navarro250@casino.com	2024-08-05
251	10000251	Martin	Vargas	martin.vargas251@casino.com	2023-12-19
252	10000252	Ana	Mora	ana.mora252@casino.com	2025-02-02
253	10000253	Juan	Vargas	juan.vargas253@casino.com	2024-10-03
254	10000254	Carlos	Gonzalez	carlos.gonzalez254@casino.com	2024-07-12
255	10000255	Lucia	Molina	lucia.molina255@casino.com	2026-09-17
256	10000256	Laura	Lopez	laura.lopez256@casino.com	2025-04-19
257	10000257	Pedro	Ortega	pedro.ortega257@casino.com	2026-02-25
258	10000258	Luis	Garcia	luis.garcia258@casino.com	2025-06-21
259	10000259	Carmen	Soto	carmen.soto259@casino.com	2025-07-19
260	10000260	Elena	Ramirez	elena.ramirez260@casino.com	2023-10-12
261	10000261	Camila	Guerrero	camila.guerrero261@casino.com	2026-04-10
262	10000262	Martin	Guerrero	martin.guerrero262@casino.com	2026-03-29
263	10000263	Paula	Vega	paula.vega263@casino.com	2025-07-29
264	10000264	Camila	Torres	camila.torres264@casino.com	2026-03-25
265	10000265	Diego	Ramirez	diego.ramirez265@casino.com	2024-01-15
266	10000266	Marcos	Soto	marcos.soto266@casino.com	2025-07-27
267	10000267	Daniel	Ramirez	daniel.ramirez267@casino.com	2025-05-22
268	10000268	Luis	Reyes	luis.reyes268@casino.com	2025-07-15
269	10000269	Paula	Navarro	paula.navarro269@casino.com	2025-08-19
270	10000270	Daniel	Perez	daniel.perez270@casino.com	2025-01-06
271	10000271	Martin	Gomez	martin.gomez271@casino.com	2024-06-12
272	10000272	Camila	Fernandez	camila.fernandez272@casino.com	2023-10-11
273	10000273	Ana	Diaz	ana.diaz273@casino.com	2024-06-05
274	10000274	Carlos	Garcia	carlos.garcia274@casino.com	2023-11-01
275	10000275	Lucia	Vargas	lucia.vargas275@casino.com	2024-08-26
276	10000276	Andres	Reyes	andres.reyes276@casino.com	2024-07-08
277	10000277	David	Vega	david.vega277@casino.com	2025-08-13
278	10000278	Pedro	Ortega	pedro.ortega278@casino.com	2025-09-15
279	10000279	Camila	Perez	camila.perez279@casino.com	2024-12-12
280	10000280	Lucia	Ruiz	lucia.ruiz280@casino.com	2025-08-20
281	10000281	Carmen	Rodriguez	carmen.rodriguez281@casino.com	2025-04-30
282	10000282	Javier	Gomez	javier.gomez282@casino.com	2026-07-15
283	10000283	Jose	Ramirez	jose.ramirez283@casino.com	2024-08-18
284	10000284	Pedro	Alvarez	pedro.alvarez284@casino.com	2026-03-29
285	10000285	Laura	Romero	laura.romero285@casino.com	2026-08-17
286	10000286	Juan	Lopez	juan.lopez286@casino.com	2026-08-05
287	10000287	Carlos	Diaz	carlos.diaz287@casino.com	2024-06-19
288	10000288	Juan	Romero	juan.romero288@casino.com	2025-08-03
289	10000289	Daniel	Lopez	daniel.lopez289@casino.com	2026-03-06
290	10000290	Sofia	Castillo	sofia.castillo290@casino.com	2024-03-27
291	10000291	Marcos	Rodriguez	marcos.rodriguez291@casino.com	2026-08-13
292	10000292	Luis	Guerrero	luis.guerrero292@casino.com	2024-02-07
293	10000293	Elena	Alvarez	elena.alvarez293@casino.com	2024-02-01
294	10000294	Javier	Lopez	javier.lopez294@casino.com	2026-08-22
295	10000295	Paula	Sanchez	paula.sanchez295@casino.com	2025-05-02
296	10000296	Camila	Lopez	camila.lopez296@casino.com	2024-02-09
297	10000297	Marcos	Mora	marcos.mora297@casino.com	2023-12-29
298	10000298	Miguel	Gomez	miguel.gomez298@casino.com	2024-12-18
299	10000299	Maria	Garcia	maria.garcia299@casino.com	2024-05-19
300	10000300	Elena	Vargas	elena.vargas300@casino.com	2025-05-27
301	10000301	Juan	Soto	juan.soto301@casino.com	2025-11-13
302	10000302	Florencia	Martinez	florencia.martinez302@casino.com	2025-12-28
303	10000303	Diego	Mora	diego.mora303@casino.com	2025-10-04
304	10000304	Marcos	Reyes	marcos.reyes304@casino.com	2025-03-30
305	10000305	Andres	Ortega	andres.ortega305@casino.com	2024-04-26
306	10000306	Diego	Gonzalez	diego.gonzalez306@casino.com	2025-09-10
307	10000307	Andres	Reyes	andres.reyes307@casino.com	2024-05-03
308	10000308	Lucia	Ramirez	lucia.ramirez308@casino.com	2024-10-26
309	10000309	Paula	Lopez	paula.lopez309@casino.com	2026-08-28
310	10000310	Laura	Navarro	laura.navarro310@casino.com	2025-11-09
311	10000311	Pedro	Ruiz	pedro.ruiz311@casino.com	2026-08-12
312	10000312	Juan	Torres	juan.torres312@casino.com	2026-03-08
313	10000313	Pedro	Perez	pedro.perez313@casino.com	2025-05-25
314	10000314	Javier	Vargas	javier.vargas314@casino.com	2024-05-20
315	10000315	Jose	Vega	jose.vega315@casino.com	2026-06-29
316	10000316	Valeria	Vargas	valeria.vargas316@casino.com	2026-07-24
317	10000317	Pedro	Garcia	pedro.garcia317@casino.com	2024-03-03
318	10000318	Laura	Soto	laura.soto318@casino.com	2026-02-23
319	10000319	Luis	Ramirez	luis.ramirez319@casino.com	2024-07-24
320	10000320	David	Garcia	david.garcia320@casino.com	2024-08-04
321	10000321	Luis	Perez	luis.perez321@casino.com	2023-12-13
322	10000322	Lucia	Gomez	lucia.gomez322@casino.com	2025-03-13
323	10000323	Andres	Sanchez	andres.sanchez323@casino.com	2025-12-09
324	10000324	Valeria	Ruiz	valeria.ruiz324@casino.com	2024-10-15
325	10000325	Pedro	Perez	pedro.perez325@casino.com	2025-03-02
326	10000326	Elena	Torres	elena.torres326@casino.com	2026-07-01
327	10000327	Carlos	Gonzalez	carlos.gonzalez327@casino.com	2025-06-05
328	10000328	Ana	Ruiz	ana.ruiz328@casino.com	2025-07-05
329	10000329	Paula	Molina	paula.molina329@casino.com	2025-10-26
330	10000330	Elena	Gonzalez	elena.gonzalez330@casino.com	2024-11-09
331	10000331	Paula	Martinez	paula.martinez331@casino.com	2024-08-28
332	10000332	Martin	Fernandez	martin.fernandez332@casino.com	2025-08-28
333	10000333	Daniel	Alvarez	daniel.alvarez333@casino.com	2025-12-06
334	10000334	Ana	Gomez	ana.gomez334@casino.com	2025-03-02
335	10000335	Maria	Garcia	maria.garcia335@casino.com	2026-02-13
336	10000336	Paula	Gomez	paula.gomez336@casino.com	2026-01-17
337	10000337	Luis	Rodriguez	luis.rodriguez337@casino.com	2026-06-28
338	10000338	Carlos	Romero	carlos.romero338@casino.com	2024-07-26
339	10000339	Juan	Guerrero	juan.guerrero339@casino.com	2025-02-12
340	10000340	Pedro	Garcia	pedro.garcia340@casino.com	2026-02-18
341	10000341	Valeria	Reyes	valeria.reyes341@casino.com	2024-10-27
342	10000342	Andres	Lopez	andres.lopez342@casino.com	2025-04-24
343	10000343	Javier	Martinez	javier.martinez343@casino.com	2025-02-14
344	10000344	Ana	Ruiz	ana.ruiz344@casino.com	2024-12-27
345	10000345	Florencia	Garcia	florencia.garcia345@casino.com	2025-01-02
346	10000346	Marcos	Reyes	marcos.reyes346@casino.com	2024-06-02
347	10000347	Paula	Reyes	paula.reyes347@casino.com	2025-03-01
348	10000348	Maria	Mora	maria.mora348@casino.com	2025-06-22
349	10000349	Marta	Romero	marta.romero349@casino.com	2024-04-16
350	10000350	David	Reyes	david.reyes350@casino.com	2026-06-29
351	10000351	Carlos	Ortega	carlos.ortega351@casino.com	2025-01-01
352	10000352	Diego	Gomez	diego.gomez352@casino.com	2025-12-25
353	10000353	Maria	Lopez	maria.lopez353@casino.com	2024-08-11
354	10000354	David	Lopez	david.lopez354@casino.com	2026-03-25
355	10000355	Javier	Perez	javier.perez355@casino.com	2026-02-24
356	10000356	Valeria	Mora	valeria.mora356@casino.com	2026-04-26
357	10000357	Diego	Reyes	diego.reyes357@casino.com	2025-04-16
358	10000358	David	Martinez	david.martinez358@casino.com	2025-09-17
359	10000359	Paula	Alvarez	paula.alvarez359@casino.com	2026-06-11
360	10000360	Laura	Soto	laura.soto360@casino.com	2026-05-03
361	10000361	David	Torres	david.torres361@casino.com	2024-10-23
362	10000362	Jose	Guerrero	jose.guerrero362@casino.com	2025-08-06
363	10000363	Martin	Gonzalez	martin.gonzalez363@casino.com	2025-08-11
364	10000364	Marcos	Reyes	marcos.reyes364@casino.com	2026-08-15
365	10000365	Jose	Rodriguez	jose.rodriguez365@casino.com	2025-07-23
366	10000366	Javier	Castillo	javier.castillo366@casino.com	2025-12-01
367	10000367	Marcos	Ortega	marcos.ortega367@casino.com	2026-03-03
368	10000368	Pedro	Torres	pedro.torres368@casino.com	2025-10-04
369	10000369	Sofia	Rodriguez	sofia.rodriguez369@casino.com	2025-08-02
370	10000370	Florencia	Perez	florencia.perez370@casino.com	2024-09-05
371	10000371	Marcos	Sanchez	marcos.sanchez371@casino.com	2026-02-06
372	10000372	Valeria	Ramirez	valeria.ramirez372@casino.com	2024-12-27
373	10000373	Marta	Vega	marta.vega373@casino.com	2025-08-30
374	10000374	Andres	Molina	andres.molina374@casino.com	2023-11-18
375	10000375	Marcos	Garcia	marcos.garcia375@casino.com	2026-08-25
376	10000376	Valeria	Rodriguez	valeria.rodriguez376@casino.com	2026-04-22
377	10000377	Elena	Sanchez	elena.sanchez377@casino.com	2024-12-17
378	10000378	Ana	Perez	ana.perez378@casino.com	2025-08-19
379	10000379	Laura	Alvarez	laura.alvarez379@casino.com	2024-03-12
380	10000380	Pedro	Alvarez	pedro.alvarez380@casino.com	2025-01-12
381	10000381	Elena	Mora	elena.mora381@casino.com	2025-10-12
382	10000382	Juan	Soto	juan.soto382@casino.com	2025-02-05
383	10000383	Ana	Gomez	ana.gomez383@casino.com	2026-03-31
384	10000384	Daniel	Soto	daniel.soto384@casino.com	2024-11-06
385	10000385	Sofia	Rodriguez	sofia.rodriguez385@casino.com	2024-04-23
386	10000386	Ana	Romero	ana.romero386@casino.com	2024-04-23
387	10000387	Marta	Ruiz	marta.ruiz387@casino.com	2026-03-12
388	10000388	Camila	Reyes	camila.reyes388@casino.com	2025-06-19
389	10000389	Elena	Reyes	elena.reyes389@casino.com	2025-03-17
390	10000390	Laura	Alvarez	laura.alvarez390@casino.com	2025-12-16
391	10000391	Marta	Sanchez	marta.sanchez391@casino.com	2024-01-26
392	10000392	Marcos	Rodriguez	marcos.rodriguez392@casino.com	2024-07-25
393	10000393	Martin	Torres	martin.torres393@casino.com	2025-12-18
394	10000394	Laura	Gonzalez	laura.gonzalez394@casino.com	2024-07-12
395	10000395	Florencia	Alvarez	florencia.alvarez395@casino.com	2026-02-16
396	10000396	Sofia	Romero	sofia.romero396@casino.com	2024-06-15
397	10000397	Andres	Ramirez	andres.ramirez397@casino.com	2025-09-17
398	10000398	Luis	Gomez	luis.gomez398@casino.com	2025-08-18
399	10000399	Diego	Guerrero	diego.guerrero399@casino.com	2024-10-13
400	10000400	Diego	Soto	diego.soto400@casino.com	2026-04-02
401	10000401	Florencia	Gomez	florencia.gomez401@casino.com	2024-08-18
402	10000402	Juan	Martinez	juan.martinez402@casino.com	2024-02-17
403	10000403	Marcos	Alvarez	marcos.alvarez403@casino.com	2025-01-19
404	10000404	Ana	Martinez	ana.martinez404@casino.com	2025-01-14
405	10000405	Marcos	Lopez	marcos.lopez405@casino.com	2026-02-01
406	10000406	Paula	Ortega	paula.ortega406@casino.com	2024-01-09
407	10000407	Luis	Vega	luis.vega407@casino.com	2025-05-30
408	10000408	Jose	Torres	jose.torres408@casino.com	2024-06-02
409	10000409	Diego	Perez	diego.perez409@casino.com	2023-12-07
410	10000410	Carmen	Vargas	carmen.vargas410@casino.com	2025-09-15
411	10000411	Sofia	Gonzalez	sofia.gonzalez411@casino.com	2024-05-09
412	10000412	Carlos	Ruiz	carlos.ruiz412@casino.com	2024-09-05
413	10000413	Laura	Vargas	laura.vargas413@casino.com	2023-09-30
414	10000414	Diego	Mora	diego.mora414@casino.com	2024-03-10
415	10000415	David	Perez	david.perez415@casino.com	2026-03-30
416	10000416	Andres	Diaz	andres.diaz416@casino.com	2024-02-26
417	10000417	Sofia	Torres	sofia.torres417@casino.com	2025-05-09
418	10000418	Martin	Vargas	martin.vargas418@casino.com	2025-07-05
419	10000419	Marta	Mora	marta.mora419@casino.com	2026-08-09
420	10000420	Elena	Mora	elena.mora420@casino.com	2026-01-15
421	10000421	Marta	Sanchez	marta.sanchez421@casino.com	2026-09-11
422	10000422	Elena	Soto	elena.soto422@casino.com	2024-12-06
423	10000423	David	Ruiz	david.ruiz423@casino.com	2026-05-12
424	10000424	Diego	Lopez	diego.lopez424@casino.com	2024-09-22
425	10000425	Maria	Alvarez	maria.alvarez425@casino.com	2025-11-16
426	10000426	Javier	Soto	javier.soto426@casino.com	2024-08-09
427	10000427	Laura	Alvarez	laura.alvarez427@casino.com	2024-07-10
428	10000428	Martin	Diaz	martin.diaz428@casino.com	2024-08-31
429	10000429	Valeria	Guerrero	valeria.guerrero429@casino.com	2024-01-04
430	10000430	Laura	Molina	laura.molina430@casino.com	2025-07-14
431	10000431	Jose	Martinez	jose.martinez431@casino.com	2026-05-04
432	10000432	Marta	Mora	marta.mora432@casino.com	2025-02-02
433	10000433	Marcos	Ortega	marcos.ortega433@casino.com	2024-02-11
434	10000434	Luis	Castillo	luis.castillo434@casino.com	2023-10-05
435	10000435	Marta	Reyes	marta.reyes435@casino.com	2024-01-14
436	10000436	Marcos	Ramirez	marcos.ramirez436@casino.com	2025-08-17
437	10000437	Florencia	Ortega	florencia.ortega437@casino.com	2024-06-26
438	10000438	Luis	Ramirez	luis.ramirez438@casino.com	2025-12-30
439	10000439	Sofia	Perez	sofia.perez439@casino.com	2024-07-11
440	10000440	Carlos	Guerrero	carlos.guerrero440@casino.com	2026-01-10
441	10000441	Marcos	Fernandez	marcos.fernandez441@casino.com	2024-05-11
442	10000442	Javier	Guerrero	javier.guerrero442@casino.com	2025-03-28
443	10000443	Carmen	Molina	carmen.molina443@casino.com	2023-11-02
444	10000444	Carlos	Diaz	carlos.diaz444@casino.com	2025-05-24
445	10000445	Miguel	Garcia	miguel.garcia445@casino.com	2025-04-25
446	10000446	Daniel	Ruiz	daniel.ruiz446@casino.com	2025-07-18
447	10000447	Elena	Navarro	elena.navarro447@casino.com	2025-08-21
448	10000448	Florencia	Martinez	florencia.martinez448@casino.com	2025-10-24
449	10000449	Daniel	Gomez	daniel.gomez449@casino.com	2025-08-14
450	10000450	Valeria	Ruiz	valeria.ruiz450@casino.com	2026-07-13
451	10000451	Jose	Martinez	jose.martinez451@casino.com	2025-05-30
452	10000452	Miguel	Ruiz	miguel.ruiz452@casino.com	2024-11-24
453	10000453	Lucia	Romero	lucia.romero453@casino.com	2025-04-27
454	10000454	Valeria	Guerrero	valeria.guerrero454@casino.com	2023-11-12
455	10000455	Paula	Perez	paula.perez455@casino.com	2023-10-27
456	10000456	Miguel	Vargas	miguel.vargas456@casino.com	2024-01-26
457	10000457	Lucia	Diaz	lucia.diaz457@casino.com	2026-01-27
458	10000458	Martin	Torres	martin.torres458@casino.com	2025-01-08
459	10000459	Luis	Ortega	luis.ortega459@casino.com	2026-09-02
460	10000460	Ana	Molina	ana.molina460@casino.com	2026-09-12
461	10000461	Juan	Molina	juan.molina461@casino.com	2024-10-23
462	10000462	Marta	Reyes	marta.reyes462@casino.com	2025-12-11
463	10000463	Javier	Romero	javier.romero463@casino.com	2024-08-14
464	10000464	Jose	Mora	jose.mora464@casino.com	2023-11-11
465	10000465	Sofia	Mora	sofia.mora465@casino.com	2026-03-19
466	10000466	Carmen	Mora	carmen.mora466@casino.com	2026-08-27
467	10000467	Valeria	Vega	valeria.vega467@casino.com	2024-10-29
468	10000468	Maria	Gonzalez	maria.gonzalez468@casino.com	2024-12-02
469	10000469	Marcos	Fernandez	marcos.fernandez469@casino.com	2026-05-09
470	10000470	Ana	Diaz	ana.diaz470@casino.com	2025-09-20
471	10000471	Carlos	Diaz	carlos.diaz471@casino.com	2026-01-23
472	10000472	Martin	Ortega	martin.ortega472@casino.com	2024-10-29
473	10000473	Diego	Vega	diego.vega473@casino.com	2026-05-30
474	10000474	Marcos	Gomez	marcos.gomez474@casino.com	2024-01-30
475	10000475	Elena	Ortega	elena.ortega475@casino.com	2025-02-01
476	10000476	Sofia	Navarro	sofia.navarro476@casino.com	2024-03-18
477	10000477	Juan	Torres	juan.torres477@casino.com	2023-10-10
478	10000478	Pedro	Ruiz	pedro.ruiz478@casino.com	2025-09-02
479	10000479	Martin	Gomez	martin.gomez479@casino.com	2025-05-24
480	10000480	Carmen	Ruiz	carmen.ruiz480@casino.com	2026-01-09
481	10000481	Martin	Torres	martin.torres481@casino.com	2024-01-30
482	10000482	Juan	Ruiz	juan.ruiz482@casino.com	2026-01-08
483	10000483	Jose	Reyes	jose.reyes483@casino.com	2025-08-05
484	10000484	Jose	Castillo	jose.castillo484@casino.com	2026-07-02
485	10000485	Sofia	Perez	sofia.perez485@casino.com	2024-02-27
486	10000486	Daniel	Castillo	daniel.castillo486@casino.com	2024-06-28
487	10000487	Martin	Lopez	martin.lopez487@casino.com	2024-05-26
488	10000488	Pedro	Reyes	pedro.reyes488@casino.com	2025-05-19
489	10000489	Paula	Alvarez	paula.alvarez489@casino.com	2025-09-11
490	10000490	Sofia	Castillo	sofia.castillo490@casino.com	2025-01-14
491	10000491	Marcos	Castillo	marcos.castillo491@casino.com	2025-11-01
492	10000492	Lucia	Garcia	lucia.garcia492@casino.com	2024-01-30
493	10000493	Carmen	Gomez	carmen.gomez493@casino.com	2024-08-27
494	10000494	David	Fernandez	david.fernandez494@casino.com	2024-08-10
495	10000495	Lucia	Fernandez	lucia.fernandez495@casino.com	2025-08-23
496	10000496	Ana	Ramirez	ana.ramirez496@casino.com	2026-05-10
497	10000497	Daniel	Sanchez	daniel.sanchez497@casino.com	2025-05-18
498	10000498	Maria	Perez	maria.perez498@casino.com	2025-11-07
499	10000499	Diego	Gomez	diego.gomez499@casino.com	2023-12-25
500	10000500	Marta	Mora	marta.mora500@casino.com	2024-05-26
\.


--
-- Data for Name: visitas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.visitas (id_usuario, fecha_hora_entrada, fecha_hora_salida, id_punto_acceso) FROM stdin;
364	2024-07-22 09:43:23.902563	\N	4
385	2025-08-30 23:59:33.942585	\N	16
36	2024-05-09 00:33:01.350672	\N	16
146	2026-01-14 13:28:35.97414	\N	19
48	2024-01-23 07:25:02.127798	\N	6
325	2025-11-05 10:05:31.626429	\N	19
304	2024-08-26 03:08:51.581636	\N	8
27	2024-08-13 12:05:51.725319	\N	3
235	2025-02-10 19:02:54.599268	\N	16
367	2025-11-28 18:49:49.297813	\N	3
3	2024-01-21 11:12:12.391704	\N	9
184	2023-11-07 12:17:36.620833	\N	18
106	2026-03-24 06:26:25.800324	\N	15
367	2024-08-04 18:14:52.916569	\N	10
246	2024-12-01 00:17:07.644481	\N	8
131	2026-07-02 03:05:08.35113	\N	17
291	2026-04-11 09:32:56.799825	\N	14
243	2026-01-13 05:31:39.787944	\N	15
91	2025-11-15 16:13:54.368785	\N	20
276	2025-10-05 03:24:44.057973	\N	2
292	2026-05-01 14:20:25.71851	\N	3
318	2026-06-13 08:46:09.233106	\N	19
84	2025-05-20 12:02:42.186009	\N	4
165	2024-01-19 14:35:16.902818	\N	13
213	2026-05-21 11:24:00.06649	\N	2
11	2025-11-10 01:40:24.312664	\N	16
348	2025-12-10 08:13:37.757885	\N	3
235	2025-01-24 15:19:45.186396	\N	5
70	2026-06-12 09:38:23.202911	\N	15
22	2026-01-01 01:52:56.868489	\N	19
178	2024-09-25 06:58:06.827309	\N	9
256	2025-02-06 02:54:26.435675	\N	17
342	2024-09-28 14:51:32.189969	\N	18
170	2025-05-28 04:53:34.884053	\N	5
276	2024-10-17 04:27:02.594737	\N	16
242	2026-07-04 15:37:31.415868	\N	16
368	2026-05-20 03:30:18.989028	\N	5
298	2025-10-10 08:58:24.272485	\N	7
105	2024-08-20 18:43:47.343608	\N	20
229	2026-06-24 08:36:39.259516	\N	4
306	2026-07-19 22:52:48.17045	\N	8
370	2026-09-01 20:07:16.055077	\N	20
71	2024-01-11 08:05:01.251999	\N	4
371	2026-07-19 16:44:19.176074	\N	18
18	2025-05-27 05:40:46.90742	\N	11
134	2026-08-31 08:37:07.351682	\N	18
278	2026-01-27 07:17:37.012412	\N	16
217	2024-11-30 20:17:39.966606	\N	10
203	2025-12-15 18:33:00.410788	\N	15
18	2024-04-14 06:03:13.889455	\N	18
263	2024-11-11 16:14:14.971181	\N	8
230	2026-05-12 06:22:40.646015	\N	19
88	2025-06-30 15:20:46.176582	\N	12
172	2026-05-29 08:46:06.985032	\N	19
193	2025-05-27 09:25:30.273134	\N	18
118	2024-08-10 23:10:52.382836	\N	1
164	2023-11-15 01:19:53.766739	\N	11
203	2023-12-16 18:40:26.695322	\N	18
223	2024-12-16 04:55:51.564449	\N	9
363	2026-07-29 14:57:16.610812	\N	16
200	2024-06-16 13:57:07.381128	\N	14
239	2025-06-10 13:41:18.892623	\N	20
67	2025-01-31 04:15:39.337527	\N	17
173	2025-11-30 11:04:03.373158	\N	19
124	2024-04-07 01:36:14.492283	\N	11
126	2025-04-15 06:12:26.61117	\N	15
181	2024-02-04 18:55:49.745512	\N	8
188	2026-08-31 01:13:16.544156	\N	1
229	2024-01-28 02:49:11.705702	\N	9
253	2025-12-23 15:51:21.705364	\N	17
244	2024-10-28 02:22:38.419723	\N	14
31	2024-11-26 04:38:08.260696	\N	8
6	2024-09-21 01:32:52.82095	\N	13
195	2024-06-06 07:28:30.545369	\N	12
82	2025-05-18 23:46:12.790425	\N	14
220	2023-10-24 23:49:15.700105	\N	15
188	2024-05-26 14:25:21.912218	\N	6
329	2024-08-04 12:04:33.942432	\N	15
217	2026-07-06 09:14:03.217512	\N	18
270	2025-11-12 06:54:02.982095	\N	16
342	2024-02-22 12:59:07.307445	\N	18
387	2025-11-08 19:46:22.978972	\N	1
233	2025-12-20 17:51:30.995489	\N	14
165	2023-12-23 14:29:17.753562	\N	9
166	2024-05-21 05:24:22.063493	\N	15
262	2025-08-31 03:29:45.270264	\N	1
357	2024-01-19 07:53:45.915258	\N	8
145	2026-05-28 14:59:01.135833	\N	16
169	2023-11-08 22:54:16.168228	\N	19
307	2026-02-15 10:24:45.509407	\N	1
121	2024-10-26 21:32:56.651964	\N	18
170	2025-08-19 00:21:18.26642	\N	18
396	2025-06-16 00:52:26.733895	\N	11
40	2026-03-25 03:14:46.632528	\N	6
359	2024-06-07 20:32:23.544573	\N	1
268	2024-02-29 20:24:35.967291	\N	17
267	2025-10-03 20:35:52.935554	\N	14
227	2024-05-29 23:04:11.293681	\N	19
48	2024-07-29 18:22:15.846374	\N	8
135	2024-01-04 23:38:32.355008	\N	2
105	2026-04-10 11:17:30.484428	\N	9
34	2026-02-09 18:14:11.880463	\N	7
132	2023-10-13 07:56:19.582388	\N	18
388	2025-05-09 21:04:53.164954	\N	1
304	2025-10-21 13:14:41.519189	\N	4
16	2023-11-07 05:53:49.429957	\N	5
348	2024-09-11 07:13:29.804775	\N	8
327	2024-11-09 15:28:15.215767	\N	9
327	2024-12-04 16:06:08.812009	\N	7
374	2026-04-20 10:42:30.992059	\N	1
276	2026-06-11 13:24:36.26472	\N	19
393	2025-12-02 06:07:21.874444	\N	4
52	2023-12-07 00:54:23.132571	\N	19
46	2025-08-10 18:18:18.846338	\N	9
193	2024-11-07 01:34:56.762233	\N	2
254	2025-03-14 18:09:54.128043	\N	2
155	2025-10-31 19:24:03.719557	\N	11
323	2024-06-07 22:26:14.093217	\N	17
121	2024-12-22 07:27:08.021131	\N	14
177	2025-09-23 03:17:15.043787	\N	19
346	2025-08-30 03:09:52.909533	\N	17
260	2024-09-26 08:15:16.668196	\N	16
5	2024-08-27 08:47:03.362775	\N	8
379	2025-07-11 06:12:42.493587	\N	10
294	2024-11-17 08:46:09.926858	\N	1
298	2024-04-18 14:03:16.158459	\N	18
346	2024-04-08 08:34:38.794654	\N	1
256	2025-07-30 07:30:24.800119	\N	15
290	2025-09-21 09:04:34.184989	\N	17
168	2024-05-20 23:45:00.413871	\N	14
34	2026-04-13 04:43:20.415732	\N	6
104	2024-08-13 13:55:56.462731	\N	7
10	2025-06-02 16:19:30.07931	\N	8
217	2024-10-07 09:44:03.70954	\N	2
74	2025-11-19 04:47:10.284315	\N	2
360	2025-04-10 07:35:03.943832	\N	11
201	2026-04-06 09:11:23.440757	\N	9
77	2024-01-18 12:12:22.519756	\N	13
29	2025-02-14 08:58:40.217467	\N	9
395	2025-07-27 15:18:27.369596	\N	17
323	2023-11-10 21:24:10.11635	\N	2
394	2025-03-06 00:39:53.954935	\N	1
75	2024-01-16 09:06:25.405566	\N	9
345	2025-09-19 16:38:14.15785	\N	4
81	2025-05-15 16:41:33.858847	\N	20
372	2025-08-10 19:10:45.685751	\N	1
371	2023-10-12 04:22:51.869596	\N	4
206	2024-04-19 20:28:14.057357	\N	11
162	2025-07-21 01:34:05.975696	\N	15
276	2024-01-25 16:48:09.105969	\N	19
219	2026-08-29 23:20:00.569257	\N	12
3	2026-05-30 09:44:40.441171	\N	1
116	2024-05-31 01:35:18.300023	\N	15
108	2026-06-17 18:14:13.137422	\N	3
71	2025-10-10 14:28:15.44938	\N	6
331	2024-12-28 19:04:11.026657	\N	4
108	2025-11-21 12:49:16.745246	\N	3
223	2023-11-27 13:42:00.585663	\N	17
43	2024-03-21 13:31:58.410422	\N	3
71	2024-06-14 03:20:13.377164	\N	16
53	2026-08-31 21:31:09.283884	\N	19
361	2024-02-07 08:50:30.637091	\N	20
339	2026-09-07 21:22:46.282032	\N	12
142	2023-12-27 20:23:08.233403	\N	5
71	2026-04-01 05:50:29.559859	\N	1
257	2023-12-26 12:26:21.797987	\N	13
385	2024-03-04 13:14:29.357891	\N	5
272	2026-02-10 03:03:06.05742	\N	17
26	2026-07-13 08:31:33.065189	\N	6
305	2024-11-30 23:42:11.276217	\N	14
62	2024-01-21 02:29:00.660341	\N	8
65	2024-07-03 17:57:59.315576	\N	19
264	2025-03-28 07:18:11.697366	\N	14
96	2024-07-28 14:45:44.340441	\N	18
66	2026-05-08 02:10:05.705792	\N	14
363	2026-06-07 01:02:57.751868	\N	8
318	2024-10-12 23:33:24.036425	\N	8
210	2024-05-13 16:20:17.969775	\N	7
367	2026-06-08 17:27:39.94976	\N	15
164	2025-07-17 01:08:44.408894	\N	15
289	2023-11-26 02:55:51.71674	\N	13
122	2024-12-28 00:18:20.37334	\N	14
21	2026-08-13 02:47:22.774797	\N	8
151	2024-03-30 18:30:04.736128	\N	20
171	2026-03-07 18:15:30.529629	\N	20
377	2026-02-20 08:13:30.288103	\N	18
109	2024-02-10 03:15:40.914654	\N	9
217	2025-11-27 09:12:02.597174	\N	13
42	2023-11-19 21:25:30.857778	\N	20
40	2024-12-01 10:16:26.974059	\N	2
312	2023-12-04 14:02:04.146171	\N	9
71	2026-01-24 22:43:27.564552	\N	20
254	2025-02-13 02:57:26.808092	\N	16
259	2024-03-11 13:04:10.979175	\N	13
219	2025-07-26 02:53:24.792578	\N	3
195	2024-09-09 18:06:11.522161	\N	12
51	2026-05-03 18:59:25.569786	\N	14
256	2024-09-23 17:21:40.560963	\N	18
134	2024-05-25 23:53:56.448154	\N	9
159	2024-03-29 20:21:45.032812	\N	9
378	2024-04-03 19:57:37.751135	\N	7
364	2024-08-30 03:40:28.650963	\N	2
333	2024-11-08 11:01:42.24375	\N	5
24	2025-11-19 21:58:37.824852	\N	16
389	2026-06-29 09:12:33.95127	\N	18
351	2025-05-26 16:33:36.270941	\N	10
225	2024-06-20 00:07:13.178353	\N	16
377	2025-05-01 11:44:55.68634	\N	4
223	2024-04-03 18:33:32.551864	\N	7
66	2025-07-02 09:10:10.084367	\N	18
346	2024-05-20 05:06:37.430183	\N	14
296	2024-01-25 05:54:30.372459	\N	14
318	2024-10-03 00:55:04.302955	\N	13
222	2026-07-27 00:04:22.039559	\N	4
40	2025-08-06 14:50:32.362696	\N	11
340	2024-11-03 19:07:51.432876	\N	1
227	2025-04-28 17:03:48.052693	\N	3
213	2024-03-27 16:10:12.479026	\N	9
115	2024-02-01 09:30:42.34963	\N	4
387	2024-08-13 13:39:50.943996	\N	6
289	2023-12-11 14:09:44.80173	\N	4
31	2024-10-08 16:54:47.503443	\N	6
39	2024-01-02 20:31:46.828381	\N	2
182	2025-07-17 18:01:32.574103	\N	12
211	2025-10-26 22:07:10.910217	\N	7
322	2023-10-03 13:18:25.745883	\N	20
301	2026-06-18 10:24:45.348959	\N	15
257	2024-02-12 00:19:13.839065	\N	6
44	2026-03-08 19:59:54.239794	\N	7
389	2024-09-08 05:10:31.960421	\N	17
299	2025-11-09 21:51:57.002575	\N	6
213	2024-05-03 13:17:41.020774	\N	9
91	2026-03-09 10:47:54.261195	\N	2
71	2025-04-23 18:50:26.90036	\N	18
68	2024-03-10 00:54:30.343209	\N	20
173	2026-07-27 17:48:16.126975	\N	7
241	2026-06-10 13:58:24.988311	\N	5
193	2023-12-03 18:00:01.700519	\N	14
343	2025-02-02 19:32:37.619477	\N	4
99	2025-01-05 03:02:59.482225	\N	17
335	2024-03-11 17:16:06.35658	\N	3
6	2025-12-30 14:29:30.531012	\N	6
356	2024-03-20 07:48:42.350877	\N	9
32	2023-11-07 01:30:30.033595	\N	18
213	2024-04-12 16:59:32.017907	\N	12
296	2026-08-05 13:43:47.129689	\N	10
155	2026-04-03 18:40:18.454242	\N	1
73	2025-12-25 04:49:06.843766	\N	3
187	2026-01-04 13:55:54.940179	\N	3
131	2025-10-27 12:30:43.58268	\N	6
87	2023-11-19 09:03:28.598608	\N	5
334	2026-09-11 06:46:28.773972	\N	20
140	2026-03-09 20:47:20.055504	\N	1
358	2026-05-05 09:06:36.509468	\N	16
114	2025-08-16 11:25:00.139949	\N	13
163	2025-03-22 03:09:08.886542	\N	3
214	2024-11-12 06:35:19.829766	\N	19
327	2025-11-05 21:48:46.46855	\N	17
346	2023-12-10 14:26:06.664601	\N	10
71	2024-07-11 01:05:56.772134	\N	2
198	2025-10-02 13:47:56.263858	\N	12
351	2025-05-30 08:43:41.515933	\N	4
246	2025-02-15 09:37:48.958647	\N	16
305	2024-08-07 18:25:27.841899	\N	14
68	2025-12-18 13:36:20.990294	\N	14
363	2024-10-06 04:55:31.545849	\N	4
48	2026-09-16 17:38:18.203779	\N	13
380	2023-09-26 18:53:44.001004	\N	13
261	2026-04-30 18:32:01.761505	\N	7
330	2026-04-02 20:57:41.5575	\N	14
73	2024-06-27 01:59:27.829137	\N	9
399	2025-05-13 01:47:52.638861	\N	13
361	2025-12-07 08:08:56.615089	\N	10
254	2026-07-10 16:30:40.968338	\N	14
16	2024-09-11 15:41:54.781971	\N	5
130	2024-12-24 08:15:30.59051	\N	10
167	2024-02-11 03:45:03.116845	\N	10
353	2026-04-02 02:39:15.023965	\N	15
31	2023-10-04 15:48:50.567132	\N	14
10	2025-08-30 03:46:17.499951	\N	17
210	2025-09-05 04:09:52.891513	\N	16
187	2025-11-16 09:57:42.370757	\N	6
60	2023-12-23 02:59:39.211617	\N	16
162	2023-12-28 23:59:13.273347	\N	4
114	2025-05-09 02:56:51.604182	\N	14
396	2026-07-26 22:49:36.351245	\N	16
381	2024-09-28 00:10:03.568249	\N	1
31	2026-06-24 22:31:29.108753	\N	14
385	2026-01-16 15:44:31.439663	\N	9
391	2024-11-08 14:32:11.897078	\N	6
127	2023-12-21 12:04:42.600604	\N	4
330	2026-01-19 10:13:33.107721	\N	13
57	2026-05-17 00:06:17.901738	\N	14
180	2024-03-11 03:23:25.437167	\N	7
96	2024-01-16 21:59:27.979946	\N	16
184	2024-05-18 05:14:18.214435	\N	12
393	2024-12-24 03:24:05.42607	\N	14
248	2024-11-19 05:14:51.287341	\N	3
146	2026-08-16 18:39:41.447552	\N	3
185	2025-01-16 02:13:01.215531	\N	20
315	2025-09-23 02:57:56.994845	\N	13
230	2025-12-24 14:20:41.159306	\N	5
244	2024-07-18 09:31:46.964566	\N	7
350	2024-08-07 00:50:34.187037	\N	5
32	2025-08-30 02:15:50.378594	\N	3
114	2025-07-21 11:31:02.706921	\N	5
264	2026-02-28 10:16:05.582513	\N	6
360	2026-08-12 07:33:53.012914	\N	19
162	2026-07-19 10:41:53.490218	\N	11
384	2023-11-26 05:31:03.893769	\N	4
94	2025-12-26 18:50:24.32006	\N	9
109	2025-02-09 08:01:06.517545	\N	10
360	2024-07-24 06:09:02.083457	\N	18
106	2024-09-15 06:38:08.696316	\N	2
13	2024-07-22 06:48:24.410669	\N	17
255	2025-07-02 03:37:10.637719	\N	11
123	2024-03-07 17:26:44.784392	\N	12
176	2025-11-22 01:40:55.234295	\N	16
63	2023-10-09 06:42:43.483892	\N	3
26	2024-05-25 02:09:32.287019	\N	5
23	2025-03-26 18:29:19.367041	\N	13
107	2026-07-02 10:20:34.215362	\N	12
169	2024-01-22 11:48:12.633715	\N	7
123	2026-05-28 10:28:30.181519	\N	11
272	2026-08-18 17:07:38.092041	\N	19
121	2024-09-05 00:53:06.393103	\N	15
300	2025-03-03 21:38:48.567582	\N	7
274	2024-05-10 22:05:58.591257	\N	1
366	2026-01-09 16:51:06.124583	\N	10
220	2026-06-30 12:54:24.184208	\N	10
38	2025-04-21 00:02:39.642	\N	11
6	2025-07-27 17:27:03.919989	\N	19
128	2024-07-25 00:35:55.791691	\N	18
176	2025-07-01 16:25:06.301759	\N	14
313	2026-09-10 09:57:49.557169	\N	18
138	2025-05-29 06:08:20.329921	\N	18
45	2026-02-01 23:19:59.580007	\N	5
11	2025-05-18 20:25:08.145673	\N	11
328	2026-01-23 11:55:05.481426	\N	20
105	2024-08-20 17:44:53.821914	\N	11
144	2023-10-26 17:53:17.666421	\N	9
62	2025-11-06 21:33:53.588632	\N	19
320	2025-12-11 02:16:58.834381	\N	11
338	2026-05-27 22:21:15.899277	\N	17
179	2025-12-29 19:59:12.529384	\N	13
252	2025-02-18 17:37:19.132829	\N	9
387	2025-05-05 04:31:58.847931	\N	5
36	2024-04-04 08:43:11.427144	\N	9
386	2026-04-15 00:59:19.170548	\N	13
13	2025-06-27 16:19:55.961098	\N	9
289	2025-11-01 17:28:10.957732	\N	11
286	2024-01-24 01:56:43.755145	\N	19
3	2025-03-02 05:20:13.158758	\N	15
55	2024-07-03 23:52:24.078954	\N	1
361	2024-12-09 02:25:45.739704	\N	7
256	2024-06-06 06:13:41.997857	\N	14
67	2024-09-21 16:35:32.692817	\N	9
309	2023-10-04 14:35:44.527992	\N	2
169	2024-07-13 13:08:28.283355	\N	18
61	2025-02-24 17:26:24.756546	\N	8
290	2026-05-09 14:23:44.648525	\N	15
393	2023-10-07 09:07:35.259232	\N	7
120	2024-07-09 14:11:42.299317	\N	3
228	2025-09-05 07:04:20.40439	\N	3
384	2026-06-05 03:35:25.569472	\N	19
228	2023-10-12 18:01:06.098759	\N	12
278	2025-12-11 21:50:29.96442	\N	17
372	2025-06-27 18:27:47.716469	\N	19
107	2024-09-02 21:58:54.117576	\N	16
340	2023-12-02 21:19:31.953949	\N	3
69	2025-02-21 07:55:38.900544	\N	11
122	2026-05-06 14:33:16.563612	\N	20
46	2024-09-08 08:01:19.763656	\N	1
395	2025-11-29 20:09:01.307695	\N	3
350	2026-07-21 01:51:57.591012	\N	10
217	2024-06-19 04:22:13.699568	\N	2
132	2024-08-29 20:31:50.124402	\N	9
107	2024-06-04 05:57:12.994342	\N	20
183	2025-12-14 05:02:18.074546	\N	7
251	2024-12-28 19:26:40.750483	\N	17
322	2026-03-15 01:48:10.531791	\N	10
77	2023-11-02 23:46:14.123123	\N	6
204	2026-05-23 17:30:53.805692	\N	11
132	2026-02-16 08:58:33.854654	\N	14
358	2026-08-21 00:26:20.153312	\N	15
116	2024-11-02 22:17:30.738538	\N	3
186	2025-12-19 07:52:06.256172	\N	15
301	2025-02-08 08:46:04.48004	\N	10
171	2026-01-25 07:51:35.045972	\N	7
387	2025-07-04 13:20:55.905222	\N	5
148	2024-03-31 21:38:11.092502	\N	9
88	2026-06-05 18:24:32.052228	\N	12
153	2025-07-02 13:29:13.312324	\N	10
256	2025-12-30 08:56:12.951862	\N	14
39	2024-10-16 10:50:07.938512	\N	10
267	2024-11-12 05:22:12.908244	\N	15
151	2025-11-10 18:48:11.329833	\N	17
313	2024-11-07 00:35:14.444485	\N	15
127	2024-06-23 18:19:43.181054	\N	14
392	2026-01-07 01:06:21.570676	\N	10
119	2023-09-22 12:49:08.642069	\N	5
119	2024-05-10 14:54:40.316133	\N	6
324	2026-02-02 21:06:24.256362	\N	5
94	2025-08-03 22:22:33.723886	\N	9
315	2025-02-24 03:43:29.708418	\N	17
31	2025-06-09 11:13:23.329108	\N	6
58	2024-05-21 16:44:54.732941	\N	1
113	2024-09-09 21:06:12.292776	\N	3
106	2025-06-11 02:27:27.29753	\N	19
290	2025-05-14 03:30:46.951203	\N	14
234	2024-11-15 14:27:21.261574	\N	6
244	2025-05-09 08:04:09.468143	\N	13
284	2023-12-13 15:42:23.038658	\N	16
184	2024-10-03 00:14:00.513465	\N	1
285	2025-10-22 20:16:29.849676	\N	3
253	2024-11-13 18:40:02.235966	\N	15
185	2025-05-22 18:20:40.845627	\N	20
260	2024-05-19 12:09:25.23026	\N	16
14	2026-08-18 11:17:06.516378	\N	9
195	2023-12-02 17:30:50.796687	\N	14
155	2024-08-28 17:31:44.460302	\N	4
131	2024-04-09 19:47:20.721961	\N	15
377	2025-09-08 22:55:08.152195	\N	3
243	2024-01-30 09:14:04.586527	\N	7
370	2025-04-11 22:45:53.05923	\N	1
157	2024-11-28 06:07:18.078019	\N	3
68	2025-12-25 23:43:18.486463	\N	14
152	2024-04-06 23:32:49.014224	\N	17
178	2026-03-21 03:28:17.79137	\N	4
334	2024-09-04 17:36:42.148054	\N	4
207	2024-11-10 15:18:39.456156	\N	3
91	2026-05-08 00:28:13.301514	\N	19
249	2025-04-25 16:40:50.345279	\N	16
210	2026-08-02 23:57:12.102549	\N	10
272	2025-06-29 18:42:18.003794	\N	17
173	2026-03-06 07:44:33.439938	\N	9
308	2025-04-04 14:37:17.825802	\N	11
230	2026-04-17 17:18:56.187376	\N	3
223	2025-11-14 13:19:22.900855	\N	11
144	2025-06-10 14:12:48.801026	\N	18
381	2024-11-05 08:04:33.00121	\N	2
305	2024-11-19 16:23:40.189092	\N	19
247	2024-12-12 17:34:08.077601	\N	20
151	2025-11-02 16:55:11.931228	\N	4
363	2026-01-13 14:48:23.001894	\N	5
285	2025-10-18 12:25:45.419915	\N	1
40	2025-05-14 17:59:58.718962	\N	19
360	2025-05-06 03:13:21.859308	\N	16
288	2025-08-09 07:38:35.849265	\N	13
95	2024-04-23 13:45:06.802066	\N	20
299	2026-09-05 12:56:27.705521	\N	5
173	2025-04-27 14:17:47.517184	\N	6
272	2023-11-20 02:36:58.909679	\N	2
60	2026-04-08 19:59:07.150185	\N	10
394	2024-03-30 02:01:47.417152	\N	10
331	2024-06-30 21:36:19.334302	\N	15
266	2026-08-04 20:59:15.162951	\N	19
343	2024-07-16 08:22:09.632934	\N	5
343	2026-07-22 08:51:10.41344	\N	9
292	2025-01-01 21:49:38.842994	\N	5
89	2024-08-21 04:37:44.050208	\N	7
96	2024-11-28 11:13:15.576398	\N	6
120	2025-09-05 01:07:50.347441	\N	3
360	2024-08-14 15:46:12.117193	\N	10
28	2024-10-11 14:50:08.411322	\N	10
103	2025-03-22 17:58:36.068902	\N	1
250	2025-05-23 10:24:50.954992	\N	18
267	2024-07-28 19:27:48.934875	\N	16
148	2025-11-24 07:59:34.708893	\N	10
314	2025-12-13 22:48:30.604078	\N	20
134	2026-01-10 04:43:28.99772	\N	7
262	2025-02-03 05:30:23.564952	\N	8
148	2023-12-11 09:23:11.082332	\N	19
158	2025-08-30 23:35:50.355813	\N	14
63	2026-04-30 13:10:38.214675	\N	10
118	2024-05-29 00:13:01.488003	\N	13
326	2025-01-30 17:32:07.242329	\N	12
28	2023-09-23 21:59:36.458839	\N	15
44	2025-05-05 01:58:01.533814	\N	4
53	2026-07-14 06:38:03.717378	\N	19
82	2025-04-22 14:34:12.377305	\N	15
316	2025-10-23 03:12:00.937899	\N	15
228	2024-03-15 08:45:08.619702	\N	14
315	2024-05-13 06:40:05.380533	\N	3
134	2026-05-13 08:17:11.456642	\N	7
303	2024-04-02 21:07:59.094049	\N	16
263	2023-12-22 14:45:57.56503	\N	13
19	2025-01-27 05:40:08.372521	\N	1
331	2024-02-19 14:32:43.041982	\N	17
58	2024-04-05 06:18:49.402249	\N	11
57	2024-02-11 22:38:58.274329	\N	4
115	2023-11-27 14:06:48.62225	\N	2
155	2026-06-12 15:55:01.837246	\N	8
244	2025-09-12 13:16:04.807499	\N	14
356	2025-11-06 12:15:05.628763	\N	7
320	2025-08-11 17:53:28.562771	\N	6
149	2023-10-27 05:01:18.014751	\N	18
320	2025-05-15 02:06:50.060353	\N	20
332	2026-08-02 11:05:49.540472	\N	1
395	2024-11-12 17:16:07.775198	\N	3
\.


--
-- Name: accesos accesos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accesos
    ADD CONSTRAINT accesos_pkey PRIMARY KEY (id_punto_acceso);


--
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id_area);


--
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id_categoria);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_usuario);


--
-- Name: corresponde corresponde_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.corresponde
    ADD CONSTRAINT corresponde_pkey PRIMARY KEY (id_reserva, id_evento);


--
-- Name: cuentas cuentas_id_usuario_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas
    ADD CONSTRAINT cuentas_id_usuario_key UNIQUE (id_usuario);


--
-- Name: cuentas cuentas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas
    ADD CONSTRAINT cuentas_pkey PRIMARY KEY (id_cuenta);


--
-- Name: cuentas cuentas_usuario_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas
    ADD CONSTRAINT cuentas_usuario_key UNIQUE (usuario);


--
-- Name: empleados empleados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (id_usuario);


--
-- Name: eventos eventos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventos
    ADD CONSTRAINT eventos_pkey PRIMARY KEY (id_evento);


--
-- Name: incidentes incidentes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentes
    ADD CONSTRAINT incidentes_pkey PRIMARY KEY (id_incidente);


--
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id_log);


--
-- Name: maquinas maquinas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maquinas
    ADD CONSTRAINT maquinas_pkey PRIMARY KEY (id_maquina);


--
-- Name: notificaciones notificaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT notificaciones_pkey PRIMARY KEY (id_notificacion);


--
-- Name: otorga otorga_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otorga
    ADD CONSTRAINT otorga_pkey PRIMARY KEY (id_categoria);


--
-- Name: promociones promociones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promociones
    ADD CONSTRAINT promociones_pkey PRIMARY KEY (id_promocion);


--
-- Name: puntos puntos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puntos
    ADD CONSTRAINT puntos_pkey PRIMARY KEY (id_usuario, fecha_hora);


--
-- Name: reservas reservas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_pkey PRIMARY KEY (id_reserva);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id_rol);


--
-- Name: usuarios usuarios_dni_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key UNIQUE (dni);


--
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- Name: visitas visitas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visitas
    ADD CONSTRAINT visitas_pkey PRIMARY KEY (id_usuario, fecha_hora_entrada);


--
-- Name: accesos accesos_id_area_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accesos
    ADD CONSTRAINT accesos_id_area_fkey FOREIGN KEY (id_area) REFERENCES public.areas(id_area);


--
-- Name: clientes clientes_id_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES public.categorias(id_categoria);


--
-- Name: clientes clientes_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);


--
-- Name: corresponde corresponde_id_evento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.corresponde
    ADD CONSTRAINT corresponde_id_evento_fkey FOREIGN KEY (id_evento) REFERENCES public.eventos(id_evento);


--
-- Name: corresponde corresponde_id_reserva_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.corresponde
    ADD CONSTRAINT corresponde_id_reserva_fkey FOREIGN KEY (id_reserva) REFERENCES public.reservas(id_reserva);


--
-- Name: cuentas cuentas_id_rol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas
    ADD CONSTRAINT cuentas_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES public.roles(id_rol);


--
-- Name: cuentas cuentas_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas
    ADD CONSTRAINT cuentas_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);


--
-- Name: empleados empleados_id_area_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_id_area_fkey FOREIGN KEY (id_area) REFERENCES public.areas(id_area);


--
-- Name: empleados empleados_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);


--
-- Name: incidentes incidentes_id_area_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentes
    ADD CONSTRAINT incidentes_id_area_fkey FOREIGN KEY (id_area) REFERENCES public.areas(id_area);


--
-- Name: incidentes incidentes_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentes
    ADD CONSTRAINT incidentes_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.empleados(id_usuario);


--
-- Name: logs logs_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.empleados(id_usuario);


--
-- Name: maquinas maquinas_id_area_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maquinas
    ADD CONSTRAINT maquinas_id_area_fkey FOREIGN KEY (id_area) REFERENCES public.areas(id_area);


--
-- Name: notificaciones notificaciones_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT notificaciones_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);


--
-- Name: otorga otorga_id_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otorga
    ADD CONSTRAINT otorga_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES public.categorias(id_categoria);


--
-- Name: otorga otorga_id_promocion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otorga
    ADD CONSTRAINT otorga_id_promocion_fkey FOREIGN KEY (id_promocion) REFERENCES public.promociones(id_promocion);


--
-- Name: puntos puntos_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puntos
    ADD CONSTRAINT puntos_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.clientes(id_usuario);


--
-- Name: reservas reservas_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.clientes(id_usuario);


--
-- Name: visitas visitas_id_punto_acceso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visitas
    ADD CONSTRAINT visitas_id_punto_acceso_fkey FOREIGN KEY (id_punto_acceso) REFERENCES public.accesos(id_punto_acceso);


--
-- Name: visitas visitas_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visitas
    ADD CONSTRAINT visitas_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.clientes(id_usuario);


--
-- Name: TABLE accesos; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.accesos TO auditor;


--
-- Name: TABLE areas; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.areas TO auditor;


--
-- Name: TABLE categorias; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.categorias TO auditor;


--
-- Name: TABLE clientes; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.clientes TO auditor;


--
-- Name: TABLE corresponde; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.corresponde TO auditor;


--
-- Name: TABLE cuentas; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.cuentas TO auditor;


--
-- Name: TABLE empleados; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.empleados TO auditor;
GRANT SELECT,INSERT,UPDATE ON TABLE public.empleados TO rrhh;


--
-- Name: TABLE eventos; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.eventos TO auditor;


--
-- Name: TABLE incidentes; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.incidentes TO auditor;


--
-- Name: TABLE logs; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.logs TO auditor;


--
-- Name: TABLE maquinas; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.maquinas TO auditor;


--
-- Name: TABLE notificaciones; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.notificaciones TO auditor;


--
-- Name: TABLE otorga; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.otorga TO auditor;


--
-- Name: TABLE promociones; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.promociones TO auditor;


--
-- Name: TABLE puntos; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.puntos TO auditor;


--
-- Name: TABLE reservas; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.reservas TO auditor;


--
-- Name: TABLE roles; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.roles TO auditor;
GRANT SELECT ON TABLE public.roles TO rrhh;


--
-- Name: TABLE usuarios; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.usuarios TO auditor;


--
-- Name: TABLE visitas; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.visitas TO auditor;


--
-- PostgreSQL database dump complete
--

\unrestrict wA2driMd0dbesvWvAe0IMyHyQDPDM6M0kRFSiyhzVHy0xscpsVlRrtPiX96qZox

