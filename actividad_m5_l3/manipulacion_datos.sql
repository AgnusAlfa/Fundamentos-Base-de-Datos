
-- 0. PREPARACIÓN

CREATE TABLE IF NOT EXISTS clientes (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS pedidos (
    id INTEGER PRIMARY KEY,
    cliente_id INTEGER,
    fecha DATE,
    total NUMERIC,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Insertar datos base si no existen (id=2 debe existir para el ítem 2)
INSERT OR IGNORE INTO clientes (id, nombre, ciudad) VALUES 
(1, 'Ana Soto', 'Valparaíso'),
(2, 'Carlos Gómez', 'Santiago'),
(3, 'Luis Pérez', 'Valparaíso'),
(4, 'Marta Rojas', 'Concepción'),
(5, 'Pedro Silva', 'Santiago'),
(6, 'Laura Vega', 'Arica');

INSERT OR IGNORE INTO pedidos (id, cliente_id, fecha, total) VALUES 
(1, 1, '2026-05-01', 45000),
(2, 2, '2026-05-02', 120000),
(3, 2, '2026-05-03', 30000),
(4, 3, '2026-05-04', 150000),
(5, 5, '2026-05-04', 25000);

-- 1. INSERCIÓN DE DATOS (INSERT) - ACTIVIDAD 3

-- Insertar 3 nuevos clientes (usando autogeneración de IDs)
INSERT INTO clientes (nombre, ciudad) VALUES 
('Javier Morales', 'La Serena'),
('Camila Fernández', 'Coquimbo'),
('Roberto Pizarro', 'Santiago');

-- Insertar 5 pedidos asociados a los clientes
INSERT INTO pedidos (cliente_id, fecha, total) VALUES 
(7, '2026-05-05', 55000),
(7, '2026-05-06', 15000),
(8, '2026-05-06', 80000),
(9, '2026-05-07', 120000),
(3, '2026-05-07', 45000);

SELECT * FROM clientes; -- Prueba Inserción de datos


-- 2. ACTUALIZACIÓN DE DATOS (UPDATE)


-- Cambiar la ciudad de un cliente con id = 2 a "Viña del Mar"
UPDATE clientes SET ciudad = 'Viña del Mar' WHERE id = 2;

-- Modificar el total de un pedido existente (elegiremos el pedido con id = 1)
-- Le cambiaremos el total de 45000 a 60000
UPDATE pedidos SET total = 60000 WHERE id = 1;

SELECT * FROM clientes; -- Prueba Actualización de datos


-- 3. ELIMINACIÓN DE DATOS (DELETE)


-- Activar la protección de llaves foráneas en SQLite
PRAGMA foreign_keys = ON;

-- Eliminar un pedido por su id (vamos a eliminar el pedido N° 5)
DELETE FROM pedidos WHERE id = 5;

-- Intentar eliminar un cliente que tiene pedidos asociados (ejemplo: Ana Soto, id = 1)
-- OJO: Se espera que esta consulta arroje un error a propósito.
DELETE FROM clientes WHERE id = 1;

/* 
RESULTADO DOCUMENTADO: 
Al ejecutar la línea anterior, la base de datos bloqueó la operación y arrojó el error:
"SQLITE_CONSTRAINT: FOREIGN KEY constraint failed".
Esto demuestra que la integridad referencial está funcionando correctamente, 
ya que el sistema impide eliminar un cliente que aún tiene pedidos vinculados en la tabla "pedidos".
*/


-- PRUEBA 1: Transacción con ROLLBACK
BEGIN;
UPDATE pedidos SET total = 999999 WHERE id = 1;
ROLLBACK;

SELECT * FROM pedidos WHERE id = 1; -- Ejecución de prueba 1

/* 
DOCUMENTACIÓN PRUEBA 1 (ROLLBACK):
Al ejecutar la transacción, se intentó cambiar el total del pedido N° 1.
Sin embargo, al usar la instrucción ROLLBACK, esta acción se deshizo por completo. 
Al verificar con el SELECT, se comprobó que el pedido mantuvo su valor original (60000). 
Esto demuestra que ROLLBACK cancela cualquier modificación antes de que se guarde.
*/


-- PRUEBA 2: Transacción con COMMIT
BEGIN;
DELETE FROM pedidos WHERE id = 2;
COMMIT;

SELECT * FROM pedidos; -- Ejecución de prueba 2

/* 
DOCUMENTACIÓN PRUEBA 2 (COMMIT):
Al ejecutar esta transacción, se dio la orden de eliminar el pedido N° 2.
Al utilizar la instrucción COMMIT, este cambio se confirmó de manera definitiva. 
Al verificar con el SELECT, se corroboró que el registro desapareció de la tabla. 
Esto demuestra que COMMIT sella y vuelve permanentes los cambios en la base de datos.
*/

