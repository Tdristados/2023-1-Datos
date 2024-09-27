create table tipo_juridico (
	codigo int primary key,
	nombre varchar(20) not null
);

create table clase (
	codigo int primary key,
	nombre varchar(20) not null
);

create table tipo_domicilio (
	codigo int primary key,
	nombre varchar(20) not null
);

create table estado_empresa (
	codigo int primary key,
	nombre varchar(20) not null
);

create table ciiu (
	codigo int primary key,
	descripcion varchar(100) not NULL
);

create table ciudad (
	codigo int primary key,
	nombre varchar(30)
);

create table tamano_empresa (
	codigo int primary key,
	nombre varchar(15)
);

create table empresa (
	nit int primary key,
	tipo_identificacion varchar(3) not null,
	razon_social varchar(30) not null,
	num_empleados int not null,
	valor_activos decimal(15,2) not null,
	codigo_tamano_empresa int,
	codigo_tipo_juridico int,
	codigo_clase int not null,
	codigo_tipo_domicilio int,
	codigo_estado_empresa int,
	codigo_ciudad int,
	foreign key (codigo_tamano_empresa) REFERENCES tamano_empresa(codigo),
	foreign key (codigo_tipo_juridico) REFERENCES tipo_juridico(codigo),
	foreign key (codigo_clase) REFERENCES clase(codigo),
	foreign key (codigo_tipo_domicilio) REFERENCES tipo_domicilio(codigo),
	foreign key (codigo_estado_empresa) REFERENCES estado_empresa(codigo),
	foreign key (codigo_ciudad) REFERENCES ciudad(codigo)
);

create table contacto (
	nit_empresa int,
	telefono int,
	correo varchar(30),
	foreign key (nit_empresa) REFERENCES empresa(nit)
);

create table ciiu_empresa (
	codigo_ciiu int primary key,
	nit_empresa int not null,
	foreign key (codigo_ciiu) REFERENCES ciiu(codigo),
	foreign key (nit_empresa) REFERENCES empresa(nit)
);

create table matricula (
	codigo int primary key,
	fecha_matricula date not null,
	fecha_revovacion date not null,
	nit_empresa int not null,
	foreign key (nit_empresa) REFERENCES empresa(nit)
);
