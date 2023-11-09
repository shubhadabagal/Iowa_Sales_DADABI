/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Iowa_Liquor_Sales.DM1
 *
 * Date Created : Wednesday, November 02, 2022 21:21:05
 * Target DBMS : Microsoft SQL Server 2019
 */

/* 
 * TABLE: Dim_Category 
 */

CREATE TABLE Dim_Category(
    Category_Key     int             NOT NULL,
    Category         int             NULL,
    Category_Name    varchar(100)    NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (Category_Key)
)

go


IF OBJECT_ID('Dim_Category') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Category >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Category >>>'
go

/* 
 * TABLE: Dim_Date 
 */

CREATE TABLE Dim_Date(
    Date_Key    int     NOT NULL,
    Date        date    NULL,
    Year        int     NULL,
    Month       int     NULL,
    Day         int     NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (Date_Key)
)

go


IF OBJECT_ID('Dim_Date') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Date >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Date >>>'
go

/* 
 * TABLE: Dim_Geo 
 */

CREATE TABLE Dim_Geo(
    Address_Key       int             NOT NULL,
    Address           varchar(200)    NULL,
    State             varchar(50)     NULL,
    City              varchar(50)     NULL,
    FIPS_City         int             NULL,
    Zipcode           int             NULL,
    Store_Location    varchar(100)    NULL,
    County_Number     int             NULL,
    County            varchar(100)    NULL,
    FIPS_County       int             NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (Address_Key)
)

go


IF OBJECT_ID('Dim_Geo') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Geo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Geo >>>'
go

/* 
 * TABLE: Dim_Product 
 */

CREATE TABLE Dim_Product(
    Product_Key         int              NOT NULL,
    Item_Number         int              NULL,
    Item_Description    varchar(1000)    NULL,
    UPC                 bigint           NULL,
    SCC                 bigint           NULL,
    Age                 int              NULL,
    Proof               int              NULL,
    Pack                int              NULL,
    Inner_Pack          int              NULL,
    Bottle_Volume_ml    int              NULL,
    Category_Key        int              NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (Product_Key)
)

go


IF OBJECT_ID('Dim_Product') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Product >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Product >>>'
go

/* 
 * TABLE: Dim_Store 
 */

CREATE TABLE Dim_Store(
    Store_Key       int             NOT NULL,
    Store_Number    int             NULL,
    Store_Name      varchar(200)    NULL,
    Store_Status    char(1)         NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (Store_Key)
)

go


IF OBJECT_ID('Dim_Store') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Store >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Store >>>'
go

/* 
 * TABLE: Dim_Vendor 
 */

CREATE TABLE Dim_Vendor(
    Vendor_Key     int             NOT NULL,
    Vendor         varchar(100)    NULL,
    Vendor_Name    varchar(100)    NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (Vendor_Key)
)

go


IF OBJECT_ID('Dim_Vendor') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Vendor >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Vendor >>>'
go

/* 
 * TABLE: [Fact_Liquor _Sales] 
 */

CREATE TABLE [Fact_Liquor _Sales](
    Bottles_Sold           int            NULL,
    State_Bottle_Cost      money          NULL,
    Sta                    money          NULL,
    Volume_Sold_Literes    float          NULL,
    Volume_Sold_Gallons    float          NULL,
    State_Case_Cost        money          NULL,
    Store_Key              int            NULL,
    Address_Key            int            NULL,
    Vendor_Key             int            NULL,
    Date_Key               int            NULL,
    Product_Key            int            NULL,
    Invoice_Item_Number    varchar(50)    NULL
)

go


IF OBJECT_ID('Fact_Liquor _Sales') IS NOT NULL
    PRINT '<<< CREATED TABLE Fact_Liquor _Sales >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fact_Liquor _Sales >>>'
go

/* 
 * TABLE: FCT_Population_Sales 
 */

CREATE TABLE FCT_Population_Sales(
    Population             bigint    NULL,
    Sale_Dollars           money     NULL,
    Volume_Sold_Gallons    float     NULL,
    Address_Key            int       NULL,
    Date_Key               int       NULL
)

go


IF OBJECT_ID('FCT_Population_Sales') IS NOT NULL
    PRINT '<<< CREATED TABLE FCT_Population_Sales >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FCT_Population_Sales >>>'
go

/* 
 * TABLE: Dim_Product 
 */

ALTER TABLE Dim_Product ADD CONSTRAINT RefDim_Category10 
    FOREIGN KEY (Category_Key)
    REFERENCES Dim_Category(Category_Key)
go


/* 
 * TABLE: [Fact_Liquor _Sales] 
 */

ALTER TABLE [Fact_Liquor _Sales] ADD CONSTRAINT RefDim_Store1 
    FOREIGN KEY (Store_Key)
    REFERENCES Dim_Store(Store_Key)
go

ALTER TABLE [Fact_Liquor _Sales] ADD CONSTRAINT RefDim_Geo2 
    FOREIGN KEY (Address_Key)
    REFERENCES Dim_Geo(Address_Key)
go

ALTER TABLE [Fact_Liquor _Sales] ADD CONSTRAINT RefDim_Vendor4 
    FOREIGN KEY (Vendor_Key)
    REFERENCES Dim_Vendor(Vendor_Key)
go

ALTER TABLE [Fact_Liquor _Sales] ADD CONSTRAINT RefDim_Date5 
    FOREIGN KEY (Date_Key)
    REFERENCES Dim_Date(Date_Key)
go

ALTER TABLE [Fact_Liquor _Sales] ADD CONSTRAINT RefDim_Product6 
    FOREIGN KEY (Product_Key)
    REFERENCES Dim_Product(Product_Key)
go


/* 
 * TABLE: FCT_Population_Sales 
 */

ALTER TABLE FCT_Population_Sales ADD CONSTRAINT RefDim_Geo8 
    FOREIGN KEY (Address_Key)
    REFERENCES Dim_Geo(Address_Key)
go

ALTER TABLE FCT_Population_Sales ADD CONSTRAINT RefDim_Date12 
    FOREIGN KEY (Date_Key)
    REFERENCES Dim_Date(Date_Key)
go


