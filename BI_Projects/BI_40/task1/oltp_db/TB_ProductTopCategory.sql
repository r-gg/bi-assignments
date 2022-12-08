CREATE TABLE TB_ProductTopCategory (
	ProductTopCategoryID INT NOT NULL,
	Name VARCHAR(50) NOT NULL,
	ShipSurcharge DECIMAL(13,4),
	constraint PK_ProductTopCategory PRIMARY KEY (ProductTopCategoryID)
);