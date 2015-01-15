
insert into adresses(voie, cp, latitude, longitude) VALUES ('12 rue Sainte Catherine','69001','45.768081','4.833417');

insert into bars(idadresse, nom, numtel,site,description) VALUES ('1','The Albion', '0644050479','www.thealbion.fr','Sans ta Guinness je vacille, ton ambiance est indescriptible.' );

insert into critiques(idbar, comm, datecomm) VALUES ('1','Superbe', '9999-12-31 23:59:59');

insert into evaluations(idcritique, idcriteval, note) VALUES ('1','1','4');
insert into evaluations(idcritique, idcriteval, note) VALUES ('1','2','3');
insert into evaluations(idcritique, idcriteval, note) VALUES ('1','3','5');
insert into evaluations(idcritique, idcriteval, note) VALUES ('1','4','5');
insert into evaluations(idcritique, idcriteval, note) VALUES ('1','5','2');

insert into categoriesbars(idbar, idcategorie) VALUES ('1','2');
insert into categoriesbars(idbar, idcategorie) VALUES ('1','4');

insert into criteresbars(idbar, idcritere) VALUES ('1', '19');
insert into criteresbars(idbar, idcritere) VALUES ('1', '5');

insert into horaires(idbar, idjour, heuredebut, heurefin) VALUES ('1', '1', time '12:30' , time '23:30');
insert into horaires(idbar, idjour, heuredebut, heurefin) VALUES ('1', '2', time '9:30' , time '12:30');
insert into horaires(idbar, idjour, heuredebut, heurefin) VALUES ('1', '2', time '14:30' , time '23:30');
insert into horaires(idbar, idjour, heuredebut, heurefin) VALUES ('1', '3', time '14:30' , time '23:30');
insert into horaires(idbar, idjour, heuredebut, heurefin) VALUES ('1', '4', time '14:30' , time '23:30');
insert into horaires(idbar, idjour, heuredebut, heurefin) VALUES ('1', '5', time '14:30' , time '01:30');
insert into horaires(idbar, idjour, heuredebut, heurefin) VALUES ('1', '6', time '14:30' , time '01:30');
insert into horaires(idbar, idjour, heuredebut, heurefin) VALUES ('1', '7', time '14:30' , time '01:30');


-- Afin de supprimer tout le contenu des tables en cascade: (sauf celles pré-remplies) et remet les int serial à 0:
--truncate adresses restart identity cascade


