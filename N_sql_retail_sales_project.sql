-- data set: https://github.com/najirh/Retail-Sales-Analysis-SQL-Project--P1

select * from retail_sales_analysis;

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
 select * from retail_sales_analysis
 where sale_date = '2022-11-05' ;
 
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022

select * from retail_sales_analysis
where category = 'Clothing' and  month(sale_date) = 11 
and   quantiy>=4 and year(sale_date)= 2022;
 
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

select category, sum(total_sale) as Tota_sales from retail_sales_analysis
group by 1;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select category,avg(age) as AVG_Age from retail_sales_analysis
where category = 'Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

select * from retail_sales_analysis
where total_sale> 1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select gender, category, count(*) as Total_transaction from retail_sales_analysis
group by 1 ,2;


-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
select month(sale_date) as month, avg(total_sale) as Average_Sales 
from retail_sales_analysis
group by 1
order by 1;

select month(sale_date) as month, year(sale_date) as year, avg(total_sale) as Average_Sales 
from retail_sales_analysis
group by 1 ,2
order by 1, 2
desc limit 3 ;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

select customer_id as Prime_customer from retail_sales_analysis
order by total_sale desc limit 5;


-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

select count(distinct customer_id) as Unique_customer_ID, category 
from retail_sales_analysis
group by 2;


-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)

select count(*) as Total_orders,
case
	when hour(sale_time)<12 then 'Moring Orders'
    when hour( sale_time) between 12 and 17 then 'Afternoon orders'
    else 'evening order'
    end as Shift
from retail_sales_analysis group by shift;