
USE DataWarehouse;
GO

-- Create Bronze Schema if it does not exist
IF SCHEMA_ID('bronze') IS NULL
    EXEC('CREATE SCHEMA bronze');
GO

-- CRM: Customer Information
IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NULL
BEGIN
    CREATE TABLE bronze.crm_cust_info (
        cst_id             INT,
        cst_key            NVARCHAR(50),
        cst_firstname      NVARCHAR(50),
        cst_lastname       NVARCHAR(50),
        cst_marital_status NVARCHAR(50),
        cst_gndr           NVARCHAR(50),
        cst_create_date    DATE
    );
END;
GO

-- CRM: Product Information
IF OBJECT_ID('bronze.crm_prd_inf', 'U') IS NULL
BEGIN
    CREATE TABLE bronze.crm_prd_inf (
        prd_id       INT,
        prd_key      VARCHAR(50),
        prd_name     VARCHAR(50),
        prd_cost     INT,
        prd_line     VARCHAR(50),
        prd_start_dt DATE,
        prd_end_dt   DATE
    );
END;
GO

-- CRM: Sales Details
IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NULL
BEGIN
    CREATE TABLE bronze.crm_sales_details (
        sls_ord_num  VARCHAR(50),
        sls_prd_key  VARCHAR(50),
        sls_cust_id  INT,
        sls_order_dt INT,
        sls_ship_dt  INT,
        sls_due_dt   INT,
        sls_sales    INT,
        sls_quantity INT,
        sls_price    INT
    );
END;
GO

-- ERP: Customer Information
IF OBJECT_ID('bronze.erp_CUST_AZ12', 'U') IS NULL
BEGIN
    CREATE TABLE bronze.erp_CUST_AZ12 (
        cid   VARCHAR(50),
        Bdate DATE,
        Gen   VARCHAR(50)
    );
END;
GO

-- ERP: Customer Location
IF OBJECT_ID('bronze.erp_LOC_A101', 'U') IS NULL
BEGIN
    CREATE TABLE bronze.erp_LOC_A101 (
        cid   VARCHAR(50),
        cntry VARCHAR(50)
    );
END;
GO

-- ERP: Product Categories
IF OBJECT_ID('bronze.erp_PX_CAT_G1V2', 'U') IS NULL
BEGIN
    CREATE TABLE bronze.erp_PX_CAT_G1V2 (
        id          NVARCHAR(50),
        cat         NVARCHAR(50),
        subcat      NVARCHAR(50),
        maintenance NVARCHAR(50)
    );
END;
GO
