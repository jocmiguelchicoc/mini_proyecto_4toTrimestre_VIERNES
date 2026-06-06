-- borro la tabla si ya existia para empezar para evitar errores
DROP TABLE IF EXISTS normalizacion.ventas_1fn;

-- creo la tabla en primera forma normal
-- ahora cada fila tiene un solo producto, ya no hay listas en una celda

CREATE TABLE normalizacion.ventas_1fn (
    id_venta       INT,
    cliente        VARCHAR(100),
    correo         VARCHAR(120),
    producto       VARCHAR(100),
    ciudad_cliente VARCHAR(100),
    vendedor       VARCHAR(100)
);

-- meto los mismos datos pero ahora un producto por fila
INSERT INTO normalizacion.ventas_1fn
    (id_venta, cliente, correo, producto, ciudad_cliente, vendedor)
VALUES
    (1, 'Ana Torres',  'ana@mail.com',  'Mouse',    'Bogotá',   'Carlos'),
    (1, 'Ana Torres',  'ana@mail.com',  'Teclado',  'Bogotá',   'Carlos'),
    (1, 'Ana Torres',  'ana@mail.com',  'Monitor',  'Bogotá',   'Carlos'),
    (2, 'Luis Gómez',  'luis@mail.com', 'Laptop',   'Medellín', 'Carlos'),
    (2, 'Luis Gómez',  'luis@mail.com', 'Mouse',    'Medellín', 'Carlos'),
    (3, 'Ana Torres',  'ana@mail.com',  'Silla',    'Bogotá',   'Diana');

SELECT * FROM normalizacion.ventas_1fn;
