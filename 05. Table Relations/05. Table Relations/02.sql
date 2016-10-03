-- 02.	One-To-Many Relationship
CREATE TABLE Manufacturer
(
	ManufacturerID INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(50),
	EstablishedOn DATE
)

CREATE TABLE Models
(
	ModelId INT IDENTITY(101, 1) PRIMARY KEY,
	Name NVARCHAR(50),
	ManufacturerID INT
	CONSTRAINT FK_Models_Manufacturers FOREIGN KEY(ManufacturerID) REFERENCES Manufacturer(ManufacturerID)
)

INSERT INTO Manufacturer (Name, EstablishedOn)
VALUES
('BMW', '07-03-1916'),
('Tesla', '01-01-2003'),
('Lada', '01-05-1966')

INSERT INTO Models (Name, ManufacturerID)
VALUES
('X1', 1),
('i6', 1),
('Model S', 2),
('Model X', 2),
('Model 3', 2),
('Nova', 3)

SELECT * FROM Manufacturer
SELECT ma.Name AS Manufacturer, mo.Name FROM Models as mo
JOIN Manufacturer ma ON
mo.ManufacturerID = ma.ManufacturerID

DROP TABLE Models
DROP TABLE Manufacturer