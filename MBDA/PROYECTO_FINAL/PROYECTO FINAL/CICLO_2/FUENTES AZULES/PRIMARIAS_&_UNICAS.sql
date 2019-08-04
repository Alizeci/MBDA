-----------------------------------------------------------------------------------------
                           /*CICLO 2: Primarias & Unicas*/
-----------------------------------------------------------------------------------------

--PK's--
ALTER TABLE participante ADD CONSTRAINT PK_participante PRIMARY KEY (tid,nid);
ALTER TABLE factorMatch ADD CONSTRAINT PK_factorMatch PRIMARY KEY (factorid);
ALTER TABLE propuesta ADD CONSTRAINT PK_propuesta PRIMARY KEY (numero);
ALTER TABLE negocio ADD CONSTRAINT PK_negocio PRIMARY KEY (id_negocio);
ALTER TABLE seguimiento ADD CONSTRAINT PK_seguimiento PRIMARY KEY (id_seguimiento);
ALTER TABLE documento ADD CONSTRAINT PK_documento PRIMARY KEY (numero);
ALTER TABLE promesa ADD CONSTRAINT PK_promesa PRIMARY KEY (numero);
ALTER TABLE escritura ADD CONSTRAINT PK_escritura PRIMARY KEY (numero);

--UK's--
ALTER TABLE propuesta ADD CONSTRAINT UK_propuesta UNIQUE (propuesta);