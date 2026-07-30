SELECT * FROM sales;
SELECT COUNT(*) AS Total_Records FROM sales;
SELECT SUM(Sales) as Total_Sales FROM sales;
SELECT AVG(Sales) AS Average_Sales FROM sales;
SELECT MAX(Sales) AS Top_Sales FROM sales;
SELECT MIN(Sales) AS Lowest_Sale FROM sales;
SELECT DISTINCT Category FROM sales;
SELECT *  FROM sales
WHERE Sales > 1000;
SELECT * FROM sales
ORDER BY Sales DESC;
SELECT SUM(Sales) AS Total_Sales, Category FROM sales
GROUP BY Category;
SELECT SUM(Profit) AS Total_Profit, Category FROM sales
GROUP BY Category;
SELECT AVG(Sales) AS Average_Sales, Region FROM sales
GROUP BY Region;
SELECT  State, COUNT(*) as Total_Transactions FROM sales
GROUP BY State
ORDER BY Total_Transactions DESC;
SELECT Region, SUM(Sales) AS Total_Sales FROM sales
GROUP BY Region;
SELECT SUM(Profit) AS Total_Profit, Region FROM sales
GROUP BY Region
ORDER BY Total_Profit DESC;
SELECT SUM(Quantity) as Total_Quantity, Category FROM sales
GROUP BY Category;
SELECT AVG(Discount) AS Average_Discount, Category FROM sales
GROUP BY Category;
SELECT * FROM sales
ORDER BY Sales DESC
LIMIT 10;
SELECT * FROM sales
ORDER BY Profit DESC
LIMIT 10;
SELECT State, SUM(Sales) AS Total_Sales FROM sales
GROUP BY State;
SELECT Category, SUM(Sales) FROM sales
GROUP BY Category
HAVING SUM(Sales) > 500000;
SELECT SUM(Profit), State FROM sales
GROUP BY State
HAVING SUM(Profit) > 10000;
SELECT Category, AVG(Discount) FROM sales
GROUP BY Category
HAVING AVG(Discount) > 0.1;
SELECT * FROM sales
HAVING Profit < 0
ORDER BY Profit DESC;
SELECT * FROM sales
WHERE Category = "Technology" AND Sales > 500;
SELECT * FROM sales
WHERE Category = "Furniture" and Discount > 0;
SELECT Sales from sales
WHERE Sales BETWEEN 100 AND 500
ORDER BY Sales DESC;
SELECT DISTINCT State FROM sales
WHERE State LIKE 'C%';
SELECT Category, COUNT(*) AS Total_Transaction FROM sales
GROUP BY Category
HAVING COUNT(*) > 1000;
SELECT Region, AVG(Profit) FROM sales
GROUP BY Region
HAVING AVG(Profit) > 0;
SELECT Category, Total_Sales 
FROM (
     SELECT Category, 
            SUM(Sales) AS Total_Sales
	 FROM sales 
     GROUP BY Category 
) AS Category_sales
ORDER BY Total_Sales desc 
LIMIT 1;
SELECT State, SUM(Sales) AS Total_Sales FROM sales
    GROUP BY State
    HAVING Total_Sales > 
    (SELECT AVG(Sales) FROM sales)
ORDER BY Total_Sales DESC;
SELECT Category, SUM(Sales) AS Total_Sales,
RANK() OVER (ORDER BY SUM(Sales) DESC) AS Sales_Rank
FROM sales
GROUP BY Category;
SELECT Region, SUM(Profit) AS Total_Profit,
RANK() OVER (ORDER BY SUM(Profit) desc) AS Profit_Rank
FROM sales
GROUP BY Region;
SELECT Category, SUM(Profit) AS Total_Profit,
DENSE_RANK() OVER (ORDER BY SUM(Profit) DESC) AS Profit_Rank
FROM sales
GROUP BY Category;
SELECT State, SUM(Sales) AS Total_Sales,
ROW_NUMBER() OVER (ORDER BY SUM(Sales) DESC) AS Row_Num
FROM sales
GROUP BY State;
SELECT State, SUM(Sales) AS Total_Sales FROM sales
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 3;
SELECT Category, SUM(Sales) AS Total_Sales,
ROUND((SUM(Sales) / (SELECT SUM(Sales) FROM sales)) * 100, 2) AS Sales_Percentage
FROM sales
GROUP BY Category;
SELECT Region, SUM(Profit) AS Total_Profit,
ROUND((SUM(Profit) / (SELECT SUM(Profit) FROM sales)) * 100, 2) AS Profit_Percentage
FROM sales
GROUP BY Region;
SELECT Region, Category, SUM(Sales) AS Total_Sales FROM sales
GROUP BY Region, Category
ORDER BY Region, Total_Sales DESC;
CREATE VIEW Category_Sales AS SELECT Category, SUM(Sales) AS Total_Sales FROM sales
GROUP BY Category;
WITH Category_Profit AS (SELECT Category, SUM(Profit) AS Total_profit FROM sales
GROUP BY Category)
SELECT * FROM Category_Profit
ORDER BY Total_Profit DESC;
WITH Category_Profit AS ( SELECT Category, SUM(Profit) AS Total_Profit FROM sales
GROUP BY Category)
SELECT * FROM Category_Profit
WHERE Total_Profit > (SELECT AVG(Total_Profit) FROM Category_Profit);
SELECT State, SUM(Sales) AS Total_Sales,
RANK() OVER (ORDER BY SUM(Sales) DESC) AS Sales_Rank
FROM sales
GROUP BY State;
SELECT State, SUM(Profit) AS Total_Profit FROM sales
GROUP BY State
ORDER BY SUM(Profit) DESC
LIMIT 5;
SELECT City, SUM(Sales) AS Total_Sales FROM sales
GROUP BY City
ORDER BY SUM(Sales) DESC
LIMIT 5;
SELECT `Sub-Category`, SUM(Profit) AS Total_Profit FROM sales
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC
LIMIT 5;
SELECT `Ship Mode`, AVG(Profit) AS Average_Profit FROM sales
GROUP BY `Ship Mode`
ORDER BY AVG(Profit) DESC;
SELECT Segment, SUM(Sales), SUM(Profit) FROM sales
GROUP BY Segment;
SELECT Category, ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Percentage FROM sales
GROUP BY Category
ORDER BY Profit_Margin_Percentage DESC;
WITH subcategory_sales AS ( SELECT Category, `Sub-Category`, SUM(Sales) AS Total_Sales,
ROW_NUMBER() OVER (PARTITION BY Category
ORDER BY SUM(Sales) DESC) AS rn FROM sales
GROUP BY Category, `Sub-Category`)
SELECT Category, `Sub-Category`, Total_Sales 
FROM subcategory_sales 
WHERE RN = 1;






   












