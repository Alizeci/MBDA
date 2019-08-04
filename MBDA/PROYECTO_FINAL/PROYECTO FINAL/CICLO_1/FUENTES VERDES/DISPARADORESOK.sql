-----------------------------------------------------------------------------------------------------------------------------------------
                                                        /*CICLO 1: Disparadores*/ 
-----------------------------------------------------------------------------------------------------------------------------------------

/*ADICION*/
--El factorid y estado se asigna automaticamente. (TG_auto_factorMatch)
INSERT INTO participante VALUES ('CC',1075689856,'Lina','Izquierdo','lalita@mail.com');
INSERT INTO solicitud VALUES (2,'CC',1075689856,TO_DATE('2018/01/03','yyyy/mm/dd'),NULL,22000000);
INSERT INTO factormatch (numero_oferta,numero_solicitud) VALUES (NULL,2);

-----------------------------------------------------------MANTENER SOLICITUD------------------------------------------------------------

/*ADICION*/
--El numero y la fecha se asigna automaticamente. (TG_auto_solicitud)
INSERT INTO solicitud (tid,nid,precio_min,precio_max) VALUES ('CC',1075689854,15000000,28000000);

--El comprador no puede tener mas de dos solicitudes. (TG_dos_solicitud)
INSERT INTO participante VALUES ('CC',1075689856,'Lina','Izquierdo','lalita@mail.com');
INSERT INTO solicitud VALUES (2,'CC',1075689856,TO_DATE('2018/01/03','yyyy/mm/dd'),NULL,188000);
INSERT INTO solicitud VALUES (2,'CC',1075689856,TO_DATE('2018/01/03','yyyy/mm/dd'),NULL,188000);
INSERT INTO solicitud VALUES (2,'CC',1075689856,TO_DATE('2018/01/03','yyyy/mm/dd'),NULL,188000);


/*MODIFICACION*/
--No esta permitido modificar los datos de identificacion del participante. (TG_mod_participante)
INSERT INTO participante VALUES ('NT',2158363,'Alejandra','Mu�oz','mu�roz@mail.com');
INSERT INTO factormatch (numero_oferta,numero_solicitud) VALUES (NULL,113);
INSERT INTO solicitud VALUES (8,'NT',2158363,TO_DATE('2018/08/23','yyyy/mm/dd'),NULL,52000000);

UPDATE participante SET nombre = 'Alejandra' WHERE tid = 'CC';


/*ELIMINACION*/
--Los participantes siempre se pueden eliminar, si no tienen solicitudes. (TG_elimina_comprador)
INSERT INTO participante VALUES ('CC',1075689856,'Lina','Izquierdo','lalita@mail.com');
DELETE FROM participante WHERE nid=1075689856;


-----------------------------------------------------------MANTENER OFERTA--------------------------------------------------------------

/*ADICION*/
--El numero y la fecha se asignan automaticamente. (TG_auto_oferta)
INSERT INTO participante  VALUES ('CC',35416363,'Natsumy','Villalobos','laxita@mail.com');
INSERT INTO oferta (tid,nid,precioOferta,negociable) VALUES ('CC',35416363,25000000,'SI');

--La fecha de las actualizaciones  se inserta automaticamente. (TG_auto_fecha_actualizacion)
INSERT INTO actualizacion(numero) VALUES (1);

/*MODIFICACION*/
--El precioOferta puede disminuir, si y solo si negociable es SI. (TG_negociable)
UPDATE oferta SET precioOferta = 1000 WHERE numero=1;

---No esta permitido modificar el numero, tipo de identificacion, fecha y numero de identificacion de la oferta. (TG_modificar_oferta)
UPDATE oferta SET nid = 12344535 WHERE numero=1;


/*ELIMINACION*/
--Es posible eliminar la oferta si su estado es 'CERRADA'. (TG_elimina_oferta)
UPDATE factorMatch SET estado = 'CERRADA' WHERE factorid = 1;
DELETE FROM oferta WHERE factorid = 1;

--Los vendedores se deben de poder eliminar si no tienen ofertas asociadas. (TG_elimina_vendedor)
INSERT INTO participante VALUES ('CC',35416363,'Luz','Castro','lucecita@mail.com');

DELETE FROM participante WHERE nid=35416363;