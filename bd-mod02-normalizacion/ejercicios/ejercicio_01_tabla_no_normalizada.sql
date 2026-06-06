-- creo el espacio donde voy a guardar todas las tablas del ejercicio
CREATE SCHEMA IF NOT EXISTS normalizacion;

-- si la tabla ya existe la borro para empezar de cero
DROP TABLE IF EXISTS normalizacion.ventas_no_normalizadas;

-- creo la tabla mal diseñada, todo mezclado en un solo lugar
-- el problema es que productos pueden tener varios valores en una sola celda
CREATE TABLE normalizacion.ventas_no_normalizadas (
    id_venta       SERIAL PRIMARY KEY,
    cliente        VARCHAR(100),
    correo         VARCHAR(120),
    productos      TEXT,
    ciudad_cliente VARCHAR(100),
    vendedor       VARCHAR(100)
);

-- meto datos de ejemplo para ver el problema
INSERT INTO normalizacion.ventas_no_normalizadas
    (cliente, correo, productos, ciudad_cliente, vendedor)
VALUES
    ('Ana Torres',  'ana@mail.com',  'Mouse, Teclado, Monitor', 'Bogotá',   'Carlos'),
    ('Luis Gómez',  'luis@mail.com', 'Laptop, Mouse',           'Medellín', 'Carlos'),
    ('Ana Torres',  'ana@mail.com',  'Silla',                   'Bogotá',   'Diana');

SELECT * FROM normalizacion.ventas_no_normalizadas;
