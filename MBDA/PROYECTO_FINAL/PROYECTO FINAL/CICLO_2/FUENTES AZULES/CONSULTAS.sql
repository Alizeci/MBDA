---------------------------------------------------------------------------------------------------------------------------
                                              /*CICLO 1: Consultas*/
---------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------CONSULTAS GERENCIALES ------------------------------------------------------
-- <Consultar los inmuebles que estan dentro de mis posibilidades económicas>
SELECT nombre, precioOferta
FROM inmueble i LEFT JOIN factorMatch f ON (i.factorid = f.factorid) RIGHT JOIN oferta o ON (f.numero_oferta = o.numero)
ORDER BY precioOferta;

-- <Consultar cuanto está dispuesto a pagar el cliente>
SELECT p.tid, p.nid, nombre, apellido, precio_min, precio_max
FROM participante p LEFT JOIN solicitud s ON (p.nid = s.nid)
ORDER BY precio_max;

-----------------------------------------------CONSULTAS OPERATIVAS -------------------------------------------------------
-- <Consultar las propuestas registradas>
SELECT *
FROM propuesta;

-- <Consultar los seguimientos del mas de 50%>
SELECT id_seguimiento, imagen, fechaini, porcentaje
FROM seguimiento s JOIN documento d ON (s.documento = d.numero)
WHERE s.porcentaje >= 50;