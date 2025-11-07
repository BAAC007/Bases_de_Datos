--Creamos la base de datos 'portafolioceac'.--
CREATE DATABASE portafolioceac;

--Vemos si se creó correctamente la base de datos.--
SHOW DATABASES;

--Usamos la base de datos recien creada.--
USE portafolioceac;

--Creamos la tabla Piezas.--
CREATE TABLE Piezas(
  Identificador INT auto_increment PRIMARY KEY,
  titulo VARCHAR(255),
  descripcion VARCHAR(255),
  imagen VARCHAR(255),
  url VARCHAR(255),
  id_categoria INT
);

--Verificamos que se haya creado correctamente la tabla Pieza.--
SHOW TABLES;

--Creamos la tabla Categorias.--
CREATE TABLE Categorias(
  Identificador INT auto_increment PRIMARY KEY,
  titulo VARCHAR(255),
  descripcion VARCHAR(255)
);

--Verificamos que se haya creado correctamente la tabla Categoria.--
SHOW TABLES;

--Insertamos valores a Categorias.--
INSERT INTO Categorias VALUES(
  NULL,
  'General',
  'Esta es la categoria general'
);

--Insertamos valores a Piezas.--
INSERT INTO Piezas VALUES(
  NULL,
  'Primera pieza',
  'Esta es la descripcion de la primera pieza',
  'josevicente.jpg',
  'https://jocarsa.com',
  1
);

--Añadimos una clave foranea a los campos 'id_categoria' y a Categoria(identificador)--
ALTER TABLE Piezas
ADD CONSTRAINT fk_piezas_categorias
FOREIGN KEY (id_categoria) REFERENCES Categorias(identificador)
ON DELETE CASCADE
ON UPDATE CASCADE;

--Seleccionamos Categorias.--
SELECT * FROM Categorias;

--Seleccionamos Piezas.--
SELECT * FROM Piezas;

--Insertamos el left join.--
SELECT 
* 
FROM Piezas
LEFT JOIN Categorias
ON Piezas.id_categoria = Categorias.Identificador;

--Creamos una vista.--
CREATE VIEW piezas_y_categorias AS 
SELECT 
Categorias.titulo AS categoriatitulo,
Categorias.descripcion AS categoriadescripcion,
Piezas.titulo AS piezatitulo,
Piezas.descripcion AS piezadescripcion,
imagen,
url
FROM Piezas
LEFT JOIN Categorias
ON Piezas.id_categoria = Categorias.Identificador;

SELECT * FROM piezas_y_categorias;

--crea usuario nuevo con contraseña
--creamos el nombre de usuario que queramos
CREATE USER 
'portafolioceac'@'localhost' 
IDENTIFIED  BY 'portafolioceac';

-- permite acceso a ese usuario
GRANT USAGE ON *.* TO 'portafolioceac'@'localhost';
--[tuservidor] == localhost
-- La contraseña puede requerir Mayus, minus, numeros, caracteres, min len

-- quitale todos los limites que tenga
ALTER USER 'portafolioceac'@'localhost' 
REQUIRE NONE 
WITH MAX_QUERIES_PER_HOUR 0 
MAX_CONNECTIONS_PER_HOUR 0 
MAX_UPDATES_PER_HOUR 0 
MAX_USER_CONNECTIONS 0;

-- dale acceso a la base de datos empresadam
GRANT ALL PRIVILEGES ON [tubasededatos].* 
TO 'portafolioceac'@'localhost';

-- recarga la tabla de privilegios
FLUSH PRIVILEGES;