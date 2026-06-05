create database ejemplo_n2;
use ejemplo_n2;

create table roles_usu
(
fkpk_rol varchar(20) not null,
fkpk_tdoc varchar(10) not null,
fkpk_id_usu int(25) not null,
primary key (fkpk_rol, fkpk_tdoc, fkpk_id_usu)
);

create table usuario
(
t_doc varchar(10) not null,
n_doc_usu int(25) not null,
p_nombre varchar(25) not null,
s_nombre varchar(25) null,
p_apellido varchar(25) not null,
fk_rh int not null,
primary key (t_doc, n_doc_usu)
);

create table tipo_documento
(
t_documento varchar(10) not null primary key,
desc_tdociumento varchar(25) not null,
estado boolean not null
);

create table roles
(
rol varchar(20) not null primary key,
estado_rol boolean not null
);

create table rh
(
cod_rh int not null auto_increment,
tipo_rh varchar(10) not null,
estado boolean not null,
primary key (cod_rh)
);

alter table usuario
add foreign key (t_doc)
references tipo_documento (t_documento);

alter table usuario
add foreign key (fk_rh)
references rh (cod_rh);

alter table roles_usu
add foreign key (fkpk_rol)
references roles (rol);

alter table roles_usu
add foreign key (fkpk_tdoc, fkpk_id_usu)
references usuario (t_doc, n_doc_usu);