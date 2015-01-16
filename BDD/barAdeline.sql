--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.5
-- Dumped by pg_dump version 9.3.5
-- Started on 2015-01-16 11:48:27


--truncate adresses restart identity cascade

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF-8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 2035 (class 0 OID 57351)
-- Dependencies: 172
-- Data for Name: adresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO adresses (idadresse, voie, cp, latitude, longitude) VALUES (1, '12 rue Sainte Catherine', '69001', 45.768081, 4.833417);
INSERT INTO adresses (idadresse, voie, cp, latitude, longitude) VALUES (4, '41, quai P. Scize', '69009', NULL, NULL);
INSERT INTO adresses (idadresse, voie, cp, latitude, longitude) VALUES (5, '20, Quai Arloing', '69009', NULL, NULL);
INSERT INTO adresses (idadresse, voie, cp, latitude, longitude) VALUES (6, '3, rue de la Baleine', '69005', NULL, NULL);
INSERT INTO adresses (idadresse, voie, cp, latitude, longitude) VALUES (7, '6 rue de Cuire', '69004', NULL, NULL);
INSERT INTO adresses (idadresse, voie, cp, latitude, longitude) VALUES (8, '8, rue R. Leynaud', '69001', NULL, NULL);
INSERT INTO adresses (idadresse, voie, cp, latitude, longitude) VALUES (9, '47, quai Rambaud', '69002', NULL, NULL);


--
-- TOC entry 2059 (class 0 OID 0)
-- Dependencies: 171
-- Name: adresses_idadresse_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('adresses_idadresse_seq', 9, true);


--
-- TOC entry 2037 (class 0 OID 57367)
-- Dependencies: 174
-- Data for Name: bars; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO bars (idbar, idadresse, nom, numtel, site, description) VALUES (1, 1, 'The Albion', '0644050479', 'www.thealbion.fr', 'Sans ta Guinness je vacille, ton ambiance est indescriptible.');
INSERT INTO bars (idbar, idadresse, nom, numtel, site, description) VALUES (4, 4, 'L''adresse', '0478289755', 'www.ladresselyon.com', 'Importé des grandes capitales nocturnes (Londres, New york, Paris), le premier concept de bar-bourse est né à Lyon, à l''Adresse.
Oubliés le cac 40, l''indice NIkkai ou les tristes actions Euro-Tunnel, maintenant votre portefeuille boursier s''articule autour d''une coupe de champagne, d''un Martini, ou d''un cocktail.
Sur un écran plasma, les boissons devenues des valeurs boursières font la valse des prix toutes les 90secondes.
Ainsi, un verre peut passer de 3 à 12 euros en quelques minutes, sans oubliés les innombrables Krächs boursiers!
Un concept innovant et ludique à faire consommer même le plus convaincu des anti-capitalistes !');
INSERT INTO bars (idbar, idadresse, nom, numtel, site, description) VALUES (5, 5, 'Le Pas Sage', '0899235991', '', 'Bar Antillais, ambiance caliente garantie !

Midi : 10 - 15 euros
Soir : 10 - 15 euros');
INSERT INTO bars (idbar, idadresse, nom, numtel, site, description) VALUES (6, 6, 'Le Florian', '0478422437', 'www.le-florian.fr', 'Les jupes virevoltent, les esprits se déchaînent et s''abandonnent sur des rythmes jazzy. Les serveurs, complices de l’organisation, donnent le ton et arment les lyonnais désabusés de cocktails détonnants.');
INSERT INTO bars (idbar, idadresse, nom, numtel, site, description) VALUES (7, 7, 'Drôle de Zèbre', '0472070289', 'http://www.droledezebre-cafe.fr/', 'Terrasse au top! Cadre et ambiance sympas. Musiques au choix! Situé juste à côté du Métro Croix-Rousse');
INSERT INTO bars (idbar, idadresse, nom, numtel, site, description) VALUES (8, 8, 'Moi j''m''en fous, je triche !', '0469701300', 'www.debitdejeux.fr', 'Des jeux de plateau adaptés à tous âges, des pépites comme on n’en trouve nulle part ailleurs.
Tarif adulte : 6 € /an - Carte famille : 12 € /an pour 2 adultes et 2 enfant - Tarif enfant : 3 € /an');
INSERT INTO bars (idbar, idadresse, nom, numtel, site, description) VALUES (9, 9, 'Péniche Loupika', '0984362821', 'www.loupka.com', 'Venez profiter de la vue panoramique de la terrasse du Loupika tout le week-end, et n''hésitez pas à laisser vos avis !');


--
-- TOC entry 2060 (class 0 OID 0)
-- Dependencies: 173
-- Name: bars_idbar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bars_idbar_seq', 9, true);


--
-- TOC entry 2045 (class 0 OID 57454)
-- Dependencies: 188
-- Data for Name: categoriesbars; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO categoriesbars (idcatbar, idbar, idcategorie) VALUES (1, 1, 2);
INSERT INTO categoriesbars (idcatbar, idbar, idcategorie) VALUES (2, 1, 4);
INSERT INTO categoriesbars (idcatbar, idbar, idcategorie) VALUES (3, 4, 1);
INSERT INTO categoriesbars (idcatbar, idbar, idcategorie) VALUES (4, 4, 5);
INSERT INTO categoriesbars (idcatbar, idbar, idcategorie) VALUES (5, 5, 8);
INSERT INTO categoriesbars (idcatbar, idbar, idcategorie) VALUES (6, 6, 1);
INSERT INTO categoriesbars (idcatbar, idbar, idcategorie) VALUES (7, 6, 5);
INSERT INTO categoriesbars (idcatbar, idbar, idcategorie) VALUES (8, 7, 1);
INSERT INTO categoriesbars (idcatbar, idbar, idcategorie) VALUES (9, 7, 9);
INSERT INTO categoriesbars (idcatbar, idbar, idcategorie) VALUES (10, 7, 11);
INSERT INTO categoriesbars (idcatbar, idbar, idcategorie) VALUES (11, 7, 16);
INSERT INTO categoriesbars (idcatbar, idbar, idcategorie) VALUES (12, 8, 3);
INSERT INTO categoriesbars (idcatbar, idbar, idcategorie) VALUES (13, 8, 4);
INSERT INTO categoriesbars (idcatbar, idbar, idcategorie) VALUES (14, 8, 5);
INSERT INTO categoriesbars (idcatbar, idbar, idcategorie) VALUES (15, 8, 10);
INSERT INTO categoriesbars (idcatbar, idbar, idcategorie) VALUES (16, 8, 15);
INSERT INTO categoriesbars (idcatbar, idbar, idcategorie) VALUES (17, 9, 5);
INSERT INTO categoriesbars (idcatbar, idbar, idcategorie) VALUES (18, 9, 9);
INSERT INTO categoriesbars (idcatbar, idbar, idcategorie) VALUES (19, 9, 15);


--
-- TOC entry 2061 (class 0 OID 0)
-- Dependencies: 187
-- Name: categoriesbars_idcatbar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categoriesbars_idcatbar_seq', 19, true);


--
-- TOC entry 2047 (class 0 OID 57480)
-- Dependencies: 192
-- Data for Name: criteresbars; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO criteresbars (idcriterebar, idbar, idcritere) VALUES (1, 1, 19);
INSERT INTO criteresbars (idcriterebar, idbar, idcritere) VALUES (2, 1, 5);
INSERT INTO criteresbars (idcriterebar, idbar, idcritere) VALUES (3, 4, 1);
INSERT INTO criteresbars (idcriterebar, idbar, idcritere) VALUES (4, 4, 11);
INSERT INTO criteresbars (idcriterebar, idbar, idcritere) VALUES (5, 4, 19);
INSERT INTO criteresbars (idcriterebar, idbar, idcritere) VALUES (6, 5, 9);
INSERT INTO criteresbars (idcriterebar, idbar, idcritere) VALUES (7, 5, 19);
INSERT INTO criteresbars (idcriterebar, idbar, idcritere) VALUES (8, 6, 9);
INSERT INTO criteresbars (idcriterebar, idbar, idcritere) VALUES (9, 6, 14);
INSERT INTO criteresbars (idcriterebar, idbar, idcritere) VALUES (10, 6, 19);
INSERT INTO criteresbars (idcriterebar, idbar, idcritere) VALUES (11, 7, 1);
INSERT INTO criteresbars (idcriterebar, idbar, idcritere) VALUES (12, 7, 4);
INSERT INTO criteresbars (idcriterebar, idbar, idcritere) VALUES (13, 7, 8);
INSERT INTO criteresbars (idcriterebar, idbar, idcritere) VALUES (14, 7, 19);
INSERT INTO criteresbars (idcriterebar, idbar, idcritere) VALUES (15, 8, 2);
INSERT INTO criteresbars (idcriterebar, idbar, idcritere) VALUES (16, 8, 6);
INSERT INTO criteresbars (idcriterebar, idbar, idcritere) VALUES (17, 9, 1);
INSERT INTO criteresbars (idcriterebar, idbar, idcritere) VALUES (18, 9, 6);
INSERT INTO criteresbars (idcriterebar, idbar, idcritere) VALUES (19, 9, 9);
INSERT INTO criteresbars (idcriterebar, idbar, idcritere) VALUES (20, 9, 11);
INSERT INTO criteresbars (idcriterebar, idbar, idcritere) VALUES (21, 9, 13);
INSERT INTO criteresbars (idcriterebar, idbar, idcritere) VALUES (22, 9, 19);


--
-- TOC entry 2062 (class 0 OID 0)
-- Dependencies: 191
-- Name: criteresbars_idcriterebar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('criteresbars_idcriterebar_seq', 22, true);


--
-- TOC entry 2041 (class 0 OID 57409)
-- Dependencies: 180
-- Data for Name: critiques; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO critiques (idcritique, idbar, comm, datecomm) VALUES (1, 1, 'Superbe', '9999-12-31 23:59:59');
INSERT INTO critiques (idcritique, idbar, comm, datecomm) VALUES (2, 4, 'Bonne ambiance, les serveuses sont souriantes. Et le concept est original! ', '2015-01-16 10:12:28.41');
INSERT INTO critiques (idcritique, idbar, comm, datecomm) VALUES (3, 5, 'Bar à tapas très sympas', '2015-01-16 10:17:05.882');
INSERT INTO critiques (idcritique, idbar, comm, datecomm) VALUES (4, 5, 'Ambiance conviviale', '2015-01-16 10:20:38.055');
INSERT INTO critiques (idcritique, idbar, comm, datecomm) VALUES (5, 6, 'Des cocktails qui font rêver, une ambiance très cosy et baroque.', '2015-01-16 10:38:57.207');
INSERT INTO critiques (idcritique, idbar, comm, datecomm) VALUES (6, 6, 'Bar très cosy', '2015-01-16 10:39:20.208');
INSERT INTO critiques (idcritique, idbar, comm, datecomm) VALUES (7, 7, 'L''intérieur est super mimi, un peu cosy, très girly. J''ai adoré la déco des toilettes des dames .... venez y jeter un œil ...', '2015-01-16 10:58:38.951');
INSERT INTO critiques (idcritique, idbar, comm, datecomm) VALUES (8, 8, 'Concept de bar très sympas !', '2015-01-16 11:06:15.794');
INSERT INTO critiques (idcritique, idbar, comm, datecomm) VALUES (9, 8, 'Moi, j''men fous j''adore la triche! Ce lieu est parfait pour les jeux de société, ils sont tous récents et bien expliqués. L''ambiance est joyeuse et un peu bruyante mais pouvoir manger et boire un coup en jouant, ça c''est cool ', '2015-01-16 11:07:08.074');


--
-- TOC entry 2063 (class 0 OID 0)
-- Dependencies: 179
-- Name: critiques_idcritique_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('critiques_idcritique_seq', 9, true);


--
-- TOC entry 2043 (class 0 OID 57433)
-- Dependencies: 184
-- Data for Name: evaluations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (1, 1, 1, 4);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (2, 1, 2, 3);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (3, 1, 3, 5);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (4, 1, 4, 5);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (5, 1, 5, 2);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (6, 2, 1, 4);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (7, 2, 2, 3);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (8, 2, 3, 5);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (9, 2, 4, 4);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (10, 2, 5, 5);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (11, 3, 1, 4);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (12, 3, 2, 2);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (13, 3, 3, 5);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (14, 3, 4, 3);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (15, 3, 5, 4);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (16, 4, 1, 2);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (17, 4, 2, 3);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (18, 4, 3, 5);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (19, 4, 4, 2);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (20, 4, 5, 4);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (21, 5, 1, 2);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (22, 5, 2, 4);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (23, 5, 3, 5);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (24, 5, 4, 3);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (25, 5, 5, 5);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (26, 6, 1, 4);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (27, 6, 2, 3);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (28, 6, 3, 4);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (29, 6, 4, 4);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (30, 6, 5, 4);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (31, 7, 1, 4);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (32, 7, 2, 4);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (33, 7, 3, 4);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (34, 7, 4, 4);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (35, 7, 5, 4);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (36, 9, 1, 4);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (37, 9, 2, 4);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (38, 9, 3, 4);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (39, 9, 4, 4);
INSERT INTO evaluations (ideval, idcritique, idcriteval, note) VALUES (40, 9, 5, 4);


--
-- TOC entry 2064 (class 0 OID 0)
-- Dependencies: 183
-- Name: evaluations_ideval_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('evaluations_ideval_seq', 40, true);


--
-- TOC entry 2039 (class 0 OID 57391)
-- Dependencies: 178
-- Data for Name: horaires; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO horaires (idhoraire, idbar, idjour, heuredebut, heurefin) VALUES (1, 1, 1, '12:30:00', '23:30:00');
INSERT INTO horaires (idhoraire, idbar, idjour, heuredebut, heurefin) VALUES (2, 1, 2, '09:30:00', '12:30:00');
INSERT INTO horaires (idhoraire, idbar, idjour, heuredebut, heurefin) VALUES (3, 1, 2, '14:30:00', '23:30:00');
INSERT INTO horaires (idhoraire, idbar, idjour, heuredebut, heurefin) VALUES (4, 1, 3, '14:30:00', '23:30:00');
INSERT INTO horaires (idhoraire, idbar, idjour, heuredebut, heurefin) VALUES (5, 1, 4, '14:30:00', '23:30:00');
INSERT INTO horaires (idhoraire, idbar, idjour, heuredebut, heurefin) VALUES (6, 1, 5, '14:30:00', '01:30:00');
INSERT INTO horaires (idhoraire, idbar, idjour, heuredebut, heurefin) VALUES (7, 1, 6, '14:30:00', '01:30:00');
INSERT INTO horaires (idhoraire, idbar, idjour, heuredebut, heurefin) VALUES (8, 1, 7, '14:30:00', '01:30:00');


--
-- TOC entry 2065 (class 0 OID 0)
-- Dependencies: 177
-- Name: horaires_idhoraire_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('horaires_idhoraire_seq', 8, true);


-- Completed on 2015-01-16 11:48:28

--
-- PostgreSQL database dump complete
--
