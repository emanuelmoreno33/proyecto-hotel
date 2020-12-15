use proyecto_hotel;
go
-- ROOM PACKAGE SUGGESTION INSERT TRIGGER
CREATE OR ALTER TRIGGER TRG_RESERVATION_BI01
ON Reservation
FOR INSERT
AS
BEGIN
	DECLARE @newRoomPackage INT;

	SET @newRoomPackage = (SELECT ISNULL(roomPackageID, 0) FROM inserted);

	UPDATE RoomPackage
	SET frequency = frequency + 1
	WHERE roomPackageID = @newRoomPackage;
END;
GO


-- RESERVATION CANCELLATION
CREATE OR ALTER TRIGGER TRG_RESERVATION_BU01
ON Reservation
FOR UPDATE
AS
BEGIN
	DECLARE @cancelledStatus INT = 5;

	DECLARE @days INT;
	DECLARE @employeeID INT;

	SET @days = (SELECT DATEDIFF(DAY, endDate, startDate) FROM deleted);
	SET @employeeID = (SELECT employeeID FROM deleted);

	IF EXISTS(
		SELECT *
		FROM inserted i
		JOIN deleted d 
		ON i.reservationID = d.reservationID
		WHERE d.reservationStatusID != @cancelledStatus 
			AND i.reservationStatusID = @cancelledStatus
	)
	BEGIN
		DELETE Bonification
		WHERE bonificationID = (
			SELECT TOP 1 bonificationID
			FROM Bonification B
			JOIN (
				SELECT 
					typeOfBonificationID AS typeOfBonificationID, 
					MAX(daysLodging) AS maxDaysLodging
				FROM TypeOfBonification
				WHERE @days > daysLodging
				GROUP BY typeOfBonificationID
			) T
			ON B.typeOfBonificationID = T.typeOfBonificationID
			WHERE employeeId = @employeeID
		);
	END;
END;
GO

-- ROOM PACKAGE SUGGESTION UPDATE TRIGGER
CREATE OR ALTER TRIGGER TRG_RESERVATION_BU02
ON Reservation
FOR UPDATE
AS
BEGIN
	DECLARE @oldRoomPackage INT;
	DECLARE @newRoomPackage INT;

	SET @oldRoomPackage = (SELECT ISNULL(roomPackageID, 0) FROM deleted);
	SET @newRoomPackage = (SELECT ISNULL(roomPackageID, 0) FROM inserted);

	IF @oldRoomPackage = 0 AND @newRoomPackage > 0
	BEGIN
		UPDATE RoomPackage
		SET frequency = frequency + 1
		WHERE roomPackageID = @newRoomPackage;
	END
	ELSE IF @oldRoomPackage > 0 AND @newRoomPackage = 0
	BEGIN
		UPDATE RoomPackage
		SET frequency = frequency - 1
		WHERE roomPackageID = @oldRoomPackage;
	END
	ELSE IF @oldRoomPackage > 0 AND @newRoomPackage > 0 AND @oldRoomPackage != @newRoomPackage
	BEGIN
		UPDATE RoomPackage
		SET frequency = frequency - 1
		WHERE roomPackageID = @oldRoomPackage;

		UPDATE RoomPackage
		SET frequency = frequency + 1
		WHERE roomPackageID = @newRoomPackage;
	END;
END;
GO

-- EMPLOYEE BONIFICATION
CREATE OR ALTER TRIGGER TRG_RESERVATION_BI02
ON Reservation
FOR INSERT
AS
BEGIN
	DECLARE @days INT;
	DECLARE @employeeID INT;

	SET @days = (SELECT DATEDIFF(DAY,startDate,endDate) FROM inserted);
	SET @employeeID = (SELECT employeeID FROM inserted);

	INSERT INTO Bonification(employeeID, typeOfBonificationID)
	SELECT @employeeID, T.typeOfBonificationID
	FROM (
		SELECT 
			typeOfBonificationID AS typeOfBonificationID, 
			MAX(daysLodging) AS maxDaysLodging
		FROM TypeOfBonification
		WHERE @days >= daysLodging
		GROUP BY typeOfBonificationID
	) T;
END;
GO

CREATE OR ALTER TRIGGER TRG_RESERVATION_BU03
ON Reservation
FOR UPDATE
AS
BEGIN
	DECLARE @oldDays INT;
	DECLARE @oldEmployeeID INT;

	DECLARE @newDays INT;
	DECLARE @newEmployeeID INT;
	
	SET @oldDays = (SELECT DATEDIFF(DAY, endDate, startDate) FROM deleted);
	SET @oldEmployeeID = (SELECT employeeID FROM deleted);

	SET @newDays = (SELECT DATEDIFF(DAY, endDate, startDate) FROM inserted);
	SET @newEmployeeID = (SELECT employeeID FROM inserted);

	IF @oldDays != @newDays OR @oldEmployeeID != @newEmployeeID
	BEGIN
		DELETE Bonification
		WHERE bonificationID = (
			SELECT TOP 1 bonificationID
			FROM Bonification B
			JOIN (
				SELECT 
					typeOfBonificationID AS typeOfBonificationID, 
					MAX(daysLodging) AS maxDaysLodging
				FROM TypeOfBonification
				WHERE @oldDays > daysLodging
				GROUP BY typeOfBonificationID
			) T
			ON B.typeOfBonificationID = T.typeOfBonificationID
			WHERE employeeId = @oldEmployeeID
		);

		INSERT INTO Bonification(employeeID, typeOfBonificationID)
		SELECT @newEmployeeID, T.typeOfBonificationID
		FROM (
			SELECT 
				typeOfBonificationID AS typeOfBonificationID, 
				MAX(daysLodging) AS maxDaysLodging
			FROM TypeOfBonification
			WHERE @newDays > daysLodging
			GROUP BY typeOfBonificationID
		) T;
	END;
END;
GO


-- ROOM PACKAGE INSERT TRIGGER
CREATE OR ALTER TRIGGER TRG_ROOMPACKAGE_BI01
ON RoomPackage
FOR INSERT
AS
BEGIN
	DECLARE @roomPackageID INT;

	SET @roomPackageID = (SELECT ISNULL(roomPackageID, 0) FROM inserted);

	UPDATE RoomPackage
	SET frequency = 0
	WHERE roomPackageID = @roomPackageID;
END;
GO