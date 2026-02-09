-- Qual foi o resultado dos últimos anos?

SELECT 
    LEFT(order_date,4) AS ano,
    SUM(quantity) AS quantidade_total,
    SUM(profit) AS lucro_total
FROM sales_final
WHERE LEFT(order_date,4) IN ('2022','2023','2024')
GROUP BY LEFT(order_date,4)
ORDER BY ano;