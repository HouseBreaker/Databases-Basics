CREATE TABLE DepositTypes
(
	DepositTypeID INT,
	DepositName VARCHAR(50),
	CONSTRAINT PK_DepositTypes PRIMARY KEY (DepositTypeID)
)

CREATE TABLE Deposits
(
	DepositID INT IDENTITY,
	Amount DECIMAL(8, 2),
	StartDate DATE,
	EndDate DATE,
	DepositTypeID INT,
	CustomerID INT,
	CONSTRAINT PK_Deposits PRIMARY KEY (DepositID),
	CONSTRAINT FK_Deposits_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
	CONSTRAINT FK_Deposits_DepositTypes FOREIGN KEY (DepositTypeID) REFERENCES DepositTypes (DepositTypeID)
)

CREATE TABLE EmployeesDeposits
(
	EmployeeID INT,
	DepositID INT,
	CONSTRAINT PK_EmployeesDeposits PRIMARY KEY (EmployeeID, DepositID),
	CONSTRAINT FK_EmployeesDeposits_Employees FOREIGN KEY (EmployeeID) REFERENCES Employees,
	CONSTRAINT FK_EmployeesDeposits_Deposits FOREIGN KEY (DepositID) REFERENCES Deposits
)

CREATE TABLE CreditHistory
(
	CreditHistoryID INT,
	Mark CHAR(1),
	StartDate DATE,
	EndDate DATE,
	CustomerID INT,
	CONSTRAINT PK_CreditHistory PRIMARY KEY (CreditHistoryID),
	CONSTRAINT FK_CreditHistory_Loans FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
)

CREATE TABLE Payments
(
	PaymentID INT,
	[Date] DATE,
	Amount DECIMAL(10, 2),
	LoanID INT,
	CONSTRAINT PK_Payments PRIMARY KEY (PaymentID),
	CONSTRAINT FK_Payments_Loans FOREIGN KEY (LoanID) REFERENCES Loans(LoanID)
)

CREATE TABLE Users
(
	UserID INT,
	UserName VARCHAR(20),
	Password VARCHAR(20),
	CustomerID INT UNIQUE,
	CONSTRAINT PK_Users PRIMARY KEY (UserID),
	CONSTRAINT FK_Users_Customers FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
)

ALTER TABLE Employees
ADD ManagerID INT,
CONSTRAINT FK_Employees_Employees FOREIGN KEY (ManagerID) REFERENCES Employees (EmployeeID)