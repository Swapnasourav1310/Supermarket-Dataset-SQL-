 -- 1. Display the first 5 rows from the dataset.
 select * from supermarket limit 5;
-- 2. Display the last 5 rows from the dataset.
select * from supermarket order by  `Invoice ID`  desc limit 5;
-- 3. Display random 5 rows from the dataset.
select * from supermarket  order by rand() limit 5; 
-- 4. Display count, min, max, avg, and std values for a column in the dataset.
select count(`gross income`), avg(`gross income`),min(`gross income`),max(`gross income`),std(`gross income`) from supermarket;
-- 5. Find the number of missing values.
select count(*) from supermarket where Branch is null;
-- 6. Count the number of occurrences of each city.
select * from supermarket;
select City,count(City) from supermarket group by City;
-- 7. Find the most frequently used payment method.
select Payment,count(Payment)  from supermarket group by Payment order by count(*) desc;
-- 8. Does The Cost of Goods Sold Affect The Ratings That The Customers Provide? 
select * from supermarket;
select cogs,Rating from supermarket;
-- 9. Find the most profitable branch as per gross income.
select Branch,round(sum(`gross income`),2) as sum_gross_income from supermarket group by Branch order by sum_gross_income desc;
-- 10.  Find the most used payment method city-wise.
select * from supermarket;
select City,
   sum(case when Payment="Cash" then 1 else 0 end) as "Cash",
   sum(case when Payment="Ewallet" then 1 else 0 end) as "Ewallet",
   sum(case when Payment="Credit card" then 1 else 0 end) as "Credit card"
from supermarket group by City;
-- 11. Find the product line purchased in the highest quantity.
select `Product line`,sum(Quantity) from supermarket group by `Product line` order by sum(Quantity) desc;
-- 12. Display the daily sales by day of the week.
select * from supermarket;
update supermarket SET date = str_to_date(Date,'%m/%d/%Y');
select * from supermarket;
select dayname(date),dayofweek(date),sum(Total) from supermarket group by  dayname(date),dayofweek(date)
order by sum(Total) desc;
-- 13. Find the month with the highest sales.
select monthname(date) as name,month(date) as month,sum(Total) as total from supermarket
group by name,month order by total desc;
-- 14. Find the time at which sales are highest.
select * from supermarket;
select hour(Time) as Hour, sum(Total) as Total from supermarket group by Hour order by Total desc ;
-- 15. Which gender spends more on average?
select * from supermarket;
select Gender, avg(`gross income`) As Avg_GrossIncome from supermarket group by Gender;

