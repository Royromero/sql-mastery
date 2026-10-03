
/*Obten clientes que tengan más de 5 compras y cuyo gasto sea más de 40 dólares*/

select customerId, 
        count(InvoiceDate) as numero_compras,
        sum(Total) as gasto_total
from Invoice 
group by customerId     
having  count(InvoiceDate)>5
    and sum(Total)>40



/*Mostrar todos los clientes, incluyendo aquellos que nunca hayan comprado, junto con sus facturas cuando existan.*/

select c.customerId,
     c.FirstName,
     c.LastName,
     i.InvoiceId
from Customer as c
left join Invoice as i
    on c.customerId=i.CustomerId 



/*Queremos añadir una columna con el Total de la compra anterior del mismo cliente, sin perder ninguna factura.*/
SELECT
    CustomerId,
    InvoiceDate,
    Total,
    LAG(Total) OVER (
        PARTITION BY CustomerId
        ORDER BY InvoiceDate
    ) AS compra_anterior
FROM Invoice;

/*  Facturas que son más alta que el promedio general*/
select InvoiceId >=(
    select avg(Total)
    from Invoice   ) 
from Invoice



/*  Clientes que tienen más de una compra*/
SELECT *
FROM Customer
WHERE CustomerId IN (
    SELECT CustomerId
    FROM Invoice
);



SELECT *
FROM Customer AS c
WHERE NOT EXISTS (
    -- completa aquí
);

