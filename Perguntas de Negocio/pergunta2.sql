-- Quais são os produtos vendidos por categoria?

SELECT DISTINCT 
    category,
    product_name
FROM sales_final
ORDER BY category, product_name;