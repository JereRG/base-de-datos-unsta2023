-- Tabla de Modelo
CREATE TABLE Marca (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255)
);

INSERT INTO Marca (ID, Nombre) VALUES
(1, 'Toyota'),
(2, 'Ford'),
(3, 'Honda'),
(4, 'Volkswagen'),
(5, 'Chevrolet');


-- Tabla de Modelo
CREATE TABLE Modelo (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Marca_ID INT,
    FOREIGN KEY (Marca_ID) REFERENCES Marca(ID)
);

INSERT INTO Modelo (ID, Nombre, Marca_ID) VALUES
(1, 'Camry', 1),
(2, 'F-150', 2),
(3, 'Civic', 3),
(4, 'Jetta', 4),
(5, 'Malibu', 5);


-- Tabla de Caracteristicas
CREATE TABLE Caracteristicas (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255)
);

INSERT INTO Caracteristicas (ID, Nombre) VALUES
(1, 'Aire acondicionado'),
(2, 'Sistema de navegación GPS'),
(3, 'Asientos de cuero'),
(4, 'Techo solar'),
(5, 'Cámara de retroceso');


-- Tabla de Equipamiento de Serie
CREATE TABLE EquipamientoDeSerie (
    ID INT PRIMARY KEY,
    Modelo_ID INT,
    Caracteristicas_ID INT,
    FOREIGN KEY (Modelo_ID) REFERENCES Modelo(ID),
    FOREIGN KEY (Caracteristicas_ID) REFERENCES Caracteristicas(ID)
);

INSERT INTO EquipamientoDeSerie (ID, Modelo_ID, Caracteristicas_ID) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 3),
(5, 5, 4);


-- Tabla de Extra
CREATE TABLE Extra (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Precio DECIMAL(10, 2)
);

INSERT INTO Extra (ID, Nombre, Precio) VALUES
(1, 'Llantas de aleación', 500.00),
(2, 'Sistema de sonido premium', 1000.00),
(3, 'Paquete de seguridad avanzada', 800.00),
(4, 'Pintura metálica', 300.00),
(5, 'Asientos con calefacción', 600.00);


-- Tabla de Modelo Extra
CREATE TABLE Modelo_Extra (
    ID INT PRIMARY KEY,
    Modelo_ID INT,
    Extra_ID INT,
    Precio_Extra DECIMAL(10, 2),
    FOREIGN KEY (Modelo_ID) REFERENCES Modelo(ID),
    FOREIGN KEY (Extra_ID) REFERENCES Extra(ID)
);

INSERT INTO Modelo_Extra (ID, Modelo_ID, Extra_ID, Precio_Extra) VALUES
(1, 1, 1, 500.00),
(2, 2, 2, 1000.00),
(3, 3, 3, 800.00),
(4, 4, 4, 300.00),
(5, 5, 5, 600.00);


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

INSERT INTO Automovil (NumeroBastidor, Modelo_ID, Precio, Descuento, Potencia, Cilindrada) VALUES
('123ABC', 1, 25000.00, 1000.00, 180, 2.5),
('456DEF', 2, 35000.00, 1500.00, 280, 5.0),
('789GHI', 3, 22000.00, 800.00, 150, 1.8),
('ABC123', 4, 28000.00, 1200.00, 200, 2.0),
('DEF456', 5, 27000.00, 1000.00, 190, 2.4);


-- Tabla de Concesionario 
CREATE TABLE Concesionario (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255)
);

INSERT INTO Concesionario (ID, Nombre) VALUES
(1, 'AutoMax'),
(2, 'Car World'),
(3, 'MotorMall'),
(4, 'DriveTime'),
(5, 'SpeedyCars');


-- Tabla de Servicio Oficial
CREATE TABLE ServicioOficial (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Domicilio VARCHAR(255),
    CUIT VARCHAR(20),
    Concesionario_ID INT,
    FOREIGN KEY (Concesionario_ID) REFERENCES Concesionario(ID)
);

INSERT INTO ServicioOficial (ID, Nombre) VALUES
(1, 'Talleres AutoMax'),
(2, 'Car World Service Center'),
(3, 'MotorMall Maintenance'),
(4, 'DriveTime Service'),
(5, 'SpeedyCars Repair');


-- Tabla de Vendedor
CREATE TABLE Vendedor (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    DNI VARCHAR(20),
    Domicilio VARCHAR(255)
);

INSERT INTO Vendedor (ID, Nombre, DNI, Domicilio) VALUES
(1, 'Juan Pérez', '1234567890', 'Calle 123, Ciudad A'),
(2, 'María Rodríguez', '2345678901', 'Avenida XYZ, Ciudad B'),
(3, 'Carlos Sánchez', '3456789012', 'Calle 456, Ciudad C'),
(4, 'Luisa Martínez', '4567890123', 'Avenida 789, Ciudad D'),
(5, 'Pedro García', '5678901234', 'Calle 678, Ciudad E');


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


INSERT INTO Venta (ID, Automovil_NumeroBastidor, Vendedor_ID, PrecioCobrado, ModoPago, FechaEntrega, Matricula, EsDeStock, EncargadoAFabrica) VALUES
(1, '123ABC', 1, 24000.00, 'Efectivo', '2023-10-05', 'ABC-123', TRUE, FALSE),
(2, '456DEF', 2, 34000.00, 'Tarjeta de crédito', '2023-10-06', 'DEF-456', TRUE, TRUE),
(3, '789GHI', 3, 21000.00, 'Cheque', '2023-10-07', 'GHI-789', TRUE, FALSE),
(4, 'ABC123', 4, 27000.00, 'Transferencia bancaria', '2023-10-08', '123-ABC', TRUE, TRUE),
(5, 'DEF456', 5, 26000.00, 'Efectivo', '2023-10-09', '456-DEF', TRUE, FALSE);


-- Tabla de Venta Extra
CREATE TABLE Venta_Extra (
    ID INT PRIMARY KEY,
    Venta_ID INT,
    Extra_ID INT,
    Precio_Extra DECIMAL(10, 2),
    FOREIGN KEY (Venta_ID) REFERENCES Venta(ID),
    FOREIGN KEY (Extra_ID) REFERENCES Extra(ID)
);

INSERT INTO Venta_Extra (ID, Venta_ID, Extra_ID, Precio_Extra) VALUES
(1, 1, 1, 500.00),
(2, 2, 2, 1000.00),
(3, 3, 3, 800.00),
(4, 4, 4, 300.00),
(5, 5, 5, 600.00);
