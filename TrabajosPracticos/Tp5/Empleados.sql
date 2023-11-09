-- Creando la tabla de empleados
CREATE TABLE Empleados (
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    seccion VARCHAR(50)
);

-- Insertando los 15 registros
INSERT INTO Empleados (nombre, apellido, salario, seccion)
VALUES
    ('Juan', 'Gomez', 60000, 'Desarrollo de Software'),
    ('Maria', 'Lopez', 70000, 'QA'),
    ('Pedro', 'Rodriguez', 55000, 'Desarrollo de Software'),
    ('Ana', 'Martinez', 80000, 'Desarrollo de Software'),
    ('Carlos', 'Santos', 75000, 'QA'),
    ('Laura', 'Perez', 65000, 'Desarrollo de Software'),
    ('Fernando', 'Gutierrez', 72000, 'QA'),
    ('Luisa', 'Hernandez', 68000, 'Desarrollo de Software'),
    ('Roberto', 'Diaz', 60000, 'QA'),
    ('Raquel', 'Rojas', 90000, 'Desarrollo de Software'),
    ('Ricardo', 'Alvarez', 85000, 'QA'),
    ('Rosa', 'Ramirez', 78000, 'Desarrollo de Software'),
    ('Carmen', 'Castro', 95000, 'QA'),
    ('Mario', 'Fernandez', 70000, 'Desarrollo de Software'),
    ('Elena', 'Garcia', 92000, 'QA');

-- Aumentando el salario en un 23%
UPDATE Empleados SET salario = salario * 1.23;

-- Consulta para mostrar nombre, apellido y salario ordenado de mayor a menor
SELECT nombre, apellido, salario FROM Empleados ORDER BY salario DESC;

-- Eliminando empleados que comienzan con la letra 'R'
DELETE FROM Empleados WHERE nombre LIKE 'R%';

-- Agregando dos empleados más
INSERT INTO Empleados (nombre, apellido, salario, seccion)
VALUES
    ('Jeremias', 'Guzman', 500000, 'AdmBasesDeDatos'),
    ('Facundo', 'Zottoli', 750000, 'AdmBasesDeDatos');

-- Actualizando seccion de los empleados
UPDATE Empleados SET seccion = 'AdmBasesDeDatos' WHERE salario = 500000 OR salario = 750000;

-- Consulta para empleados de QA que ganan más de $200000 despues del aumento
SELECT nombre, apellido, salario FROM Empleados WHERE seccion = 'QA' AND salario > 200000;

-- Consulta para contar empleados que ganan más de $500000
SELECT COUNT(*) FROM Empleados WHERE salario > 500000;
