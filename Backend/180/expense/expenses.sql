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

ALTER TABLE ONLY public.expenses DROP CONSTRAINT expenses_pkey;
ALTER TABLE public.expenses ALTER COLUMN id DROP DEFAULT;
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
    amount numeric(6,2) NOT NULL,
    memo text NOT NULL,
    created_on date NOT NULL,
    CONSTRAINT postive_amount CHECK ((amount >= 0.01))
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
-- Name: id; Type: DEFAULT; Schema: public; Owner: Zach
--

ALTER TABLE ONLY expenses ALTER COLUMN id SET DEFAULT nextval('expenses_id_seq'::regclass);


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: Zach
--

INSERT INTO expenses VALUES (1, 14.56, 'Pencils', '2016-08-03');
INSERT INTO expenses VALUES (2, 1256.95, 'Macbook Pro', '2016-08-03');
INSERT INTO expenses VALUES (3, 872.46, 'Desk and Chair', '2016-08-03');
INSERT INTO expenses VALUES (4, 15.60, 'add', '2016-08-03');
INSERT INTO expenses VALUES (5, 15.60, 'Fuel', '2016-08-03');


--
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Zach
--

SELECT pg_catalog.setval('expenses_id_seq', 5, true);


--
-- Name: expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: Zach
--

ALTER TABLE ONLY expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

