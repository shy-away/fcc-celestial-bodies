--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
    galaxy_id integer NOT NULL,
    name character varying(40),
    width_lightyears integer NOT NULL,
    description text,
    is_active boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40),
    planet_id integer NOT NULL,
    description text,
    distance_from_planet_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40),
    star_id integer NOT NULL,
    planet_types_id integer NOT NULL,
    description text,
    has_life boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(40),
    description text NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40),
    galaxy_id integer NOT NULL,
    description text,
    width_in_millions_of_km numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 87400, 'Home of the Solar System!', false);
INSERT INTO public.galaxy VALUES (2, 'NGC 4151 (Eye of Sauron)', 0, 'It resembles the Eye of Sauron. The width of this galaxy is unknown.', true);
INSERT INTO public.galaxy VALUES (3, 'ESO 383-76', 1760000, 'This is the largest galaxy ever discovered.', false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 105000, 'This galaxy has a dark dust lane and a central bulge, giving it the appearance of a sombrero.', false);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 170000, 'This spiral galaxy is angled perpendicular to Earth, making it look like a pinwheel to us!', false);
INSERT INTO public.galaxy VALUES (6, 'Peekaboo Galaxy', 5500, 'This galaxy was discovered only once a star, which had been between us and this galaxy, moved out of the way. Peekaboo!', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 3, 'The vibrant flag, once filled with color, now stands white: we now surrender.', 384400);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'This is the larger of the two Martian moons, and it also orbits closer to Mars than the other moon.', 9377);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'This is the smaller of the two Martian moons, and it also orbits farther away from Mars than the other moon.', 23460);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'This is the the third most massive Jovian moon.', 421800);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'This is the the fourth most massive Jovian moon, and the next most massive Jovian moon is four orders of magnitude less massive.', 671100);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'This is the the first most massive Jovian moon.', 1070400);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'This is the the second most massive Jovian moon.', 1882700);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 'This moon has the smallest orbital radius and the shortest orbital period of all of the major Saturnian moons.', 185539);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 'This moon has the second smallest orbital radius of all the major Saturnian moons.', 237948);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 'This moon has the second smallest orbital radius of all the major Saturnian moons.', 294619);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 'This moon has the third smallest orbital radius of all the major Saturnian moons.', 377396);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 'This moon has the third largest orbital radius of all the major Saturnian moons.', 527108);
INSERT INTO public.moon VALUES (13, 'Titan', 6, 'This is the most massive Saturnian moon, accounting for 96% of all of the mass in orbit around Saturn!', 1221870);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 'This moon has the largest orbital radius and the longest orbital period of all of the major Saturnian moons.', 3560820);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, '', 191020);
INSERT INTO public.moon VALUES (16, 'Umbriel', 7, '', 266300);
INSERT INTO public.moon VALUES (17, 'Titania', 7, '', 435910);
INSERT INTO public.moon VALUES (18, 'Oberon', 7, '', 583520);
INSERT INTO public.moon VALUES (19, 'Miranda', 7, '', 129390);
INSERT INTO public.moon VALUES (20, NULL, 3, 'we now surrender.', 0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 1, 'This planet is the closest planet to the Sun.', false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 1, 'This planet has similar gravity to Earth.', false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, 'Hello world!', true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1, 'No little green men here!', false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 2, 'This planet is the largest in the Solar System.', false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 2, 'This planet has a massive ring around it!', false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 2, 'Like Saturn, this planet also has rings. However, its rings are fainter, and because of its over-90-degree tilt, the rings appear sideways!', false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 2, 'This planet is the farthest planet from the Sun, not counting Pluto.', false);
INSERT INTO public.planet VALUES (9, 'LENGTHROAT', 4, 3, 'No little green men here!', NULL);
INSERT INTO public.planet VALUES (10, 'NIGHTFOOD', 5, 3, 'No little green men here!', NULL);
INSERT INTO public.planet VALUES (11, 'HEARTMEAT', 6, 3, 'No little green men here!', NULL);
INSERT INTO public.planet VALUES (12, NULL, 2, 3, 'Hello world!', true);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Rocky', 'A rocky planet is a planet that is not massive enough to keep light gases in its atmosphere');
INSERT INTO public.planet_types VALUES (2, 'Gas Giant', 'A gas giant is a planet that is massive enough to keep light gases in its atmosphere');
INSERT INTO public.planet_types VALUES (3, 'Unknown', 'The atmospheric composition of this planet has yet to be determined');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'This star is at the center of the Solar System.', 0.7);
INSERT INTO public.star VALUES (2, 'Polaris', 1, 'This star is on our axis of rotation, so it appears stationary in the night sky (in the northern hemisphere).', 26.6);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'This star is the brightest star in the night sky.', 2.4);
INSERT INTO public.star VALUES (4, 'Deneb', 1, 'This star is part of the Summer Triangle, and is also the brightest star in the constellation Cygnus.', 140);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'This star is part of the Summer Triangle, and is also the brightest star in the constellation Lyra.', 3.6);
INSERT INTO public.star VALUES (6, 'Altair', 1, 'This star is part of the Summer Triangle, and is also the brightest star in the constellation Aquila.', 1.4);


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
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 3, true);


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
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


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
-- Name: planet planet_planet_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_types_id_fkey FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


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

