-- uno todas las tablas para ver los datos completos en una sola consulta
-- esto demuestra que aunque los datos estan separados, se pueden ver juntos
SELECT
    v.id_venta,
    c.nombre     AS cliente,
    c.correo,
    vd.nombre    AS vendedor,
    p.nombre     AS producto,
    dv.cantidad,
    v.fecha_venta
FROM normalizacion.ventas v
-- uno la tabla de clientes para traer el nombre y correo
JOIN normalizacion.clientes c
    ON v.id_cliente  = c.id_cliente
-- uno la tabla de vendedores para traer el nombre del vendedor
JOIN normalizacion.vendedores vd
    ON v.id_vendedor = vd.id_vendedor
-- uno el detalle para saber que productos lleva cada venta
JOIN normalizacion.detalle_ventas dv
    ON v.id_venta    = dv.id_venta
-- uno la tabla de productos para traer el nombre del producto
JOIN normalizacion.productos p
    ON dv.id_producto = p.id_producto
ORDER BY v.id_venta;
