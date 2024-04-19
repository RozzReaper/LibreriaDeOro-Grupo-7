-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-04-2024 a las 03:32:33
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ecommerce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `bitacoracod` int(11) NOT NULL,
  `bitacorafch` datetime DEFAULT NULL,
  `bitprograma` varchar(255) DEFAULT NULL,
  `bitdescripcion` varchar(255) DEFAULT NULL,
  `bitobservacion` mediumtext DEFAULT NULL,
  `bitTipo` char(3) DEFAULT NULL,
  `bitusuario` bigint(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funciones`
--

CREATE TABLE `funciones` (
  `fncod` varchar(255) NOT NULL,
  `fndsc` varchar(255) DEFAULT NULL,
  `fnest` char(3) DEFAULT NULL,
  `fntyp` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `funciones`
--

INSERT INTO `funciones` (`fncod`, `fndsc`, `fnest`, `fntyp`) VALUES
('Controllers\\Products\\Product', 'Formulario de Productos', 'ACT', 'CTR'),
('Controllers\\Products\\Products', 'Lista de Productos', 'ACT', 'CTR'),
('Menu_PaymentCheckout', 'Menu_PaymentCheckout', 'ACT', 'MNU'),
('Menu_Products', 'Menu_Products', 'ACT', 'MNU'),
('product_DEL', 'Eliminar Productos', 'ACT', 'FNC'),
('product_DSP', 'Detalle de Productos', 'ACT', 'FNC'),
('product_INS', 'Agregar Productos', 'ACT', 'FNC'),
('product_UPD', 'Editar Productos', 'ACT', 'FNC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funciones_roles`
--

CREATE TABLE `funciones_roles` (
  `rolescod` varchar(128) NOT NULL,
  `fncod` varchar(255) NOT NULL,
  `fnrolest` char(3) DEFAULT NULL,
  `fnexp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `funciones_roles`
--

INSERT INTO `funciones_roles` (`rolescod`, `fncod`, `fnrolest`, `fnexp`) VALUES
('ADMIN', 'Controllers\\Products\\Product', 'ACT', '2025-03-20 20:52:18'),
('ADMIN', 'Controllers\\Products\\Products', 'ACT', '2025-03-20 20:52:31'),
('ADMIN', 'Menu_Products', 'ACT', '2025-03-20 20:52:40'),
('ADMIN', 'product_DEL', 'ACT', '2025-03-20 20:29:28'),
('ADMIN', 'product_DSP', 'ACT', '2025-03-20 20:29:27'),
('ADMIN', 'product_INS', 'ACT', '2025-03-20 20:29:29'),
('ADMIN', 'product_UPD', 'ACT', '2025-03-20 20:29:27'),
('AUDIT', 'Controllers\\Products\\Product', 'ACT', '2025-03-20 20:52:19'),
('AUDIT', 'Controllers\\Products\\Products', 'ACT', '2025-03-20 20:52:32'),
('AUDIT', 'Menu_Products', 'ACT', '2025-03-20 20:52:40'),
('AUDIT', 'product_DSP', 'ACT', '2025-03-20 20:29:29'),
('OPADQ', 'Controllers\\Products\\Product', 'ACT', '2025-03-20 20:52:20'),
('OPADQ', 'Controllers\\Products\\Products', 'ACT', '2025-03-20 20:52:32'),
('OPADQ', 'Menu_Products', 'ACT', '2025-03-20 20:52:41'),
('OPADQ', 'product_DSP', 'ACT', '2025-03-20 20:29:30'),
('OPADQ', 'product_UPD', 'ACT', '2025-03-20 20:29:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `highlights`
--

CREATE TABLE `highlights` (
  `highlightId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `highlightStart` datetime NOT NULL,
  `highlightEnd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `highlights`
--

INSERT INTO `highlights` (`highlightId`, `productId`, `highlightStart`, `highlightEnd`) VALUES
(1, 1, '2023-08-01 00:00:00', '2023-10-31 23:59:59'),
(2, 4, '2023-08-01 00:00:00', '2023-10-31 23:59:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `idlibro` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `autor` varchar(50) DEFAULT NULL,
  `fecha` int(11) DEFAULT NULL,
  `codlicencia` int(11) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`idlibro`, `titulo`, `autor`, `fecha`, `codlicencia`, `precio`) VALUES
(2, 'La divina Comedia', 'Dante Alligheri', 1500, 2, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productDescription` text NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productImgUrl` varchar(255) NOT NULL,
  `productStatus` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
(1, 'Negocios Web Intro', 'Libro de Introducción a los Negocios Web 70 pg', 200.00, 'https://placehold.co/290x250?text=Negocios-Web-Intro&font=roboto', 'ACT'),
(2, 'Negocios Web 2', 'Libro de Negocios Web 2 POO 120 pg', 300.00, 'https://placehold.co/290x250?text=Negocios-Web-2&font=roboto', 'ACT'),
(3, 'Negocios Web Advance', 'Libro de Negocios Web Ingreso Pasivo 170 pg', 700.00, 'https://placehold.co/290x250?text=Negocios-Web-Advance&font=roboto', 'ACT'),
(4, 'Negocios Web Full', 'Libro de Negocios Web Full Stack 220 pg', 1000.00, 'https://placehold.co/290x250?text=Negocios-Web-Full&font=roboto', 'ACT'),
(5, 'Negocios Web Master', 'Libro de Negocios Web Master 300 pg', 1500.00, 'https://placehold.co/290x250?text=Negocios-Web-Master&font=roboto', 'ACT'),
(6, 'Negocios Web Expert', 'Libro de Negocios Web Expert 400 pg', 2000.00, 'https://placehold.co/290x250?text=Negocios-Web-Expert&font=roboto', 'ACT'),
(7, 'Negocios Web Guru', 'Libro de Negocios Web Guru 500 pg', 2500.00, 'https://placehold.co/290x250?text=Negocios-Web-Guru&font=roboto', 'ACT'),
(8, 'Negocios Web Master Ninha', 'Libro de Negocios Web Master Ninja 300 pg', 1500.00, 'https://placehold.co/290x250?text=Negocios-Web-Master-Ninja&font=roboto', 'ACT'),
(9, 'Negocios Web Expert Ninja', 'Libro de Negocios Web Expert Ninja 400 pg', 2000.00, 'https://placehold.co/290x250?text=Negocios-Web-Expert-Ninja&font=roboto', 'ACT'),
(10, 'Negocios Web Guru Ninja', 'Libro de Negocios Web Guru Ninja 500 pg', 2500.00, 'https://placehold.co/290x250?text=Negocios-Web-Guru-Ninja&font=roboto', 'ACT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `rolescod` varchar(128) NOT NULL,
  `rolesdsc` varchar(45) DEFAULT NULL,
  `rolesest` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`rolescod`, `rolesdsc`, `rolesest`) VALUES
('ADMIN', 'Administrador', 'ACT'),
('AUDIT', 'Auditor', 'ACT'),
('OPADQ', 'Operador de Adquisiciones', 'ACT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_usuarios`
--

CREATE TABLE `roles_usuarios` (
  `usercod` bigint(10) NOT NULL,
  `rolescod` varchar(128) NOT NULL,
  `roleuserest` char(3) DEFAULT NULL,
  `roleuserfch` datetime DEFAULT NULL,
  `roleuserexp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `roles_usuarios`
--

INSERT INTO `roles_usuarios` (`usercod`, `rolescod`, `roleuserest`, `roleuserfch`, `roleuserexp`) VALUES
(1, 'ADMIN', 'ACT', '2024-03-20 21:21:03', '2025-03-20 21:21:03'),
(2, 'AUDIT', 'ACT', '2024-03-20 21:21:04', '2025-03-20 21:21:04'),
(3, 'OPADQ', 'ACT', '2024-03-20 21:21:05', '2025-03-20 21:21:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `saleId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `salePrice` decimal(10,2) NOT NULL,
  `saleStart` datetime NOT NULL,
  `saleEnd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`saleId`, `productId`, `salePrice`, `saleStart`, `saleEnd`) VALUES
(1, 3, 500.00, '2023-08-01 00:00:00', '2023-10-31 23:59:59'),
(2, 5, 750.00, '2023-08-01 00:00:00', '2023-10-31 23:59:59'),
(3, 7, 1500.00, '2023-08-01 00:00:00', '2023-10-31 23:59:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usercod` bigint(10) NOT NULL,
  `useremail` varchar(80) DEFAULT NULL,
  `username` varchar(80) DEFAULT NULL,
  `userpswd` varchar(128) DEFAULT NULL,
  `userfching` datetime DEFAULT NULL,
  `userpswdest` char(3) DEFAULT NULL,
  `userpswdexp` datetime DEFAULT NULL,
  `userest` char(3) DEFAULT NULL,
  `useractcod` varchar(128) DEFAULT NULL,
  `userpswdchg` varchar(128) DEFAULT NULL,
  `usertipo` char(3) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usercod`, `useremail`, `username`, `userpswd`, `userfching`, `userpswdest`, `userpswdexp`, `userest`, `useractcod`, `userpswdchg`, `usertipo`) VALUES
(1, 'darkharvest106@gmail.com', 'José Rodriguez', '$2y$10$JYLRxfDoxVqM8tzFbxBIDOkjBuWikbd1v8JKScPKTanljh0.b0OTm', '2024-03-19 20:25:24', 'ACT', '2024-06-17 00:00:00', 'ACT', '10ae5503a57f9561baf0692fd8d494281e89e2e0562762b76fa532f0252716be', '2024-03-19 20:25:24', 'PBL'),
(2, 'chosenreaper72@gmail.com', 'John Doe', '$2y$10$et.RB.uoWD4XJuq5.1/co.fH7g6BvEjDRGoNTaRIj.ab9lBlnOAQK', '2024-03-19 20:30:07', 'ACT', '2024-06-17 00:00:00', 'ACT', '313d210e7ff042a7415d7937938c71bc65caa92f63a8ef3624f21bf9ada97585', '2024-03-19 20:30:07', 'PBL'),
(3, 'mariosabillon@gmail.com', 'Mario Sabillon', '$2y$10$RD3t6TrHBWiIBW8S6Pn8C.1yYjUvPBIU/iU0Q7SToX2lXrOsNAiMS', '2024-03-20 21:13:23', 'ACT', '2024-06-18 00:00:00', 'ACT', '1326c50fc44dba22b98173c3bfaf2a37b234f60bbd8beb33b8741b9b137909e0', '2024-03-20 21:13:23', 'PBL');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`bitacoracod`);

--
-- Indices de la tabla `funciones`
--
ALTER TABLE `funciones`
  ADD PRIMARY KEY (`fncod`);

--
-- Indices de la tabla `funciones_roles`
--
ALTER TABLE `funciones_roles`
  ADD PRIMARY KEY (`rolescod`,`fncod`),
  ADD KEY `rol_funcion_key_idx` (`fncod`);

--
-- Indices de la tabla `highlights`
--
ALTER TABLE `highlights`
  ADD PRIMARY KEY (`highlightId`),
  ADD KEY `fk_highlights_products_idx` (`productId`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`idlibro`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productId`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`rolescod`);

--
-- Indices de la tabla `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  ADD PRIMARY KEY (`usercod`,`rolescod`),
  ADD KEY `rol_usuario_key_idx` (`rolescod`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`saleId`),
  ADD KEY `fk_sales_products_idx` (`productId`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usercod`),
  ADD UNIQUE KEY `useremail_UNIQUE` (`useremail`),
  ADD KEY `usertipo` (`usertipo`,`useremail`,`usercod`,`userest`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `bitacoracod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `highlights`
--
ALTER TABLE `highlights`
  MODIFY `highlightId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `idlibro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `saleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usercod` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `funciones_roles`
--
ALTER TABLE `funciones_roles`
  ADD CONSTRAINT `funcion_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `rol_funcion_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `highlights`
--
ALTER TABLE `highlights`
  ADD CONSTRAINT `fk_highlights_products` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  ADD CONSTRAINT `rol_usuario_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuario_rol_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `fk_sales_products` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
