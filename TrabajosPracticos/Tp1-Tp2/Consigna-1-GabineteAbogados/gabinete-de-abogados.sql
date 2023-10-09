-- Tabla Cliente
CREATE TABLE Cliente (
    DNI VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(200),
    -- Otros datos personales del cliente
);

INSERT INTO Cliente (DNI, Nombre, Direccion) VALUES
('1234567890', 'Juan Pérez', 'Calle 123, Ciudad ABC'),
('2345678901', 'María Rodríguez', 'Avenida XYZ, Ciudad DEF'),
('3456789012', 'Carlos Sánchez', 'Avenida Principal, Ciudad XYZ'),
('4567890123', 'Luisa Martínez', 'Calle Central, Ciudad LMN'),
('5678901234', 'Pedro García', 'Avenida Secundaria, Ciudad PQR');


-- Tabla Procurador
CREATE TABLE Procurador (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(200),
    -- Otros datos personales del procurador
);

INSERT INTO Procurador (ID, Nombre, Direccion) VALUES
(1, 'Pedro Gómez', 'Calle 456, Ciudad GHI'),
(2, 'Ana López', 'Calle 789, Ciudad JKL'),
(3, 'Sofía Ramírez', 'Avenida Norte, Ciudad STU'),
(4, 'Miguel Torres', 'Avenida Sur, Ciudad VWX'),
(5, 'Laura González', 'Calle Este, Ciudad YZA');


-- Tabla Asunto
CREATE TABLE Asunto (
    NumeroExpediente INT PRIMARY KEY,
    FechaInicio DATE,
    FechaArchivo DATE,
    Estado VARCHAR(50),
    DNI_Cliente VARCHAR(10), 
    FOREIGN KEY (DNI_Cliente) REFERENCES Cliente(DNI)
);

INSERT INTO Asunto (NumeroExpediente, FechaInicio, FechaArchivo, Estado, DNI_Cliente) VALUES
(1, '2023-01-15', '2023-01-20', 'En proceso', '1234567890'),
(2, '2023-02-10', '2023-02-15', 'Cerrado', '2345678901'),
(3, '2023-03-05', '2023-03-10', 'En proceso', '3456789012'),
(4, '2023-04-20', '2023-04-25', 'Abierto', '4567890123'),
(5, '2023-05-12', '2023-05-18', 'Cerrado', '5678901234');


-- Tabla de relación Asunto_Procurador
CREATE TABLE Asunto_Procurador (
    NumeroExpediente INT,
    ID_Procurador INT,
    PRIMARY KEY (NumeroExpediente, ID_Procurador),
    FOREIGN KEY (NumeroExpediente) REFERENCES Asunto(NumeroExpediente),
    FOREIGN KEY (ID_Procurador) REFERENCES Procurador(ID)
);

INSERT INTO Asunto_Procurador (NumeroExpediente, ID_Procurador) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
