use carconnect;
DELIMITER //

CREATE TRIGGER calculateTotalCost
BEFORE INSERT ON Reservation
FOR EACH ROW
BEGIN
    DECLARE totalDays INT;
    
    -- Calculate the total number of days for reservation
    SET totalDays = DATEDIFF(NEW.EndDate, NEW.StartDate);
    
    -- Calculate the total cost using daily rate and total days
    SET NEW.TotalCost = totalDays * (SELECT DailyRate FROM Vehicle WHERE VehicleID = NEW.VehicleID);
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER updateReservationStatus
BEFORE INSERT ON Reservation
FOR EACH ROW
BEGIN
    DECLARE isAvailable BOOLEAN;
    
    -- Check if the vehicle is available
    SET isAvailable = (SELECT Availability FROM Vehicle WHERE VehicleID = NEW.VehicleID);
    
    -- Update the reservation status based on vehicle availability
    IF isAvailable THEN
        SET NEW.Status = 'confirmed';
    ELSE
        SET NEW.Status = 'pending';
    END IF;
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER updateVehicleAvailability
AFTER INSERT ON Reservation
FOR EACH ROW
BEGIN
    UPDATE Vehicle
    SET Availability = FALSE
    WHERE VehicleID = NEW.VehicleID;
END;
//

DELIMITER ;

