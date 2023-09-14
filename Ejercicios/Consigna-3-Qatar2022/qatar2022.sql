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
