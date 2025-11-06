--Iniciamos.--
sudo mysql -u root -p

--Creamos la base de datos.--
CREATE DATABASE ejemploclaves;

--Usamos 'ejemploclaves'.--
USE ejemploclaves;

--Creamos la tabla personas.--
CREATE TABLE personas (
  nombre VARCHAR(50),
  apellidos VARCHAR(255)
);

--Añadimos un identificador.--
ALTER TABLE personas
ADD COLUMN identificador INT AUTO_INCREMENT PRIMARY KEY FIRST;

--Creamos la tabla emails.--
CREATE TABLE emails (
  direccion VARCHAR(50),
  persona INT
);

--Añadimos un identificador.--
ALTER TABLE emails
ADD COLUMN identificador INT AUTO_INCREMENT PRIMARY KEY FIRST;

--Pasos importantes para crear la clave foranea.--

--Paso 1: cambiar el tipo de columna.--
ALTER TABLE emails
MODIFY COLUMN persona INT;

--Paso 2: crear la foreign key.--
ALTER TABLE emails
ADD CONSTRAINT fk_emails_personas
FOREIGN KEY (persona) REFERENCES personas(identificador);

--Ahora insertamos datos a las tablas.--

--Inserto una persona.--
INSERT INTO personas VALUES(
  NULL,
  'Bryan Alejandro',
  'Avila Castro'
);

--Inserto un email.--
INSERT INTO emails VALUES(
  NULL,
  'info@avila.com',
  1
);

--Realizamos una peticion cruzada.--
SELECT * FROM emails
LEFT JOIN personas
ON emails.persona = personas.identificador;