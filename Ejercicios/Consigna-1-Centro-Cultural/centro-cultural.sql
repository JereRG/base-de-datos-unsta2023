-- Tabla Época
CREATE TABLE Epoca (
    Nombre VARCHAR(255) PRIMARY KEY,
    Caracteristicas TEXT,
    AñoComienzo INT,
    AñoFinal INT
);

INSERT INTO Epoca (Nombre, Caracteristicas, AñoComienzo, AñoFinal) VALUES
('Renacimiento', 'Renacimiento es conocida por su énfasis en el arte y la cultura clásica. Fue un período de gran innovación artística.', 1400, 1600),
('Barroco', 'El barroco se caracteriza por su estilo ornamental, drama y exuberancia en la música y las artes visuales.', 1600, 1750),
('Clásica', 'La música clásica es conocida por su equilibrio y proporción. Compositores como Mozart y Haydn son representativos de esta época.', 1730, 1820),
('Romántica', 'El romanticismo en la música se caracteriza por su expresión emocional y pasión. Beethoven y Chopin son ejemplos destacados.', 1780, 1910),
('Contemporánea', 'La música contemporánea abarca una amplia variedad de estilos, desde la música experimental hasta la música minimalista.', 1900, 2023);


-- Tabla Género Musical
CREATE TABLE GeneroMusical (
    Nombre VARCHAR(255) PRIMARY KEY,
    Caracteristicas TEXT,
    Origenes TEXT,
    EpocaNombre VARCHAR(255),
    FOREIGN KEY (EpocaNombre) REFERENCES Epoca(Nombre)
);

INSERT INTO GeneroMusical (Nombre, Caracteristicas, Origenes, EpocaNombre) VALUES
('Ópera', 'La ópera es un género musical que combina música y drama. Se originó en Italia en el siglo XVI.', 'Italia', 'Renacimiento'),
('Música Barroca', 'La música barroca es rica en ornamentación y contrapunto. Bach y Vivaldi son compositores destacados.', 'Europa', 'Barroco'),
('Música Clásica', 'La música clásica se caracteriza por su estructura y equilibrio. Mozart y Haydn son exponentes destacados.', 'Europa', 'Clásica'),
('Música Romántica', 'La música romántica se enfoca en la expresión emocional. Beethoven y Chopin son figuras influyentes.', 'Europa', 'Romántica'),
('Música Experimental', 'La música experimental busca nuevas formas de expresión. Surgió en el siglo XX.', 'Diversos', 'Contemporánea');


-- Tabla Músico
CREATE TABLE Musico (
    Nombre VARCHAR(255) PRIMARY KEY,
    FechaNacimiento DATE,
    FechaMuerte DATE,
    HistoriaVida TEXT,
    GeneroMusicalNombre VARCHAR(255),
    FOREIGN KEY (GeneroMusicalNombre) REFERENCES GeneroMusical(Nombre)
);

INSERT INTO Musico (Nombre, FechaNacimiento, FechaMuerte, HistoriaVida, GeneroMusicalNombre) VALUES
('Wolfgang Amadeus Mozart', '1756-01-27', '1791-12-05', 'Mozart fue un prolífico compositor y músico clásico.', 'Música Clásica'),
('Ludwig van Beethoven', '1770-12-17', '1827-03-26', 'Beethoven es uno de los compositores más influyentes de la música romántica.', 'Música Romántica'),
('Johann Sebastian Bach', '1685-03-21', '1750-07-28', 'Bach es conocido por sus obras barrocas y su destreza como organista.', 'Música Barroca'),
('Giuseppe Verdi', '1813-10-09', '1901-01-27', 'Verdi fue un destacado compositor de ópera italiana en el siglo XIX.', 'Ópera'),
('John Cage', '1912-09-05', '1992-08-12', 'Cage fue un influyente compositor experimental del siglo XX.', 'Música Experimental');


-- Tabla Instrumento Musical
CREATE TABLE InstrumentoMusical (
    Nombre VARCHAR(255) PRIMARY KEY,
    Foto BLOB,  -- Suponemos que se almacena la foto como datos binarios
    LugarCreacion VARCHAR(255),
    Creador VARCHAR(255),
    TipoInstrumento VARCHAR(50),
    Materiales TEXT
);

-- Supongamos que estamos agregando información sobre pianos
INSERT INTO InstrumentoMusical (Nombre, Foto, LugarCreacion, Creador, TipoInstrumento, Materiales) VALUES
('Piano de cola Steinway', NULL, 'Hamburgo', 'Henry E. Steinway', 'Piano de cola', 'Madera, cuerdas de acero'),
('Piano vertical Yamaha', NULL, 'Hamamatsu', 'Torakusu Yamaha', 'Piano vertical', 'Madera, cuerdas de acero'),
('Piano de concierto Bösendorfer', NULL, 'Viena', 'Ignaz Bösendorfer', 'Piano de concierto', 'Madera, cuerdas de acero'),
('Clavecín Ruckers', NULL, 'Amberes', 'Hans Ruckers', 'Clavecín', 'Madera, cuerdas de tripa'),
('Sintetizador Moog', NULL, 'Nueva York', 'Robert Moog', 'Sintetizador', 'Componentes electrónicos');


-- Tabla para la relación muchos a muchos entre Género Musical e Instrumento Musical
CREATE TABLE GeneroInstrumento (
    GeneroMusicalNombre VARCHAR(255),
    InstrumentoMusicalNombre VARCHAR(255),
    PRIMARY KEY (GeneroMusicalNombre, InstrumentoMusicalNombre),
    FOREIGN KEY (GeneroMusicalNombre) REFERENCES GeneroMusical(Nombre),
    FOREIGN KEY (InstrumentoMusicalNombre) REFERENCES InstrumentoMusical(Nombre)
);

-- Supongamos que estamos relacionando géneros musicales con instrumentos musicales
INSERT INTO GeneroInstrumento (GeneroMusicalNombre, InstrumentoMusicalNombre) VALUES
('Música Clásica', 'Piano de cola Steinway'),
('Música Clásica', 'Clavecín Ruckers'),
('Música Romántica', 'Piano de cola Steinway'),
('Ópera', 'Piano de concierto Bösendorfer'),
('Música Experimental', 'Sintetizador Moog');


-- Tabla Obra Famosa
CREATE TABLE ObraFamosa (
    Nombre VARCHAR(255) PRIMARY KEY,
    AñoCreacion INT,
    Partitura BLOB,  -- Suponemos que se almacena la partitura como datos binarios
    GeneroMusicalNombre VARCHAR(255),
    FOREIGN KEY (GeneroMusicalNombre) REFERENCES GeneroMusical(Nombre)
);

INSERT INTO ObraFamosa (Nombre, AñoCreacion, Partitura, GeneroMusicalNombre) VALUES
('Réquiem de Mozart', 1791, NULL, 'Música Clásica'),
('Sonata para piano No. 14 "Claro de luna" de Beethoven', 1801, NULL, 'Música Romántica'),
('Concierto de Brandeburgo No. 3 de Bach', 1721, NULL, 'Música Barroca'),
('La Traviata de Verdi', 1853, NULL, 'Ópera'),
('4\33 de John Cage', 1952, NULL, 'Música Experimental');


-- Tabla para la relación muchos a muchos entre Músico y Obra Famosa
CREATE TABLE MusicoObraFamosa (
    MusicoNombre VARCHAR(255),
    ObraFamosaNombre VARCHAR(255),
    PRIMARY KEY (MusicoNombre, ObraFamosaNombre),
    FOREIGN KEY (MusicoNombre) REFERENCES Musico(Nombre),
    FOREIGN KEY (ObraFamosaNombre) REFERENCES ObraFamosa(Nombre)
);

-- Supongamos que estamos relacionando músicos con obras famosas
INSERT INTO MusicoObraFamosa (MusicoNombre, ObraFamosaNombre) VALUES
('Wolfgang Amadeus Mozart', 'Réquiem de Mozart'),
('Ludwig van Beethoven', 'Sonata para piano No. 14 "Claro de luna" de Beethoven'),
('Johann Sebastian Bach', 'Concierto de Brandeburgo No. 3 de Bach'),
('Giuseppe Verdi', 'La Traviata de Verdi'),
('John Cage', '4\33 de John Cage');

