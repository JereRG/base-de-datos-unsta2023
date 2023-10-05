-- Tabla Partido
CREATE TABLE Partido (
    ID INT PRIMARY KEY,
    InstanciaTorneo VARCHAR(255),
    Duracion INT,
    Fecha DATETIME,
    ArbitroPasaporte VARCHAR(20),
    EstadioNombre VARCHAR(255),
    EquipoLocalNombre VARCHAR(255),
    EquipoVisitanteNombre VARCHAR(255),
    FOREIGN KEY (ArbitroPasaporte) REFERENCES Arbitro(Pasaporte),
    FOREIGN KEY (EstadioNombre) REFERENCES Estadio(Nombre),
    FOREIGN KEY (EquipoLocalNombre) REFERENCES Equipo(Nombre),
    FOREIGN KEY (EquipoVisitanteNombre) REFERENCES Equipo(Nombre)
);

-- Tabla Árbitro
CREATE TABLE Arbitro (
    Pasaporte VARCHAR(20) PRIMARY KEY,
    PaisOrigen VARCHAR(255),
    AñoInicioActividad INT,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    ArbitroReemplazoPasaporte VARCHAR(20),
    FOREIGN KEY (ArbitroReemplazoPasaporte) REFERENCES Arbitro(Pasaporte)
);

-- Tabla Equipo
CREATE TABLE Equipo (
    NombreSeleccion VARCHAR(255) PRIMARY KEY,
    NombreDT VARCHAR(255),
    LugarEntrenamiento VARCHAR(255),
    CuerpoTecnico TEXT
);

-- Tabla Jugador
CREATE TABLE Jugador (
    NumeroCamiseta INT,
    PosicionCancha VARCHAR(255),
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    Apodo VARCHAR(255),
    EquipoNombreSeleccion VARCHAR(255),
    FOREIGN KEY (EquipoNombreSeleccion) REFERENCES Equipo(NombreSeleccion)
);

-- Tabla Estadio
CREATE TABLE Estadio (
    Nombre VARCHAR(255) PRIMARY KEY,
    Ciudad VARCHAR(255),
    CapacidadMaxima INT,
    CapacidadHabitada INT,
    CantidadPoliciaPorPartido INT
);

-- Tabla Hincha
CREATE TABLE Hincha (
    NumeroTicket INT PRIMARY KEY,
    Vestimenta VARCHAR(255),
    UbicacionZona VARCHAR(255),
    UbicacionFila INT,
    UbicacionAsiento INT,
    MedioTransporte VARCHAR(255),
    PartidoID INT,
    FOREIGN KEY (PartidoID) REFERENCES Partido(ID)
);

INSERT INTO Estadio (Nombre, Ciudad, CapacidadMaxima, CapacidadHabitada, CantidadPoliciaPorPartido) VALUES
('Estadio Nacional', 'Ciudad A', 50000, 40000, 100),
('Estadio Municipal', 'Ciudad B', 30000, 25000, 80),
('Estadio Metropolitano', 'Ciudad C', 60000, 55000, 120),
('Estadio Ciudad Deportiva', 'Ciudad D', 35000, 28000, 90),
('Estadio Olímpico', 'Ciudad E', 70000, 65000, 150);

INSERT INTO Equipo (NombreSeleccion, NombreDT, LugarEntrenamiento, CuerpoTecnico) VALUES
('Selección A', 'Director Técnico A', 'Campo de entrenamiento A', 'Cuerpo técnico A'),
('Selección B', 'Director Técnico B', 'Campo de entrenamiento B', 'Cuerpo técnico B'),
('Selección C', 'Director Técnico C', 'Campo de entrenamiento C', 'Cuerpo técnico C'),
('Selección D', 'Director Técnico D', 'Campo de entrenamiento D', 'Cuerpo técnico D'),
('Selección E', 'Director Técnico E', 'Campo de entrenamiento E', 'Cuerpo técnico E');

INSERT INTO Jugador (NumeroCamiseta, PosicionCancha, Nombre, Apellido, Apodo, EquipoNombreSeleccion) VALUES
(10, 'Delantero', 'Jugador1', 'Apellido1', 'Apodo1', 'Selección A'),
(7, 'Centrocampista', 'Jugador2', 'Apellido2', 'Apodo2', 'Selección A'),
(4, 'Defensor', 'Jugador3', 'Apellido3', 'Apodo3', 'Selección B'),
(11, 'Delantero', 'Jugador4', 'Apellido4', 'Apodo4', 'Selección B'),
(9, 'Centrocampista', 'Jugador5', 'Apellido5', 'Apodo5', 'Selección C');

INSERT INTO Arbitro (Pasaporte, PaisOrigen, AñoInicioActividad, Nombre, Apellido, ArbitroReemplazoPasaporte) VALUES
('AR123', 'Argentina', 2000, 'Arbitro1', 'Apellido1', NULL),
('BR456', 'Brasil', 2005, 'Arbitro2', 'Apellido2', 'AR123'),
('UR789', 'Uruguay', 2010, 'Arbitro3', 'Apellido3', 'BR456'),
('CH567', 'Chile', 2015, 'Arbitro4', 'Apellido4', 'AR123'),
('CO890', 'Colombia', 2018, 'Arbitro5', 'Apellido5', 'BR456');

INSERT INTO Partido (ID, InstanciaTorneo, Duracion, Fecha, ArbitroPasaporte, EstadioNombre, EquipoLocalNombre, EquipoVisitanteNombre) VALUES
(1, 'Cuartos de final', 90, '2023-10-01 15:00:00', 'AR123', 'Estadio Nacional', 'Selección A', 'Selección B'),
(2, 'Cuartos de final', 90, '2023-10-02 15:00:00', 'BR456', 'Estadio Municipal', 'Selección C', 'Selección D'),
(3, 'Semifinal', 90, '2023-10-03 15:00:00', 'UR789', 'Estadio Metropolitano', 'Selección A', 'Selección C'),
(4, 'Semifinal', 90, '2023-10-04 15:00:00', 'CH567', 'Estadio Ciudad Deportiva', 'Selección B', 'Selección D'),
(5, 'Final', 120, '2023-10-05 16:00:00', 'CO890', 'Estadio Olímpico', 'Selección A', 'Selección D');

INSERT INTO Hincha (NumeroTicket, Vestimenta, UbicacionZona, UbicacionFila, UbicacionAsiento, MedioTransporte, PartidoID) VALUES
(1, 'Camiseta roja', 'Tribuna Norte', 3, 15, 'Auto particular', 1),
(2, 'Camiseta verde', 'Tribuna Sur', 2, 10, 'Autobús', 1),
(3, 'Camiseta azul', 'Tribuna Este', 4, 20, 'Auto particular', 2),
(4, 'Camiseta amarilla', 'Tribuna Oeste', 5, 25, 'Tren', 2),
(5, 'Camiseta blanca', 'Tribuna Norte', 1, 5, 'Caminando', 3);

