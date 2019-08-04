--Crear tablas
CREATE TABLE rate
(
room_type VARCHAR(10) NOT NULL,
occupancy NUMBER NOT NULL,
amount decimal(10,2)
);
CREATE TABLE extra
(
extra_id NUMBER NOT NULL,
booking_id NUMBER,
description VARCHAR(30),
amount FLOAT
);
CREATE TABLE booking
(
booking_id NUMBER NOT NULL,
room_no NUMBER,
guest_id NUMBER,
occupants NUMBER,
room_type_requested VARCHAR(6),
nights NUMBER,
arrival_time VARCHAR(5)
);
CREATE TABLE room_type
(
id VARCHAR(10),
description VARCHAR(100)
);
CREATE TABLE room
(
id NUMBER,
room_type VARCHAR2(10),
max_occupancy NUMBER
);
CREATE TABLE guest
(
id NUMBER,
first_name VARCHAR(20),
last_name VARCHAR(20),
address VARCHAR2(100)
);