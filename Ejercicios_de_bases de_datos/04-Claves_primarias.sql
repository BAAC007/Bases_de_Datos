--Claves primarias
--V0.1 Bryan Alejandro Avila castro
--Base de datos que almacena información sobre diferentes gimnasios y lugares para hacer deporte.

--Creamos una base de datos llamada "empresadam"
CREATE DATABASES empresadam;

--Usamos la base de datos "empresadam"
USE empresadam;

--Para ver las tablas de la base de datos usamos el siguiente codigo
SHOW TABLES;

--Creamos la tabla "gimnasios" con los siguientes campos:
CREATE TABLE gimnasios(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    ubicacion VARCHAR(255)
);

--Ahora le añadimos datos a la tabla
INSERT INTO gimnasios(nombre, ubicacion) VALUES("BasicFIT", "Parque Ademuz");
INSERT INTO gimnasios(nombre, ubicacion) VALUES("Progym", "Plaza España");
INSERT INTO gimnasios(nombre, ubicacion) VALUES("Fitness Park Valencia", "Camí de Montcada")

--Como ultimo paso mostramos los registros en la tabla gimnasio
SELECT * FROM gimnasios;

