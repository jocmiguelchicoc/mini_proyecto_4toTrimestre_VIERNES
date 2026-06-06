CREATE SCHEMA IF NOT EXISTS academia;

CREATE TABLE academia.estudiantes (
    id_estudiante SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    fecha_registro DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE academia.cursos (
    id_curso SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    creditos INT NOT NULL CHECK (creditos > 0)
);

-- UN ESTUDIANTE PUEDE ESTAR EN VARIOS CURSOS
-- ESTA TABLA CONECTA LOS ESTUDIANTES CON LOS CURSOS

CREATE TABLE academia.matriculas (
    id_matricula SERIAL PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_curso INT NOT NULL,
    fecha_matricula DATE NOT NULL DEFAULT CURRENT_DATE,

    /* constraints para mantener la integridad referencial
       entre las tablas estudiantes y cursos */
    CONSTRAINT fk_estudiante FOREIGN KEY (id_estudiante)
        REFERENCES academia.estudiantes(id_estudiante) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_curso FOREIGN KEY (id_curso)
        REFERENCES academia.cursos(id_curso) ON DELETE CASCADE ON UPDATE CASCADE
);

-- indices
CREATE INDEX idx_estudiantes_correo ON academia.estudiantes(correo);
CREATE INDEX idx_cursos_codigo ON academia.cursos(codigo);
CREATE INDEX idx_matriculas_estudiante ON academia.matriculas(id_estudiante);

INSERT INTO academia.estudiantes (nombre, correo) VALUES
('juan perez', 'juan12354@gmail.com'),
('ana maria', 'ana54@gmail.com'),
('pepito', 'pepito4@gmail.com');

INSERT INTO academia.cursos (nombre, codigo, creditos) VALUES
('Matematicas', 'MAT101', 4),
('Historia', 'HIS201', 3),
('Programacion', 'PRO301', 5);

/* ejemplo de matriculas: (1,1) significa que el estudiante con id 1
   esta matriculado en el curso con id 1 */
INSERT INTO academia.matriculas (id_estudiante, id_curso) VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 1),
(3, 2),
(3, 3);





