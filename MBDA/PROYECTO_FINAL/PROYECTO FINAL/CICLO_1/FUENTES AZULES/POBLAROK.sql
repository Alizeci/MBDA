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
INSERT INTO participante VALUES ('NT',2158333,'Alejandra','Muñoz','muñoz@mail.com');

INSERT INTO telefono VALUES ('CC',1075689856,3118104371);
INSERT INTO telefono VALUES ('CC',35416363,3123590373);
INSERT INTO telefono VALUES ('CC',1073254906,3042138635);
INSERT INTO telefono VALUES ('NT',2158331,3042138636);
INSERT INTO telefono VALUES ('CC',1073254907,3042138637);
INSERT INTO telefono VALUES ('NT',2158332,3042138638);
INSERT INTO telefono VALUES ('CC',1073254908,3042138639);
INSERT INTO telefono VALUES ('NT',2158333,3042138640);
INSERT INTO telefono VALUES ('CC',1075689856,3118104372);

INSERT INTO oferta VALUES (1,'CC',35416363,TO_DATE('2018/01/03','yyyy/mm/dd'),25000000,'SI');
INSERT INTO solicitud VALUES (2,'CC',1075689856,TO_DATE('2018/01/03','yyyy/mm/dd'),NULL,22000000);
INSERT INTO oferta VALUES (3,'NT',2158331,TO_DATE('2016/11/23','yyyy/mm/dd'),22000000,'NO');
INSERT INTO solicitud VALUES (5,'CC',1073254906,TO_DATE('2009/06/13','yyyy/mm/dd'),23400000,28000000);
INSERT INTO oferta VALUES (4,'NT',2158332,TO_DATE('2018/01/03','yyyy/mm/dd'),15300000,'NO');
INSERT INTO solicitud VALUES (6,'CC',1073254907,TO_DATE('2018/06/13','yyyy/mm/dd'),22700000,36200000);
INSERT INTO oferta VALUES (7,'NT',2158333,TO_DATE('2018/07/03','yyyy/mm/dd'),100000000,'SI');
INSERT INTO solicitud VALUES (8,'CC',1073254908,TO_DATE('2018/08/23','yyyy/mm/dd'),NULL,52000000);

INSERT INTO factormatch VALUES (1,1,null,'PROCESO');
INSERT INTO factormatch VALUES (2,NULL,2,'PROCESO');
INSERT INTO factormatch VALUES (3,3,NULL,'PROCESO');
INSERT INTO factormatch VALUES (4,NULL,4,'PROCESO');
INSERT INTO factormatch VALUES (5,5,NULL,'PROCESO');
INSERT INTO factormatch VALUES (6,NULL,6,'PROCESO');
INSERT INTO factormatch VALUES (7,7,NULL,'PROCESO');
INSERT INTO factormatch VALUES (8,NULL,8,'PROCESO');

-- DEPENDE CONSULTAS --
INSERT INTO operador VALUES (1,2,'<');
INSERT INTO operador VALUES (2,1,'>');
INSERT INTO operador VALUES (3,6,'REGEXP_LIKE');
INSERT INTO operador VALUES (4,7,'LIKE');
INSERT INTO operador VALUES (5,2,'BETWEEN');
INSERT INTO operador VALUES (6,3,'<');
INSERT INTO operador VALUES (7,2,'=');
INSERT INTO operador VALUES (8,1,'LIKE');
--

INSERT INTO actualizacion VALUES (1,TO_DATE('2018/01/06','yyyy/mm/dd'));
INSERT INTO actualizacion VALUES (3,TO_DATE('2018/01/04','yyyy/mm/dd'));
INSERT INTO actualizacion VALUES (5,TO_DATE('2018/03/15','yyyy/mm/dd'));

INSERT INTO area VALUES(1,70.2,54.6);
INSERT INTO area VALUES(2,70.0,45.5);
INSERT INTO area VALUES(3,54.4,NULL);
INSERT INTO area VALUES(4,47.8,38.3);
INSERT INTO area VALUES(5,97.56,34.3);
INSERT INTO area VALUES(6,57.4,NULL);
INSERT INTO area VALUES(7,40.4,32.22);
INSERT INTO area VALUES(8,55.4,31.1);

INSERT INTO estrato VALUES(1,3);
INSERT INTO estrato VALUES(2,3);
INSERT INTO estrato VALUES(3,3);
INSERT INTO estrato VALUES(4,3);
INSERT INTO estrato VALUES(5,2);
INSERT INTO estrato VALUES(6,3);
INSERT INTO estrato VALUES(7,2);
INSERT INTO estrato VALUES(8,5);

INSERT INTO inmueble VALUES(1,'Casa','Amplia Casa');
INSERT INTO inmueble VALUES(2,'Casa',NULL);
INSERT INTO inmueble VALUES(3,'Casa',NULL);
INSERT INTO inmueble VALUES(4,'Casa',NULL);
INSERT INTO inmueble VALUES(5,'Industrial',NULL);
INSERT INTO inmueble VALUES(6,'Casa',NULL);
INSERT INTO inmueble VALUES(7,'Local',NULL);
INSERT INTO inmueble VALUES(8,'Casa',NULL);

INSERT INTO ubicacion VALUES(1,'Cundinamarca','Bogotá','Norte',NULL);
INSERT INTO ubicacion VALUES(2,'Cundinamarca','Bogotá','Norte',NULL);
INSERT INTO ubicacion VALUES(3,'Boyaca','Tunja','sur',NULL);
INSERT INTO ubicacion VALUES(5,'Cundinamarca','Mosquera','norte','Alicante');
INSERT INTO ubicacion VALUES(6,'Cundinamarca','Zipaquira','sur',NULL);
INSERT INTO ubicacion VALUES(7,'Boyaca','Tunja','sur',NULL);
INSERT INTO ubicacion VALUES(8,'Cundinamarca','Mosquera','norte','Alicante');
INSERT INTO ubicacion VALUES(4,'Cundinamarca','Chía','sur',NULL);

INSERT INTO antiguedad VALUES(1,NULL);
INSERT INTO antiguedad VALUES(2,'T1');
INSERT INTO antiguedad VALUES(3,NULL);
INSERT INTO antiguedad VALUES(4,'T2');
INSERT INTO antiguedad VALUES(5,'T1');
INSERT INTO antiguedad VALUES(6,NULL);
INSERT INTO antiguedad VALUES(7,'T2');
INSERT INTO antiguedad VALUES(8,'T1');

INSERT INTO tipoOferta VALUES(1,'V');
INSERT INTO tipoOferta VALUES(2,'V');
INSERT INTO tipoOferta VALUES(3,'A');
INSERT INTO tipoOferta VALUES(4,'A');
INSERT INTO tipoOferta VALUES(5,'V');
INSERT INTO tipoOferta VALUES(6,'A');
INSERT INTO tipoOferta VALUES(7,'V');
INSERT INTO tipoOferta VALUES(8,'A');

INSERT INTO habitacion VALUES(1,4,NULL);
INSERT INTO habitacion VALUES(2,5,2);
INSERT INTO habitacion VALUES(3,2,1);
INSERT INTO habitacion VALUES(4,4,2);
INSERT INTO habitacion VALUES(5,0,NULL);
INSERT INTO habitacion VALUES(6,2,NULL);
INSERT INTO habitacion VALUES(7,0,NULL);
INSERT INTO habitacion VALUES(8,2,1);

INSERT INTO tipoPiso VALUES(1,'MAD',3,NULL);
INSERT INTO tipoPiso VALUES(2,'TAB',3,NULL);
INSERT INTO tipoPiso VALUES(3,'MAD',2,'limpio y bonito');
INSERT INTO tipoPiso VALUES(4,'TBT',2,NULL);
INSERT INTO tipoPiso VALUES(5,'CEM',1,NULL);
INSERT INTO tipoPiso VALUES(6,'MAD',2,'limpio');
INSERT INTO tipoPiso VALUES(7,'CEM',2,NULL);
INSERT INTO tipoPiso VALUES(8,'MAD',3,NULL);

INSERT INTO condicion VALUES(1,'NUEVO');
INSERT INTO condicion VALUES(2,'USADO');
INSERT INTO condicion VALUES(3,'NUEVO');
INSERT INTO condicion VALUES(4,'NUEVO');
INSERT INTO condicion VALUES(5,'USADO');
INSERT INTO condicion VALUES(6,'NUEVO');
INSERT INTO condicion VALUES(7,'NUEVO');
INSERT INTO condicion VALUES(8,'USADO');


INSERT INTO extra VALUES(1,'<?xml version="1.0"?>
<!DOCTYPE detalle [
	<!ELEMENT detalle (externa? | interno? | cercanias?)*>
	<!ELEMENT externa (terraza?|jardin?|balcones?)*>	
	<!ELEMENT terraza (descripcion)+>
	<!ELEMENT descripcion (#PCDATA)>
	<!ELEMENT jardin (descripcion)+>
	<!ELEMENT balcones (ubicacion)+>
	<!ELEMENT ubicacion (#PCDATA)>
	<!ELEMENT interno (garaje?|cocina?)*>
	<!ELEMENT garaje (descripcion)+>
  <!ELEMENT cocina (descripcion)+>
  <!ELEMENT cercanias (descripcion)+>

	<!ATTLIST terraza encerrada CDATA #REQUIRED>
	<!ATTLIST jardin ubicacion CDATA #REQUIRED>
	<!ATTLIST jardin tamano CDATA #REQUIRED>
	<!ATTLIST balcones numero CDATA #REQUIRED>
	<!ATTLIST garaje capacidad CDATA #REQUIRED>
	<!ATTLIST cocina tipo CDATA #REQUIRED>
]>
<detalle>
	<externa>
        <jardin ubicacion="interno" tamano = "4x4">
            <descripcion>hermosas flores y lleno de vida</descripcion>
        </jardin>
        <terraza encerrada="NO">
            <descripcion>Amplia y perfecta para realizar asados</descripcion>
        </terraza>
        <balcones numero="2">
            <ubicacion>sala</ubicacion>
            <ubicacion>alcoba</ubicacion>
        </balcones>
    </externa>
    <interno>
        <garaje capacidad="6">
            <descripcion>Se puede arrendar y obtener dinero</descripcion>
        </garaje>
        <cocina tipo = "integral">
             <descripcion>mesones grandes</descripcion>
        </cocina>
    </interno>
    <cercanias>
        <descripcion>bar</descripcion>
        <descripcion>iglesia</descripcion>
    </cercanias>
</detalle>');

INSERT INTO extra VALUES(2,'<?xml version="1.0"?>
<!DOCTYPE detalle [
	<!ELEMENT detalle (externa? | interno? | cercanias?)*>
	<!ELEMENT externa (terraza?|jardin?|balcones?)*>	
	<!ELEMENT terraza (descripcion)+>
	<!ELEMENT descripcion (#PCDATA)>
	<!ELEMENT jardin (descripcion)+>
	<!ELEMENT balcones (ubicacion)+>
	<!ELEMENT ubicacion (#PCDATA)>
	<!ELEMENT interno (garaje?|cocina?)*>
	<!ELEMENT garaje (descripcion)+>
  <!ELEMENT cocina (descripcion)+>
  <!ELEMENT cercanias (descripcion)+>

	<!ATTLIST terraza encerrada CDATA #REQUIRED>
	<!ATTLIST jardin ubicacion CDATA #REQUIRED>
	<!ATTLIST jardin tamano CDATA #REQUIRED>
	<!ATTLIST balcones numero CDATA #REQUIRED>
	<!ATTLIST garaje capacidad CDATA #REQUIRED>
	<!ATTLIST cocina tipo CDATA #REQUIRED>
]>
<detalle>
	<externa>
        <jardin ubicacion="interno" tamano = "4x4">
            <descripcion>hermosas flores y lleno de vida</descripcion>
        </jardin>
        <terraza encerrada="NO">
            <descripcion>Amplia y perfecta para realizar asados</descripcion>
        </terraza>
        <balcones numero="2">
            <ubicacion>sala</ubicacion>
            <ubicacion>alcoba</ubicacion>
        </balcones>
    </externa>
    <interno>
        <garaje capacidad="6">
            <descripcion>Se puede arrendar y obtener dinero</descripcion>
        </garaje>
        <cocina tipo = "semi integral">
             <descripcion>mesones grandes</descripcion>
        </cocina>
    </interno>
    <cercanias>
        <descripcion>bar</descripcion>
        <descripcion>iglesia</descripcion>
    </cercanias>
</detalle>');

INSERT INTO extra VALUES(4,'<?xml version="1.0"?>
<!DOCTYPE detalle [
	<!ELEMENT detalle (externa? | interno? | cercanias?)*>
	<!ELEMENT externa (terraza?|jardin?|balcones?)*>	
	<!ELEMENT terraza (descripcion)+>
	<!ELEMENT descripcion (#PCDATA)>
	<!ELEMENT jardin (descripcion)+>
	<!ELEMENT balcones (ubicacion)+>
	<!ELEMENT ubicacion (#PCDATA)>
	<!ELEMENT interno (garaje?|cocina?)*>
	<!ELEMENT garaje (descripcion)+>
  <!ELEMENT cocina (descripcion)+>
  <!ELEMENT cercanias (descripcion)+>

	<!ATTLIST terraza encerrada CDATA #REQUIRED>
	<!ATTLIST jardin ubicacion CDATA #REQUIRED>
	<!ATTLIST jardin tamano CDATA #REQUIRED>
	<!ATTLIST balcones numero CDATA #REQUIRED>
	<!ATTLIST garaje capacidad CDATA #REQUIRED>
	<!ATTLIST cocina tipo CDATA #REQUIRED>
]>
<detalle>
    <interno>
        <garaje capacidad="1">
            <descripcion>espacioso</descripcion>
        </garaje>
        <cocina tipo = "integral">
             <descripcion>lindos cajones</descripcion>
        </cocina>
    </interno>
    <cercanias>
        <descripcion>parque</descripcion>
    </cercanias>
</detalle>');

INSERT INTO extra VALUES(3,'<?xml version="1.0"?>
<!DOCTYPE detalle [
	<!ELEMENT detalle (externa? | interno? | cercanias?)*>
	<!ELEMENT externa (terraza?|jardin?|balcones?)*>	
	<!ELEMENT terraza (descripcion)+>
	<!ELEMENT descripcion (#PCDATA)>
	<!ELEMENT jardin (descripcion)+>
	<!ELEMENT balcones (ubicacion)+>
	<!ELEMENT ubicacion (#PCDATA)>
	<!ELEMENT interno (garaje?|cocina?)*>
	<!ELEMENT garaje (descripcion)+>
  <!ELEMENT cocina (descripcion)+>
  <!ELEMENT cercanias (descripcion)+>

	<!ATTLIST terraza encerrada CDATA #REQUIRED>
	<!ATTLIST jardin ubicacion CDATA #REQUIRED>
	<!ATTLIST jardin tamano CDATA #REQUIRED>
	<!ATTLIST balcones numero CDATA #REQUIRED>
	<!ATTLIST garaje capacidad CDATA #REQUIRED>
	<!ATTLIST cocina tipo CDATA #REQUIRED>
]>
<detalle>
	<externa>
        <jardin ubicacion="externo" tamano = "6x6">
            <descripcion>lleno de vida</descripcion>
        </jardin>
        <balcones numero="1">
            <ubicacion>sala</ubicacion>
        </balcones>
    </externa>
</detalle>');

INSERT INTO extra VALUES(5,'<?xml version="1.0"?>
<!DOCTYPE detalle [
	<!ELEMENT detalle (externa? | interno? | cercanias?)*>
	<!ELEMENT externa (terraza?|jardin?|balcones?)*>	
	<!ELEMENT terraza (descripcion)+>
	<!ELEMENT descripcion (#PCDATA)>
	<!ELEMENT jardin (descripcion)+>
	<!ELEMENT balcones (ubicacion)+>
	<!ELEMENT ubicacion (#PCDATA)>
	<!ELEMENT interno (garaje?|cocina?)*>
	<!ELEMENT garaje (descripcion)+>
  <!ELEMENT cocina (descripcion)+>
  <!ELEMENT cercanias (descripcion)+>

	<!ATTLIST terraza encerrada CDATA #REQUIRED>
	<!ATTLIST jardin ubicacion CDATA #REQUIRED>
	<!ATTLIST jardin tamano CDATA #REQUIRED>
	<!ATTLIST balcones numero CDATA #REQUIRED>
	<!ATTLIST garaje capacidad CDATA #REQUIRED>
	<!ATTLIST cocina tipo CDATA #REQUIRED>
]>
<detalle>
	<externa>
        <jardin ubicacion="externo" tamano = "6x6">
            <descripcion>lleno de vida</descripcion>
        </jardin>
        <balcones numero="1">
            <ubicacion>sala</ubicacion>
        </balcones>
    </externa>
</detalle>');

INSERT INTO extra VALUES(6,'<?xml version="1.0"?>
<!DOCTYPE detalle [
	<!ELEMENT detalle (externa? | interno? | cercanias?)*>
	<!ELEMENT externa (terraza?|jardin?|balcones?)*>	
	<!ELEMENT terraza (descripcion)+>
	<!ELEMENT descripcion (#PCDATA)>
	<!ELEMENT jardin (descripcion)+>
	<!ELEMENT balcones (ubicacion)+>
	<!ELEMENT ubicacion (#PCDATA)>
	<!ELEMENT interno (garaje?|cocina?)*>
	<!ELEMENT garaje (descripcion)+>
  <!ELEMENT cocina (descripcion)+>
  <!ELEMENT cercanias (descripcion)+>

	<!ATTLIST terraza encerrada CDATA #REQUIRED>
	<!ATTLIST jardin ubicacion CDATA #REQUIRED>
	<!ATTLIST jardin tamano CDATA #REQUIRED>
	<!ATTLIST balcones numero CDATA #REQUIRED>
	<!ATTLIST garaje capacidad CDATA #REQUIRED>
	<!ATTLIST cocina tipo CDATA #REQUIRED>
]>
<detalle>
	<externa>
        <balcones numero="3">
            <ubicacion>sala</ubicacion>
            <ubicacion>alcobas</ubicacion>
        </balcones>
    </externa>
    <interno>
        <cocina tipo = "integral">
             <descripcion>amplia y espaciosa</descripcion>
        </cocina>
    </interno>
</detalle>');

INSERT INTO extra VALUES(7,'<?xml version="1.0"?>
<!DOCTYPE detalle [
	<!ELEMENT detalle (externa? | interno? | cercanias?)*>
	<!ELEMENT externa (terraza?|jardin?|balcones?)*>	
	<!ELEMENT terraza (descripcion)+>
	<!ELEMENT descripcion (#PCDATA)>
	<!ELEMENT jardin (descripcion)+>
	<!ELEMENT balcones (ubicacion)+>
	<!ELEMENT ubicacion (#PCDATA)>
	<!ELEMENT interno (garaje?|cocina?)*>
	<!ELEMENT garaje (descripcion)+>
  <!ELEMENT cocina (descripcion)+>
  <!ELEMENT cercanias (descripcion)+>

	<!ATTLIST terraza encerrada CDATA #REQUIRED>
	<!ATTLIST jardin ubicacion CDATA #REQUIRED>
	<!ATTLIST jardin tamano CDATA #REQUIRED>
	<!ATTLIST balcones numero CDATA #REQUIRED>
	<!ATTLIST garaje capacidad CDATA #REQUIRED>
	<!ATTLIST cocina tipo CDATA #REQUIRED>
]>
<detalle>
    <cercanias>
        <descripcion>bar</descripcion>
        <descripcion>iglesia</descripcion>
        <descripcion>centro comercial</descripcion>
        <descripcion>parque</descripcion>
    </cercanias>
</detalle>');

INSERT INTO extra VALUES(8,'<?xml version="1.0"?>
<!DOCTYPE detalle [
	<!ELEMENT detalle (externa? | interno? | cercanias?)*>
	<!ELEMENT externa (terraza?|jardin?|balcones?)*>	
	<!ELEMENT terraza (descripcion)+>
	<!ELEMENT descripcion (#PCDATA)>
	<!ELEMENT jardin (descripcion)+>
	<!ELEMENT balcones (ubicacion)+>
	<!ELEMENT ubicacion (#PCDATA)>
	<!ELEMENT interno (garaje?|cocina?)*>
	<!ELEMENT garaje (descripcion)+>
  <!ELEMENT cocina (descripcion)+>
  <!ELEMENT cercanias (descripcion)+>

	<!ATTLIST terraza encerrada CDATA #REQUIRED>
	<!ATTLIST jardin ubicacion CDATA #REQUIRED>
	<!ATTLIST jardin tamano CDATA #REQUIRED>
	<!ATTLIST balcones numero CDATA #REQUIRED>
	<!ATTLIST garaje capacidad CDATA #REQUIRED>
	<!ATTLIST cocina tipo CDATA #REQUIRED>
]>
<detalle>
    <cercanias>
        <descripcion>bar</descripcion>
        <descripcion>iglesia</descripcion>
        <descripcion>centro comercial</descripcion>
        <descripcion>parque</descripcion>
    </cercanias>
</detalle>');