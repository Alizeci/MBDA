-----------------------------------
        /*CICLO 2: Tablas*/
-----------------------------------
CREATE TABLE participante
(
tid CHAR(2) NOT NULL,
nid NUMBER(15) NOT NULL,
nombre VARCHAR2(20) NOT NULL,
apellido VARCHAR2(20) NOT NULL,
email VARCHAR2(30)
);

CREATE TABLE factorMatch
(
factorid NUMBER(5) NOT NULL,
numero_oferta NUMBER(5),
numero_solicitud NUMBER(5),
estado CHAR(7) NOT NULL,
id_seguimiento NUMBER(5)
);

CREATE TABLE propuesta
(
numero NUMBER(5) NOT NULL,
tid CHAR(2),
nid NUMBER(15),
propuesta VARCHAR(100),
id_negocio NUMBER(5) NOT NULL,
fecha DATE NOT NULL
);

CREATE TABLE negocio
(
id_negocio NUMBER(5) NOT NULL,
propietario VARCHAR(20) NOT NULL,
titularidad VARCHAR(20) NOT NULL,
uso VARCHAR(20) NOT NULL,
fruto VARCHAR(20)NOT NULL,
estadoJuridico XMLTYPE,
id_seguimiento NUMBER(5) NOT NULL
);

CREATE TABLE seguimiento
(
id_seguimiento NUMBER(5) NOT NULL,
documento NUMBER(5) NOT NULL,
fechaini DATE NOT NULL,
fechafin DATE,
porcentaje NUMBER(3)
);

CREATE TABLE documento
(
numero NUMBER(5) NOT NULL,
imagen VARCHAR(5) NOT NULL,
fecha DATE NOT NULL
);

CREATE TABLE promesa
(
numero NUMBER(5) NOT NULL,
inmueble VARCHAR(10) NOT NULL,
id_Comprador NUMBER(15) NOT NULL,
id_Vendedor NUMBER(15) NOT NULL
);

CREATE TABLE escritura
(
numero NUMBER(5) NOT NULL,
evento varCHAR(1) NOT NULL
);
