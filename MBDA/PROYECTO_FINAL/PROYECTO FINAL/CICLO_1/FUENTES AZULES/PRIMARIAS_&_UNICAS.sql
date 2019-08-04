---------------------------------------------------------------------------------------------
                             /*CICLO 1: Primarias & Unicas*/
---------------------------------------------------------------------------------------------

--PK's--
ALTER TABLE participante ADD CONSTRAINT PK_participante PRIMARY KEY (tid,nid);
ALTER TABLE telefono ADD CONSTRAINT PK_telefono PRIMARY KEY (numero);
ALTER TABLE solicitud ADD CONSTRAINT PK_solicitud PRIMARY KEY (numero);
ALTER TABLE oferta ADD CONSTRAINT PK_oferta PRIMARY KEY (numero);
ALTER TABLE actualizacion ADD CONSTRAINT PK_actualizacion PRIMARY KEY (numero);
ALTER TABLE factorMatch ADD CONSTRAINT PK_factorMatch PRIMARY KEY (factorid);
ALTER TABLE operador ADD CONSTRAINT PK_operador PRIMARY KEY (factorid,factorid2,operadorid);
ALTER TABLE area ADD CONSTRAINT PK_area PRIMARY KEY (factorid);
ALTER TABLE estrato ADD CONSTRAINT PK_estrato PRIMARY KEY (factorid);
ALTER TABLE inmueble ADD CONSTRAINT PK_inmueble PRIMARY KEY (factorid);
ALTER TABLE ubicacion ADD CONSTRAINT PK_ubicacion PRIMARY KEY (factorid);
ALTER TABLE antiguedad ADD CONSTRAINT PK_antiguedad PRIMARY KEY (factorid);
ALTER TABLE tipoOferta ADD CONSTRAINT PK_tipoOferta PRIMARY KEY (factorid);
ALTER TABLE habitacion ADD CONSTRAINT PK_habitacion PRIMARY KEY (factorid);
ALTER TABLE tipoPiso ADD CONSTRAINT PK_tipoPiso PRIMARY KEY (factorid);
ALTER TABLE condicion ADD CONSTRAINT PK_condicion PRIMARY KEY (factorid);
ALTER TABLE extra ADD CONSTRAINT PK_extra PRIMARY KEY (factorid);

--UK's--
/* No hay */