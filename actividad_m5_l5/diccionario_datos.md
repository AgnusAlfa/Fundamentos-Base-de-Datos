# Diccionario de Datos - Sistema Universitario

## Entidad: Estudiantes
| Campo | Tipo de Dato | Permite Nulos | Clave Primaria | Clave Foránea | Observaciones |
| :--- | :--- | :--- | :--- | :--- | :--- |
| rut | VARCHAR(10) | No | Sí | No | Identificador único del estudiante |
| nombre | VARCHAR(100) | No | No | No | Nombre completo del alumno |
| correo | VARCHAR(100) | No | No | No | Correo institucional |

## Entidad: Cursos
| Campo | Tipo de Dato | Permite Nulos | Clave Primaria | Clave Foránea | Observaciones |
| :--- | :--- | :--- | :--- | :--- | :--- |
| codigo | VARCHAR(20) | No | Sí | No | Código único de la asignatura |
| nombre | VARCHAR(100) | No | No | No | Nombre del curso |
| docente_responsable | VARCHAR(100) | No | No | No | Nombre del profesor a cargo |

## Entidad: Matriculas (Relación)
| Campo | Tipo de Dato | Permite Nulos | Clave Primaria | Clave Foránea | Observaciones |
| :--- | :--- | :--- | :--- | :--- | :--- |
| id | INTEGER | No | Sí | No | Correlativo único de matrícula |
| estudiante_rut | VARCHAR(10) | No | No | Sí | RUT del estudiante matriculado |
| curso_codigo | VARCHAR(20) | No | No | Sí | Código del curso inscrito |
| fecha | DATE | No | No | No | Fecha exacta de la inscripción |
| anio | INTEGER | No | No | No | Año académico vigente |

---

## 4. Reflexión Final

**¿Cuál fue la mayor dificultad al transformar el modelo conceptual al relacional?**
La mayor dificultad fue gestionar la relación de "Muchos a Muchos" entre estudiantes y cursos. En el modelo conceptual es solo una línea, pero en el relacional se debe crear obligatoriamente una tabla intermedia (Matrículas) para mantener la integridad de los datos y evitar duplicidad[cite: 2].

**¿Qué ventajas tiene normalizar una base de datos? ¿Y cuándo conviene desnormalizarla?**
La normalización reduce drásticamente la redundancia de datos y protege la integridad referencial[cite: 2]. Conviene desnormalizar en sistemas con volúmenes gigantescos de datos (Big Data) donde la velocidad de lectura es más crítica que el ahorro de espacio, simplificando las consultas complejas a costa de repetir información[cite: 2].