create table TB_Address (
	AddressID int NOT NULL,
    CountryID int NOT NULL,
    AddressLine VARCHAR(60) NOT NULL,
    City VARCHAR(30) NOT NULL,
    PostalCode VARCHAR(15) NOT NULL,
	constraint PK_Address primary key(AddressID),
    constraint FK_Country_Address foreign key(CountryID) references TB_Country(CountryID)
)