--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.5
-- Dumped by pg_dump version 9.3.5
-- Started on 2015-01-16 11:18:00

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 2036 (class 0 OID 57351)
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
-- TOC entry 2063 (class 0 OID 0)
-- Dependencies: 171
-- Name: adresses_idadresse_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('adresses_idadresse_seq', 9, true);


--
-- TOC entry 2038 (class 0 OID 57367)
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
-- TOC entry 2064 (class 0 OID 0)
-- Dependencies: 173
-- Name: bars_idbar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bars_idbar_seq', 9, true);


--
-- TOC entry 2044 (class 0 OID 57446)
-- Dependencies: 186
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO categories (idcategorie, categoriebar) VALUES (1, 'Bar festif');
INSERT INTO categories (idcategorie, categoriebar) VALUES (2, 'Pub');
INSERT INTO categories (idcategorie, categoriebar) VALUES (3, 'Bar à vin');
INSERT INTO categories (idcategorie, categoriebar) VALUES (4, 'Bar à bière');
INSERT INTO categories (idcategorie, categoriebar) VALUES (5, 'Bar à cocktail');
INSERT INTO categories (idcategorie, categoriebar) VALUES (6, 'Bar lounge');
INSERT INTO categories (idcategorie, categoriebar) VALUES (7, 'Bar à concert');
INSERT INTO categories (idcategorie, categoriebar) VALUES (8, 'Bar à tapas');
INSERT INTO categories (idcategorie, categoriebar) VALUES (9, 'Café bar');
INSERT INTO categories (idcategorie, categoriebar) VALUES (10, 'Bar à shooters');
INSERT INTO categories (idcategorie, categoriebar) VALUES (11, 'Bar dansant');
INSERT INTO categories (idcategorie, categoriebar) VALUES (12, 'Bar à whisky');
INSERT INTO categories (idcategorie, categoriebar) VALUES (13, 'Irish Pub');
INSERT INTO categories (idcategorie, categoriebar) VALUES (14, 'Bar Jazzy');
INSERT INTO categories (idcategorie, categoriebar) VALUES (15, 'Bar after work');
INSERT INTO categories (idcategorie, categoriebar) VALUES (16, 'Bar gay');
INSERT INTO categories (idcategorie, categoriebar) VALUES (17, 'Bar lesbien');


--
-- TOC entry 2065 (class 0 OID 0)
-- Dependencies: 185
-- Name: categories_idcategorie_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categories_idcategorie_seq', 17, true);


--
-- TOC entry 2046 (class 0 OID 57454)
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
-- TOC entry 2066 (class 0 OID 0)
-- Dependencies: 187
-- Name: categoriesbars_idcatbar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categoriesbars_idcatbar_seq', 19, true);


--
-- TOC entry 2050 (class 0 OID 57480)
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
-- TOC entry 2067 (class 0 OID 0)
-- Dependencies: 191
-- Name: criteresbars_idcriterebar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('criteresbars_idcriterebar_seq', 22, true);


--
-- TOC entry 2048 (class 0 OID 57472)
-- Dependencies: 190
-- Data for Name: criteresspeciaux; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO criteresspeciaux (idcritere, critere) VALUES (1, 'Terrasse');
INSERT INTO criteresspeciaux (idcritere, critere) VALUES (2, 'Accès Handicapé');
INSERT INTO criteresspeciaux (idcritere, critere) VALUES (3, 'Brunch');
INSERT INTO criteresspeciaux (idcritere, critere) VALUES (4, 'Gay friendly');
INSERT INTO criteresspeciaux (idcritere, critere) VALUES (5, 'Musique live');
INSERT INTO criteresspeciaux (idcritere, critere) VALUES (6, 'Ouvert le dimanche');
INSERT INTO criteresspeciaux (idcritere, critere) VALUES (7, 'Retransmission foot');
INSERT INTO criteresspeciaux (idcritere, critere) VALUES (8, 'Apéros/Planches');
INSERT INTO criteresspeciaux (idcritere, critere) VALUES (9, 'Au bord de l eau');
INSERT INTO criteresspeciaux (idcritere, critere) VALUES (10, 'Décoration originale');
INSERT INTO criteresspeciaux (idcritere, critere) VALUES (11, 'Privatisation pour groupes');
INSERT INTO criteresspeciaux (idcritere, critere) VALUES (12, 'Enterrement de vie de garçon/jeune fille');
INSERT INTO criteresspeciaux (idcritere, critere) VALUES (13, 'Espace fumeur');
INSERT INTO criteresspeciaux (idcritere, critere) VALUES (14, 'Ouvert après 1h');
INSERT INTO criteresspeciaux (idcritere, critere) VALUES (15, 'Plat du jour');
INSERT INTO criteresspeciaux (idcritere, critere) VALUES (16, 'Retransmission évènements');
INSERT INTO criteresspeciaux (idcritere, critere) VALUES (17, 'Sportifs');
INSERT INTO criteresspeciaux (idcritere, critere) VALUES (18, 'Avec piscine');
INSERT INTO criteresspeciaux (idcritere, critere) VALUES (19, 'Connexion Wifi');


--
-- TOC entry 2068 (class 0 OID 0)
-- Dependencies: 189
-- Name: criteresspeciaux_idcritere_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('criteresspeciaux_idcritere_seq', 19, true);


--
-- TOC entry 2040 (class 0 OID 57409)
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
-- TOC entry 2069 (class 0 OID 0)
-- Dependencies: 179
-- Name: critiques_idcritique_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('critiques_idcritique_seq', 9, true);


--
-- TOC entry 2042 (class 0 OID 57433)
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
-- TOC entry 2070 (class 0 OID 0)
-- Dependencies: 183
-- Name: evaluations_ideval_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('evaluations_ideval_seq', 40, true);


-- Completed on 2015-01-16 11:18:00

--
-- PostgreSQL database dump complete
--

