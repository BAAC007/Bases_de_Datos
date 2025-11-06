sudo mysql -u root -p 

CREATE DATABASE mi_viaje_gimnasio;

USE mi_viaje_gimnasio;

CREATE TABLE lugares (
  id_lugar INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  pais VARCHAR(100)
);

CREATE TABLE ejercicios (
    id_ejercicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    tipo ENUM('cardio', 'pesas', 'flexibilidad')
);

INSERT INTO lugares (nombre, pais) VALUES ('Caracas', 'Venezuela'), ('Valencia', 'España');

INSERT INTO ejercicios (nombre, tipo) VALUES ('trotar', 'cardio'), ('press de banca', 'pesas'), ('Yoga', 'flexibilidad');

SELECT * FROM lugares;

SELECT * FROM ejercicios;