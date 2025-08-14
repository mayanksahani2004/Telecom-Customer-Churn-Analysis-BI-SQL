
-- USE telecom;
SELECT * FROM telecom_churn_dataset;

-- KPIs

-- Find the Total Number of Customers 
SELECT COUNT(Customer_ID) AS total_customers
FROM telecom_churn_dataset;

-- Find the Total No. of Customers who Churned?
SELECT SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END) AS Churn_Count
FROM telecom_churn_dataset;

-- Find the Churn Percentage
SELECT ROUND(100*SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END)/COUNT(Customer_ID),2) AS Churn_Percentage
FROM telecom_churn_dataset;

-- Find the Total Revenue of the Telecom Company
SELECT ROUND(SUM(total_revenue),2) AS Total_Revenue
FROM telecom_churn_dataset;

-- Find the Avg. Age of the Customer
SELECT ROUND(AVG(age)) AS Avg_Age
FROM telecom_churn_dataset;

-- Find the Total Monthly Charges
SELECT ROUND(SUM(total_charges),2) AS Total_Revenue
FROM telecom_churn_dataset;


-- CUSTOMER DETAILS

-- Display the Gender Distribution 
SELECT gender,COUNT(customer_id) AS customer_count
FROM telecom_churn_dataset
GROUP BY gender; 

-- Distribute the Customers under various Age-Categories
SELECT CASE WHEN age<30 THEN 'Adult'
            WHEN age<=50 THEN 'Middle-Age'
            ELSE 'Senior' END AS age_group, COUNT(customer_id) AS customer_count
FROM telecom_churn_dataset
GROUP BY age_group
ORDER BY customer_count DESC;

-- Find out Customer's Marital Status
 SELECT married,COUNT(customer_id) AS customer_count
 FROM telecom_churn_dataset
 GROUP BY married
 ORDER BY customer_count DESC;
 
 -- Describe Customers on tenure
 SELECT CASE WHEN tenure_in_months<=12 THEN 'New Customer'
             WHEN tenure_in_months<=36 THEN 'Mid-Level Customer'
             ELSE 'Loyal Customer' END AS customer_type,gender, COUNT(customer_id) AS customer_count
 FROM telecom_churn_dataset
 GROUP BY customer_type,gender
 ORDER BY customer_type, customer_count DESC;
 
 
 
 -- CUSTOMER ACCOUNT INFORMATION

-- Display the Gender wise Payment Method Distribution
SELECT payment_method,gender, COUNT(customer_id) AS customer_count
FROM telecom_churn_dataset
GROUP BY payment_method,gender
ORDER BY payment_method,customer_count DESC;
 
-- Display the Paperless Billing Distribution
SELECT paperless_billing, COUNT(customer_id) AS customer_count
FROM telecom_churn_dataset
GROUP BY paperless_billing
ORDER BY customer_count DESC;

-- Display the Gender wise Contract Type Distribution
SELECT contract, gender, COUNT(customer_id) AS customer_count
FROM telecom_churn_dataset
GROUP BY contract, gender
ORDER BY contract, customer_count DESC;



--  CUSTOMER SERVICES DATA

-- Display the Internet Type Distribution
SELECT internet_type, COUNT(customer_id) AS customer_count
FROM telecom_churn_dataset
GROUP BY internet_type
ORDER BY customer_count DESC;

-- Display the Multiple Lines and Unlimited Data Distribution
SELECT multiple_lines, ROUND(100*COUNT(customer_id)/(SELECT COUNT(customer_id) FROM telecom_churn_dataset),2) AS customer_count
FROM telecom_churn_dataset
GROUP BY multiple_lines
ORDER BY customer_count DESC;

SELECT unlimited_data, ROUND(100*COUNT(customer_id)/(SELECT COUNT(customer_id) FROM telecom_churn_dataset),2) AS customer_count
FROM telecom_churn_dataset
GROUP BY unlimited_data
ORDER BY customer_count DESC;
