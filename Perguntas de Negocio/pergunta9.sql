-- Como foram as vendas da região North em dezembro de 2024?

SELECT
    LEFT(order_date,7) AS mes,
    region,
    product_name,
    SUM(quantity) AS quantidade,
    SUM(sales) AS faturamento,
    SUM(profit) AS lucro_total,
FROM sales_final
WHERE LEFT(order_date,7) = '2024-12'
  AND region = 'North'
GROUP BY LEFT(order_date,7), region, product_name
ORDER BY lucro_total DESC;
