
-- 3.5 OPERACIÓN TRANSACCIONAL (COMPRA)


-- Limpieza preventiva del caso de prueba (Pedido 99)
-- Esto permite que el script se pueda ejecutar varias veces sin errores
DELETE FROM detalle_pedidos WHERE pedido_id = 99;
DELETE FROM pedidos WHERE id = 99;

-- INICIO DE LA TRANSACCIÓN
BEGIN TRANSACTION;

-- 1. Crear el pedido (para el usuario 4, Roberto Díaz)
INSERT INTO pedidos (id, usuario_id, fecha, total) 
VALUES (99, 4, CURRENT_TIMESTAMP, 90000.00);

-- 2. Registrar los productos comprados en el detalle
-- Roberto compra 2 "Binoculares Astronómicos" (Producto ID 4, Precio 45000)
INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, precio_unitario)
VALUES (99, 4, 2, 45000.00);

-- 3. Actualizar el stock correspondiente
-- Restamos 2 unidades al stock del producto 4
UPDATE stock 
SET cantidad = cantidad - 2 
WHERE producto_id = 4;

-- FINALIZACIÓN DE LA TRANSACCIÓN
-- Si todo lo anterior fue exitoso, se guardan los cambios permanentemente
COMMIT;

-- Consulta de verificación para ver el resultado
SELECT 'PEDIDO CREADO' AS Estado, p.id, p.total, s.cantidad AS Stock_Restante
FROM pedidos p
JOIN stock s ON s.producto_id = 4
WHERE p.id = 99;