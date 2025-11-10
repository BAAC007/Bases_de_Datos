--Iniciamos.--
SHOW DATABASES;

+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+

--Creamos la base de datos portafolioexamen.--
CREATE DATABASE portafolioexamen;

--Nos aseguramos que se haya creado correctamente la base de datos.--
SHOW DATABASES;

+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| portafolioexamen   |
| sys                |
+--------------------+

--Usamos la base de datos recien creada.--
USE portafolioexamen;

--Creamos las tablas piezasportafolio y categoriasportafolio.--
CREATE TABLE piezasportafolio(
    identificador INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    descripcion TEXT,
    fecha VARCHAR(200),
    categoria_id INT
);

CREATE TABLE categoriasportafolio(
    identificador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200)
);

--Verificamos que se haya creado correctamente cada una de las tablas.--
SHOW TABLES;

+----------------------------+
| Tables_in_portafolioexamen |
+----------------------------+
| categoriasportafolio       |
| piezasportafolio           |
+----------------------------+

--Creamos una clave foranea a los campos "id_categoria" y a categoriaportafolio(identificador).--
ALTER TABLE piezasportafolio
ADD CONSTRAINT fk_piezas_categorias
FOREIGN KEY (categoria_id) REFERENCES categoriasportafolio(identificador)
ON DELETE CASCADE
ON UPDATE CASCADE;

--Insertamos datos a las tablas.--
INSERT INTO categoriasportafolio VALUES(
    NULL,
    'General'
);

INSERT INTO piezasportafolio VALUES(
    NULL,
    'Pieza General',
    'Pieza usada como unos de los primeros datos en el examen de bases de datos',
    '10/11/2025',
    1
);

--Leemos las tablas.--
SELECT * FROM piezasportafolio;

+---------------+---------------+----------------------------------------------------------------------------+------------+--------------+
| identificador | titulo        | descripcion                                                                | fecha      | categoria_id |
+---------------+---------------+----------------------------------------------------------------------------+------------+--------------+
|             1 | Pieza General | Pieza usada como unos de los primeros datos en el examen de bases de datos | 10/11/2025 |            1 |
+---------------+---------------+----------------------------------------------------------------------------+------------+--------------+

SELECT * FROM categoriasportafolio;

+---------------+---------+
| identificador | nombre  |
+---------------+---------+
|             1 | General |
+---------------+---------+

--Actualizamos las tablas.--
UPDATE piezasportafolio
SET fecha = '24/11/2025'
WHERE titulo = 'Pieza General'

--Verificamos la actualización.--
SELECT * FROM piezasportafolio;

+---------------+---------------+----------------------------------------------------------------------------+------------+--------------+
| identificador | titulo        | descripcion                                                                | fecha      | categoria_id |
+---------------+---------------+----------------------------------------------------------------------------+------------+--------------+
|             1 | Pieza General | Pieza usada como unos de los primeros datos en el examen de bases de datos | 24/11/2025 |            1 |
+---------------+---------------+----------------------------------------------------------------------------+------------+--------------+

--Eliminamos un registro.--
DELETE FROM piezasportafolio
WHERE fecha = '24/11/2025';

--Verificamos que se haya eliminado el registro.--
SELECT * FROM piezasportafolio;

Empty set (0.000 sec)

--Insertamos el LEFT JOIN.--
SELECT * FROM piezasportafolio
LEFT JOIN categoriasportafolio
ON piezasportafolio.categoria_id = categoriasportafolio.identificador;

+---------------+---------------+----------------------------------------------------------------------------+------------+--------------+---------------+---------+
| identificador | titulo        | descripcion                                                                | fecha      | categoria_id | identificador | nombre  |
+---------------+---------------+----------------------------------------------------------------------------+------------+--------------+---------------+---------+
|             2 | Pieza General | Pieza usada como unos de los primeros datos en el examen de bases de datos | 10/11/2025 |            1 |             1 | General |
+---------------+---------------+----------------------------------------------------------------------------+------------+--------------+---------------+---------+

--Creamos una vista.--
CREATE VIEW piezas_y_categorias AS
SELECT
categoriasportafolio.nombre AS categoriasnombre,
piezasportafolio.titulo AS piezastitulo,
piezasportafolio.descripcion AS piezasdescripcion,
piezasportafolio.fecha AS piezasfecha
FROM piezasportafolio
LEFT JOIN categoriasportafolio
ON piezasportafolio.categoria_id = categoriasportafolio.identificador;

--Vemos si se creo correctamente la vista--
SELECT * FROM piezas_y_categorias;

+------------------+---------------+----------------------------------------------------------------------------+-------------+
| categoriasnombre | piezastitulo  | piezasdescripcion                                                          | piezasfecha |
+------------------+---------------+----------------------------------------------------------------------------+-------------+
| General          | Pieza General | Pieza usada como unos de los primeros datos en el examen de bases de datos | 10/11/2025  |
+------------------+---------------+----------------------------------------------------------------------------+-------------+

--Creamos el usuario y le otorgamos permisos.--
CREATE USER 'Bryan'@'localhost' IDENTIFIED BY '123';

GRANT USAGE ON *.* TO 'Bryan'@'localhost';

ALTER USER 'Bryan'@'localhost'
REQUIRE NONE
WITH MAX_QUERIES_PER_HOUR 0
MAX_CONNECTIONS_PER_HOUR 0
MAX_UPDATES_PER_HOUR 0
MAX_USER_CONNECTIONS 0;

--Le damos acceso al usuario a la base de datos.--
GRANT ALL PRIVILEGES ON [portafolioexamen].* TO 'Bryan'@'localhost';

--Recargamos la tabla de privilegios.--
FLUSH PRIVILEGES;

--Y vemos los privilegios del usuario.--
SHOW GRANTS FOR 'Bryan'@'localhost';

+--------------------------------------------------------------------------------------------------------------+
| Grants for Bryan@localhost                                                                                   |
+--------------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `Bryan`@`localhost` IDENTIFIED BY PASSWORD '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257' |
| GRANT ALL PRIVILEGES ON `portafolioexamen`.* TO `Bryan`@`localhost`                                          |
+--------------------------------------------------------------------------------------------------------------+