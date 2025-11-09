-- TelecomCPA Data Mart
-- Author:Teja Ambati
CREATE DATABASE TelecomCPA;
USE TelecomCPA;


DROP TABLE IF EXISTS STG_TELCO_CLEAN;
CREATE TABLE STG_TELCO_CLEAN (
    customerID VARCHAR(20),
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(5),
    Dependents VARCHAR(5),
    tenure INT,
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(20),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(10),
    OnlineBackup VARCHAR(10),
    DeviceProtection VARCHAR(10),
    TechSupport VARCHAR(10),
    StreamingTV VARCHAR(10),
    StreamingMovies VARCHAR(10),
    Contract VARCHAR(20),
    PaperlessBilling VARCHAR(5),
    PaymentMethod VARCHAR(30),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    Churn VARCHAR(5),
    Country VARCHAR(30),
    Region VARCHAR(30),
    ProfitabilityScore DECIMAL(10,2),
    CPI DECIMAL(10,4),
    CLV DECIMAL(10,2)
);

SET GLOBAL local_infile = 1;

SHOW VARIABLES LIKE 'local_infile';


LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/telco_cleaned_for_sql.csv'
INTO TABLE STG_TELCO_CLEAN
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM STG_TELCO_CLEAN;


DROP TABLE IF EXISTS DIM_CUSTOMER;
CREATE TABLE DIM_CUSTOMER (
    Customer_SK INT NOT NULL AUTO_INCREMENT,
    customerID VARCHAR(20) NOT NULL UNIQUE,
    gender VARCHAR(10),
    SeniorCitizen BOOLEAN,
    Partner VARCHAR(5),
    Dependents VARCHAR(5),
    Country VARCHAR(30),
    Region VARCHAR(30),
    PRIMARY KEY (Customer_SK)
);

INSERT INTO DIM_CUSTOMER (customerID, gender, SeniorCitizen, Partner, Dependents, Country, Region)
SELECT DISTINCT customerID, gender, SeniorCitizen, Partner, Dependents, Country, Region
FROM STG_TELCO_CLEAN;

DROP TABLE IF EXISTS FACT_PROFITABILITY;
CREATE TABLE FACT_PROFITABILITY (
    Fact_ID INT NOT NULL AUTO_INCREMENT,
    Customer_SK INT,
    tenure INT,
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    Contract VARCHAR(20),
    InternetService VARCHAR(20),
    Churn VARCHAR(5),
    ProfitabilityScore DECIMAL(10,2),
    CPI DECIMAL(10,4),
    CLV DECIMAL(10,2),
    PRIMARY KEY (Fact_ID),
    FOREIGN KEY (Customer_SK) REFERENCES DIM_CUSTOMER(Customer_SK)
);

INSERT INTO FACT_PROFITABILITY (Customer_SK, tenure, MonthlyCharges, TotalCharges, Contract, InternetService, Churn, ProfitabilityScore, CPI, CLV)
SELECT 
    dc.Customer_SK,
    s.tenure,
    s.MonthlyCharges,
    s.TotalCharges,
    s.Contract,
    s.InternetService,
    s.Churn,
    s.ProfitabilityScore,
    s.CPI,
    s.CLV
FROM STG_TELCO_CLEAN s
JOIN DIM_CUSTOMER dc ON s.customerID = dc.customerID;

SELECT COUNT(*) AS Total_Customers FROM DIM_CUSTOMER;
SELECT COUNT(*) AS Total_Fact_Rows FROM FACT_PROFITABILITY;
SELECT * FROM FACT_PROFITABILITY LIMIT 5;

SELECT * FROM DIM_CUSTOMER;
SELECT * FROM FACT_PROFITABILITY;
