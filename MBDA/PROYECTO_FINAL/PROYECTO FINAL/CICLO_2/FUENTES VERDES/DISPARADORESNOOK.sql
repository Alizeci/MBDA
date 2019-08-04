-----------------------------------------------------------------------------------------------------------------------------------------
                                                        /*CICLO 1: DisparadoresNoOK*/ 
-----------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------MANTENER SEGUIMIENTO------------------------------------------------------------

/*MODIFICACION*/
--No esta permitido modificar la fecha de inicio.(TG_mod_seg)
UPDATE seguimiento SET fechaini=TO_DATE('2018/08/21','yyyy/mm/dd') where id_seguimiento=21;

-----------------------------------------------------------MANTENER DOCUMENTO------------------------------------------------------------

/*MODIFICACION*/
--No esta permitido modificar el documento. (TG_mod_doc)
UPDATE documento SET fecha=TO_DATE('2018/08/23','yyyy/mm/dd') where numero=1;

-----------------------------------------------------------REGISTRAR PROPUESTA------------------------------------------------------------

/*ADICION*/
--El participante no puede registrar más de dos propuestas. (TG_dos_propuestas)
INSERT INTO propuesta (tid,nid,propuesta,id_negocio) VALUES('CC',1075689856,'Ofrezco cinco millones mas al precio origial',1);
INSERT INTO propuesta (tid,nid,propuesta,id_negocio) VALUES('CC',1075689856,'Ofrezco seis millones mas al precio origial',1);
INSERT INTO propuesta (tid,nid,propuesta,id_negocio) VALUES('CC',1075689856,'Ofrezco siete millones mas al precio origial',1);

/*MODIFICACION*/
--No esta permitido modificar los datos de identificacion del participante. (TG_mod_participante)
INSERT INTO participante VALUES ('CC',1075689856,'Lina','Izquierdo','lalita@mail.com');

UPDATE participante SET nombre='yajanny' where nid=1075689856;

-----------------------------------------------------------REGISTRAR NEGOCIO--------------------------------------------------------------

/*MODIFICACION*/
--No esta permitido modificar los datos del negocio, solamente el estado_juridico. (TG_mod_negocio)
UPDATE negocio SET uso='Hugo Florez' where id_negocio=1;