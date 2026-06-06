-- aqui agrego los dos clientes que aparecen en las ventas
-- Ana Torres es de Bogota y Luis Gomez es de Medellin
INSERT INTO normalizacion.clientes (nombre, correo, ciudad) VALUES
    ('Ana Torres',  'ana@mail.com',  'Bogotá'),
    ('Luis Gómez',  'luis@mail.com', 'Medellín');

-- aqui agrego los dos vendedores que atendieron las ventas
INSERT INTO normalizacion.vendedores (nombre) VALUES
    ('Carlos'),
    ('Diana');

-- aqui agrego todos los productos que se vendieron en el ejercicio
INSERT INTO normalizacion.productos (nombre) VALUES
    ('Mouse'),
    ('Teclado'),
    ('Monitor'),
    ('Laptop'),
    ('Silla');

-- aqui registro las tres ventas que hubo
-- uso el numero del cliente y del vendedor en vez de su nombre
-- el cliente 1 es Ana Torres y el vendedor 1 es Carlos
INSERT INTO normalizacion.ventas (id_cliente, id_vendedor, fecha_venta) VALUES
    (1, 1, '2026-06-01'),
    (2, 1, '2026-06-02'),
    (1, 2, '2026-06-03');

-- aqui digo que productos compro cada venta y cuantos
-- la venta 1 compro mouse teclado y monitor
-- la venta 2 compro laptop y un mouse
-- la venta 3 compro una silla

INSERT INTO normalizacion.detalle_ventas (id_venta, id_producto, cantidad) VALUES
    (1, 1, 1),
    (1, 2, 1),
    (1, 3, 1),
    (2, 4, 1),
    (2, 1, 1),
    (3, 5, 1);

SELECT 'datos insertados correctamente' AS resultado;
