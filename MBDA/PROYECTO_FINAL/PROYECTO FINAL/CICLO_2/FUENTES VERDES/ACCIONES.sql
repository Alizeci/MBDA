-----------------------------------------------------------------------------------------------------------------------------------------
                                                       /*CICLO 1: Acciones*/
-----------------------------------------------------------------------------------------------------------------------------------------

/*ELIMINACION*/
--El documento se debe poder eliminar, si el seguimiento asociado se elimina. (AC_elimina_seg)
ALTER TABLE documento DROP CONSTRAINT FK_seguimiento_documento;
ALTER TABLE documento ADD CONSTRAINT FK_seguimiento_documento
FOREIGN KEY (numero) REFERENCES seguimiento (documento) ON DELETE CASCADE;

--Si se elimina el seguimiento, se debe poder eliminar el negocio asociado. (AC_elimina_negocio)
ALTER TABLE negocio DROP CONSTRAINT FK_negocio_seguimiento;
ALTER TABLE negocio ADD CONSTRAINT FK_negocio_seguimiento
FOREIGN KEY (id_seguimiento) REFERENCES seguimiento (id_seguimiento) ON DELETE CASCADE;

--Si se elimina el documento, se elimina las promesas. (AC_elimina_promesa)
ALTER TABLE promesa DROP CONSTRAINT FK_promesa_documento;
ALTER TABLE promesa ADD CONSTRAINT FK_promesa_documento
FOREIGN KEY (numero) REFERENCES documento (numero) ON DELETE CASCADE;

--Si se elimina el documento, se elimina las escrituras. (AC_elimina_escritura)
ALTER TABLE escritura DROP CONSTRAINT FK_escritura_documento;
ALTER TABLE escritura ADD CONSTRAINT FK_escritura_documento
FOREIGN KEY (numero) REFERENCES documento (numero) ON DELETE CASCADE;
