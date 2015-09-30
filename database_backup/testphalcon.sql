-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-09-2015 a las 19:16:36
-- Versión del servidor: 5.5.27
-- Versión de PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `testphalcon`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `testprocedure`(IN companyid int(4),IN towerid int(4))
BEGIN
select c.name as companyname , t.number as towernumber  from company c inner join tower t
on (t.companyid =c.id) where c.id =companyid and  t.id =towerid;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `action`
--

CREATE TABLE IF NOT EXISTS `action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Volcado de datos para la tabla `action`
--

INSERT INTO `action` (`id`, `action`, `description`, `createuser`, `modifyuser`, `createdate`, `modifydate`) VALUES
(1, 'Manage Addresses', 'Permite la administración de direcciones', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(3, 'Manage Security', 'Permite manejar la seguridad del sistema', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(4, 'Manage Users', 'Permite administrar Usuarios', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(5, 'Manage Roles', 'Permite administrar Roles', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(6, 'Manage Actions', 'Permite administrar Acciones', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(7, 'Create User', 'Permite agregar usuarios', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(8, 'Delete User', 'Permite eliminar usuarios', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(9, 'Edit User', 'Permite editar usuarios', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(10, 'Change User Password', 'Permite cambiar las contraseñas de los usuarios', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(11, 'Manage User Role', 'Permite asociar roles a los usuarios', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(12, 'Manage Languages', 'Permite ver los idiomas', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(13, 'Create Language', 'Permite agreagar un nuevo idioma', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(14, 'Edit Language', 'Permite editar un idioma', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(15, 'Delete Language', 'Permite eliminar un idioma', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(16, 'Manage Translations', 'Permite manejar las opciones de idiomas y traducciones', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(18, 'Create Translation', 'Permite crear traducciones', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(19, 'Edit Translation', 'Permite editar traducciones', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(20, 'Delete Translation', 'Permite eliminar traducciones', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(22, 'Manage Role Actions', 'Permite agregar acciones a un rol', 'admin', 'admin', '2015-09-29 11:25:15', '2015-09-29 11:25:15'),
(23, 'Create Role', 'Permite crear roles', 'admin', 'admin', '2015-09-29 11:30:56', '2015-09-29 11:30:56'),
(24, 'Edit Role', 'Permite editar roles', 'admin', 'admin', '2015-09-29 11:32:32', '2015-09-29 11:32:32'),
(25, 'Delete Role', 'Permite eliminar roles', 'admin', 'admin', '2015-09-29 11:32:48', '2015-09-29 11:32:48'),
(26, 'Create Action', 'Permite crear acciones', 'admin', 'admin', '2015-09-29 13:51:25', '2015-09-29 13:51:25'),
(27, 'Edit Action', 'Permite editar acciones', 'admin', 'admin', '2015-09-29 13:52:11', '2015-09-29 13:52:11'),
(28, 'Delete Action', 'Permite eliminar acciones', 'admin', 'admin', '2015-09-29 13:52:26', '2015-09-29 13:52:26'),
(29, 'Create Country', 'Permite crear paises', 'admin', 'admin', '2015-09-29 16:15:13', '2015-09-29 16:15:13'),
(30, 'Edit Country', 'Permite editar paises', 'admin', 'admin', '2015-09-29 16:15:40', '2015-09-29 16:15:40'),
(31, 'Delete Country', 'Permite eliminar paises', 'admin', 'admin', '2015-09-29 16:15:57', '2015-09-29 16:15:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `action_role`
--

CREATE TABLE IF NOT EXISTS `action_role` (
  `actionid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL,
  PRIMARY KEY (`actionid`,`roleid`),
  KEY `fk_action_role_role1_idx` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `action_role`
--

INSERT INTO `action_role` (`actionid`, `roleid`, `createuser`, `modifyuser`, `createdate`, `modifydate`) VALUES
(1, 1, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(1, 2, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(3, 1, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(3, 2, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(4, 1, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(4, 2, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(5, 1, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(6, 1, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(7, 1, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(7, 2, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(8, 1, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(8, 2, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(9, 1, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(9, 2, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(10, 1, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(10, 2, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(11, 1, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(11, 2, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(12, 1, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(13, 1, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(14, 1, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(15, 1, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(16, 1, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(18, 1, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(19, 1, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(19, 2, 'admin', 'admin', '2015-09-29 09:19:56', '2015-09-29 09:19:56'),
(20, 1, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(22, 1, 'admin', 'admin', '2015-09-29 11:34:16', '2015-09-29 11:34:16'),
(23, 1, 'admin', 'admin', '2015-09-29 11:34:39', '2015-09-29 11:34:39'),
(24, 1, 'admin', 'admin', '2015-09-29 11:35:04', '2015-09-29 11:35:04'),
(25, 1, 'admin', 'admin', '2015-09-29 11:35:33', '2015-09-29 11:35:33'),
(26, 1, 'admin', 'admin', '2015-09-29 13:51:49', '2015-09-29 13:51:49'),
(27, 1, 'admin', 'admin', '2015-09-29 13:54:10', '2015-09-29 13:54:10'),
(28, 1, 'admin', 'admin', '2015-09-29 13:54:19', '2015-09-29 13:54:19'),
(29, 1, 'admin', 'admin', '2015-09-29 16:17:44', '2015-09-29 16:17:44'),
(30, 1, 'admin', 'admin', '2015-09-29 16:18:03', '2015-09-29 16:18:03'),
(31, 1, 'admin', 'admin', '2015-09-29 16:18:11', '2015-09-29 16:18:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countryid` int(11) NOT NULL,
  `stateid` int(11) NOT NULL,
  `cityid` int(11) NOT NULL,
  `townshipid` int(11) DEFAULT NULL,
  `neighborhoodid` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `address` varchar(400) DEFAULT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address_country1_idx` (`countryid`),
  KEY `fk_address_city1_idx` (`cityid`),
  KEY `fk_address_township1_idx` (`townshipid`),
  KEY `fk_address_neighborhood1_idx` (`neighborhoodid`),
  KEY `fk_address_state1_idx` (`stateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apartment`
--

CREATE TABLE IF NOT EXISTS `apartment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `towerid` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_apartment_tower1_idx` (`towerid`),
  KEY `fk_apartment_company1_idx` (`companyid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `apartment`
--

INSERT INTO `apartment` (`id`, `companyid`, `towerid`, `name`) VALUES
(1, 1, 1, '16 C'),
(2, 1, 2, '16 C'),
(3, 2, 4, '1A'),
(4, 2, 5, '3B');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `apartmentlist`
--
CREATE TABLE IF NOT EXISTS `apartmentlist` (
`id` int(11)
,`name` varchar(45)
,`company` varchar(45)
,`tower` varchar(45)
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stateid` int(11) NOT NULL,
  `countryid` int(11) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_city_country1_idx` (`countryid`),
  KEY `fk_city_state1_idx` (`stateid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `city`
--

INSERT INTO `city` (`id`, `stateid`, `countryid`, `city`, `createuser`, `modifyuser`, `createdate`, `modifydate`) VALUES
(1, 1, 173, 'Panamá', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(2, 16, 49, 'Bogotá', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `company`
--

INSERT INTO `company` (`id`, `name`, `createuser`, `modifyuser`, `createdate`, `modifydate`) VALUES
(1, 'Empresa1', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(2, 'Empresa2', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(3, 'Empresa3', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company_address`
--

CREATE TABLE IF NOT EXISTS `company_address` (
  `companyid` int(11) NOT NULL,
  `addressid` int(11) NOT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL,
  PRIMARY KEY (`companyid`,`addressid`),
  KEY `fk_company_address_address1_idx` (`addressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(4) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=251 ;

--
-- Volcado de datos para la tabla `country`
--

INSERT INTO `country` (`id`, `code`, `country`, `createuser`, `modifyuser`, `createdate`, `modifydate`) VALUES
(1, 'AD', 'Andorra', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(2, 'AE', 'United Arab Emirates', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(3, 'AF', 'Afghanistan', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(4, 'AG', 'Antigua and Barbuda', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(5, 'AI', 'Anguilla', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(6, 'AL', 'Albania', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(7, 'AM', 'Armenia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(8, 'AO', 'Angola', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(9, 'AQ', 'Antarctica', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(10, 'AR', 'Argentina', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(11, 'AS', 'American Samoa', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(12, 'AT', 'Austria', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(13, 'AU', 'Australia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(14, 'AW', 'Aruba', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(15, 'AX', 'Åland', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(16, 'AZ', 'Azerbaijan', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(17, 'BA', 'Bosnia and Herzegovina', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(18, 'BB', 'Barbados', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(19, 'BD', 'Bangladesh', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(20, 'BE', 'Belgium', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(21, 'BF', 'Burkina Faso', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(22, 'BG', 'Bulgaria', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(23, 'BH', 'Bahrain', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(24, 'BI', 'Burundi', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(25, 'BJ', 'Benin', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(26, 'BL', 'Saint Barthélemy', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(27, 'BM', 'Bermuda', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(28, 'BN', 'Brunei', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(29, 'BO', 'Bolivia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(30, 'BQ', 'Bonaire', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(31, 'BR', 'Brazil', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(32, 'BS', 'Bahamas', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(33, 'BT', 'Bhutan', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(34, 'BV', 'Bouvet Island', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(35, 'BW', 'Botswana', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(36, 'BY', 'Belarus', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(37, 'BZ', 'Belize', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(38, 'CA', 'Canada', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(39, 'CC', 'Cocos [Keeling] Islands', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(40, 'CD', 'Democratic Republic of the Congo', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(41, 'CF', 'Central African Republic', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(42, 'CG', 'Republic of the Congo', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(43, 'CH', 'Switzerland', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(44, 'CI', 'Ivory Coast', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(45, 'CK', 'Cook Islands', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(46, 'CL', 'Chile', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(47, 'CM', 'Cameroon', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(48, 'CN', 'China', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(49, 'CO', 'Colombia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(50, 'CR', 'Costa Rica', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(51, 'CU', 'Cuba', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(52, 'CV', 'Cape Verde', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(53, 'CW', 'Curacao', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(54, 'CX', 'Christmas Island', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(55, 'CY', 'Cyprus', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(56, 'CZ', 'Czech Republic', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(57, 'DE', 'Germany', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(58, 'DJ', 'Djibouti', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(59, 'DK', 'Denmark', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(60, 'DM', 'Dominica', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(61, 'DO', 'Dominican Republic', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(62, 'DZ', 'Algeria', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(63, 'EC', 'Ecuador', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(64, 'EE', 'Estonia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(65, 'EG', 'Egypt', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(66, 'EH', 'Western Sahara', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(67, 'ER', 'Eritrea', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(68, 'ES', 'Spain', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(69, 'ET', 'Ethiopia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(70, 'FI', 'Finland', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(71, 'FJ', 'Fiji', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(72, 'FK', 'Falkland Islands', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(73, 'FM', 'Micronesia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(74, 'FO', 'Faroe Islands', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(75, 'FR', 'France', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(76, 'GA', 'Gabon', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(77, 'GB', 'United Kingdom', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(78, 'GD', 'Grenada', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(79, 'GE', 'Georgia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(80, 'GF', 'French Guiana', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(81, 'GG', 'Guernsey', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(82, 'GH', 'Ghana', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(83, 'GI', 'Gibraltar', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(84, 'GL', 'Greenland', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(85, 'GM', 'Gambia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(86, 'GN', 'Guinea', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(87, 'GP', 'Guadeloupe', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(88, 'GQ', 'Equatorial Guinea', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(89, 'GR', 'Greece', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(90, 'GS', 'South Georgia and the South Sandwich Islands', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(91, 'GT', 'Guatemala', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(92, 'GU', 'Guam', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(93, 'GW', 'Guinea-Bissau', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(94, 'GY', 'Guyana', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(95, 'HK', 'Hong Kong', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(96, 'HM', 'Heard Island and McDonald Islands', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(97, 'HN', 'Honduras', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(98, 'HR', 'Croatia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(99, 'HT', 'Haiti', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(100, 'HU', 'Hungary', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(101, 'ID', 'Indonesia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(102, 'IE', 'Ireland', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(103, 'IL', 'Israel', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(104, 'IM', 'Isle of Man', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(105, 'IN', 'India', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(106, 'IO', 'British Indian Ocean Territory', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(107, 'IQ', 'Iraq', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(108, 'IR', 'Iran', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(109, 'IS', 'Iceland', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(110, 'IT', 'Italy', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(111, 'JE', 'Jersey', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(112, 'JM', 'Jamaica', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(113, 'JO', 'Jordan', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(114, 'JP', 'Japan', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(115, 'KE', 'Kenya', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(116, 'KG', 'Kyrgyzstan', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(117, 'KH', 'Cambodia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(118, 'KI', 'Kiribati', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(119, 'KM', 'Comoros', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(120, 'KN', 'Saint Kitts and Nevis', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(121, 'KP', 'North Korea', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(122, 'KR', 'South Korea', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(123, 'KW', 'Kuwait', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(124, 'KY', 'Cayman Islands', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(125, 'KZ', 'Kazakhstan', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(126, 'LA', 'Laos', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(127, 'LB', 'Lebanon', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(128, 'LC', 'Saint Lucia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(129, 'LI', 'Liechtenstein', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(130, 'LK', 'Sri Lanka', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(131, 'LR', 'Liberia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(132, 'LS', 'Lesotho', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(133, 'LT', 'Lithuania', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(134, 'LU', 'Luxembourg', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(135, 'LV', 'Latvia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(136, 'LY', 'Libya', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(137, 'MA', 'Morocco', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(138, 'MC', 'Monaco', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(139, 'MD', 'Moldova', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(140, 'ME', 'Montenegro', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(141, 'MF', 'Saint Martin', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(142, 'MG', 'Madagascar', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(143, 'MH', 'Marshall Islands', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(144, 'MK', 'Macedonia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(145, 'ML', 'Mali', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(146, 'MM', 'Myanmar [Burma]', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(147, 'MN', 'Mongolia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(148, 'MO', 'Macao', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(149, 'MP', 'Northern Mariana Islands', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(150, 'MQ', 'Martinique', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(151, 'MR', 'Mauritania', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(152, 'MS', 'Montserrat', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(153, 'MT', 'Malta', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(154, 'MU', 'Mauritius', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(155, 'MV', 'Maldives', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(156, 'MW', 'Malawi', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(157, 'MX', 'Mexico', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(158, 'MY', 'Malaysia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(159, 'MZ', 'Mozambique', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(160, 'NA', 'Namibia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(161, 'NC', 'New Caledonia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(162, 'NE', 'Niger', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(163, 'NF', 'Norfolk Island', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(164, 'NG', 'Nigeria', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(165, 'NI', 'Nicaragua', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(166, 'NL', 'Netherlands', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(167, 'NO', 'Norway', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(168, 'NP', 'Nepal', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(169, 'NR', 'Nauru', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(170, 'NU', 'Niue', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(171, 'NZ', 'New Zealand', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(172, 'OM', 'Oman', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(173, 'PA', 'Panama', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(174, 'PE', 'Peru', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(175, 'PF', 'French Polynesia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(176, 'PG', 'Papua New Guinea', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(177, 'PH', 'Philippines', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(178, 'PK', 'Pakistan', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(179, 'PL', 'Poland', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(180, 'PM', 'Saint Pierre and Miquelon', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(181, 'PN', 'Pitcairn Islands', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(182, 'PR', 'Puerto Rico', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(183, 'PS', 'Palestine', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(184, 'PT', 'Portugal', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(185, 'PW', 'Palau', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(186, 'PY', 'Paraguay', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(187, 'QA', 'Qatar', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(188, 'RE', 'Réunion', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(189, 'RO', 'Romania', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(190, 'RS', 'Serbia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(191, 'RU', 'Russia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(192, 'RW', 'Rwanda', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(193, 'SA', 'Saudi Arabia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(194, 'SB', 'Solomon Islands', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(195, 'SC', 'Seychelles', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(196, 'SD', 'Sudan', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(197, 'SE', 'Sweden', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(198, 'SG', 'Singapore', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(199, 'SH', 'Saint Helena', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(200, 'SI', 'Slovenia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(201, 'SJ', 'Svalbard and Jan Mayen', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(202, 'SK', 'Slovakia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(203, 'SL', 'Sierra Leone', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(204, 'SM', 'San Marino', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(205, 'SN', 'Senegal', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(206, 'SO', 'Somalia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(207, 'SR', 'Suriname', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(208, 'SS', 'South Sudan', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(209, 'ST', 'São Tomé and Príncipe', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(210, 'SV', 'El Salvador', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(211, 'SX', 'Sint Maarten', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(212, 'SY', 'Syria', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(213, 'SZ', 'Swaziland', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(214, 'TC', 'Turks and Caicos Islands', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(215, 'TD', 'Chad', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(216, 'TF', 'French Southern Territories', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(217, 'TG', 'Togo', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(218, 'TH', 'Thailand', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(219, 'TJ', 'Tajikistan', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(220, 'TK', 'Tokelau', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(221, 'TL', 'East Timor', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(222, 'TM', 'Turkmenistan', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(223, 'TN', 'Tunisia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(224, 'TO', 'Tonga', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(225, 'TR', 'Turkey', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(226, 'TT', 'Trinidad and Tobago', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(227, 'TV', 'Tuvalu', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(228, 'TW', 'Taiwan', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(229, 'TZ', 'Tanzania', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(230, 'UA', 'Ukraine', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(231, 'UG', 'Uganda', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(232, 'UM', 'U.S. Minor Outlying Islands', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(233, 'US', 'United States', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(234, 'UY', 'Uruguay', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(235, 'UZ', 'Uzbekistan', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(236, 'VA', 'Vatican City', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(237, 'VC', 'Saint Vincent and the Grenadines', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(238, 'VE', 'Venezuela', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(239, 'VG', 'British Virgin Islands', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(240, 'VI', 'U.S. Virgin Islands', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(241, 'VN', 'Vietnam', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(242, 'VU', 'Vanuatu', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(243, 'WF', 'Wallis and Futuna', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(244, 'WS', 'Samoa', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(245, 'XK', 'Kosovo', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(246, 'YE', 'Yemen', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(247, 'YT', 'Mayotte', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(248, 'ZA', 'South Africa', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(249, 'ZM', 'Zambia', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(250, 'ZW', 'Zimbabwe', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `code` varchar(10) NOT NULL,
  `language` varchar(60) DEFAULT NULL,
  `flag` varchar(45) DEFAULT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `language`
--

INSERT INTO `language` (`code`, `language`, `flag`, `createuser`, `modifyuser`, `createdate`, `modifydate`) VALUES
('en', 'Ingles', 'us.png', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
('es', 'Español', 'es.png', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `neighborhood`
--

CREATE TABLE IF NOT EXISTS `neighborhood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityid` int(11) NOT NULL,
  `townshipid` int(11) DEFAULT NULL,
  `neighborhood` varchar(100) DEFAULT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_neighborhood_township1_idx` (`townshipid`),
  KEY `fk_neighborhood_city1_idx` (`cityid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `neighborhood`
--

INSERT INTO `neighborhood` (`id`, `cityid`, `townshipid`, `neighborhood`, `createuser`, `modifyuser`, `createdate`, `modifydate`) VALUES
(1, 1, 1, 'Chanis', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(2, 1, 1, 'test', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `neighborhoodview`
--
CREATE TABLE IF NOT EXISTS `neighborhoodview` (
`id` int(11)
,`city` varchar(100)
,`country` varchar(100)
,`state` varchar(100)
,`township` varchar(100)
,`neighborhood` varchar(100)
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`id`, `role`, `description`, `createuser`, `modifyuser`, `createdate`, `modifydate`) VALUES
(1, 'Administrator', 'Administrador del sistema', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(2, 'Standard User', 'Standard User', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `state`
--

CREATE TABLE IF NOT EXISTS `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countryid` int(11) NOT NULL,
  `state` varchar(100) DEFAULT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_state_country1_idx` (`countryid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `state`
--

INSERT INTO `state` (`id`, `countryid`, `state`, `createuser`, `modifyuser`, `createdate`, `modifydate`) VALUES
(1, 173, 'Panamá', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(2, 173, 'Panamá Oeste', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(3, 173, 'Colon', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(4, 173, 'Coclé', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(5, 173, 'Herrera', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(6, 173, 'Los Santos', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(7, 173, 'Veraguas', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(8, 173, 'Chiriquí', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(9, 173, 'Bocas del Toro', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(10, 173, 'Darién', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(11, 173, 'Comarca Guna Yala', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(12, 173, 'Comarca Emberá-Wounaan', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(13, 173, 'Comarca Ngäbe-Buglé', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(14, 173, 'Comarca Madungandi', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(15, 173, 'Comarca Wargandí', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(16, 49, 'Cundinamarca', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testtabla`
--

CREATE TABLE IF NOT EXISTS `testtabla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tower`
--

CREATE TABLE IF NOT EXISTS `tower` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tower_company_idx` (`companyid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `tower`
--

INSERT INTO `tower` (`id`, `companyid`, `number`) VALUES
(1, 1, 'Torre 1'),
(2, 1, 'Torre 2'),
(3, 1, 'Torre 3'),
(4, 2, 'Torre 1'),
(5, 2, 'Torre 2'),
(6, 2, 'Torre 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `township`
--

CREATE TABLE IF NOT EXISTS `township` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityid` int(11) NOT NULL,
  `township` varchar(100) DEFAULT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_township_city1_idx` (`cityid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `township`
--

INSERT INTO `township` (`id`, `cityid`, `township`, `createuser`, `modifyuser`, `createdate`, `modifydate`) VALUES
(1, 1, 'Juan Diaz', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(4, 2, 'Norte', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(5, 1, 'San Francisco2', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(6, 1, 'Juan Diaz', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(7, 1, 'Tocumen', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(8, 2, 'Usaquen2', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(9, 1, 'sasasa', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `townshipview`
--
CREATE TABLE IF NOT EXISTS `townshipview` (
`id` int(11)
,`cityid` int(11)
,`city` varchar(100)
,`country` varchar(100)
,`state` varchar(100)
,`township` varchar(100)
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translation`
--

CREATE TABLE IF NOT EXISTS `translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `languagecode` varchar(10) NOT NULL,
  `translatekey` varchar(50) DEFAULT NULL,
  `value` varchar(2000) DEFAULT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_translation_language1_idx` (`languagecode`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=111 ;

--
-- Volcado de datos para la tabla `translation`
--

INSERT INTO `translation` (`id`, `languagecode`, `translatekey`, `value`, `createuser`, `modifyuser`, `createdate`, `modifydate`) VALUES
(1, 'en', 'Español', 'Spanish', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(2, 'es', 'English', 'Ingles', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(3, 'en', 'Ingles', 'English', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(4, 'en', 'Seleccione un idioma', 'Select a language', 'admin', 'admin', '2015-09-28 23:14:26', '2015-09-28 23:14:26'),
(6, 'en', 'translation.required.key', 'You must enter a key', 'admin', 'admin', '2015-09-28 23:18:35', '2015-09-28 23:18:35'),
(7, 'es', 'translation.required.key', 'Debe ingresar una llave', 'admin', 'admin', '2015-09-28 23:19:30', '2015-09-28 23:19:30'),
(8, 'en', 'translation.required.value', 'You must enter a value', 'admin', 'admin', '2015-09-28 23:21:12', '2015-09-28 23:21:12'),
(9, 'es', 'translation.required.value', 'Debe ingresar un valor', 'admin', 'admin', '2015-09-28 23:21:31', '2015-09-28 23:21:31'),
(10, 'en', 'translation.required.language', 'You must select a language', 'admin', 'admin', '2015-09-28 23:24:47', '2015-09-28 23:24:47'),
(11, 'es', 'translation.required.language', 'Debe seleccionar un idioma', 'admin', 'admin', '2015-09-28 23:25:06', '2015-09-28 23:25:06'),
(12, 'en', 'translation.key.exist', 'The key for this language already exist', 'admin', 'admin', '2015-09-29 01:58:20', '2015-09-29 01:58:20'),
(13, 'es', 'translation.key.exist', 'Ya existe esa llave para el idioma seleccionado', 'admin', 'admin', '2015-09-29 01:59:17', '2015-09-29 01:59:17'),
(15, 'en', 'Traducciones', 'Translations', 'admin', 'admin', '2015-09-29 02:01:00', '2015-09-29 02:01:00'),
(16, 'en', 'Idioma', 'Language', 'admin', 'admin', '2015-09-29 02:04:13', '2015-09-29 02:04:13'),
(17, 'en', 'Valor', 'Value', 'admin', 'admin', '2015-09-29 02:04:27', '2015-09-29 02:04:27'),
(18, 'en', 'Llave', 'Key', 'admin', 'admin', '2015-09-29 02:04:39', '2015-09-29 02:04:39'),
(19, 'en', 'Buscar', 'Search', 'admin', 'admin', '2015-09-29 02:07:13', '2015-09-29 02:07:13'),
(20, 'en', 'Primero', 'First', 'admin', 'admin', '2015-09-29 02:07:50', '2015-09-29 02:07:50'),
(21, 'en', 'Anterior', 'Back', 'admin', 'admin', '2015-09-29 02:08:08', '2015-09-29 02:08:08'),
(22, 'en', 'Siguiente', 'Next', 'admin', 'admin', '2015-09-29 02:08:25', '2015-09-29 02:08:25'),
(23, 'en', 'Ultimo', 'Last', 'admin', 'admin', '2015-09-29 02:08:44', '2015-09-29 02:08:44'),
(24, 'en', 'Página', 'Page', 'admin', 'admin', '2015-09-29 02:09:04', '2015-09-29 02:09:04'),
(25, 'en', 'de', 'of', 'admin', 'admin', '2015-09-29 02:09:18', '2015-09-29 02:09:18'),
(26, 'en', 'No se encontraron Traducciones', 'Not found translations', 'admin', 'admin', '2015-09-29 02:10:11', '2015-09-29 02:10:11'),
(27, 'en', 'Perfil', 'Profile', 'admin', 'admin', '2015-09-29 02:23:54', '2015-09-29 02:23:54'),
(28, 'en', 'logout.text', 'Logout', 'admin', 'admin', '2015-09-29 02:24:48', '2015-09-29 02:24:48'),
(29, 'es', 'logout.text', 'Salir', 'admin', 'admin', '2015-09-29 02:30:05', '2015-09-29 02:30:05'),
(30, 'en', 'Direcciones', 'Addresses', 'admin', 'admin', '2015-09-29 02:30:54', '2015-09-29 02:30:54'),
(31, 'en', 'Seguridad', 'Security', 'admin', 'admin', '2015-09-29 02:31:08', '2015-09-29 02:31:08'),
(32, 'en', 'Paises', 'Countries', 'admin', 'admin', '2015-09-29 02:31:26', '2015-09-29 02:31:26'),
(33, 'en', 'Estados', 'States', 'admin', 'admin', '2015-09-29 02:31:39', '2015-09-29 02:31:39'),
(34, 'en', 'Ciudades', 'Cities', 'admin', 'admin', '2015-09-29 02:32:06', '2015-09-29 02:32:06'),
(35, 'en', 'Sectores', 'Townships', 'admin', 'admin', '2015-09-29 02:32:30', '2015-09-29 02:32:30'),
(36, 'en', 'Barrios', 'Neigborhoods', 'admin', 'admin', '2015-09-29 02:32:58', '2015-09-29 02:32:58'),
(37, 'en', 'Usuarios', 'Users', 'admin', 'admin', '2015-09-29 02:33:17', '2015-09-29 02:33:17'),
(38, 'en', 'Acciones', 'Actions', 'admin', 'admin', '2015-09-29 02:33:37', '2015-09-29 02:33:37'),
(39, 'en', 'Idiomas', 'Languages', 'admin', 'admin', '2015-09-29 02:33:55', '2015-09-29 02:33:55'),
(40, 'en', 'Nueva Traducción', 'New Translation', 'admin', 'admin', '2015-09-29 02:35:21', '2015-09-29 02:35:21'),
(41, 'en', 'Guardar', 'Save', 'admin', 'admin', '2015-09-29 02:35:36', '2015-09-29 02:35:36'),
(42, 'en', 'Cancelar', 'Cancel', 'admin', 'admin', '2015-09-29 02:35:50', '2015-09-29 02:35:50'),
(43, 'en', 'Editar Traducción', 'Edit Translation', 'admin', 'admin', '2015-09-29 02:36:42', '2015-09-29 02:36:42'),
(45, 'en', 'Esta seguro que desea eliminar esta traducción?', 'Are you sure you want to delete this translation?', 'admin', 'admin', '2015-09-29 02:39:04', '2015-09-29 02:39:04'),
(46, 'en', 'Eliminar', 'Delete', 'admin', 'admin', '2015-09-29 02:40:09', '2015-09-29 02:40:09'),
(47, 'en', 'Código', 'Code', 'admin', 'admin', '2015-09-29 09:25:32', '2015-09-29 09:25:32'),
(48, 'en', 'Bandera', 'Flag', 'admin', 'admin', '2015-09-29 09:25:47', '2015-09-29 09:25:47'),
(49, 'en', 'Nuevo idioma', 'New Language', 'admin', 'admin', '2015-09-29 09:28:33', '2015-09-29 09:29:19'),
(50, 'en', 'Nuevo Usuario', 'New User', 'admin', 'admin', '2015-09-29 09:35:51', '2015-09-29 09:35:51'),
(51, 'en', 'username.required', 'You must enter a username', 'admin', 'admin', '2015-09-29 09:36:40', '2015-09-29 09:36:40'),
(52, 'es', 'username.required', 'Debe ingresar un usuario', 'admin', 'admin', '2015-09-29 09:37:16', '2015-09-29 09:37:16'),
(53, 'en', 'email.required', 'You must to enter an email', 'admin', 'admin', '2015-09-29 09:41:11', '2015-09-29 09:41:11'),
(54, 'es', 'email.required', 'Debe ingresar un email', 'admin', 'admin', '2015-09-29 09:41:26', '2015-09-29 09:41:26'),
(55, 'en', 'pass.required', 'You must enter a password', 'admin', 'admin', '2015-09-29 09:42:22', '2015-09-29 09:42:22'),
(56, 'es', 'pass.required', 'Debe ingresar un password', 'admin', 'admin', '2015-09-29 09:42:41', '2015-09-29 09:42:41'),
(57, 'en', 'confirm.required', 'You must enter a password confirmation', 'admin', 'admin', '2015-09-29 09:43:59', '2015-09-29 09:43:59'),
(58, 'es', 'confirm.required', 'Debe ingresar una confirmación de password', 'admin', 'admin', '2015-09-29 09:44:51', '2015-09-29 09:44:51'),
(59, 'es', 'User Name', 'Usuario', 'admin', 'admin', '2015-09-29 09:45:29', '2015-09-29 09:45:29'),
(60, 'en', 'Confirmar Password', 'Confirm Password', 'admin', 'admin', '2015-09-29 09:47:10', '2015-09-29 09:47:10'),
(61, 'en', 'username.unique', 'This username already exist', 'admin', 'admin', '2015-09-29 09:48:31', '2015-09-29 09:48:31'),
(62, 'es', 'username.unique', 'Ya existe un usuario con ese nombre', 'admin', 'admin', '2015-09-29 09:54:01', '2015-09-29 09:54:01'),
(63, 'en', 'email.valid', 'You must enter a valid email', 'admin', 'admin', '2015-09-29 09:54:35', '2015-09-29 09:54:35'),
(64, 'es', 'email.valid', 'Debe ingresar un email válido', 'admin', 'admin', '2015-09-29 09:55:06', '2015-09-29 09:55:06'),
(65, 'en', 'Editar Usuario', 'Edit User', 'admin', 'admin', '2015-09-29 09:56:44', '2015-09-29 09:56:44'),
(66, 'en', 'Esta seguro que desea eliminar este Usuario?', 'Are you sure you want to delete this User?', 'admin', 'admin', '2015-09-29 09:57:34', '2015-09-29 09:57:34'),
(67, 'en', 'user.constraintviolation', 'You can not delete this user , there are data associated', 'admin', 'admin', '2015-09-29 10:06:44', '2015-09-29 10:07:17'),
(68, 'es', 'user.constraintviolation', 'No se puede eliminar el usuario ya que tiene otros datos asociados', 'admin', 'admin', '2015-09-29 10:09:13', '2015-09-29 10:09:13'),
(69, 'en', 'user.equal.confirm_password', 'Password and Confirmation password have to be equal', 'admin', 'admin', '2015-09-29 10:33:00', '2015-09-29 10:33:00'),
(70, 'es', 'user.equal.confirm_password', 'El password y la confirmación de password deben ser iguales', 'admin', 'admin', '2015-09-29 10:33:36', '2015-09-29 10:33:36'),
(71, 'en', 'confirm.equal', 'Password and Confirmation password have to be equal', 'admin', 'admin', '2015-09-29 10:38:41', '2015-09-29 10:38:41'),
(72, 'es', 'confirm.equal', 'El password y la confirmación de password deben ser iguales', 'admin', 'admin', '2015-09-29 10:39:09', '2015-09-29 10:39:09'),
(73, 'en', 'Rol', 'Role', 'admin', 'admin', '2015-09-29 11:35:59', '2015-09-29 11:35:59'),
(74, 'en', 'Descripción', 'Description', 'admin', 'admin', '2015-09-29 11:36:44', '2015-09-29 11:36:44'),
(75, 'en', 'Nuevo Rol', 'New Role', 'admin', 'admin', '2015-09-29 11:40:09', '2015-09-29 11:40:09'),
(76, 'en', 'role.required', 'You must enter a role', 'admin', 'admin', '2015-09-29 11:43:02', '2015-09-29 11:43:02'),
(77, 'es', 'role.required', 'Debe ingresar un rol', 'admin', 'admin', '2015-09-29 11:44:01', '2015-09-29 11:44:01'),
(78, 'en', 'role.exist', 'This role already exist', 'admin', 'admin', '2015-09-29 11:46:02', '2015-09-29 11:46:02'),
(79, 'es', 'role.exist', 'Ya existe un rol con ese nombre', 'admin', 'admin', '2015-09-29 11:46:33', '2015-09-29 11:46:33'),
(80, 'en', 'role.constraintviolation', 'You can not delete this role , there are data associated', 'admin', 'admin', '2015-09-29 11:54:53', '2015-09-29 11:54:53'),
(81, 'es', 'role.constraintviolation', 'No se puede eliminar el rol ya que tiene otros datos asociados', 'admin', 'admin', '2015-09-29 11:55:19', '2015-09-29 11:55:19'),
(82, 'en', 'Esta seguro que desea eliminar este Rol?', 'Are you sure you want to delete this Role?', 'admin', 'admin', '2015-09-29 13:23:59', '2015-09-29 13:24:42'),
(83, 'en', 'action.required', 'You must enter an action', 'admin', 'admin', '2015-09-29 13:37:58', '2015-09-29 13:37:58'),
(84, 'es', 'action.required', 'Debe ingresar una acción', 'admin', 'admin', '2015-09-29 13:38:16', '2015-09-29 13:38:16'),
(85, 'en', 'action.exist', 'Already exist an action with this name', 'admin', 'admin', '2015-09-29 13:41:49', '2015-09-29 13:41:49'),
(86, 'es', 'action.exist', 'Ya existe una acción con ese nombre', 'admin', 'admin', '2015-09-29 13:42:15', '2015-09-29 13:42:15'),
(87, 'en', 'action.constraintviolation', 'You can not delete this action , there are data associated', 'admin', 'admin', '2015-09-29 13:44:01', '2015-09-29 13:44:01'),
(88, 'es', 'action.constraintviolation', 'No se puede eliminar la acción ya que tiene otros datos asociados', 'admin', 'admin', '2015-09-29 13:44:35', '2015-09-29 13:44:35'),
(89, 'en', 'Acción', 'Action', 'admin', 'admin', '2015-09-29 13:55:11', '2015-09-29 13:55:11'),
(90, 'en', 'Nueva Acción', 'New Action', 'admin', 'admin', '2015-09-29 13:55:50', '2015-09-29 13:55:50'),
(91, 'en', 'Editar Acción', 'Edit Action', 'admin', 'admin', '2015-09-29 13:57:10', '2015-09-29 13:57:41'),
(92, 'en', 'Esta seguro que desea eliminar esta acción?', 'Are you sure you want to delete this action?', 'admin', 'admin', '2015-09-29 13:59:47', '2015-09-29 13:59:47'),
(93, 'en', 'Roles del Usuario', 'User Roles', 'admin', 'admin', '2015-09-29 14:28:56', '2015-09-29 14:30:06'),
(94, 'en', 'Nuevo Rol del usuario', 'New User Role', 'admin', 'admin', '2015-09-29 14:31:51', '2015-09-29 14:31:51'),
(95, 'en', 'userrole.roleid.required', 'You must select a role', 'admin', 'admin', '2015-09-29 14:44:07', '2015-09-29 14:44:07'),
(96, 'es', 'userrole.roleid.required', 'Debe seleccionar un rol', 'admin', 'admin', '2015-09-29 14:44:30', '2015-09-29 14:44:30'),
(97, 'en', 'Seleccione un Rol', 'Select a Role', 'admin', 'admin', '2015-09-29 14:55:37', '2015-09-29 14:55:37'),
(98, 'en', 'Esta seguro que desea quitar ese rol?', 'Are you sure you want to quit this role?', 'admin', 'admin', '2015-09-29 14:57:54', '2015-09-29 14:57:54'),
(99, 'en', 'Acciones del Rol', 'Role Actions', 'admin', 'admin', '2015-09-29 15:00:19', '2015-09-29 15:00:19'),
(100, 'en', 'Nueva acción del rol', 'New rol action', 'admin', 'admin', '2015-09-29 15:04:11', '2015-09-29 15:04:11'),
(101, 'en', 'Seleccione una Acción', 'Select an Action', 'admin', 'admin', '2015-09-29 15:19:06', '2015-09-29 15:19:06'),
(102, 'en', 'actionrole.actionid.required', 'You must select an action', 'admin', 'admin', '2015-09-29 15:22:28', '2015-09-29 15:22:28'),
(103, 'es', 'actionrole.actionid.required', 'Debe seleccionar una acción', 'admin', 'admin', '2015-09-29 15:22:44', '2015-09-29 15:22:44'),
(104, 'en', 'Esta seguro que desea quitar esta acción?', 'Are you sure you want to quit this action?', 'admin', 'admin', '2015-09-29 15:25:45', '2015-09-29 15:25:45'),
(105, 'en', 'País', 'Country', 'admin', 'admin', '2015-09-29 16:14:45', '2015-09-29 16:14:45'),
(106, 'en', 'Nuevo País', 'New Country', 'admin', 'admin', '2015-09-29 16:20:03', '2015-09-29 16:20:38'),
(107, 'en', 'country.code.required', 'You must enter a code', 'admin', 'admin', '2015-09-29 16:25:16', '2015-09-29 16:25:16'),
(108, 'es', 'country.code.required', 'Debe ingresar un código', 'admin', 'admin', '2015-09-29 16:25:32', '2015-09-29 16:25:32'),
(109, 'en', 'country.required', 'You must enter a country', 'admin', 'admin', '2015-09-29 16:26:11', '2015-09-29 16:26:11'),
(110, 'es', 'country.required', 'Debe ingresar un país', 'admin', 'admin', '2015-09-29 16:26:26', '2015-09-29 16:26:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` longtext,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `createuser`, `modifyuser`, `createdate`, `modifydate`) VALUES
(30, 'admin', 'andresfranco@cableonda.net', '$2a$08$GYhoUJZxQha4xYSX4WbapebHRBYhT.biiqsia63QICJhS8NMepN1W', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(37, 'test2', 'andresfranco@cableonda.net', '$2a$08$13NjHo7VHfGd7DRkPCCoW.8a.hWjDUTcBJXNCL3OC2o61aeRcJr8y', 'admin', 'admin', '2015-09-16 22:45:49', '2015-09-16 22:45:49'),
(38, 'test5', 'andresfranco@cableonda.net', '$2a$08$RbaMD9e6TZ1d6U9qljY1WeFROKpfYrV6sqMD8OeSc.92A5HurGqii', 'admin', 'admin', '2015-09-16 23:04:10', '2015-09-16 23:04:10'),
(39, 'test99as', 'andresfranco@cableonda.net', '$2a$08$f6fK6GRyZwgPCLMienjls.0npOUESpFXSPGvprrSmxULBP5niTT8G', 'admin', 'admin', '2015-09-29 03:21:01', '2015-09-28 20:28:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL,
  PRIMARY KEY (`userid`,`roleid`),
  KEY `fk_user_role_user1_idx` (`userid`),
  KEY `fk_user_role_role1_idx` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user_role`
--

INSERT INTO `user_role` (`userid`, `roleid`, `createuser`, `modifyuser`, `createdate`, `modifydate`) VALUES
(30, 1, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(37, 2, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(39, 2, 'admin', 'admin', '2015-09-29 09:08:09', '2015-09-29 09:08:09');

-- --------------------------------------------------------

--
-- Estructura para la vista `apartmentlist`
--
DROP TABLE IF EXISTS `apartmentlist`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `apartmentlist` AS select `a`.`id` AS `id`,`a`.`name` AS `name`,`c`.`name` AS `company`,`t`.`number` AS `tower` from ((`apartment` `a` join `tower` `t` on((`a`.`towerid` = `t`.`id`))) join `company` `c` on((`a`.`companyid` = `c`.`id`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `neighborhoodview`
--
DROP TABLE IF EXISTS `neighborhoodview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `neighborhoodview` AS select `n`.`id` AS `id`,`c`.`city` AS `city`,`c2`.`country` AS `country`,`s`.`state` AS `state`,`t`.`township` AS `township`,`n`.`neighborhood` AS `neighborhood` from ((((`neighborhood` `n` join `city` `c` on((`c`.`id` = `n`.`cityid`))) join `country` `c2` on((`c2`.`id` = `c`.`countryid`))) join `state` `s` on((`s`.`id` = `c`.`stateid`))) join `township` `t` on((`t`.`id` = `n`.`townshipid`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `townshipview`
--
DROP TABLE IF EXISTS `townshipview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `townshipview` AS select `t`.`id` AS `id`,`t`.`cityid` AS `cityid`,`c`.`city` AS `city`,`c2`.`country` AS `country`,`s`.`state` AS `state`,`t`.`township` AS `township` from (((`township` `t` join `city` `c` on((`c`.`id` = `t`.`cityid`))) join `country` `c2` on((`c2`.`id` = `c`.`countryid`))) join `state` `s` on((`s`.`id` = `c`.`stateid`)));

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `action_role`
--
ALTER TABLE `action_role`
  ADD CONSTRAINT `fk_action_role_action1` FOREIGN KEY (`actionid`) REFERENCES `action` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_action_role_role1` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `fk_address_city1` FOREIGN KEY (`cityid`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_address_country1` FOREIGN KEY (`countryid`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_address_neighborhood1` FOREIGN KEY (`neighborhoodid`) REFERENCES `neighborhood` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_address_state1` FOREIGN KEY (`stateid`) REFERENCES `state` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_address_township1` FOREIGN KEY (`townshipid`) REFERENCES `township` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `apartment`
--
ALTER TABLE `apartment`
  ADD CONSTRAINT `fk_apartment_company1` FOREIGN KEY (`companyid`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_apartment_tower1` FOREIGN KEY (`towerid`) REFERENCES `tower` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `fk_city_country1` FOREIGN KEY (`countryid`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_city_state1` FOREIGN KEY (`stateid`) REFERENCES `state` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `company_address`
--
ALTER TABLE `company_address`
  ADD CONSTRAINT `fk_company_address_address1` FOREIGN KEY (`addressid`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_company_address_company1` FOREIGN KEY (`companyid`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `neighborhood`
--
ALTER TABLE `neighborhood`
  ADD CONSTRAINT `fk_neighborhood_city1` FOREIGN KEY (`cityid`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_neighborhood_township1` FOREIGN KEY (`townshipid`) REFERENCES `township` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `state`
--
ALTER TABLE `state`
  ADD CONSTRAINT `fk_state_country1` FOREIGN KEY (`countryid`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tower`
--
ALTER TABLE `tower`
  ADD CONSTRAINT `fk_tower_company` FOREIGN KEY (`companyid`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `township`
--
ALTER TABLE `township`
  ADD CONSTRAINT `fk_township_city1` FOREIGN KEY (`cityid`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `translation`
--
ALTER TABLE `translation`
  ADD CONSTRAINT `fk_translation_language1` FOREIGN KEY (`languagecode`) REFERENCES `language` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `fk_user_role_role1` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_role_user1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
