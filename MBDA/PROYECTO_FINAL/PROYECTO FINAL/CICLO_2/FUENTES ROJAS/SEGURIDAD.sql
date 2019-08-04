---------------------------------------------------------------------------------------------------------------------------
                                              /*CICLO 1: SEGURIDAD*/
---------------------------------------------------------------------------------------------------------------------------

/*COMPRADOR*/
CREATE ROLE COMPRADOR;
GRANT EXECUTE ON PA_COMPRADOR TO COMPRADOR;

/*VENDEDOR*/
CREATE ROLE VENDEDOR;
GRANT EXECUTE ON PA_VENDEDOR TO VENDEDOR;

/*ADMIN*/
CREATE ROLE ADMIN;
GRANT EXECUTE ON PA_ADMIN TO ADMIN;



REVOKE EXECUTE ON PA_COMPRADOR FROM COMPRADOR;
REVOKE EXECUTE ON PA_VENDEDOR FROM VENDEDOR;
REVOKE EXECUTE ON PA_ADMIN FROM ADMIN;