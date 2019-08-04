-----------------------------------------------------------------------------------------------------------------------------------------
                                                        /*CICLO 1: DisparadoresOK*/ 
-----------------------------------------------------------------------------------------------------------------------------------------

/*ADICION*/
--El factorid y estado se asignan automaticamente. (TG_auto_factorMatch)
INSERT INTO factorMatch (numero_oferta,numero_solicitud,id_seguimiento) VALUES(1,null,1);

-----------------------------------------------------------MANTENER SEGUIMIENTO------------------------------------------------------------

/*ADICION*/
--El numero y la fecha se asignan automaticamente. (TG_auto_seguimiento)
INSERT INTO seguimiento (documento,porcentaje) VALUES(1,30);

/*MODIFICACION*/
--No esta permitido modificar la fecha de inicio.(TG_mod_seg)
UPDATE seguimiento SET fechafin=TO_DATE('2018/08/23','yyyy/mm/dd') where id_seguimiento=1;

-----------------------------------------------------------MANTENER DOCUMENTO------------------------------------------------------------

/*ADICION*/
--El numero y la fecha se asignan automaticamente. (TG_auto_doc)
INSERT INTO documento(imagen) VALUES ('PNG');

-----------------------------------------------------------REGISTRAR PROPUESTA------------------------------------------------------------

/*ADICION*/
--El numero y la fecha se asignan automaticamente.  (TG_auto_propuesta)
INSERT INTO propuesta (tid,nid,propuesta,id_negocio) VALUES('CC',1075689856,'Ofrezco cinco millones más al precio original',1);

--El participante no puede registrar más de dos propuestas. (TG_dos_propuestas)
INSERT INTO propuesta (tid,nid,propuesta,id_negocio) VALUES('CC',1075689856,'Ofrezco cinco millones más al precio origial',1);

-----------------------------------------------------------REGISTRAR NEGOCIO--------------------------------------------------------------

/*ADICION*/
--El numero y la fecha se asignan automaticamente. (TG_auto_negocio)
INSERT INTO negocio (propietario,titularidad,uso,fruto,estadoJuridico,id_seguimiento) VALUES ('Pilar Munoz','Pilar Munoz','Pilar Munoz','Pilar Munoz','<?xml version="1.0"?>
<!DOCTYPE estado_juridico [
	<!ELEMENT estado_juridico (estado)>
	<!ELEMENT estado (titular+ , embargos? , hipotecas? , restricciones_de_uso?)*>	
	<!ELEMENT titular (descripcion)?>
  	<!ELEMENT embargos (descripcion)?>
	<!ELEMENT hipotecas (descripcion)?>
	<!ELEMENT restricciones_de_uso (descripcion)?>
  	<!ELEMENT descripcion (#PCDATA)>

	<!ATTLIST titular confirmacion CDATA #REQUIRED
                    nombre CDATA #REQUIRED
                    cedula CDATA #REQUIRED>
	<!ATTLIST embargos confirmacion CDATA #REQUIRED>
	<!ATTLIST hipotecas confirmacion CDATA #REQUIRED>
	<!ATTLIST restricciones_de_uso confirmacion CDATA #REQUIRED>
]>

<estado_juridico>
  <estado>
  	<titular nombre="Pilar Munoz" cedula="1075005906" confirmacion="SI">
        <descripcion></descripcion>
  	</titular>
 </estado>
</estado_juridico>',6);

/*MODIFICACION*/
--No esta permitido modificar los datos del negocio, solamente el estado_juridico. (TG_mod_negocio)
UPDATE negocio SET estadojuridico='<?xml version="1.0"?>
<!DOCTYPE estado_juridico [
	<!ELEMENT estado_juridico (estado)>
	<!ELEMENT estado (titular+ , embargos? , hipotecas? , restricciones_de_uso?)*>	
	<!ELEMENT titular (descripcion)?>
  	<!ELEMENT embargos (descripcion)?>
	<!ELEMENT hipotecas (descripcion)?>
	<!ELEMENT restricciones_de_uso (descripcion)?>
  	<!ELEMENT descripcion (#PCDATA)>

	<!ATTLIST titular confirmacion CDATA #REQUIRED
                    nombre CDATA #REQUIRED
                    cedula CDATA #REQUIRED>
	<!ATTLIST embargos confirmacion CDATA #REQUIRED>
	<!ATTLIST hipotecas confirmacion CDATA #REQUIRED>
	<!ATTLIST restricciones_de_uso confirmacion CDATA #REQUIRED>
]>

<estado_juridico>
  <estado>
  	<titular nombre="Pilar Munoz" cedula="1075005906" confirmacion="SI">
        <descripcion></descripcion>
  	</titular>
 </estado>
</estado_juridico>' where id_seguimiento=1;

