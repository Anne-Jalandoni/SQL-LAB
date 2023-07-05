--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Homebrew)
-- Dumped by pg_dump version 14.8 (Homebrew)

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
-- Name: grades; Type: TABLE; Schema: public; Owner: aj22
--

CREATE TABLE public.grades (
    id integer NOT NULL,
    student_github character varying(30) NOT NULL,
    project_title character varying(30) NOT NULL,
    student_grades integer
);


ALTER TABLE public.grades OWNER TO aj22;

--
-- Name: grades_id_seq; Type: SEQUENCE; Schema: public; Owner: aj22
--

CREATE SEQUENCE public.grades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grades_id_seq OWNER TO aj22;

--
-- Name: grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aj22
--

ALTER SEQUENCE public.grades_id_seq OWNED BY public.grades.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: aj22
--

CREATE TABLE public.projects (
    title_id character varying(50) NOT NULL,
    description text NOT NULL,
    max_grade integer NOT NULL
);


ALTER TABLE public.projects OWNER TO aj22;

--
-- Name: students; Type: TABLE; Schema: public; Owner: aj22
--

CREATE TABLE public.students (
    github_id character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL
);


ALTER TABLE public.students OWNER TO aj22;

--
-- Name: grades id; Type: DEFAULT; Schema: public; Owner: aj22
--

ALTER TABLE ONLY public.grades ALTER COLUMN id SET DEFAULT nextval('public.grades_id_seq'::regclass);


--
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: aj22
--

COPY public.grades (id, student_github, project_title, student_grades) FROM stdin;
1	jhacks	Markov	10
2	jhacks	Blockly	2
4	sdeveloper	Blockly	100
5	sdeveloper	Markov	50
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: aj22
--

COPY public.projects (title_id, description, max_grade) FROM stdin;
Markov	Tweets generated from Markov chains	50
Blockly	Programmatic Logic Puzzle Game	100
Elmo	Sesame streets gone wild	100
Yelpish	Yelp clone	95
Sql-data	Make databases	200
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: aj22
--

COPY public.students (github_id, first_name, last_name) FROM stdin;
sdeveloper	Sarah	Developer
jhacks	Jane	Hacker
\.


--
-- Name: grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aj22
--

SELECT pg_catalog.setval('public.grades_id_seq', 5, true);


--
-- Name: grades grades_pkey; Type: CONSTRAINT; Schema: public; Owner: aj22
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: aj22
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (title_id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: aj22
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (github_id);


--
-- Name: grades grades_project_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: aj22
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_project_title_fkey FOREIGN KEY (project_title) REFERENCES public.projects(title_id);


--
-- Name: grades grades_student_github_fkey; Type: FK CONSTRAINT; Schema: public; Owner: aj22
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_student_github_fkey FOREIGN KEY (student_github) REFERENCES public.students(github_id);


--
-- PostgreSQL database dump complete
--

