-- EJERCICIO 03 — INTEGRIDAD REFERENCIAL

-- Actividad 1: insertar profesor con id_departamento inexistente
INSERT INTO academia.profesores (id_departamento, nombre, correo)
VALUES (999, 'Profesor Inválido', 'invalido@correo.com');

-- Actividad 2: resultado esperado:
-- ERROR: insert or update on table "profesores" violates foreign key constraint
-- DETAIL: Key (id_departamento)=(999) is not present in table "departamentos".

-- Actividad 3: intentar eliminar un departamento con profesores
DELETE FROM academia.departamentos
WHERE nombre = 'Matemáticas';

-- Actividad 4: resultado esperado:
-- ERROR: update or delete on table "departamentos" violates foreign key constraint
-- DETAIL: Key (id_departamento)=(1) is still referenced from table "profesores".
-- PostgreSQL bloquea porque ON DELETE RESTRICT no permite borrar el padre
-- si existen hijos que lo referencian.

-- Actividad 5: cambiar temporalmente a ON DELETE CASCADE y analizar el riesgo
ALTER TABLE academia.profesores DROP CONSTRAINT fk_profesor_departamento;

ALTER TABLE academia.profesores
    ADD CONSTRAINT fk_profesor_departamento
        FOREIGN KEY (id_departamento)
        REFERENCES academia.departamentos(id_departamento)
        ON DELETE CASCADE
        ON UPDATE CASCADE;

-- Ahora sí permite borrar — y elimina los profesores en cascada
DELETE FROM academia.departamentos WHERE nombre = 'Matemáticas';

SELECT * FROM academia.profesores;
-- Carlos Ramírez y Andrés Salinas ya no aparecen

-- Riesgo: CASCADE borra los hijos sin advertencia, se puede perder información.
-- RESTRICT es más seguro porque obliga a manejar los hijos antes de borrar el padre.

-- Restaurar a RESTRICT
ALTER TABLE academia.profesores DROP CONSTRAINT fk_profesor_departamento;

ALTER TABLE academia.profesores
    ADD CONSTRAINT fk_profesor_departamento
        FOREIGN KEY (id_departamento)
        REFERENCES academia.departamentos(id_departamento)
        ON DELETE RESTRICT
        ON UPDATE CASCADE;
