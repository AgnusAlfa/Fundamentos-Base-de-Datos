1. ¿Qué es una transacción en bases de datos y por qué es importante?

Una transacción es una secuencia de operaciones en una base de datos que se tratan como una única unidad lógica de trabajo. Es fundamental porque garantiza que las operaciones complejas (como una transferencia de dinero) se completen en su totalidad o no se realicen en absoluto. Esto evita que la base de datos quede en un estado corrupto o inconsistente si ocurre un error a mitad del proceso.

2. Describe brevemente qué significa:

Atomicidad: Significa "todo o nada". Garantiza que todas las operaciones dentro de una transacción se completen con éxito. Si una sola operación falla, la transacción entera se deshace y la base de datos no sufre cambios.  

Consistencia: Asegura que cualquier transacción llevará a la base de datos de un estado válido a otro estado válido, respetando siempre todas las reglas, restricciones y llaves foráneas definidas.  

Aislamiento: Garantiza que las transacciones que se ejecutan al mismo tiempo (concurrentemente) no interfieran entre sí. Cada transacción se procesa como si fuera la única ejecutándose en el sistema.  

Durabilidad: Asegura que, una vez que una transacción ha sido confirmada con éxito, los cambios realizados son permanentes y sobrevivirán a cualquier fallo del sistema (como un corte de energía). 