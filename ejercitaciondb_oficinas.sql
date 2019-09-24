-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-09-2019 a las 05:43:55
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejercitaciondb_oficinas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_contratos`
--

CREATE TABLE `datos_contratos` (
  `cod_empleado` int(11) DEFAULT NULL,
  `fecha_contrato` date DEFAULT NULL,
  `cuota` int(11) DEFAULT NULL,
  `ventas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `datos_contratos`
--

INSERT INTO `datos_contratos` (`cod_empleado`, `fecha_contrato`, `cuota`, `ventas`) VALUES
(132, '0000-00-00', 6, 1),
(152, '0000-00-00', 2, 11),
(234, '0000-00-00', 4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `cod_documento` int(11) NOT NULL,
  `descripcion` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `documentos`
--

INSERT INTO `documentos` (`cod_documento`, `descripcion`) VALUES
(22, 'DNI'),
(669631, 'ENROLAMIENTO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `cod_empleado` int(11) NOT NULL,
  `apellido` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `nombre` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `num_doc` int(11) DEFAULT NULL,
  `cod_jefe` int(11) DEFAULT NULL,
  `cod_oficina` int(11) DEFAULT NULL,
  `cod_documento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`cod_empleado`, `apellido`, `nombre`, `fecha_nacimiento`, `num_doc`, `cod_jefe`, `cod_oficina`, `cod_documento`) VALUES
(132, 'Vargas', 'Selene', '0000-00-00', 4122342, 252, 3, 22),
(152, 'Gomez', 'Agustin', '0000-00-00', 42147544, 233, 1, 22),
(234, 'Gonzalez', 'Camila', '0000-00-00', 41555698, 443, 2, 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fabricantes`
--

CREATE TABLE `fabricantes` (
  `cod_fabricante` int(11) NOT NULL,
  `razon_social` varchar(26) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `fabricantes`
--

INSERT INTO `fabricantes` (`cod_fabricante`, `razon_social`) VALUES
(25, 'La anonima SRL'),
(256, 'BP4 SA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listas`
--

CREATE TABLE `listas` (
  `cod_listas` int(11) NOT NULL,
  `descripcion` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `ganancia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `listas`
--

INSERT INTO `listas` (`cod_listas`, `descripcion`, `ganancia`) VALUES
(23, 'Lista de prductos', 2330),
(26, 'Lista de proveedores', 3234),
(34, 'Lista de clientes', 6000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficinas`
--

CREATE TABLE `oficinas` (
  `cod_oficina` int(11) NOT NULL,
  `codigo_director` int(11) DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `oficinas`
--

INSERT INTO `oficinas` (`cod_oficina`, `codigo_director`, `descripcion`) VALUES
(1, 25, 'RRHH'),
(2, 53, 'Marketing'),
(3, 93, 'Sistemas'),
(4, 64, 'Soporte'),
(5, 45, 'Infraestructura'),
(6, 73, 'Seguridad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `cod_producto` int(11) NOT NULL,
  `dsecripcion` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `cantidad_stock` int(11) DEFAULT NULL,
  `punto_reposicion` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `cod_fabricante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `datos_contratos`
--
ALTER TABLE `datos_contratos`
  ADD KEY `cod_empleado` (`cod_empleado`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`cod_documento`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`cod_empleado`),
  ADD KEY `cod_oficina` (`cod_oficina`),
  ADD KEY `cod_documento` (`cod_documento`);

--
-- Indices de la tabla `fabricantes`
--
ALTER TABLE `fabricantes`
  ADD PRIMARY KEY (`cod_fabricante`);

--
-- Indices de la tabla `listas`
--
ALTER TABLE `listas`
  ADD PRIMARY KEY (`cod_listas`);

--
-- Indices de la tabla `oficinas`
--
ALTER TABLE `oficinas`
  ADD PRIMARY KEY (`cod_oficina`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`cod_producto`),
  ADD KEY `cod_fabricante` (`cod_fabricante`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `datos_contratos`
--
ALTER TABLE `datos_contratos`
  ADD CONSTRAINT `datos_contratos_ibfk_1` FOREIGN KEY (`cod_empleado`) REFERENCES `empleados` (`cod_empleado`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`cod_oficina`) REFERENCES `oficinas` (`cod_oficina`),
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`cod_documento`) REFERENCES `documentos` (`cod_documento`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`cod_fabricante`) REFERENCES `fabricantes` (`cod_fabricante`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
