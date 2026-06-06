-- esta consulta une todas las tablas de la 3FN (7 tablas en total)
-- une ventas con clientes, ciudades, departamentos, vendedores, detalle y productos
-- para mostrar la informacion completa tal como la teniamos al inicio, pero bien estructurada
SELECT
    v.id_venta,
    c.nombre   AS cliente,
    c.correo,
    ci.nombre  AS ciudad,
    d.nombre   AS departamento,
    ven.nombre AS vendedor,
    p.nombre   AS producto,
    dv.cantidad,
    v.fecha_venta
FROM normalizacion.ventas_3fn v
-- unimos el cliente de la venta
JOIN normalizacion.clientes_3fn c
    ON v.id_cliente = c.id_cliente
-- unimos la ciudad del cliente
JOIN normalizacion.ciudades ci
    ON c.id_ciudad = ci.id_ciudad
-- unimos el departamento de la ciudad
JOIN normalizacion.departamentos d
    ON ci.id_departamento = d.id_departamento
-- unimos el vendedor de la venta
JOIN normalizacion.vendedores_3fn ven
    ON v.id_vendedor = ven.id_vendedor
-- unimos los productos que estan en el detalle de la venta
JOIN normalizacion.detalle_ventas_3fn dv
    ON v.id_venta = dv.id_venta
-- unimos los nombres de los productos
JOIN normalizacion.productos_3fn p
    ON dv.id_producto = p.id_producto
ORDER BY v.id_venta;
