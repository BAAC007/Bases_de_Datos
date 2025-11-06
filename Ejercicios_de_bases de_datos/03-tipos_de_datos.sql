--Creamos la tabla con el nombre "gimnasios_rutas".
--Agregamos los campos "id", "nombre_gimnasio", "direccion_gimnasio", "latitud", "longitud", "nombre_ruta", "distancia".
CREATE TABLE "gimnasios_rutas" (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre_gimnasio VARCHAR (100),
	direccion_gimnasio VARCHAR (100),
	latitud INT,
	longitud INT,
	nombre_ruta VARCHAR (100),
	distancia INT
);


--Le insertamos valores a cada campo de la tabla "gimnasios_rutas".
INSERT INTO gimnasios_rutas(id, nombre_gimnasio, direccion_gimnasio, latitud, longitud, nombre_ruta, distancia) VALUES(1, "La capital de los fuertes", "Calle valencia 43", 39253360, 0463000, "Camino a la fuerza", 12);