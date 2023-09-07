-- Tabla Cliente
CREATE TABLE Cliente (
    DNI VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(200),
    -- Otros datos personales del cliente
);

-- Tabla Procurador
CREATE TABLE Procurador (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(200),
    -- Otros datos personales del procurador
);

-- Tabla Asunto
CREATE TABLE Asunto (
    NumeroExpediente INT PRIMARY KEY,
    FechaInicio DATE,
    FechaArchivo DATE,
    Estado VARCHAR(50),
    DNI_Cliente VARCHAR(10), 
    FOREIGN KEY (DNI_Cliente) REFERENCES Cliente(DNI)
);

-- Tabla de relación Asunto_Procurador
CREATE TABLE Asunto_Procurador (
    NumeroExpediente INT,
    ID_Procurador INT,
    PRIMARY KEY (NumeroExpediente, ID_Procurador),
    FOREIGN KEY (NumeroExpediente) REFERENCES Asunto(NumeroExpediente),
    FOREIGN KEY (ID_Procurador) REFERENCES Procurador(ID)
);