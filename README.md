# **SQL Project 1: Database Queries & Solutions**

## **Overview**
This repository contains a collection of **SQL queries** designed to solve various data-related problems. The project includes **structured questions** along with their corresponding **SQL solutions**, covering essential concepts like **data retrieval, aggregation, joins, subqueries, and performance optimization**.

---

## **Table of Contents**
- [Overview](#overview)
- [Features](#features)
- [Dataset](#dataset)
- [Getting Started](#getting-started)
- [Setup](#setup)
- [Questions & Solutions](#questions--solutions)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

---

## **Features**
- A set of **SQL challenges** with **detailed queries** and explanations.
- Covers essential topics like:
  - SELECT queries with filtering & sorting
  - Aggregate functions (SUM, AVG, COUNT)
  - JOIN operations (INNER, LEFT, RIGHT, FULL)
  - Subqueries & Common Table Expressions (CTEs)
- Easy-to-follow structure for learning and practice.

---

## **Dataset**
The project uses a sample database containing columns such as:
- **Employees** (Employee details, department, salary, etc.)
- **Orders** (Customer transactions, products, order status, etc.)
- **Products** (Product catalog with pricing and category information)

The dataset can be modified or replaced with real-world data as needed.

---

## **Getting Started**
To use this project, follow these steps:
1. Clone the repository.
2. Set up the required database (MySQL, PostgreSQL, or any preferred SQL engine).
3. Run the SQL scripts provided to create and populate tables.
4. Execute the queries to explore insights.

---

## **Setup**
1. **Install a SQL Database Management System (DBMS)** 
2. **Load the dataset**
   ```sql
   CREATE DATABASE sql_project;
   USE sql_project;
   ```
3. **Execute the provided SQL script to create tables**
   ```sql
   SOURCE SQL_Project_1.sql;
   ```

---

## **Questions & Solutions**

### **Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'**
#### **Solution:**
```sql
SELECT * FROM retail_sales
WHERE date(sale_date) = "2022-11-05";
```

### **Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022**
#### **Solution:**
```sql
SELECT COUNT(*) FROM retail_sales
WHERE category = "Clothing" AND sale_date = "2022-11-05"
AND quantity >= 10;
```

### **Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.**
#### **Solution:**
```sql
SELECT category, SUM(total_sale)
FROM retail_sales
GROUP BY category;
```

### **Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.**
#### **Solution:**
```sql
SELECT ROUND(AVG(age),1)
FROM retail_sales
WHERE category = "Beauty";
```

### **Q.5 Write a SQL query to find the top 5 highest-selling products based on total sales.**
#### **Solution:**
```sql
SELECT product_name, SUM(total_sale) AS total_revenue
FROM retail_sales
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 5;
```

### **Q.6 Write a SQL query to count the number of unique customers who made a purchase in the last 6 months.**
#### **Solution:**
```sql
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
WHERE sale_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);
```

### **Q.7 Write a SQL query to retrieve the total sales per month for the year 2023.**
#### **Solution:**
```sql
SELECT EXTRACT(MONTH FROM sale_date) AS month, SUM(total_sale) AS monthly_sales
FROM retail_sales
WHERE EXTRACT(YEAR FROM sale_date) = 2023
GROUP BY month
ORDER BY month;
```

### **Q.8 Write a SQL query to find customers who have placed more than 3 orders.**
#### **Solution:**
```sql
SELECT customer_id, COUNT(order_id) AS order_count
FROM retail_sales
GROUP BY customer_id
HAVING order_count > 3;
```

### **Q.9 Write a SQL query to calculate the percentage contribution of each product category to total sales.**
#### **Solution:**
```sql
SELECT category, 
       (SUM(total_sale) / (SELECT SUM(total_sale) FROM retail_sales)) * 100 AS percentage_contribution
FROM retail_sales
GROUP BY category;
```

### **Q.10 Write a SQL query to list employees who have been working for more than 5 years, sorted by tenure.**
#### **Solution:**
```sql
SELECT employee_id, name, DATEDIFF(CURDATE(), hire_date) / 365 AS tenure_years
FROM employees
WHERE DATEDIFF(CURDATE(), hire_date) > 5 * 365
ORDER BY tenure_years DESC;
```

---

## **Usage**
- Modify queries to fit your dataset and explore insights.
- Extend the project by adding new **questions** and **SQL techniques**.
- Optimize query performance using indexing and tuning strategies.

---

## **Contributing**
Contributions are welcome! Fork this repository and submit pull requests for **new SQL queries, improvements, or optimizations**.

---

## **License**
This project is licensed under the **MIT License** – see the LICENSE file for details.

For any questions or support, please contact **Daniyal Azmi]**. 🚀

