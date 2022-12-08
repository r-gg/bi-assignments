create table TB_Customer (
	CustomerID int NOT NULL,
    PersonID int NOT NULL,
    AccountNumber VARCHAR(30) NOT NULL,
    constraint PK_Customer primary key(CustomerID),
    constraint FK_Person_Customer foreign key(PersonID) references TB_Person(PersonID)
)