-----------------------------------
        /*CICLO 1: Tablas*/
-----------------------------------
CREATE TABLE participante
(
tid CHAR(2) NOT NULL,
nid NUMBER(15) NOT NULL,
nombre VARCHAR2(20) NOT NULL,
apellido VARCHAR2(20) NOT NULL,
email VARCHAR2(30)
);

CREATE TABLE telefono
(
tid CHAR(2) NOT NULL,
nid NUMBER(15) NOT NULL,
numero NUMBER(10) NOT NULL
);

CREATE TABLE solicitud
(
numero NUMBER(5) NOT NULL,
tid CHAR(2) NOT NULL,
nid NUMBER(15) NOT NULL,
fecha DATE NOT NULL,
precio_min NUMBER(9),
precio_max NUMBER(9) NOT NULL
);

CREATE TABLE oferta
(
numero NUMBER(5) NOT NULL,
tid CHAR(2) NOT NULL,
nid NUMBER(15) NOT NULL,
fecha DATE NOT NULL,
precioOferta NUMBER(9) NOT NULL,
negociable CHAR(2)
);

CREATE TABLE actualizacion
(
numero NUMBER(5) NOT NULL,
ultima_actualizacion DATE NOT NULL
);

CREATE TABLE factorMatch
(
factorid NUMBER(5) NOT NULL,
numero_oferta NUMBER(5),
numero_solicitud NUMBER(5),
estado CHAR(7) NOT NULL
);

CREATE TABLE operador
(
factorid NUMBER(5) NOT NULL,
factorid2 NUMBER(5) NOT NULL,
operadorid VARCHAR(13) NOT NULL
);

CREATE TABLE area
(
factorid NUMBER(5) NOT NULL,
m_terreno NUMBER(5,2) NOT NULL,
m_construido NUMBER(5,2)
);

CREATE TABLE estrato
(
factorid NUMBER(5) NOT NULL,
numero NUMBER(2) NOT NULL
);

CREATE TABLE inmueble
(
factorid NUMBER(5) NOT NULL,
nombre VARCHAR(10) NOT NULL,
descripcion VARCHAR2(50)
);

CREATE TABLE ubicacion
(
factorid NUMBER(5) NOT NULL,
departamento VARCHAR(12) NOT NULL,
ciudad VARCHAR(20) NOT NULL,
zona VARCHAR(20) NOT NULL,
barrio VARCHAR(20)
);

CREATE TABLE antiguedad
(
factorid NUMBER(5) NOT NULL,
tiempo CHAR(2) DEFAULT 'NV'
);

CREATE TABLE tipoOferta
(
factorid NUMBER(5) NOT NULL,
id CHAR(1) NOT NULL
);

CREATE TABLE habitacion
(
factorid NUMBER(5) NOT NULL,
numero NUMBER(2) NOT NULL,
numero_baño NUMBER(2)
);

CREATE TABLE tipoPiso
(
factorid NUMBER(5) NOT NULL,
nombre CHAR(3),
numero NUMBER(2) NOT NULL,
descripcion VARCHAR(50)
);

CREATE TABLE condicion
(
factorid NUMBER(5) NOT NULL,
id CHAR(5) NOT NULL
);

CREATE TABLE extra
(
factorid NUMBER(5) NOT NULL,
descripcion XMLTYPE NOT NULL
);
