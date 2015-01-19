
-- Creation du trigger sur critiques

CREATE OR REPLACE FUNCTION on_insert()
  RETURNS trigger AS
$BODY$begin
	new.datecomm = now();
	return new;
end;$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER on_before_insert
  BEFORE INSERT
  ON critiques
  FOR EACH ROW
  EXECUTE PROCEDURE on_insert();
  
  -- création du trigger sur images
  
  
  CREATE OR REPLACE FUNCTION on_insert_image()
  RETURNS trigger AS
$BODY$DECLARE 
nbimage integer;

BEGIN

EXECUTE 'SELECT count(*) FROM images WHERE idbar= $1'
	INTO nbimage
	USING new.idbar;

	IF nbimage = 0 then new.isprincipal = true;
	else new.isprincipal = false;
	end if;

	return new;
END;
$BODY$
  LANGUAGE plpgsql;
  
  
  CREATE TRIGGER on_before_insert
  BEFORE INSERT
  ON images
  FOR EACH ROW
  EXECUTE PROCEDURE on_insert_image();


-- Creation des Vues

-- View: v_adressebar

CREATE OR REPLACE VIEW v_adressebar AS 
 SELECT bars.idbar,
    adresses.voie,
    cp,
    villes.ville
   FROM adresses
     JOIN bars USING (idadresse)
     JOIN villes USING (cp)
  ORDER BY bars.idbar;


-- View: v_evalbar

CREATE OR REPLACE VIEW v_evalbar AS 
 SELECT avg(evaluations.note) AS note,
    critereseval.libcourt,
    critiques.idbar
   FROM critiques
     JOIN evaluations USING (idcritique)
     JOIN critereseval USING (idcriteval)
  GROUP BY critiques.idbar, critereseval.libcourt;


-- View: v_listcategoriebar

CREATE OR REPLACE VIEW v_listcategoriebar AS 
 SELECT categoriesbars.idbar,
    categoriesbars.idcategorie,
    categories.categoriebar
   FROM categoriesbars
     JOIN bars USING (idbar)
     JOIN categories USING (idcategorie)
  ORDER BY categoriesbars.idbar;
  

-- View: v_listcriterebar

CREATE OR REPLACE VIEW v_listcriterebar AS 
 SELECT criteresbars.idbar,
    criteresbars.idcritere,
    criteresspeciaux.critere
   FROM criteresbars
     JOIN bars USING (idbar)
     JOIN criteresspeciaux USING (idcritere)
  ORDER BY criteresbars.idbar;

-- View: v_comm_notes


CREATE OR REPLACE VIEW v_comm_notes AS 
 SELECT critiques.idbar,
    evaluations.idcriteval,
    critiques.comm,
    to_char(critiques.datecomm, 'dd MonthYYYY'::text) AS datecomm,
    evaluations.note
   FROM critiques
     JOIN evaluations USING (idcritique)
  ORDER BY critiques.idbar;
     


