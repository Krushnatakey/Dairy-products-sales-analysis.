create database milk;
use milk;
select * from dairy;

-- 1. Brand wise total Revenue earned
select brand, round(sum(Revenue),2) as revenue_yearly
from dairy
group by brand;
-- 1.1 Top three product brand wise wich earned max revenue with milk
select Product_Name,Brand, sum(Revenue) as Revenue
from dairy
group by  Product_Name,Brand
order by Revenue desc
limit 3;  -- Curd Mother Dairy, Lassi Amul, Butter Warna. 

-- 2. The average amount spent per order on curd
select Product_Name="Curd", round(sum(Price_per_Unit_sold),2) / round(count(Date),2) as avg_order_value
from dairy
group by Product_Name="Curd"
order by avg_order_value desc
limit 1;

-- 3. Total curd sold
select Product_Name= "Curd" as curd, round(sum(Quantity_Sold_liters)) as Total_curd_sold_in_LTR
from dairy
where Product_Name= "Curd"
group by curd;

-- 4. Average curd per order 
select Product_Name="Curd", sum(Price_per_Unit_sold) / sum(Date) as avg_per_order_units
from dairy
where Product_Name="Curd"
group by Product_Name="Curd";

-- 5. total orders
select Product_Name= "Curd" as curd,sum(Quantity_liters)-sum(Quantity_Sold_liters) as Total_Orders
from dairy
where Product_Name= "Curd"
group by curd;


















