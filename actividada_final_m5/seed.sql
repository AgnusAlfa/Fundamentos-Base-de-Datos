
-- 3.3 CARGA DE DATOS DE EJEMPLO


-- Limpiamos los datos existentes para evitar errores de duplicidad
DELETE FROM detalle_pedidos;
DELETE FROM pedidos;
DELETE FROM stock;
DELETE FROM productos;
DELETE FROM usuarios;
DELETE FROM categorias;

-- 1. Insertar Categorías
INSERT INTO categorias (id, nombre) VALUES 
(1, 'Coleccionables Estelares'), 
(2, 'Equipamiento Astronómico'), 
(3, 'Literatura Científica');

-- 2. Insertar Usuarios (1 Admin y 4 Clientes)
INSERT INTO usuarios (id, nombre, correo, rol) VALUES 
(1, 'Admin Principal', 'admin@tienda.com', 'administrador'),
(2, 'Carlos Ruiz', 'carlos.r@gmail.com', 'cliente'),
(3, 'Lucía Méndez', 'lucia.m@outlook.com', 'cliente'),
(4, 'Roberto Díaz', 'roberto.d@yahoo.com', 'cliente'),
(5, 'Elena Torres', 'elena.t@vtr.net', 'cliente');

-- 3. Insertar Productos
INSERT INTO productos (id, nombre, precio, categoria_id) VALUES 
(1, 'Fragmento de Siderito', 150000.00, 1),
(2, 'Condrita Carbonácea', 85000.00, 1),
(3, 'Telescopio Refractor 70mm', 120000.00, 2),
(4, 'Binoculares Astronómicos', 45000.00, 2),
(5, 'Mapa Estelar Austral', 12000.00, 3),
(6, 'Guía de Constelaciones', 18000.00, 3),
(7, 'Lente Ocular 10mm', 25000.00, 2),
(8, 'Filtro Lunar Profesional', 15000.00, 2),
(9, 'Meteorito Metálico Gibeon', 320000.00, 1),
(10, 'Enciclopedia del Cosmos', 55000.00, 3);

-- 4. Insertar Stock
INSERT INTO stock (producto_id, cantidad) VALUES 
(1, 5), (2, 10), (3, 3), (4, 8), (5, 20), 
(6, 15), (7, 12), (8, 10), (9, 2), (10, 7);

-- 5. Insertar Pedidos
INSERT INTO pedidos (id, usuario_id, total) VALUES 
(1, 2, 165000.00), 
(2, 3, 120000.00), 
(3, 5, 30000.00);

-- 6. Insertar Detalle de los pedidos
INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, precio_unitario) VALUES 
(1, 1, 1, 150000.00),
(1, 8, 1, 15000.00),
(2, 3, 1, 120000.00),
(3, 5, 1, 12000.00),
(3, 6, 1, 18000.00);

