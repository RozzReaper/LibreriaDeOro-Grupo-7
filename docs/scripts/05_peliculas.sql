-- Tabla: Información de Películas
CREATE TABLE Peliculas (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    director VARCHAR(50),
    año_estreno INT,
    genero VARCHAR(50),
    duracion_min INT
);

-- Caso de uso para Películas
-- Almacena datos sobre películas, incluyendo título, director, año de estreno, género y duración.