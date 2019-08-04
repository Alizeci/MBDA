
------------------------------------------------------------------------------------------------------------
                                       /*CICLO 1: PoblarNoOK*/
------------------------------------------------------------------------------------------------------------

--En oferta negociable es 'SI' o 'NO'
INSERT INTO oferta VALUES (1,'CC',35416363,TO_DATE('2018/01/03','yyyy/mm/dd'),25000000,'YA');

--En solicitud el participante con nid 1075689854 no esta en participante
INSERT INTO solicitud VALUES (2,'CC',1075689854,TO_DATE('2018/01/03','yyyy/mm/dd'),18000000,20000000);

--la actualizacion corresponde a un oferta, no solicitud
INSERT INTO actualizacion VALUES (2,TO_DATE('2018/01/03','yyyy/mm/dd'));

--En tipoOferta el id debe ser una cadena 'V' o 'A'
INSERT INTO tipoOferta VALUES(101,23);

--No esta permitido un registro con numero de oferta y numero de solicitud al tiempo en factorMatch
INSERT INTO factormatch VALUES (1,1,2,'PROCESO');
