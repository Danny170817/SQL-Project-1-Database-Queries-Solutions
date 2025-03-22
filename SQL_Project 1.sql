create database sql_project1;
create table retail_sales(
transactions_id	int primary key,
sale_date date,
sale_time time,
customer_id	int,
gender	varchar(15),
age	int,
category varchar(15),
quantiy	int,
price_per_unit	float,
cogs	float,
total_sale float
);
select * from retail_sales
where(
		quantiy is null
        or
        price_per_unit is null
        or
        cogs="null"
	);
        
SET SQL_SAFE_UPDATES = 0;

DELETE FROM retail_sales
WHERE quantiy IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL;

SET SQL_SAFE_UPDATES = 1;
select count(*)
from retail_sales;

select count(distinct customer_id) as total_sale from retail_sales;
select distinct category from retail_sales;

-- Main questions and ans 
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

select* from retail_sales
where date(sale_date)="2022-11-05";

------------------------------------------------
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022

select count( *) from retail_sales
where category="Clothing" and sale_date="2022-11-05"
and quantiy>=4;
---------------------------------------------
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

select category,sum(total_sale)
from retail_sales
group by category;

-----------------------------------
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

select round(avg(age),1)
from retail_sales
where category="Beauty";
----------------------------
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

select count(*) as row_count
from retail_sales
where total_sale>1000;
----------------------------------
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

select count(*),gender,category
from retail_sales
group by category,gender
order by count(*) ASC;

--------------------
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

SELECT 
    EXTRACT(YEAR FROM sale_date) AS sale_year,
    EXTRACT(MONTH FROM sale_date) AS sale_month,
    AVG(total_sale) as avg_sales,
    rank() over(partition by extract(year from sale_date)order by avg(total_sale)desc) as rank_order
FROM retail_sales
GROUP BY 1,2
ORDER BY sale_year, 3 Desc;
-----------------------------------------
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

select customer_id,sum(total_sale)
from retail_sales
group by 1 
order by 2 desc
limit 5;
-----------------------------
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

select category,count(distinct customer_id)
from retail_sales
group by 1;
-----------------------
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
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

--------------------
