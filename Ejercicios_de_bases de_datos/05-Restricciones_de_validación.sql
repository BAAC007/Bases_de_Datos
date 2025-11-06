--Restricciones de validación
--V0.1 Bryan Alejandro Avila castro
--Tabla con restricciones para asegurar los datos ingresados sean validos.

CREATE TABLE productos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    precio FLOAT (7,2) NOT NULL,
    stock INT NOT NULL
);


ALTER TABLE productos
    ADD CONSTRAINT chk_stock_no_negativo
    CHECK (stock >= 0);

ALTER TABLE productos
    ADD CONSTRAINT chk_precio_no_negativo
    CHECK (precio >= 0);

ALTER TABLE productos
    ADD CONSTRAINT chk_precio_max_5000
    CHECK (precio <= 5000);

ALTER TABLE productos
    ADD CONSTRAINT chk_nombre_min_5
    CHECK (CHAR_LENGHT(nombre) >= 5);


INSERT INTO productos (nombre, descripcion, precio, stock) VALUES
('Champu HyS', 'head and shoulder anti caspas.', 2.40, 110),
('Desodorante Rexona', 'Rexona doble protección, rexona nunca te abandona.', 1.30, 300),
('Pasta dental Colgate', 'Para un cepillado más eficiente.', 1.25, 45);