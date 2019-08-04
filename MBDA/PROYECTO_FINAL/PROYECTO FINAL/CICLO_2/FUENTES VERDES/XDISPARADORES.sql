-----------------------------------------------------------------------------------------------------------------------------------------
                                                        /*CICLO 1: XDisparadores*/ 
-----------------------------------------------------------------------------------------------------------------------------------------

/*ADICION*/
--El factorid y estado se asignan automaticamente. (TG_auto_factorMatch)
DROP SEQUENCE secuencia_auto0;
DROP TRIGGER TG_auto_factorMatch;

--El numero y la fecha se asignan automaticamente. (TG_auto_seguimiento)
DROP SEQUENCE secuencia_auto3;
DROP TRIGGER TG_auto_seguimiento;

--El numero y la fecha se asignan automaticamente. (TG_auto_doc)
DROP SEQUENCE secuencia_auto4;
DROP TRIGGER TG_auto_doc;

/*MODIFICACION*/
--No esta permitido modificar el documento. (TG_mod_doc)
DROP TRIGGER TG_mod_doc;

--No esta permitido modificar la fecha de inicio.(TG_mod_seg)
DROP TRIGGER TG_mod_seg;

-----------------------------------------------------------REGISTRAR PROPUESTA------------------------------------------------------------

/*ADICION*/
--El numero y la fecha se asignan automaticamente.  (TG_auto_propuesta)
DROP SEQUENCE secuencia_auto;
DROP TRIGGER TG_auto_propuesta;

--El participante no puede registrar más de dos propuestas. (TG_dos_propuestas)
DROP TRIGGER TG_dos_propuestas;

/*MODIFICACION*/
--No esta permitido modificar los datos de identificacion del participante. (TG_mod_participante)
DROP TRIGGER TG_mod_participante;

-----------------------------------------------------------REGISTRAR NEGOCIO--------------------------------------------------------------

/*ADICION*/
--El numero y la fecha se asignan automaticamente. (TG_auto_negocio)
DROP SEQUENCE secuencia_auto2;
DROP TRIGGER TG_auto_negocio;

/*MODIFICACION*/
--No esta permitido modificar los datos del negocio, solamente el estado_juridico. (TG_mod_negocio)
DROP TRIGGER TG_mod_negocio;