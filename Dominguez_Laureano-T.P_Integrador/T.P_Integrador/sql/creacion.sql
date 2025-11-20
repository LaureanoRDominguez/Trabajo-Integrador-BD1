-- =====================================================================
--               Base de datos "Casino".
-- =====================================================================
--
-- Modelo Relacional de la base de datos:
-- ROLES (*id_rol, nombre_rol, permisos)
-- USUARIOS (*id_usuario, DNI, nombre, apellido, email, fecha_registro)
-- CATEGORIAS (*id_categoria, nombre_categoria, beneficios)
-- PROMOCIONES (*id_promocion, nombre_promocion, descripcion, fecha_inicio, fecha_final)
-- EVENTOS (*id_evento, nombre_evento, fecha_hora, lugar, capacidad)
-- AREAS (*id_area, nombre_area)
-- CUENTAS (*id_cuenta, usuario, password, tipo_cuenta, estado, id_rol, id_usuario)
-- CLIENTES (*id_usuario, datos_biometricos, puntos, id_categoria)
-- EMPLEADOS (*id_usuario, id_area)
-- NOTIFICACIONES (*id_notificacion, mensaje, tipo, fecha_hora_envio, id_usuario)
-- MAQUINAS (*id_maquina, modelo, ubicacion, estado, id_area)
-- ACCESOS (*id_punto_acceso, nombre, tipo, id_area)
-- RESERVAS (*id_reserva, fecha_hora_reserva, tipo_reserva, estado, id_usuario)
-- LOGS (*id_log, fecha_hora_acceso, terminal, ip, id_usuario)
-- INCIDENTES (*id_incidente, descripcion, fecha_hora, id_usuario, id_area)
-- Otorga (*id_categoria, id_promocion)
-- Corresponde (*id_reserva, id_evento)
-- PUNTOS (*id_usuario, *fecha_hora, cantidad_puntos, motivo)
-- VISITAS (*id_usuario, *fecha_hora_entrada, fecha_hora_salida, id_punto_acceso)
--
-- =====================================================================

CREATE TABLE ROLES (
    id_rol INT PRIMARY KEY NOT NULL,
    nombre_rol VARCHAR(50) NOT NULL,
    permisos TEXT NULL
);

CREATE TABLE USUARIOS (
    id_usuario INT PRIMARY KEY NOT NULL,
    DNI VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    fecha_registro DATE NOT NULL
);

CREATE TABLE CATEGORIAS (
    id_categoria INT PRIMARY KEY NOT NULL,
    nombre_categoria VARCHAR(20) NOT NULL,
    beneficios VARCHAR(255) NULL
);

CREATE TABLE PROMOCIONES (
    id_promocion INT PRIMARY KEY NOT NULL,
    nombre_promocion VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_final DATE NOT NULL
);

CREATE TABLE EVENTOS (
    id_evento INT PRIMARY KEY NOT NULL,
    nombre_evento VARCHAR(100) NOT NULL,
    fecha_hora TIMESTAMP NOT NULL,
    lugar VARCHAR(100) NOT NULL,
    capacidad INT NOT NULL
);

CREATE TABLE AREAS (
    id_area INT PRIMARY KEY NOT NULL,
    nombre_area VARCHAR(50) NOT NULL
);

-------------------------------------------------------

CREATE TABLE CUENTAS (
    id_cuenta INT PRIMARY KEY NOT NULL,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    tipo_cuenta VARCHAR(10) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    id_rol INT NOT NULL,
    id_usuario INT NOT NULL UNIQUE,
    FOREIGN KEY (id_rol) REFERENCES ROLES(id_rol),
    FOREIGN KEY (id_usuario) REFERENCES USUARIOS(id_usuario)
);

CREATE TABLE CLIENTES (
    id_usuario INT PRIMARY KEY NOT NULL,
    datos_biometricos BYTEA NULL,
    puntos INT NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES USUARIOS(id_usuario),
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIAS(id_categoria)
);

CREATE TABLE EMPLEADOS (
    id_usuario INT PRIMARY KEY NOT NULL,
    id_area INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES USUARIOS(id_usuario),
    FOREIGN KEY (id_area) REFERENCES AREAS(id_area)
);

CREATE TABLE NOTIFICACIONES (
    id_notificacion INT PRIMARY KEY NOT NULL,
    mensaje TEXT NOT NULL,
    tipo VARCHAR(10) NOT NULL,
    fecha_hora_envio TIMESTAMP NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES USUARIOS(id_usuario)
);

CREATE TABLE MAQUINAS (
    id_maquina INT PRIMARY KEY NOT NULL,
    modelo VARCHAR(50) NULL,
    ubicacion VARCHAR(100) NULL,
    estado VARCHAR(20) NOT NULL,
    id_area INT NOT NULL,
    FOREIGN KEY (id_area) REFERENCES AREAS(id_area)
);

CREATE TABLE ACCESOS (
    id_punto_acceso INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    id_area INT NOT NULL,
    FOREIGN KEY (id_area) REFERENCES AREAS(id_area)
);

CREATE TABLE RESERVAS (
    id_reserva INT PRIMARY KEY NOT NULL,
    fecha_hora_reserva TIMESTAMP NOT NULL,
    tipo_reserva VARCHAR(20) NOT NULL,
    estado VARCHAR(15) NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES CLIENTES(id_usuario)
);

CREATE TABLE LOGS (
    id_log INT PRIMARY KEY NOT NULL,
    fecha_hora_acceso TIMESTAMP NOT NULL,
    terminal VARCHAR(50) NULL,
    ip VARCHAR(45) NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES EMPLEADOS(id_usuario)
);

CREATE TABLE INCIDENTES (
    id_incidente INT PRIMARY KEY NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_hora TIMESTAMP NOT NULL,
    id_usuario INT NOT NULL,
    id_area INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES EMPLEADOS(id_usuario),
    FOREIGN KEY (id_area) REFERENCES AREAS(id_area)
);

--------------------------------------------------------------------

CREATE TABLE Otorga (
    id_categoria INT NOT NULL,
    id_promocion INT NOT NULL,
    PRIMARY KEY (id_categoria),
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIAS(id_categoria),
    FOREIGN KEY (id_promocion) REFERENCES PROMOCIONES(id_promocion)
);

CREATE TABLE Corresponde (
    id_reserva INT NOT NULL,
    id_evento INT NOT NULL,
    PRIMARY KEY (id_reserva, id_evento),
    FOREIGN KEY (id_reserva) REFERENCES RESERVAS(id_reserva),
    FOREIGN KEY (id_evento) REFERENCES EVENTOS(id_evento)
);

CREATE TABLE PUNTOS (
    id_usuario INT NOT NULL,
    fecha_hora TIMESTAMP NOT NULL,
    cantidad_puntos INT NOT NULL,
    motivo VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_usuario, fecha_hora),
    FOREIGN KEY (id_usuario) REFERENCES CLIENTES(id_usuario)
);

CREATE TABLE VISITAS (
    id_usuario INT NOT NULL,
    fecha_hora_entrada TIMESTAMP NOT NULL,
    fecha_hora_salida TIMESTAMP NULL,
    id_punto_acceso INT NOT NULL,
    PRIMARY KEY (id_usuario, fecha_hora_entrada),
    FOREIGN KEY (id_usuario) REFERENCES CLIENTES(id_usuario),
    FOREIGN KEY (id_punto_acceso) REFERENCES ACCESOS(id_punto_acceso)
);