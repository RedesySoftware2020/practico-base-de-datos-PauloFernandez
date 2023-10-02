insert into Clientes (Nombre, Direccion, Telefono) 
values ('Empresa ABC','Calle Principal 123','555-1234');

insert into Clientes (Nombre, Direccion, Telefono) 
values ('Empresa DEF','Calle Sucundaria 456','666-1234');

insert into Contactos(Id_cliente, Nombre, Correo_electronico, Telefono) 
values (1,'Juan Perez','juan@exeple.com','555-5678');

insert into Contactos(Id_cliente, Nombre, Correo_electronico, Telefono) 
values (2,'Maria Lopez','maria@exeple.com','555-9876');

insert into Actividades(Id_cliente, Tipo_Actividad, Fecha, Descripcion) 
values (1,'Lamada',GETDATE(), 'Seguimiento de ventas');