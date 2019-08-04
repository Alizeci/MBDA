---------------------------------------------------------------------------------------------------------------------------
                                              /*CICLO 1: CRUDOK*/
---------------------------------------------------------------------------------------------------------------------------

/*SOLICITUD*/
DROP SEQUENCE secuencia_solicitudes;
CREATE SEQUENCE secuencia_solicitudes START WITH 1 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER TG_auto_solicitud
BEFORE INSERT ON solicitud
FOR EACH ROW
DECLARE
F DATE;
BEGIN
    :new.numero :=secuencia_solicitudes.nextval;
    F := TO_DATE(SYSDATE,'YYYY-MM-DD');
    :new.fecha := F;
END TG_auto_solicitud;

/*INSERTAR*/
BEGIN
PC_SOLICITUDES.AD_SOLICITUD('CC',1075689856,NULL,22000000);
END;
/*MODIFICAR*/
BEGIN
PC_SOLICITUDES.MO_SOLICITUD(2,240000);
END;


/*OFERTA*/
--El numero y la fecha  se asigna automAticamente.
CREATE SEQUENCE secuencia_solicitudes START WITH 1 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER TG_auto_ofertas
BEFORE INSERT ON oferta
FOR EACH ROW
DECLARE
F DATE;
BEGIN
    :new.numero :=secuencia_solicitudes.nextval;
    F := TO_DATE(SYSDATE,'YYYY-MM-DD');
    :new.fecha := F;
END TG_auto_ofertas;

--La fecha de las actualizaciones  se inserta automaticamente
CREATE OR REPLACE TRIGGER fechas_actualizacion
BEFORE INSERT ON actualizacion
FOR EACH ROW
DECLARE
fechas DATE;
BEGIN
    fechas := TO_DATE(SYSDATE,'YYYY-MM-DD');
    :NEW.ultima_actualizacion:=fechas;
END fechas_actualizacion;

DROP SEQUENCE secuencia_solicitudes;

/*INSERTAR*/
BEGIN
PC_OFERTA.AD_OFERTA('CC',35416363,250000,'SI');
END;

/*MODIFICAR*/
BEGIN
PC_OFERTA.MO_OFERTA (1,240000);
END;
/*ELIMINAR*/
BEGIN
PC_OFERTA.EL_OFERTA (1);
END;
/*CONSULAR*/
SELECT PC_OFERTA.CO_ESTADO_OFERTA FROM DUAL;