--Iniamos.--
sudo mysql -u root -p

--Revisamos nuestras bases de datos.--
SHOW DATABASES;

--Usamos la base de datos.--
USE empresadaw;

--Vemos las tablas de la base de datos y buscamos pedidos.--
SHOW TABLES;

--Inserta un nuevo pedido con todos los campos completos.--
INSERT INTO pedidos (numerodepedido, cliente, producto) VALUES ('P001', 'bryan', 'Monitor');

+----+----------------+---------+---------+
| id | numerodepedido | cliente | producto|
+----+----------------+---------+---------+
|  1 | P001           | bryan   | Monitor |
+----+----------------+---------+---------+

--Intenta insertar un pedido sin especificar el valor del campo cliente.--
INSERT INTO pedidos (numerodepedido, producto) VALUES ('P002', 'Smartphone');

--Al no especificarse un valor en campo cliente este se volvera NULL.--
+------+----------------+---------+------------+
| id   | numerodepedido | cliente | producto   |
+------+----------------+---------+------------+
| 1    | P001           | bryan   | Monitor    |
| 2    | P002           | NULL    | Smartphone |
+------+----------------+---------+------------+

--Consultamos--
SELECT * FROM pedidos WHERE cliente IS NULL;
+----+----------------+---------+------------+
| id | numerodepedido | cliente | producto   |
+----+----------------+---------+------------+
|  2 | P002           | NULL    | Smartphone |
+----+----------------+---------+------------+


--Actualizamos el campo clientes donde el numero de pedido sea 'P002'.--
UPDATE pedidos SET cliente = 'Sin especificar' WHERE numerodepedido = 'P002';
+----+----------------+-----------------+------------+
| id | numerodepedido | cliente         | producto   |
+----+----------------+-----------------+------------+
|  1 | P001           | bryan           | Monitor    |
|  2 | P002           | Sin especificar | Smartphone |
+----+----------------+-----------------+------------+

--Ahora eliminamos el registro donde el campo sea NULL.--
DELETE FROM pedidos WHERE cliente IS NULL;

--En este caso no se borra el registro ya que el no hay algun campo que posea NULL.--
+----+----------------+-----------------+------------+
| id | numerodepedido | cliente         | producto   |
+----+----------------+-----------------+------------+
|  1 | P001           | bryan           | Monitor    |
|  2 | P002           | Sin especificar | Smartphone |
+----+----------------+-----------------+------------+

--Pero por ejemplo si hubiera NULL este seria el resultado.--
DELETE FROM pedidos WHERE cliente IS NULL;

--El resultado en este caso es que se borra por que el campo clientes posee un dato NULL.--
+----+----------------+---------+---------+
| id | numerodepedido | cliente | producto |
+----+----------------+---------+---------+
|  1 | P001           | bryan   | Monitor  |
+----+----------------+---------+---------+

