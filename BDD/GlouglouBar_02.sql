insert into categories (categoriebar) VALUES ('Bar festif');
insert into categories (categoriebar) VALUES ('Pub');
insert into categories (categoriebar) VALUES ('Bar à vin');
insert into categories (categoriebar) VALUES ('Bar à bière');
insert into categories (categoriebar) VALUES ('Bar à cocktail');
insert into categories (categoriebar) VALUES ('Bar lounge');
insert into categories (categoriebar) VALUES ('Bar à concert');
insert into categories (categoriebar) VALUES ('Bar à tapas');
insert into categories (categoriebar) VALUES ('Café bar');
insert into categories (categoriebar) VALUES ('Bar à shooters');
insert into categories (categoriebar) VALUES ('Bar dansant');
insert into categories (categoriebar) VALUES ('Bar à whisky');
insert into categories (categoriebar) VALUES ('Irish Pub');
insert into categories (categoriebar) VALUES ('Bar Jazzy');
insert into categories (categoriebar) VALUES ('Bar after work');
insert into categories (categoriebar) VALUES ('Bar gay');
insert into categories (categoriebar) VALUES ('Bar lesbien');


insert into criteresspeciaux(critere) VALUES ('Terrasse');
insert into criteresspeciaux(critere) VALUES ('Accès Handicapé');
insert into criteresspeciaux(critere) VALUES ('Brunch');
insert into criteresspeciaux(critere) VALUES ('Gay friendly');
insert into criteresspeciaux(critere) VALUES ('Musique live');
insert into criteresspeciaux(critere) VALUES ('Ouvert le dimanche');
insert into criteresspeciaux(critere) VALUES ('Retransmission foot');
insert into criteresspeciaux(critere) VALUES ('Apéros/Planches');
insert into criteresspeciaux(critere) VALUES ('Au bord de l eau');
insert into criteresspeciaux(critere) VALUES ('Décoration originale');
insert into criteresspeciaux(critere) VALUES ('Privatisation pour groupes');
insert into criteresspeciaux(critere) VALUES ('Enterrement de vie de garçon/jeune fille');
insert into criteresspeciaux(critere) VALUES ('Espace fumeur');
insert into criteresspeciaux(critere) VALUES ('Ouvert après 1h');
insert into criteresspeciaux(critere) VALUES ('Plat du jour');
insert into criteresspeciaux(critere) VALUES ('Retransmission évènements');
insert into criteresspeciaux(critere) VALUES ('Sportifs');
insert into criteresspeciaux(critere) VALUES ('Avec piscine');
insert into criteresspeciaux(critere) VALUES ('Connexion Wifi');


INSERT INTO critereseval(libcourt, liblong, tri) VALUES ('Accueil', 'Accueil',1);
INSERT INTO critereseval(libcourt, liblong, tri) VALUES ('Ambiance', 'Ambiance générale du bar',2);
INSERT INTO critereseval(libcourt, liblong, tri) VALUES ('Tarif', 'Tarif ',3);
INSERT INTO critereseval(libcourt, liblong, tri) VALUES ('Qualite', 'Qualité du service et des consommations',4);
INSERT INTO critereseval(libcourt, liblong, tri) VALUES ('Note Globale', 'Appréciation générale du bar',5);


INSERT INTO villes(ville, cp) VALUES ('Lyon 1', '69001');
INSERT INTO villes(ville, cp) VALUES ('Lyon 2', '69002');
INSERT INTO villes(ville, cp) VALUES ('Lyon 3', '69003');
INSERT INTO villes(ville, cp) VALUES ('Lyon 4', '69004');
INSERT INTO villes(ville, cp) VALUES ('Lyon 5', '69005');
INSERT INTO villes(ville, cp) VALUES ('Lyon 6', '69006');
INSERT INTO villes(ville, cp) VALUES ('Lyon 7', '69007');
INSERT INTO villes(ville, cp) VALUES ('Lyon 8', '69008');
INSERT INTO villes(ville, cp) VALUES ('Lyon 9', '69009');


INSERT INTO jours(jour) VALUES ('Lundi');
INSERT INTO jours(jour) VALUES ('Mardi');
INSERT INTO jours(jour) VALUES ('Mercredi');
INSERT INTO jours(jour) VALUES ('Jeudi');
INSERT INTO jours(jour) VALUES ('Vendredi');
INSERT INTO jours(jour) VALUES ('Samedi');
INSERT INTO jours(jour) VALUES ('Dimanche');

-- TOC entry 2020 (class 0 OID 43845)
-- Dependencies: 194
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO images (idimage, idbar, nomimage, isprincipal) VALUES (1, 1, '1.jpg', true);
INSERT INTO images (idimage, idbar, nomimage, isprincipal) VALUES (2, 1, '1-ec530172-3e2a-4a48-86bc-7da8306836b0.jpg', false);
INSERT INTO images (idimage, idbar, nomimage, isprincipal) VALUES (6, 4, '4.jpg', true);
INSERT INTO images (idimage, idbar, nomimage, isprincipal) VALUES (7, 4, '4-bdcdcada-3554-45f4-a614-5f94797ba755.jpg', false);
INSERT INTO images (idimage, idbar, nomimage, isprincipal) VALUES (8, 5, '5.jpg', true);
INSERT INTO images (idimage, idbar, nomimage, isprincipal) VALUES (9, 5, '5-f6ed1688-819c-4215-a5c1-e7b5eff3c4a4.jpg', false);
INSERT INTO images (idimage, idbar, nomimage, isprincipal) VALUES (10, 7, '7.jpg', true);
INSERT INTO images (idimage, idbar, nomimage, isprincipal) VALUES (11, 9, '9.jpg', true);
INSERT INTO images (idimage, idbar, nomimage, isprincipal) VALUES (12, 6, '6.jpg', true);
INSERT INTO images (idimage, idbar, nomimage, isprincipal) VALUES (13, 8, '8.jpg', true);


