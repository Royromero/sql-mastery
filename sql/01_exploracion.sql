SELECT c.Country,
	count(c.CustomerId) as gasto_total
FROM Customer AS c
INNER JOIN Invoice as i
	ON c.CustomerId =i.CustomerId 
GROUP BY c.Country 
ORDER by gasto_total DESC
LIMIT 5;


SELECT Country,
	count(CustomerId) as num_clientes
FROM Customer AS c 
GROUP BY Country; 


SELECT c.Country,
	avg(i.Total) AS avg_gast
FROM Customer AS c
INNER JOIN Invoice AS i
 ON c.CustomerId = i.CustomerId 
GROUP BY c.Country;
