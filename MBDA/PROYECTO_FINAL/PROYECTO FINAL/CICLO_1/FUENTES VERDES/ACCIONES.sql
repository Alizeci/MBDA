-----------------------------------------------------------------------------------------------------------------------------------------
                                                       /*CICLO 1: Acciones*/
-----------------------------------------------------------------------------------------------------------------------------------------

/*ELIMINACION*/
--Si se elimina el participante, se elimina sus telefonos asociados. (AC_elimina_telefonos)
ALTER TABLE telefono DROP CONSTRAINT FK_telefono_participante;
ALTER TABLE telefono ADD CONSTRAINT FK_telefono_participante
FOREIGN KEY (tid,nid) REFERENCES participante (tid,nid) ON DELETE CASCADE;

/*ELIMINACION*/
--Los factores para hacer match se eliminan, si se elimina su factorMatch. (AC_elimina_factores)
/*operador*/
ALTER TABLE operador DROP CONSTRAINT FK_operador_factorMatch;
ALTER TABLE operador ADD CONSTRAINT FK_operador_factorMatch
FOREIGN KEY (factorid) REFERENCES factorMatch (factorid) ON DELETE CASCADE;

/*operador2*/
ALTER TABLE operador DROP CONSTRAINT FK_operador2_factorMatch;
ALTER TABLE operador ADD CONSTRAINT FK_operador2_factorMatch
FOREIGN KEY (factorid2) REFERENCES factorMatch (factorid) ON DELETE CASCADE;

/*area*/
ALTER TABLE area DROP CONSTRAINT FK_area_factorMatch;
ALTER TABLE area ADD CONSTRAINT FK_area_factorMatch
FOREIGN KEY (factorid) REFERENCES factorMatch (factorid) ON DELETE CASCADE;

/*antiguedad*/
ALTER TABLE antiguedad DROP CONSTRAINT FK_antiguedad_factorMatch;
ALTER TABLE antiguedad ADD CONSTRAINT FK_antiguedad_factorMatch
FOREIGN KEY (factorid) REFERENCES factorMatch (factorid) ON DELETE CASCADE;

/*estrato*/
ALTER TABLE estrato DROP CONSTRAINT FK_estrato_factorMatch;
ALTER TABLE estrato ADD CONSTRAINT FK_estrato_factorMatch
FOREIGN KEY (factorid) REFERENCES factorMatch (factorid) ON DELETE CASCADE;

/*inmueble*/
ALTER TABLE inmueble DROP CONSTRAINT FK_inmueble_factorMatch;
ALTER TABLE inmueble ADD CONSTRAINT FK_inmueble_factorMatch
FOREIGN KEY (factorid) REFERENCES factorMatch (factorid) ON DELETE CASCADE;

/*ubicacion*/
ALTER TABLE ubicacion DROP CONSTRAINT FK_ubicacion_factorMatch;
ALTER TABLE ubicacion ADD CONSTRAINT FK_ubicacion_factorMatch
FOREIGN KEY (factorid) REFERENCES factorMatch (factorid) ON DELETE CASCADE;

/*tipoOferta*/
ALTER TABLE tipoOferta DROP CONSTRAINT FK_tipoOferta_factorMatch;
ALTER TABLE tipoOferta ADD CONSTRAINT FK_tipoOferta_factorMatch
FOREIGN KEY (factorid) REFERENCES factorMatch (factorid) ON DELETE CASCADE;

/*habitacion*/
ALTER TABLE habitacion DROP CONSTRAINT FK_habitacion_factorMatch;
ALTER TABLE habitacion ADD CONSTRAINT FK_habitacion_factorMatch
FOREIGN KEY (factorid) REFERENCES factorMatch (factorid) ON DELETE CASCADE;

/*tipoPiso*/
ALTER TABLE tipoPiso DROP CONSTRAINT FK_tipoPiso_factorMatch;
ALTER TABLE tipoPiso ADD CONSTRAINT FK_tipoPiso_factorMatch
FOREIGN KEY (factorid) REFERENCES factorMatch (factorid) ON DELETE CASCADE;

/*condicion*/
ALTER TABLE condicion DROP CONSTRAINT FK_condicion_factorMatch;
ALTER TABLE condicion ADD CONSTRAINT FK_condicion_factorMatch
FOREIGN KEY (factorid) REFERENCES factorMatch (factorid) ON DELETE CASCADE;

/*extra*/
ALTER TABLE extra DROP CONSTRAINT FK_extra_factorMatch;
ALTER TABLE extra ADD CONSTRAINT FK_extra_factorMatch
FOREIGN KEY (factorid) REFERENCES factorMatch (factorid) ON DELETE CASCADE;


-----------------------------------------------------------MANTENER SOLICITUD------------------------------------------------------------

/*ELIMINACION*/
--El factorMatch se elimina, si se elimina su solicitud asociada. (AC_elimina_factorMatch_sol)
ALTER TABLE factorMatch DROP CONSTRAINT FK_factorMatch_solicitud;
ALTER TABLE factorMatch  ADD CONSTRAINT FK_factorMatch_solicitud
FOREIGN KEY (numero_solicitud) REFERENCES solicitud (numero) ON DELETE CASCADE;

-----------------------------------------------------------MANTENER OFERTA--------------------------------------------------------------

/*ELIMINACION*/
--Las actualizaciones se eliminan, si se elimina la oferta. (AC_elimina_actualizacion)
ALTER TABLE actualizacion DROP CONSTRAINT FK_actualizacion_oferta;
ALTER TABLE actualizacion ADD CONSTRAINT FK_actualizacion_oferta
FOREIGN KEY (numero) REFERENCES oferta (numero) ON DELETE CASCADE;

--El factorMatch se elimina, si se elimina su oferta asociada. (AC_elimina_factorMath_ofer)
ALTER TABLE factorMatch DROP CONSTRAINT FK_factorMatch_oferta;
ALTER TABLE factorMatch  ADD CONSTRAINT FK_factorMatch_oferta
FOREIGN KEY (numero_oferta) REFERENCES oferta (numero) ON DELETE CASCADE;
