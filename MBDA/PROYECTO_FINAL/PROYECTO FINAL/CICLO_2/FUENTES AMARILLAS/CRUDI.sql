---------------------------------------------------------------------------------------------------------------------------
                                                 /*CICLO 1: CRUDI*/
---------------------------------------------------------------------------------------------------------------------------

/*PROPUESTA*/
CREATE OR REPLACE PACKAGE BODY PC_PROPUESTAS IS
  PROCEDURE AD_PROPUESTA (xtid IN CHAR, xnid IN NUMBER, xpropuesta IN VARCHAR2, xid_negocio IN NUMBER) IS
    BEGIN
      INSERT INTO propuesta (numero,tid, nid, propuesta, id_negocio, fecha) VALUES (SECUENCIA_AUTO.nextval, xtid, xnid, xpropuesta, xid_negocio,SYSDATE);
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
          RAISE_APPLICATION_ERROR (-20039,'No se puede insertar propuesta.');
    END;
  
  PROCEDURE MO_PROPUESTA (xnumero IN NUMBER, xpropuesta IN VARCHAR2) IS
    BEGIN
      UPDATE propuesta SET propuesta = xpropuesta WHERE numero = xnumero;
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
          RAISE_APPLICATION_ERROR (-20038,'No se puede modificar la propuesta');
    END;

  FUNCTION CO_PROPUESTA RETURN SYS_REFCURSOR IS CO_PRO SYS_REFCURSOR;
    BEGIN
      OPEN CO_PRO FOR
        SELECT *
        FROM propuesta;
      RETURN CO_PRO;
    END;
END PC_PROPUESTAS;
/

/*NEGOCIO*/
CREATE OR REPLACE PACKAGE BODY PC_NEGOCIOS IS 
  PROCEDURE AD_NEGOCIO (xpropietario IN VARCHAR, xtitularidad IN VARCHAR, xuso IN VARCHAR, xfruto IN VARCHAR, xestadoJuridico IN XMLTYPE, xid_seguimiento IN NUMBER) IS
    BEGIN
      INSERT INTO negocio (propietario, titularidad, uso, fruto, estadoJuridico, id_seguimiento) VALUES (xpropietario, xtitularidad, xuso, xfruto, xestadoJuridico, xid_seguimiento);
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN 
        ROLLBACK;
          RAISE_APPLICATION_ERROR (-20101,'No se puede insertar negocio');
    END;
    
  PROCEDURE MO_NEGOCIO (xid_negocio IN NUMBER, xestadoJuridico IN XMLTYPE) IS
    BEGIN
      UPDATE negocio SET estadoJuridico = xestadoJuridico WHERE id_negocio = xid_negocio;
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN 
        ROLLBACK;
        RAISE_APPLICATION_ERROR (-20101,'No se puede modificar negocio, unicamente estado_juridico');
    END;
    
  FUNCTION CO_NEGOCIO RETURN SYS_REFCURSOR IS CO_NEG SYS_REFCURSOR;
    BEGIN
      OPEN CO_NEG FOR
        SELECT *
        FROM negocio;
      RETURN CO_NEG;
    END;
    
  FUNCTION CO_ESTADO_JURIDICO RETURN SYS_REFCURSOR IS CO_EST SYS_REFCURSOR;
    BEGIN
      OPEN CO_EST FOR
        SELECT EXTRACT (estadoJuridico, '//estado/*') FROM negocio;
      RETURN CO_EST;
    END;
END PC_NEGOCIOS;
/

/*DOCUMENTO*/
CREATE OR REPLACE PACKAGE BODY PC_DOCUMENTOS IS 
  PROCEDURE AD_DOCUMENTO (ximagen IN VARCHAR) IS
    BEGIN
      INSERT INTO documento (imagen) VALUES (ximagen);
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
          RAISE_APPLICATION_ERROR (-20039,'No se puede insertar documento.');
    END;

  PROCEDURE AD_PROMESA (xnumero IN NUMBER, xinmueble IN VARCHAR, xid_comprador NUMBER, xid_vendedor NUMBER) IS
    BEGIN
      INSERT INTO promesa (numero, inmueble, id_comprador, id_vendedor) VALUES (xnumero, xinmueble, xid_comprador, xid_vendedor);
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
          RAISE_APPLICATION_ERROR (-20039,'No se puede insertar promesa.');
    END;

  PROCEDURE AD_ESCRITURA (xnumero IN NUMBER, xevento IN CHAR) IS
    BEGIN
      INSERT INTO escritura (numero, evento) VALUES (xnumero, xevento);
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
          RAISE_APPLICATION_ERROR (-20039,'No se puede insertar escritura.');
    END;

  PROCEDURE MO_DOCUMENTO (xnumero IN NUMBER) IS
    BEGIN
      UPDATE documento SET numero = xnumero WHERE numero = xnumero;
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN 
        ROLLBACK;
          RAISE_APPLICATION_ERROR (-20101,'No se puede modificar documentos');
    END;
  
  PROCEDURE EL_DOCUMENTO (xnumero IN NUMBER) IS
    BEGIN
      DELETE FROM documento WHERE numero = xnumero;
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN 
        ROLLBACK;
          RAISE_APPLICATION_ERROR (-20101,'No se puede eliminar documentos');
    END;

  FUNCTION CO_DOCUMENTO RETURN SYS_REFCURSOR IS CO_DOC SYS_REFCURSOR;
    BEGIN
      OPEN CO_DOC FOR
        SELECT d.numero, imagen, fecha, inmueble, id_comprador, id_vendedor, evento
        FROM documento d LEFT JOIN promesa p ON (d.numero = p.numero) LEFT JOIN escritura e ON (d.numero = e.numero);
      RETURN CO_DOC;
    END;

  FUNCTION CO_PROMESA RETURN SYS_REFCURSOR IS CO_PROM SYS_REFCURSOR;
    BEGIN
      OPEN CO_PROM FOR
        SELECT *
        FROM promesa;
      RETURN CO_PROM;
    END;

  FUNCTION CO_ESCRITURA RETURN SYS_REFCURSOR IS CO_ESC SYS_REFCURSOR;
    BEGIN
      OPEN CO_ESC FOR
        SELECT *
        FROM escritura;
      RETURN CO_ESC;
    END;
END PC_DOCUMENTOS;
/

/*SEGUIMIENTO*/
CREATE OR REPLACE PACKAGE BODY PC_SEGUIMIENTOS IS
  PROCEDURE AD_SEGUIMIENTO (xdocumento IN NUMBER, xfechafin DATE, xporcentaje IN NUMBER) IS
    BEGIN
      INSERT INTO seguimiento (documento, fechafin, porcentaje) VALUES (xdocumento, xfechafin, xporcentaje);
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
          RAISE_APPLICATION_ERROR (-20039,'No se puede insertar seguimiento');
    END;
  
  PROCEDURE MO_SEGUIMIENTO (xid_seguimiento IN NUMBER, xporcentaje IN NUMBER) IS
    BEGIN
      UPDATE seguimiento SET porcentaje = xporcentaje WHERE id_seguimiento = xid_seguimiento;
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN 
        ROLLBACK;
          RAISE_APPLICATION_ERROR (-20101,'No se puede modificar seguimiento');
    END;

  PROCEDURE EL_SEGUIMIENTO (xid_seguimiento IN NUMBER) IS
    BEGIN
      DELETE FROM seguimiento WHERE id_seguimiento = xid_seguimiento;
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN 
        ROLLBACK;
          RAISE_APPLICATION_ERROR (-20101,'No se puede eliminar seguimiento');
    END;

  FUNCTION CO_SEGUIMIENTO RETURN SYS_REFCURSOR IS CO_SEG SYS_REFCURSOR;
    BEGIN
      OPEN CO_SEG FOR
        SELECT *
        FROM seguimiento;
      RETURN CO_SEG;
    END;

  FUNCTION CO_SEG_POR RETURN SYS_REFCURSOR IS CO_PORC SYS_REFCURSOR;
    BEGIN
      OPEN CO_PORC FOR
        SELECT id_seguimiento, imagen, fechaini, porcentaje
        FROM seguimiento s JOIN documento d ON (s.documento = d.numero)
        WHERE s.porcentaje >= 50;
      RETURN CO_PORC;
    END;

  FUNCTION CO_ACTIVO RETURN SYS_REFCURSOR IS CO_AC SYS_REFCURSOR;
    BEGIN
      OPEN CO_AC FOR
        SELECT *
        FROM seguimiento
        WHERE porcentaje != 100;
      RETURN CO_AC;
    END;
END PC_SEGUIMIENTOS;
/