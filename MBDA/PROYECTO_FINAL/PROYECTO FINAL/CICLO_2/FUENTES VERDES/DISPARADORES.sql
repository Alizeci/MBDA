
-----------------------------------------------------------------------------------------------------------------------------------------
                                                        /*CICLO 1: Disparadores*/ 
-----------------------------------------------------------------------------------------------------------------------------------------

/*ADICION*/
--El factorid y estado se asignan automaticamente. (TG_auto_factorMatch)
CREATE SEQUENCE secuencia_auto0 START WITH 1 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER TG_auto_factorMatch
BEFORE INSERT ON factorMatch
FOR EACH ROW
DECLARE
BEGIN
    :new.factorid := secuencia_auto0.nextval;
    :new.estado := 'PROCESO';
END TG_auto_factorMatch;
/

-----------------------------------------------------------MANTENER SEGUIMIENTO------------------------------------------------------------

--El numero y la fecha se asignan automaticamente. (TG_auto_seguimiento)
CREATE SEQUENCE secuencia_auto3 START WITH 1 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER TG_auto_seguimiento
BEFORE INSERT ON seguimiento
FOR EACH ROW
DECLARE
F DATE;
BEGIN
    :new.id_seguimiento :=secuencia_auto3.nextval;
    F := TO_DATE(SYSDATE,'YYYY-MM-DD');
    :new.fechaini := F;
END TG_auto_seguimiento;
/

--No esta permitido modificar la fecha de inicio.(TG_mod_seg)
CREATE OR REPLACE TRIGGER TG_mod_seg
BEFORE UPDATE ON seguimiento
FOR EACH ROW
BEGIN
    IF :OLD.fechaini!=:NEW.fechaini THEN
        RAISE_APPLICATION_ERROR(-20003,'No esta permitido modificar la fecha de inicio.');
    END IF;
END TG_mod_seg;
/

-----------------------------------------------------------MANTENER DOCUMENTO------------------------------------------------------------

--El numero y la fecha se asignan automaticamente. (TG_auto_doc)
CREATE SEQUENCE secuencia_auto4 START WITH 1 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER TG_auto_doc
BEFORE INSERT ON documento
FOR EACH ROW
DECLARE
F DATE;
BEGIN
    :new.numero :=secuencia_auto4.nextval;
    F := TO_DATE(SYSDATE,'YYYY-MM-DD');
    :new.fecha := F;
END TG_auto_doc;
/

/*MODIFICACION*/
--No esta permitido modificar el documento. (TG_mod_doc)
CREATE OR REPLACE TRIGGER TG_mod_doc
BEFORE UPDATE ON documento
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20006, 'No esta permitido modificar el documento.');
END TG_mod_doc;
/

-----------------------------------------------------------REGISTRAR PROPUESTA------------------------------------------------------------

/*ADICION*/
--El numero y la fecha se asignan automaticamente.  (TG_auto_propuesta)
CREATE SEQUENCE secuencia_auto START WITH 1 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER TG_auto_propuesta
BEFORE INSERT ON propuesta
FOR EACH ROW
DECLARE
F DATE;
BEGIN
    :new.numero := secuencia_auto.nextval;
    F := TO_DATE(SYSDATE,'YYYY-MM-DD');
    :new.fecha := F;
END TG_auto_propuesta;
/
--El participante no puede registrar más de dos propuestas. (TG_dos_propuestas)
CREATE OR REPLACE TRIGGER TG_dos_propuestas
AFTER INSERT ON propuesta
DECLARE
    pro NUMBER;
BEGIN
    BEGIN
        SELECT
            COUNT(*) INTO pro
        FROM propuesta pr
        
        INNER JOIN participante P
        ON P.nid = pr.nid
        
        GROUP BY P.nid
        HAVING count(*) > 2;
    EXCEPTION
        WHEN no_data_found THEN
            pro := 0;
    END;
    
    IF pro > 2 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Un Participante no puede tener mas de 2 propuestas.');
    END IF;
END TG_dos_propuestas;
/

/*MODIFICACION*/
--No esta permitido modificar los datos de identificacion del participante. (TG_mod_participante)
CREATE OR REPLACE TRIGGER TG_mod_participante
BEFORE UPDATE ON participante
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20006, 'Los participantes no se pueden modificar');
END TG_mod_participante;
/

-----------------------------------------------------------REGISTRAR NEGOCIO--------------------------------------------------------------

/*ADICION*/
--El numero y la fecha se asignan automaticamente. (TG_auto_negocio)
CREATE SEQUENCE secuencia_auto2 START WITH 1 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER TG_auto_negocio
BEFORE INSERT ON negocio
FOR EACH ROW
DECLARE
BEGIN
    :new.id_negocio :=secuencia_auto2.nextval;
END TG_auto_negocio;
/

/*MODIFICACION*/
--No esta permitido modificar los datos del negocio, solamente el estadoJuridico. (TG_mod_negocio)
CREATE OR REPLACE TRIGGER TG_mod_negocio
BEFORE UPDATE ON negocio
FOR EACH ROW
BEGIN
    IF :OLD.id_negocio!=:NEW.id_negocio OR :OLD.propietario!=:NEW.propietario OR :OLD.titularidad!=:NEW.titularidad OR :OLD.uso!=:NEW.uso OR :OLD.fruto!=:NEW.fruto THEN
        RAISE_APPLICATION_ERROR(-20003,'No esta permitido modificar los datos del negocio, solamente el estado_juridico.');
    END IF;
END TG_mod_negocio;
/