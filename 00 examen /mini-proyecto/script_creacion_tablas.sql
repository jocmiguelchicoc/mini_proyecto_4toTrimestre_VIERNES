DROP SCHEMA IF EXISTS biblioteca CASCADE;
CREATE SCHEMA IF NOT EXISTS biblioteca;
-- TABLA 1: categorias
CREATE TABLE biblioteca.categorias(
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR (100) NOT NULL UNIQUE
);

-- TABLA 2: autores        el autor puede tener varios libros pero aqui hacemos que se guarde solo una vez 

CREATE TABLE biblioteca.autores (
    id_autor     SERIAL PRIMARY KEY,
    nombre       VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(60)
);

-- TABLA 3: usuarios

CREATE TABLE biblioteca.usuarios(
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR (100) NOT NULL,
    correo VARCHAR (150) NOT NULL UNIQUE,
    telefono VARCHAR(15) NOT NULL,
    fecha_registro DATE NOT NULL DEFAULT CURRENT_DATE
);

-- TABLA 4: libros           esta tabla siempre va a depender de categorias y autores)

CREATE TABLE biblioteca.libros(
    id_libro SERIAL PRIMARY KEY,
    titulo VARCHAR (200) NOT NULL,
    isbn VARCHAR (25) NOT NULL UNIQUE,
    id_autor INT NOT NULL,
    id_categoria INT NOT NULL,


       CONSTRAINT fk_autor     FOREIGN KEY (id_autor)     REFERENCES biblioteca.autores(id_autor)     ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fk_categoria FOREIGN KEY (id_categoria) REFERENCES biblioteca.categorias(id_categoria) ON DELETE CASCADE ON UPDATE CASCADE
);

-- TABLA 5: prestamos         esta tabla siempre va a depender de usuarios y libros
CREATE TABLE biblioteca.prestamos (
    id_prestamo SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_libro INT NOT NULL,
    fecha_prestamo DATE NOT NULL DEFAULT CURRENT_DATE,
    fecha_devolucion_esperada DATE NOT NULL,
    fecha_devolucion_real DATE,
    estado VARCHAR(50) NOT NULL DEFAULT 'ACTIVO',



       CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES biblioteca.usuarios(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fk_libro   FOREIGN KEY (id_libro)   REFERENCES biblioteca.libros(id_libro)   ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT chk_fechas CHECK (fecha_devolucion_esperada >= fecha_prestamo),      -- >= La fecha de devolución debe ser igual o después de la fecha del préstamo
       CONSTRAINT chk_estado CHECK (estado IN ('ACTIVO', 'DEVUELTO', 'VENCIDO'))
);

