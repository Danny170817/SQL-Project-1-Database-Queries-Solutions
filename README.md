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
  - Window functions & ranking
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
1. **Install a SQL Database Management System (DBMS)** (MySQL, PostgreSQL, SQL Server, etc.)
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
### **Question 1: Retrieve the top 5 highest-paid employees**
#### **Solution:**
```sql
SELECT employee_id, name, salary
FROM Employees
ORDER BY salary DESC
LIMIT 5;
```

### **Question 2: Find total sales per product category**
#### **Solution:**
```sql
SELECT p.category, SUM(o.total_price) AS total_sales
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
GROUP BY p.category;
```

*(More questions and solutions are included in the SQL file)*

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

