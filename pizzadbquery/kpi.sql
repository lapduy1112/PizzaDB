select * from pizza_sales

select sum(total_price) as Total_revenue from pizza_sales

select sum(total_price)/count(distinct order_id) as Avg_order_Value from pizza_sales

select sum(quantity) as Total_pizzas_sold from pizza_sales

select count(distinct order_id) as Total_ordered from pizza_sales

select cast(cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Avg_Pizzas_per_order
from pizza_sales



