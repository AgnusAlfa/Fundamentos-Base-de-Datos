# Proyecto Final Módulo 5: E-commerce "Cosmos Store"

## 1. Descripción General
Este proyecto implementa una base de datos relacional para un E-commerce especializado en productos astronómicos. La estructura permite gestionar usuarios (clientes y administradores), un catálogo de productos organizado por categorías, control de stock en tiempo real y el registro de pedidos detallados.

## 2. Estructura del Proyecto
La carpeta contiene los siguientes entregables:
- `modelo_er.png`: Diagrama Entidad-Relación del modelo.
- `schema.sql`: Definición de tablas, relaciones y restricciones.
- `seed.sql`: Carga inicial de datos de prueba (categorías, productos, usuarios, stock y pedidos).
- `queries.sql`: Consultas para obtener información de negocio (stock bajo, totales de pedidos, etc.).
- `transaction.sql`: Script que emula una compra garantizando la consistencia mediante transacciones.

## 3. Orden de Ejecución
Para asegurar que la base de datos funcione correctamente, los scripts deben ejecutarse en este orden:
1. `schema.sql` (Crea la estructura).
2. `seed.sql` (Carga los datos iniciales).
3. `queries.sql` o `transaction.sql` (Para consultar o realizar operaciones).

## 4. Evidencia de Ejecución
El sistema ha sido validado mediante las siguientes operaciones:
- **Integridad:** Las llaves foráneas vinculan correctamente productos con categorías y pedidos con usuarios.
- **Transaccionalidad:** Se verificó que al realizar una compra (Pedido 99), el stock del producto disminuye automáticamente y el registro queda grabado de forma atómica.
- **Consultas:** El sistema identifica correctamente productos con stock crítico (menos de 5 unidades) para facilitar la reposición.