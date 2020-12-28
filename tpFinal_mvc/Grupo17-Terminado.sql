-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 18-12-2020 a las 15:46:27
-- Versión del servidor: 8.0.13-4
-- Versión de PHP: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ensVJtEB1e`
--
CREATE DATABASE IF NOT EXISTS `ensVJtEB1e` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `ensVJtEB1e`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Area`
--

CREATE TABLE `Area` (
  `codigo` int(2) NOT NULL,
  `descripcion` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `Area`
--

INSERT INTO `Area` (`codigo`, `descripcion`) VALUES
(1, 'Administrador'),
(2, 'Supervisor'),
(3, 'Encargado de taller'),
(4, 'Chofer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Arrastre`
--

CREATE TABLE `Arrastre` (
  `patente` varchar(7) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `chasis` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `codigo_tipoArrastre` int(11) NOT NULL,
  `estado` int(1) NOT NULL DEFAULT '1' COMMENT '1 - Disponible | 2 - En viaje | 3 - Fuera de servicio '
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `Arrastre`
--

INSERT INTO `Arrastre` (`patente`, `chasis`, `codigo_tipoArrastre`, `estado`) VALUES
('AA189AD', '775168', 1, 2),
('AA274AG', '498515', 1, 2),
('AA362AS', '831768', 2, 1),
('AA415TV', '12345678', 4, 1),
('AA449AD', '884654', 3, 1),
('AA537AG', '752105', 3, 1),
('AA624AS', '852157', 4, 1),
('AA712AD', '468708', 4, 1),
('AA800AG', '820810', 4, 1),
('AA887AS', '777450', 1, 1),
('AB135AG', '705687', 1, 1),
('AB230AS', '678666', 1, 1),
('AB318AD', '595287', 2, 1),
('AB405AG', '583419', 3, 1),
('AB493AS', '595948', 3, 1),
('AB581AD', '761560', 4, 1),
('AB668AG', '815072', 4, 1),
('AB756AS', '616372', 4, 1),
('AB843AD', '670323', 1, 1),
('AB931AG', '806730', 1, 1),
('AC125AD', '605737', 1, 2),
('AC208AG', '642287', 1, 1),
('AC296AS', '882174', 2, 1),
('AC383AD', '535330', 2, 1),
('AC471AG', '510019', 3, 1),
('AC559AS', '554550', 3, 1),
('AC646AD', '710797', 4, 1),
('AC734AG', '661897', 4, 1),
('AC821AS', '731202', 1, 1),
('AC909AD', '485098', 1, 1),
('AD100AQ', '730502', 5, 1),
('AD100AZ', '730027', 5, 1),
('AD145XA', '585822', 1, 1),
('AD14XAW', '775161', 1, 2),
('AD166AS', '815082', 1, 1),
('AD252AD', '758967', 1, 2),
('AD340AG', '549916', 2, 1),
('AD427AS', '703673', 3, 1),
('AD515AD', '704640', 3, 1),
('AD602AG', '555608', 4, 1),
('AD690AS', '495851', 4, 1),
('AD778AD', '873758', 4, 1),
('AD865AG', '747642', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Celulares`
--

CREATE TABLE `Celulares` (
  `id` int(10) NOT NULL,
  `numero` bigint(10) NOT NULL,
  `compañia` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `estado` int(10) NOT NULL DEFAULT '1' COMMENT ' 1 -disponible | 2 -No disponible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `Celulares`
--

INSERT INTO `Celulares` (`id`, `numero`, `compañia`, `estado`) VALUES
(1, 1522334455, 'Claro', 2),
(2, 1524334444, 'Movistar', 2),
(4, 1521335566, 'Claro', 1),
(5, 1544666666, 'Movistar', 2),
(6, 1148521364, 'Claro', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Chofer`
--

CREATE TABLE `Chofer` (
  `dni_chofer` int(8) NOT NULL,
  `tipo_licencia` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `vehiculo_asignado` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_celular` int(10) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT '1' COMMENT ' 1 - Disponible | 2 - En viaje'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `Chofer`
--

INSERT INTO `Chofer` (`dni_chofer`, `tipo_licencia`, `vehiculo_asignado`, `id_celular`, `estado`) VALUES
(14521474, 'B1', 'AA150QW', 5, 2),
(32514124, '', 'AC989QW', 2, 2),
(35553999, 'C1', 'AB582QW', 5, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cliente`
--

CREATE TABLE `Cliente` (
  `CUIT` bigint(11) NOT NULL,
  `denominacion` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` int(15) NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contacto1` bigint(15) DEFAULT '0',
  `contacto2` bigint(15) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `Cliente`
--

INSERT INTO `Cliente` (`CUIT`, `denominacion`, `direccion`, `telefono`, `email`, `contacto1`, `contacto2`) VALUES
(245556677, 'Mastil S.A.', 'del Bañado 378, 1755 Rafael Castillo, Argentina', 15482589, 'mastil@correo.com', 0, 0),
(278199902, 'Pirulin ', ' Rojas 154', 1541145215, 'adminyyy@gmail.com', 0, 0),
(2735666332, 'Pepito S.A', 'Laprida 2', 1533994499, 'mar@correo.com', 0, 0),
(20142510002, 'Unlam', 'Florencio Varela 2800', 41241148, 'unlam@correo.com', 0, 0),
(20145554442, 'Nuevo S.A.', ' Arieta 3522', 41112141, 'contacto@nuevo.com.ar', 0, 0),
(20359097145, 'alarcon sa', 'Torquinst 900', 41557474, 'alarcon@correo.com', 0, 0),
(25444111419, 'La Tablada S.A.', 'Av. Eva Perón 1344', 1541145215, 'tablada@correo.com', 1511221115, 0),
(27221114445, 'Laprida S.A', ' Av. Eva Perón 1555', 41145215, 'nicolasvilavila@gmail.com', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Costeo`
--

CREATE TABLE `Costeo` (
  `codigo` int(11) NOT NULL,
  `codigo_viaje` int(11) NOT NULL,
  `numero_factura` bigint(30) DEFAULT NULL,
  `detalles` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `litros_combustible` int(4) DEFAULT NULL,
  `precio` int(255) NOT NULL,
  `codigo_gastos` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `Costeo`
--

INSERT INTO `Costeo` (`codigo`, `codigo_viaje`, `numero_factura`, `detalles`, `direccion`, `litros_combustible`, `precio`, `codigo_gastos`) VALUES
(44, 4, 12345, 'shell', 'Team Roberto, Paula Albarracín, 1755 Rafael Castillo, Argentina', NULL, 12345, 1),
(45, 4, 1233, 'axion', 'Team Roberto, Paula Albarracín, 1755 Rafael Castillo, Argentina', 1200, 13000, 2),
(49, 4, 123444, 'choripan', 'Team Roberto, Paula Albarracín, 1755 Rafael Castillo, Argentina', NULL, 140, 1),
(50, 4, 12, 'market', 'Team Roberto, Paula Albarracín, 1755 Rafael Castillo, Argentina', NULL, 120, 3),
(52, 4, 89, 'ruta 3', 'Team Roberto, Paula Albarracín, 1755 Rafael Castillo, Argentina', NULL, 1476, 7),
(54, 6, 1200, 'market', 'Team Roberto, Paula Albarracín, 1755 Rafael Castillo, Argentina', NULL, 150, 1),
(55, 6, 555888888, 'Axion', 'Pablo H Martin, Luis María Drago, 1755 Rafael Castillo, Argentina', 10, 1500, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Gastos`
--

CREATE TABLE `Gastos` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `Gastos`
--

INSERT INTO `Gastos` (`codigo`, `nombre`) VALUES
(1, 'Viaticos'),
(2, 'Combustible'),
(3, 'Peajes'),
(6, 'Pesajes'),
(7, 'Extras'),
(8, 'Hazard'),
(9, 'Reefer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Mantenimiento`
--

CREATE TABLE `Mantenimiento` (
  `codigo` int(3) NOT NULL,
  `patente_vehiculo` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `fecha inicio` date NOT NULL,
  `fecha final` date DEFAULT NULL,
  `kilometraje` int(11) NOT NULL,
  `costo` int(11) NOT NULL,
  `cod_taller` bigint(11) DEFAULT NULL,
  `dni_mecanico` int(20) NOT NULL,
  `id_proximo` int(5) DEFAULT NULL,
  `repuestos_cambiados` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `Mantenimiento`
--

INSERT INTO `Mantenimiento` (`codigo`, `patente_vehiculo`, `fecha inicio`, `fecha final`, `kilometraje`, `costo`, `cod_taller`, `dni_mecanico`, `id_proximo`, `repuestos_cambiados`) VALUES
(7, 'AA123CD', '2020-11-27', '2020-11-30', 15000, 20000, 2014125982, 14521414, 18, 'Luces');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Marca`
--

CREATE TABLE `Marca` (
  `codigo` int(2) NOT NULL,
  `nombre` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `Marca`
--

INSERT INTO `Marca` (`codigo`, `nombre`) VALUES
(1, 'Iveco'),
(2, 'Scania'),
(3, 'Mercedes Benz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Modelo`
--

CREATE TABLE `Modelo` (
  `cod_modelo` int(11) NOT NULL,
  `cod_marca` int(11) NOT NULL,
  `descripcion` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `Modelo`
--

INSERT INTO `Modelo` (`cod_modelo`, `cod_marca`, `descripcion`) VALUES
(1, 1, 'Cursor'),
(2, 2, 'G310'),
(3, 2, 'G410'),
(4, 2, 'G460'),
(5, 3, 'Actros 1846');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Service`
--

CREATE TABLE `Service` (
  `id` int(5) NOT NULL,
  `patente_vehiculo` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `Service`
--

INSERT INTO `Service` (`id`, `patente_vehiculo`, `fecha`) VALUES
(17, 'AA123CD', '2020-12-08'),
(18, 'AA123CD', '2021-01-27'),
(19, 'AA123CD', '2021-01-13'),
(21, 'AB582QW', '2020-12-10'),
(22, 'AA123CD', '2020-12-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Taller`
--

CREATE TABLE `Taller` (
  `CUIT` bigint(11) NOT NULL,
  `nombre` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `Taller`
--

INSERT INTO `Taller` (`CUIT`, `nombre`, `direccion`, `telefono`) VALUES
(2014125982, 'Empresa', 'Av. Eva Perón 1432', 41145214),
(20218346426, 'Propio', 'Av. Eva Perón 1500', 41112141);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoArrastre`
--

CREATE TABLE `tipoArrastre` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipoArrastre`
--

INSERT INTO `tipoArrastre` (`codigo`, `nombre`) VALUES
(1, 'Araña'),
(2, 'Jaula'),
(3, 'Tanque'),
(4, 'Granel'),
(5, 'CarCarrier');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `dni` int(8) NOT NULL,
  `nombre` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `fecha de nacimiento` date NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `rol` int(1) NOT NULL DEFAULT '0',
  `cod_area` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`dni`, `nombre`, `apellido`, `fecha de nacimiento`, `email`, `password`, `rol`, `cod_area`) VALUES
(12345678, 'Matias', 'Alarcon', '2000-12-30', 'usuario@correo.com', '827ccb0eea8a706c4c34a16891f84e7b', 1, 1),
(14521474, 'Jose', 'Hernandez', '1990-12-01', 'chofer2@correo.com', '827ccb0eea8a706c4c34a16891f84e7b', 4, 4),
(27233444, 'Juan', 'Delgado', '2020-11-06', 'jd@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 3, 3),
(32514124, 'Señor', 'Chofer', '2000-12-01', 'chofer@correo.com', '827ccb0eea8a706c4c34a16891f84e7b', 4, 4),
(32521412, 'Marcos', 'Andrada', '1990-10-01', 'marcos@correo.com', '827ccb0eea8a706c4c34a16891f84e7b', 0, 2),
(32521419, 'juan', 'delgado', '2020-12-17', 'vilavila@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 0, 1),
(35553999, 'juana', 'delgado', '2020-12-13', 'choferx@correo.com', '202cb962ac59075b964b07152d234b70', 0, 4),
(35909000, 'Jessica', 'Delgado', '1990-12-28', 'supervisor@correo.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 2),
(35909715, 'Matias', 'Alarcon', '1980-12-24', 'matias1@correo.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Vehiculo`
--

CREATE TABLE `Vehiculo` (
  `patente` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `cod_marca` int(11) NOT NULL,
  `cod_modelo` int(11) NOT NULL,
  `anio_fabricacion` int(4) NOT NULL,
  `chasis` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `motor` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `km actual` int(10) NOT NULL DEFAULT '0',
  `km total` int(10) NOT NULL,
  `posicion_actual` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` int(1) NOT NULL DEFAULT '1' COMMENT ' 1 - disponible, 2 - en viaje, 3 - fuera de servicio,4 - en mantenimiento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `Vehiculo`
--

INSERT INTO `Vehiculo` (`patente`, `cod_marca`, `cod_modelo`, `anio_fabricacion`, `chasis`, `motor`, `km actual`, `km total`, `posicion_actual`, `estado`) VALUES
('AA123CD', 1, 1, 2016, '5554455AS', '53879558', 0, 150, '-34.6947584,-58.612121599999995', 2),
('AA124DC', 1, 1, 2015, 'R69904367', '69904367', 0, 2000, '-34.693277099999996,-58.6115441', 2),
('AA150QW', 2, 3, 2014, 'I82039512', '82039512', 0, 1000, '-34.6958577,-58.619370499999995', 2),
('AB582QW', 3, 5, 2018, 'V17800122', '17800122', 0, 500, NULL, 2),
('AC989QW', 3, 5, 2013, 'F64092078', '64092078', 0, 14000, '-32.865343,-68.926989', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Viajes`
--

CREATE TABLE `Viajes` (
  `numero` int(10) NOT NULL,
  `fecha_emision` date NOT NULL,
  `cuit_cliente` bigint(11) NOT NULL,
  `fecha_viaje` date NOT NULL,
  `ETA` date NOT NULL,
  `direccion_origen` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `localidad_origen` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `provincia_origen` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pais_origen` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `direccion_destino` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `localidad_destino` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `provincia_destino` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pais_destino` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tipo_carga` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `peso_neto` int(10) NOT NULL,
  `imo_class` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `temperatura` int(11) DEFAULT NULL,
  `patente_vehiculo` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `patente_arrastre` varchar(7) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dni_chofer` int(11) NOT NULL,
  `id_celular` int(10) DEFAULT NULL,
  `km_previsto` int(10) NOT NULL,
  `combustible_previsto` int(7) NOT NULL,
  `viaticos_previsto` int(10) NOT NULL,
  `peajes_previsto` int(10) NOT NULL,
  `pesajes_previsto` int(10) NOT NULL,
  `extras_previsto` int(10) NOT NULL,
  `hazard_previsto` int(10) NOT NULL DEFAULT '0',
  `reefer_previsto` int(10) NOT NULL DEFAULT '0',
  `fee_previsto` int(8) NOT NULL,
  `estimado_total` int(10) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-No iniciado | 2 - En viaje | 3  - Finalizado	',
  `desviaciones` int(8) DEFAULT '0',
  `km_total` int(255) DEFAULT NULL,
  `combustible_total` int(255) DEFAULT NULL,
  `eta_real` date DEFAULT NULL,
  `viaticos_total` int(10) DEFAULT NULL,
  `peajes_total` int(10) DEFAULT NULL,
  `pesajes_total` int(10) DEFAULT NULL,
  `extras_total` int(11) DEFAULT NULL,
  `hazard_total` int(11) NOT NULL DEFAULT '0',
  `reefer_total` int(10) NOT NULL DEFAULT '0',
  `fee_total` int(8) DEFAULT NULL,
  `total_real` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `Viajes`
--

INSERT INTO `Viajes` (`numero`, `fecha_emision`, `cuit_cliente`, `fecha_viaje`, `ETA`, `direccion_origen`, `localidad_origen`, `provincia_origen`, `pais_origen`, `direccion_destino`, `localidad_destino`, `provincia_destino`, `pais_destino`, `tipo_carga`, `peso_neto`, `imo_class`, `temperatura`, `patente_vehiculo`, `patente_arrastre`, `dni_chofer`, `id_celular`, `km_previsto`, `combustible_previsto`, `viaticos_previsto`, `peajes_previsto`, `pesajes_previsto`, `extras_previsto`, `hazard_previsto`, `reefer_previsto`, `fee_previsto`, `estimado_total`, `estado`, `desviaciones`, `km_total`, `combustible_total`, `eta_real`, `viaticos_total`, `peajes_total`, `pesajes_total`, `extras_total`, `hazard_total`, `reefer_total`, `fee_total`, `total_real`) VALUES
(1, '2020-12-14', 2735666332, '2020-12-16', '2020-12-17', 'Estrada ', 'Rafael Castillo', 'BsAS', 'Argentina', 'Rojas', 'San Justo', 'Bs As', 'Argentina', '40\"', 2000, 'Clase 7', -78, 'AA124DC', 'AA274AG', 32514124, 1, 1, 2, 3, 4, 5, 6, 0, 0, 7, 22, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL),
(2, '2020-12-14', 2735666332, '2020-12-15', '2020-12-15', 'Estrada', 'Castillo', 'BsAS', 'Argentina', 'Rojas', 'Morón', 'Bs As', 'Argentina', '40\"', 2000, 'Clase 9', -78, 'AA123CD', 'AB843AD', 14521474, 1, 1, 2, 3, 4, 5, 6, 0, 0, 7, 22, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL),
(3, '2020-12-15', 20145554442, '2020-12-15', '2020-12-16', 'Av Presidente Peron 1550', 'San Justo', 'Bs As', 'Argentina', 'Ruiz 5000', 'Mar Del Plata', 'Buenos Aires', 'Argentina', '20\"', 2000, NULL, NULL, 'AA150QW', 'AA274AG', 14521474, 2, 1, 2, 3, 4, 5, 6, 0, 0, 7, 22, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL),
(4, '2020-02-14', 245556677, '2020-12-15', '2020-12-15', 'La rioja 123', 'Ciudadela', 'BsAS', 'Argentina', 'pilar', 'Ciudadela', 'Bs As', 'Argentina', 'Jaula', 2000, 'Clase 8', -78, 'AA124DC', 'AA274AG', 14521474, 1, 1, 2, 2, 2, 2, 2, 22, 22, 1, 53, 2, 0, 180, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 30453),
(5, '2020-12-14', 20142510002, '2020-12-15', '2020-12-16', 'Andes 150', 'San Justo', 'Bs As', 'Argentina', 'Ruiz 5000', 'Mar Del Plata', 'Buenos Aires', 'Argentina', '20\"', 200, NULL, NULL, 'AA150QW', 'AB318AD', 35553999, 2, 1, 2, 3, 4, 5, 6, 0, 0, 7, 22, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL),
(6, '2020-12-07', 245556677, '2020-12-15', '2020-12-16', 'La rioja 123', 'Castillo', 'BsAS', 'Argentina', 'Madrid 24', 'Merlo', 'Bs As', 'Argentina', '40\"', 2000, 'Clase 9', NULL, 'AA150QW', 'AB843AD', 14521474, 2, 2, 2, 4, 7, 58, 6, 8, 0, 1, 28, 1, 0, 140, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 1650),
(7, '2020-12-14', 245556677, '2020-12-15', '2020-12-16', 'Av Presidente Peron 1550', 'San Justo', 'Bs As', 'Argentina', 'Ruiz 5000', 'Mar Del Plata', 'Buenos Aires', 'Argentina', 'Líquida', 500, 'Clase 5.2', -68, 'AA124DC', 'AA189AD', 14521474, 1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 39, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL),
(8, '2020-12-14', 245556677, '2020-12-15', '2020-12-16', 'La rioja 123', 'Gonzales Catan', 'BsAS', 'Argentina', 'pilares', 'Morón', 'Bs As', 'Argentina', 'CarCarrier', 12445, NULL, NULL, 'AA150QW', 'AC125AD', 32514124, 4, 123, 466, 23, 67, 700, 0, 0, 0, 5666, 6222, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL),
(9, '2020-12-14', 27221114445, '2020-12-15', '2020-12-16', 'Andes 150', 'San Justo', 'Bs As', 'Argentina', 'Ruiz 5000', 'Mar Del Plata', 'Buenos Aires', 'Argentina', 'Líquida', 200, 'Clase 2', -78, 'AB582QW', 'AA274AG', 35553999, 5, 1, 2, 3, 4, 5, 6, 0, 0, 7, 22, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Area`
--
ALTER TABLE `Area`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `Arrastre`
--
ALTER TABLE `Arrastre`
  ADD PRIMARY KEY (`patente`),
  ADD KEY `fk_Arrastre_tipoArrastre` (`codigo_tipoArrastre`);

--
-- Indices de la tabla `Celulares`
--
ALTER TABLE `Celulares`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Chofer`
--
ALTER TABLE `Chofer`
  ADD PRIMARY KEY (`dni_chofer`),
  ADD KEY `fk_chofer_vehiculo` (`vehiculo_asignado`),
  ADD KEY `fk_chofer_cel` (`id_celular`);

--
-- Indices de la tabla `Cliente`
--
ALTER TABLE `Cliente`
  ADD PRIMARY KEY (`CUIT`);

--
-- Indices de la tabla `Costeo`
--
ALTER TABLE `Costeo`
  ADD PRIMARY KEY (`codigo`,`codigo_viaje`),
  ADD KEY `fk_costeo_gastos` (`codigo_gastos`),
  ADD KEY `fk_costeo_viajes` (`codigo_viaje`);

--
-- Indices de la tabla `Gastos`
--
ALTER TABLE `Gastos`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `Mantenimiento`
--
ALTER TABLE `Mantenimiento`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_taller` (`cod_taller`),
  ADD KEY `fk_vehiculo` (`patente_vehiculo`),
  ADD KEY `fk_proximo_service` (`id_proximo`);

--
-- Indices de la tabla `Marca`
--
ALTER TABLE `Marca`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `Modelo`
--
ALTER TABLE `Modelo`
  ADD PRIMARY KEY (`cod_modelo`,`cod_marca`),
  ADD KEY `cod_marca` (`cod_marca`);

--
-- Indices de la tabla `Service`
--
ALTER TABLE `Service`
  ADD PRIMARY KEY (`id`,`patente_vehiculo`),
  ADD KEY `patente_vehiculo` (`patente_vehiculo`);

--
-- Indices de la tabla `Taller`
--
ALTER TABLE `Taller`
  ADD PRIMARY KEY (`CUIT`);

--
-- Indices de la tabla `tipoArrastre`
--
ALTER TABLE `tipoArrastre`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`dni`),
  ADD KEY `fk_usuarios_area` (`cod_area`);

--
-- Indices de la tabla `Vehiculo`
--
ALTER TABLE `Vehiculo`
  ADD PRIMARY KEY (`patente`),
  ADD KEY `cod_modelo` (`cod_modelo`),
  ADD KEY `cod_marca` (`cod_marca`) USING BTREE;

--
-- Indices de la tabla `Viajes`
--
ALTER TABLE `Viajes`
  ADD PRIMARY KEY (`numero`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Area`
--
ALTER TABLE `Area`
  MODIFY `codigo` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `Celulares`
--
ALTER TABLE `Celulares`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `Costeo`
--
ALTER TABLE `Costeo`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `Gastos`
--
ALTER TABLE `Gastos`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `Mantenimiento`
--
ALTER TABLE `Mantenimiento`
  MODIFY `codigo` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `Marca`
--
ALTER TABLE `Marca`
  MODIFY `codigo` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `Modelo`
--
ALTER TABLE `Modelo`
  MODIFY `cod_modelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `Service`
--
ALTER TABLE `Service`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `tipoArrastre`
--
ALTER TABLE `tipoArrastre`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `Viajes`
--
ALTER TABLE `Viajes`
  MODIFY `numero` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Arrastre`
--
ALTER TABLE `Arrastre`
  ADD CONSTRAINT `fk_Arrastre_tipoArrastre` FOREIGN KEY (`codigo_tipoArrastre`) REFERENCES `tipoArrastre` (`codigo`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Chofer`
--
ALTER TABLE `Chofer`
  ADD CONSTRAINT `fk_chofer_cel` FOREIGN KEY (`id_celular`) REFERENCES `Celulares` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_chofer_dni` FOREIGN KEY (`dni_chofer`) REFERENCES `Usuarios` (`dni`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_chofer_vehiculo` FOREIGN KEY (`vehiculo_asignado`) REFERENCES `Vehiculo` (`patente`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Costeo`
--
ALTER TABLE `Costeo`
  ADD CONSTRAINT `fk_costeo_gastos` FOREIGN KEY (`codigo_gastos`) REFERENCES `Gastos` (`codigo`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_costeo_viajes` FOREIGN KEY (`codigo_viaje`) REFERENCES `Viajes` (`numero`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Mantenimiento`
--
ALTER TABLE `Mantenimiento`
  ADD CONSTRAINT `fk_proximo_service` FOREIGN KEY (`id_proximo`) REFERENCES `Service` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_taller` FOREIGN KEY (`cod_taller`) REFERENCES `Taller` (`cuit`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_vehiculo` FOREIGN KEY (`patente_vehiculo`) REFERENCES `Vehiculo` (`patente`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Modelo`
--
ALTER TABLE `Modelo`
  ADD CONSTRAINT `Modelo_ibfk_1` FOREIGN KEY (`cod_marca`) REFERENCES `Marca` (`codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Service`
--
ALTER TABLE `Service`
  ADD CONSTRAINT `Service_ibfk_1` FOREIGN KEY (`patente_vehiculo`) REFERENCES `Vehiculo` (`patente`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD CONSTRAINT `fk_usuarios_area` FOREIGN KEY (`cod_area`) REFERENCES `Area` (`codigo`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Vehiculo`
--
ALTER TABLE `Vehiculo`
  ADD CONSTRAINT `Vehiculo_ibfk_1` FOREIGN KEY (`cod_modelo`) REFERENCES `Modelo` (`cod_modelo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Vehiculo_ibfk_2` FOREIGN KEY (`cod_marca`) REFERENCES `Modelo` (`cod_marca`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
