CREATE TABLE TB_SalesOrderDetail (
	SalesOrderDetailID INT NOT NULL,
	SalesOrderID INT NOT NULL,
	ProductID INT NOT NULL,
	OrderQty INT NOT NULL,
	UnitPrice DECIMAL(13,4) NOT NULL,
	constraint PK_SalesOrderDetail PRIMARY KEY (SalesOrderDetailID),
    constraint FK_SalesOrder_SalesOrderDetail foreign key (SalesOrderID) references TB_SalesOrderHeader(SalesOrderID),
    constraint FK_Product_SalesOrderDetail foreign key (ProductID) references TB_Product(ProductID)
);