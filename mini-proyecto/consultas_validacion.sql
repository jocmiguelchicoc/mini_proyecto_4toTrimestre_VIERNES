-- 1. Listar todos los libros con su autor y categoria
SELECT l.titulo,
    a.nombre AS autor,
    c.nombre AS categoria
FROM biblioteca.libros l
    JOIN biblioteca.autores a ON l.id_autor = a.id_autor
    JOIN biblioteca.categorias c ON l.id_categoria = c.id_categoria;
-- 2. Listar todos los prestamos activos
SELECT p.id_prestamo,
    u.nombre AS usuario,
    l.titulo AS libro,
    p.fecha_prestamo,
    p.fecha_devolucion_esperada
FROM biblioteca.prestamos p
    JOIN biblioteca.usuarios u ON p.id_usuario = u.id_usuario
    JOIN biblioteca.libros l ON p.id_libro = l.id_libro
WHERE p.estado = 'ACTIVO';
-- 3. Consultar los prestamos de un usuario especifico
SELECT l.titulo AS libro,
    p.fecha_prestamo,
    p.fecha_devolucion_esperada,
    p.estado
FROM biblioteca.prestamos p
    JOIN biblioteca.libros l ON p.id_libro = l.id_libro
WHERE p.id_usuario = 1;
-- 4. Identificar libros que NO tienen prestamos activos
SELECT l.titulo,
    a.nombre AS autor
FROM biblioteca.libros l
    JOIN biblioteca.autores a ON l.id_autor = a.id_autor
WHERE l.id_libro NOT IN (
        SELECT id_libro
        FROM biblioteca.prestamos
        WHERE estado = 'ACTIVO'
    );
-- 5. Contar cuantos prestamos tiene cada usuario
SELECT u.nombre AS usuario,
    COUNT(p.id_prestamo) AS total_prestamos
FROM biblioteca.usuarios u
    LEFT JOIN biblioteca.prestamos p ON u.id_usuario = p.id_usuario
GROUP BY u.id_usuario,
    u.nombre
ORDER BY total_prestamos DESC;
-- 6. Consultar prestamos vencidos segun una fecha de referencia
SELECT u.nombre AS usuario,
    l.titulo AS libro,
    p.fecha_devolucion_esperada
FROM biblioteca.prestamos p
    JOIN biblioteca.usuarios u ON p.id_usuario = u.id_usuario
    JOIN biblioteca.libros l ON p.id_libro = l.id_libro
WHERE p.estado = 'VENCIDO'
    OR (
        p.estado = 'ACTIVO'
        AND p.fecha_devolucion_esperada < CURRENT_DATE
    );
-- 7. Mostrar libros prestados junto con la fecha esperada de devolucion
SELECT l.titulo AS libro,
    u.nombre AS prestado_a,
    p.fecha_devolucion_esperada
FROM biblioteca.prestamos p
    JOIN biblioteca.libros l ON p.id_libro = l.id_libro
    JOIN biblioteca.usuarios u ON p.id_usuario = u.id_usuario
WHERE p.estado = 'ACTIVO';
-- 8. Mostrar usuarios ordenados por cantidad de prestamos
SELECT u.nombre AS usuario,
    COUNT(p.id_prestamo) AS total_prestamos
FROM biblioteca.usuarios u
    LEFT JOIN biblioteca.prestamos p ON u.id_usuario = p.id_usuario
GROUP BY u.id_usuario,
    u.nombre
ORDER BY total_prestamos DESC;