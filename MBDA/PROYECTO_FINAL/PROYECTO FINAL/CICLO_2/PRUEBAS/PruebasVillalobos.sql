--------------------------------------------------------------------------------------------------------------------------
                                                  /*CICLO 1: PRUEBA*/
--------------------------------------------------------------------------------------------------------------------------

/*Yo Yarit Suarez con documento de cedula de ciudadania CC, y numero 1075656788, email yarit@mail.com y numero 311345437,
me quiero registrar en Busqueda_Inmobiliaria para poner mi inmueble a la venta.*/

EXECUTE PC_PARTICIPANTES.AD_PARTICIPANTE ('CC',1075656788,'Yarit','Suarez','Yarit@mail.com');

/*Ademas de agregar mi numero de contacto para facilidades del comprador*/

EXECUTE PC_PARTICIPANTES.AD_TELEFONO ('CC',1075656788,311345437)

/*Como actual participante de Busqueda_Inmobiliaria me interesa ingresar una oferta a esta plataforma con interes de conseguir
 un comprador para mi inmueble, el cual estaria vendiendo en 74 millones de pesos, negociables*/

EXECUTE PC_OFERTAS.AD_OFERTA ('CC',1075656788,74000000,'SI');

/*Quisiera de igual forma confirmar el estado actual de mi oferta, para revisar el valor ofertado sea el correcto*/

SELECT PA_VENDEDOR.CO_ESTADO_OFERTA FROM DUAL;

/*De paso me gustaría conocer los inmuebles que estan solicitando, para tener un mejor panorama de lo que podria estar necesitando
 un potencial comprador en la plataforma*/

SELECT PC_SOLICITUDES.CO_SOLICITUD FROM DUAL;

/*Viendo algunos precios me gustaría subir el mi oferta, pues revisando algunos inmuebles podria recibir más por el inmueble que estoy ofreciendo*/

SELECT PC_OFERTAS.MO_OFERTA (1,82000000);