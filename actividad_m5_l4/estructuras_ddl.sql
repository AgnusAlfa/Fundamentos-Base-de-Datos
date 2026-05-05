
-- 1. CREACIÓN DE TABLAS (DDL)


CREATE TABLE departamentos (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE empleados (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100),
    departamento_id INTEGER,
    FOREIGN KEY (departamento_id) REFERENCES departamentos (id)
);

/*
EXPLICACIONES TEÓRICAS SOLICITADAS:
- ¿Qué es una clave primaria y por qué se usa en id?
  Es un identificador único e irrepetible para cada registro dentro de una tabla. Se usa en el 'id' para garantizar que no existan dos filas exactamente iguales y para poder relacionar los datos con otras tablas de forma segura.

- ¿Qué significa NOT NULL?
  Es una restricción que obliga a que una columna jamás quede vacía al insertar un dato. Por ejemplo, garantiza que es obligatorio ingresar el 'nombre' de un departamento o empleado.

- ¿Qué relación existe entre empleados y departamentos?
  Es una relación de "uno a muchos" (1:N). Un departamento puede tener múltiples empleados, pero cada empleado pertenece a un solo departamento. Esta conexión se establece a través de la clave foránea (FOREIGN KEY) 'departamento_id' en la tabla empleados.
*/



-- 2. MODIFICAR TABLAS EXISTENTES


-- A empleados: un campo fecha_ingreso DATE
ALTER TABLE empleados ADD COLUMN fecha_ingreso DATE;

-- A departamentos: un campo ubicacion VARCHAR(100)
ALTER TABLE departamentos ADD COLUMN ubicacion VARCHAR(100);

-- Modificar el campo correo para que no permita nulos (SET NOT NULL)
ALTER TABLE empleados ALTER COLUMN correo SET NOT NULL;

-- Intentar modificar una clave primaria
-- OJO: Esto también dará error en SQLite intencionalmente.
ALTER TABLE departamentos ALTER COLUMN id DROP NOT NULL;

/* 
DOCUMENTACIÓN SOLICITADA EN LA PAUTA:
- Al intentar ejecutar el SET NOT NULL en el campo correo: SQLite arroja un error de sintaxis ("near 'ALTER'"). Esto ocurre porque SQLite tiene limitaciones en su comando ALTER TABLE y no permite modificar las restricciones de una columna existente de forma directa, a diferencia de motores como PostgreSQL. Para hacerlo en SQLite, habría que recrear la tabla completa.

- Al intentar modificar la clave primaria (id): También arroja error. Las claves primarias definen la estructura fundamental y la integridad referencial de la tabla. En la gran mayoría de los motores de bases de datos, no se puede alterar directamente la columna que actúa como Primary Key sin antes eliminar sus restricciones o crear una tabla nueva.
*/


-- 3. ELIMINAR Y TRUNCAR TABLAS


-- Eliminar la tabla empleados (Se elimina esta primero porque es la tabla "hija" que contiene la llave foránea)


-- Crear una tabla temporal de prueba
CREATE TABLE tabla_prueba (
    id INTEGER PRIMARY KEY,
    valor VARCHAR(50)
);

-- Insertar un par de registros
INSERT INTO tabla_prueba (valor) VALUES ('Registro 1'), ('Registro 2');

-- Ejecutar TRUNCATE sobre ella
/* 
DOCUMENTACIÓN: 
SQLite no soporta el comando DDL "TRUNCATE TABLE". 
Para lograr exactamente el mismo efecto (vaciar la tabla rápidamente), 
en SQLite se utiliza el comando DELETE sin la cláusula WHERE.
(Si el entorno fuera PostgreSQL, la sentencia sería: TRUNCATE TABLE tabla_prueba;)
*/
DELETE FROM tabla_prueba;

/*
DIFERENCIA ENTRE DELETE Y TRUNCATE:
1. DELETE: Es un comando de manipulación de datos (DML). Borra los registros fila por fila, 
   permite usar la cláusula WHERE para elegir exactamente qué borrar, y al borrar fila por fila, es más lento.
2. TRUNCATE: Es un comando de definición de datos (DDL). Vacía la tabla completa "de un solo golpe", 
   sin leer fila por fila, lo que lo hace muchísimo más rápido. Además, en motores robustos (como PostgreSQL), 
   TRUNCATE reinicia el contador de los IDs automáticos (SERIAL), cosa que DELETE no hace.
*/

