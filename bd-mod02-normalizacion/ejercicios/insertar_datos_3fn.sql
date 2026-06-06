-- aqui meto los dos departamentos
INSERT INTO normalizacion.departamentos (nombre) VALUES
    ('Cundinamarca'),
    ('Antioquia');

-- aqui meto las ciudades conectadas a su departamento usando el numero del departamento
INSERT INTO normalizacion.ciudades (nombre, id_departamento) VALUES
    ('Bogotá', 1),
    ('Medellín', 2);

-- aqui meto los clientes con el numero de su ciudad para no repetir el nombre de la ciudad
INSERT INTO normalizacion.clientes_3fn (nombre, correo, id_ciudad) VALUES
    ('Ana Torres', 'ana@mail.com', 1),
    ('Luis Gómez', 'luis@mail.com', 2);

-- aqui meto los vendedores
INSERT INTO normalizacion.vendedores_3fn (nombre) VALUES
    ('Carlos'),
    ('Diana');

-- aqui meto los productos
INSERT INTO normalizacion.productos_3fn (nombre) VALUES
    ('Mouse'),
    ('Teclado'),
    ('Monitor'),
    ('Laptop'),
    ('Silla');

-- aqui meto las ventas relacionando cliente y vendedor
INSERT INTO normalizacion.ventas_3fn (id_cliente, id_vendedor, fecha_venta) VALUES
    (1, 1, '2026-06-01'),
    (2, 1, '2026-06-02'),
    (1, 2, '2026-06-03');

-- aqui meto que productos lleva cada venta y la cantidad
INSERT INTO normalizacion.detalle_ventas_3fn (id_venta, id_producto, cantidad) VALUES
    (1, 1, 1),
    (1, 2, 1),
    (1, 3, 1),
    (2, 4, 1),
    (2, 1, 1),
    (3, 5, 1);

SELECT 'datos insertados en 3FN correctamente' AS resultado;
