CREATE TABLE Categorías (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(50)
);
INSERT INTO Categorías (id, nombre)
VALUES
    (1, 'Electrónicos'),
    (2, 'Ropa'),
    (3, 'Hogar'),
    (4, 'Deportes'),
    (5, 'Juguetes');


CREATE TABLE Productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    marca VARCHAR(255),
    categoria_id INT,
    precio_unitario DECIMAL(10, 2),
    FOREIGN KEY (categoria_id) REFERENCES Categorías (id)
);
INSERT INTO Productos (id, nombre, marca, categoria_id, precio_unitario)
VALUES
    (1, 'Televisor', 'Sony', 1, 1000),
    (2, 'Laptop', 'HP', 1, 800),
    (3, 'Camisa', 'Zara', 2, 50),
    (4, 'Pantalón', 'Levi''s', 2, 70),
    (5, 'Sartén', 'T-fal', 3, 30),
    (6, 'Toalla', 'Cannon', 3, 20),
    (7, 'Pelota', 'Nike', 4, 15),
    (8, 'Raqueta', 'Wilson', 4, 50),
    (9, 'Muñeca', 'Barbie', 5, 25),
    (10, 'Carro', 'Hot Wheels', 5, 10);
   
CREATE TABLE Sucursales (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    direccion VARCHAR(50)
);

INSERT INTO Sucursales (id, nombre, direccion)
VALUES
  (1, 'Sucursal A', 'Calle 1'),
  (2, 'Sucursal B', 'Calle 2'),
  (3, 'Sucursal C', 'Calle 3');
 
CREATE TABLE Clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    telefono BIGINT
);
 
INSERT INTO Clientes (id, nombre, telefono) 
VALUES 
(1, 'Juan', '1234567890'),
(2, 'María', '0987654321'),
(3, 'Pedro', '5555555555');

CREATE TABLE Ordenes (
    id serial PRIMARY KEY,
    cliente_id integer,
    sucursal_id integer,
    fecha date,
    total numeric,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id),
    FOREIGN KEY (sucursal_id) REFERENCES Sucursales(id)
);

INSERT INTO Ordenes (cliente_id, sucursal_id, fecha, total)
VALUES
(1, 3, '2023-06-12', 575),
(2, 1, '2023-06-12', 705),
(3, 3, '2023-06-12', 9000),
(2, 3, '2023-06-12', 10400),
(3, 3, '2023-06-12', 85),
(1, 1, '2023-06-12', 830),
(1, 1, '2023-06-12', 490),
(3, 3, '2023-06-12', 16100),
(3, 2, '2023-06-12', 680),
(2, 1, '2023-06-12', 7525),
(2, 3, '2023-06-12', 725),
(3, 1, '2023-06-12', 11430),
(3, 3, '2023-06-12', 4900),
(3, 3, '2023-06-12', 5490),
(1, 1, '2023-06-12', 420);

CREATE TABLE Stocks (
    id serial PRIMARY KEY,
    sucursal_id integer,
    producto_id integer,
    cantidad integer,
    FOREIGN KEY (sucursal_id) REFERENCES Sucursales(id),
    FOREIGN KEY (producto_id) REFERENCES Productos(id)
);

INSERT INTO Stocks (sucursal_id, producto_id, cantidad)
VALUES
(1, 1, 65),
(1, 2, 71),
(1, 3, 8),
(1, 4, 42),
(1, 5, 61),
(1, 6, 14),
(1, 7, 70),
(1, 8, 66),
(1, 9, 13),
(1, 10, 68),
(2, 1, 14),
(2, 2, 67),
(2, 3, 74),
(2, 4, 32),
(2, 5, 75),
(2, 6, 37),
(2, 7, 14),
(2, 8, 42),
(2, 9, 51),
(2, 10, 41),
(3, 1, 59),
(3, 2, 98),
(3, 3, 52),
(3, 4, 85),
(3, 5, 31),
(3, 6, 17),
(3, 7, 13),
(3, 8, 18),
(3, 9, 76),
(3, 10, 1);

CREATE TABLE Items (
    id serial PRIMARY KEY,
    orden_id integer,
    producto_id integer,
    cantidad integer,
    monto_venta numeric,
    FOREIGN KEY (orden_id) REFERENCES Ordenes(id)
);

INSERT INTO Items (orden_id, producto_id, cantidad, monto_venta)
VALUES
(1, 9, 7, 175),
(1, 8, 8, 400),
(2, 9, 3, 75),
(2, 5, 9, 270),
(2, 5, 10, 300),
(2, 6, 3, 60),
(3, 1, 9, 9000),
(4, 1, 4, 4000),
(4, 2, 8, 6400),
(5, 6, 2, 40),
(5, 7, 3, 45),
(6, 4, 9, 630),
(6, 9, 4, 100),
(6, 3, 2, 100),
(7, 5, 8, 240),
(7, 9, 6, 150),
(7, 8, 2, 100),
(8, 1, 6, 6000),
(8, 1, 10, 10000),
(8, 3, 2, 100),
(9, 8, 9, 450),
(9, 3, 3, 150),
(9, 7, 2, 30),
(9, 10, 5, 50),
(10, 9, 9, 225),
(10, 1, 7, 7000),
(10, 3, 6, 300),
(11, 7, 5, 75),
(11, 9, 8, 200),
(11, 3, 9, 450),
(12, 2, 7, 5600),
(12, 1, 5, 5000),
(12, 6, 9, 180),
(12, 8, 9, 450),
(12, 8, 4, 200),
(13, 9, 4, 100),
(13, 2, 6, 4800),
(14, 1, 5, 5000),
(14, 4, 7, 490),
(15, 9, 6, 150),
(15, 5, 9, 270);

ALTER TABLE Stocks
ADD CONSTRAINT fk_stock_sucursal
FOREIGN KEY (sucursal_id)
REFERENCES Sucursales(id);

ALTER TABLE Stocks
ADD CONSTRAINT fk_stock_producto
FOREIGN KEY (producto_id)
REFERENCES Productos(id);


ALTER TABLE Ordenes
ADD CONSTRAINT fk_orden_cliente
FOREIGN KEY (cliente_id)
REFERENCES Clientes(id);

ALTER TABLE Ordenes
ADD CONSTRAINT fk_orden_sucursal
FOREIGN KEY (sucursal_id)
REFERENCES Sucursales(id);

ALTER TABLE Items
ADD CONSTRAINT fk_item_orden
FOREIGN KEY (orden_id)
REFERENCES Ordenes(id);

ALTER TABLE Items
ADD CONSTRAINT fk_item_producto
FOREIGN KEY (producto_id)
REFERENCES Productos(id);




SELECT c.nombre AS nombre_categoria, AVG(p.precio_unitario) AS precio_promedio
FROM Categorías c
LEFT JOIN Productos p ON c.id = p.categoria_id
GROUP BY c.nombre
ORDER BY nombre_categoria;

SELECT c.nombre AS nombre_categoria, SUM(s.cantidad) AS cantidad_total
FROM Categorías c
LEFT JOIN Productos p ON c.id = p.categoria_id
LEFT JOIN Stocks s ON p.id = s.producto_id
GROUP BY c.nombre
ORDER BY nombre_categoria;

SELECT s.nombre AS nombre_sucursal, SUM(o.total) AS total_ventas
FROM Sucursales s
LEFT JOIN Ordenes o ON s.id = o.sucursal_id
GROUP BY s.nombre
ORDER BY nombre_sucursal;

SELECT c.nombre AS nombre_cliente, SUM(o.total) AS total_compras
FROM Clientes c
LEFT JOIN Ordenes o ON c.id = o.cliente_id
GROUP BY c.nombre
ORDER BY total_compras DESC
LIMIT 1;

SELECT
    MIN(precio_unitario) AS precio_minimo,
    MAX(precio_unitario) AS precio_maximo,
    AVG(precio_unitario) AS precio_promedio
FROM Productos;

SELECT
    Sucursales.nombre AS sucursal,
    SUM(Stocks.cantidad) AS cantidad_total
FROM Stocks
INNER JOIN Sucursales ON Stocks.Sucursal_Id = Sucursales.id
GROUP BY Sucursales.nombre;

SELECT
    Clientes.nombre AS cliente,
    SUM(Items.monto_venta) AS total_ventas
FROM Items
INNER JOIN ordenes ON Items.orden_id = ordenes.id
INNER JOIN Clientes ON ordenes.cliente_id = Clientes.id
GROUP BY Clientes.nombre;