-- COMPARAÇÃO TABLET 12/24 E 12/23

SELECT
    LEFT(order_date,7) AS dezembro,
    region,
    product_name,
    SUM(quantity) AS quantidade,
    SUM(profit) AS lucro_total,
    SUM(sales) AS faturamento,
    (SUM(profit) / NULLIF(SUM(sales),0)) * 100 AS margem_percentual
FROM sales_final
WHERE LEFT(order_date,7) IN ('2024-12','2023-12')
  AND region = 'North'
  AND product_name = 'Tablet'
GROUP BY LEFT(order_date,7), region, product_name
ORDER BY lucro_total DESC;