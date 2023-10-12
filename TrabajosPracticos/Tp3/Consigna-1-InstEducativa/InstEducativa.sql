-- Creando tabla Alumno
CREATE TABLE Alumnos (
    Legajo INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Email VARCHAR(100)
);


-- Creando tabla Editorial
CREATE TABLE Editoriales (
    Codigo INT PRIMARY KEY,
    Nombre VARCHAR(100)
);


-- Creando tabla Libro
CREATE TABLE Libros (
    ISBN VARCHAR(13) PRIMARY KEY,
    Título VARCHAR(200),
    Editorial_ID INT,
    FOREIGN KEY (Editorial_ID) REFERENCES Editorial(Codigo)
);

-- Creando tabla Alumno_Libro (Tabla Intermedia)
CREATE TABLE Alumno_Libros (
    Alumno_Legajo INT,
    Libro_ISBN VARCHAR(13),
    FechaLectura DATE,
    PRIMARY KEY (Alumno_Legajo, Libro_ISBN),
    FOREIGN KEY (Alumno_Legajo) REFERENCES Alumno(Legajo),
    FOREIGN KEY (Libro_ISBN) REFERENCES Libro(ISBN)
);


-- Insertando datos de ejemplo en la tabla Alumno
INSERT INTO Alumnos (Legajo, Nombre, Apellido, Email)
VALUES
    (1, 'Jeremias', 'Guzman', 'jere.guzman@test.com'),
    (2, 'Marta', 'Perez', 'marta.perez@test.com'),
    (3, 'Juan', 'Rodriguez', 'juan.rod@test.com'),
    (4, 'Luis', 'Roldan', 'luis.roldan@test.com'),
    (5, 'Carlos', 'Vazquez', 'carlos.vazquez@test.com'),
    (6, 'Facundo', 'Gonzalez', 'f.gonzalez@test.com'),
    (7, 'Antonio', 'Guzman', 'anton.guzman@test.com'),
    (8, 'Luis', 'Perez', 'l.perez@test.com'),
    (9, 'Jose', 'Rodriguez', 'jose.rodriguez@test.com'),
    (10, 'Ramiro', 'Lopez', 'ram.lopez@test.com');


-- Insertando datos de ejemplo en la tabla Libro
INSERT INTO Libros (ISBN, Título, Editorial_ID)
VALUES
    ('978-1234567890', 'Libro 1', 101),
    ('978-2345678901', 'Libro 2', 102),
    ('978-3456789123', 'Libro 3', 103),
    ('978-4567891234', 'Libro 4', 104),
    ('978-5678912345', 'Libro 5', 105),
    ('978-6789123456', 'Libro 6', 106),
    ('978-7891234567', 'Libro 7', 107),
    ('978-8912345678', 'Libro 8', 108),
    ('978-9123456789', 'Libro 9', 109),
    ('978-9876543210', 'Libro 10', 110);


-- Insertando datos de ejemplo en la tabla Editorial
INSERT INTO Editoriales (Código, Nombre)
VALUES
    (101, 'Editorial A'),
    (102, 'Editorial B'),
    (103, 'Editorial C'),
    (104, 'Editorial D'),
    (105, 'Editorial E'),
    (106, 'Editorial F'),
    (107, 'Editorial G'),
    (108, 'Editorial H'),
    (109, 'Editorial I'),
    (110, 'Editorial J');

-- Insertando datos de ejemplo en la tabla Alumno_Libro
INSERT INTO Alumno_Libros (Alumno_Legajo, Libro_ISBN, FechaLectura)
VALUES
    (1, '978-1234567890', '2023-01-15'),
    (1, '978-2345678901', '2023-02-20'),
    (2, '978-3456789123', '2023-02-05'),
    (3, '978-4567891234', '2023-03-10'),
    (4, '978-5678912345', '2023-04-15'),
    (4, '978-6789123456', '2023-05-20'),
    (5, '978-7891234567', '2023-06-25'),
    (6, '978-8912345678', '2023-07-30'),
    (6, '978-9123456789', '2023-08-05'),
    (7, '978-9876543210', '2023-09-10');
