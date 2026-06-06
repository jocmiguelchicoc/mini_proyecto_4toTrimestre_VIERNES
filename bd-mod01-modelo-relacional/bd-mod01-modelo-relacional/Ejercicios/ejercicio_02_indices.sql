-- EJERCICIO 02 — ÍNDICES

-- EXPLAIN antes del índice
EXPLAIN
SELECT *
FROM academia.profesores
WHERE correo = 'c.ramirez@academia.edu';

-- Requisito 1: índice sobre correo de profesores
CREATE INDEX idx_profesores_correo
ON academia.profesores(correo);

-- Requisito 2: índice sobre nombre del departamento
CREATE INDEX idx_departamentos_nombre
ON academia.departamentos(nombre);

-- EXPLAIN después del índice
EXPLAIN
SELECT *
FROM academia.profesores
WHERE correo = 'c.ramirez@academia.edu';

EXPLAIN
SELECT *
FROM academia.departamentos
WHERE nombre = 'Matemáticas';

-- Requisito 5: ¿en qué columnas conviene crear índices?
-- En columnas usadas frecuentemente en WHERE, JOIN y ORDER BY.
-- No conviene en columnas que cambian constantemente porque
-- el índice debe actualizarse en cada cambio y genera costo extra.
