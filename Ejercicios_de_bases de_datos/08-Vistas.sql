--Iniciamos.--
sudo mysql -u root -p

--Creamos una base de datos.--
CREATE DATABASE correo;

--Usamos la base de datos.--
USE correo;

--Creamos la tabla 'personas'.--
CREATE TABLE personas(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200),
    apellidos VARCHAR(200)
);

--Vemos la tabla.--
SHOW TABLES;

--Creamos la tabla 'email'.--
CREATE TABLE email(
    id INT AUTO_INCREMENT PRIMARY KEY,
    direccion VARCHAR(255),
    persona INT(200)
);

--Vemos la tabla.--
SHOW TABLES;

--Inserto una persona.--
INSERT INTO personas VALUES(
  NULL,
  'Bryan Alejandro',
  'Avila Castro'
);

--Inserto un email.--
INSERT INTO email VALUES(
  NULL,
  'info@avila.com',
  '1'
);

--Creamos la vista.--
CREATE VIEW personas_correos AS
SELECT 
personas.id,
email.direccion,
personas.nombre,
personas.apellidos
FROM email
LEFT JOIN personas
ON email.persona = personas.id;

SELECT * FROM personas_correos; --Recordar se comporta como una tabla.--

--Daria como resultado la siguiente imagen.--
+----+----------------+-----------------+--------------+
| id | direccion      | nombre          | apellidos    |
+----+----------------+-----------------+--------------+
|  1 | info@avila.com | Bryan Alejandro | Avila Castro |
+----+----------------+-----------------+--------------+
