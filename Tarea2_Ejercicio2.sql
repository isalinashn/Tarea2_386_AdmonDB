USE master;
IF DB_ID('Tarea2_Ejercicio2') IS NOT NULL
BEGIN
    ALTER DATABASE Tarea2_Ejercicio2 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Tarea2_Ejercicio2;
END
GO

CREATE DATABASE Tarea2_Ejercicio2;
GO

USE Tarea2_Ejercicio2;
GO

-- Tabla Restaurante
CREATE TABLE Restaurante (
    id_restaurante INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50)
)
GO

-- Tabla Platillo
CREATE TABLE Platillo (
    id_platillo INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(10, 2)
)
GO

-- Tabla Menu
CREATE TABLE Menu (
    id_menu INT IDENTITY(1,1) PRIMARY KEY,
    id_restaurante INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    CONSTRAINT FK_Restaurante_Menu FOREIGN KEY (id_restaurante) REFERENCES Restaurante(id_restaurante)
)
GO

-- Tabla Detalle_Menu
CREATE TABLE Detalle_Menu (
    id_detalle INT,
    id_menu INT,
    id_platillo INT,
    cantidad INT,
	CONSTRAINT PK_DetalleMenu PRIMARY KEY (id_menu, id_detalle),
    CONSTRAINT FK_Menu_Detalle_Menu FOREIGN KEY (id_menu) REFERENCES Menu(id_menu),
    CONSTRAINT FK_Platillo_Detalle_Menu FOREIGN KEY (id_platillo) REFERENCES Platillo(id_platillo)
)
GO

-- Insertar registros en la tabla Restaurante
INSERT INTO Restaurante (nombre)
VALUES
('Power Chicken'),
('Panistro'),
('Caobas'),
('Madeiro'),
('Coffee Market')
GO

-- Insertar registros en la tabla Platillo
INSERT INTO Platillo (nombre, precio)
VALUES
('Chicken Gordon Blue', 25.00),
('Pollo asado', 50.00),
('Arroz con mariscos', 65.00),
('Churrasco', 80.00),
('Parrillada', 110.00),
('Ceviche', 45.00),
('Lomo saltado', 60.00),
('Pasta Alfredo', 40.00),
('New York Steal', 50.00),
('Tapado', 30.00)
GO

-- Insertar registros en la tabla Menu
INSERT INTO Menu (id_restaurante, fecha_inicio, fecha_fin)
VALUES
(1, '2023-02-01', '2023-02-28'),
(2, '2023-03-01', '2023-03-31'),
(3, '2023-04-01', '2023-04-30'),
(4, '2023-05-01', '2023-05-31'),
(5, '2023-06-01', '2023-06-30')
GO

-- Insertar registros en la tabla Detalle_Menu
INSERT INTO Detalle_Menu (id_detalle, id_menu, id_platillo, cantidad)
VALUES
(1, 1, 1, 2),
(2, 1, 2, 1),
(3, 1, 6, 3),
(4, 2, 3, 1),
(5, 2, 7, 2),
(6, 2, 8, 2),
(7, 3, 4, 1),
(8, 3, 5, 1),
(9, 3, 10, 3),
(10, 4, 1, 3),
(11, 4, 3, 2),
(12, 4, 6, 1),
(13, 5, 2, 1),
(14, 5, 4, 2),
(15, 5, 5, 2),
(16, 5, 9, 2)
GO