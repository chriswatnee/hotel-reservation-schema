USE HotelReservation;

/*
	Get room information for any room that has a spa bath amenity and is avaible on 02/05/2020
*/

SELECT `Number`, `Floor`, OccupancyLimit, rt.`Name` AS RoomType, Rate
FROM Room r
INNER JOIN RoomType rt ON r.RoomTypeID = rt.RoomTypeID
INNER JOIN RoomAmenity ra ON r.RoomID = ra.RoomID
INNER JOIN Amenity a ON ra.AmenityID = a.AmenityID
INNER JOIN RoomRate rr ON r.RoomTypeID = rr.RoomTypeID
WHERE a.Name = 'spa bath' AND '2020-02-05' BETWEEN rr.StartDate AND rr.EndDate AND r.RoomID NOT IN
	(SELECT r.RoomID
    FROM Room r
	INNER JOIN ReservationRoom rr ON r.RoomID = rr.RoomID
	INNER JOIN Reservation rv ON rr.ReservationID = rv.ReservationID
    WHERE '2020-02-05' BETWEEN rv.StartDate AND rv.EndDate)
ORDER BY `Floor`, `Number`;

/*
	Get bill for reservation where ReservationID is 5
*/

SELECT FirstName, LastName, Phone, Email, StartDate, EndDate, PreTaxTotal, TaxTotal
FROM Bill b
INNER JOIN Reservation r ON b.ReservationID = r.ReservationID
INNER JOIN Customer c ON r.CustomerID = c.CustomerID
INNER JOIN Guest g ON c.GuestID = g.GuestID
WHERE b.ReservationID = 5;

/*
	Get bill details containing add ons for reservation where ReservationID is 5
*/

SELECT bd.`Date`, a.`Name`, ap.Price
FROM Bill b
INNER JOIN BillDetails bd ON b.BillID = bd.BillID
INNER JOIN AddOn a ON bd.AddOnID = a.AddOnID
INNER JOIN AddOnPrice ap ON a.AddOnID = ap.AddOnID
WHERE b.ReservationID = 5 AND bd.Date BETWEEN ap.StartDate AND ap.EndDate;

/*
	Get promotion code details for reservation where ReservationID is 5
*/

SELECT p.PromotionCodeID, p.StartDate, p.EndDate, PercentageDiscount, FlatDiscount
FROM Bill b
INNER JOIN Reservation r ON b.ReservationID = r.ReservationID
INNER JOIN ReservationPromotionCode rp ON r.ReservationID = rp.ReservationID
INNER JOIN PromotionCode p ON rp.PromotionCodeID = p.PromotionCodeID
WHERE b.ReservationID = 5;

/*
	Get total number of guest at hotel on 02/05/2020
*/

SELECT COUNT(GuestID) AS GuestTotal
FROM Reservation rv
INNER JOIN ReservationGuest rg ON rv.ReservationID = rg.ReservationID
WHERE '2020-02-05' BETWEEN rv.StartDate AND rv.EndDate;