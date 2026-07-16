/* Ahora utilizamos una subconsulta con IN.
   IN permite filtrar registros comparando un valor contra el resultado
   de otra consulta. En ciertos escenarios, puede reemplazar un JOIN,
   aunque cada uno tiene casos de uso diferentes. */



SELECT c.customerId,
       c.FirstName,
       count(i.InvoiceId) as num_pedidos
FROM Customer as c
INNER JOIN Invoice as i 
	ON c.CustomerId = i.CustomerId 
GROUP BY c.CustomerId;



SELECT *
FROM Customer AS c
WHERE c.CustomerId IN (
    SELECT DISTINCT i.CustomerId
    FROM Invoice AS i
);


