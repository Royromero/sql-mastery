/*
=========================================================
Objetivo:
Quiero identificar a los clientes que gastan más que el promedio de su propio país.*/

WITH gasto_por_cliente AS ( SELECT
	c.CustomerId,
	c.FirstName,
	c.LastName,
	c.Country
	SUM(i.Total) AS gasto_total
FROM Customer AS c
INNER JOIN Invoice as i
	ON c.CustomerId =i.CustomerId 	
GROUP BY c.CustomerId,
		 c.FirstName,
		 c.LastName,
		 c.Country
),

promedio_por_pais AS ( SELECT
	CustomerId,
	FirstName,
	LastName,
	Country
	AVG(gasto_total) AS avg_gasto
FROM gasto_por_cliente
GROUP BY c.CustomerId,
		 c.FirstName,
		 c.LastName,
		 c.Country
)


SELECT
	Country,
	CustomerId
	FirstName,
	LastName
FROM gasto_por_cliente as g
INNER JOIN promedio_por_pais as p
	ON g.CustomerId=p.CustomerId
WHERE gasto_total>avg_gasto	


