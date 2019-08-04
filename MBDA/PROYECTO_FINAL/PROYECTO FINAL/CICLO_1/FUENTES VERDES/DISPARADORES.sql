
-----------------------------------------------------------------------------------------------------------------------------------------
                                                        /*CICLO 1: Disparadores*/ 
-----------------------------------------------------------------------------------------------------------------------------------------

/*ADICION*/
--El factorid y estado se asignan automaticamente. (TG_auto_factorMatch)
CREATE SEQUENCE secuencia_factorMatch START WITH 1 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER TG_auto_factorMatch
BEFORE INSERT ON factorMatch
FOR EACH ROW
DECLARE
BEGIN
    :new.factorid := secuencia_factorMatch.nextval;
    :new.estado := 'PROCESO';
END TG_auto_factorMatch;
/

-----------------------------------------------------------MANTENER SOLICITUD------------------------------------------------------------

/*ADICION*/
--El numero y la fecha se asignan automaticamente.  (TG_auto_solicitud)
CREATE SEQUENCE secuencia_auto START WITH 1 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER TG_auto_solicitud
BEFORE INSERT ON solicitud
FOR EACH ROW
DECLARE
F DATE;
BEGIN
    :new.numero := secuencia_auto.nextval;
    F := TO_DATE(SYSDATE,'YYYY-MM-DD');
    :new.fecha := F;
END TG_auto_solicitud;
/
--El comprador no puede tener mas de dos solicitudes. (TG_dos_solicitud)
CREATE OR REPLACE TRIGGER TG_dos_solicitud
AFTER INSERT ON solicitud
DECLARE
    sol NUMBER;
BEGIN
    BEGIN
        SELECT
            COUNT(*) INTO sol
        FROM solicitud S
        
        INNER JOIN participante P
        ON P.nid = S.nid
        
        GROUP BY P.nid
        HAVING count(*) > 2;
    EXCEPTION
        WHEN no_data_found THEN
            sol := 0;
    END;
    
    IF sol > 2 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Un Comprador no puede tener mas de 2 solicitudes.');
    END IF;
END TG_dos_solicitud;
/

/*MODIFICACION*/
--No esta permitido modificar los datos de identificacion del participante. (TG_mod_participante)
CREATE OR REPLACE TRIGGER TG_mod_participante
BEFORE UPDATE ON participante
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20006, 'Los participantes no se pueden modificar');
END;
/

/*ELIMINACION*/
--Los compradores siempre se pueden eliminar, si no tienen solicitudes. (TG_elimina_comprador)
CREATE OR REPLACE TRIGGER TG_elimina_comprador
BEFORE DELETE ON participante
FOR EACH ROW
DECLARE
    Sol NUMBER ;
BEGIN
    SELECT COUNT(*) INTO Sol FROM solicitud WHERE :old.nid = nid;
    IF Sol > 0 THEN
      raise_application_error(-20004,'No se puede eliminar, tiene solicitudes asociadas.');
    END IF;
END TG_elimina_comprador;
/

-----------------------------------------------------------MANTENER OFERTA--------------------------------------------------------------

/*ADICION*/
--El numero y la fecha se asignan automaticamente. (TG_auto_oferta)
CREATE OR REPLACE TRIGGER TG_auto_oferta
BEFORE INSERT ON oferta
FOR EACH ROW
DECLARE
F DATE;
BEGIN
    :new.numero :=secuencia_auto.nextval;
    F := TO_DATE(SYSDATE,'YYYY-MM-DD');
    :new.fecha := F;
END TG_auto_oferta;
/
--La fecha de las actualizaciones se insertan automaticamente. (TG_auto_fecha_actualizacion)
CREATE OR REPLACE TRIGGER TG_auto_fecha_actualizacion
BEFORE INSERT ON actualizacion
FOR EACH ROW
DECLARE
F DATE;
BEGIN
    F := TO_DATE(SYSDATE,'YYYY-MM-DD');
    :new.ultima_actualizacion := F;
END TG_auto_fecha_actualizacion;
/

/*MODIFICACION*/
--El precioOferta puede disminuir, si y solo si negociable es SI. (TG_negociable)
CREATE OR REPLACE TRIGGER TG_negociable
AFTER UPDATE ON oferta
FOR EACH ROW 
BEGIN
    IF :OLD.negociable='NO' OR :OLD.precioOferta>:NEW.precioOferta THEN
        RAISE_APPLICATION_ERROR(-20009,'El precioOferta puede disminuir, si y solo si negociable es SI.');
    END IF;
END TG_negociable;
/
---No esta permitido modificar el numero, tipo de identificacion, fecha y numero de identificacion de la oferta. (TG_modificar_oferta)
CREATE OR REPLACE TRIGGER TG_modificar_oferta
BEFORE UPDATE ON oferta
FOR EACH ROW
BEGIN
    IF :OLD.numero!=:NEW.numero OR :OLD.tid!=:NEW.tid OR :OLD.fecha!=:NEW.fecha OR :OLD.nid!=:NEW.nid THEN
        RAISE_APPLICATION_ERROR(-20003,'No esta permitido modificar la oferta, excepto el precioOferta');
    END IF;
END TG_modificar_oferta;
/

/*ELIMINACION*/
--Es posible eliminar la oferta si su estado es 'CERRADA'. (TG_elimina_oferta)
CREATE OR REPLACE TRIGGER TG_elimina_oferta
BEFORE DELETE ON oferta
FOR EACH ROW 
DECLARE
disponible CHAR(7);
BEGIN
    SELECT estado INTO disponible FROM factorMatch WHERE factorid=:OLD.numero; 
    IF disponible != 'CERRADA' THEN
        RAISE_APPLICATION_ERROR(-20012,'Solo es posible eliminar la oferta si su estado es CERRADA');
    END IF;
END TG_elimina_oferta;
/
--Los vendedores se deben de poder eliminar si no tienen ofertas asociadas. (TG_elimina_vendedor)
CREATE OR REPLACE TRIGGER TG_elimina_vendedor
BEFORE DELETE ON participante
FOR EACH ROW
DECLARE
ofer NUMBER;
BEGIN
    SELECT COUNT(*) INTO ofer FROM oferta WHERE nid=:OLD.nid;
    IF ofer > 0  THEN
        RAISE_APPLICATION_ERROR(-20005,'No se puede eliminar, tiene ofertas asociadas.');
    END IF;
END TG_elimina_vendedor;
/