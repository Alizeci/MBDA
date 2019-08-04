--------------------------------------------------------------------------------------------------------------------------
                                                  /*CICLO 1: Tuplas*/
--------------------------------------------------------------------------------------------------------------------------

/*ADICION*/
/* XOR en factor match. Es el numero de una solicitud o de una oferta. Pero no ambas (CK_XOR_factorMatch)*/ 
INSERT INTO participante VALUES ('CC',1075689856,'Lina','Izquierdo','lalita@mail.com');
INSERT INTO oferta VALUES (1,'CC',35416363,TO_DATE('2018/01/03','yyyy/mm/dd'),25000000,'SI');
INSERT INTO solicitud VALUES (2,'CC',1075689856,TO_DATE('2018/01/03','yyyy/mm/dd'),NULL,22000000);

INSERT INTO factormatch VALUES (1,1,NULL,'PROCESO');
INSERT INTO factormatch VALUES (1,NULL,2,'PROCESO');

---------------------------------------------------MANTENER SOLICITUD-----------------------------------------------------

/*MODIFICACION*/
--El precio_max debe ser mayor al precio_min. (CK_precio_min_max)
INSERT INTO participante VALUES ('CC',1075689856,'Lina','Izquierdo','laliuta@mail.com');
INSERT INTO factormatch VALUES (1,NULL,112,'PROCESO');
INSERT INTO solicitud VALUES (2,'CC',1075689856,TO_DATE('2018/01/03','yyyy/mm/dd'),18000000,22000000);

UPDATE solicitud SET precio_min = 400000 WHERE numero = 2;