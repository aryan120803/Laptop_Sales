create database sql_project;
use sql_project;
show tables;
describe laptop_sales_dataset;
SELECT * FROM laptop_sales_dataset;
 
# Count total records
SELECT COUNT(*) AS Total_Records FROM laptop_sales_dataset;

# Check for duplicate records
SELECT Customer_Name, Laptop_Brand, Model, Date_of_Sale, COUNT(*) 
FROM laptop_sales_dataset GROUP BY Customer_Name, Laptop_Brand, Model, Date_of_Sale 
HAVING COUNT(*) > 1;

# check null values
SELECT 
    SUM(CASE WHEN Customer_Name IS NULL THEN 1 ELSE 0 END) AS Missing_Customer_Name,
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Missing_Age,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Missing_Gender,
    SUM(CASE WHEN Location IS NULL THEN 1 ELSE 0 END) AS Missing_Location,
    SUM(CASE WHEN Laptop_Brand IS NULL THEN 1 ELSE 0 END) AS Missing_Laptop_Brand,
    SUM(CASE WHEN Price IS NULL THEN 1 ELSE 0 END) AS Missing_Price
FROM laptop_sales_dataset;

# Total Sales Revenue
SELECT SUM(Final_Price) AS Total_Revenue FROM laptop_sales_dataset;

# Most Popular Laptop Brand
SELECT Laptop_Brand, COUNT(*) AS Total_Sales FROM laptop_sales_dataset
GROUP BY Laptop_Brand ORDER BY Total_Sales DESC LIMIT 1;

# Average Price of Laptops Sold
SELECT ROUND(AVG(Final_Price), 2) AS Average_Laptop_Price FROM laptop_sales_dataset;

# Sales Distribution by Payment Method
SELECT Payment_Method, COUNT(*) AS Payment_Count
FROM laptop_sales_dataset GROUP BY Payment_Method;

# Top 5 Best-Selling Laptop Models
SELECT Model, COUNT(*) AS Sales_Count FROM laptop_sales_dataset
GROUP BY Model ORDER BY Sales_Count DESC LIMIT 5;

# Average Discount Given on Each Laptop Brand
SELECT Laptop_Brand, ROUND(AVG(Discount_Applied), 2) AS Avg_Discount
FROM laptop_sales_dataset GROUP BY Laptop_Brand ORDER BY Avg_Discount DESC;

# Top 5 Locations with Highest Sales
SELECT Location, SUM(Final_Price) AS Total_Sales FROM laptop_sales_dataset
GROUP BY Location ORDER BY Total_Sales DESC LIMIT 5;

# the Most Preferred RAM Size
SELECT RAM_Size, COUNT(*) AS Count FROM laptop_sales_dataset
GROUP BY RAM_Size ORDER BY Count DESC LIMIT 10;

# Gender-wise Sales Distribution
SELECT Gender, COUNT(*) AS Total_Sales, SUM(Final_Price) AS Total_Revenue
FROM laptop_sales_dataset GROUP BY Gender;

# the Most Common Payment Method Used
SELECT Payment_Method, COUNT(*) AS Usage_Count FROM laptop_sales_dataset
GROUP BY Payment_Method ORDER BY Usage_Count DESC LIMIT 3;

# Customers Who Purchased More Than Once
SELECT Customer_Name, COUNT(*) AS Purchase_Count FROM laptop_sales_dataset
GROUP BY Customer_Name HAVING Purchase_Count > 1 ORDER BY Purchase_Count DESC;

# Average Customer Rating Per Brand
SELECT Laptop_Brand, ROUND(AVG(Customer_Rating), 2) AS Avg_Rating
FROM laptop_sales_dataset GROUP BY Laptop_Brand ORDER BY Avg_Rating DESC;

# Brand with the Highest Total Sales
SELECT Laptop_Brand, SUM(Final_Price) AS Total_Sales FROM laptop_sales_dataset
GROUP BY Laptop_Brand ORDER BY Total_Sales DESC LIMIT 1;

# Top 5 Customers Who Spent the Most
SELECT Customer_Name, SUM(Final_Price) AS Total_Spent FROM laptop_sales_dataset
GROUP BY Customer_Name ORDER BY Total_Spent DESC LIMIT 5;

# Best-Selling Laptop Model Per Brand
SELECT Laptop_Brand, Model, COUNT(*) AS Sales_Count FROM laptop_sales_dataset
GROUP BY Laptop_Brand, Model ORDER BY Laptop_Brand, Sales_Count DESC;

# Most Discounted Laptop Model
SELECT Model, MAX(Discount_Applied) AS Max_Discount FROM laptop_sales_dataset
GROUP BY Model ORDER BY Max_Discount DESC LIMIT 1;

# the Best-Performing Sales Channel
SELECT Sales_Channel, SUM(Final_Price) AS Total_Revenue FROM laptop_sales_dataset
GROUP BY Sales_Channel ORDER BY Total_Revenue DESC;

# Laptop Models with the Least Sales
SELECT Model, COUNT(*) AS Sales_Count FROM laptop_sales_dataset
GROUP BY Model ORDER BY Sales_Count ASC LIMIT 5;

#Brand That Has the Most Repeat Customers
SELECT Laptop_Brand, COUNT(DISTINCT Customer_Name) AS Repeat_Customers FROM laptop_sales_dataset
GROUP BY Laptop_Brand ORDER BY Repeat_Customers DESC;

