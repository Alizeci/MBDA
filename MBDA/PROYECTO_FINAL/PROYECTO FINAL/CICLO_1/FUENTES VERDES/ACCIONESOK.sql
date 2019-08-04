-----------------------------------------------------------------------------------------------------------------------------------------
                                                       /*CICLO 1: Acciones*/
-----------------------------------------------------------------------------------------------------------------------------------------

/*ELIMINACION*/
--Si se elimina el participante, se elimina sus telefonos asociados. (AC_elimina_telefonos)
INSERT INTO participante VALUES ('CC',1075689856,'Lina','Izquierdo','lalita@mail.com');
INSERT INTO telefono VALUES ('CC',1075689856,3118104371);

DELETE FROM participante p WHERE p.nid = 1075689856;

/*ELIMINACION*/
--Los factores para hacer match se eliminan, si se elimina su factor match. (AC_elimina_factores)
INSERT INTO factormatch VALUES (200,NULL,1,'PROCESO');
/*operador*/
INSERT INTO operador VALUES (1,'<');
/*area*/
INSERT INTO area VALUES(1,70.2,54.6);
/*estrato*/
INSERT INTO estrato VALUES(1,3);
/*inmueble*/
INSERT INTO inmueble VALUES(1,'Casa','Amplia Casa');
/*ubicacion*/
INSERT INTO ubicacion VALUES(1,'Cundinamarca','Bogotá','Norte',NULL);
/*antiguedad*/
INSERT INTO antiguedad VALUES(1,NULL);
/*tipoOferta*/
INSERT INTO tipoOferta VALUES(1,'V');
/*habitacion*/
INSERT INTO habitacion VALUES(1,4,NULL);
/*tipoPiso*/
INSERT INTO tipoPiso VALUES(1,'MAD',3,NULL);
/*condicion*/
INSERT INTO condicion VALUES(1,'NUEVO');
/*extra*/
INSERT INTO extra VALUES(1,'Con jardín');

DELETE FROM factorMatch f WHERE f.factorid = 1;


-----------------------------------------------------------MANTENER SOLICITUD------------------------------------------------------------

/*ELIMINACION*/
--El factorMatch se elimina, si se elimina su solicitud. (AC_elimina_factorMatch)
INSERT INTO solicitud VALUES (2,'NT',2158364,TO_DATE('2018/01/03','yyyy/mm/dd'),NULL,188000);
INSERT INTO factormatch VALUES (200,NULL,2,'PROCESO');

DELETE FROM solicitud s WHERE s.numero = 2;

-----------------------------------------------------------MANTENER OFERTA--------------------------------------------------------------

/*ELIMINACION*/
--Las actualizaciones se eliminan, si se elimina la oferta. (AC_elimina_actualizacion)
INSERT INTO participante VALUES ('NT',2158363,'Alejandra','Muñoz','muñroz@mail.com');
INSERT INTO oferta VALUES (2,'NT',2158363,TO_DATE('2018/01/03','yyyy/mm/dd'),NULL,188000);
INSERT INTO actualizacion VALUES (2,TO_DATE('2018/01/06','yyyy/mm/dd'));

DELETE FROM actualizacion WHERE numero=2;

--El factorMatch se elimina, si se elimina su oferta asociada. (AC_elimina_factorMath_ofer)
INSERT INTO oferta VALUES (2,'NT',2158363,TO_DATE('2018/01/03','yyyy/mm/dd'),NULL,188000);
INSERT INTO factormatch VALUES (2,NULL,2,'PROCESO');
UPDATE factorMatch SET estado = 'CERRADA' WHERE numero_oferta = 2;

DELETE FROM oferta o WHERE o.numero = 2;
