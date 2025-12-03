-- Se crea la base de datos 'portafolio examen' y se selecciona.
-- Se crean las tablas 'piezasportafolio' y 'categoriasportafolio' con sus campos correspondientes.
-- Se establece una clave foránea para relacionar categoria_id con categoriasportafolio.identificador.
-- Se insertan y verifican datos en ambas tablas.
-- Se actualiza y luego se elimina un registro en 'piezasportafolio'.
-- Se realiza un LEFT JOIN y se crea una vista basada en los datos combinados.
-- Finalmente, se crea un usuario, se le asignan privilegios y se verifican.

--Iniciamos.--
sudo mysql -u root -p

--Mostramos a todos los usuarios en el sistema, (con el siguiente comando).--
SELECT User, Host FROM mysql.user;

+------------------+-----------+
| User             | Host      |
+------------------+-----------+
| root             | localhost |
| mysql.session    | localhost |
| mysql.sys        | localhost |
+------------------+-----------+
3 rows in set (0.00 sec)

--Ejecutamos el siguiente comando SQL para crear un nuevo usuario. Reemplazamos [tunombredeusuario], [tuservidor] y [tucontraseña] con tus datos.--
CREATE USER '[Bryan]'@'[localhost]' IDENTIFIED BY '[*******]';

Query OK, 0 rows affected (0.01 sec)

--Permitimos el acceso a nuestro usuario con el siguiente comando.--
GRANT USAGE ON *.* TO '[Bryan]'@'[localhost]';

Query OK, 0 rows affected (0.00 sec)

--Quitamos todos los limites que tengas.--
ALTER USER '[Bryan]'@'[localhost]'
REQUIRE NONE
WITH MAX_QUERIES_PER_HOUR 0
MAX_CONNECTIONS_PER_HOUR 0
MAX_UPDATES_PER_HOUR 0
MAX_USER_CONNECTIONS 0;

Query OK, 0 rows affected (0.00 sec)

--Le damos acceso a la base de datos empresadaw.--
GRANT ALL PRIVILEGES ON [empresadaw].* TO '[Bryan]'@'[localhost]';

Query OK, 0 rows affected (0.01 sec)

--Recargamos la tabla de privilegios para que los cambios surtan efecto.--
FLUSH PRIVILEGES;

Query OK, 0 rows affected (0.00 sec)

--Nos aseguramos que nuestro nuevo usuario aparezca en la lista de usuarios y que posee los privilegios correctos.--
SELECT User, Host FROM mysql.user;

+------------------+-----------+
| User             | Host      |
+------------------+-----------+
| root             | localhost |
| mysql.session    | localhost |
| mysql.sys        | localhost |
| Bryan            | localhost |
+------------------+-----------+
4 rows in set (0.00 sec)

SHOW GRANTS FOR 'Bryan'@'localhost';

+--------------------------------------------------------------------+
| Grants for Bryan@localhost                                         |
+--------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `Bryan`@`localhost`                          |
| GRANT ALL PRIVILEGES ON `empresadaw`.* TO `Bryan`@`localhost`      |
+--------------------------------------------------------------------+
2 rows in set (0.00 sec)