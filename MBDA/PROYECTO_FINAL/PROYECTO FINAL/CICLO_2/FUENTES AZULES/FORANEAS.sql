----------------------------------------------------------------------------------------------------------------------------------------
                                                       /*CICLO 2: Foraneas*/
----------------------------------------------------------------------------------------------------------------------------------------

--propuesta-participante
ALTER TABLE propuesta ADD CONSTRAINT FK_propuesta_participante FOREIGN KEY (tid,nid) REFERENCES participante (tid,nid);
--propuesta-negocio
ALTER TABLE propuesta ADD CONSTRAINT FK_propuesta_negocio FOREIGN KEY (id_negocio) REFERENCES negocio (id_negocio);

--seguimiento-documento
ALTER TABLE seguimiento ADD CONSTRAINT FK_seguimiento_documento FOREIGN KEY (documento) REFERENCES documento (numero);
--promesa-documento
ALTER TABLE promesa ADD CONSTRAINT FK_promesa_documento FOREIGN KEY (numero) REFERENCES documento (numero);
--escritura-documento
ALTER TABLE escritura ADD CONSTRAINT FK_escritura_documento FOREIGN KEY (numero) REFERENCES documento (numero);

--negocio-seguimiento
ALTER TABLE negocio ADD CONSTRAINT FK_negocio_seguimiento FOREIGN KEY (id_seguimiento) REFERENCES seguimiento (id_seguimiento);
--factormatch-seguimiento
ALTER TABLE factorMatch ADD CONSTRAINT FK_factormatch_seguimiento FOREIGN KEY (id_seguimiento) REFERENCES seguimiento (id_seguimiento);