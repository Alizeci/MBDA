---------------------------------------------------------------------------------------------------------------------------
                                              /*CICLO 1: Vistas*/
---------------------------------------------------------------------------------------------------------------------------

--Vista de propuestas
CREATE VIEW VPropuestasParticipantes AS 
(SELECT p.tid, p.nid, pr.propuesta, pr.fecha
FROM participante p JOIN propuesta pr ON (p.nid = pr.nid));

--Vista de negocios
CREATE VIEW VNegociosPropuestas AS 
(SELECT p.propuesta, p.fecha, o.id_negocio, o.titularidad, o.uso, o.fruto
FROM propuesta p JOIN negocio o ON (p.id_negocio = o.id_negocio));

--Vista de Seguimiento
CREATE VIEW VSeguimientoDocs AS
(SELECT s.id_seguimiento, s.fechaini, s.fechafin, s.porcentaje, o.imagen, p.inmueble, p.id_comprador, p.id_vendedor, e.evento
FROM seguimiento s JOIN documento o ON (s.documento = o.numero) JOIN promesa p ON (p.numero = o.numero) JOIN escritura e ON (e.numero = o.numero));