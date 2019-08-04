--------------------------------------------------------------------------------------------------------------------------
                                                  /*CICLO 1: PRUEBA*/
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO participante VALUES ('CC',1075689856,'Laura','Muñoz','lalita@mail.com');

/*Yo Laura Muñoz me encuentro registrada en Ecinmuebles con documento de cedula de ciudadania CC, y numero 1075689856 y email lalita@mail.com 
y realicé una solicitud para conocer los inmuebles que dispone para la venta.*/

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
/*Como actual participante de Ecinmuebles me interesa realizar una propuesta al vendedor, le ofrezco dos millones mas al precioOfertado*/
EXECUTE PA_COMPRADOR.AD_PROPUESTA ('CC',1075689856,'Le ofrezco dos millones mas al precioOfertado',1);

/*Me gustaría ver las propuestas de los demas compradores.*/
SELECT PA_COMPRADOR.CO_PROPUESTA FROM DUAL;

/*Viendo las propuestas de algunos, me interesa cambiar la mia. Pero antes necesito conocer el numero de mi prouesta*/
EXECUTE PA_COMPRADOR.MOD_PROPUESTA (2,'Le ofrezco cuatro millones mas al precioOfertado');

/*He llegado a un acuerdo con el comprador. Ahora me interesa ingresar la documentacion del negocio*/
EXECUTE PA_COMPRADOR.AD_DOCUMENTO ('PNG');

/*Y adicionalmente, me interesa ingresar la promesa del negocio*/
EXECUTE PA_COMPRADOR.AD_PROMESA (1,'Casa',1075689856,35416363);

/*Me gustaría consultar el documento y promesa, para revisar su correcto ingreso*/
SELECT PA_COMPRADOR.CO_DOCUMENTO FROM DUAL;
SELECT PA_COMPRADOR.CO_PROMESA FROM DUAL;