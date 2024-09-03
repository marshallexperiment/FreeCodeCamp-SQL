--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id bigint NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    size_in_light_years integer NOT NULL,
    number_of_stars integer NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id bigint NOT NULL,
    name character varying(100) NOT NULL,
    planet_id bigint NOT NULL,
    mass_in_earth_masses numeric(10,3) NOT NULL,
    is_habitable boolean NOT NULL,
    distance_from_planet integer NOT NULL,
    number_of_craters integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id bigint NOT NULL,
    name character varying(100) NOT NULL,
    star_id bigint NOT NULL,
    mass_in_earth_masses numeric(10,2) NOT NULL,
    has_life boolean NOT NULL,
    distance_from_star integer NOT NULL,
    orbital_period integer NOT NULL,
    atmosphere text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: spaceship; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spaceship (
    spaceship_id bigint NOT NULL,
    name character varying(100) NOT NULL,
    capacity integer NOT NULL,
    number_of_missions integer NOT NULL,
    fuel_type character varying(50) NOT NULL,
    current_location text
);


ALTER TABLE public.spaceship OWNER TO freecodecamp;

--
-- Name: spaceship_spaceship_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.spaceship ALTER COLUMN spaceship_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.spaceship_spaceship_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id bigint NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id bigint NOT NULL,
    type character varying(50) NOT NULL,
    mass_in_solar_masses numeric(10,2) NOT NULL,
    age_in_billion_years integer NOT NULL,
    luminosity integer NOT NULL,
    is_visible boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (1, 'Milky Way', 'Spiral', 100000, 250000000, 'Our home galaxy');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (2, 'Andromeda', 'Spiral', 220000, 1000000000, 'Closest spiral galaxy to the Milky Way');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (3, 'Triangulum', 'Spiral', 60000, 40000000, 'Third largest in the Local Group');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (4, 'Whirlpool', 'Spiral', 76000, 160000000, 'Famous for its interaction with a nearby dwarf galaxy');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (5, 'Sombrero', 'Elliptical', 50000, 80000000, 'Known for its bright nucleus and large central bulge');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (6, 'Messier 87', 'Elliptical', 980000, 1200000000, 'Home to a supermassive black hole');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 'Moon', 1, 0.012, false, 384400, 1000);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 'Phobos', 2, 0.000, false, 9377, 100);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 'Deimos', 2, 0.000, false, 23458, 50);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 'Europa', 3, 0.008, false, 670900, 500);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 'Ganymede', 3, 0.025, false, 1070400, 2000);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 'Callisto', 3, 0.018, false, 1882700, 3000);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 'Io', 3, 0.015, false, 421700, 400);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 'Titan', 3, 0.023, false, 1221870, 800);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 'Triton', 3, 0.004, false, 354800, 120);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 'Mimas', 3, 0.000, false, 185540, 150);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 'Oberon', 3, 0.000, false, 583520, 170);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 'Miranda', 3, 0.000, false, 129390, 130);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 'Titania', 3, 0.000, false, 436270, 600);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 'Proxima b I', 5, 0.003, false, 371000, 90);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 'Proxima b II', 5, 0.000, false, 51000, 40);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 'Alpha Centauri Bb I', 6, 0.001, false, 280000, 110);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 'Sirius b I', 7, 0.007, false, 850000, 130);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 'Betelgeuse c I', 8, 0.001, false, 420000, 70);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 'Kepler-22b I', 10, 0.002, false, 940000, 300);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 'GJ 1214 b I', 11, 0.006, false, 140000, 80);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (1, 'Earth', 1, 1.00, true, 1, 365, 'Nitrogen, Oxygen');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (2, 'Mars', 1, 0.11, false, 2, 687, 'Carbon Dioxide');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (3, 'Jupiter', 1, 317.80, false, 5, 4333, 'Hydrogen, Helium');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (4, 'Venus', 1, 0.82, false, 1, 225, 'Carbon Dioxide, Nitrogen');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (5, 'Proxima b', 6, 1.17, true, 0, 11, 'Unknown');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, 'Alpha Centauri Bb', 2, 1.13, false, 1, 250, 'Unknown');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, 'Sirius b', 3, 1.05, false, 1, 100, 'Unknown');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, 'Betelgeuse c', 4, 5.60, false, 10, 10000, 'Hydrogen');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 'Rigel d', 5, 1.09, false, 9, 20000, 'Unknown');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, 'HD 189733 b', 6, 1.15, false, 1, 500, 'Methane');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, 'Kepler-22b', 6, 2.38, false, 0, 290, 'Unknown');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, 'GJ 1214 b', 6, 6.55, false, 0, 40, 'Water vapor');


--
-- Data for Name: spaceship; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spaceship OVERRIDING SYSTEM VALUE VALUES (1, 'Enterprise', 1000, 50, 'Antimatter', 'Orbiting Earth');
INSERT INTO public.spaceship OVERRIDING SYSTEM VALUE VALUES (2, 'Falcon', 6, 100, 'Hyperdrive', 'Orbiting Tatooine');
INSERT INTO public.spaceship OVERRIDING SYSTEM VALUE VALUES (3, 'Discovery One', 5, 10, 'Nuclear', 'Near Jupiter');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (1, 'Sun', 1, 'G-type', 1.00, 4, 1, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (2, 'Alpha Centauri A', 2, 'G-type', 1.10, 5, 2, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (3, 'Sirius', 1, 'A-type', 2.02, 0, 25, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (4, 'Betelgeuse', 1, 'M-type', 18.00, 8, 100000, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (5, 'Rigel', 1, 'B-type', 21.00, 8, 85000, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (6, 'Proxima Centauri', 2, 'M-type', 0.12, 4, 0, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: spaceship_spaceship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spaceship_spaceship_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: spaceship spaceship_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceship
    ADD CONSTRAINT spaceship_name_key UNIQUE (name);


--
-- Name: spaceship spaceship_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceship
    ADD CONSTRAINT spaceship_pkey PRIMARY KEY (spaceship_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

