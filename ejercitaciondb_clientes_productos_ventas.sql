-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-09-2019 a las 03:05:17
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
-- Base de datos: `ejercitaciondb_clientes_productos_ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `codigo_cliente` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `domicilio` varchar(255) DEFAULT NULL,
  `provincia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`codigo_cliente`, `nombre`, `domicilio`, `provincia`) VALUES
(362, 'Dennison', '81832 Bultman Trail', 'New York'),
(519, 'Uriah', '6836 Talmadge Lane', 'California'),
(563, 'Willyt', '31 Portage Lane', 'Colorado'),
(698, 'Bryon', '2104 Amoth Alley', 'New York'),
(699, 'Bethanne', '71 Jackson Street', 'Georgia'),
(755, 'Alaine', '8 Eastwood Alley', 'Florida'),
(816, 'Dougy', '543 Fallview Court', 'Nebraska'),
(1010, 'Tiffi', '61 Hoepker Drive', 'Alabama'),
(1083, 'Angelique', '1 Sycamore Center', 'Louisiana'),
(1101, 'Chuck', '8 Debs Avenue', 'Florida'),
(1128, 'Carey', '78368 Fairfield Point', 'Texas'),
(1178, 'Yovonnda', '04 Morningstar Alley', 'Pennsylvania'),
(1232, 'Em', '3327 Veith Plaza', 'Virginia'),
(1264, 'Boonie', '61545 Delaware Road', 'California'),
(1353, 'Jack', '71614 Rigney Place', 'California'),
(1681, 'Rainer', '65951 Loftsgordon Center', 'Texas'),
(1729, 'Odelinda', '192 Morning Place', 'New York'),
(1747, 'Cinda', '779 Cascade Trail', 'Missouri'),
(1950, 'Weylin', '0435 Hauk Terrace', 'Ohio'),
(1965, 'Mariana', '82446 Roth Court', 'Colorado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_ventas`
--

CREATE TABLE `item_ventas` (
  `numero_factura` int(11) NOT NULL,
  `codigo_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `item_ventas`
--

INSERT INTO `item_ventas` (`numero_factura`, `codigo_producto`, `cantidad`, `precio`) VALUES
(7, 5, 98, 414),
(21, 2, 171, 35),
(22, 1, 58, 906),
(23, 1, 58, 906),
(29, 4, 156, 674),
(48, 3, 84, 588);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `codigo_producto` int(11) NOT NULL,
  `nombre_producto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`codigo_producto`, `nombre_producto`) VALUES
(1, 'Kiwi'),
(2, 'Red Snapper - Fillet, Skin On'),
(3, 'Chocolate - White'),
(4, 'Clams - Bay'),
(5, 'Egg Patty Fried'),
(6, 'Soup - Campbells, Butternut'),
(8, 'Sprouts - Baby Pea Tendrils'),
(9, 'Tomato - Peeled Italian Canned'),
(11, 'Olives - Kalamata'),
(13, 'Tart - Lemon'),
(16, 'Nantucket Apple Juice'),
(18, 'Beer - Mill St Organic'),
(20, 'Jam - Apricot'),
(24, 'Towels - Paper / Kraft'),
(25, 'Jam - Apricot'),
(29, 'Muffin Batt - Choc Chk'),
(32, 'Cheese - St. Paulin'),
(33, 'Jam - Apricot'),
(39, 'Ginger - Crystalized'),
(51, 'Jam - Apricot');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `numero_factura` int(11) DEFAULT NULL,
  `codigo_cliente` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`codigo_cliente`);

--
-- Indices de la tabla `item_ventas`
--
ALTER TABLE `item_ventas`
  ADD PRIMARY KEY (`numero_factura`),
  ADD KEY `codigo_producto` (`codigo_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`codigo_producto`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD KEY `codigo_cliente` (`codigo_cliente`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `item_ventas`
--
ALTER TABLE `item_ventas`
  ADD CONSTRAINT `item_ventas_ibfk_1` FOREIGN KEY (`codigo_producto`) REFERENCES `productos` (`codigo_producto`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`codigo_cliente`) REFERENCES `clientes` (`codigo_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
