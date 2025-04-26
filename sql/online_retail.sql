--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-04-26 15:55:57

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
-- TOC entry 217 (class 1259 OID 16548)
-- Name: retail_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.retail_data (
    invoice_no integer,
    stock_code text,
    description text,
    quantity integer,
    invoice_date timestamp without time zone,
    unit_price numeric(10,2),
    customer_id integer,
    country text,
    canceled integer,
    total numeric(10,2)
);


ALTER TABLE public.retail_data OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16597)
-- Name: retail_merged; Type: MATERIALIZED VIEW; Schema: public; Owner: postgres
--

CREATE MATERIALIZED VIEW public.retail_merged AS
 SELECT invoice_no,
    stock_code,
    description,
    quantity,
    invoice_date,
    unit_price,
    customer_id,
    country,
    canceled,
    total,
    ("left"(stock_code, 5))::integer AS stock_code_digit
   FROM public.retail_data
  WHERE (("left"(stock_code, 5) !~ '[A-Za-z ]'::text) AND (customer_id > 0))
  WITH NO DATA;


ALTER MATERIALIZED VIEW public.retail_merged OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16611)
-- Name: popular_products; Type: MATERIALIZED VIEW; Schema: public; Owner: postgres
--

CREATE MATERIALIZED VIEW public.popular_products AS
 SELECT country,
    description,
    count(description) AS sum_desc,
    sum(quantity) AS sum_quantity,
    sum(total) AS sum_total
   FROM public.retail_merged
  GROUP BY country, description
  ORDER BY country, (count(description)) DESC
  WITH NO DATA;


ALTER MATERIALIZED VIEW public.popular_products OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16623)
-- Name: top_products_per_country; Type: MATERIALIZED VIEW; Schema: public; Owner: postgres
--

CREATE MATERIALIZED VIEW public.top_products_per_country AS
 SELECT country,
    description,
    sum_desc,
    sum_quantity,
    sum_total
   FROM ( SELECT popular_products.country,
            popular_products.description,
            popular_products.sum_desc,
            popular_products.sum_quantity,
            popular_products.sum_total,
            row_number() OVER (PARTITION BY popular_products.country ORDER BY popular_products.sum_desc DESC) AS rn
           FROM public.popular_products) ranked
  WHERE (rn = 1)
  WITH NO DATA;


ALTER MATERIALIZED VIEW public.top_products_per_country OWNER TO postgres;

-- Completed on 2025-04-26 15:55:57

--
-- PostgreSQL database dump complete
--

