USE master;
IF DB_ID('Tarea2_Ejercicio4') IS NOT NULL
BEGIN
    ALTER DATABASE Tarea2_Ejercicio4 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Tarea2_Ejercicio4;
END
GO

CREATE DATABASE Tarea2_Ejercicio4;
GO

USE Tarea2_Ejercicio4;
GO


CREATE TABLE Empresa (
    Empresa_ID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Ruta (
    Ruta_ID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Empresa_Ruta (
    Empresa_ID INT NOT NULL,
    Ruta_ID INT NOT NULL,
    PRIMARY KEY (Empresa_ID, Ruta_ID),
    CONSTRAINT FK_Empresa_Ruta_Empresa FOREIGN KEY (Empresa_ID) REFERENCES Empresa(Empresa_ID),
    CONSTRAINT FK_Empresa_Ruta_Ruta FOREIGN KEY (Ruta_ID) REFERENCES Ruta(Ruta_ID)
);
GO

CREATE TABLE Precio (
    Precio_ID INT IDENTITY(1,1) PRIMARY KEY,
    Ruta_ID INT NOT NULL,
    Precio FLOAT NOT NULL,
    CONSTRAINT FK_Precio_Ruta FOREIGN KEY (Ruta_ID) REFERENCES Ruta(Ruta_ID)
);
GO

CREATE TABLE Cobro (
    Cobro_ID INT IDENTITY(1,1) PRIMARY KEY,
    Precio_ID INT NOT NULL,
    Fecha DATE NOT NULL,
    Cantidad INT NOT NULL,
    CONSTRAINT FK_Cobro_Precio FOREIGN KEY (Precio_ID) REFERENCES Precio(Precio_ID)
);
GO

INSERT INTO Empresa (Nombre)
VALUES
    ('Transporte Sula'),
    ('Transporte Estévez');
GO

INSERT INTO Ruta (Nombre)
VALUES
    ('Centro - salida'),
    ('Centro - Satelite'),
    ('Centro - El Progreso'),
    ('Salida - Satelite'),
    ('Salida - El Progreso'),
    ('Satelite - El Progreso');
GO

INSERT INTO Empresa_Ruta (Empresa_ID, Ruta_ID)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (2, 5),
    (2, 6);
GO

INSERT INTO Precio (Ruta_ID, Precio)
VALUES
    (1, 10),
    (1, 15),
    (2, 25),
    (3, 11),
    (4, 20),
    (5, 30);
GO

INSERT INTO Cobro (Precio_ID, Fecha, Cantidad)
VALUES
    ( 1, '2022-01-15', 100),
    ( 1, '2022-01-30', 80),
    ( 2, '2022-02-15', 120),
    ( 2, '2022-02-28', 90),
    ( 3, '2022-01-15', 200),
    ( 4, '2022-01-15', 150),
    ( 4, '2022-01-30', 100),
    ( 5, '2022-01-15', 120),
    ( 5, '2022-01-30', 80),
    ( 6, '2022-01-15', 90);
GO