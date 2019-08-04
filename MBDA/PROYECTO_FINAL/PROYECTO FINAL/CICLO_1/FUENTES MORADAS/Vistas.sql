---------------------------------------------------------------------------------------------------------------------------
                                              /*CICLO 1: Vistas*/
---------------------------------------------------------------------------------------------------------------------------

--Vista de compradores
CREATE VIEW VSolicitudesParticipantes AS 
(SELECT p.tid, p.nid, s.numero, s.fecha
FROM participante p JOIN solicitud s ON (p.nid = s.nid));

--Vista de vendedores
CREATE VIEW VOfertasParticipantes AS 
(SELECT p.tid, p.nid, o.numero, o.fecha
FROM participante p JOIN oferta o ON (p.nid = o.nid));

--Vista de Ofertas
CREATE VIEW VOfertasDetalladas AS
(SELECT o.numero, o.precioOferta, o.negociable, p.nombre AS PISO, h.numero AS NUM_HAB, t.id AS TIPOFERTA, i.nombre AS INMUEBLE, a.m_terreno AS AREATERRENO, e.numero AS ESTRATO, u.departamento, u.ciudad, an.tiempo AS ANTIGUEDAD, c.id AS CONDICION, f.estado
FROM oferta o JOIN factorMatch f ON (o.numero = f.numero_oferta) JOIN tipoPiso p ON (f.factorid = p.factorid) JOIN habitacion h ON (f.factorid = h.factorid) JOIN tipoOferta t ON (f.factorid = t.factorid) JOIN inmueble i ON (f.factorid = i.factorid) JOIN area a ON (f.factorid = a.factorid) JOIN estrato e ON (f.factorid = e.factorid) JOIN ubicacion u ON (f.factorid = u.factorid) JOIN antiguedad an ON (f.factorid = an.factorid) JOIN condicion c ON (f.factorid = c.factorid));

--Vista de solicitudes
CREATE VIEW VSolicitudesDetalladas AS
(SELECT o.numero, o.precio_min, o.precio_max, p.nombre AS PISO, h.numero AS NUM_HAB, t.id AS TIPOFERTA, i.nombre AS INMUEBLE, a.m_terreno AS AREATERRENO, e.numero AS ESTRATO, u.departamento, u.ciudad, an.tiempo AS ANTIGUEDAD, c.id AS CONDICION, f.estado
FROM solicitud o JOIN factorMatch f ON (o.numero = f.numero_solicitud) JOIN tipoPiso p ON (f.factorid = p.factorid) JOIN habitacion h ON (f.factorid = h.factorid) JOIN tipoOferta t ON (f.factorid = t.factorid) JOIN inmueble i ON (f.factorid = i.factorid) JOIN area a ON (f.factorid = a.factorid) JOIN estrato e ON (f.factorid = e.factorid) JOIN ubicacion u ON (f.factorid = u.factorid) JOIN antiguedad an ON (f.factorid = an.factorid) JOIN condicion c ON (f.factorid = c.factorid));

