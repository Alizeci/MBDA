-----------------------------------------------------------------------------------------------------------------------------------------
                                                        /*CICLO 1: Disparadores*/ 
-----------------------------------------------------------------------------------------------------------------------------------------

/*ADICION*/
--El factorid y estado se asigna automaticamente. (TG_auto_factorMatch)
INSERT INTO participante (tid,nid,nombre,apellido,email) VALUES ('CC',1075689854,'Lina','Izquierdo','laxlita@mail.com');
INSERT INTO factormatch (factorid,numero_oferta,numero_solicitud) VALUES (1,NULL,1);

-----------------------------------------------------------MANTENER SOLICITUD------------------------------------------------------------

/*ADICION*/
--El numero y la fecha se asigna automaticamente. (TG_auto_solicitud)
INSERT INTO solicitud (numero,tid,nid,precio_min,precio_max) VALUES (111,'CC',1075689854,15000000,28000000);

--El comprador no puede tener mas de dos solicitudes. (TG_dos_solicitud)
INSERT INTO factormatch VALUES (1,NULL,3,'PROCESO');
UPDATE factormatch SET estado = 'CERRADA' WHERE numero_solicitud = 1;
INSERT INTO solicitud VALUES (3,'CC',1075689856,TO_DATE('2018/08/23','yyyy/mm/dd'),100,43000);


/*MODIFICACION*/
--No esta permitido modificar los datos de identificacion del comprador, excepto telefono. (TG_mod_participante)
INSERT INTO participante VALUES ('NT',2158363,'Alejandra','Mu�oz','mu�roz@mail.com');
INSERT INTO factormatch (numero_oferta,numero_solicitud) VALUES (NULL,113);
INSERT INTO solicitud VALUES (8,'NT',2158363,TO_DATE('2018/08/23','yyyy/mm/dd'),NULL,52000000);

UPDATE telefono SET nombre = 'Alejandro' WHERE tid = 'NT';


/*ELIMINACION*/
--Los participantes siempre se pueden eliminar, si no tienen solicitudes. (TG_elimina_comprador)
INSERT INTO participante VALUES ('NT',2158363,'Alejandra','Mu�oz','mu�roz@mail.com');
INSERT INTO solicitud VALUES (8,'NT',2158363,TO_DATE('2018/08/23','yyyy/mm/dd'),NULL,52000000);

DELETE FROM participante WHERE nid=2158363;


-----------------------------------------------------------MANTENER OFERTA--------------------------------------------------------------

/*MODIFICACION*/
--El precioOferta puede disminuir, si y solo si negociable es SI. (TG_negociable)
INSERT INTO factormatch VALUES (202,102,NULL,'PROCESO');
INSERT INTO oferta VALUES (102,'NT',2158331,TO_DATE('2016/11/23','yyyy/mm/dd'),22000000,'NO');

UPDATE oferta SET  precioOferta = 1000000 WHERE numero=1;

---No esta permitido modificar el numero, tipo de identificacion, fecha y numero de identificacion de la oferta. (TG_modificar_oferta)
UPDATE oferta SET  nid = 1243 WHERE numero=102;


/*ELIMINACION*/
--Es posible eliminar la oferta si su estado es 'CERRADA'. (TG_elimina_oferta)
DELETE FROM oferta WHERE factorid=2;
