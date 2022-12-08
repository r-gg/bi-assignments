CREATE TABLE Fact_InternetSales (
	SalesOrderLineNumber VARCHAR(50) NOT NULL,
	SalesOrderNumber VARCHAR(30) NOT NULL,
	OrderDateKey INT NOT NULL,
	OrderDate DATE NOT NULL,
	DueDateKey INT NOT NULL,
	DueDate DATE NOT NULL,
	ShipDateKey INT NOT NULL,
	ShipDate DATE NOT NULL,
	ProductKey INT NOT NULL,
	CustomerKey INT NOT NULL,
	ShipToLocationKey INT NOT NULL,
	OrderStatusName VARCHAR(50) NOT NULL,
	ShipMethodName VARCHAR(50) NOT NULL,
	OrderQty INT NOT NULL,
	UnitPrice DECIMAL(13,4) NOT NULL,
	OrderLineTotal DECIMAL(13,4) NOT NULL,
	OrderLineProfit DECIMAL(13,4) NOT NULL,
	OrderLineTaxAmt DECIMAL(13,4) NOT NULL,
	OrderLineShippingCost DECIMAL(13,4) NOT NULL,
	constraint PK_FactInternetSales PRIMARY KEY (SalesOrderLineNumber),
    constraint FK_Customer_FactInternetSales foreign key (CustomerKey) references Dim_Customer(CustomerKey),
    constraint FK_ShipToLocation_FactInternetSales foreign key (ShipToLocationKey) references Dim_Location(LocationKey),
    constraint FK_Product_FactInternetSales foreign key (ProductKey) references Dim_Product(ProductKey),
    constraint FK_OrderDate_FactInternetSales foreign key (OrderDateKey) references Dim_Date(DateKey),
    constraint FK_ShipDate_FactInternetSales foreign key (ShipDateKey) references Dim_Date(DateKey),
    constraint FK_DueDate_FactInternetSales foreign key (DueDateKey) references Dim_Date(DateKey)
);