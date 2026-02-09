-- Qual foi o desempenho mensal em 2024?

SELECT 
    LEFT(order_date,7) AS mes,
    SUM(quantity) AS quantidade,
    SUM(profit) AS lucro_total,
    SUM(sales) AS faturamento
FROM sales_final
WHERE LEFT(order_date,4) = '2024'
GROUP BY LEFT(order_date,7)
ORDER BY mes;