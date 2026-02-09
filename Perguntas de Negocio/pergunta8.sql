-- Qual foi o desempenho por região em dezembro de 2023?

SELECT
    LEFT(order_date,7) AS mes,
    region,
    SUM(quantity) AS quantidade,
    SUM(sales) AS faturamento,
    SUM(profit) AS lucro_total,
FROM sales_final
WHERE LEFT(order_date,7) = '2023-12'
GROUP BY LEFT(order_date,7), region
ORDER BY lucro_total DESC;
