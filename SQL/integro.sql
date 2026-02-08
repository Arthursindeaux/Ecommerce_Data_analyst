CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE sales_raw (
  order_date VARCHAR(50),
  product_name VARCHAR(255),
  category VARCHAR(100),
  region VARCHAR(100),
  quantity VARCHAR(50),
  sales VARCHAR(50),
  profit VARCHAR(50)
);

SELECT *
FROM sales_raw
;

SELECT *
FROM sales_final
;

ALTER TABLE sales_final
ADD COLUMN cost DECIMAL(10,2);

UPDATE sales_final
SET cost = sales - profit;

ALTER TABLE sales_final
ADD COLUMN unit_price DECIMAL(10,2);

UPDATE sales_final
SET unit_price = sales / NULLIF(quantity,0);

ALTER TABLE sales_final
ADD COLUMN margem_percentual DECIMAL(10,2);

UPDATE sales_final
SET margem_percentual = (profit / NULLIF(sales,0)) * 100;


-- QUANTIDADES VENDIDAS POR CATEGORIA
SELECT 
    category,
    region,
    SUM(quantity) AS total_unidades
FROM sales_final
GROUP BY category, region;

-- Produtos em cada categoria

SELECT DISTINCT category, product_name
FROM sales_final
ORDER BY category, product_name
;

-- RESULTADOS ANUAIS DE 2022/2023/2024

SELECT 
    LEFT(order_date,4) AS ano,
    SUM(quantity) AS quantidade_total,
    SUM(profit) AS lucro_total
FROM sales_final
WHERE LEFT(order_date,4) IN ('2022','2023','2024')
GROUP BY LEFT(order_date,4)
ORDER BY ano;

-- RESULTADO MENSAL DE 2024

SELECT 
    LEFT(order_date,7) AS mes,
    SUM(quantity) AS quantidade,
    SUM(profit) AS lucro_total,
    SUM(sales) AS faturamento
FROM sales_final
WHERE LEFT(order_date,4) = '2024'
GROUP BY LEFT(order_date,7)
ORDER BY mes;

-- RESULTADO MENSAL DE 2023

SELECT 
    LEFT(order_date,7) AS mes,
    SUM(quantity) AS quantidade,
    SUM(profit) AS lucro_total,
    SUM(sales) AS faturamento
FROM sales_final
WHERE LEFT(order_date,4) = '2023'
GROUP BY LEFT(order_date,7)
ORDER BY mes;

-- COMPARAÇÃO DE NORTH 23 E 24

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
GROUP BY LEFT(order_date,7), region, product_name
ORDER BY lucro_total DESC;

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

-- COMPARAÇÃO MOUSE 12/24 E 12/23

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
  AND product_name = 'mouse'
GROUP BY LEFT(order_date,7), region, product_name
ORDER BY lucro_total DESC;
