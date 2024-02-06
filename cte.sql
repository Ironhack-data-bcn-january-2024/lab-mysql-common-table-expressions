USE northwind;

-- 1.

WITH PriceAboveFifty AS (
SELECT ProductName, Unit
FROM products
WHERE price > 50)
SELECT ProductName, Unit
FROM PriceAboveFifty;

-- 2.

with aliased_table as
(select * from products
order by price desc)
select ProductID, ProductName
from aliased_table
limit 5;

-- 3. 

WITH aliased_table AS (
SELECT CategoryName, COUNT(ProductID) AS ProductCount
FROM products
JOIN categories
ON products.CategoryID = categories.CategoryID
GROUP BY CategoryName
ORDER BY COUNT(ProductID) DESC
)
SELECT CategoryName, ProductCount
FROM aliased_table
LIMIT 5;

-- 4. 

WITH alias_table AS (
SELECT CategoryName, AVG(Quantity) AS AvgOrderQuantity
FROM categories
JOIN products
ON categories.CategoryID = products.CategoryID
JOIN orderdetails
ON products.ProductID = orderdetails.ProductID
GROUP BY CategoryName
ORDER BY AvgOrderQuantity DESC
)
SELECT CategoryName, AvgOrderQuantity
FROM alias_table;

-- 5. 

WITH average_amount_table AS (
SELECT customers.CustomerID, CustomerName, SUM(Quantity) AS OrderAmount
FROM customers
JOIN orders
ON customers.CustomerID = orders.CustomerID
JOIN orderdetails
ON orders.OrderID = orderdetails.OrderID
GROUP BY CustomerID
ORDER BY OrderAmount DESC
)
SELECT CustomerID, CustomerName, AVG(OrderAmount) AS AvgOrderAmount
FROM average_amount_table;


WITH average_amount_table AS (
 SELECT customers.CustomerID, CustomerName, SUM(Quantity) AS OrderAmount
 FROM customers
 JOIN orders
 ON customers.CustomerID = orders.CustomerID
 JOIN orderdetails
 ON orders.OrderID = orderdetails.OrderID
 GROUP BY customers.CustomerID
 ORDER BY OrderAmount DESC
 )
 SELECT CustomerID, CustomerName, AVG(OrderAmount) AS AvgOrderAmount
 FROM average_amount_table;
