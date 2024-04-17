-- Active: 1709340086356@@127.0.0.1@3306@phpmyadmin
CREATE TABLE `navajas` (
  `sku` varchar(28) NOT NULL,
  `nombre` varchar(132) NOT NULL,
  `precio` decimal(13,2) NOT NULL DEFAULT 0.00,
  `descripcion` varchar(132) NOT NULL,
  PRIMARY KEY (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla para Navajas'