TRUNCATE categories RESTART IDENTITY CASCADE;
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

TRUNCATE criteresspeciaux RESTART IDENTITY CASCADE;
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

TRUNCATE critereseval RESTART IDENTITY CASCADE;
INSERT INTO critereseval(libcourt, liblong, tri) VALUES ('Accueil', 'Accueil',1);
INSERT INTO critereseval(libcourt, liblong, tri) VALUES ('Ambiance', 'Ambiance générale du bar',2);
INSERT INTO critereseval(libcourt, liblong, tri) VALUES ('Tarif', 'Tarif ',3);
INSERT INTO critereseval(libcourt, liblong, tri) VALUES ('Qualite', 'Qualité du service et des consommations',4);
INSERT INTO critereseval(libcourt, liblong, tri) VALUES ('Note Globale', 'Appréciation générale du bar',5);

TRUNCATE villes;
INSERT INTO villes(ville, cp) VALUES ('Lyon 1', '69001');
INSERT INTO villes(ville, cp) VALUES ('Lyon 2', '69002');
INSERT INTO villes(ville, cp) VALUES ('Lyon 3', '69003');
INSERT INTO villes(ville, cp) VALUES ('Lyon 4', '69004');
INSERT INTO villes(ville, cp) VALUES ('Lyon 5', '69005');
INSERT INTO villes(ville, cp) VALUES ('Lyon 6', '69006');
INSERT INTO villes(ville, cp) VALUES ('Lyon 7', '69007');
INSERT INTO villes(ville, cp) VALUES ('Lyon 8', '69008');
INSERT INTO villes(ville, cp) VALUES ('Lyon 9', '69009');

TRUNCATE jours RESTART IDENTITY CASCADE;
INSERT INTO jours(jour) VALUES ('Lundi');
INSERT INTO jours(jour) VALUES ('Mardi');
INSERT INTO jours(jour) VALUES ('Mercredi');
INSERT INTO jours(jour) VALUES ('Jeudi');
INSERT INTO jours(jour) VALUES ('Vendredi');
INSERT INTO jours(jour) VALUES ('Samedi');
INSERT INTO jours(jour) VALUES ('Dimanche');


