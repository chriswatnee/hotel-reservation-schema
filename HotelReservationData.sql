USE HotelReservation;

INSERT INTO RoomType (`Name`)
VALUES ('single'),
('double'),
('king');

INSERT INTO Amenity (`Name`)
VALUES ('fridge'),
('spa bath');

INSERT INTO Room (`Number`, Floor, OccupancyLimit, RoomTypeID)
VALUES (100, 1, 2, 1),
(101, 1, 3, 2),
(102, 1, 3, 3),
(200, 2, 2, 1),
(201, 2, 3, 2),
(202, 2, 3, 3);

INSERT INTO RoomRate (StartDate, EndDate, Rate, RoomTypeID)
VALUES ('2020-02-03', '2020-02-10', 100.00, 1),
('2020-02-03', '2020-02-10', 150.00, 2),
('2020-02-03', '2020-02-10', 200.00, 3),
('2020-02-11', '2020-02-29', 125.00, 1),
('2020-02-11', '2020-02-29', 175.00, 2),
('2020-02-11', '2020-02-29', 225.00, 3);

INSERT INTO RoomAmenity (RoomID, AmenityID)
VALUES (1, 1),
(2, 1),
(3, 1),
(3, 2),
(4, 1),
(5, 1),
(6, 1),
(6, 2);

INSERT INTO Guest (FirstName, LastName, Birthday)
VALUES ('John', 'Smith', '1980-02-03'),
('Sally', 'Jackson', '1982-09-10'),
('Frank', 'Jackson', '1989-03-20'),
('Alex', 'Johnson', '1983-02-14'),
('Jennifer', 'Davis', '1986-06-04'),
('Elizabeth', 'Miller', '1988-12-12'),
('Craig', 'Miller', '1985-11-01'),
('Michael', 'Williams', '1987-10-31'),
('Heather', 'Williams', '1990-01-01');

INSERT INTO Customer (Phone, Email, GuestID)
VALUES ('703-123-1234', 'jsmith@email.com', 1),
('475-219-9308', 'sally.jackson@inbox.net', 2),
('540-385-7303', 'alexj@email.com', 4),
('682-257-9740', 'jdavis@mail.org', 5),
('703-988-9661', 'liz.miller@web.net', 6),
('804-123-1234', 'mike123@website.com', 8);

INSERT INTO PromotionCode (StartDate, EndDate, PercentageDiscount, FlatDiscount)
VALUES ('2020-02-11', '2020-02-29', NULL, 25.00),
('2020-02-01', '2020-02-29', 0.10, NULL);

INSERT INTO Reservation (StartDate, EndDate, CustomerID)
VALUES ('2020-02-03', '2020-02-05', 1),
('2020-02-03', '2020-02-07', 2),
('2020-02-04', '2020-02-05', 3),
('2020-02-06', '2020-02-10', 4),
('2020-02-14', '2020-02-17', 5),
('2020-02-20', '2020-02-23', 6);

INSERT INTO ReservationGuest (ReservationID, GuestID)
VALUES (1, 1),
(2, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(5, 7),
(6, 8),
(6, 9);

INSERT INTO ReservationRoom (ReservationID, RoomID)
VALUES (1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(5, 6),
(6, 6);

INSERT INTO ReservationPromotionCode (ReservationID, PromotionCodeID)
VALUES (3, 2),
(5, 1);

INSERT INTO AddOn (`Name`)
VALUES ('movie'),
('beverage'),
('candy bar');

INSERT INTO AddOnPrice (StartDate, EndDate, Price, AddOnID)
VALUES ('2020-02-01', '2020-02-29', 10.00, 1),
('2020-02-01', '2020-02-29', 5.00, 2),
('2020-02-01', '2020-02-29', 3.00, 3);

INSERT INTO Bill (PreTaxTotal, TaxTotal, ReservationID)
VALUES (310.00, 46.50, 1),
(750.00, 112.50, 2),
(364.50, 54.68, 3),
(505.00, 75.75, 4),
(1578.00, 236.70, 5),
(908.00, 136.20, 6);

INSERT INTO BillDetails (`Date`, AddOnID, BillID)
VALUES ('2020-02-03', 1, 1),
('2020-02-03', 2, 3),
('2020-02-03', 2, 4),
('2020-02-03', 3, 5),
('2020-02-03', 2, 6),
('2020-02-03', 3, 6);
