--Creamos
INSERT INTO clientes VALUES(
  '12345678A',
  'Jose Vicente',
  'Carratala Sanchis',
  'info@jocarsa.com'
);

--Mensaje que debe mostrar
Query OK, 1 row affected (0,01 sec)


--Leemos
SELECT * FROM clientes;


--Lo que debe mostrar
+-----------+--------------+-------------------+------------------+
| dni       | nombre       | apellidos         | email            |
+-----------+--------------+-------------------+------------------+
| 12345678A | Jose Vicente | Carratala Sanchis | info@jocarsa.com |
+-----------+--------------+-------------------+------------------+
1 row in set (0,00 sec)


--Actualizamos
UPDATE clientes
SET dni = '11111111A'
WHERE nombre = 'Jose Vicente';

--Leemos
SELECT * FROM clientes;

--Actualizamos
UPDATE clientes
SET apellidos = 'Garcia Lopez'
WHERE nombre = 'Jose Vicente';


-- Eliminamos
DELETE FROM clientes
WHERE dni = '11111111A';