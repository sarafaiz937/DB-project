CREATE DATABASE BusTicketCounterSystem;
CREATE TABLE Passenger(
    PassengerID SERIAL PRIMARY KEY,
    Name VARCHAR(50),
    CNIC VARCHAR(15),
    ContactNo VARCHAR(15),
    Address VARCHAR(100)
);
CREATE TABLE Bus(
    BusID SERIAL PRIMARY KEY,
    BusNumber VARCHAR(20),
    BusType VARCHAR(20),
    TotalSeats INT,
    DriverName VARCHAR(50)
);
CREATE TABLE Route(
    RouteID SERIAL PRIMARY KEY,
    SourceCity VARCHAR(50),
    DestinationCity VARCHAR(50),
    Distance INT
);
CREATE TABLE Staff(
    StaffID SERIAL PRIMARY KEY,
    Name VARCHAR(50),
    ContactNo VARCHAR(15),
    Designation VARCHAR(30),
    Salary DECIMAL(10,2)
);
CREATE TABLE Admin(
    AdminID SERIAL PRIMARY KEY,
    Name VARCHAR(50),
    Username VARCHAR(30),
    Password VARCHAR(30)
);
CREATE TABLE Schedule(
    ScheduleID SERIAL PRIMARY KEY,
    BusID INT,
    RouteID INT,
    DepartureTime TIMESTAMP,
    ArrivalTime TIMESTAMP,

    FOREIGN KEY(BusID)
    REFERENCES Bus(BusID),

    FOREIGN KEY(RouteID)
    REFERENCES Route(RouteID)
);
CREATE TABLE Seat(
    SeatID SERIAL PRIMARY KEY,
    BusID INT,
    SeatNumber INT,
    Status VARCHAR(20),

    FOREIGN KEY(BusID)
    REFERENCES Bus(BusID)
);
CREATE TABLE Ticket(
    TicketID SERIAL PRIMARY KEY,
    PassengerID INT,
    ScheduleID INT,
    SeatNo INT,
    Fare DECIMAL(10,2),
    BookingStatus VARCHAR(20),

    FOREIGN KEY(PassengerID)
    REFERENCES Passenger(PassengerID),

    FOREIGN KEY(ScheduleID)
    REFERENCES Schedule(ScheduleID)
);
CREATE TABLE Payment(
    PaymentID SERIAL PRIMARY KEY,
    TicketID INT UNIQUE,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(20),
    PaymentStatus VARCHAR(20),

    FOREIGN KEY(TicketID)
    REFERENCES Ticket(TicketID)
);
CREATE TABLE Cancellation(
    CancellationID SERIAL PRIMARY KEY,
    TicketID INT UNIQUE,
    RefundAmount DECIMAL(10,2),
    CancelDate DATE,

    FOREIGN KEY(TicketID)
    REFERENCES Ticket(TicketID)
);
CREATE TABLE Feedback(
    FeedbackID SERIAL PRIMARY KEY,
    PassengerID INT,
    Rating INT,
    Comments VARCHAR(200),

    FOREIGN KEY(PassengerID)
    REFERENCES Passenger(PassengerID)
);
INSERT INTO Passenger(Name,CNIC,ContactNo,Address)
VALUES
('Ali Khan','35202-1111111-1','03001111111','Lahore'),
('Ahmed Raza','35202-2222222-2','03002222222','Islamabad'),
('Usman Tariq','35202-3333333-3','03003333333','Faisalabad');
INSERT INTO Bus(BusNumber,BusType,TotalSeats,DriverName)
VALUES
('LES101','Luxury',40,'Aslam'),
('LEA202','Business',45,'Khalid');
INSERT INTO Route(SourceCity,DestinationCity,Distance)
VALUES
('Lahore','Islamabad',380),
('Lahore','Karachi',1200);
INSERT INTO Staff(Name,ContactNo,Designation,Salary)
VALUES
('Bilal','03001234567','Counter Staff',30000),
('Hamza','03007654321','Manager',60000);
INSERT INTO Admin(Name,Username,Password)
VALUES
('Admin','admin','admin123');
INSERT INTO Schedule
(BusID,RouteID,DepartureTime,ArrivalTime)
VALUES
(1,1,'2026-06-10 08:00:00','2026-06-10 13:00:00'),
(2,2,'2026-06-11 09:00:00','2026-06-11 23:00:00');
INSERT INTO Seat(BusID,SeatNumber,Status)
VALUES
(1,1,'Available'),
(1,2,'Available'),
(1,3,'Available'),
(1,4,'Available');
INSERT INTO Ticket
(PassengerID,ScheduleID,SeatNo,Fare,BookingStatus)
VALUES
(1,1,1,2500,'Booked');
INSERT INTO Payment
(TicketID,Amount,PaymentMethod,PaymentStatus)
VALUES
(1,2500,'JazzCash','Paid');
INSERT INTO Feedback
(PassengerID,Rating,Comments)
VALUES
(1,5,'Excellent Service');
UPDATE Ticket
SET BookingStatus='Cancelled'
WHERE TicketID=1;
INSERT INTO Cancellation
(TicketID,RefundAmount,CancelDate)
VALUES
(1,2000,CURRENT_DATE);
SELECT * FROM Passenger;
SELECT * FROM Bus;
SELECT * FROM Route;
SELECT
P.Name,
B.BusNumber,
R.SourceCity,
R.DestinationCity,
T.SeatNo,
T.Fare,
T.BookingStatus
FROM Ticket T
JOIN Passenger P ON T.PassengerID=P.PassengerID
JOIN Schedule S ON T.ScheduleID=S.ScheduleID
JOIN Bus B ON S.BusID=B.BusID
JOIN Route R ON S.RouteID=R.RouteID;
SELECT SUM(Amount) AS TotalRevenue
FROM Payment;
SELECT *
FROM Seat
WHERE Status='Available';
SELECT AVG(Rating)
FROM Feedback;
SELECT COUNT(*)
FROM Ticket;