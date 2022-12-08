CREATE TABLE Dim_Date (
	DateKey INT NOT NULL,
	FullDateAlternateKey DATE NOT NULL,
	DayNumberOfWeek INT NOT NULL,
	EnglishDayNameOfWeek VARCHAR(15) NOT NULL,
	DayNumberOfMonth INT NOT NULL,
	DayNumberOfYear INT NOT NULL,
	WeekNumberOfYear INT NOT NULL,
	EnglishMonthName VARCHAR(20) NOT NULL,
	MonthNumberOfYear INT NOT NULL,
	CalendarQuarter INT NOT NULL,
	CalendarYear INT NOT NULL,
	constraint PK_DimDate PRIMARY KEY (DateKey)
);