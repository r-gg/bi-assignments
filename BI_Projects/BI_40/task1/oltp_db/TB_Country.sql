create table TB_Country (
	CountryID int NOT NULL,
	Country VARCHAR(50) NOT NULL,
    Region VARCHAR(50) NOT NULL,
    TaxRate DECIMAL(13,4),
    ShipCoeff DECIMAL(13,4),
    constraint PK_Country primary key(CountryID)
    
)