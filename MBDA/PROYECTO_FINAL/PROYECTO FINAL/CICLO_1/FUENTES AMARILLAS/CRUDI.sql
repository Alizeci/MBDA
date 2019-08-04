---------------------------------------------------------------------------------------------------------------------------
                                                 /*CICLO 1: CRUDI*/
---------------------------------------------------------------------------------------------------------------------------

/*SOLICITUD*/
CREATE OR REPLACE PACKAGE BODY PC_SOLICITUDES IS
  PROCEDURE AD_SOLICITUD (xtid IN CHAR, xnid IN NUMBER, xprecio_min IN NUMBER, xprecio_max IN NUMBER) IS
    BEGIN
    INSERT INTO solicitud (tid, nid, precio_min, precio_max) VALUES (xtid, xnid, xprecio_min, xprecio_max);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    RAISE_APPLICATION_ERROR (-20039,'No se puede insertar solicitud.');
  END;
  
  PROCEDURE MO_SOLICITUD (xnumero IN NUMBER, xprecio_max IN NUMBER) IS
    BEGIN
    UPDATE solicitud SET precio_max = xprecio_max WHERE numero = xnumero;
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    RAISE_APPLICATION_ERROR (-20038,'No se puede modificar la solicitud, unicamente el precio_max.');
  END;

  PROCEDURE EL_SOLICITUD (xnumero IN NUMBER) IS
    BEGIN
    DELETE FROM solicitud WHERE numero = xnumero;
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    RAISE_APPLICATION_ERROR (-20037, 'No se puede eliminar la solicitud.');
  END;

  FUNCTION CO_SOLICITUD RETURN SYS_REFCURSOR IS CO_SOL SYS_REFCURSOR;
    BEGIN
    OPEN CO_SOL FOR
        SELECT o.numero, o.precio_min, o.precio_max, p.nombre AS PISO, h.numero AS NUM_HAB, t.id AS TIPOFERTA, i.nombre AS INMUEBLE, a.m_terreno AS AREATERRENO, e.numero AS ESTRATO, u.departamento, u.ciudad, an.tiempo AS ANTIGUEDAD, c.id AS CONDICION, f.estado
        FROM solicitud o JOIN factorMatch f ON (o.numero = f.numero_solicitud) JOIN tipoPiso p ON (f.factorid = p.factorid) JOIN habitacion h ON (f.factorid = h.factorid) JOIN tipoOferta t ON (f.factorid = t.factorid) JOIN inmueble i ON (f.factorid = i.factorid) JOIN area a ON (f.factorid = a.factorid) JOIN estrato e ON (f.factorid = e.factorid) JOIN ubicacion u ON (f.factorid = u.factorid) JOIN antiguedad an ON (f.factorid = an.factorid) JOIN condicion c ON (f.factorid = c.factorid);
    RETURN CO_SOL;
  END;

  FUNCTION CO_ESTADO RETURN SYS_REFCURSOR IS CO_EST SYS_REFCURSOR;
    BEGIN
    OPEN CO_EST FOR
        SELECT numero, estado
        FROM factormatch JOIN solicitud ON (factormatch.numero_solicitud = solicitud.numero);      
    RETURN CO_EST;
  END;
END PC_SOLICITUDES;
/

/*OFERTA*/
CREATE OR REPLACE PACKAGE BODY PC_OFERTAS IS 
  PROCEDURE AD_OFERTA (xtid IN CHAR,xnid IN NUMBER,xprecioOferta IN NUMBER,xnegociable IN CHAR) IS 
    BEGIN
      INSERT INTO oferta(tid,nid,precioOferta,negociable) VALUES(xtid,xnid,xprecioOferta,xnegociable);
      COMMIT;
      EXCEPTION
      WHEN OTHERS THEN 
      ROLLBACK;
      raise_application_error(-20101,'Error al Insertar en oferta');
    END;
    
  PROCEDURE AD_ACTUALIZACION (xnumero IN NUMBER) IS 
    BEGIN
      INSERT INTO actualizacion(numero) VALUES(xnumero);
      COMMIT;
      EXCEPTION
      WHEN OTHERS THEN 
      ROLLBACK;
      raise_application_error(-20101,'Error al Insertar en actualizacion');
    END;
    
  PROCEDURE MO_OFERTA(xnumero IN NUMBER,xprecioOferta IN NUMBER) IS
  BEGIN 
    UPDATE oferta SET precioOferta= xprecioOferta WHERE numero= xnumero;
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20103,'Error al modificar en oferta');
  END;
  
  PROCEDURE EL_OFERTA(xnumero IN NUMBER) IS
  BEGIN
    DELETE FROM oferta WHERE (numero=xnumero);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20102,'Error al eliminar en oferta');
  END;
  
  FUNCTION CO_ESTADO_OFERTA RETURN SYS_REFCURSOR IS CO_EST SYS_REFCURSOR;
  BEGIN
    OPEN CO_EST FOR
    SELECT tid,numero,fecha,precioOferta FROM oferta;
    RETURN CO_EST;
  END;
END PC_OFERTAS;
/

/*PARTICIPANTE*/
CREATE OR REPLACE PACKAGE BODY PC_PARTICIPANTE IS 
  PROCEDURE AD_PARTICIPANTE (xtid IN CHAR, xnid IN NUMBER, xnombre IN VARCHAR2, xapellido IN VARCHAR2, xemail IN VARCHAR2) IS
    BEGIN
    INSERT INTO participante (tid, nid, nombre, apellido, email)
    VALUES (xtid, xnid, xnombre, xapellido, xemail);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
    RAISE_APPLICATION_ERROR (-20039,'No se puede insertar participante.');
  END;

  PROCEDURE EL_PARTICIPANTE (xtid IN CHAR, xnid IN NUMBER) IS
    BEGIN
    DELETE FROM participante WHERE nid = xnid;
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
    RAISE_APPLICATION_ERROR (-20038,'No se puede eliminar el participante.');
  END;

  PROCEDURE AD_TELEFONO (xtid IN CHAR, xnid IN NUMBER, xnumero IN NUMBER);
    BEGIN
    INSERT INTO telefono (tid, nid, numero)
    VALUES (xtid, xnid, xnumero);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
    RAISE_APPLICATION_ERROR (-20039,'No se puede insertar telefono.');
  END;
END PC_PARTICIPANTE ;
/

/*FACTORMATCH*/
CREATE OR REPLACE PACKAGE BODY PC_FactorMatch IS
  FUNCTION CO_condicion RETURN SYS_REFCURSOR IS CO_con SYS_REFCURSOR;
  BEGIN
    OPEN CO_con FOR
    SELECT * FROM condicion;
    RETURN CO_con;
  END;
  
  FUNCTION CO_Tipopiso RETURN SYS_REFCURSOR IS CO_TIP SYS_REFCURSOR;
  BEGIN
    OPEN CO_TIP FOR
    SELECT * FROM Tipopiso;
    RETURN CO_TIP;
  END;
  
  FUNCTION CO_habitacion RETURN SYS_REFCURSOR IS CO_HAB SYS_REFCURSOR;
  BEGIN
    OPEN CO_HAB FOR
    SELECT * FROM habitacion;
    RETURN CO_HAB;
  END;
  
  FUNCTION CO_tipooferta RETURN SYS_REFCURSOR IS CO_TIF SYS_REFCURSOR;
  BEGIN
    OPEN CO_TIF FOR
    SELECT * FROM tipooferta;
    RETURN CO_TIF;
  END;
  
  FUNCTION CO_antiguedad RETURN SYS_REFCURSOR IS CO_ANT SYS_REFCURSOR;
  BEGIN
    OPEN CO_ANT FOR
    SELECT * FROM antiguedad;
    RETURN CO_ANT;
  END;
  
  FUNCTION CO_inmueble RETURN SYS_REFCURSOR IS CO_INM SYS_REFCURSOR;
  BEGIN
    OPEN CO_INM FOR
    SELECT * FROM inmueble;
    RETURN CO_INM;
  END;
  
  FUNCTION CO_estrato RETURN SYS_REFCURSOR IS CO_EST SYS_REFCURSOR;
  BEGIN
    OPEN CO_EST FOR
    SELECT * FROM estrato;
    RETURN CO_EST;
  END;
  
  FUNCTION CO_area RETURN SYS_REFCURSOR IS CO_ARE SYS_REFCURSOR;
  BEGIN
    OPEN CO_ARE FOR
    SELECT * FROM area;
    RETURN CO_ARE;
  END;
END PC_FactorMatch;
/
  
