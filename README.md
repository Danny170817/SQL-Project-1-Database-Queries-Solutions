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

### **Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.**
#### **Solution:**
```sql
select count(*) as row_count
from retail_sales
where total_sale>1000;
```

### **Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.**
#### **Solution:**
```sql
select count(*),gender,category
from retail_sales
group by category,gender
order by count(*) ASC;  
```

### **Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year**
#### **Solution:**
```sql
SELECT 
    EXTRACT(YEAR FROM sale_date) AS sale_year,
    EXTRACT(MONTH FROM sale_date) AS sale_month,
    AVG(total_sale) as avg_sales,
    rank() over(partition by extract(year from sale_date)order by avg(total_sale)desc) as rank_order
FROM retail_sales
GROUP BY 1,2
ORDER BY sale_year, 3 Desc;
```

### **Q.8 Write a SQL query to find the top 5 customers based on the highest total sales **
#### **Solution:**
```sql
select customer_id,sum(total_sale)
from retail_sales
group by 1 
order by 2 desc
limit 5;

```

### **Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.**
#### **Solution:**
```sql
select category,count(distinct customer_id)
from retail_sales
group by 1;
```

### **Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)**
#### **Solution:**
```sql
with hourly_sale
as
(
select* ,
	case
	when extract(hour from sale_time)<12 then "Morning"
        when extract(hour from sale_time)between 12 and 17 then "Afternoon"
        else "Evening"
	End as shift
from retail_sales)
select count(*),shift
from hourly_sale
group by shift;
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

For any questions or support, please contact **Daniyal Azmi**. 🚀

