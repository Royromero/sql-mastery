
/*
---------------------------------------------------------
Ejercicio 1

Pregunta de negocio:
¿Cuales son los 5 países que mas han gastado?
---------------------------------------------------------
*/
SELECT c.Country,
	count(c.CustomerId) as gasto_total
FROM Customer AS c
INNER JOIN Invoice as i
	ON c.CustomerId =i.CustomerId 
GROUP BY c.Country 
ORDER by gasto_total DESC
LIMIT 5;

/*
---------------------------------------------------------
Ejercicio 2

Pregunta de negocio:
¿Cuántos clientes existen por país?
---------------------------------------------------------
*/
SELECT Country,
	count(*) as num_clientes
FROM Customer AS c 
GROUP BY Country; 

/*
---------------------------------------------------------
Ejercicio 3

Pregunta de negocio:
¿Cual es el promedio de gasto por País?
---------------------------------------------------------
*/
SELECT c.Country,
	avg(i.Total) AS avg_gast
FROM Customer AS c
INNER JOIN Invoice AS i
 ON c.CustomerId = i.CustomerId 
GROUP BY c.Country;
