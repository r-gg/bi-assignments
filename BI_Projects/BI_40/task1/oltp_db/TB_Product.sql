CREATE TABLE TB_Product (
	ProductID INT NOT NULL,
	ProductName VARCHAR(50) NOT NULL,
	ProductNumber VARCHAR(50) NOT NULL,
	StandardCost DECIMAL(13,4) NOT NULL,
	ListPrice DECIMAL(13,4) NOT NULL,
	ProductSubCategoryID INT,
	ProductModelID INT,
	SellStartDate DATE NOT NULL,
	SellEndDate DATE,
	constraint PK_Product PRIMARY KEY (ProductID),
    constraint FK_ProductSubCategory_Product foreign key(ProductSubCategoryID) references TB_ProductSubCategory(ProductSubCategoryID),
    constraint FK_ProductModel_Product foreign key(ProductModelID) references TB_ProductModel(ProductModelID)
);