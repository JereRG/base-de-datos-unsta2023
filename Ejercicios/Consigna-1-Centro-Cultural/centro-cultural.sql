-- Tabla Época
CREATE TABLE Epoca (
    Nombre VARCHAR(255) PRIMARY KEY,
    Caracteristicas TEXT,
    AñoComienzo INT,
    AñoFinal INT
);

-- Tabla Género Musical
CREATE TABLE GeneroMusical (
    Nombre VARCHAR(255) PRIMARY KEY,
    Caracteristicas TEXT,
    Origenes TEXT,
    EpocaNombre VARCHAR(255),
    FOREIGN KEY (EpocaNombre) REFERENCES Epoca(Nombre)
);

-- Tabla Músico
CREATE TABLE Musico (
    Nombre VARCHAR(255) PRIMARY KEY,
    FechaNacimiento DATE,
    FechaMuerte DATE,
    HistoriaVida TEXT,
    GeneroMusicalNombre VARCHAR(255),
    FOREIGN KEY (GeneroMusicalNombre) REFERENCES GeneroMusical(Nombre)
);

-- Tabla Instrumento Musical
CREATE TABLE InstrumentoMusical (
    Nombre VARCHAR(255) PRIMARY KEY,
    Foto BLOB,  -- Suponemos que se almacena la foto como datos binarios
    LugarCreacion VARCHAR(255),
    Creador VARCHAR(255),
    TipoInstrumento VARCHAR(50),
    Materiales TEXT
);

-- Tabla para la relación muchos a muchos entre Género Musical e Instrumento Musical
CREATE TABLE GeneroInstrumento (
    GeneroMusicalNombre VARCHAR(255),
    InstrumentoMusicalNombre VARCHAR(255),
    PRIMARY KEY (GeneroMusicalNombre, InstrumentoMusicalNombre),
    FOREIGN KEY (GeneroMusicalNombre) REFERENCES GeneroMusical(Nombre),
    FOREIGN KEY (InstrumentoMusicalNombre) REFERENCES InstrumentoMusical(Nombre)
);

-- Tabla Obra Famosa
CREATE TABLE ObraFamosa (
    Nombre VARCHAR(255) PRIMARY KEY,
    AñoCreacion INT,
    Partitura BLOB,  -- Suponemos que se almacena la partitura como datos binarios
    GeneroMusicalNombre VARCHAR(255),
    FOREIGN KEY (GeneroMusicalNombre) REFERENCES GeneroMusical(Nombre)
);

-- Tabla para la relación muchos a muchos entre Músico y Obra Famosa
CREATE TABLE MusicoObraFamosa (
    MusicoNombre VARCHAR(255),
    ObraFamosaNombre VARCHAR(255),
    PRIMARY KEY (MusicoNombre, ObraFamosaNombre),
    FOREIGN KEY (MusicoNombre) REFERENCES Musico(Nombre),
    FOREIGN KEY (ObraFamosaNombre) REFERENCES ObraFamosa(Nombre)
);
