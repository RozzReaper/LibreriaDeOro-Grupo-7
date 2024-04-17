-- Active: 1709340086356@@127.0.0.1@3306@phpmyadmin
CREATE TABLE pulseras(  
    sku varchar (32) NOT NULL PRIMARY KEY,
    nombre varchar(128) NOT NULL,
    precio DECIMAL(13.2) not NULL DEFAULT 0,
    colorDominante VARCHAR(32) not NULL DEFAULT 'blanco'
    
) COMMENT 'Tabla de pulseras';