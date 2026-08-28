--
-- PostgreSQL database dump
--

\restrict OAZO8EXbPvAielMqE6UolbjjdmyeFc8UhioPJR60zXOTcHdZrcTPGImfXti0nvh

-- Dumped from database version 16.14 (Debian 16.14-1.pgdg13+1)
-- Dumped by pg_dump version 16.14 (Debian 16.14-1.pgdg13+1)

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
-- Name: products; Type: TABLE; Schema: public; Owner: cloudcart_user
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    price double precision NOT NULL,
    stock integer NOT NULL,
    category character varying,
    image_url character varying
);


ALTER TABLE public.products OWNER TO cloudcart_user;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: cloudcart_user
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO cloudcart_user;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cloudcart_user
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: cloudcart_user
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: cloudcart_user
--

COPY public.products (id, name, description, price, stock, category, image_url) FROM stdin;
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cloudcart_user
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: cloudcart_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: ix_products_id; Type: INDEX; Schema: public; Owner: cloudcart_user
--

CREATE INDEX ix_products_id ON public.products USING btree (id);


--
-- PostgreSQL database dump complete
--

\unrestrict OAZO8EXbPvAielMqE6UolbjjdmyeFc8UhioPJR60zXOTcHdZrcTPGImfXti0nvh

