/*
=========================================================
Ticket: #005

Objetivo:
Obtener el mejor cliente de cada pais, tomando en cuenta el gasto que ha realizado
*/

WITH clientes_rankeados AS (
    SELECT
        c.Country,
        c.FirstName,
        c.LastName,
        SUM(i.Total) AS gasto_total,
        ROW_NUMBER() OVER (
            PARTITION BY c.Country
            ORDER BY SUM(i.Total) DESC
        ) AS ranking
    FROM Customer AS c
    INNER JOIN Invoice AS i
        ON c.CustomerId = i.CustomerId
    GROUP BY
        c.Country,
        c.CustomerId,
        c.FirstName,
        c.LastName
)

SELECT
    Country,
    FirstName,
    LastName,
    gasto_total
FROM clientes_rankeados
WHERE ranking = 1;



