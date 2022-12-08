create table Dim_Customer (
	CustomerKey int NOT NULL,
    AccountNumber VARCHAR(30) NOT NULL,
    FullName varchar(150) NOT NULL,
    Gender varchar(1),
    Age int,
    constraint PK_DimCustomer primary key(CustomerKey)
)