-- Tabla Libro
CREATE TABLE Libro (
    Titulo VARCHAR(255) PRIMARY KEY,
    Genero VARCHAR(255)
);

INSERT INTO Libro (Titulo, Genero) VALUES
('Cien años de soledad', 'Realismo mágico'),
('1984', 'Ciencia ficción'),
('El Gran Gatsby', 'Novela'),
('Orgullo y prejuicio', 'Novela'),
('Matar un ruiseñor', 'Novela');


-- Tabla Autor
CREATE TABLE Autor (
    Nombre VARCHAR(255) PRIMARY KEY,
    Nacionalidad VARCHAR(255),
    AñoNacimiento INT
);

INSERT INTO Autor (Nombre, Nacionalidad, AñoNacimiento) VALUES
('Gabriel García Márquez', 'Colombiana', 1927),
('George Orwell', 'Británica', 1903),
('F. Scott Fitzgerald', 'Estadounidense', 1896),
('Jane Austen', 'Británica', 1775),
('Harper Lee', 'Estadounidense', 1926);


-- Tabla Reseña
CREATE TABLE Reseña (
    Revista VARCHAR(255),
    Fecha DATE,
    TextoDescriptivo TEXT,
    LibroTitulo VARCHAR(255),
    FOREIGN KEY (LibroTitulo) REFERENCES Libro(Titulo)
);

INSERT INTO Reseña (Revista, Fecha, TextoDescriptivo, LibroTitulo) VALUES
('New York Times Book Review', '2023-10-01', 'Una obra maestra de la literatura latinoamericana.', 'Cien años de soledad'),
('The Guardian', '2023-09-15', 'Un clásico distópico que sigue siendo relevante hoy.', '1984'),
('The New Yorker', '2023-08-20', 'Una historia de decadencia y extravagancia en la era del jazz.', 'El Gran Gatsby'),
('The Times', '2023-07-05', 'Una novela de amor y sociedad en la Inglaterra del siglo XIX.', 'Orgullo y prejuicio'),
('Los Angeles Times', '2023-06-10', 'Un relato conmovedor sobre raza e injusticia en el sur de los Estados Unidos.', 'Matar un ruiseñor');


-- Tabla Edición
CREATE TABLE Edicion (
    Año INT,
    ISBN VARCHAR(255) PRIMARY KEY,
    Idioma VARCHAR(255),
    LibroTitulo VARCHAR(255),
    FOREIGN KEY (LibroTitulo) REFERENCES Libro(Titulo)
);

INSERT INTO Edicion (Año, ISBN, Idioma, LibroTitulo) VALUES
(2023, '978-0-446-32832-2', 'Español', 'Cien años de soledad'),
(2023, '978-0451524935', 'Inglés', '1984'),
(2023, '978-0743273565', 'Inglés', 'El Gran Gatsby'),
(2023, '978-0141439518', 'Inglés', 'Orgullo y prejuicio'),
(2023, '978-0061120084', 'Inglés', 'Matar un ruiseñor');


-- Tabla Copia
CREATE TABLE Copia (
    Numero INT PRIMARY KEY,
    EdicionISBN VARCHAR(255),
    FOREIGN KEY (EdicionISBN) REFERENCES Edicion(ISBN)
);

INSERT INTO Copia (Numero, EdicionISBN) VALUES
(1, '978-0-446-32832-2'),
(2, '978-0451524935'),
(3, '978-0743273565'),
(4, '978-0141439518'),
(5, '978-0061120084');


-- Tabla Usuario
CREATE TABLE Usuario (
    DNI VARCHAR(20) PRIMARY KEY,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    Email VARCHAR(255)
);

INSERT INTO Usuario (DNI, Nombre, Apellido, Email) VALUES
('1234567890', 'Juan', 'Pérez', 'juanperez@example.com'),
('2345678901', 'María', 'Rodríguez', 'mariarodriguez@example.com'),
('3456789012', 'Carlos', 'Sánchez', 'carlossanchez@example.com'),
('4567890123', 'Luisa', 'Martínez', 'luisamartinez@example.com'),
('5678901234', 'Pedro', 'García', 'pedrogarcia@example.com');


-- Tabla Préstamo
CREATE TABLE Prestamo (
    FechaPrestamo DATE,
    FechaDevolucion DATE,
    CopiaNumero INT,
    UsuarioDNI VARCHAR(20),
    PRIMARY KEY (FechaPrestamo, CopiaNumero),
    FOREIGN KEY (CopiaNumero) REFERENCES Copia(Numero),
    FOREIGN KEY (UsuarioDNI) REFERENCES Usuario(DNI)
);

INSERT INTO Prestamo (FechaPrestamo, FechaDevolucion, CopiaNumero, UsuarioDNI) VALUES
('2023-09-01', '2023-09-15', 1, '1234567890'),
('2023-09-05', '2023-09-20', 2, '2345678901'),
('2023-09-10', '2023-09-25', 3, '3456789012'),
('2023-09-15', '2023-09-30', 4, '4567890123'),
('2023-09-20', '2023-10-05', 5, '5678901234');

