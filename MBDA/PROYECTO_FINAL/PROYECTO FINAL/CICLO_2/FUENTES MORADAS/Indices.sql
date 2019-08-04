---------------------------------------------------------------------------------------------------------------------------
                                              /*CICLO 1: Indices*/
---------------------------------------------------------------------------------------------------------------------------

--Propuesta
CREATE INDEX IPropuestas ON propuesta (tid,nid);

--Negocio
CREATE INDEX INegocios ON negocio (propietario);

--Seguimiento
CREATE INDEX ISeguimientos ON segumiento (porcentaje);

--Documento
CREATE INDEX IDocumentos ON documento (numero);
