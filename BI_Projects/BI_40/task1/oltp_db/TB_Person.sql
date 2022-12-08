create table TB_Person (
	PersonID int NOT NULL,
    FirstName varchar(50) not null,
    MiddleName varchar(50),
    LastName varchar(50) not null,
    Gender varchar(1),
    Birthdate date,
    constraint PK_Person primary key(PersonID)
)