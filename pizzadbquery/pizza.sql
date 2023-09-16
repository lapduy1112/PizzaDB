select * from PizzaDB..pizza_sales

/* daily trend for total orders*/
select datename(dw,order_date) as order_date, count(distinct order_id) as Total_order from PizzaDB..pizza_sales
group by datename(dw,order_date)

/* monthly*/
select datename(month,order_date) as order_date, count(distinct order_id) as Total_order from PizzaDB..pizza_sales
group by datename(month,order_date)

/* percentage of pizza category */
select pizza_category,cast(sum(total_price) as decimal(10,2)) as total_revenue,sum(total_price)*100/cast((select sum(total_price) from PizzaDB..pizza_sales) as decimal(10,2)) as pct
from PizzaDB..pizza_sales
group by pizza_category

/* percentage of pizza size */
select pizza_size,cast(sum(total_price) as decimal(10,2)) as total_revenue,sum(total_price)*100/cast((select sum(total_price) from PizzaDB..pizza_sales) as decimal(10,2)) as pct
from PizzaDB..pizza_sales
group by pizza_size
order by pizza_size

/*total pizzas sold by category */

select pizza_category,count(quantity) from PizzaDB..pizza_sales
group by pizza_category

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM PizzaDB..pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

/* top 5 pizza revenue*/
select top 5 pizza_name,sum(total_price) as total_revenue
from PizzaDB..pizza_sales
group by pizza_name
order by total_revenue desc

/* top 5 pizza by quantity*/

SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM PizzaDB..pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC


/* top 5 pizza by total orders*/
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM PizzaDB..pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
