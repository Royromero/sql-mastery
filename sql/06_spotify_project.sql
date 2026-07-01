/*
=========================================================
Objetivo:
Quiero saber cuáles son nuestros clientes más valiosos, pero únicamente aquellos que han realizado más de una compra*/

SELECT
	c.CustomerId,
	c.FirstName,
	c.LastName,
	COUNT(i.InvoiceId) AS num_compras,
	SUM(i.Total) AS gasto_total
FROM Customer AS c
INNER JOIN Invoice as i
	ON c.CustomerId =i.CustomerId 	
GROUP BY c.CustomerId,
	c.FirstName,
	c.LastName
HAVING num_compras>1	
ORDER BY gasto_total DESC,
		num_compras DESC;


