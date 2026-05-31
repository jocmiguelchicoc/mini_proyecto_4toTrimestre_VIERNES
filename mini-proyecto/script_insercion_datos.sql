-- CATEGORIAS
INSERT INTO biblioteca.categorias (nombre) VALUES
    ('Poesia'),
    ('Novela'),
    ('Cuento'),
    ('Ensayo'),
    ('Literatura');

-- AUTORES
INSERT INTO biblioteca.autores (nombre, nacionalidad) VALUES
    ('Charles Bukowski',      'Estadounidense'),
    ('Jaime Sabines',         'Mexicano'),
    ('Octavio Paz',           'Mexicano'),
    ('Gabriel Garcia Marquez','Colombiano'),
    ('Julio Cortazar',        'Argentino');

-- USUARIOS
INSERT INTO biblioteca.usuarios (nombre, correo, telefono) VALUES
    ('Andres Felipe Castillo Moreno',  'andres.castillo@gmail.com',  '3001234567'),
    ('Valentina Ospina Herrera',       'vale.ospina@gmail.com',      '3112345678'),
    ('Santiago Vargas Bernal',         'svargas@gmail.com',          '3204567890'),
    ('Daniela Cifuentes Roa',          'dani.cifuentes@gmail.com',   '3156789012'),
    ('Juan David Pardo Acosta',        'juanpardo@gmail.com',        '3008901234');


-- LIBROS
INSERT INTO biblioteca.libros (titulo, isbn, id_autor, id_categoria) VALUES
    ('Post Office',                          '978-0-87685-208-8', 1, 2),
    ('Mujeres',                              '978-0-87685-390-0', 1, 2),
    ('Tarumba',                              '978-968-16-0782-5', 2, 1),
    ('Los amorosos',                         '978-968-16-1010-8', 2, 1),
    ('El laberinto de la soledad',           '978-968-16-0007-9', 3, 4),
    ('Piedra de sol',                        '978-968-16-3430-2', 3, 1),
    ('Cien anos de soledad',                 '978-0-06-088328-7', 4, 2),
    ('El amor en los tiempos del colera',    '978-0-307-38987-6', 4, 2),
    ('Rayuela',                              '978-84-376-0494-7', 5, 2),
    ('Bestiario',                            '978-84-376-0200-4', 5, 3);

-- PRESTAMOS
INSERT INTO biblioteca.prestamos (id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, estado) VALUES
    (1, 7,  '2026-05-01', '2026-05-15', 'DEVUELTO'),
    (2, 9,  '2026-05-10', '2026-05-24', 'ACTIVO'),
    (3, 3,  '2026-05-12', '2026-05-26', 'ACTIVO'),
    (1, 5,  '2026-04-20', '2026-05-04', 'VENCIDO'),
    (4, 1,  '2026-05-20', '2026-06-03', 'ACTIVO'),
    (5, 10, '2026-05-15', '2026-05-22', 'DEVUELTO'),
    (2, 8,  '2026-05-25', '2026-06-08', 'ACTIVO'),
    (3, 6,  '2026-04-10', '2026-04-24', 'VENCIDO'),
    (5, 4,  '2026-05-28', '2026-06-11', 'ACTIVO');

-- Fecha real de devolucion para prestamos DEVUELTOS
UPDATE biblioteca.prestamos SET fecha_devolucion_real = '2026-05-14' WHERE id_prestamo = 1;
UPDATE biblioteca.prestamos SET fecha_devolucion_real = '2026-05-21' WHERE id_prestamo = 6;
