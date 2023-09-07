-- Tabla de Aviones
CREATE TABLE Aviones (
    Codigo INT PRIMARY KEY,
    Tipo VARCHAR(50),
    BaseMantenimiento VARCHAR(50)
);

-- Tabla de Pilotos
CREATE TABLE Pilotos (
    Codigo INT PRIMARY KEY,
    Nombre VARCHAR(100),
    HorasVuelo INT
);

-- Tabla Miembros de Tripulación
CREATE TABLE MiembrosTripulacion (
    Codigo INT PRIMARY KEY,
    Nombre VARCHAR(100)
);

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