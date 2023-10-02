use Practico1;

create table Clientes(
	IdCliente int primary key identity,
	Nombre varchar(50) not null,
	Direccion varchar(50) not null,
	Telefono varchar(50) not null
);

create table Contactos(
	IdContacto int primary key identity,
	Id_cliente int,
	Nombre varchar(50) not null,
	Correo_electronico varchar(50) not null,
	Telefono varchar(50) not null
	foreign key (Id_cliente) references Clientes(IdCliente) 
);

create table Actividades(
	IdActividades int primary key identity,
	Id_cliente int,
	Tipo_Actividad varchar(50) not null,
	Fecha date,
	Descripcion text,
	foreign key (Id_cliente) references Clientes(IdCliente) 
);