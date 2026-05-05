
-- 2. TRANSFORMACIÓN AL MODELO RELACIONAL


-- Tabla Estudiantes
CREATE TABLE estudiantes (
    rut VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL
);

-- Tabla Cursos
CREATE TABLE cursos (
    codigo VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    docente_responsable VARCHAR(100) NOT NULL
);

-- Tabla Matrículas (Tabla intermedia para relación N:M)
CREATE TABLE matriculas (
    id INTEGER PRIMARY KEY,
    estudiante_rut VARCHAR(10) NOT NULL,
    curso_codigo VARCHAR(20) NOT NULL,
    fecha DATE NOT NULL,
    anio INTEGER NOT NULL,
    -- Definición de llaves foráneas para mantener la integridad
    FOREIGN KEY (estudiante_rut) REFERENCES estudiantes(rut),
    FOREIGN KEY (curso_codigo) REFERENCES cursos(codigo)
);