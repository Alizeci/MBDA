---------------------------------------------------------------------------------------------------------------------------
                                              /*CICLO 1: Indices*/
---------------------------------------------------------------------------------------------------------------------------

--Solicitud
CREATE INDEX ISolicitudes ON solicitud (tid, nid);

--Oferta
CREATE INDEX IOfertas ON oferta (tid, nid);

--FactorMatch
CREATE INDEX IFactoresMatch ON factorMatch (estado);

--Inmueble
CREATE INDEX IInmueble ON inmueble (nombre);

--Ubicacion
CREATE INDEX IUbicacion ON ubicacion (ciudad);