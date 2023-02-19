USE master;
IF DB_ID('Tarea2_Ejercicio3') IS NOT NULL
BEGIN
    ALTER DATABASE Tarea2_Ejercicio2 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Tarea2_Ejercicio2;
END
GO

CREATE DATABASE Tarea2_Ejercicio3;
GO

USE Tarea2_Ejercicio3;
GO


CREATE TABLE peajes (
    peaje_id INT IDENTITY(1,1) PRIMARY KEY,
    ubicacion VARCHAR(50) NOT NULL
);
GO

CREATE TABLE tarifas (
    tarifa_id INT IDENTITY(1,1) PRIMARY KEY,
    precio FLOAT NOT NULL
);
GO

CREATE TABLE vehiculos (
    vehiculo_id INT IDENTITY(1,1) PRIMARY KEY,
    tipo_vehiculo VARCHAR(50) NOT NULL,
    tarifa_id INT NOT NULL,
    FOREIGN KEY (tarifa_id) REFERENCES tarifas(tarifa_id)
);
GO

CREATE TABLE cobros (
    cobro_id INT IDENTITY(1,1) PRIMARY KEY,
    peaje_id INT NOT NULL,
    vehiculo_id INT NOT NULL,
    fecha DATE NOT NULL,
    monto FLOAT NOT NULL,
    FOREIGN KEY (peaje_id) REFERENCES peajes(peaje_id),
    FOREIGN KEY (vehiculo_id) REFERENCES vehiculos(vehiculo_id)
);
GO

INSERT INTO peajes (ubicacion) VALUES
('Zambrano'),
('Siguatepeque'),
('La Barca');
GO

INSERT INTO tarifas (precio) VALUES
(23),
(25),
(30),
(60);
GO

INSERT INTO vehiculos (tipo_vehiculo, tarifa_id) VALUES
('Turismo', 1),
('3 Ejes', 2),
('4 Ejes', 3),
('5 Ejes', 4);
GO

INSERT INTO cobros (peaje_id, vehiculo_id, fecha, monto) VALUES
(1, 1, '2022-01-01', 5000),
(1, 1, '2022-01-02', 5000),
(1, 2, '2022-01-02', 8000),
(1, 3, '2022-01-03', 10000),
(2, 1, '2022-01-03', 5000),
(2, 1, '2022-01-04', 5000),
(2, 2, '2022-01-05', 8000),
(2, 2, '2022-01-06', 8000),
(3, 3, '2022-01-07', 10000),
(3, 4, '2022-01-08', 15000);
GO