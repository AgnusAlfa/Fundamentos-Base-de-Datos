
-- 3.4 CONSULTAS DE INFORMACIÓN (QUERIES)

-- 1. Listar todos los productos junto a su categoría
SELECT p.nombre AS Producto, c.nombre AS Categoria, p.precio
FROM productos p
JOIN categorias c ON p.categoria_id = c.id;

-- 2. Buscar productos por nombre (ejemplo: 'Meteorito')
SELECT * FROM productos 
WHERE nombre LIKE '%Meteorito%';

-- 3. Filtrar productos por una categoría específica (ejemplo: id 2 - Equipamiento)
SELECT * FROM productos 
WHERE categoria_id = 2;

-- 4. Mostrar los productos asociados a un pedido específico (ejemplo: pedido id 1)
SELECT dp.pedido_id, p.nombre, dp.cantidad, dp.precio_unitario
FROM detalle_pedidos dp
JOIN productos p ON dp.producto_id = p.id
WHERE dp.pedido_id = 1;

-- 5. Calcular el total de un pedido (ejemplo: pedido id 1)
SELECT pedido_id, SUM(cantidad * precio_unitario) AS Total_Calculado
FROM detalle_pedidos
WHERE pedido_id = 1;

-- 6. Identificar productos con stock bajo (ejemplo: menos de 5 unidades)
SELECT p.nombre, s.cantidad AS Stock_Actual
FROM productos p
JOIN stock s ON p.id = s.producto_id
WHERE s.cantidad < 5;