-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-09-2019 a las 03:06:49
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejercitaciondb_prov_prod`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `PNRO` int(11) NOT NULL,
  `PNOMBRE` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Precio` float DEFAULT NULL,
  `Tañano` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Localidad` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Importador` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`PNRO`, `PNOMBRE`, `Precio`, `Tañano`, `Localidad`, `Importador`) VALUES
(1, 'Talco', 5, 'Chico', 'Capital Federal', NULL),
(2, 'Talco', 7, 'Chico', 'Capital Federal', NULL),
(3, 'Crema', 8, 'Grande', 'Ramos Mejia', NULL),
(4, 'Cepillo', 2, 'Grande', 'Avellaneda', NULL),
(5, 'Esmalte', 1.2, 'Normal', 'Chacarita', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `Numero` int(11) NOT NULL,
  `Nombre` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Domicilio` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Localidad` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`Numero`, `Nombre`, `Domicilio`, `Localidad`) VALUES
(101, 'Gomez', 'Nazca 920', 'Capital Federal'),
(102, 'Perez', 'Argerich 1030', 'Capital Federal'),
(103, 'Vazquez', 'Sarmiento 450', 'Ramos Mejia'),
(104, 'Lopez', 'Alsina 720', 'Avellaneda'),
(107, 'Rosales', NULL, 'Wilde');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prov_prod`
--

CREATE TABLE `prov_prod` (
  `Numero` int(11) NOT NULL,
  `PNRO` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `prov_prod`
--

INSERT INTO `prov_prod` (`Numero`, `PNRO`, `Cantidad`) VALUES
(101, 5, 100),
(101, 2, 200),
(101, 4, 200),
(101, 1, 300),
(101, 3, 400),
(102, 1, 300),
(102, 2, 400),
(103, 2, 200),
(104, 2, 200),
(104, 4, 300);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_pnro_nprov`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_pnro_nprov` (
`Numero` int(11)
,`PNRO` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_provs_wilde`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_provs_wilde` (
`Numero` int(11)
,`Nombre` varchar(255)
,`Domicilio` varchar(255)
,`Localidad` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `v_pnro_nprov`
--
DROP TABLE IF EXISTS `v_pnro_nprov`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pnro_nprov`  AS  select `prov`.`Numero` AS `Numero`,`prod`.`PNRO` AS `PNRO` from (`proveedores` `prov` join `productos` `prod`) where (`prov`.`Localidad` <> `prod`.`Localidad`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_provs_wilde`
--
DROP TABLE IF EXISTS `v_provs_wilde`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_provs_wilde`  AS  (select `p`.`Numero` AS `Numero`,`p`.`Nombre` AS `Nombre`,`p`.`Domicilio` AS `Domicilio`,`p`.`Localidad` AS `Localidad` from `proveedores` `p` where (`p`.`Localidad` = 'Wilde')) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`PNRO`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`Numero`);

--
-- Indices de la tabla `prov_prod`
--
ALTER TABLE `prov_prod`
  ADD PRIMARY KEY (`Numero`,`Cantidad`,`PNRO`),
  ADD KEY `PNRO` (`PNRO`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prov_prod`
--
ALTER TABLE `prov_prod`
  ADD CONSTRAINT `prov_prod_ibfk_1` FOREIGN KEY (`Numero`) REFERENCES `proveedores` (`Numero`),
  ADD CONSTRAINT `prov_prod_ibfk_2` FOREIGN KEY (`Numero`) REFERENCES `proveedores` (`Numero`),
  ADD CONSTRAINT `prov_prod_ibfk_3` FOREIGN KEY (`PNRO`) REFERENCES `productos` (`PNRO`),
  ADD CONSTRAINT `prov_prod_ibfk_4` FOREIGN KEY (`PNRO`) REFERENCES `productos` (`PNRO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
