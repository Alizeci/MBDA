------------------------------------------------------------------------------------------------------------
                                          /*CICLO 1: PoblarOK*/
------------------------------------------------------------------------------------------------------------

INSERT INTO participante VALUES ('CC',1075689856,'Lina','Izquierdo','lalita@mail.com');
INSERT INTO participante VALUES ('CC',35416363,'Luz','Castro','lucecita@mail.com');
INSERT INTO participante VALUES ('CC',1073254906,'Juliet','Villalobos','villalobos@mail.com');
INSERT INTO participante VALUES ('NT',2158331,'Fernando','Siervo','siervo@mail.com');
INSERT INTO participante VALUES ('CC',1073254907,'Yarit','Jimenez','jimenez@mail.com');
INSERT INTO participante VALUES ('NT',2158332,'Yajanny','Velandia','velandia@mail.com');
INSERT INTO participante VALUES ('CC',1073254908,'Laura','Chavarro','laura@mail.com');
INSERT INTO participante VALUES ('NT',2158333,'Alejandra','Munoz','muñoz@mail.com');

INSERT INTO documento VALUES (1,'PNG',TO_DATE('2018/01/03','yyyy/mm/dd'));
INSERT INTO documento VALUES (2,'JPEG',TO_DATE('2018/01/03','yyyy/mm/dd'));
INSERT INTO documento VALUES (3,'PDF',TO_DATE('2018/01/03','yyyy/mm/dd'));
INSERT INTO documento VALUES (4,'PNG',TO_DATE('2018/08/03','yyyy/mm/dd'));
INSERT INTO documento VALUES (5,'PNG',TO_DATE('2018/01/03','yyyy/mm/dd'));
INSERT INTO documento VALUES (6,'PNG',TO_DATE('2018/03/03','yyyy/mm/dd'));
INSERT INTO documento VALUES (7,'JPEG',TO_DATE('2018/01/23','yyyy/mm/dd'));
INSERT INTO documento VALUES (8,'PNG',TO_DATE('2018/01/03','yyyy/mm/dd'));

INSERT INTO promesa VALUES (1,'Casa',1075689856,1073254906);
INSERT INTO promesa VALUES (2,'Apto',35416363,1073254908);
INSERT INTO promesa VALUES (3,'Casa',2158331,1073254907);
INSERT INTO promesa VALUES (6,'Casa',1073254908,1073254943);

INSERT INTO escritura VALUES (1,'V');
INSERT INTO escritura VALUES (2,'A');
INSERT INTO escritura VALUES (3,'V');
INSERT INTO escritura VALUES (6,'V');

INSERT INTO seguimiento VALUES (1,1,TO_DATE('2018/01/03','yyyy/mm/dd'),NULL,23);
INSERT INTO seguimiento VALUES (2,2,TO_DATE('2018/01/03','yyyy/mm/dd'),NULL,43);
INSERT INTO seguimiento VALUES (3,3,TO_DATE('2018/01/03','yyyy/mm/dd'),NULL,63);
INSERT INTO seguimiento VALUES (4,4,TO_DATE('2018/01/03','yyyy/mm/dd'),NULL,83);
INSERT INTO seguimiento VALUES (5,5,TO_DATE('2018/01/03','yyyy/mm/dd'),NULL,33);
INSERT INTO seguimiento VALUES (6,6,TO_DATE('2018/01/03','yyyy/mm/dd'),TO_DATE('2018/09/23','yyyy/mm/dd'),100);
INSERT INTO seguimiento VALUES (7,7,TO_DATE('2018/01/03','yyyy/mm/dd'),NULL,56);
INSERT INTO seguimiento VALUES (8,8,TO_DATE('2018/01/03','yyyy/mm/dd'),NULL,98);

INSERT INTO negocio VALUES (1,'Luis Sierra','Luis Sierra','Luis Sierra','Luis Sierra','<?xml version="1.0"?>
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
  	<titular nombre="Luis Sierra" cedula="1073254906" confirmacion="SI">
        <descripcion></descripcion>
  	</titular>
  	<embargos confirmacion="NO">
        <descripcion></descripcion>
  	</embargos>
    <hipotecas confirmacion="NO">
        <descripcion></descripcion>
    </hipotecas>
    <restricciones_de_uso confirmacion="SI">
      <descripcion>Zona industrial</descripcion>
    </restricciones_de_uso>
 </estado>
</estado_juridico>',1);
INSERT INTO negocio VALUES (2,'Maria Castro','Maria Castro','Raul Sierra','Raul Sierra','<?xml version="1.0"?>
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
  	<titular nombre="Maria Castro" cedula="1073265906" confirmacion="SI">
        <descripcion></descripcion>
  	</titular>
 </estado>
</estado_juridico>',2);
INSERT INTO negocio VALUES (3,'Hugo Florez','Patricia Lopez','Hugo Florez','Patricia Lopez','<?xml version="1.0"?>
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
        <titular nombre="Patricia Lopez" cedula="1073265406" confirmacion="SI">
             <descripcion></descripcion>
        </titular>

		<embargos confirmacion="NO">
            <descripcion></descripcion>
  		</embargos>
    	<hipotecas confirmacion="SI">
			<descripcion> Hipotecada al banco</descripcion>
    	</hipotecas>
    </estado>
</estado_juridico>',3);
INSERT INTO negocio VALUES (4,'Fernanda Cuellar','Trina Godoy','Ignacio Rodriguez','Fernanda Cuellar','<?xml version="1.0"?>
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
  	<titular nombre="Trina Godoy" cedula="1075465906" confirmacion="SI">
        <descripcion></descripcion>
  	</titular>
 </estado>
</estado_juridico>',4);
INSERT INTO negocio VALUES (5,'Mario Diaz','Mario Diaz','Mario Diaz','Pilar Munoz','<?xml version="1.0"?>
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
  	<titular nombre="Mario Diaz" cedula="1075335906" confirmacion="SI">
        <descripcion></descripcion>
  	</titular>
 </estado>
</estado_juridico>',5);
INSERT INTO negocio VALUES (6,'Pilar Munoz','Pilar Munoz','Pilar Munoz','Pilar Munoz','<?xml version="1.0"?>
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

INSERT INTO propuesta VALUES (1,'CC',1075689856,'Ofrezco cinco millones mas al precio original',1,TO_DATE('2018/01/03','yyyy/mm/dd'));
INSERT INTO propuesta VALUES (2,'CC',35416363,'Ofrezco un millon mas al precio original',1,TO_DATE('2018/01/05','yyyy/mm/dd'));
INSERT INTO propuesta VALUES (3,'CC',1073254906,'Ofrezco un auto como parte de pago',2,TO_DATE('2018/01/03','yyyy/mm/dd'));
INSERT INTO propuesta VALUES (4,'NT',2158331,'Ofrezco seis millones mas al precio original',2,TO_DATE('2018/01/03','yyyy/mm/dd'));
INSERT INTO propuesta VALUES (5,'CC',1073254907,'Ofrezco un terreno de 50 metros cuadrados',3,TO_DATE('2018/01/03','yyyy/mm/dd'));
INSERT INTO propuesta VALUES (6,'NT',2158332,'Ofrezco un millones mas al precio original',4,TO_DATE('2018/06/13','yyyy/mm/dd'));
INSERT INTO propuesta VALUES (7,'CC',1073254908,'Ofrezco tres millones mas al precio original',5,TO_DATE('2018/01/03','yyyy/mm/dd'));
INSERT INTO propuesta VALUES (8,'NT',2158333,'Ofrezco cubrir los gastos legales, si lo deja en 23 millones',6,TO_DATE('2018/08/23','yyyy/mm/dd'));

INSERT INTO factormatch VALUES (1,1,null,'PROCESO',1);
INSERT INTO factormatch VALUES (2,NULL,2,'PROCESO',2);
INSERT INTO factormatch VALUES (3,3,NULL,'PROCESO',3);
INSERT INTO factormatch VALUES (4,NULL,4,'PROCESO',4);
INSERT INTO factormatch VALUES (5,5,NULL,'PROCESO',5);
INSERT INTO factormatch VALUES (6,NULL,6,'PROCESO',6);
INSERT INTO factormatch VALUES (7,7,NULL,'PROCESO',7);
INSERT INTO factormatch VALUES (8,NULL,8,'PROCESO',8);
