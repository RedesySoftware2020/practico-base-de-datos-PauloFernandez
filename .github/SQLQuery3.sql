select c.Nombre AS Clientes, co.Nombre AS Contactos
From Clientes c
join Contactos co on c.IdCliente = co.Id_cliente;

select * from Actividades;