-- Tabla: Información de libro
CREATE TABLE Libros (
    idlibro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(50),
    fecha INT,
    codlicencia INT,
    precio INT
);

-- Caso de uso para libro
