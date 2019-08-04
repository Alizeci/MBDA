-----------------------------------------------------------------------------------------------------------------------------------------
                                                       /*CICLO 1: Acciones*/
-----------------------------------------------------------------------------------------------------------------------------------------

/*ELIMINACION*/
--El documento se debe poder eliminar, si el seguimiento asociado se elimina. (AC_elimina_seg)
INSERT INTO seguimiento VALUES (1,1,TO_DATE('2018/01/03','yyyy/mm/dd'),NULL,23);
INSERT INTO documento VALUES (1,'PNG',TO_DATE('2018/01/03','yyyy/mm/dd'));

DELETE FROM seguimiento WHERE id_seguimiento = 1;

--Si se elimina el seguimiento, se debe poder eliminar el negocio asociado. (AC_elimina_negocio)
INSERT INTO seguimiento VALUES (1,1,TO_DATE('2018/01/03','yyyy/mm/dd'),NULL,23);
INSERT INTO negocio VALUES (1,'Luis Sierra','Luis Sierra','Luis Sierra','Luis Sierra','<?xml version="1.0"?>
<!DOCTYPE estado_juridico [
	<!ELEMENT estado_juridico (estado)>
	<!ELEMENT estado (titular | embargos | hipotecas | restricciones_de_uso)>	
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
  	<titular nombre="Luis Sierra" cedula="1073254906" confirmacion="SI">
  	</titular>
  	<embargos confirmacion="NO">
  	</embargos>
    <hipotecas confirmacion="NO">
    </hipotecas>
    <restricciones_de_uso confirmacion="SI">
      <descripcion>Zona industrial</descripcion>
    </restricciones_de_uso>
 </estado>
</estado_juridico>',1);

DELETE FROM seguimiento WHERE id_seguimiento = 1;

--Si se elimina el documento, se elimina las promesas. (AC_elimina_promesa)
INSERT INTO seguimiento VALUES (1,1,TO_DATE('2018/01/03','yyyy/mm/dd'),NULL,23);
INSERT INTO documento VALUES (1,'PNG',TO_DATE('2018/01/03','yyyy/mm/dd'));
INSERT INTO promesa VALUES (1,'Casa',1075689856,1073254906);

DELETE FROM documento WHERE numero = 1;


--Si se elimina el documento, se elimina las escrituras. (AC_elimina_escritura)
INSERT INTO seguimiento VALUES (1,1,TO_DATE('2018/01/03','yyyy/mm/dd'),NULL,23);
INSERT INTO documento VALUES (1,'PNG',TO_DATE('2018/01/03','yyyy/mm/dd'));
INSERT INTO escritura VALUES (1,'V');

DELETE FROM documento WHERE numero = 1;