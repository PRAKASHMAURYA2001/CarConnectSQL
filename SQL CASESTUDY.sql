CREATE DATABASE CARCONNECT;
USE CARCONNECT;

CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(25) NOT NULL,
    LastName VARCHAR(25) NOT NULL,
    Email VARCHAR(60)  NOT NULL,
    PhoneNumber VARCHAR(20)  NOT NULL,
    Address VARCHAR(255),
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(50) NOT NULL,
    RegistrationDate DATE
) AUTO_INCREMENT = 1001 ;

CREATE TABLE Vehicle (
    VehicleID INT AUTO_INCREMENT PRIMARY KEY,
    Model VARCHAR(25) NOT NULL,
    Make VARCHAR(25) NOT NULL,
    Year INT,
    Color VARCHAR(20),
    RegistrationNumber VARCHAR(20) UNIQUE NOT NULL,
    Availability BOOLEAN,
    DailyRate DECIMAL(10, 2)
) AUTO_iNCREMENT=101 ;

CREATE TABLE Reservation (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    VehicleID INT,
    StartDate DATETIME,
    EndDate DATETIME,
    TotalCost DECIMAL(10, 2),
    Status VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID)
) AUTO_INCREMENT=10001 ;
drop table admin;
CREATE TABLE Admin (
    AdminID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(25) NOT NULL,
    LastName VARCHAR(25) NOT NULL,
    Email VARCHAR(60)  NOT NULL,
    PhoneNumber VARCHAR(20),
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(25) NOT NULL,
    Role VARCHAR(25),
    JoinDate DATE
) AUTO_INCREMENT=01 ;

INSERT INTO Customer (FirstName, LastName, Email, PhoneNumber, Address, Username, Password, RegistrationDate)
VALUES
('John', 'Doe', 'john.doe@gmail.com', '1234567890', 'Mumbai', 'john_doe', 'doe', '2024-01-19'),
('Alice', 'Smith', 'alice.smith@gmail.com', '9876543210', 'Pune', 'alice_smith', 'smith', '2024-01-20'),
('Bob', 'Johnson', 'bob.johnson@gmail.com', '5555555555', 'Delhi', 'bob_johnson', 'johnson', '2024-01-21'),
('Eva', 'Brown', 'eva.brown@gmail.com', '4443332222', 'Chennai', 'eva_brown', 'brown', '2024-01-22'),
('Charlie', 'Williams', 'charlie.williams@gmail.com', '1112223333', 'Mumbai', 'charlie_williams', 'williams', '2024-01-23');

SELECT * FROM Customer;

INSERT INTO Vehicle (Model, Make, Year, Color, RegistrationNumber, Availability, DailyRate)
VALUES
('Civic', 'Honda', 2022, 'Blue', 'ABC123', true, 50.00),
('Accord', 'Honda', 2021, 'Silver', 'XYZ456', false, 60.00),
('Camry', 'Toyota', 2023, 'Red', 'DEF789', true, 55.00),
('Mustang', 'Ford', 2022, 'Black', 'GHI012', false, 70.00),
('Corolla', 'Toyota', 2020, 'White', 'JKL345', true, 45.00);

SELECT * FROM Vehicle;

INSERT INTO Reservation (CustomerID, VehicleID, StartDate, EndDate, TotalCost, Status)
VALUES
(1001, 101, '2024-01-25 08:00:00', '2024-01-27 18:00:00', 120.00, 'confirmed'),
(1002, 103, '2024-01-22 10:00:00', '2024-01-24 15:00:00', 110.00, 'pending'),
(1003, 102, '2024-01-30 12:00:00', '2024-02-01 12:00:00', 180.00, 'completed'),
(1004, 104, '2024-02-05 09:00:00', '2024-02-07 17:00:00', 140.00, 'confirmed'),
(1005, 105, '2024-02-01 14:00:00', '2024-02-03 10:00:00', 135.00, 'pending');

SELECT * FROM Reservation;

INSERT INTO Admin (FirstName, LastName, Email, PhoneNumber, Username, Password, Role, JoinDate)
VALUES
('Tejas', 'Josh', 'tejasjosh@gmail.com', '9998887777', 'tejas', 'josh', 'manager', '2024-01-19'),
('Sourabh', 'Gark', 'sourabhgark@gmail.com', '8887776666', 'sourabh', 'gark', 'fleet manager', '2024-01-20'),
('Ajay', 'Nagar', 'ajaynagar@gmail.com', '7776665555', 'ajay', 'nagar', 'admin', '2024-01-21'),
('Prashant', 'Dhawan', 'prashantdhawan@gmail.com', '6665554444', 'prashant', 'dhawan', 'fleet manager', '2024-01-22'),
('Sahil', 'Sinha', 'sahilsinha@gmail.com', '5554443333', 'sahil', 'sinha', 'super admin', '2024-01-23');

SELECT * FROM Admin;



