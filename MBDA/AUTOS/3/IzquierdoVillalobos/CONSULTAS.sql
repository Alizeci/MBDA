--Consultas---------------------------------------------
--1.Give the booking_date and the number of nights for guest 1183.
SELECT booking_date,nights
FROM booking
WHERE guest_id = '1183';
--2.List the arrival time and the first and last names for all guests due to arrive on 2016-11-05, order the output by time of arrival.
SELECT arrival_time, first_name,last_name
FROM booking JOIN guest ON guest_id = guest.id
WHERE booking_date= '2016-11-05'
ORDER BY arrival_time asc;
--3.Give the daily rate that should be paid for bookings with ids 5152, 5165, 5154 and 5295. Include booking id, room type, number of occupants and the amount. 
SELECT booking_id,max(room_type_requested)AS 'room_type_requested',max(occupants)AS 'occupants',max(amount) AS 'amount'
FROM booking JOIN rate ON occupants=rate.occupancy
WHERE booking_id IN ('5152','5154','5165','5295')
GROUP BY booking_id;
--4.Find who is staying in room 101 on 2016-12-03, include first name, last name and address.
SELECT first_name,last_name,address
FROM booking JOIN guest ON guest_id = guest.id
WHERE room_no=101 AND booking_date='2016-12-03';
--5.The guest id and the total number of bookings and the total number of nights.
SELECT guest_id,COUNT(booking_id),SUM(nights)
FROM booking
WHERE guest_id IN('1185','1270')
GROUP BY guest_id;
--6.Ruth Cadbury. Show the total amount payable by guest Ruth Cadbury for her room bookings.
SELECT SUM(nights*amount)
FROM booking JOIN rate ON (occupancy=occupants AND room_type=room_type_requested)
WHERE guest_id= (SELECT id FROM guest WHERE first_name='Ruth' and last_name='Cadbury');
--7.Including Extras. Calculate the total bill for booking 5346 including extras
SELECT rate.amount+SUM(extra.amount) AS 'SUM(amount)'
FROM booking 
JOIN rate  ON (occupancy=occupants AND room_type=room_type_requested)
JOIN extra ON booking.booking_id=extra.booking_id
WHERE booking.booking_id='5346'
GROUP BY rate.amount;
--8.Edinburgh Residents. For every guest who has the word “Edinburgh” in their address show the total number of nights booked. Be sure to include 0 for those guests who have never had a booking.
SELECT last_name, first_name, address, IFNULL(sum(nights), 0) as nights
FROM guest
LEFT OUTER JOIN booking ON booking.guest_id = guest.id
WHERE address LIKE '%Edinburgh%'
GROUP BY last_name,first_name,address;
--9.How busy are we? For each day of the week beginning 2016-11-25 show the number of bookings starting that day. 
SELECT booking_date AS i,COUNT(booking_date) AS arrivals 
FROM booking
WHERE booking_date BETWEEN '2016-11-25' AND '2016-12-01'
GROUP BY booking_date;
--10.How many guests? Show the number of guests in the hotel on the night of 2016-11-21.
SELECT SUM(occupants)
FROM booking
WHERE booking_date <='2016-11-21' AND (booking_date + INTERVAL nights DAY )> '2016-11-21';
--12.Check out per floor. The first digit of the room number indicates the floor – e.g. room 201 is on the 2nd floor. For each day of the week beginning 2016-11-14 show how many rooms are being vacated that day by floor number. Show all days in the correct order.
SELECT DATE_ADD(booking_date,INTERVAL nights DAY) as i,SUM(left(room_no,1)=1) AS 1st,SUM(left(room_no,1)=2) AS 2nd,SUM(left(room_no,1)=3) AS 3rd
FROM booking
WHERE DATE_ADD(booking_date,INTERVAL nights DAY) BETWEEN '2016-11-14' AND ' 2016-11-20'
GROUP BY DATE_ADD(booking_date,INTERVAL nights DAY);