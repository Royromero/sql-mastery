/*
=========================================================
Ticket: #001

Objetivo:
Obtener los 10 clientes con mayor gasto histórico.

Preguntas:

1. ¿Qué debo mostrar? Clientes, Gasto
2. ¿En qué tabla vive esa información? Clientes, pedidos
3. ¿Qué relación existe? estan relacionador por el customerid
4. ¿Qué estrategia seguiré? primero seleciono las columnas que necesito, despues las tablas que necesito, como se relacionan entre si, los agrupo por cliente, los ordeno en orden descendiente por 
el campo gasto y los limito a 10

=========================================================
*/

SELECT c.CustomerId,
       c.FirstName,
       c.LastName,
       SUM(i.Total) AS gasto_total
FROM Customer AS c
INNER JOIN Invoice AS i
	ON c.CustomerId =i.CustomerId 
GROUP BY 
	c.CustomerId,
	c.FirstName, 
	c.LastName
ORDER BY gasto_total ASC 
LIMIT 10   

/*

Elegi inner join, porque me conviene quedarme con los clientes que tiene al menos un pedido,
agrupe customerid, firstname y lastname para que se sumaran los gastos por cliente,
use sum para ver cuanto ha gastado el cliente durante toda la historia,
si podria existir otra solución, por ejemplo usar left join, pero creo que podría ser un poco más lento, al tener la posibilidad de tener más información, cuando al final de cuentas 
al resolver la pregunta de negocio la vamos a filtrar.
*/
