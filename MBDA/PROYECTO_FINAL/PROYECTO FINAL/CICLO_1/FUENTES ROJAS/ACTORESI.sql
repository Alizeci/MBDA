---------------------------------------------------------------------------------------------------------------------------
                                              /*CICLO 1: ACTORESI*/
---------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY PA_COMPRADOR IS
    PROCEDURE AD_SOLICITUD (xtid IN CHAR, xnid IN NUMBER, xprecio_min IN NUMBER, xprecio_max IN NUMBER) IS
    BEGIN
        PC_SOLICITUDES.AD_SOLICITUD(xtid, xnid, xprecio_min, xprecio_max);
    END;
  
  PROCEDURE MO_SOLICITUD (xnumero IN NUMBER, xprecio_max IN NUMBER) IS
    BEGIN
        PC_SOLICITUDES.MO_SOLICITUD(xnumero,xprecio_max);
    END;

  PROCEDURE EL_SOLICITUD (xnumero IN NUMBER) IS
    BEGIN
        PC_SOLICITUDES.EL_SOLICITUD(xnumero);
    END;

  FUNCTION CO_SOLICITUD RETURN SYS_REFCURSOR IS CO_SOL SYS_REFCURSOR;
    BEGIN
        CO_SOL:=PC_SOLICITUDES.CO_SOLICITUD;
    RETURN CO_SOL;
    END;
    FUNCTION CO_ESTADO RETURN SYS_REFCURSOR IS CO_EST SYS_REFCURSOR;
    BEGIN
        CO_EST:=CO_ESTADO;
    RETURN CO_EST;
    END;
    
    FUNCTION CO_CONDICION RETURN SYS_REFCURSOR IS CO_CON SYS_REFCURSOR;
    BEGIN
        CO_CON:=CO_CONDICION;
    RETURN CO_CON;
    END;
    
    FUNCTION CO_inmueble RETURN SYS_REFCURSOR IS CO_INM SYS_REFCURSOR;
    BEGIN
        CO_INM:=PC_FactorMatch.CO_inmueble;
    RETURN CO_INM;
    END;
    
    FUNCTION CO_Tipopiso RETURN SYS_REFCURSOR IS CO_TIP SYS_REFCURSOR;
    BEGIN
        CO_TIP:=PC_FactorMatch.CO_Tipopiso;
    RETURN CO_TIP;
    END;
    
    FUNCTION CO_habitacion RETURN SYS_REFCURSOR IS CO_HAB SYS_REFCURSOR;
    BEGIN
        CO_HAB:=PC_FactorMatch.CO_habitacion;
    RETURN CO_HAB;
    END;
    
    FUNCTION CO_tipooferta RETURN SYS_REFCURSOR IS CO_TIF SYS_REFCURSOR;
    BEGIN
        CO_TIF:=PC_FactorMatch.CO_tipooferta;
    RETURN CO_TIF;
    END;
    
    FUNCTION CO_antiguedad RETURN SYS_REFCURSOR IS CO_ANT SYS_REFCURSOR;
    BEGIN
        CO_ANT:=PC_FactorMatch.CO_antiguedad;
    RETURN CO_ANT;
    END;
    
    FUNCTION CO_estrato RETURN SYS_REFCURSOR IS CO_EST SYS_REFCURSOR;
    BEGIN
        CO_EST:=PC_FactorMatch.CO_estrato;
    RETURN CO_EST;
    END;
    

    FUNCTION CO_area RETURN SYS_REFCURSOR IS CO_ARE SYS_REFCURSOR;
    BEGIN
        CO_ARE:=PC_FactorMatch.CO_area;
    RETURN CO_ARE;
    END;
END PA_COMPRADOR;


CREATE OR REPLACE PACKAGE BODY PA_VENDEDOR IS
  PROCEDURE AD_OFERTA (xtid CHAR,xnid NUMBER,xprecioOferta NUMBER,xnegociable CHAR) IS
  BEGIN
    PC_OFERTA.AD_OFERTA(xtid, xnid, xprecioOferta, xnegociable);
  END;
  
  PROCEDURE AD_ACTUALIZACION (xnumero NUMBER) IS
  BEGIN
    PC_OFERTA.AD_ACTUALIZACION(xnumero);
  END;
  
  PROCEDURE MO_OFERTA(xnumero NUMBER,xprecioOferta NUMBER) IS
  BEGIN
    PC_OFERTA.MO_OFERTA(xnumero,xprecioOferta);
  END;
  
  PROCEDURE EL_OFERTA(xnumero NUMBER) IS
  BEGIN
    PC_OFERTA.EL_OFERTA(xnumero);
  END;
  
  FUNCTION CO_ESTADO_OFERTA RETURN SYS_REFCURSOR IS CO_ES SYS_REFCURSOR;
  BEGIN
  CO_ES:=PC_OFERTA.CO_ESTADO_OFERTA;
  RETURN CO_ES;
  END;
  FUNCTION CO_CONDICION RETURN SYS_REFCURSOR IS CO_CON SYS_REFCURSOR;
    BEGIN
        CO_CON:=CO_CONDICION;
    RETURN CO_CON;
    END;
    
    FUNCTION CO_inmueble RETURN SYS_REFCURSOR IS CO_INM SYS_REFCURSOR;
    BEGIN
        CO_INM:=PC_FactorMatch.CO_inmueble;
    RETURN CO_INM;
    END;
    
    FUNCTION CO_Tipopiso RETURN SYS_REFCURSOR IS CO_TIP SYS_REFCURSOR;
    BEGIN
        CO_TIP:=PC_FactorMatch.CO_Tipopiso;
    RETURN CO_TIP;
    END;
    
    FUNCTION CO_habitacion RETURN SYS_REFCURSOR IS CO_HAB SYS_REFCURSOR;
    BEGIN
        CO_HAB:=PC_FactorMatch.CO_habitacion;
    RETURN CO_HAB;
    END;
    
    FUNCTION CO_tipooferta RETURN SYS_REFCURSOR IS CO_TIF SYS_REFCURSOR;
    BEGIN
        CO_TIF:=PC_FactorMatch.CO_tipooferta;
    RETURN CO_TIF;
    END;
    
    FUNCTION CO_antiguedad RETURN SYS_REFCURSOR IS CO_ANT SYS_REFCURSOR;
    BEGIN
        CO_ANT:=PC_FactorMatch.CO_antiguedad;
    RETURN CO_ANT;
    END;
    
    FUNCTION CO_estrato RETURN SYS_REFCURSOR IS CO_EST SYS_REFCURSOR;
    BEGIN
        CO_EST:=PC_FactorMatch.CO_estrato;
    RETURN CO_EST;
    END;
    

    FUNCTION CO_area RETURN SYS_REFCURSOR IS CO_ARE SYS_REFCURSOR;
    BEGIN
        CO_ARE:=PC_FactorMatch.CO_area;
    RETURN CO_ARE;
    END;
END PA_VENDEDOR;