--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-03-21 10:38:54

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
-- TOC entry 3337 (class 1262 OID 16464)
-- Name: crypto; Type: DATABASE; Schema: -; Owner: Admin
--

CREATE DATABASE crypto WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';


ALTER DATABASE crypto OWNER TO "Admin";

\connect crypto

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
-- TOC entry 215 (class 1259 OID 16471)
-- Name: crypto; Type: TABLE; Schema: public; Owner: Admin
--

CREATE TABLE public.crypto (
    crypto_id uuid NOT NULL,
    name character varying(50) NOT NULL,
    value numeric(50,0) NOT NULL,
    icon character varying(255),
    asset character varying(10) NOT NULL,
    stock numeric(50,0) NOT NULL
);


ALTER TABLE public.crypto OWNER TO "Admin";

--
-- TOC entry 214 (class 1259 OID 16465)
-- Name: users; Type: TABLE; Schema: public; Owner: Admin
--

CREATE TABLE public.users (
    user_id uuid NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    name character varying(50) NOT NULL,
    surname1 character varying(50) NOT NULL,
    surname2 character varying(50),
    birthdate date NOT NULL,
    funds numeric(10,0) DEFAULT '0'::numeric NOT NULL
);


ALTER TABLE public.users OWNER TO "Admin";

--
-- TOC entry 216 (class 1259 OID 16476)
-- Name: users_cryptos; Type: TABLE; Schema: public; Owner: Admin
--

CREATE TABLE public.users_cryptos (
    user_id uuid NOT NULL,
    crypto_id uuid NOT NULL,
    amount numeric(50,0) NOT NULL
);


ALTER TABLE public.users_cryptos OWNER TO "Admin";

--
-- TOC entry 3330 (class 0 OID 16471)
-- Dependencies: 215
-- Data for Name: crypto; Type: TABLE DATA; Schema: public; Owner: Admin
--

INSERT INTO public.crypto (crypto_id, name, value, icon, asset, stock) VALUES ('18a60c12-2358-49ae-a1c1-986e2f299e25', 'BTC', 23000, 'NO ICON', 'BTC', 1000);


--
-- TOC entry 3329 (class 0 OID 16465)
-- Dependencies: 214
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Admin
--



--
-- TOC entry 3331 (class 0 OID 16476)
-- Dependencies: 216
-- Data for Name: users_cryptos; Type: TABLE DATA; Schema: public; Owner: Admin
--



--
-- TOC entry 3184 (class 2606 OID 16475)
-- Name: crypto crypto_pkey; Type: CONSTRAINT; Schema: public; Owner: Admin
--

ALTER TABLE ONLY public.crypto
    ADD CONSTRAINT crypto_pkey PRIMARY KEY (crypto_id);


--
-- TOC entry 3182 (class 2606 OID 16470)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: Admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3186 (class 2606 OID 16480)
-- Name: users_cryptos usr_crpt; Type: CONSTRAINT; Schema: public; Owner: Admin
--

ALTER TABLE ONLY public.users_cryptos
    ADD CONSTRAINT usr_crpt PRIMARY KEY (user_id, crypto_id);


-- Completed on 2023-03-21 10:38:54

--
-- PostgreSQL database dump complete
--

