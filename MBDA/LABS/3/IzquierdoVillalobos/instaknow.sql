--CICLO CONTENIDOS

------------------------------
--C.Construccion creando
------------------------------

--CICLO 1 : Tablas
--------------------------------------
CREATE TABLE opinion
(
numero NUMBER(5,0) NOT NULL, 
fecha DATE, 
tipo VARCHAR(1), 
justificacion VARCHAR2(20), 
detalle VARCHAR2(50), 
correo_perfil VARCHAR2(30), 
nombre_contenido VARCHAR2(20)
);
CREATE TABLE adjetivo
(
nombre VARCHAR2(10),
opinion NUMBER(5,0)
);
_______________________________

CREATE TABLE perfil
(
correo VARCHAR2(30) NOT NULL, 
nombre VARCHAR2(20), 
bloqueado CHAR(1)
);
_______________________________

CREATE TABLE consulta 
(
correo_perfil VARCHAR2(30) NOT NULL, 
nombre_contenido VARCHAR2(20) NOT NULL, 
fecha DATE NOT NULL
);
_______________________________

CREATE TABLE contenido 
(
nombre VARCHAR2(20) NOT NULL, 
fecha DATE, 
url VARCHAR2(50) NOT NULL,
tipo VARCHAR2(1), 
etiqueta VARCHAR2(10), 
correo_perfil VARCHAR2(30)
);
CREATE TABLE temporal 
(
nombre_contenido VARCHAR2(20) NOT NULL, 
duracion NUMBER(3,0), 
idioma VARCHAR2(1)
);
CREATE TABLE esPara 
(
nombre_contenido VARCHAR2(20) NOT NULL, 
nombre_tema VARCHAR2(50) NOT NULL
);
CREATE TABLE etiqueta 
(
nombre_contenido VARCHAR2(20), 
nombre VARCHAR2(10) NOT NULL
);
_______________________________

CREATE TABLE filtro 
(
nombre VARCHAR2(10) NOT NULL, 
descripcion VARCHAR2(50)
);
CREATE TABLE esDe
(
nombre_filtro VARCHAR2(10) NOT NULL, 
nombre_contenido VARCHAR2(20) NOT NULL
);
_______________________________

CREATE TABLE tema 
(
nombre VARCHAR2(50) NOT NULL, 
palabra VARCHAR2(10), 
correo_perfil VARCHAR2(30)
);
CREATE TABLE esPrerrequisito 
(
tema VARCHAR2(50) NOT NULL, 
tema_prerrequisito VARCHAR2(50) NOT NULL
);
CREATE TABLE palabra
(
palabra VARCHAR2(10) NOT NULL, 
nombre_tema VARCHAR2(50)
);
_______________________________

CREATE TABLE trata
(
nombre_tema VARCHAR2(50) NOT NULL, 
sigla_asignatura CHAR(3) NOT NULL, 
nivel VARCHAR(1),
porcentaje NUMBER(3,0)
);
_______________________________

CREATE TABLE asignatura
(
sigla CHAR(3) NOT NULL, 
nombre VARCHAR2(15)
);

--CICLO 1 : XTablas
-----------------------------------------
DROP TABLE consulta;
DROP TABLE esDe;
DROP TABLE esPara;
DROP TABLE esPrerrequisito;
DROP TABLE etiqueta;
DROP TABLE palabra;
DROP TABLE adjetivo;
DROP TABLE temporal;
DROP TABLE trata;

DROP TABLE asignatura;
DROP TABLE filtro;
DROP TABLE opinion;
DROP TABLE contenido;
DROP TABLE tema;
DROP TABLE perfil;

------------------------------
--D.Construccion: poblando
------------------------------

--CICLO 1 : PoblarOK (1)
--------------------------------------
insert into perfil values ('alejandraizquierdo@hotmail.com','alejandra',0);
insert into perfil values ('mariocasas@hotmail.com','mario',1);
insert into perfil values ('pilarrio23@hotmail.com','pilar',0);

insert into consulta values ('alejandraizquierdo@hotmail.com','programacion','14-02-2019');
insert into consulta values ('mariocasas@hotmail.com','calculo','07-02-2018');
insert into consulta values ('pilarrio23@hotmail.com','geometria','15-02-2019');

insert into contenido values ('programacion','13-02-2019','www.tefe.com','F','modela','alejandraizquierdo@hotmail.com');
insert into contenido values ('calculo','03-02-2018','www.late.com','V','academy','mariocasas@hotmail.com');
insert into contenido values ('geometria','13-02-2019','www.disco.com','F','academy','pilarrio23@hotmail.com');
insert into temporal values ('programacion',30,'E');
insert into temporal values ('calculo',60,'I');
insert into temporal values ('geometria',180,'E');
insert into esPara values ('programacion','modela');
insert into esPara values ('calculo','academy');
insert into esPara values ('geometria','academy');
insert into etiqueta values ('programacion','modela');
insert into etiqueta values ('calculo','academy');
insert into etiqueta values ('geometria','academy');
insert into etiqueta values ('bases','datos');

insert into filtro values ('ciencia','todo lo relacionado con avances cientificos');
insert into filtro values ('matematic','todo lo relacionado con razonamiento');
insert into filtro values ('tecnologia','todo lo relacionado con la actualidad y lo digital');
insert into esDe values ('ciencia','humano');
insert into esDe values ('matematic','calculo');
insert into esDe values ('tecnologia','programacion');

insert into opinion values (1002,'15-03-2019','E',null,null,'alejandraizquierdo@hotmail.com','programacion');
insert into opinion values (1003,'01-01-2019','G','Es pertinente',null,'mariocasas@hotmail.com','calculo');
insert into opinion values (1005,'15-03-2019','G',null,'Teniendo en cuenta especificaciones','pilarrio23@hotmail.com','geometria');
insert into adjetivo values ('modular',1002);
insert into adjetivo values ('avanzada',1005);
insert into adjetivo values ('basica',1003);

insert into trata values ('programacion imperativa modular','TEC','P',23);
insert into trata values ('algebra lineal','MAT','A',15);
insert into trata values ('geometria teorica','GEO','E',60);

insert into asignatura values ('TEC','TECNOLOGIA');
insert into asignatura values ('MAT','MATEMATICAS');
insert into asignatura values ('GEO','GEOMETRIA');

insert into tema values ('programacion imperativa modular','modular','alejandraizquierdo@hotmail.com');
insert into tema values ('algebra lineal','lineal','mariocasas@hotmail.com');
insert into tema values ('geometria teorica','teorica','pilarrio23@hotmail.com');
insert into tema values ('bases de datos','datos','pilarrio23@hotmail.com');
insert into esPrerrequisito values ('programacion','programación imperativa');
insert into esPrerrequisito values ('bases de datos','programación imperativa');
insert into esPrerrequisito values ('integral','diferencial');
insert into palabra values ('modular','programacion imperativa modular');
insert into palabra values ('lineal','algebra lineal');
insert into palabra values ('teorica','geometria teorica');
insert into palabra values ('datos','bases de datos');

--CICLO 1 : PoblarNoOK (2 y 3)
--------------------------------------
--(2)
--nivel--
insert into trata values ('Busqueda de informacion','BIF',3,9500);
--numero--
insert into opinion values ('r','2019-06-06','G','Interesante',Null,'felipe1234@gmail.com','Introduccion');
--sigla--
insert into asignatura values('programacion','programacion');
--fecha--
insert into consulta values('lalejandra@gmail.com','Dinamica','45-45-2018');
--bloqueado--
insert into perfil values('laura123@gmail.com','Laura','De pronto');

--(3)
--porcentaje--
insert into trata values ('programacion','AYP','P',-5);
--correo--
insert into perfil values('ijalifakdhsf','Juan','1');
--idioma--
insert into temporal values ('introduccion',160,'[');
--sigla--
insert into trata values ('bases',' ','P',15);
--numero--
insert into opinion values(-10,'10-10-2017','E','Se aprende','justificar','juan123@hotmail.com','Introduccion');

--Validacion
------------------
--checks opinion
ALTER TABLE opinion  ADD CONSTRAINT checknumero CHECK (numero>=1 AND numero<=99999);
ALTER TABLE opinion  ADD CONSTRAINT checktipo CHECK(tipo IN ('E','G','C','N'));
ALTER TABLE opinion  ADD CONSTRAINT checkcorreo_perfil CHECK(correo_perfil LIKE '%@%' AND correo_perfil NOT LIKE '%@' AND correo_perfil NOT LIKE '%@' AND correo_perfil NOT LIKE '%@%@%a%');
--checks adjetivo
ALTER TABLE adjetivo ADD CONSTRAINT checknombre CHECK (REGEXP_LIKE(nombre,'[A-Za-z]'));
--checks perfil
ALTER TABLE perfil ADD CONSTRAINT checkcorreo CHECK(correo LIKE '%@%' AND correo NOT LIKE '%@' AND correo NOT LIKE '%@' AND correo NOT LIKE '%@%@%@%');
--Checks Contenido
ALTER TABLE contenido ADD CONSTRAINT ckeckurl CHECK(url LIKE '%.%.%');
ALTER TABLE contenido ADD CONSTRAINT ckecktipo CHECK(tipo IN ('F','V','A'));
--ALTER TABLE contenido ADD CONSTRAINT checkcorreo CHECK(correo LIKE '%@%' AND correo NOT LIKE '%@' AND correo NOT LIKE '%@' AND correo NOT LIKE '%@%@%@%');
--CHECKS etiqueta
--ALTER TABLE etiquetas ADD  CONSTRAINT checketiquetas CHECK (REGEXP_LIKE(etiquetas,'[A-Za-z]'));

--check temporal
ALTER TABLE temporal ADD CONSTRAINT checkduracion CHECK (duracion >0 and duracion<=180);
ALTER TABLE temporal ADD CONSTRAINT checkidioma CHECK (idioma IN ('E','I','F'));
--checks consulta
--ALTER TABLE consulta ADD CONSTRAINT checkcorreo_perfil CHECK(correo_perfil LIKE '%@%' AND correo_perfil NOT LIKE '%@' AND correo_perfil NOT LIKE '%@' AND correo_perfil NOT LIKE '%@%@%a%');
--checks tema--------------------
ALTER TABLE tema ADD CONSTRAINT checkpalabra CHECK (REGEXP_LIKE(palabra,'[A-Za-z]'));
--CHECKS palabra
--ALTER TABLE palabra ADD CONSTRAINT checkpalabra CHECK (REGEXP_LIKE(palabra,'[A-Z]'));
------------ 
---checks trata
ALTER TABLE trata ADD CONSTRAINT checknivel CHECK (nivel IN ('P','A','E') );
ALTER TABLE trata ADD CONSTRAINT checkporcentaje CHECK (porcentaje>0 and porcentaje<=100);
--ALTER TABLE trata ADD CONSTRAINT checksigla_asignatura CHECK (REGEXP_LIKE(sigla,'[A-Z][A-Z][A-Z]') OR REGEXP_LIKE(sigla,'[0-9][0-9][0-9]'));
--checks asignatura
ALTER TABLE asignatura ADD CONSTRAINT checksigla_asignatura CHECK (REGEXP_LIKE(sigla,'[A-Z][A-Z][A-Z]') OR REGEXP_LIKE(sigla,'[0-9][0-9][0-9]'));

--CICLO 1 : XPoblar
--------------------------------------

------------------------------
--D.Construccion: protegiendo
------------------------------

--CICLO 1 : Atributos
--------------------------------------


--CICLO 1 : Primarias y Unicas
--------------------------------------

ALTER TABLE perfil ADD
(
CONSTRAINT PK_correo PRIMARY KEY(correo) 
);
ALTER TABLE  contenido ADD
(
CONSTRAINT PK_nombre PRIMARY KEY(nombre),
CONSTRAINT UK_url UNIQUE(url)
);
ALTER TABLE  temporal ADD
(
CONSTRAINT PK_nombre_contenido PRIMARY KEY(nombre_contenido)
);
ALTER TABLE  consulta ADD
(
CONSTRAINT PK_correo_perfil PRIMARY KEY(correo_perfil,nombre_contenido)
);
ALTER TABLE  filtro ADD
(
CONSTRAINT PK_nombreS PRIMARY KEY(nombre)
);
ALTER TABLE  opinion ADD
(
CONSTRAINT UK_justificacion UNIQUE(justificacion), 
CONSTRAINT PK_numero PRIMARY KEY(numero)
);
ALTER TABLE tema  ADD
(
CONSTRAINT names PRIMARY KEY(nombre)
);
ALTER TABLE trata  ADD
(
CONSTRAINT PK_nombre_tem PRIMARY KEY(nombre_tema,sigla_asignatura)
);
ALTER TABLE asignatura  ADD
(
CONSTRAINT PK_siglas PRIMARY KEY(sigla)
);
ALTER TABLE palabra  ADD
(
CONSTRAINT PK_PALABRA PRIMARY KEY(palabra)
);
ALTER TABLE etiqueta  ADD
(
CONSTRAINT PK_nombr PRIMARY KEY(nombre)
);
ALTER TABLE esPara ADD
(
CONSTRAINT PK_nombre_tema_siglas PRIMARY KEY(nombre_tema,nombre_contenido)
);
ALTER TABLE esDe  ADD
(
CONSTRAINT PK_nombre_filtro PRIMARY KEY (nombre_contenido,nombre_filtro)
);
ALTER TABLE esPrerrequisito  ADD
(

CONSTRAINT PK_prerrequisito PRIMARY KEY(tema,tema_prerrequisito)
);


--CICLO 1 : Foráneas
--------------------------------------
ALTER TABLE consulta ADD
(
CONSTRAINT FK_correo_perfil FOREIGN KEY (correo_perfil) REFERENCES perfil(correo),
CONSTRAINT FK_nombre_contenido FOREIGN KEY (nombre_contenido) REFERENCES contenido(nombre)
);
ALTER TABLE contenido ADD
(
CONSTRAINT FK_correo_perfiles FOREIGN KEY (correo_perfil) REFERENCES perfil(correo)
);
ALTER TABLE temporal ADD
(
CONSTRAINT FK_nombre_contenidos FOREIGN KEY (nombre_contenido) REFERENCES contenido(nombre)
);
ALTER TABLE opinion ADD
(
CONSTRAINT FK_correo_perfiles1 FOREIGN KEY (correo_perfil) REFERENCES perfil(correo),
CONSTRAINT FK_nombre_contenido1 FOREIGN KEY (nombre_contenido) REFERENCES contenido(nombre)
);
ALTER TABLE tema ADD
(
CONSTRAINT FK_correo_perfilas FOREIGN KEY (correo_perfil) references perfil(correo)
);
ALTER TABLE trata ADD
(
CONSTRAINT FK_nombre_temas FOREIGN KEY (nombre_tema) references tema(nombre),
CONSTRAINT FK_sigla_asignatura FOREIGN KEY (sigla_asignatura) references asignatura(sigla)
);
ALTER TABLE palabra ADD
(
CONSTRAINT FK_nombre_tema2 FOREIGN KEY (nombre_tema) references tema(nombre)
);
ALTER TABLE etiqueta ADD
(
CONSTRAINT FK_nombre_contenido5 FOREIGN KEY (nombre_contenido) references contenido(nombre)
);
ALTER TABLE esPara ADD
(
CONSTRAINT FK_nombre_contenido8 FOREIGN KEY (nombre_contenido) references contenido(nombre),
CONSTRAINT FK_nombre_tema33 FOREIGN KEY (nombre_tema) references tema(nombre)
);
ALTER TABLE esDe ADD
(
CONSTRAINT FK_nombre_filtro FOREIGN KEY (nombre_filtro) references filtro(nombre),
CONSTRAINT FK_nombre_contenido7 FOREIGN KEY (nombre_contenido) references contenido(nombre)
);
ALTER TABLE esPrerrequisito ADD
(
CONSTRAINT FK_tema9 FOREIGN KEY (tema) references tema(nombre),
CONSTRAINT FK_tema_prerrequisito FOREIGN KEY (tema_prerrequisito) references tema(nombre)
);
ALTER TABLE adjetivo ADD
(
CONSTRAINT FK_opinion FOREIGN KEY (opinion) references opinion(numero)
);


--CICLO 1 : PoblarNoOK (2)
--------------------------------------
--porcentaje--NUMERO NEGATIVO--RESTRICCION DE CONTROL
insert into trata values ('programacion','AYP','P',-5);
--correo--CORREO AL MENOS UN @--RESTRICCION DE CONTROL
insert into perfil values('ijalifakdhsf','Juan','1');
--idioma--Debe ser una letra en especifico--RESTRICCION DE CONTROL
insert into temporal values ('introduccion',160,'[');
--sigla--DEBE TENER 3 LETRAS O 3 NÙMEROS -- RESTRICCION DE CONTROL
insert into trata values ('bases',' ','P',15);
--numero--EL NUMERO NO PUEDE SER NEGATIVO--RESTRICCION DE CONTROL
insert into opinion values(-10,'10-10-2017','E','Se aprende','justificar','juan123@hotmail.com','Introduccion');

------------------------------
--E.Construccion: consultando
------------------------------

--CICLO 1: <Consultar formatos de contenido>
-----------------------------------------------
SELECT * 
FROM contenido;

--CICLO 1: <Consultar los 10 mas populares del mes>
------------------------------------------------------
SELECT TOP 10 nombre
FROM contenido JOIN consulta ON nombre_contenido=nombre
WHERE  DATE '2019-01-01' BETWEEN fecha.consulta- INTERVAL '30' DAY AND fecha.consulta
GROUP BY nombre
ORDER BY count(nombre);

--CICLO 1: <Consultar los contenidos de un tema>
------------------------------------------------------
SELECT nombre.tema
FROM espara JOIN tema ON nombre_tema=nombre.tema JOIN contenido ON nombre_contenido=nombre.contenido
ORDER BY nombre;

--CICLO 1: <Consultar contenidos de otros perfiles>
------------------------------------------------------

SELECT nombre.perfil,nombre.contenido,fecha,url
FROM contenido JOIN perfil ON correo_perfil=correo

--------------------------------------
--F.Construccion: nuevamente poblando
--------------------------------------


RETROSPECTIVA
--------------------------

1. ¿Cuál fue el tiempo total invertido en el laboratorio por cada uno de ustedes? (Horas/Hombre)
Laura / 7hr
Yarit / 10hr

2. ¿Cuál es el estado actual del laboratorio? ¿Por qué?
Incompleto, demasiado tiempo en exploración de SQL DEVELOPER, errores y organización.

3. ¿Cuál consideran fue el mayor logro? ¿Por qué?
Adquirir conocimiento de como trabaja SQL DEVELOPER.

4. ¿Cuál consideran que fue el mayor problema técnico? ¿Qué hicieron para resolverlo?
Entender SQL DEVELOPER, recurrir a yudos, totorales, compañeros.

5. ¿Qué hicieron bien como equipo? ¿Qué se comprometen a hacer para mejorar los resultados?
Trabajo conjunto. Nos comprometemos a mejorar la organización para obtener un trabajo ordenado, mas preciso y completo.
