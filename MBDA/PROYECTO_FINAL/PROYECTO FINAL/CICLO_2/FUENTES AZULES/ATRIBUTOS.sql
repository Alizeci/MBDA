--------------------------------------------------------------------------------------------------------------------------------------------
                                                         /*CICLO 2: Atributos*/
--------------------------------------------------------------------------------------------------------------------------------------------
--TCodigo
ALTER TABLE propuesta MODIFY(numero CHECK (numero >= 1 AND numero <= 99999));
ALTER TABLE negocio MODIFY(id_negocio CHECK (id_negocio >= 1 AND id_negocio <= 99999));
ALTER TABLE seguimiento MODIFY(id_seguimiento CHECK (id_seguimiento >= 1 AND id_seguimiento <= 99999));
ALTER TABLE documento MODIFY(numero CHECK (numero >= 1 AND numero <= 99999));

--TImagen
ALTER TABLE documento MODIFY(imagen CHECK (imagen IN ('JPEG','PNG','PDF')));

--TOferta
ALTER TABLE escritura MODIFY(evento CHECK (evento IN ('V','A')));

--TPorcentaje
ALTER TABLE seguimiento MODIFY(porcentaje CHECK (porcentaje >= 0 AND porcentaje <= 100));
