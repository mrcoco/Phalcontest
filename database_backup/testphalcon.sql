-- phpMyAdmin SQL Dump
-- version 4.2.12deb2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 15, 2015 at 11:20 PM
-- Server version: 5.6.25-0ubuntu0.15.04.1
-- PHP Version: 5.6.4-4ubuntu6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `testphalcon`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `testprocedure`(IN companyid int(4),IN towerid int(4))
BEGIN
select c.name as companyname , t.number as towernumber  from company c inner join tower t
on (t.companyid =c.id) where c.id =companyid and  t.id =towerid;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `action`
--

CREATE TABLE IF NOT EXISTS `action` (
`id` int(11) NOT NULL,
  `action` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `action`
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
(31, 'Delete Country', 'Permite eliminar paises', 'admin', 'admin', '2015-09-29 16:15:57', '2015-09-29 16:15:57'),
(32, 'Create State', 'Permite crear estados', 'admin', 'admin', '2015-09-30 09:44:25', '2015-09-30 09:44:25'),
(33, 'Edit State', 'Permite editar estados', 'admin', 'admin', '2015-09-30 09:44:41', '2015-09-30 09:44:41'),
(34, 'Delete State', 'Permite eliminar estados', 'admin', 'admin', '2015-09-30 09:45:07', '2015-09-30 09:45:07'),
(35, 'Create City', 'Permite crear ciudades', 'admin', 'admin', '2015-09-30 14:21:24', '2015-09-30 14:21:24'),
(36, 'Edit City', 'Permite editar ciudades', 'admin', 'admin', '2015-09-30 14:21:48', '2015-09-30 14:21:48'),
(37, 'Delete City', 'Permite eliminar ciudades', 'admin', 'admin', '2015-09-30 14:22:15', '2015-09-30 14:22:15'),
(38, 'Create Township', 'Permite crear sectores', 'admin', 'admin', '2015-09-30 14:22:36', '2015-09-30 14:22:36'),
(39, 'Edit Township', 'Permite editar sectores', 'admin', 'admin', '2015-09-30 15:11:31', '2015-09-30 15:11:31'),
(40, 'Delete Township', 'Permite eliminar sectores', 'admin', 'admin', '2015-09-30 15:11:49', '2015-09-30 15:11:49'),
(41, 'Create Neighborhood', 'Permite crear barrios', 'admin', 'admin', '2015-09-30 15:13:01', '2015-09-30 15:18:23'),
(42, 'Edit Neighborhood', 'Permite editar barrios ', 'admin', 'admin', '2015-09-30 15:13:31', '2015-09-30 15:18:44'),
(43, 'Delete Neighborhood', 'Permite eliminar barrios', 'admin', 'admin', '2015-09-30 15:14:48', '2015-09-30 15:19:25'),
(44, 'Create Address', 'Permite crear direcciones', 'admin', 'admin', '2015-10-02 14:22:45', '2015-10-02 14:22:45'),
(45, 'Edit Address', 'Permite editar direcciones', 'admin', 'admin', '2015-10-02 14:23:19', '2015-10-02 14:23:19'),
(46, 'Delete Address', 'Permite eliminar direcciones', 'admin', 'admin', '2015-10-02 14:23:44', '2015-10-02 14:23:44'),
(47, 'Manage Media', '', 'admin', 'admin', '2015-10-10 15:04:15', '2015-10-10 15:04:15'),
(48, 'Manage Files', '', 'admin', 'admin', '2015-10-10 15:04:43', '2015-10-10 15:04:43'),
(49, 'Create Gallery', '', 'admin', 'admin', '2015-10-11 16:56:44', '2015-10-11 16:56:44'),
(50, 'Edit Gallery', '', 'admin', 'admin', '2015-10-11 16:56:52', '2015-10-11 16:56:52'),
(51, 'Delete Gallery', '', 'admin', 'admin', '2015-10-11 16:57:01', '2015-10-11 16:57:01');

-- --------------------------------------------------------

--
-- Table structure for table `action_role`
--

CREATE TABLE IF NOT EXISTS `action_role` (
  `actionid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `action_role`
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
(31, 1, 'admin', 'admin', '2015-09-29 16:18:11', '2015-09-29 16:18:11'),
(32, 1, 'admin', 'admin', '2015-09-30 09:45:23', '2015-09-30 09:45:23'),
(33, 1, 'admin', 'admin', '2015-09-30 09:45:31', '2015-09-30 09:45:31'),
(34, 1, 'admin', 'admin', '2015-09-30 09:45:40', '2015-09-30 09:45:40'),
(35, 1, 'admin', 'admin', '2015-09-30 15:10:24', '2015-09-30 15:10:24'),
(36, 1, 'admin', 'admin', '2015-09-30 15:10:32', '2015-09-30 15:10:32'),
(37, 1, 'admin', 'admin', '2015-09-30 15:10:42', '2015-09-30 15:10:42'),
(38, 1, 'admin', 'admin', '2015-09-30 15:12:02', '2015-09-30 15:12:02'),
(39, 1, 'admin', 'admin', '2015-09-30 15:12:11', '2015-09-30 15:12:11'),
(40, 1, 'admin', 'admin', '2015-09-30 15:12:23', '2015-09-30 15:12:23'),
(41, 1, 'admin', 'admin', '2015-09-30 15:15:38', '2015-09-30 15:15:38'),
(42, 1, 'admin', 'admin', '2015-09-30 15:15:49', '2015-09-30 15:15:49'),
(43, 1, 'admin', 'admin', '2015-09-30 15:16:00', '2015-09-30 15:16:00'),
(44, 1, 'admin', 'admin', '2015-10-02 14:24:19', '2015-10-02 14:24:19'),
(45, 1, 'admin', 'admin', '2015-10-02 14:24:31', '2015-10-02 14:24:31'),
(46, 1, 'admin', 'admin', '2015-10-02 14:25:08', '2015-10-02 14:25:08'),
(47, 1, 'admin', 'admin', '2015-10-10 15:05:20', '2015-10-10 15:05:20'),
(48, 1, 'admin', 'admin', '2015-10-10 15:05:27', '2015-10-10 15:05:27'),
(49, 1, 'admin', 'admin', '2015-10-11 16:57:24', '2015-10-11 16:57:24'),
(50, 1, 'admin', 'admin', '2015-10-11 16:57:30', '2015-10-11 16:57:30'),
(51, 1, 'admin', 'admin', '2015-10-11 16:57:37', '2015-10-11 16:57:37');

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
`id` int(11) NOT NULL,
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
  `modifydate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `apartment`
--

CREATE TABLE IF NOT EXISTS `apartment` (
`id` int(11) NOT NULL,
  `companyid` int(11) NOT NULL,
  `towerid` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `apartment`
--

INSERT INTO `apartment` (`id`, `companyid`, `towerid`, `name`) VALUES
(1, 1, 1, '16 C'),
(2, 1, 2, '16 C'),
(3, 2, 4, '1A'),
(4, 2, 5, '3B');

-- --------------------------------------------------------

--
-- Stand-in structure for view `apartmentlist`
--
CREATE TABLE IF NOT EXISTS `apartmentlist` (
`id` int(11)
,`name` varchar(45)
,`company` varchar(45)
,`tower` varchar(45)
);
-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
`id` int(11) NOT NULL,
  `stateid` int(11) NOT NULL,
  `countryid` int(11) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `stateid`, `countryid`, `city`, `createuser`, `modifyuser`, `createdate`, `modifydate`) VALUES
(1, 1, 173, 'Panamá', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(2, 16, 49, 'Bogotá', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE IF NOT EXISTS `company` (
`id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `createuser`, `modifyuser`, `createdate`, `modifydate`) VALUES
(1, 'Empresa1', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(2, 'Empresa2', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(3, 'Empresa3', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01');

-- --------------------------------------------------------

--
-- Table structure for table `company_address`
--

CREATE TABLE IF NOT EXISTS `company_address` (
  `companyid` int(11) NOT NULL,
  `addressid` int(11) NOT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
`id` int(11) NOT NULL,
  `code` varchar(4) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
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
-- Table structure for table `file_format`
--

CREATE TABLE IF NOT EXISTS `file_format` (
`id` int(11) NOT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `accept` varchar(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `file_format`
--

INSERT INTO `file_format` (`id`, `extension`, `type`, `accept`) VALUES
(1, 'jpg', 'image', 'T'),
(2, 'gif', 'image', 'T'),
(3, 'png', 'image', 'T'),
(4, 'jpg', 'image', 'T'),
(5, 'jpeg', 'image', 'T'),
(6, 'mpg', 'video', 'T'),
(7, 'mpeg', 'video', 'T'),
(8, 'rm', 'video', 'T'),
(9, 'avi', 'video', 'T'),
(10, 'mkv', 'video', 'T'),
(11, 'flv', 'video', 'T'),
(12, 'mov', 'video', 'T'),
(13, 'wmv', 'video', 'T'),
(14, 'asf', 'video', 'T'),
(15, 'mp4', 'video', 'T'),
(16, 'rtf', 'document', 'T'),
(17, 'doc', 'document', 'T'),
(18, 'docx', 'document', 'T'),
(19, 'csv', 'document', 'T'),
(20, 'xls', 'document', 'T'),
(21, 'xlsx', 'document', 'T'),
(22, 'pptx', 'document', 'T'),
(23, 'ppt', 'document', 'T'),
(24, 'odt', 'document', 'T'),
(25, 'pdf', 'document', 'T'),
(26, 'txt', 'document', 'T'),
(27, 'html', 'document', 'T'),
(28, 'xml', 'document', 'T'),
(29, 'php', 'document', 'T'),
(30, 'css', 'document', 'T'),
(31, 'js', 'document', 'T'),
(32, 'rar', 'other', 'T'),
(33, 'zip', 'other', 'T'),
(34, '7z', 'other', 'T'),
(35, 'deb', 'other', 'T');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE IF NOT EXISTS `gallery` (
`id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `title` varchar(80) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `name`, `title`, `type`, `description`, `createuser`, `modifyuser`, `createdate`, `modifydate`) VALUES
(1, 'Wallpapers', 'Wallpapers', 'images', 'Galeria de Fondos de escritorio de Mangas japoneses', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(2, 'Iconos', 'Iconos', 'images', 'Galeria de Iconos de distintops tipos', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01');

-- --------------------------------------------------------

--
-- Table structure for table `gallery_image`
--

CREATE TABLE IF NOT EXISTS `gallery_image` (
  `id` int(11) NOT NULL,
  `galleryid` int(11) NOT NULL,
  `imageid` int(11) NOT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE IF NOT EXISTS `image` (
`id` int(11) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `title` varchar(60) DEFAULT NULL,
  `path` varchar(1000) DEFAULT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `code` varchar(10) NOT NULL,
  `language` varchar(60) DEFAULT NULL,
  `flag` varchar(45) DEFAULT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`code`, `language`, `flag`, `createuser`, `modifyuser`, `createdate`, `modifydate`) VALUES
('en', 'Ingles', 'us.png', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
('es', 'Español', 'es.png', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01');

-- --------------------------------------------------------

--
-- Table structure for table `neighborhood`
--

CREATE TABLE IF NOT EXISTS `neighborhood` (
`id` int(11) NOT NULL,
  `cityid` int(11) NOT NULL,
  `townshipid` int(11) DEFAULT NULL,
  `neighborhood` varchar(100) DEFAULT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `neighborhood`
--

INSERT INTO `neighborhood` (`id`, `cityid`, `townshipid`, `neighborhood`, `createuser`, `modifyuser`, `createdate`, `modifydate`) VALUES
(1, 1, 1, 'Chanis', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(2, 1, 1, 'test', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01');

-- --------------------------------------------------------

--
-- Stand-in structure for view `neighborhoodview`
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
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
`id` int(11) NOT NULL,
  `role` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`, `description`, `createuser`, `modifyuser`, `createdate`, `modifydate`) VALUES
(1, 'Administrator', 'Administrador del sistema', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(2, 'Standard User', 'Standard User', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE IF NOT EXISTS `state` (
`id` int(11) NOT NULL,
  `countryid` int(11) NOT NULL,
  `state` varchar(100) DEFAULT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `state`
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
-- Table structure for table `system_parameter`
--

CREATE TABLE IF NOT EXISTS `system_parameter` (
`id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `parameter` varchar(60) DEFAULT NULL,
  `textvalue` text
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `system_parameter`
--

INSERT INTO `system_parameter` (`id`, `code`, `parameter`, `textvalue`) VALUES
(4, 'file_upload', 'max_file_size', '95000000'),
(5, 'file_upload', 'min_file_size', '0'),
(6, 'file_upload', 'max_number_of_files', '10');

-- --------------------------------------------------------

--
-- Table structure for table `testtabla`
--

CREATE TABLE IF NOT EXISTS `testtabla` (
`id` int(11) NOT NULL,
  `test` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tower`
--

CREATE TABLE IF NOT EXISTS `tower` (
`id` int(11) NOT NULL,
  `companyid` int(11) NOT NULL,
  `number` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tower`
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
-- Table structure for table `township`
--

CREATE TABLE IF NOT EXISTS `township` (
`id` int(11) NOT NULL,
  `cityid` int(11) NOT NULL,
  `township` varchar(100) DEFAULT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `township`
--

INSERT INTO `township` (`id`, `cityid`, `township`, `createuser`, `modifyuser`, `createdate`, `modifydate`) VALUES
(1, 1, 'Juan Diaz', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(4, 2, 'Norte', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(5, 1, 'San Francisco2', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(7, 1, 'Tocumen', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(8, 2, 'Usaquen2', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(9, 1, 'sasasa', 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01');

-- --------------------------------------------------------

--
-- Stand-in structure for view `townshipview`
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
-- Table structure for table `translation`
--

CREATE TABLE IF NOT EXISTS `translation` (
`id` int(11) NOT NULL,
  `languagecode` varchar(10) NOT NULL,
  `translatekey` varchar(50) DEFAULT NULL,
  `value` varchar(2000) DEFAULT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `translation`
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
(110, 'es', 'country.required', 'Debe ingresar un país', 'admin', 'admin', '2015-09-29 16:26:26', '2015-09-29 16:26:26'),
(111, 'en', 'country.code.exist', 'Already exist a country with this code', 'admin', 'admin', '2015-09-30 09:18:45', '2015-09-30 09:18:45'),
(112, 'es', 'country.code.exist', 'Ya existe un pais con ese código', 'admin', 'admin', '2015-09-30 09:19:32', '2015-09-30 09:19:32'),
(113, 'en', 'country.name.code.exist', 'Already exist a country with this code and name', 'admin', 'admin', '2015-09-30 09:20:32', '2015-09-30 09:20:32'),
(114, 'es', 'country.name.code.exist', 'Ya existe un pais el código y nombre ingresados', 'admin', 'admin', '2015-09-30 09:21:44', '2015-09-30 09:22:12'),
(115, 'en', 'country.constraintviolation', 'You can not delete this country , there are data associated', 'admin', 'admin', '2015-09-30 09:22:58', '2015-09-30 09:22:58'),
(116, 'es', 'country.constraintviolation', 'No se puede eliminar el país ya que tiene otros datos asociados', 'admin', 'admin', '2015-09-30 09:23:23', '2015-09-30 09:23:23'),
(117, 'en', 'Esta seguro que desea eliminar este país?', 'Are you sure you want to delete this country?', 'admin', 'admin', '2015-09-30 09:28:30', '2015-09-30 09:28:30'),
(118, 'en', 'Estado', 'State', 'admin', 'admin', '2015-09-30 09:42:14', '2015-09-30 09:42:14'),
(119, 'en', 'state.required', 'You must enter a state', 'admin', 'admin', '2015-09-30 09:46:51', '2015-09-30 09:46:51'),
(120, 'es', 'state.required', 'Debe ingresar un estado', 'admin', 'admin', '2015-09-30 09:47:13', '2015-09-30 09:47:13'),
(121, 'en', 'Nuevo Estado', 'New State', 'admin', 'admin', '2015-09-30 09:48:15', '2015-09-30 09:48:15'),
(122, 'en', 'state.country.required', 'You must select a country', 'admin', 'admin', '2015-09-30 09:52:13', '2015-09-30 09:52:13'),
(123, 'es', 'state.country.required', 'Debe seleccionar un país', 'admin', 'admin', '2015-09-30 09:52:27', '2015-09-30 09:52:27'),
(124, 'en', 'state.country.state.exist', 'Already exist a state with this country and name', 'admin', 'admin', '2015-09-30 09:53:13', '2015-09-30 09:55:02'),
(125, 'es', 'state.country.state.exist', 'Ya existe un estado con ese país y nombre', 'admin', 'admin', '2015-09-30 09:55:32', '2015-09-30 09:55:32'),
(126, 'en', 'state.constraintviolation', 'You can not delete this state , there are data associated', 'admin', 'admin', '2015-09-30 09:56:16', '2015-09-30 09:56:16'),
(127, 'es', 'state.constraintviolation', 'No se puede eliminar el estado ya que tiene otros datos asociados', 'admin', 'admin', '2015-09-30 09:56:46', '2015-09-30 09:56:46'),
(128, 'en', 'Editar Estado', 'Edit State', 'admin', 'admin', '2015-09-30 09:59:13', '2015-09-30 09:59:13'),
(129, 'en', 'Esta seguro que desea eliminar este estado?', 'Are you sure you want to delete this state?', 'admin', 'admin', '2015-09-30 10:00:31', '2015-09-30 10:00:31'),
(130, 'es', 'state.delete.question', '¿ Esta seguro que desea eliminar este estado?', 'admin', 'admin', '2015-09-30 10:01:37', '2015-09-30 13:26:09'),
(131, 'en', 'state.delete.question', 'Are you sure you want to delete this state?', 'admin', 'admin', '2015-09-30 10:01:59', '2015-09-30 10:01:59'),
(132, 'en', 'country.delete.question', 'Are you sure you want to delete this country ?', 'admin', 'admin', '2015-09-30 10:03:12', '2015-09-30 12:54:07'),
(133, 'es', 'country.delete.question', '¿ Esta seguro que desea eliminar este país ?', 'admin', 'admin', '2015-09-30 10:03:48', '2015-09-30 12:54:23'),
(134, 'en', 'user.entity.notfound', 'Entity User not found', 'admin', 'admin', '2015-09-30 10:22:59', '2015-09-30 10:22:59'),
(135, 'es', 'user.entity.notfound', 'No se encontro la entidad User', 'admin', 'admin', '2015-09-30 10:23:17', '2015-09-30 10:23:17'),
(136, 'en', 'user.delete.question', 'Are you sure you want to delete this user?', 'admin', 'admin', '2015-09-30 10:23:49', '2015-09-30 10:23:49'),
(137, 'es', 'user.delete.question', '¿ Esta seguro que desea eliminar este usuario?', 'admin', 'admin', '2015-09-30 10:24:19', '2015-09-30 10:24:19'),
(138, 'en', 'user.list.title', 'Users', 'admin', 'admin', '2015-09-30 10:26:16', '2015-09-30 10:26:16'),
(139, 'es', 'user.list.title', 'Usuarios', 'admin', 'admin', '2015-09-30 10:26:27', '2015-09-30 10:26:27'),
(140, 'en', 'user.title.new', 'New User', 'admin', 'admin', '2015-09-30 10:27:21', '2015-09-30 10:27:21'),
(141, 'es', 'user.title.new', 'Nuevo Usuario', 'admin', 'admin', '2015-09-30 10:27:47', '2015-09-30 10:27:47'),
(142, 'en', 'button.cancel', 'Cancel', 'admin', 'admin', '2015-09-30 10:29:03', '2015-09-30 10:29:03'),
(143, 'es', 'button.cancel', 'Cancelar', 'admin', 'admin', '2015-09-30 10:29:16', '2015-09-30 10:29:16'),
(144, 'en', 'user.title.edit', 'Edit User', 'admin', 'admin', '2015-09-30 10:30:01', '2015-09-30 10:30:01'),
(145, 'es', 'user.title.edit', 'Editar Usuario', 'admin', 'admin', '2015-09-30 10:30:31', '2015-09-30 10:30:31'),
(146, 'en', 'button.delete', 'Delete', 'admin', 'admin', '2015-09-30 10:33:28', '2015-09-30 10:33:28'),
(147, 'es', 'button.delete', 'Eliminar', 'admin', 'admin', '2015-09-30 10:33:41', '2015-09-30 10:33:41'),
(148, 'en', 'user.notfound', 'User not found', 'admin', 'admin', '2015-09-30 10:35:51', '2015-09-30 10:36:41'),
(149, 'es', 'user.notfound', 'No se encontraron usuarios', 'admin', 'admin', '2015-09-30 10:36:13', '2015-09-30 10:36:59'),
(150, 'en', 'role.list.title', 'Roles', 'admin', 'admin', '2015-09-30 10:40:46', '2015-09-30 10:40:46'),
(151, 'es', 'role.list.title', 'Roles', 'admin', 'admin', '2015-09-30 10:40:57', '2015-09-30 10:40:57'),
(152, 'en', 'role.notfound', 'Role not found', 'admin', 'admin', '2015-09-30 10:41:46', '2015-09-30 10:41:46'),
(153, 'es', 'role.notfound', 'No se encontraron roles', 'admin', 'admin', '2015-09-30 10:42:12', '2015-09-30 10:42:12'),
(154, 'en', 'role.title.new', 'New Role', 'admin', 'admin', '2015-09-30 10:42:53', '2015-09-30 10:42:53'),
(155, 'es', 'role.title.new', 'Nuevo Rol', 'admin', 'admin', '2015-09-30 10:43:26', '2015-09-30 10:43:26'),
(156, 'en', 'role.delete.question', 'Are you sure you want to delete this role ?', 'admin', 'admin', '2015-09-30 10:44:21', '2015-09-30 10:45:47'),
(157, 'es', 'role.delete.question', '¿ Esta seguro que desea eliminar este rol ?', 'admin', 'admin', '2015-09-30 10:44:55', '2015-09-30 10:44:55'),
(158, 'en', 'role.entity.notfound', 'Entity Role not found', 'admin', 'admin', '2015-09-30 10:46:45', '2015-09-30 10:46:45'),
(159, 'es', 'role.entity.notfound', 'No se encontró la entidad Role', 'admin', 'admin', '2015-09-30 10:47:09', '2015-09-30 10:47:09'),
(160, 'en', 'action.entity.notfound', 'Entity Action not found', 'admin', 'admin', '2015-09-30 10:48:27', '2015-09-30 10:48:27'),
(161, 'es', 'action.entity.notfound', 'No se encontro la entidad Action', 'admin', 'admin', '2015-09-30 10:48:50', '2015-09-30 10:48:50'),
(162, 'en', 'action.delete.question', 'Are you sure you want to quit this action ?', 'admin', 'admin', '2015-09-30 10:52:25', '2015-09-30 10:52:25'),
(163, 'es', 'action.delete.question', '¿ Esta seguro que desea eliminar esta acción ?', 'admin', 'admin', '2015-09-30 10:53:14', '2015-09-30 10:53:14'),
(164, 'en', 'action.list.title', 'Actions', 'admin', 'admin', '2015-09-30 10:53:48', '2015-09-30 10:53:48'),
(165, 'es', 'action.list.title', 'Acciones', 'admin', 'admin', '2015-09-30 10:53:59', '2015-09-30 10:53:59'),
(166, 'en', 'action.title.new', 'New Action', 'admin', 'admin', '2015-09-30 10:54:36', '2015-09-30 10:54:36'),
(167, 'es', 'action.title.new', 'Nueva Acción', 'admin', 'admin', '2015-09-30 10:54:52', '2015-09-30 10:54:52'),
(168, 'en', 'action.title.edit', 'Edit Action', 'admin', 'admin', '2015-09-30 10:55:27', '2015-09-30 10:55:27'),
(169, 'es', 'action.title.edit', 'Editar Acción', 'admin', 'admin', '2015-09-30 10:55:41', '2015-09-30 10:55:41'),
(170, 'en', 'action.notfound', 'Not found action', 'admin', 'admin', '2015-09-30 10:56:35', '2015-09-30 10:56:35'),
(171, 'es', 'action.notfound', 'No se encontraron acciones', 'admin', 'admin', '2015-09-30 10:56:53', '2015-09-30 10:56:53'),
(172, 'en', 'userrole.entity.notfound', 'Entity UserRole not found', 'admin', 'admin', '2015-09-30 11:04:03', '2015-09-30 11:04:03'),
(173, 'es', 'userrole.entity.notfound', 'No se encontro la entidad UserRole', 'admin', 'admin', '2015-09-30 11:04:23', '2015-09-30 11:04:23'),
(174, 'en', 'userrole.delete.question', 'Are you sure you want to quit this role ?', 'admin', 'admin', '2015-09-30 11:05:13', '2015-09-30 11:05:13'),
(175, 'es', 'userrole.delete.question', '¿ Esta seguro que desea quitar este rol ?', 'admin', 'admin', '2015-09-30 11:05:38', '2015-09-30 11:05:38'),
(176, 'en', 'userrole.list.title', 'User Role', 'admin', 'admin', '2015-09-30 11:06:09', '2015-09-30 11:06:09'),
(177, 'es', 'userrole.list.title', 'Roles del usuario', 'admin', 'admin', '2015-09-30 11:06:40', '2015-09-30 11:06:40'),
(178, 'en', 'userrole.title.new', 'New User role', 'admin', 'admin', '2015-09-30 11:08:36', '2015-09-30 11:08:36'),
(179, 'es', 'userrole.title.new', 'Nuevo rol del usuario', 'admin', 'admin', '2015-09-30 11:08:56', '2015-09-30 11:08:56'),
(180, 'en', 'userrole.notfound', 'Role not found', 'admin', 'admin', '2015-09-30 11:11:48', '2015-09-30 11:11:48'),
(181, 'es', 'userrole.notfound', 'No se encontraron roles', 'admin', 'admin', '2015-09-30 11:12:07', '2015-09-30 11:12:07'),
(182, 'en', 'actionrole.entity.notfound', 'Entity ActionRole not found', 'admin', 'admin', '2015-09-30 11:17:16', '2015-09-30 11:17:16'),
(183, 'es', 'actionrole.entity.notfound', 'No se encontro la entidad ActionRole', 'admin', 'admin', '2015-09-30 11:17:35', '2015-09-30 11:17:35'),
(184, 'en', 'actionrole.delete.question', 'Are you sure you want to quit this action ?', 'admin', 'admin', '2015-09-30 11:18:01', '2015-09-30 11:18:01'),
(185, 'es', 'actionrole.delete.question', '¿ Esta seguro que desea quitar esta acción ?', 'admin', 'admin', '2015-09-30 11:18:39', '2015-09-30 11:18:39'),
(186, 'en', 'actionrole.list.title', 'Role Action', 'admin', 'admin', '2015-09-30 11:19:06', '2015-09-30 11:20:03'),
(187, 'es', 'actionrole.list.title', 'Acciones del rol', 'admin', 'admin', '2015-09-30 11:20:27', '2015-09-30 11:20:27'),
(188, 'en', 'actionrole.notfound', 'Action not found', 'admin', 'admin', '2015-09-30 11:22:20', '2015-09-30 11:22:20'),
(189, 'es', 'actionrole.notfound', 'No se encontraron acciones', 'admin', 'admin', '2015-09-30 11:22:35', '2015-09-30 11:22:35'),
(190, 'en', 'userrole.button.title', 'Users', 'admin', 'admin', '2015-09-30 11:24:03', '2015-09-30 11:24:03'),
(191, 'es', 'userrole.button.title', 'Usuarios', 'admin', 'admin', '2015-09-30 11:24:16', '2015-09-30 11:24:16'),
(192, 'en', 'actionrole.button.title', 'Roles', 'admin', 'admin', '2015-09-30 11:25:43', '2015-09-30 11:25:43'),
(193, 'es', 'actionrole.button.title', 'Roles', 'admin', 'admin', '2015-09-30 11:25:56', '2015-09-30 11:25:56'),
(194, 'en', 'language.entity.notfound', 'Entity language not found', 'admin', 'admin', '2015-09-30 11:33:48', '2015-09-30 11:33:48'),
(195, 'es', 'language.entity.notfound', 'No se encontro la entidad Language', 'admin', 'admin', '2015-09-30 11:34:18', '2015-09-30 11:34:18'),
(196, 'en', 'language.delete.question', 'Are you sure you want to delete this Language ?', 'admin', 'admin', '2015-09-30 11:34:43', '2015-09-30 11:51:34'),
(197, 'es', 'language.delete.question', '¿ Esta seguro que desea eliminar este idioma ?', 'admin', 'admin', '2015-09-30 11:35:06', '2015-09-30 11:50:37'),
(198, 'en', 'language.list.title', 'Languages', 'admin', 'admin', '2015-09-30 11:35:24', '2015-09-30 11:35:24'),
(199, 'es', 'language.list.title', 'Idiomas', 'admin', 'admin', '2015-09-30 11:35:36', '2015-09-30 11:35:36'),
(201, 'es', 'language.title.new', 'Nuevo Idioma', 'admin', 'admin', '2015-09-30 11:36:18', '2015-09-30 11:36:18'),
(202, 'en', 'language.title.edit', 'Edit Language', 'admin', 'admin', '2015-09-30 11:36:35', '2015-09-30 11:36:35'),
(203, 'es', 'language.title.edit', 'Editar Idioma', 'admin', 'admin', '2015-09-30 11:36:50', '2015-09-30 11:36:50'),
(204, 'en', 'language.notfound', 'Language not found', 'admin', 'admin', '2015-09-30 11:37:07', '2015-09-30 11:37:07'),
(205, 'es', 'language.notfound', 'No se encontraron idiomas', 'admin', 'admin', '2015-09-30 11:37:28', '2015-09-30 11:37:28'),
(206, 'en', 'language.title.new', 'New Language', 'admin', 'admin', '2015-09-30 11:39:14', '2015-09-30 11:41:10'),
(208, 'en', 'translation.entity.notfound', 'Entity Translation not found', 'admin', 'admin', '2015-09-30 12:33:24', '2015-09-30 12:33:24'),
(209, 'es', 'translation.entity.notfound', 'No se encontro la entidad Translation', 'admin', 'admin', '2015-09-30 12:34:02', '2015-09-30 12:34:02'),
(210, 'en', 'translation.delete.question', 'Are you sure you want to quit this translation ?', 'admin', 'admin', '2015-09-30 12:34:39', '2015-09-30 12:34:39'),
(211, 'es', 'translation.delete.question', '¿ Esta seguro que desea eliminar esta traducción ?', 'admin', 'admin', '2015-09-30 12:35:33', '2015-09-30 12:35:33'),
(212, 'en', 'translation.list.title', 'Translations', 'admin', 'admin', '2015-09-30 12:35:59', '2015-09-30 12:35:59'),
(213, 'es', 'translation.list.title', 'Traducciones', 'admin', 'admin', '2015-09-30 12:36:15', '2015-09-30 12:36:15'),
(214, 'en', 'translation.title.new', 'New Translation', 'admin', 'admin', '2015-09-30 12:37:09', '2015-09-30 12:37:09'),
(215, 'es', 'translation.title.new', 'Nueva Traducción', 'admin', 'admin', '2015-09-30 12:37:35', '2015-09-30 12:37:35'),
(216, 'en', 'translation.title.edit', 'Edit Translation', 'admin', 'admin', '2015-09-30 12:38:11', '2015-09-30 12:38:11'),
(217, 'es', 'translation.title.edit', 'Editar Traducción', 'admin', 'admin', '2015-09-30 12:38:40', '2015-09-30 12:38:40'),
(218, 'en', 'translation.notfound', 'Translation not found', 'admin', 'admin', '2015-09-30 12:39:23', '2015-09-30 12:39:23'),
(219, 'es', 'translation.notfound', 'No se encontraron traducciones', 'admin', 'admin', '2015-09-30 12:39:44', '2015-09-30 12:39:44'),
(220, 'en', 'country.entity.notfound', 'Entity Country not found', 'admin', 'admin', '2015-09-30 12:51:39', '2015-09-30 12:51:39'),
(221, 'es', 'country.entity.notfound', 'No se encontro la entidad Country', 'admin', 'admin', '2015-09-30 12:52:04', '2015-09-30 12:52:04'),
(222, 'en', 'country.list.title', 'Countries', 'admin', 'admin', '2015-09-30 12:54:52', '2015-09-30 12:54:52'),
(223, 'es', 'country.list.title', 'Países', 'admin', 'admin', '2015-09-30 12:55:12', '2015-09-30 12:55:12'),
(224, 'en', 'country.title.new', 'New Country', 'admin', 'admin', '2015-09-30 12:58:14', '2015-09-30 12:58:14'),
(225, 'es', 'country.title.new', 'Nuevo País', 'admin', 'admin', '2015-09-30 12:58:31', '2015-09-30 12:58:31'),
(226, 'en', 'country.title.edit', 'Edit Country', 'admin', 'admin', '2015-09-30 12:59:01', '2015-09-30 12:59:01'),
(227, 'es', 'country.title.edit', 'Editar País', 'admin', 'admin', '2015-09-30 12:59:47', '2015-09-30 12:59:47'),
(228, 'en', 'country.notfound', 'Country not found', 'admin', 'admin', '2015-09-30 13:00:31', '2015-09-30 13:00:31'),
(229, 'es', 'country.notfound', 'No se encontraron países', 'admin', 'admin', '2015-09-30 13:00:48', '2015-09-30 13:00:48'),
(230, 'en', 'state.entity.notfound', 'Entity State not found', 'admin', 'admin', '2015-09-30 13:24:27', '2015-09-30 13:24:27'),
(231, 'es', 'state.entity.notfound', 'No se encontro la entidad State', 'admin', 'admin', '2015-09-30 13:24:59', '2015-09-30 13:24:59'),
(232, 'en', 'state.list.title', 'States', 'admin', 'admin', '2015-09-30 13:26:28', '2015-09-30 13:26:28'),
(233, 'es', 'state.list.title', 'Estados', 'admin', 'admin', '2015-09-30 13:26:46', '2015-09-30 13:26:46'),
(234, 'en', 'state.title.new', 'New State', 'admin', 'admin', '2015-09-30 13:27:06', '2015-09-30 13:27:06'),
(235, 'es', 'state.title.new', 'Nuevo Estado', 'admin', 'admin', '2015-09-30 13:27:24', '2015-09-30 13:27:24'),
(236, 'en', 'state.title.edit', 'Edit State', 'admin', 'admin', '2015-09-30 13:28:19', '2015-09-30 13:28:19'),
(237, 'es', 'state.title.edit', 'Editar Estado', 'admin', 'admin', '2015-09-30 13:28:37', '2015-09-30 13:28:37'),
(238, 'en', 'state.notfound', 'State not found', 'admin', 'admin', '2015-09-30 13:29:05', '2015-09-30 13:29:05'),
(239, 'es', 'state.notfound', 'No se encontraron estados', 'admin', 'admin', '2015-09-30 13:29:29', '2015-09-30 13:29:29'),
(240, 'en', 'city.entity.notfound', 'Entity City not found', 'admin', 'admin', '2015-09-30 15:37:05', '2015-09-30 15:37:05'),
(241, 'es', 'city.entity.notfound', 'No se encontro la entidad City', 'admin', 'admin', '2015-09-30 15:37:24', '2015-09-30 15:37:24'),
(242, 'en', 'city.delete.question', 'Are you sure you want to delete this city ?', 'admin', 'admin', '2015-09-30 15:37:57', '2015-09-30 15:50:32'),
(243, 'es', 'city.delete.question', '¿ Esta seguro que desea eliminar esta ciudad ?', 'admin', 'admin', '2015-09-30 15:38:55', '2015-09-30 15:50:51'),
(244, 'en', 'city.list.title', 'Cities', 'admin', 'admin', '2015-09-30 15:39:12', '2015-09-30 15:39:12'),
(245, 'es', 'city.list.title', 'Ciudades', 'admin', 'admin', '2015-09-30 15:39:23', '2015-09-30 15:39:23'),
(246, 'en', 'city.title.new', 'New City', 'admin', 'admin', '2015-09-30 15:40:34', '2015-09-30 15:40:34'),
(247, 'es', 'city.title.new', 'Nueva Ciudad', 'admin', 'admin', '2015-09-30 15:41:00', '2015-09-30 15:41:00'),
(248, 'en', 'city.title.edit', 'Edit City', 'admin', 'admin', '2015-09-30 15:41:24', '2015-09-30 15:41:24'),
(249, 'es', 'city.title.edit', 'Editar Ciudad', 'admin', 'admin', '2015-09-30 15:41:43', '2015-09-30 15:41:43'),
(250, 'en', 'city.notfound', 'City not found', 'admin', 'admin', '2015-09-30 15:42:19', '2015-09-30 15:42:19'),
(251, 'es', 'city.notfound', 'No se encontraron ciudades', 'admin', 'admin', '2015-09-30 15:42:37', '2015-09-30 15:42:37'),
(252, 'en', 'city.country.required', 'You must to select a country', 'admin', 'admin', '2015-09-30 15:43:39', '2015-09-30 15:46:49'),
(253, 'es', 'city.country.required', 'Debe seleccionar un país', 'admin', 'admin', '2015-09-30 15:44:01', '2015-09-30 15:47:10'),
(254, 'en', 'city.state.required', 'You must select a state', 'admin', 'admin', '2015-09-30 15:44:23', '2015-09-30 15:44:23'),
(255, 'es', 'city.state.required', 'Debe seleccionar un estado', 'admin', 'admin', '2015-09-30 15:44:36', '2015-09-30 15:44:36'),
(256, 'en', 'city.required', 'You must enter a city', 'admin', 'admin', '2015-09-30 15:45:06', '2015-09-30 15:45:06'),
(257, 'es', 'city.required', 'Debe ingresar una ciudad', 'admin', 'admin', '2015-09-30 15:45:20', '2015-09-30 15:45:20'),
(258, 'en', 'city.country.city.exist', 'Already exist a city with this name for the selected country', 'admin', 'admin', '2015-09-30 15:47:33', '2015-09-30 15:47:33'),
(259, 'es', 'city.country.city.exist', 'Ya existe una ciudad con ese nombre para el país seleccionado', 'admin', 'admin', '2015-09-30 15:48:01', '2015-09-30 15:48:01'),
(260, 'en', 'township.entity.notfound', 'Entity Township not found', 'admin', 'admin', '2015-09-30 16:03:15', '2015-09-30 16:03:15'),
(261, 'es', 'township.entity.notfound', 'No se encontro la entidad Township', 'admin', 'admin', '2015-09-30 16:03:39', '2015-09-30 16:03:39'),
(262, 'en', 'township.delete.question', 'Are you sure you want to delete this township ?', 'admin', 'admin', '2015-09-30 16:04:03', '2015-09-30 16:04:03'),
(263, 'es', 'township.delete.question', '¿ Esta seguro que desea eliminar este sector ?', 'admin', 'admin', '2015-09-30 16:04:27', '2015-09-30 16:04:27'),
(264, 'en', 'township.list.title', 'Townships', 'admin', 'admin', '2015-09-30 16:04:56', '2015-09-30 16:04:56'),
(265, 'es', 'township.list.title', 'Sectores', 'admin', 'admin', '2015-09-30 16:05:11', '2015-09-30 16:05:11'),
(266, 'en', 'township.title.new', 'New Township', 'admin', 'admin', '2015-09-30 16:05:29', '2015-09-30 16:05:29'),
(267, 'es', 'township.title.new', 'Nuevo Sector', 'admin', 'admin', '2015-09-30 16:05:43', '2015-09-30 16:05:43'),
(268, 'en', 'township.title.edit', 'Edit Township', 'admin', 'admin', '2015-09-30 16:05:59', '2015-09-30 16:05:59'),
(269, 'es', 'township.title.edit', 'Editar Sector', 'admin', 'admin', '2015-09-30 16:06:14', '2015-09-30 16:06:14'),
(270, 'en', 'township.notfound', 'Township not found', 'admin', 'admin', '2015-09-30 16:06:30', '2015-09-30 16:06:30'),
(271, 'es', 'township.notfound', 'No se encontraron sectores', 'admin', 'admin', '2015-09-30 16:07:02', '2015-09-30 16:07:02'),
(272, 'en', 'city.select.required', 'You must select a city', 'admin', 'admin', '2015-09-30 16:07:21', '2015-09-30 16:07:21'),
(273, 'es', 'city.select.required', 'Debe seleccionar una ciudad', 'admin', 'admin', '2015-09-30 16:07:41', '2015-09-30 16:07:41'),
(274, 'en', 'township.required', 'You must enter a township', 'admin', 'admin', '2015-09-30 16:08:20', '2015-09-30 16:08:20'),
(275, 'es', 'township.required', 'Debe ingresar un sector', 'admin', 'admin', '2015-09-30 16:08:43', '2015-09-30 16:08:43'),
(276, 'en', 'township.city.township.exist', 'Already exist a township with this name for the selected city', 'admin', 'admin', '2015-09-30 16:09:15', '2015-09-30 16:09:15'),
(277, 'es', 'township.city.township.exist', 'Ya existe un sector con ese nombre para la ciudad seleccionada', 'admin', 'admin', '2015-09-30 16:10:55', '2015-09-30 16:10:55'),
(278, 'en', 'township.constraintviolation', 'You can not delete this township, there are data associated', 'admin', 'admin', '2015-09-30 16:11:36', '2015-09-30 16:11:36'),
(279, 'es', 'township.constraintviolation', 'No se puede eliminar el sector ya que tiene otros datos asociados', 'admin', 'admin', '2015-09-30 16:11:53', '2015-09-30 16:11:53'),
(280, 'en', 'neighborhood.entity.notfound', 'Entity Neighborhood not found', 'admin', 'admin', '2015-10-01 14:22:17', '2015-10-01 14:22:17'),
(281, 'es', 'neighborhood.entity.notfound', 'No se encontro la entidad Neighborhood', 'admin', 'admin', '2015-10-01 14:22:59', '2015-10-01 14:22:59'),
(282, 'en', 'neighborhood.delete.question', 'Are you sure you want to delete this neighborhood ?', 'admin', 'admin', '2015-10-01 14:23:56', '2015-10-01 14:23:56'),
(283, 'es', 'neighborhood.delete.question', '¿ Esta seguro que desea eliminar este barrio ?', 'admin', 'admin', '2015-10-01 14:24:24', '2015-10-01 14:24:24'),
(284, 'en', 'neighborhood.list.title', 'Neighborhoods', 'admin', 'admin', '2015-10-01 14:24:51', '2015-10-01 14:24:51'),
(285, 'es', 'neighborhood.list.title', 'Barrios', 'admin', 'admin', '2015-10-01 14:25:05', '2015-10-01 14:25:05'),
(286, 'en', 'neighborhood.title.new', 'New Neighborhood', 'admin', 'admin', '2015-10-01 14:26:06', '2015-10-01 14:26:06'),
(287, 'es', 'neighborhood.title.new', 'Nuevo Barrio', 'admin', 'admin', '2015-10-01 14:26:23', '2015-10-01 14:26:23'),
(288, 'en', 'neighborhood.title.edit', 'Edit Neighborhood', 'admin', 'admin', '2015-10-01 14:26:43', '2015-10-01 14:26:43'),
(289, 'es', 'neighborhood.title.edit', 'Editar Barrio', 'admin', 'admin', '2015-10-01 14:27:01', '2015-10-01 14:27:01'),
(290, 'en', 'neighborhood.notfound', 'Neighborhood not found', 'admin', 'admin', '2015-10-01 14:27:34', '2015-10-01 14:27:34'),
(291, 'es', 'neighborhood.notfound', 'No se encontraron barrios', 'admin', 'admin', '2015-10-01 14:27:59', '2015-10-01 14:27:59'),
(292, 'en', 'neighborhood.township.required', 'You must to select a township', 'admin', 'admin', '2015-10-01 14:28:58', '2015-10-01 14:28:58'),
(293, 'es', 'neighborhood.township.required', 'Debe ingresar un sector', 'admin', 'admin', '2015-10-01 14:29:40', '2015-10-01 14:29:40'),
(294, 'en', 'neighborhood.required', 'You must to enter a neighborhood', 'admin', 'admin', '2015-10-01 14:30:12', '2015-10-01 14:30:12'),
(295, 'es', 'neighborhood.required', 'Debe ingresar un barrio', 'admin', 'admin', '2015-10-01 14:30:33', '2015-10-01 14:30:33'),
(296, 'en', 'neighborhood.township.exist', 'Already exist this neighborhood for the selected township', 'admin', 'admin', '2015-10-01 14:35:45', '2015-10-01 14:35:45'),
(297, 'es', 'neighborhood.township.exist', 'Ya existe ese barrio para el sector seleccionado', 'admin', 'admin', '2015-10-01 14:36:27', '2015-10-01 14:36:27'),
(298, 'en', 'neighborhood.constraintviolation', 'You can not delete this neighborhood, there are data associated', 'admin', 'admin', '2015-10-01 14:37:34', '2015-10-01 14:37:34'),
(299, 'es', 'neighborhood.constraintviolation', 'No se puede eliminar el barrio ya que tiene otros datos asociados', 'admin', 'admin', '2015-10-01 14:37:59', '2015-10-01 14:37:59'),
(300, 'en', 'Ciudad', 'City', 'admin', 'admin', '2015-10-01 15:09:36', '2015-10-01 15:09:36'),
(301, 'en', 'Sector', 'Township', 'admin', 'admin', '2015-10-01 15:09:53', '2015-10-01 15:09:53'),
(302, 'en', 'Barrio', 'Neighborhood', 'admin', 'admin', '2015-10-01 15:10:10', '2015-10-01 15:10:10'),
(303, 'en', 'actionrole.title.new', 'New Role Action', 'admin', 'admin', '2015-10-01 16:24:35', '2015-10-01 16:24:35'),
(304, 'es', 'actionrole.title.new', 'Nueva accion del rol', 'admin', 'admin', '2015-10-01 16:24:54', '2015-10-01 16:24:54'),
(305, 'en', 'address.entity.notfound', 'Entity Address not found', 'admin', 'admin', '2015-10-02 13:46:30', '2015-10-02 13:46:30'),
(306, 'es', 'address.entity.notfound', 'No se encontro la entidad Address', 'admin', 'admin', '2015-10-02 13:46:52', '2015-10-02 13:46:52'),
(307, 'en', 'address.delete.question', 'Are you sure you want to delete this address ?', 'admin', 'admin', '2015-10-02 13:47:54', '2015-10-02 13:47:54'),
(308, 'es', 'address.delete.question', 'Esta seguro que desea eliminar esta dirección ?', 'admin', 'admin', '2015-10-02 13:51:08', '2015-10-02 13:51:08'),
(309, 'en', 'address.list.title', 'Addresses', 'admin', 'admin', '2015-10-02 13:54:10', '2015-10-02 13:54:10'),
(310, 'es', 'address.list.title', 'Direcciones', 'admin', 'admin', '2015-10-02 13:54:45', '2015-10-02 13:54:45'),
(311, 'en', 'address.title.new', 'New Address', 'admin', 'admin', '2015-10-02 13:55:13', '2015-10-02 13:55:13'),
(312, 'es', 'address.title.new', 'Nueva Dirección', 'admin', 'admin', '2015-10-02 13:55:53', '2015-10-02 13:55:53'),
(313, 'en', 'address.title.edit', 'Edit Address', 'admin', 'admin', '2015-10-02 13:57:01', '2015-10-02 13:57:01'),
(314, 'es', 'address.title.edit', 'Editar Dirección', 'admin', 'admin', '2015-10-02 13:58:29', '2015-10-02 13:58:29'),
(315, 'en', 'address.notfound', 'Not found address', 'admin', 'admin', '2015-10-02 14:01:30', '2015-10-02 14:01:30'),
(316, 'es', 'address.notfound', 'No se encontraron direcciones', 'admin', 'admin', '2015-10-02 14:07:30', '2015-10-02 14:07:30'),
(317, 'en', 'address.country.required', 'You must to select a country', 'admin', 'admin', '2015-10-02 14:08:38', '2015-10-02 14:08:38'),
(318, 'es', 'address.country.required', 'Debe seleccionar un país', 'admin', 'admin', '2015-10-02 14:09:18', '2015-10-02 14:09:18'),
(319, 'en', 'address.state.required', 'You must to select a state', 'admin', 'admin', '2015-10-02 14:09:47', '2015-10-02 14:09:47'),
(320, 'es', 'address.state.required', 'Debe seleccionar un estado', 'admin', 'admin', '2015-10-02 14:10:07', '2015-10-02 14:10:07'),
(321, 'en', 'address.city.required', 'You must to select a city', 'admin', 'admin', '2015-10-02 14:11:27', '2015-10-02 14:11:27'),
(322, 'es', 'address.city.required', 'Debe seleccionar una ciudad', 'admin', 'admin', '2015-10-02 14:11:47', '2015-10-02 14:11:47'),
(323, 'en', 'address.neighborhood.required', 'You must select a neighborhood', 'admin', 'admin', '2015-10-02 14:12:31', '2015-10-02 14:12:31'),
(324, 'es', 'address.neighborhood.required', 'Debe seleccionar un barrio', 'admin', 'admin', '2015-10-02 14:12:58', '2015-10-02 14:12:58'),
(325, 'en', 'address.required', 'You must enter an address', 'admin', 'admin', '2015-10-02 14:14:33', '2015-10-02 14:14:33'),
(326, 'es', 'address.required', 'Debe ingresar una dirección', 'admin', 'admin', '2015-10-02 14:14:54', '2015-10-02 14:33:56'),
(327, 'en', 'complete_address.exist', 'Already exist this address', 'admin', 'admin', '2015-10-02 14:15:47', '2015-10-02 14:15:47'),
(328, 'es', 'complete_address.exist', 'Ya existe esa dirección', 'admin', 'admin', '2015-10-02 14:17:22', '2015-10-02 14:17:22'),
(329, 'en', 'address.constraintviolation', 'You can not delete this address, there are data associated', 'admin', 'admin', '2015-10-02 14:17:56', '2015-10-02 14:17:56'),
(330, 'es', 'address.constraintviolation', 'No se puede eliminar la dirección ya que tiene otros datos asociados', 'admin', 'admin', '2015-10-02 14:18:32', '2015-10-02 14:18:32');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` longtext
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(30, 'admin', 'andresfranco@cableonda.net', '$2a$08$GYhoUJZxQha4xYSX4WbapebHRBYhT.biiqsia63QICJhS8NMepN1W'),
(37, 'test2', 'andresfranco@cableonda.net', '$2a$08$13NjHo7VHfGd7DRkPCCoW.8a.hWjDUTcBJXNCL3OC2o61aeRcJr8y'),
(38, 'test5', 'andresfranco@cableonda.net', '$2a$08$RbaMD9e6TZ1d6U9qljY1WeFROKpfYrV6sqMD8OeSc.92A5HurGqii'),
(39, 'test99as', 'andresfranco@cableonda.net', '$2a$08$f6fK6GRyZwgPCLMienjls.0npOUESpFXSPGvprrSmxULBP5niTT8G');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `createuser` varchar(45) NOT NULL,
  `modifyuser` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`userid`, `roleid`, `createuser`, `modifyuser`, `createdate`, `modifydate`) VALUES
(30, 1, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(37, 2, 'admin', 'admin', '2015-09-16 09:38:01', '2015-09-16 09:38:01'),
(39, 2, 'admin', 'admin', '2015-09-29 09:08:09', '2015-09-29 09:08:09');

-- --------------------------------------------------------

--
-- Structure for view `apartmentlist`
--
DROP TABLE IF EXISTS `apartmentlist`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `apartmentlist` AS select `a`.`id` AS `id`,`a`.`name` AS `name`,`c`.`name` AS `company`,`t`.`number` AS `tower` from ((`apartment` `a` join `tower` `t` on((`a`.`towerid` = `t`.`id`))) join `company` `c` on((`a`.`companyid` = `c`.`id`)));

-- --------------------------------------------------------

--
-- Structure for view `neighborhoodview`
--
DROP TABLE IF EXISTS `neighborhoodview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `neighborhoodview` AS select `n`.`id` AS `id`,`c`.`city` AS `city`,`c2`.`country` AS `country`,`s`.`state` AS `state`,`t`.`township` AS `township`,`n`.`neighborhood` AS `neighborhood` from ((((`neighborhood` `n` join `city` `c` on((`c`.`id` = `n`.`cityid`))) join `country` `c2` on((`c2`.`id` = `c`.`countryid`))) join `state` `s` on((`s`.`id` = `c`.`stateid`))) join `township` `t` on((`t`.`id` = `n`.`townshipid`)));

-- --------------------------------------------------------

--
-- Structure for view `townshipview`
--
DROP TABLE IF EXISTS `townshipview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `townshipview` AS select `t`.`id` AS `id`,`t`.`cityid` AS `cityid`,`c`.`city` AS `city`,`c2`.`country` AS `country`,`s`.`state` AS `state`,`t`.`township` AS `township` from (((`township` `t` join `city` `c` on((`c`.`id` = `t`.`cityid`))) join `country` `c2` on((`c2`.`id` = `c`.`countryid`))) join `state` `s` on((`s`.`id` = `c`.`stateid`)));

--
-- Indexes for dumped tables
--

--
-- Indexes for table `action`
--
ALTER TABLE `action`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `action_role`
--
ALTER TABLE `action_role`
 ADD PRIMARY KEY (`actionid`,`roleid`), ADD KEY `fk_action_role_role1_idx` (`roleid`);

--
-- Indexes for table `address`
--
ALTER TABLE `address`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_address_country1_idx` (`countryid`), ADD KEY `fk_address_city1_idx` (`cityid`), ADD KEY `fk_address_township1_idx` (`townshipid`), ADD KEY `fk_address_neighborhood1_idx` (`neighborhoodid`), ADD KEY `fk_address_state1_idx` (`stateid`);

--
-- Indexes for table `apartment`
--
ALTER TABLE `apartment`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_apartment_tower1_idx` (`towerid`), ADD KEY `fk_apartment_company1_idx` (`companyid`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_city_country1_idx` (`countryid`), ADD KEY `fk_city_state1_idx` (`stateid`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_address`
--
ALTER TABLE `company_address`
 ADD PRIMARY KEY (`companyid`,`addressid`), ADD KEY `fk_company_address_address1_idx` (`addressid`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file_format`
--
ALTER TABLE `file_format`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery_image`
--
ALTER TABLE `gallery_image`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_gallery_image_image1_idx` (`imageid`), ADD KEY `fk_gallery_image_gallery1_idx` (`galleryid`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
 ADD PRIMARY KEY (`code`);

--
-- Indexes for table `neighborhood`
--
ALTER TABLE `neighborhood`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_neighborhood_township1_idx` (`townshipid`), ADD KEY `fk_neighborhood_city1_idx` (`cityid`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_state_country1_idx` (`countryid`);

--
-- Indexes for table `system_parameter`
--
ALTER TABLE `system_parameter`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testtabla`
--
ALTER TABLE `testtabla`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tower`
--
ALTER TABLE `tower`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_tower_company_idx` (`companyid`);

--
-- Indexes for table `township`
--
ALTER TABLE `township`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_township_city1_idx` (`cityid`);

--
-- Indexes for table `translation`
--
ALTER TABLE `translation`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_translation_language1_idx` (`languagecode`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
 ADD PRIMARY KEY (`userid`,`roleid`), ADD KEY `fk_user_role_user1_idx` (`userid`), ADD KEY `fk_user_role_role1_idx` (`roleid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `action`
--
ALTER TABLE `action`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `apartment`
--
ALTER TABLE `apartment`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=251;
--
-- AUTO_INCREMENT for table `file_format`
--
ALTER TABLE `file_format`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `neighborhood`
--
ALTER TABLE `neighborhood`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `system_parameter`
--
ALTER TABLE `system_parameter`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `testtabla`
--
ALTER TABLE `testtabla`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tower`
--
ALTER TABLE `tower`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `township`
--
ALTER TABLE `township`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `translation`
--
ALTER TABLE `translation`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=331;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `action_role`
--
ALTER TABLE `action_role`
ADD CONSTRAINT `fk_action_role_action1` FOREIGN KEY (`actionid`) REFERENCES `action` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_action_role_role1` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `address`
--
ALTER TABLE `address`
ADD CONSTRAINT `fk_address_city1` FOREIGN KEY (`cityid`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_address_country1` FOREIGN KEY (`countryid`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_address_neighborhood1` FOREIGN KEY (`neighborhoodid`) REFERENCES `neighborhood` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_address_state1` FOREIGN KEY (`stateid`) REFERENCES `state` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_address_township1` FOREIGN KEY (`townshipid`) REFERENCES `township` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `apartment`
--
ALTER TABLE `apartment`
ADD CONSTRAINT `fk_apartment_company1` FOREIGN KEY (`companyid`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_apartment_tower1` FOREIGN KEY (`towerid`) REFERENCES `tower` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `city`
--
ALTER TABLE `city`
ADD CONSTRAINT `fk_city_country1` FOREIGN KEY (`countryid`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_city_state1` FOREIGN KEY (`stateid`) REFERENCES `state` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `company_address`
--
ALTER TABLE `company_address`
ADD CONSTRAINT `fk_company_address_address1` FOREIGN KEY (`addressid`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_company_address_company1` FOREIGN KEY (`companyid`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `gallery_image`
--
ALTER TABLE `gallery_image`
ADD CONSTRAINT `fk_gallery_image_gallery1` FOREIGN KEY (`galleryid`) REFERENCES `gallery` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_gallery_image_image1` FOREIGN KEY (`imageid`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `neighborhood`
--
ALTER TABLE `neighborhood`
ADD CONSTRAINT `fk_neighborhood_city1` FOREIGN KEY (`cityid`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_neighborhood_township1` FOREIGN KEY (`townshipid`) REFERENCES `township` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `state`
--
ALTER TABLE `state`
ADD CONSTRAINT `fk_state_country1` FOREIGN KEY (`countryid`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tower`
--
ALTER TABLE `tower`
ADD CONSTRAINT `fk_tower_company` FOREIGN KEY (`companyid`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `township`
--
ALTER TABLE `township`
ADD CONSTRAINT `fk_township_city1` FOREIGN KEY (`cityid`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `translation`
--
ALTER TABLE `translation`
ADD CONSTRAINT `fk_translation_language1` FOREIGN KEY (`languagecode`) REFERENCES `language` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
ADD CONSTRAINT `fk_user_role_role1` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_user_role_user1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
