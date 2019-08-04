--AUTO 3

--Tablas
CREATE TABLE rate
(
room_type VARCHAR(10) NOT NULL,
occupancy NUMBER(1) NOT NULL,
amount decimal(2,2)
);

CREATE TABLE extra
(
extra_id NUMBER(4) NOT NULL,
booking_id NUMBER(4),
description VARCHAR(18),
amount decimal(2,2)
);

CREATE TABLE booking
(
booking_id NUMBER(4) NOT NULL,
booking_date DATE,
room_no NUMBER(3),
guest_id NUMBER(4),
occupants NUMBER(1),
room_type_requested VARCHAR(6),
nights NUMBER(2),
arrival_time TIMESTAMP
);

CREATE TABLE room_type
(
id VARCHAR(6) NOT NULL,
description VARCHAR(45)
);

CREATE TABLE room
(
id NUMBER(3) NOT NULL,
room_type VARCHAR2(6),
max_occupancy NUMBER(1)
);

CREATE TABLE guest
(
id NUMBER(4) NOT NULL,
first_name VARCHAR(8),
last_name VARCHAR(8)
);

CREATE TABLE address
(
id NUMBER(4) NOT NULL,
address VARCHAR2(20) NOT NULL
);

--PK
ALTER TABLE booking ADD CONSTRAINT PK_booking
PRIMARY KEY(booking_id);

ALTER TABLE rate ADD CONSTRAINT PK_rate
PRIMARY KEY(room_type,occupancy);

ALTER TABLE room ADD CONSTRAINT PK_room
PRIMARY KEY(id);

ALTER TABLE room_type ADD CONSTRAINT PK_room_type
PRIMARY KEY(id);

ALTER TABLE guest ADD CONSTRAINT PK_guest
PRIMARY KEY(id);

ALTER TABLE extra ADD CONSTRAINT PK_extra
PRIMARY KEY(extra_id);

ALTER TABLE address ADD CONSTRAINT PK_address
PRIMARY KEY(id,address);

--FK

ALTER TABLE extra ADD CONSTRAINT FK_extra_booking
FOREIGN KEY (booking_id) REFERENCES booking (booking_id);

ALTER TABLE booking ADD CONSTRAINT FK_booking_guest
FOREIGN KEY (guest_id) REFERENCES guest (id);

ALTER TABLE booking ADD CONSTRAINT FK_booking_room
FOREIGN KEY (room_no) REFERENCES room (id);

ALTER TABLE booking ADD CONSTRAINT FK_booking_room_type
FOREIGN KEY (room_type_requested) REFERENCES room_type (id);

ALTER TABLE booking ADD CONSTRAINT FK_booking_rate
FOREIGN KEY (room_type_requested, occupants) REFERENCES rate (room_type, occupancy);

ALTER TABLE room ADD CONSTRAINT FK_room_room_type
FOREIGN KEY (room_type) REFERENCES room_type (id);

ALTER TABLE rate ADD CONSTRAINT FK_room_rate
FOREIGN KEY (room_type) REFERENCES room_type (id);

--AUTO 4


--Atributo, Tuplas

ALTER TABLE booking ADD CONSTRAINT CK_booking_nights CHECK (nights > -1 AND nights < 30);
ALTER TABLE booking ADD CONSTRAINT CK_booking_room_type CHECK (room_type_requested IN ('single', 'family', 'double', 'twin'));
ALTER TABLE booking ADD CONSTRAINT CK_booking_room_no CHECK (room_no LIKE ('1%') OR room_no LIKE ('2%') OR room_no LIKE ('3%') OR room_no LIKE ('4%') OR room_no LIKE ('5%'));

--AtributosOK, TuplasOK

INSERT INTO booking VALUES(5361, TO_DATE('2016-08-12','YYYY-MM-DD'), 301, 1001, 1, 'single',1, '12:00');
INSERT INTO booking VALUES(5237, TO_DATE('2016-10-28','YYYY-MM-DD'), 307, 1003, 1, 'double',1, '14:00');
INSERT INTO booking VALUES(5022, TO_DATE('2016-11-03','YYYY-MM-DD'), 302, 1009, 2, 'double',2, '18:00');

--AtributosNoOK, TuplasNoOK

INSERT INTO booking VALUES(5361, TO_DATE('2016-08-12','YYYY-MM-DD'), 301, 1001, 1, 'single',-2, '12:00');
INSERT INTO booking VALUES(5237, TO_DATE('2016-10-28','YYYY-MM-DD'), 307, 1003, 1, 'unknow',2, '14:00');
INSERT INTO booking VALUES(5022, TO_DATE('2016-11-03','YYYY-MM-DD'), 702, 1009, 2, 'double',3, '18:00');

--Acciones
ALTER TABLE booking DROP CONSTRAINT FK_booking_room;
ALTER TABLE booking ADD CONSTRAINT FK_booking_room
FOREIGN KEY (room_no) REFERENCES room (id) ON DELETE CASCADE;

ALTER TABLE booking DROP CONSTRAINT FK_booking_room_type;
ALTER TABLE booking ADD CONSTRAINT FK_booking_room_type
FOREIGN KEY (room_type_requested) REFERENCES room_type (id) ON DELETE CASCADE;

ALTER TABLE booking DROP CONSTRAINT FK_booking_rate;
ALTER TABLE booking ADD CONSTRAINT FK_booking_rate
FOREIGN KEY (room_type_requested, occupants) REFERENCES rate (room_type, occupancy) ON  UPDATE CASCADE;

--AccionesOK

DELETE FROM room WHERE id= 301;
UPDATE FROM rate WHERE occupancy= 3;

--Disparadores

--El identificador num consecutivo
CREATE OR REPLACE TRIGGER AD
BEFORE INSERT ON booking
FOR EACH ROW
DECLARE
V NUMBER;
BEGIN
SELECT COUNT(*)+1 INTO V FROM booking ;
:new.booking_id := V;
END AD;

--La de llegada debe ser mayor o igual a la actual
CREATE OR REPLACE TRIGGER AD
AFTER INSERT ON booking
FOR EACH ROW
DECLARE
V DATE;
BEGIN
SELECT SYSDATE INTO V FROM booking;
if V < arrival_time THEN RAISE_application_error(-20007,'No se puede ingresar');
END IF;
END AD;

--La fecha de la reserva
CREATE OR REPLACE TRIGGER AD
AFTER INSERT ON booking
FOR EACH ROW
DECLARE
V DATE;
BEGIN 
SELECT SYSDATE INTO V FROM booking WHERE booking_date=:new.booking_date;
END AD;

--El num de noches debe ser positivo y menor o igual a 30
CREATE OR REPLACE TRIGGER AD
BEFORE INSERT ON booking
FOR EACH ROW
DECLARE
V NUMBER;
BEGIN
SELECT nights INTO V FROM booking WHERE nights=:new.nights;
if V >= 30 THEN RAISE_application_error(-20007,'No se puede ingresar');
END IF;
END AD;

--El tipo de habitacion asignado debe corresponder al solicitado
CREATE OR REPLACE TRIGGER AD
BEFORE INSERT ON booking
FOR EACH ROW
DECLARE
V NUMBER;
BEGIN
SELECT room_no INTO V FROM booking WHERE nights=:new.nights ;
END IF;
END AD;

CREATE OR REPLACE TRIGGER AD_ROOM2
  BEFORE INSERT
  ON room
  FOR EACH ROW
  DECLARE
    Consulta NUMBER;
  BEGIN  
      SELECT rate.occupancy INTO Consulta FROM  rate FULL OUTER JOIN room_type
      ON room_type.room_type_id = rate.room_type 
      WHERE :new.room_type = room_type.room_type_id
            AND rate.occupancy = :new.max_occupancy;
      EXCEPTION
      WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20003, 'No esta en una maximo valida');
  END AD2_ROOM;

--DisparadoresOK
INSERT INTO booking (booking_id,booking_date,room_no,guest_id,occupants,room_type_requested,nights,arrival_time) VALUES (5361, TO_DATE('2016-12-12','YYYY-MM-DD'), 301, 1001, 1, 'single',1, '12:00');
INSERT INTO booking (booking_id,booking_date,room_no,guest_id,occupants,room_type_requested,nights,arrival_time) VALUES (5237, TO_DATE('2016-11-28','YYYY-MM-DD'), 307, 1003, 1, 'double',1, '14:00');
INSERT INTO booking (booking_id,booking_date,room_no,guest_id,occupants,room_type_requested,nights,arrival_time) VALUES (5022, TO_DATE('2016-11-03','YYYY-MM-DD'), 302, 1009, 2, 'double',2, '18:00');

--DisparadoresNoOK
INSERT INTO booking (booking_id,booking_date,room_no,guest_id,occupants,room_type_requested,nights,arrival_time) VALUES (5354, TO_DATE('2016-12-12','YYYY-MM-DD'), 301, 1000, 3, 'single',31, '12:00');
INSERT INTO booking (booking_id,booking_date,room_no,guest_id,occupants,room_type_requested,nights,arrival_time) VALUES (5122, TO_DATE('2017-10-28','YYYY-MM-DD'), 308, 1002, 2, 'double',60, '14:00');
INSERT INTO booking (booking_id,booking_date,room_no,guest_id,occupants,room_type_requested,nights,arrival_time) VALUES (5530, TO_DATE('2018-09-03','YYYY-MM-DD'), 303, 1008, 2, 'double',40, '18:00');


--XDisparadores
DROP TRIGGER ADD;