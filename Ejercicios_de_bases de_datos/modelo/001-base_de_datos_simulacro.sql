--Base de datos simulacro.--
--(c) Bryan Alejandro Avila Castro.--
--En esta base de datos hacemos un simulacro tipo prueba.--

--Iniciamos.--
sudo mysql -u root -p

--Creamos la base de datos.--
CREATE DATABASE blog;

Query OK, 1 row affected (0.01 sec)

--Verificamos que se haya creado correctamente y usamos blog.--
SHOW DATABASES;
USE blog;

+--------------------+
| Database           |
+--------------------+
| blog               |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.00 sec)

Database changed

--Creamos la tabla 'autores'.--
CREATE TABLE autores(
    identificador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200),
    apellidos VARCHAR(200),
    email VARCHAR(200)
);

Query OK, 0 rows affected (0.02 sec)

--Insertamos valores a la tabla 'autores'.--
INSERT INTO autores VALUES(
    NULL,
    "Bryan",
    "Avila Castro",
    "info@avila.com"
);

Query OK, 1 row affected (0.01 sec)

--Creamos la tabla 'entradas'.--
CREATE TABLE entradas(
    identificador INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    fecha DATE,
    imagen LONGBLOB,
    id_autores INT,
    contenido TEXT
);

Query OK, 0 rows affected (0.03 sec)

--Agregamos la clave foranea de id_autor al identificador de la tabla autores.--
ALTER TABLE entradas
ADD CONSTRAINT fk_entradas_autores
FOREIGN KEY (id_autores) REFERENCES autores(identificador);

Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

--Insertamos una entrada dentro de la tabla 'entradas' para probar.--
INSERT INTO entradas VALUES(
    NULL,
    "hitos historicos",
    '06-11-2025',
    1,
    "Chamitos"
);

Query OK, 1 row affected (0.01 sec)

--Insertamos una imagen dentro de la tabla entradas.--
UPDATE entradas 
SET imagen = LOAD_FILE('/var/lib/mysql-files/Hitos_Historicos.png') 
WHERE identificador = 1;

Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

--Realizamos una consulta cruzada utilizando 'LEFT JOIN'.--
SELECT 
    entradas.titulo,
    entradas.fecha,
    entradas.imagen,
    entradas.contenido,
    autores.nombre,
    autores.apellidos 
FROM entradas
LEFT JOIN autores
ON entradas.id_autores = autores.Identificador;

+-----------------+------------+--------+------------+--------+--------------+
| titulo          | fecha      | imagen | contenido  | nombre | apellidos    |
+-----------------+------------+--------+------------+--------+--------------+
| hitos historicos| 2025-11-06 |  [BLOB]| Chamitos  | Bryan  | Avila Castro |
+-----------------+------------+--------+------------+--------+--------------+
1 row in set (0.00 sec)

--Creamos una vista con la información obtenida anteriormente.--
CREATE VIEW vista_entradas AS 
SELECT 
    entradas.titulo,
    entradas.fecha,
    entradas.imagen,
    entradas.contenido,
    autores.nombre,
    autores.apellidos 
FROM entradas
LEFT JOIN autores
ON entradas.id_autores = autores.Identificador;

Query OK, 0 rows affected (0.01 sec)

--Consultamos la vista anterior para ver los resultados.--
SELECT * FROM vista_entradas;

+-----------------+------------+--------+------------+--------+--------------+
| titulo          | fecha      | imagen | contenido  | nombre | apellidos    |
+-----------------+------------+--------+------------+--------+--------------+
| hitos historicos| 2025-11-06 |  [BLOB]| Chamitos   | Bryan  | Avila Castro |
+-----------------+------------+--------+------------+--------+--------------+
1 row in set (0.00 sec)