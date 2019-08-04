--crear primarias
ALTER TABLE booking ADD
(
PRIMARY KEY(booking_id)
);
ALTER TABLE rate ADD
(
PRIMARY KEY(room_type,occupancy)
);
ALTER TABLE room_type ADD
(
PRIMARY KEY(id)
);
ALTER TABLE room ADD
(
PRIMARY KEY(id)
);
ALTER TABLE extra ADD
(
PRIMARY KEY(extra_id)
);
ALTER TABLE guest ADD
(
PRIMARY KEY(id)
);
--crear foraneas
ALTER TABLE booking ADD(
CONSTRAINT FK1_guest_id 
FOREIGN KEY(guest_id) REFERENCES guest(id),
CONSTRAINT FK2_room_no 
FOREIGN KEY (room_no) REFERENCES room(id),
CONSTRAINT FK3_room_type_requested 
FOREIGN KEY(room_type_requested) REFERENCES room_type(id), 
FOREIGN KEY(room_type_requested,occupants) REFERENCES rate(room_type,occupancy)
);
ALTER TABLE rate ADD
(
CONSTRAINT FK_room_type
FOREIGN KEY (room_type) REFERENCES room_type(id)
);
ALTER TABLE room ADD
(
CONSTRAINT FK_room_ty
FOREIGN KEY (room_type) REFERENCES room_type(id)
);
ALTER TABLE extra ADD(
CONSTRAINT booking_id
FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
);
