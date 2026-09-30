/*
row_number() 1,2,3 siempre número únicos
rank() 1,1,3 respeta empates y deja huecos
dense_rank() 1,1,2 respeta empates sin dejar huecos

partition_by -> ¿con quien? Y además, PARTITION BY es opcional. Si lo omites, SQL considera todas las filas como una sola partición.
lag() mira hacia atras
lead() mira hacia adelante


Subconsultas, una consulta dentro de otra consulta, por ejemplo
"Muestrame las facturas cuyo total sea mayor que el promedio de todas las facturas"

1.-Calcular el promedio de todas las facturas
2.-Seleccionar facturas donde
Total >8.50

SELECT *
FROM Invoice
WHERE Total > (
    SELECT AVG(Total)       subconsulta
    FROM Invoice            subconsulta
);

CTE Common Table Expression es básicamente una tabla temporal con nombre que existe durante esa consulta. Es lo que escribimos con WITH

*/

/*Obten clientes cuyo gasto total sea mayor a promedio de gasto de todos los clientes*/

WITH gasto_cliente AS (
    SELECT
        CustomerId,
        SUM(Total) AS gasto_total
    FROM Invoice
    GROUP BY CustomerId
)

SELECT *
FROM gasto_cliente
WHERE gasto_total > (
   SELECT
        CustomerId,
        AVG(Total) AS promedio total
    FROM Invoice
    GROUP BY CustomerId 
);

/*Obten clientes cuyo número de compras sea mayor que 5*, aqui intentaba hacerlo con una subconsulta, pero ojo que esta devolvia una tabla en un lugar de una lista de CustomerId*/



SELECT *
FROM Customer 
WHERE CustomerId IN(
     SELECT CustomerId,
        count(*) as compras
    FROM Invoice
    group by CustomerId 
    HAVING compras>5)

/*despues resolvi construyento una CTE (Common table expression) y después haciendo la consulta y subconsulta, logré resolverlo, sin embargo no es la forma más óptima*/


WITH tabla_temporal as (SELECT CustomerId,
        count(*) as compras
    FROM Invoice
    group by CustomerId 
    HAVING compras>5)

SELECT *
FROM Customer
WHERE CustomerId IN (
    SELECT CustomerId FROM
    tabla_temporal)

/*Una bonita forma de resolverla es solo haciendo subconsultas, OJO aqui se utilizo having count(*), y solo se utilizo para filtrar, pero en ningun momento se utilizo en el select */

SELECT *
FROM Customer
WHERE CustomerId IN (
    SELECT CustomerId
    FROM Invoice
    GROUP BY CustomerId
    HAVING COUNT(*) > 5
);

