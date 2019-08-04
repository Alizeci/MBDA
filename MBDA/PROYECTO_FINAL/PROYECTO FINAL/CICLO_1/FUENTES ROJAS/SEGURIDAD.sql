---------------------------------------------------------------------------------------------------------------------------
                                              /*CICLO 1: SEGURIDAD*/
---------------------------------------------------------------------------------------------------------------------------

CREATE ROLE COMPRADOR;

GRANT EXECUTE ON PA_COMPRADOR TO COMPRADOR;

REVOKE EXECUTE ON PA_COMPRADOR FROM COMPRADOR;


CREATE ROLE VENDEDOR;

GRANT EXECUTE ON PA_VENDEDOR TO VENDEDOR;

REVOKE EXECUTE ON PA_VENDEDOR FROM VENDEDOR;