---------------------------------------------------------------------------------------------------------------------------
                                              /*CICLO 1: CRUDNoOK*/
---------------------------------------------------------------------------------------------------------------------------

/*SOLICITUD*/

/*INSERTAR*/
BEGIN
PC_SOLICITUDES.AD_SOLICITUD('CC',1075689856,NULL,22000000000000000);
END;
/*MODIFICAR*/
BEGIN
PC_SOLICITUDES.MO_SOLICITUD(2,null);
END;


/*OFERTA*/
BEGIN
PC_OFERTA.AD_OFERTA('CC',35416363,250000,'SI');
END;

/*INSERTAR*/
BEGIN
PC_OFERTA.AD_OFERTA('CC',35416363,25000000000000000000,'SI');
END;

/*MODIFICAR*/
CREATE OR REPLACE TRIGGER TG_negociables
BEFORE UPDATE ON oferta
FOR EACH ROW 
BEGIN
    IF :OLD.negociable='NO' OR :OLD.precioOferta<:NEW.precioOferta THEN
    RAISE_APPLICATION_ERROR(-20009,'El precioOferta puede disminuir, si y solo si negociable es 1.');
    END IF;
END TG_negociables;

BEGIN
PC_OFERTA.MO_OFERTA (1,200000000);
END;