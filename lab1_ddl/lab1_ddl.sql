--Name: Marc Penalosa
--Programming Assignment: Lab1 - DDL(Data Definition Language)

-- 1. Add code to create the berries table
-- Check if berries does not exist. If not, then create the table
IF NOT EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'berries')
	CREATE TABLE berries
	(
		PLU bigint,
		Name varchar(50)
	)
GO

-- 4. Add SQL statement to the SQL file to add rows to the berries table for the first 9 uniques berries
-- If the same type of berry have multiple PLUs in the csv file, use the first one for that berry
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'berries')
	INSERT berries VALUES (3081, 'Saskatoon')
	INSERT berries VALUES (3304, 'Logan')
	INSERT berries VALUES (3355, 'Strawberry')
	INSERT berries VALUES (4054, 'Raspberry')
	INSERT berries VALUES (4239, 'Blackberry')
	INSERT berries VALUES (4240, 'Blueberry')
	INSERT berries VALUES (4241, 'Boysenberry')
	INSERT berries VALUES (4242, 'Cranberry')
	INSERT berries VALUES (4243, 'Gooseberry')
GO

-- 6. Add SQL statement to the SQL file to add a city column to the berries table that is a string
-- that shouldn't get bigger than 50 characters
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'berries')
	ALTER TABLE berries
	ADD city varchar(50)
GO

-- 8. Add SQL statement to the SQL file to alter the data in the berries table
-- setting the city column's contents to Bend for the blackberry row only
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'berries')
	UPDATE berries
	SET city = 'Bend'
	WHERE Name = 'Blackberry'
GO

-- //////DEBUG
--IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'berries')
--	SELECT * FROM berries
--GO

-- 10. Add SQL statement to the SQL file to alter the berries table to remove the city column from the table
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'berries')
	IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'berries' AND COLUMN_NAME = 'city')
		ALTER TABLE berries DROP COLUMN city
GO

-- //////DEBUG
--IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'berries')
--	SELECT * FROM berries
--GO

-- 12. ADD SQL statement to the SQL file to delete the berries table
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'berries')
	DROP TABLE berries
GO

-- //////DEBUG
--IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'berries')
--	SELECT * FROM berries
--GO
