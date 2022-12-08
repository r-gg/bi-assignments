CREATE TABLE TB_SalesOrderHeader (
	SalesOrderID INT NOT NULL,
	SalesOrderNumber VARCHAR(30) NOT NULL,
	OrderDate DATE NOT NULL,
	DueDate DATE NOT NULL,
	ShipDate DATE,
	OrderStatusID INT NOT NULL,
	CustomerID INT NOT NULL,
	BillToAddressID INT NOT NULL,
	ShipToAddressID INT NOT NULL,
	ShipMethodID INT NOT NULL,
	constraint PK_SalesOrder PRIMARY KEY (SalesOrderID),
    constraint FK_OrderStatus_SalesOrderHeader foreign key (OrderStatusID) references TB_OrderStatus(OrderStatusID),
    constraint FK_Customer_SalesOrderHeader foreign key (CustomerID) references TB_Customer(CustomerID),
    constraint FK_BillToAddress_SalesOrderHeader foreign key (BillToAddressID) references TB_Address(AddressID),
    constraint FK_ShipToAddress_SalesOrderHeader foreign key (ShipToAddressID) references TB_Address(AddressID),
    constraint FK_ShipMethod_SalesOrderHeader foreign key (ShipMethodID) references TB_ShipMethod(ShipMethodID)
);