--------------------------------------------------------------------------------------------------------------------------
                                                  /*CICLO 1: Tuplas*/
--------------------------------------------------------------------------------------------------------------------------

/*ADICION*/
/* XOR en factor match. Es el numero de una solicitud o de una oferta. Pero no ambas (CK_XOR_factorMatch)*/ 
ALTER TABLE factorMatch ADD CONSTRAINT CK_XOR_factorMatch CHECK ((numero_oferta IS NULL AND numero_solicitud IS NOT NULL) 
OR (numero_solicitud IS NULL AND numero_oferta IS NOT NULL));

---------------------------------------------------MANTENER SOLICITUD-----------------------------------------------------

/*ADICION*/
--El precio_max debe ser mayor al precio_min. (CK_precio_min_max)
ALTER TABLE solicitud ADD CONSTRAINT CK_precio_min_max CHECK (precio_max > precio_min);

