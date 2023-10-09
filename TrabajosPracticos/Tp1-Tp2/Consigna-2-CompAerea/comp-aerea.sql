-- Tabla de Aviones
CREATE TABLE Aviones (
    Codigo INT PRIMARY KEY,
    Tipo VARCHAR(50),
    BaseMantenimiento VARCHAR(50)
);

INSERT INTO Aviones (Codigo, Tipo, BaseMantenimiento) VALUES
(1, 'Boeing 737', 'Aeropuerto A'),
(2, 'Airbus A320', 'Aeropuerto B'),
(3, 'Boeing 747', 'Aeropuerto C'),
(4, 'Airbus A380', 'Aeropuerto D'),
(5, 'Embraer E190', 'Aeropuerto E');


-- Tabla de Pilotos
CREATE TABLE Pilotos (
    Codigo INT PRIMARY KEY,
    Nombre VARCHAR(100),
    HorasVuelo INT
);

INSERT INTO Pilotos (Codigo, Nombre, HorasVuelo) VALUES
(1, 'Juan Pérez', 5000),
(2, 'María Rodríguez', 6000),
(3, 'Carlos Sánchez', 4500),
(4, 'Luisa Martínez', 5500),
(5, 'Pedro García', 7000);


-- Tabla Miembros de Tripulación
CREATE TABLE MiembrosTripulacion (
    Codigo INT PRIMARY KEY,
    Nombre VARCHAR(100)
);

INSERT INTO MiembrosTripulacion (Codigo, Nombre) VALUES
(1, 'Sofía Ramírez'),
(2, 'Miguel Torres'),
(3, 'Laura González'),
(4, 'Andrés López'),
(5, 'Ana Gómez');


-- Tabla Vuelos
CREATE TABLE Vuelos (
    NumeroVuelo VARCHAR(10) PRIMARY KEY,
    Origen VARCHAR(50),
    Destino VARCHAR(50),
    Hora DATETIME,
    Avion INT,
    Piloto INT,
    Miembro1 INT,
    Miembro2 INT,
    -- Agregar más miembros de la tripulación si es necesario
    FOREIGN KEY (Avion) REFERENCES Aviones(Codigo),
    FOREIGN KEY (Piloto) REFERENCES Pilotos(Codigo),
    FOREIGN KEY (Miembro1) REFERENCES MiembrosTripulacion(Codigo),
    FOREIGN KEY (Miembro2) REFERENCES MiembrosTripulacion(Codigo)
    -- Agregar más claves foráneas para otros miembros si es necesario
);

INSERT INTO Vuelos (NumeroVuelo, Origen, Destino, Hora, Avion, Piloto, Miembro1, Miembro2) VALUES
('AV001', 'Ciudad A', 'Ciudad B', '2023-10-04 08:00:00', 1, 1, 2, 3),
('AV002', 'Ciudad B', 'Ciudad C', '2023-10-04 10:30:00', 2, 2, 4, 5),
('AV003', 'Ciudad C', 'Ciudad D', '2023-10-04 13:15:00', 3, 3, 1, 2),
('AV004', 'Ciudad D', 'Ciudad E', '2023-10-04 16:45:00', 4, 4, 3, 4),
('AV005', 'Ciudad E', 'Ciudad F', '2023-10-04 19:30:00', 5, 5, 5, 1);
