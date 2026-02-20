/***1. Create a DTABASE named "ecommerce_Sales_data"***/
CREATE DATABASE IF NOT EXISTS ecommerce_sales_data;
SHOW DATABASES;

/*****2.Create a Table inside a Database named "ecommerce_Sales_data"****/
/****1.csvkitInstall ****/
/*------COMMAND TO create a .sql file :csvsql --dialect mysql --snifflimit 10000 Sales_Dataset.csv > Result.sql****/
CREATE TABLE `Sales_Dataset` (
	order_id VARCHAR(15) NOT NULL, 
	order_date DATE NOT NULL, 
	ship_date DATE NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 5) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	year DECIMAL(38, 0) NOT NULL
);

SHOW tables;
show database;
DROP table Sales_Dataset;
USE ecommerce_sales_data;

CREATE TABLE `Sales_Dataset` (
	order_id VARCHAR(15) NOT NULL, 
	order_date DATE NOT NULL, 
	ship_date DATE NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 5) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	year DECIMAL(38, 0) NOT NULL
);
/***3. Load the data available in Sales_Datset.csv file to the Sales_dataset table***/
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Sales_Dataset.csv'
INTO TABLE Sales_Dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


SHOW VARIABLES LIKE 'secure_file_priv';

SELECT *FROM Sales_Dataset;

/*** IDentify the Top 3 states with the highest shipping Costs***/
/** state highest_sum_shipping_cost***/
SELECT state, SUM(shipping_cost) As sum_shipping_cost 
FROM Sales_Dataset
GROUP BY state
ORDER BY sum_shipping_cost DESC 
LIMIT 3;


/****Common Table Expression -- is used when there is a Complexity + Reuse of the Query****/
WITH states as  (SELECT state, SUM(shipping_cost) As sum_shipping_cost 
FROM Sales_Dataset
GROUP BY state
ORDER BY sum_shipping_cost DESC 
LIMIT 3
)SELECT *FROM states

/***----Common Tbale Expressions are Used whenever there are lot JOINs and SubQueries,we use CTE***/


