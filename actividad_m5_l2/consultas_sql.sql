CREATE TABLE clientes (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(50)
);

CREATE TABLE pedidos (
    id INTEGER PRIMARY KEY,
    cliente_id INTEGER,
    fecha DATE,
    total NUMERIC,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- 1. CREACIÓN DE TABLAS (Adaptadas para SQLite)
CREATE TABLE clientes (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(50)
);

CREATE TABLE pedidos (
    id INTEGER PRIMARY KEY,
    cliente_id INTEGER,
    fecha DATE,
    total NUMERIC,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- 2. INSERCIÓN DE DATOS DE PRUEBA
INSERT INTO clientes (nombre, ciudad) VALUES 
('Ana Soto', 'Valparaíso'),
('Carlos Gómez', 'Santiago'),
('Luis Pérez', 'Valparaíso'),
('Marta Rojas', 'Concepción'),
('Pedro Silva', 'Santiago'),
('Laura Vega', 'Arica');

INSERT INTO pedidos (cliente_id, fecha, total) VALUES 
(1, '2026-05-01', 45000),
(2, '2026-05-02', 120000), -- Pedido mayor a 100.000
(2, '2026-05-03', 30000),
(3, '2026-05-04', 150000), -- Pedido mayor a 100.000
(5, '2026-05-04', 25000);
-- Nota: La cliente 4 (Marta) y 6 (Laura) no tienen pedidos, ideal para probar tu LEFT JOIN más adelante.
SELECT * FROM clientes;


-- 1. CONSULTAS A UNA SOLA TABLA

-- Obtener todos los registros de la tabla clientes
SELECT * FROM clientes;

-- Obtener el nombre y ciudad de todos los clientes que vivan en "Valparaíso"
SELECT nombre, ciudad FROM clientes WHERE ciudad = 'Valparaíso';

-- Obtener el cliente con id=3
SELECT * FROM clientes WHERE id = 3;

-- Usar COUNT() para contar cuántos clientes hay en total
SELECT COUNT(*) AS total_clientes FROM clientes;

-- Obtener todas las ciudades distintas en las que hay clientes (DISTINCT)
SELECT DISTINCT ciudad FROM clientes;

-- Agrupar clientes por ciudad y contar cuántos hay en cada una
SELECT ciudad, COUNT(*) AS cantidad_clientes FROM clientes GROUP BY ciudad;



-- 2. CONSULTAS ENTRE VARIAS TABLAS (JOINS)

-- Obtener todos los pedidos, incluyendo el nombre del cliente
SELECT pedidos.id, clientes.nombre, pedidos.fecha, pedidos.total 
FROM pedidos
JOIN clientes ON pedidos.cliente_id = clientes.id;

-- Obtener los pedidos hechos por clientes de "Santiago"
SELECT pedidos.*, clientes.ciudad 
FROM pedidos
JOIN clientes ON pedidos.cliente_id = clientes.id
WHERE clientes.ciudad = 'Santiago';

-- Obtener el total de pedidos por cliente (usando GROUP BY)
SELECT clientes.nombre, SUM(pedidos.total) AS gasto_total
FROM clientes
JOIN pedidos ON clientes.id = pedidos.cliente_id
GROUP BY clientes.nombre;

-- LEFT JOIN para listar todos los clientes y sus pedidos (incluso si no tienen)
SELECT clientes.nombre, pedidos.id AS pedido_nro, pedidos.total
FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id;

-- Consulta anidada (Subconsulta): Clientes con total de pedidos > $100.000
SELECT nombre 
FROM clientes 
WHERE id IN (
    SELECT cliente_id 
    FROM pedidos 
    WHERE total > 100000
);