-- Qual é o resultado por região em 2024?

SELECT
    region,
    SUM(quantity) AS total_unidades
    SUM(profit) AS Lucro_total,
FROM sales_final
WHERE LEFT(order_date,4) = '2024'
GROUP BY region
ORDER BY total_unidades DESC;