---------------------------------------------------------------------------------------------------------------------------
                                              /*CICLO 1: Consultas*/
---------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------CONSULTAS OPERATIVAS -------------------------------------------------------
-- <Consultar el estado actual de mi inmueble>
SELECT f.codigo, a.m_terreno, a.m_construido, e.numero as ESTRATO, i.nombre as INMUEBLE, i.descripcion, u.departamento, u.ciudad, u.zona, u.barrio, an.tiempo as ANTIGUEDAD, h.numero as HABITACIONES, h.numero_baño as BAÑOS, tof.id as TIPO_OFERTA, tp.nombre as TIPO_PISO, tp.numero as NUM_PISOS, tp.descripcion, c.id as CONDICION, ex.descripcion as EXTRAS
FROM oferta o JOIN factorMatch f ON (o.numero = f.codigo) JOIN area a ON (f.codigo = a.codigo) JOIN estrato e ON (e.codigo = f.codigo) JOIN inmueble i ON (i.codigo = e.codigo) JOIN ubicacion u ON (u.codigo = i.codigo) JOIN antiguedad an ON (an.codigo = u.codigo) JOIN habitacion h ON (h.codigo = an.codigo) JOIN tipoOferta tof ON (tof.codigo = h.codigo) JOIN tipoPiso tp ON (tp.codigo = tof.codigo) JOIN condicion c ON (c.codigo = tp.codigo) JOIN extra ex ON (ex.codigo = c.codigo);


-- <Consultar los inmuebles que se ajustan a mi solicitud>
/* 
EJEMPLO:

solicitud: 1
-------------------------------------------------------------------------
-area: m_terreno: 70 , m_construido: 45.5
-estrato: 3
-inmueble: Casa
-ubicacion: departamento: Cundinamarca , ciudad: Bogotá , zona: Norte
-antiguedad: A1
-habitaciones: 5
-baños: 2
-tipoOferta: V
-tipoPiso: P4
-numero_pisos: 3
-condicion: USADO
-extras: Con jardín 
*/   
 
SELECT f.codigo, o.precioOferta, a.m_terreno, a.m_construido, e.numero as ESTRATO, i.nombre as INMUEBLE,i.descripcion, u.departamento, u.ciudad, u.zona, u.barrio, an.tiempo as ANTIGUEDAD, h.numero as HABITACIONES, h.numero_baño as BAÑOS, tof.id as TIPO_OFERTA, tp.nombre as TIPO_PISO, tp.numero as NUM_PISOS, tp.descripcion, c.id as CONDICION, ex.descripcion as EXTRAS, o.negociable as NEGOCIABLE
FROM oferta o JOIN factorMatch f ON (o.numero = f.codigo) JOIN area a ON (f.codigo = a.codigo) JOIN estrato e ON (e.codigo = f.codigo) JOIN inmueble i ON (i.codigo = e.codigo) JOIN ubicacion u ON (u.codigo = i.codigo) JOIN antiguedad an ON (an.codigo = u.codigo) JOIN habitacion h ON (h.codigo = an.codigo) JOIN tipoOferta tof ON (tof.codigo = h.codigo) JOIN tipoPiso tp ON (tp.codigo = tof.codigo) JOIN condicion c ON (c.codigo = tp.codigo) JOIN extra ex ON (ex.codigo = c.codigo)
WHERE (a.m_terreno >=60 and a.m_terreno <=80) AND (e.numero = 3) AND (i.nombre = 'Casa') AND (u.departamento = 'Cundinamarca') AND (u.ciudad = 'Bogotá') AND (u.zona IN('Norte','norte')) AND (tof.id = 'V') AND (tp.numero = 3) OR (c.id = 'USADO');

