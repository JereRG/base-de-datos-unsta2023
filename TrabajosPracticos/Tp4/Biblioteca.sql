-- Creando tabla Editorial
CREATE TABLE Editoriales (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Insertando datos en Editorial
INSERT INTO Editoriales (codigo, nombre)
VALUES
    (1, 'Editorial 11'),
    (2, 'Editorial 22'),
    (3, 'Editorial 33');

-- Creando tabla Libros
CREATE TABLE Libros (
    ISBN VARCHAR(13) PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    editorial_codigo INT,
    FOREIGN KEY (editorial_codigo) REFERENCES Editorial(codigo)
);

-- Insertando datos en Libros
INSERT INTO Libros (ISBN, titulo, editorial_codigo)
VALUES
    ('1234567890123', 'Libro 11', 1),
    ('2345678901234', 'Libro 22', 2),
    ('3456789012345', 'Libro 33', 3);

-- Creando tabla Alumnos
CREATE TABLE Alumnos (
    legajo INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- Insertando datos en Alumnos
INSERT INTO Alumnos (legajo, nombre, apellido, email)
VALUES
    (1, 'Jeremias', 'Guzman', 'jererg@test1.com'),
    (2, 'Facundo', 'Zottoli', 'zotto@test2.com'),
    (3, 'Carlos', 'Paradi', 'pala@test3.com');
