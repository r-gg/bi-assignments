CREATE TABLE TB_ProductSubCategory (
	ProductSubCategoryID INT NOT NULL,
	ProductTopCategoryID INT NOT NULL,
	Name VARCHAR(50) NOT NULL,
	constraint PK_ProductSubCategory PRIMARY KEY (ProductSubCategoryID),
    constraint FK_ProductTopCategory_ProductSubCategory foreign key (ProductTopCategoryID) references TB_ProductTopCategory(ProductTopCategoryID)
);