/*Yo Laura Muñoz con documento de cedula de ciudadania CC, y numero 1075689855 y email lalita@mail.com
me quiero registrar en Busqueda_Inmobiliaria para conocer los inmuebles que dispone para la venta.*/

EXECUTE PC_PARTICIPANTES.AD_PARTICIPANTE ('CC',1075689855,'Laura','Muñoz','lalita@mail.com');

/*Como actual participante de Busqueda_Inmobiliaria me interesa ingresar una solicitud a esta plataforma con interes de compra de un inmueble,
el cual estaria dispuesta a pagar de 60 a 82 millones de pesos*/

EXECUTE PC_SOLICITUDES.AD_SOLICITUD ('CC',1075689855,60000000,72000000);

/*Quisiera de igual forma confirmar el estado actual de mi solicitud, pues no recuerdo haber ingresado el valor*/

SELECT PA_COMPRADOR.CO_SOLICITUD FROM DUAL;

/*Me gustaría saber los inmuebles que estan en oferta, para tener un mejor panorama de lo que me ofrece la plataforma*/

SELECT PC_OFERTAS.CO_ESTADO_OFERTA FROM DUAL;

/*Viendo algunos precios me gustaría cambiar el valor maximo que pagaria por el inmueble que estoy buscando*/

SELECT PC_SOLICITUDES.MO_SOLICITUD (1,82000000);