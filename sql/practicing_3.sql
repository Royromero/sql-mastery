/*
Aqui voy a poner algunos queries que se me hicieron interesantes del curso de bigquery para la cerificacion de data enginner en gcp*/


/*Este query sirve par ver la calidad de los datos, identifica cuantos skus hay por cada nombre de producto
crea una columna don estan los skus que tiene cada nombre de producto separados por coma*/

SELECT
  v2ProductName,
  COUNT(DISTINCT productSKU) AS SKU_count,
  STRING_AGG(DISTINCT productSKU LIMIT 5) AS SKU
FROM `data-to-insights.ecommerce.all_sessions_raw`
  WHERE productSKU IS NOT NULL
  GROUP BY v2ProductName
  HAVING SKU_count > 1
  ORDER BY SKU_count DESC


/*Ahora de forma distinta en este query vemos cuando nombre de producto hay por cada sku, los colocamos en una columna con los nombres separados por coma.*/

SELECT
  productSKU,
  COUNT(DISTINCT v2ProductName) AS product_count,
  string_AGG(DISTINCT v2ProductName LIMIT 5) AS product_name --array_agg (con este instrucción se crea un nested array values, asi es más fácil ver los nombre asociados)
FROM `data-to-insights.ecommerce.all_sessions_raw`
  WHERE v2ProductName IS NOT NULL
  GROUP BY productSKU
  HAVING product_count > 1
  ORDER BY product_count DESC

/*Considero que esta es una buena forma de ver cuantos registros quedan despues de hacer un join y verificar que las llaves si hagan correspondencia*/
--standardSQL
-- pull ID fields from both tables
SELECT DISTINCT
website.productSKU AS website_SKU,
inventory.SKU AS inventory_SKU
FROM `data-to-insights.ecommerce.all_sessions_raw` AS website
JOIN `data-to-insights.ecommerce.products` AS inventory
ON website.productSKU = inventory.SKU



/*A través de este query es posible identificar todos los id que no hacen match, ya se de la tabla 1 o de la tabla 2*/
#standardSQL
SELECT DISTINCT
website.productSKU AS website_SKU,
inventory.SKU AS inventory_SKU
FROM `data-to-insights.ecommerce.all_sessions_raw` AS website
FULL JOIN `data-to-insights.ecommerce.products` AS inventory
ON website.productSKU = inventory.SKU
WHERE website.productSKU IS NULL OR inventory.SKU IS NULL