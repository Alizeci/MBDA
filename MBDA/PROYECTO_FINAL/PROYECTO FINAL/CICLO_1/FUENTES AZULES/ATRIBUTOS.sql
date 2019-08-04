--------------------------------------------------------------------------------------------------------------------------------------------
                                                         /*CICLO 1: Atributos*/
--------------------------------------------------------------------------------------------------------------------------------------------
--TCodigo
ALTER TABLE factorMatch MODIFY(factorid CHECK (factorid >= 1 AND factorid <= 99999));
ALTER TABLE solicitud MODIFY(numero CHECK (numero >= 1 AND numero <= 99999));
ALTER TABLE oferta MODIFY(numero CHECK (numero >= 1 AND numero <= 99999));

--Tipoid
ALTER TABLE participante MODIFY(tid CHECK (tid IN ('CC','CE','NT')));

--TCorreo
ALTER TABLE participante MODIFY(email CHECK (email LIKE '%@%' AND email NOT LIKE '%@' AND email NOT LIKE '@%' AND email NOT LIKE '%@%@%'));

--TMoneda
ALTER TABLE solicitud MODIFY(precio_min CHECK (precio_min > 0));
ALTER TABLE solicitud MODIFY(precio_max CHECK (precio_max > 0));
ALTER TABLE oferta MODIFY(precioOferta CHECK (precioOferta > 0));

--negociable-oferta
ALTER TABLE oferta MODIFY(negociable CHECK (negociable IN ('SI','NO')));

--TEstado
ALTER TABLE factorMatch MODIFY(estado CHECK (estado IN ('PROCESO','ENMATCH','CERRADA')));

--TOper
ALTER TABLE operador MODIFY(operadorid CHECK (operadorid IN ('>','<','=','LIKE','REGEXP_LIKE','REGEXP_SUBSTR','BETWEEN')));

--TArea
ALTER TABLE area MODIFY(m_terreno CHECK (m_terreno >= 30.00 AND m_terreno <= 30000.00));
ALTER TABLE area MODIFY(m_construido CHECK (m_construido >= 30.00 AND m_construido <= 30000.00));

--TEstrato
ALTER TABLE estrato MODIFY(numero CHECK (numero > 0 AND numero <= 10));

--TTiempo
ALTER TABLE antiguedad MODIFY(tiempo CHECK (tiempo IN ('T1','T2','T3','T4')));

--TOferta
ALTER TABLE tipoOferta MODIFY(id CHECK (id IN ('V','A')));

--TPiso
ALTER TABLE tipoPiso MODIFY(nombre CHECK (nombre IN ('MAD','TBT','MAR','TAB','CEM')));

--TCondicion
ALTER TABLE condicion MODIFY(id CHECK (id IN ('NUEVO','USADO')));