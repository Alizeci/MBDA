--------------------------------------------------------------------------------------------------------------------------
                                                  /*CICLO 1: Tuplas*/
--------------------------------------------------------------------------------------------------------------------------

/*ADICION*/
--El propietario debe ser el mismo que tiene la titularidad. (CK_titular)
ALTER TABLE negocio ADD CONSTRAINT CK_titular CHECK (propietario = titularidad);

