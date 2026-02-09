-- Qual é o resultado por região em 2024?

SELECT
    region,
    SUM(quantity) AS quantidade_total,
    SUM(sales) AS faturamento_total,
    SUM(profit) AS lucro_total,
FROM sales_final
WHERE LEFT(order_date,4) = '2024'
GROUP BY region
ORDER BY lucro_total DESC;