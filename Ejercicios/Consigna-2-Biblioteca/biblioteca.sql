-- Tabla Libro
CREATE TABLE Libro (
    Titulo VARCHAR(255) PRIMARY KEY,
    Genero VARCHAR(255)
);

-- Tabla Autor
CREATE TABLE Autor (
    Nombre VARCHAR(255) PRIMARY KEY,
    Nacionalidad VARCHAR(255),
    AñoNacimiento INT
);

-- Tabla Reseña
CREATE TABLE Reseña (
    Revista VARCHAR(255),
    Fecha DATE,
    TextoDescriptivo TEXT,
    LibroTitulo VARCHAR(255),
    FOREIGN KEY (LibroTitulo) REFERENCES Libro(Titulo)
);

-- Tabla Edición
CREATE TABLE Edicion (
    Año INT,
    ISBN VARCHAR(255) PRIMARY KEY,
    Idioma VARCHAR(255),
    LibroTitulo VARCHAR(255),
    FOREIGN KEY (LibroTitulo) REFERENCES Libro(Titulo)
);

-- Tabla Copia
CREATE TABLE Copia (
    Numero INT PRIMARY KEY,
    EdicionISBN VARCHAR(255),
    FOREIGN KEY (EdicionISBN) REFERENCES Edicion(ISBN)
);

-- Tabla Usuario
CREATE TABLE Usuario (
    DNI VARCHAR(20) PRIMARY KEY,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    Email VARCHAR(255)
);

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
