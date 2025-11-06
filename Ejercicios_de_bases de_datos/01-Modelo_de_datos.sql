--Creación de Tablas
--V0.1 Bryan Alejandro Avila Castro
--En esta practica se ha realizado la tabla Clientes que posee campos como: dni, nombre, apellidos y email.

CREATE TABLE Clientes (
  dni VARCHAR(9),
  nombre VARCHAR(50),
  apellidos VARCHAR(255),
  email VARCHAR(100)
);

INSERT INTO Clientes (dni, nombre, apellidos, email) VALUES ('12345678A', 'Bryan', 'Avila', 'Bryan.avila@ico.com');

SHOW TABLES;
