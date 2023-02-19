USE master;
IF DB_ID('Tarea2_Ejercicio1') IS NOT NULL
BEGIN
    ALTER DATABASE Tarea2_Ejercicio1 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Tarea2_Ejercicio1;
END
GO

CREATE DATABASE Tarea2_Ejercicio1;
GO

USE Tarea2_Ejercicio1;
GO

CREATE TABLE Paises (
	id int IDENTITY(1,1) PRIMARY KEY,
	nombre varchar(50),
	codigo varchar(50),
)
GO

CREATE TABLE Monedas (
	id int IDENTITY(1,1) PRIMARY KEY,
	nombre varchar(50),
	codigo varchar(50),
)
GO

CREATE TABLE Pais_Moneda (
	id_pais int,
	id_moneda int,
	PRIMARY KEY (id_pais, id_moneda),
    FOREIGN KEY (id_pais) REFERENCES  Paises(id),
    FOREIGN KEY (id_moneda) REFERENCES Monedas(id)
)
GO

CREATE TABLE Combustibles (
	id int IDENTITY(1,1) PRIMARY KEY,
	nombre varchar(50)
)
GO

CREATE TABLE Precios (
	semana int,
	anio int,
	fecha date,
	id_combustible int,
	id_pais int,
	id_moneda int,
	precio decimal(10,2),
	PRIMARY KEY (semana, anio, id_combustible, id_pais),
	FOREIGN KEY (id_combustible) REFERENCES Combustibles(id),
    FOREIGN KEY (id_pais) REFERENCES  Paises(id),
    FOREIGN KEY (id_moneda) REFERENCES Monedas(id),
)
GO

INSERT INTO Paises (nombre, codigo) VALUES
('Guatemala', 'GT'),
('Honduras', 'HN'),
('El Salvador', 'SV'),
('Nicaragua', 'NI'),
('Costa Rica', 'CR'),
('Panamá', 'PA');
GO

INSERT INTO Monedas (nombre,codigo) VALUES
('Quetzal', 'GTQ'),
('Lempira', 'HNL'),
('Colón', 'SVC'),
('Córdoba', 'NIO'),
('Colón', 'CRC'),
('Balboa', 'PAB');
GO

INSERT INTO Pais_Moneda (id_pais, id_moneda) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6);
GO

INSERT INTO Combustibles(nombre) VALUES
('Gasolina Premium'),
('Gasolina Regular'),
('Diesel'),
('LPG'),
('Etanol');
GO

-- Insertar registros en la tabla Precios para las semanas 1 y 2, países 1 al 6, y combustibles 1 al 5
INSERT INTO Precios (semana, anio, fecha, id_combustible, id_pais, id_moneda, precio) VALUES
(DATEPART(week, '2023-01-4'), DATEPART(year, '2023-01-4'), '2023-01-4', 1, 2, 2, 103.75),
(DATEPART(week, '2023-01-4'), DATEPART(year, '2023-01-4'), '2023-01-4', 2, 2, 2, 94.10),
(DATEPART(week, '2023-01-4'), DATEPART(year, '2023-01-4'), '2023-01-4', 3, 2, 2, 94.20),
(DATEPART(week, '2023-01-4'), DATEPART(year, '2023-01-4'), '2023-01-4', 4, 2, 2, 54.50),
(DATEPART(week, '2023-01-4'), DATEPART(year, '2023-01-4'), '2023-01-4', 5, 2, 2, 44.75),
(DATEPART(week, '2023-01-11'), DATEPART(year, '2023-01-11'), '2023-01-11', 1, 2, 2, 104.90),
(DATEPART(week, '2023-01-11'), DATEPART(year, '2023-01-11'), '2023-01-11', 2, 2, 2, 103.20),
(DATEPART(week, '2023-01-11'), DATEPART(year, '2023-01-11'), '2023-01-11', 3, 2, 2, 93.60),
(DATEPART(week, '2023-01-11'), DATEPART(year, '2023-01-11'), '2023-01-11', 4, 2, 2, 53.70),
(DATEPART(week, '2023-01-11'), DATEPART(year, '2023-01-11'), '2023-01-11', 5, 2, 2, 43.90),
(DATEPART(week, '2023-01-18'), DATEPART(year, '2023-01-18'), '2023-01-18', 1, 2, 2, 103.75),
(DATEPART(week, '2023-01-18'), DATEPART(year, '2023-01-18'), '2023-01-18', 2, 2, 2, 94.10),
(DATEPART(week, '2023-01-18'), DATEPART(year, '2023-01-18'), '2023-01-18', 3, 2, 2, 94.20),
(DATEPART(week, '2023-01-18'), DATEPART(year, '2023-01-18'), '2023-01-18', 4, 2, 2, 54.50),
(DATEPART(week, '2023-01-18'), DATEPART(year, '2023-01-18'), '2023-01-18', 5, 2, 2, 44.75),
(DATEPART(week, '2023-01-25'), DATEPART(year, '2023-01-25'), '2023-01-25', 1, 2, 2, 104.90),
(DATEPART(week, '2023-01-25'), DATEPART(year, '2023-01-25'), '2023-01-25', 2, 2, 2, 103.20),
(DATEPART(week, '2023-01-25'), DATEPART(year, '2023-01-25'), '2023-01-25', 3, 2, 2, 93.60),
(DATEPART(week, '2023-01-25'), DATEPART(year, '2023-01-25'), '2023-01-25', 4, 2, 2, 53.70),
(DATEPART(week, '2023-01-25'), DATEPART(year, '2023-01-25'), '2023-01-25', 5, 2, 2, 43.90);

GO

select Precios.semana, Precios.anio, Paises.nombre, Combustibles.nombre, Precios.precio from Precios
inner join Paises on Precios.id_pais=Paises.id
inner join Combustibles on Precios.id_combustible=Combustibles.id
inner join Monedas on Precios.id_moneda=Monedas.id
where Precios.semana=2 and Precios.anio=2023
GO

SELECT Precios.semana, Precios.anio, Paises.nombre, Combustibles.nombre,
    SUM(CASE WHEN semana = 2 THEN Precios.precio ELSE 0 END) as precio_actual,
    SUM(CASE WHEN semana = 1 THEN Precios.precio ELSE 0 END) as precio_anterior
FROM Precios
inner join Paises on Precios.id_pais=Paises.id
inner join Combustibles on Precios.id_combustible=Combustibles.id
inner join Monedas on Precios.id_moneda=Monedas.id
GROUP BY precios.semana, Precios.anio, Paises.nombre, Combustibles.nombre
GO
