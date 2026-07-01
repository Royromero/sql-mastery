/*
=========================================================
Ticket: #002

Objetivo:
Obtener los 10 países con mayor ingreso histórico.

Preguntas:

1. ¿Qué debo mostrar? paises, Gasto
2. ¿En qué tabla vive esa información? Clientes, pedidos
3. ¿Qué relación existe? estan relacionador por el customerid
4. ¿Qué estrategia seguiré? primero seleciono las columnas que necesito, despues las tablas que necesito, como se relacionan entre si, los agrupo por pais, los ordeno en orden descendiente por 
el campo gasto y los limito a 10

=========================================================
*/

SELECT c.Country,
       SUM(i.Total) AS gasto_total
FROM Customer AS c
INNER JOIN Invoice AS i
	ON c.CustomerId =i.CustomerId 
GROUP BY 
	c.Country
ORDER BY gasto_total DESC 
LIMIT 10;   

/*

Elegi inner join, porque me conviene quedarme con los clientes que tiene al menos un pedido,
agrupe Country para que se sumaran los gastos por pais,
use sum para ver cuanto ha gastado el pais durante toda la historia,
si podria existir otra solución, por ejemplo usar left join, pero solo necesitamos la información que tome en cuenta los clients que tiene pedidos.
*/


