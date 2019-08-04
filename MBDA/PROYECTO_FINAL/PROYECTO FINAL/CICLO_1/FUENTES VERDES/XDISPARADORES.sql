-----------------------------------------------------------------------------------------------------------------------------------------
                                                        /*CICLO 1: XDisparadores*/ 
-----------------------------------------------------------------------------------------------------------------------------------------


/*ADICION*/
--El factorid y estado se asigna automáticamente. (TG_auto_factorMatch)
DROP TRIGGER TG_auto_factorMatch;

-----------------------------------------------------------MANTENER SOLICITUD------------------------------------------------------------

/*ADICION*/
--El numero y la fecha se asigna automáticamente.  (TG_auto_solicitud)
DROP TRIGGER TG_auto_solicitud;

--El comprador no puede tener más de dos solicitudes. (TG_dos_solicitud)
DROP TRIGGER TG_dos_solicitud;


/*MODIFICACION*/
--No esta permitido modificar los datos de identificacion del comprador. (TG_mod_participante)
DROP TRIGGER TG_mod_participante;


/*ELIMINACION*/
--Los compradores siempre se pueden eliminar, si no tienen solicitudes. (TG_elimina_comprador)
DROP TRIGGER TG_elimina_comprador;


-----------------------------------------------------------MANTENER OFERTA--------------------------------------------------------------

/*ADICION*/
--El numero y la fecha se asignan automaticamente. (TG_auto_ofertas)
DROP TRIGGER TG_auto_oferta;

--La fecha de las actualizaciones se inserta automaticamente. (TG_auto_fecha_actualizacion)
DROP TRIGGER TG_auto_fecha_actualizacion;


/*MODIFICACION*/
--El precioOferta puede disminuir, si y solo si negociable es SI. (TG_negociable)
DROP TRIGGER TG_negociable;

---No esta permitido modificar el numero, tipo de identificacion, fecha y numero de identificacion de la oferta. (TG_modificar_oferta)
DROP TRIGGER TG_modificar_oferta;


/*ELIMINACION*/
--Es posible eliminar la oferta si su estado es 'CERRADA'. (TG_elimina_oferta)
DROP TRIGGER TG_elimina_oferta;

--Los vendedores se deben de poder eliminar si no tienen ofertas asociadas. (TG_OFERTAS_ASOCIADAS)
DROP TRIGGER TG_elimina_vendedor;
