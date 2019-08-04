------------------------------------------------------------------------------------------------------------------------------
                                                  /*CICLO 1: Foraneas*/
------------------------------------------------------------------------------------------------------------------------------

--telefono-participante
ALTER TABLE telefono ADD CONSTRAINT FK_telefono_participante FOREIGN KEY (tid,nid) REFERENCES participante (tid,nid);
--solicitud-participante
ALTER TABLE solicitud ADD CONSTRAINT FK_solicitud_participante FOREIGN KEY (tid,nid) REFERENCES participante (tid,nid);
--oferta-participante
ALTER TABLE oferta ADD CONSTRAINT FK_oferta_participante FOREIGN KEY (tid,nid) REFERENCES participante (tid,nid);
--actualizacion-oferta
ALTER TABLE actualizacion ADD CONSTRAINT FK_actualizacion_oferta FOREIGN KEY (numero) REFERENCES oferta (numero);

--factorMatch-solicitud
ALTER TABLE factorMatch ADD CONSTRAINT FK_factorMatch_solicitud FOREIGN KEY (numero_solicitud) REFERENCES solicitud (numero);
--factorMatch-oferta
ALTER TABLE factorMatch ADD CONSTRAINT FK_factorMatch_oferta FOREIGN KEY (numero_oferta) REFERENCES oferta (numero);

--operador-factorMatch
ALTER TABLE operador ADD CONSTRAINT FK_operador_factorMatch FOREIGN KEY (factorid) REFERENCES factorMatch (factorid);
ALTER TABLE operador ADD CONSTRAINT FK_operador2_factorMatch FOREIGN KEY (factorid2) REFERENCES factorMatch (factorid);

--area-factorMatch
ALTER TABLE area ADD CONSTRAINT FK_area_factorMatch FOREIGN KEY (factorid) REFERENCES factorMatch (factorid);
--estrato-factorMatch
ALTER TABLE estrato ADD CONSTRAINT FK_estrato_factorMatch FOREIGN KEY (factorid) REFERENCES factorMatch (factorid);
--inmueble-factorMatch
ALTER TABLE inmueble ADD CONSTRAINT FK_inmueble_factorMatch FOREIGN KEY (factorid) REFERENCES factorMatch (factorid);
--ubicacion-factorMatch
ALTER TABLE ubicacion ADD CONSTRAINT FK_ubicacion_factorMatch FOREIGN KEY (factorid) REFERENCES factorMatch (factorid);
--antiguedad-factorMatch
ALTER TABLE antiguedad ADD CONSTRAINT FK_antiguedad_factorMatch FOREIGN KEY (factorid) REFERENCES factorMatch (factorid);
--tipoOferta-factorMatch
ALTER TABLE tipoOferta ADD CONSTRAINT FK_tipoOferta_factorMatch FOREIGN KEY (factorid) REFERENCES factorMatch (factorid);
--habitacion-factorMatch
ALTER TABLE habitacion ADD CONSTRAINT FK_habitacion_factorMatch FOREIGN KEY (factorid) REFERENCES factorMatch (factorid);
--tipoPiso-factorMatch
ALTER TABLE tipoPiso ADD CONSTRAINT FK_tipoPiso_factorMatch FOREIGN KEY (factorid) REFERENCES factorMatch (factorid);
--condicion-factorMatch
ALTER TABLE condicion ADD CONSTRAINT FK_condicion_factorMatch FOREIGN KEY (factorid) REFERENCES factorMatch (factorid);
--extra-factorMatch
ALTER TABLE extra ADD CONSTRAINT FK_extra_factorMatch FOREIGN KEY (factorid) REFERENCES factorMatch (factorid);