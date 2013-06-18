-- phpMyAdmin SQL Dump
-- version 3.1.3.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 11-06-2013 a las 11:19:12
-- Versión del servidor: 5.1.33
-- Versión de PHP: 5.2.9-2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `veterinaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_documento` smallint(6) NOT NULL,
  `numero_documento` varchar(12) NOT NULL,
  `nombres_cliente` varchar(45) NOT NULL,
  `apellidos_cliente` varchar(45) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `numero_documento_UNIQUE` (`numero_documento`),
  KEY `cliente_tipo_documento_idx` (`id_tipo_documento`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Volcar la base de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `id_tipo_documento`, `numero_documento`, `nombres_cliente`, `apellidos_cliente`, `telefono`, `direccion`) VALUES
(2, 1, '1115812075', 'LENNER', 'ESPAÑA', '3156706265', 'calle 1 num 3a-60 '),
(3, 2, '44551212121', 'DANIELA', 'NARVAEZ', '3114587852', 'calle 1 num 3a-60 '),
(4, 2, '3213213232', 'MAYRA', 'SOLARTE', '3114589875', 'CLLE 1N 3-14'),
(6, 1, '15461854157', 'mauricio', 'saavedra', '257154154', 'cra22#7-48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE IF NOT EXISTS `detalle_factura` (
  `id_detalle_factura` int(11) NOT NULL AUTO_INCREMENT,
  `id_factura` int(11) NOT NULL,
  `id_servicio` smallint(6) NOT NULL,
  `valor` double NOT NULL,
  `cantidad` smallint(6) NOT NULL,
  PRIMARY KEY (`id_detalle_factura`),
  KEY `detalle_factura_factura_idx` (`id_factura`),
  KEY `detalle_factura_servicio_idx` (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `detalle_factura`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE IF NOT EXISTS `factura` (
  `id_factura` int(11) NOT NULL AUTO_INCREMENT,
  `id_mascota` int(11) DEFAULT NULL,
  `fecha_factura` datetime DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `factura_mascota_idx` (`id_mascota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `factura`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

CREATE TABLE IF NOT EXISTS `mascota` (
  `id_mascota` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `especie` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `genero` varchar(10) NOT NULL,
  `raza` varchar(20) NOT NULL,
  `color` varchar(20) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `peso` float NOT NULL,
  `observaciones` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_mascota`),
  KEY `mascota_cliente_idx` (`id_cliente`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `mascota`
--

INSERT INTO `mascota` (`id_mascota`, `id_cliente`, `especie`, `nombre`, `genero`, `raza`, `color`, `fecha_nacimiento`, `peso`, `observaciones`) VALUES
(3, 2, 'GATA', 'BOLA DE NIEVE', 'HEMBRA', 'COMUN', 'NEGRA', '0012-10-06', 7, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE IF NOT EXISTS `servicio` (
  `id_servicio` smallint(6) NOT NULL AUTO_INCREMENT,
  `nombre_servicio` varchar(45) NOT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `servicio`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `id_tipo_documento` smallint(6) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_documento` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_documento`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`id_tipo_documento`, `nombre_tipo_documento`) VALUES
(1, 'CC'),
(2, 'TI');

--
-- Filtros para las tablas descargadas (dump)
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_tipo_documento` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipo_documento` (`id_tipo_documento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD CONSTRAINT `detalle_factura_factura` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detalle_factura_servicio` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_mascota` FOREIGN KEY (`id_mascota`) REFERENCES `mascota` (`id_mascota`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD CONSTRAINT `mascota_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;
