DROP VIEW  v_adressebar, v_comm_notes, v_evalbar, v_listcategoriebar, v_listcriterebar;
DROP TABLE villes, adresses, bars, jours, horaires, critiques, critereseval, evaluations, categories, categoriesbars, criteresspeciaux, criteresbars, images;



create table villes (
	ville varchar(25) NOT NULL,
	cp char(5) NOT NULL,
	CONSTRAINT pk_villes PRIMARY KEY (cp)
);

create table adresses (
	idadresse serial NOT NULL,
	voie varchar NOT NULL,
	cp varchar(5) NOT NULL,
	latitude decimal,
	longitude decimal,
	CONSTRAINT pk_adresses PRIMARY KEY (idadresse),
	CONSTRAINT fk_adresses_villes FOREIGN KEY (cp) REFERENCES villes(cp)
);

create table bars (
	idbar serial NOT NULL,
	idadresse int NOT NULL,
	nom varchar(40) NOT NULL,
	numtel varchar(14),
	site varchar(50),
	description text NOT NULL, 
	CONSTRAINT pk_bars PRIMARY KEY (idbar),
	CONSTRAINT fk_bars_adresses FOREIGN KEY (idadresse) REFERENCES adresses(idadresse)
);


create table jours(
	idjour serial NOT NULL,
	jour varchar(8) NOT NULL,
	CONSTRAINT pk_jours PRIMARY KEY (idjour)
);

create table horaires (
	idhoraire serial NOT NULL,
	idbar int NOT NULL,
	idjour int NOT NULL,
	heuredebut time NOT NULL,
	heurefin time NOT NULL,
	CONSTRAINT pk_horaires PRIMARY KEY (idhoraire),
	CONSTRAINT fk_horaires_bars FOREIGN KEY (idbar) REFERENCES bars(idbar),
	CONSTRAINT fk_horaires_jours FOREIGN KEY (idjour) REFERENCES jours(idjour)
);



create table critiques(
	idcritique serial NOT NULL,
	idbar int NOT NULL,
	comm text,
	datecomm timestamp without time zone,
	CONSTRAINT pk_critiques PRIMARY KEY (idcritique),
	CONSTRAINT fk_critiques_bars FOREIGN KEY (idbar) REFERENCES bars(idbar)
);


create table critereseval(
	idcriteval serial NOT NULL,
	libcourt varchar(15) NOT  NULL,
	liblong varchar(100) NOT NULL,
	CONSTRAINT pk_critereseval PRIMARY KEY (idcriteval)
);


create table evaluations (
	ideval serial NOT NULL,
	idcritique int NOT NULL,
	idcriteval int NOT NULL,
	note smallint NOT NULL,
	CONSTRAINT pk_evaluations PRIMARY KEY (ideval),
	CONSTRAINT fk_evaluations_critiques FOREIGN KEY (idcritique) REFERENCES critiques(idcritique)
);



create table categories (
	idcategorie serial NOT NULL,
	categoriebar varchar(20) NOT NULL,
	CONSTRAINT pk_categories PRIMARY KEY (idcategorie)
);

create table categoriesbars (
	idcatbar serial NOT NULL,
	idbar int NOT NULL,
	idcategorie int NOT NULL,
	CONSTRAINT pk_categoriesbars PRIMARY KEY (idcatbar),
	CONSTRAINT fk_categoriesbars_bars FOREIGN KEY (idbar) REFERENCES bars(idbar),
	CONSTRAINT fk_categoriesbars_categories FOREIGN KEY (idcategorie) REFERENCES categories(idcategorie)
);

create table criteresspeciaux (
	idcritere serial NOT NULL,
	critere varchar(50) NOT NULL,
	CONSTRAINT pk_criteresspeciaux PRIMARY KEY (idcritere)
);


create table criteresbars (
	idcriterebar serial NOT NULL,
	idbar int NOT NULL,
	idcritere int NOT NULL,
	CONSTRAINT pk_criteresbars PRIMARY KEY (idcriterebar),
	CONSTRAINT fk_criteresbars_bars FOREIGN KEY (idbar) REFERENCES bars(idbar),
	CONSTRAINT fk_criteresbars_criteresspeciaux FOREIGN KEY (idcritere) REFERENCES criteresspeciaux(idcritere)
);

CREATE TABLE images
(
  idimage serial NOT NULL,
  idbar integer NOT NULL,
  nomimage character varying(50) NOT NULL,
  isprincipal boolean NOT NULL,
  CONSTRAINT pk_images PRIMARY KEY (idimage),
  CONSTRAINT fk_images_bars FOREIGN KEY (idbar)
      REFERENCES bars (idbar) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT unique_nomimage UNIQUE (nomimage)
)


