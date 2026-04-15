
## 1. ROL Y ELEMENTOS FUNDAMENTALES DE UNA BASE DE DATOS RELACIONAL

**Explica con tus palabras cupal es el rol de una base de datos relacional dentro de una empresa u organización:**
El rol principal de una base de datos relacional en una organización es centralizar, estructurar y asegurar la persistencia de la información crítica del negocio. Permite que múltiples usuarios y aplicaciones puedan consultar, insertar, actualizar y eliminar datos de manera eficiente, concurrente y segura, garantizando que la información sea consistente y no se pierda.

**Menciona 3 ejemplos concretos de su uso:**
1. **Sistema de Inventario:** Para controlar el stock en tiempo real, registrando entradas de proveedores y salidas por ventas.
2. **Gestión de Recursos Humanos (RRHH):** Para almacenar perfiles de empleados, historial de salarios, fechas de ingreso y roles dentro de la empresa.
3. **Sistema de Ventas y Facturación:** Para registrar transacciones, asociar facturas a clientes específicos y llevar el control de ingresos.

---

## 2. Características de un RDBMS

**Define qué es un RDBMS y nombra al menos 3 características que lo diferencian de otros tipos de sistemas de almacenamiento:**
Un RDBMS (Relational Database Management System) es un software diseñado para crear, administrar y consultar bases de datos relacionales, donde la información se organiza en tablas vinculadas entre sí.

**Nombra al menos 3 características que lo diferencian de otros tipos de sistemas de almacenamiento:**
* **Integridad Referencial:** Utiliza claves primarias y foráneas para asegurar que las relaciones entre tablas sean válidas (por ejemplo, no puedes crear una factura para un cliente que no existe).
* **Propiedades ACID:** Garantiza que las transacciones sean Atómicas, Consistentes, Aisladas y Duraderas, lo que evita la corrupción de datos ante fallos del sistema.
* **Uso estandarizado de SQL:** Emplea el Lenguaje de Consulta Estructurado (SQL) como estándar universal para interactuar con los datos.

**3 RDBMS ampliamente usados en la industria:**
1. **PostgreSQL:** Usado en aplicaciones de nivel empresarial, sistemas GIS (datos geográficos) y analítica compleja por su robustez y cumplimiento estricto del estándar SQL.
2. **MySQL:** Muy popular en desarrollo web tradicional, plataformas e-commerce y startups, frecuentemente integrado en stacks con PHP, Python o Node.js.
3. **SQLite:** Utilizado en entornos de desarrollo, pruebas locales, aplicaciones móviles (Android/iOS) y sistemas IoT, ya que es ligero y no requiere de un servidor externo para funcionar.

---

# 3. Herramientas y objetos

**Herramientas para consultar bases de datos:**
* **Gráficas (GUI):** DBeaver, pgAdmin (para PostgreSQL), MySQL Workbench.
* **Línea de comandos (CLI):** `psql` (para PostgreSQL), `mysql` (para MySQL).

**Funciones de los objetos de una base de datos:**
* **Tabla:** Es la estructura fundamental de almacenamiento. Organiza los datos en filas (registros) y columnas (atributos).
* **Vista:** Es una "tabla virtual" cuyo contenido es el resultado de una consulta SQL predefinida. Se usa para simplificar consultas complejas o restringir el acceso a ciertas columnas sensibles de una tabla real.
* **Índice:** Es una estructura de datos que mejora drásticamente la velocidad de las operaciones de búsqueda y lectura (como el índice de un libro), a cambio de consumir un poco más de espacio y tiempo al insertar o actualizar.
* **Llave primaria (Primary Key):** Es una columna (o conjunto de columnas) que identifica de manera única cada fila dentro de una tabla. No puede contener valores nulos ni repetidos.
* **Llave foránea (Foreign Key):** Es una columna que establece un vínculo entre los datos de dos tablas. Hace referencia a la llave primaria de otra tabla, asegurando la integridad de la relación.

---

## 4. Práctica guiada (PostgreSQL)

**Paso 1: Creación de la base de datos**
Utilizando la herramienta de línea de comandos `psql`, accedí al servidor local con mi usuario. Luego, ejecuté el siguiente comando SQL para crear la base de datos vacía:
`CREATE DATABASE empresa_demo;`

**Paso 2: Conexión a la nueva base de datos**
Para establecer y verificar la conexión a la base de datos recién creada, utilicé el comando de psql:
`\c empresa_demo`

**Evidencia de ejecución:**
A continuación, se adjunta la captura de pantalla de la terminal evidenciando la creación exitosa y el mensaje de confirmación: *"You are now connected to database 'empresa_demo'"*.

*(Nota: Ver imagen adjunta "Captura de pantalla")*