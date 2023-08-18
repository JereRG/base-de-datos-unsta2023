-- Tabla de Modelo
CREATE TABLE Marca (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255)
);

-- Tabla de Modelo
CREATE TABLE Modelo (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Marca_ID INT,
    FOREIGN KEY (Marca_ID) REFERENCES Marca(ID)
);

-- Tabla de Caracteristicas
CREATE TABLE Caracteristicas (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255)
);

-- Tabla de Equipamiento de Serie
CREATE TABLE EquipamientoDeSerie (
    ID INT PRIMARY KEY,
    Modelo_ID INT,
    Caracteristicas_ID INT,
    FOREIGN KEY (Modelo_ID) REFERENCES Modelo(ID),
    FOREIGN KEY (Caracteristicas_ID) REFERENCES Caracteristicas(ID)
);

-- Tabla de Extra
CREATE TABLE Extra (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Precio DECIMAL(10, 2)
);

-- Tabla de Modelo Extra
CREATE TABLE Modelo_Extra (
    ID INT PRIMARY KEY,
    Modelo_ID INT,
    Extra_ID INT,
    Precio_Extra DECIMAL(10, 2),
    FOREIGN KEY (Modelo_ID) REFERENCES Modelo(ID),
    FOREIGN KEY (Extra_ID) REFERENCES Extra(ID)
);

-- Tabla de Automovi
CREATE TABLE Automovil (
    NumeroBastidor VARCHAR(255) PRIMARY KEY,
    Modelo_ID INT,
    Precio DECIMAL(10, 2),
    Descuento DECIMAL(10, 2),
    Potencia INT,
    Cilindrada DECIMAL(5, 2),
    -- Otro datos técnicos
    FOREIGN KEY (Modelo_ID) REFERENCES Modelo(ID)
);

-- Tabla de Concesionario 
CREATE TABLE Concesionario (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255)
);

-- Tabla de Servicio Oficial
CREATE TABLE ServicioOficial (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Domicilio VARCHAR(255),
    CUIT VARCHAR(20),
    Concesionario_ID INT,
    FOREIGN KEY (Concesionario_ID) REFERENCES Concesionario(ID)
);

-- Tabla de Vendedor
CREATE TABLE Vendedor (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    DNI VARCHAR(20),
    Domicilio VARCHAR(255)
);

-- Tabla de Venta
CREATE TABLE Venta (
    ID INT PRIMARY KEY,
    Automovil_NumeroBastidor VARCHAR(255),
    Vendedor_ID INT,
    PrecioCobrado DECIMAL(10, 2),
    ModoPago VARCHAR(50),
    FechaEntrega DATE,
    Matricula VARCHAR(20),
    EsDeStock BOOLEAN,
    EncargadoAFabrica BOOLEAN,
    FOREIGN KEY (Automovil_NumeroBastidor) REFERENCES Automovil(NumeroBastidor),
    FOREIGN KEY (Vendedor_ID) REFERENCES Vendedor(ID)
);

-- Tabla de Venta Extra
CREATE TABLE Venta_Extra (
    ID INT PRIMARY KEY,
    Venta_ID INT,
    Extra_ID INT,
    Precio_Extra DECIMAL(10, 2),
    FOREIGN KEY (Venta_ID) REFERENCES Venta(ID),
    FOREIGN KEY (Extra_ID) REFERENCES Extra(ID)
);