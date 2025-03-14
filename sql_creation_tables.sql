create database if not exists `gestion_planeamiento`;

use `gestion_planeamiento`;



create table if not exists tb_roles(
	role_id int not null auto_increment, 
	nombre_rol varchar(50) not null unique, 
	primary key(role_id)
) engine = innodb;


create table if not exists tb_permisos(
	id_permiso int not null auto_increment primary key, 
	nombre_permiso varchar(50) not null unique, 
	descripcion_permiso text
)engine = innodb;


create table if not exists tb_usuarios(
	
  id_user int not null auto_increment primary key, 
  nombre varchar(50) not null, 
  apellido varchar(50) not null, 
  correo varchar(50) not null, 
  password text not null,
  id_rol_fk int, 
  constraint role_fk_constraint foreign key(id_rol_fk) references tb_roles (role_id) on delete set null
) engine = innodb;


create table if not exists tb_permiso_roles(
   id_permiso_rol int not null auto_increment primary key , 
   id_permiso_fk int not null, 
   id_role_fk int not null, 
   
   foreign key(id_permiso_fk) references tb_permisos(id_permiso), 
   foreign key(id_role_fk) references tb_roles(role_id)
)engine = innodb ;

create table if not exists tb_seccion(
	id_seccion int not null auto_increment primary key, 
	nombre_seccion varchar(50)
) engine = innodb;

create table if not exists tb_grado(

	id_grado int not null auto_increment primary key, 
	nombre_grado varchar(50) not null

) engine = innodb;

create table if not exists tb_grado_seccion(
	id_grado_seccion int not null auto_increment primary key, 
	id_grado_fk int not null, 
	id_seccion_fk int not null, 
	
	foreign key(id_grado_fk) references tb_grado(id_grado), 
	foreign key(id_seccion_fk) references tb_seccion(id_seccion )

) engine = innodb;

create table if not exists tb_materia(
	id_materia int not null auto_increment primary key, 
	nombre_materia varchar(50) 
) engine = innodb;


create table if not exists tb_horario(

	id_horario int not null auto_increment primary key, 
	materia_id int not null,
	user_id int not null, 
	grado_seccion_id int not null, 
	dia enum("lunes", "martes", "miercoles", "jueves", "viernes"),
	turno enum("mañana", "tarde", "nocturno"), 
	horario_fin time not null, 
	horario_inicio time not null,
	foreign key(materia_id) references tb_materia(id_materia), 
	foreign key(user_id) references tb_usuarios(id_user), 
	foreign key(grado_seccion_id) references tb_grado_seccion (id_grado_seccion)
);

create table if not exists tb_planeamiento_contenido(
 id_contenido int not null auto_increment primary key,
 informacion text 
);


create table if not exists tb_planeamiento(

	id_planeamiento int not null auto_increment primary key, 
	id_user int not null, 
	grado_seccion_id int not null, 
	materia_id int not null, 
	contenido_id int not null, 	
	foreign key(id_user) references tb_usuarios(id_user), 
	foreign key(grado_seccion_id) references tb_grado_seccion(id_grado_seccion), 
	foreign key(materia_id) references tb_materia (id_materia), 
	foreign key(contenido_id) references tb_planeamiento_contenido (id_contenido)

);

create table if not exists tb_planeamiento_comentario(

  id_planeamiento_comentario int not null auto_increment primary key, 
  
  comentario text , 
  
  id_user_fk int not null, 
  
  id_planeamiento_fk int not null,
  
  foreign key(id_user_fk) references tb_usuarios(id_user), 
  foreign key(id_planeamiento_fk) references tb_planeamiento (id_planeamiento)

);



































