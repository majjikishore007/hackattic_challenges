--
-- PostgreSQL database dump
--

-- Dumped from database version 10.19 (Debian 10.19-1.pgdg90+1)
-- Dumped by pg_dump version 10.19 (Debian 10.19-1.pgdg90+1)

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = true;

--
-- Name: criminal_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.criminal_records (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    felony character varying(30) NOT NULL,
    ssn character varying(11) NOT NULL,
    home_address character varying(100) NOT NULL,
    entry timestamp without time zone NOT NULL,
    city character varying(100) NOT NULL,
    status character varying(16) NOT NULL
);


ALTER TABLE public.criminal_records OWNER TO postgres;

--
-- Name: criminal_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.criminal_records_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.criminal_records_id_seq OWNER TO postgres;

--
-- Name: criminal_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.criminal_records_id_seq OWNED BY public.criminal_records.id;


--
-- Name: criminal_records id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.criminal_records ALTER COLUMN id SET DEFAULT nextval('public.criminal_records_id_seq'::regclass);


--
-- Data for Name: criminal_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.criminal_records (id, name, felony, ssn, home_address, entry, city, status) FROM stdin;
1	Christopher Olson	Check fraud	744-43-8352	91587 Vazquez Ports	1978-10-17 00:00:00	Georgeshire, AL 21973-6031	terminated
2	Jenny Crawford	Obstruction of justice	551-40-7071	560 Johnson Gardens	1993-10-03 00:00:00	Lake Keithmouth, TN 18079-7577	terminated
3	Cassandra Parks	Larceny	398-83-6338	5848 Jessica Junctions Suite 722	1979-03-26 00:00:00	Lake Darius, VA 55226	terminated
4	Eric Miller	Obstruction of justice	887-86-5877	Unit 3752 Box 0293	1978-11-15 00:00:00	DPO AA 72246	missing
5	Heather Sanders	Burglary	634-77-0467	USNS Frazier	1975-05-09 00:00:00	FPO AE 05346	missing
6	James Martin	Animal cruelty	429-55-2039	75075 Powell Station	2003-05-27 00:00:00	Morganstad, KY 06862-7427	alive
7	Richard Mann	Check fraud	807-09-7613	63684 Zamora Plaza Apt. 500	2001-09-28 00:00:00	Jayfurt, WV 02662-6260	terminated
8	Alexis Oliver	Arson	033-80-7541	1980 Gibson Points Suite 344	1982-04-12 00:00:00	New Loriside, WA 82706	alive
9	Joanna Lamb	Animal cruelty	132-55-2153	0511 Valdez Expressway Suite 935	2013-02-01 00:00:00	West Joshua, NY 90330-8367	alive
10	Misty Shelton	Manslaughter	800-85-2317	80920 Jessica Loaf	2014-10-30 00:00:00	Lawsonville, UT 56672	alive
11	Zachary Douglas	Larceny	859-31-5424	533 Kathryn Lights Suite 640	1996-12-18 00:00:00	Millerburgh, NV 26104-3159	terminated
12	Bryce Powell	Vehicular homicide	719-18-0762	721 Henry Village Apt. 225	1988-04-27 00:00:00	Ericside, AS 36465	missing
13	Nicholas Walters	Tax evasion	656-98-9896	184 Hodge Meadows	1982-11-02 00:00:00	East Edward, NC 86242	missing
14	Bradley Brown	Check fraud	509-76-9168	3831 Reginald Fork	2005-06-03 00:00:00	South Joshua, NE 09477	terminated
15	Gerald Fletcher	Perjury	018-38-8054	820 Christopher Row Apt. 586	2019-02-19 00:00:00	New Heather, MT 50862-4781	alive
16	Jennifer Young	Check fraud	312-21-0721	42214 Davis Extensions	2014-10-22 00:00:00	Smithtown, WA 38233-0582	terminated
17	Kristen Price	Animal cruelty	416-88-6787	1126 Smith Stream Apt. 897	1988-02-09 00:00:00	New Lawrenceborough, ME 01850-3734	terminated
18	Michelle Wallace	Check fraud	334-12-1401	513 Colon Trail	2000-10-19 00:00:00	New Bryanborough, NC 40335-8405	terminated
19	Hector Scott	Check fraud	132-49-1933	01772 Wallace Ridges	2001-01-20 00:00:00	Monicaberg, CO 39043-3439	missing
20	Joseph Clark	Animal cruelty	033-31-9020	37931 Nicole Shores Apt. 065	1997-12-26 00:00:00	Jenniferview, NJ 65875	terminated
21	Theresa Anderson	Manslaughter	110-39-2300	054 Huff Center Apt. 705	1975-07-13 00:00:00	East Eugene, HI 33768	alive
22	Holly Lyons	Tax evasion	217-73-9039	5617 Claudia Course Apt. 128	2005-12-23 00:00:00	Fordmouth, AR 34702	missing
23	Christie Jackson	Arson	754-69-7409	44902 Brooke Stravenue	1997-10-19 00:00:00	Jeffreyberg, NY 03021-4039	terminated
24	Carrie Wilson	Check fraud	250-98-1274	064 Andrew Park	1988-01-17 00:00:00	Port Robert, FM 55564	terminated
25	Clarence Dawson	Burglary	438-79-2517	1587 Watson Corner	1981-06-16 00:00:00	West Bryanstad, MO 17667	missing
26	Sandra Yates	Obstruction of justice	159-65-0902	65347 Pham Mountains Apt. 913	2003-11-19 00:00:00	Jonathonshire, NH 75811-9657	terminated
27	William Young	Larceny	368-31-7757	0421 Vanessa Corners Apt. 197	2010-05-12 00:00:00	Henryview, WA 98791	alive
28	Mr. Thomas Johnson MD	Vehicular homicide	469-26-0495	773 Richardson Fork	1974-06-02 00:00:00	West Brianton, NY 50587	missing
29	David Rice	Perjury	798-54-1327	6218 Tabitha Union Apt. 308	1994-03-16 00:00:00	Michaelshire, OH 57532-2509	alive
30	Gabriella Walters	Animal cruelty	086-76-2432	359 Rebecca Center	1971-04-18 00:00:00	North Susan, DC 93900-6661	alive
31	Christine Cook	Animal cruelty	338-98-2450	3466 Caleb Extension	1995-07-20 00:00:00	Destinymouth, IN 23031-9685	missing
32	David Smith	Vehicular homicide	019-80-2037	5312 Castillo Mission	2003-05-04 00:00:00	Hayleyhaven, OR 40514-0119	missing
33	Lori Anderson	Obstruction of justice	586-99-8018	46774 Burton Falls	2015-07-28 00:00:00	West Danaport, OK 04031	missing
34	Rebecca Velez	Check fraud	183-63-4348	USS Lee	1990-03-12 00:00:00	FPO AA 19780-2384	terminated
35	Thomas Andrews	Check fraud	022-64-7400	747 Andrew Bypass	1991-03-01 00:00:00	Toddland, OR 35188	alive
36	Aaron Jones	Check fraud	210-79-5400	678 Hernandez Drive Suite 636	2002-05-05 00:00:00	Bakermouth, GU 70185-3194	missing
37	Taylor House	Arson	322-42-2298	38874 William Mountains	1994-05-21 00:00:00	North Danielleton, GU 82331-6547	terminated
38	Kara White	Vehicular homicide	630-91-4537	38051 John Drive	1989-04-16 00:00:00	Sarahview, ID 99172-7962	alive
39	Marie Perkins	Arson	733-45-2124	1458 Natalie Divide Suite 155	2009-10-24 00:00:00	West Michelle, IL 89156-0366	alive
40	Sheena Murphy	Vehicular homicide	495-48-6276	2084 Gregory Street Apt. 660	1991-06-25 00:00:00	Matthewshire, IA 53181	missing
41	Michael Frank	Obstruction of justice	553-18-6638	53102 Conway Extension	1980-02-14 00:00:00	West Amyborough, NY 83879	alive
42	Lisa Dodson	Arson	342-48-2778	4112 Brandy Port	2013-11-17 00:00:00	Faulknerbury, OH 00070	alive
43	Cindy Cox	Arson	584-27-0854	383 Chris Island	1983-04-21 00:00:00	Oliverville, NH 62103	missing
44	Mariah Stark	Check fraud	798-10-2043	Unit 1568 Box 6556	1997-04-16 00:00:00	DPO AE 94335	missing
45	Catherine Higgins	Animal cruelty	168-82-2521	399 James Flat	1996-02-13 00:00:00	Lake Angela, AK 63176	terminated
46	Scott Garza	Vehicular homicide	730-58-5829	55139 Newton Point Apt. 973	1984-12-18 00:00:00	Wisemouth, ID 12547	terminated
47	Richard Johnson	Animal cruelty	166-56-1562	86234 Myers Rue	1972-09-01 00:00:00	East Travis, KY 20941	terminated
48	Dennis Hernandez	Burglary	079-57-3940	5818 Johnson Light Suite 175	2021-08-02 00:00:00	Davidsonfurt, MH 90177-6234	missing
49	Timothy Craig	Burglary	043-21-6674	72434 Evans Circles Apt. 588	1993-03-23 00:00:00	North Lorraine, WA 22482	missing
50	Ricky Gonzalez	Manslaughter	482-83-9288	898 Jackson Spring	2000-09-13 00:00:00	Elizabethbury, SC 69078-0712	terminated
51	Jennifer Schneider	Arson	527-43-7364	058 Cortez Parkways Apt. 285	2016-08-14 00:00:00	East Randy, MP 09876-2526	alive
52	Margaret Sanders	Perjury	290-36-9206	850 Carson Union Suite 544	1977-07-23 00:00:00	New Margaretmouth, OH 51597-4891	alive
53	Tiffany Wright	Perjury	717-21-8524	72213 Brendan Manor Suite 487	2000-05-10 00:00:00	Youngburgh, PR 09395	missing
54	Victoria Hahn	Manslaughter	894-68-8477	15360 James Loaf Apt. 533	2002-03-25 00:00:00	Morrismouth, CO 73553-5373	missing
55	Christina Williams	Vehicular homicide	088-58-8814	769 Huffman Vista	1974-03-05 00:00:00	Wernerchester, MP 71562-5349	terminated
56	Samuel Mccall	Tax evasion	132-45-3240	751 Kennedy Cape Apt. 820	1992-03-09 00:00:00	Caitlinborough, ID 55717-1397	alive
57	Ashley Camacho	Burglary	668-22-2794	04845 Joel Harbors Suite 394	1978-03-02 00:00:00	Walshchester, CT 90244	missing
58	Deanna Ramos	Larceny	414-15-2609	00756 Roy Forge Suite 452	1970-12-20 00:00:00	North Rebecca, AS 17879	missing
59	Ian Hansen	Animal cruelty	806-37-8401	31254 Barbara Way	1986-07-20 00:00:00	Port Lucasside, NV 51775-7383	alive
60	Christopher Russo	Arson	757-24-9425	66791 Lloyd Bridge	2010-04-06 00:00:00	Thomasbury, SC 96842	alive
61	Brian Lester	Animal cruelty	008-31-4704	71654 Chelsey Mountains Apt. 681	1972-05-04 00:00:00	North Jordanshire, TN 39629	terminated
62	Briana Murray	Manslaughter	602-26-9479	291 Sandra Bridge	1970-11-11 00:00:00	Brendafurt, WI 95555	alive
63	Tracy Martin	Perjury	392-96-7818	961 Kevin Mountains	2003-02-16 00:00:00	East Kristiemouth, NJ 74088-8117	missing
64	Nicholas Sweeney	Check fraud	186-57-3607	6345 Albert Pass Apt. 590	2006-11-06 00:00:00	East Davidmouth, GA 19476-1232	missing
65	Robert Ellis	Animal cruelty	772-10-9055	3607 Melissa Ports Apt. 452	1991-11-13 00:00:00	North Michelle, MD 85307	alive
66	Kaitlyn Adams	Burglary	356-57-6391	0705 Micheal Junction	1972-03-23 00:00:00	New Bruceshire, NC 72343-1176	terminated
67	Joseph Lopez	Obstruction of justice	082-01-2801	144 Jensen Stream	1992-03-03 00:00:00	New Ronaldstad, TX 79200	alive
68	Marc Rosario	Burglary	757-26-0848	54869 Long Mills	1989-07-19 00:00:00	South Dawn, NM 88177-8272	alive
69	Ronald Thompson	Animal cruelty	565-82-2191	Unit 6723 Box 1824	1990-11-11 00:00:00	DPO AP 63750-0595	terminated
70	William Lane	Perjury	721-74-8483	6351 Daniel Harbor Apt. 678	2020-07-28 00:00:00	West Robin, WY 41240	alive
71	Mrs. Pamela Joyce	Obstruction of justice	117-67-3014	04118 Jason Estate Suite 945	2014-09-26 00:00:00	Valentineville, WA 47268	missing
72	Christopher Mcgee	Obstruction of justice	842-32-2525	874 Danielle Glens	2001-12-31 00:00:00	West Ericport, GU 35003-4930	terminated
73	Mia Cook	Manslaughter	358-80-9665	1008 Amanda Center Suite 942	2009-09-07 00:00:00	West Tracey, NM 13889-3729	alive
\.


--
-- Name: criminal_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.criminal_records_id_seq', 73, true);


--
-- Name: criminal_records criminal_records_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.criminal_records
    ADD CONSTRAINT criminal_records_pk PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

