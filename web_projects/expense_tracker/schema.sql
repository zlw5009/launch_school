--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.expenses DROP CONSTRAINT expenses_user_id_fkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT uniq_email;
ALTER TABLE ONLY public.expenses DROP CONSTRAINT expenses_pkey;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.expenses ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users;
DROP SEQUENCE public.expenses_id_seq;
DROP TABLE public.expenses;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: Zach
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO "Zach";

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: Zach
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: expenses; Type: TABLE; Schema: public; Owner: Zach
--

CREATE TABLE expenses (
    id integer NOT NULL,
    user_id integer NOT NULL,
    name text NOT NULL,
    amount numeric(10,2) NOT NULL,
    due_date date,
    paid boolean DEFAULT false
);


ALTER TABLE expenses OWNER TO "Zach";

--
-- Name: expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: Zach
--

CREATE SEQUENCE expenses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expenses_id_seq OWNER TO "Zach";

--
-- Name: expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Zach
--

ALTER SEQUENCE expenses_id_seq OWNED BY expenses.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: Zach
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(25) NOT NULL
);


ALTER TABLE users OWNER TO "Zach";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: Zach
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO "Zach";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Zach
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Zach
--

ALTER TABLE ONLY expenses ALTER COLUMN id SET DEFAULT nextval('expenses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Zach
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: Zach
--



--
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Zach
--

SELECT pg_catalog.setval('expenses_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Zach
--



--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Zach
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Name: expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: Zach
--

ALTER TABLE ONLY expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- Name: uniq_email; Type: CONSTRAINT; Schema: public; Owner: Zach
--

ALTER TABLE ONLY users
    ADD CONSTRAINT uniq_email UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: Zach
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: expenses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Zach
--

ALTER TABLE ONLY expenses
    ADD CONSTRAINT expenses_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- PostgreSQL database dump complete
--

