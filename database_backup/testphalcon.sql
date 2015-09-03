-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-09-2015 a las 23:15:11
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `action_role`
--

CREATE TABLE IF NOT EXISTS `action_role` (
  `actionid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`actionid`,`roleid`),
  KEY `fk_action_role_role1_idx` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`id`),
  KEY `fk_city_country1_idx` (`countryid`),
  KEY `fk_city_state1_idx` (`stateid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `city`
--

INSERT INTO `city` (`id`, `stateid`, `countryid`, `city`) VALUES
(1, 1, 173, 'Panamá'),
(2, 16, 49, 'Bogotá');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `company`
--

INSERT INTO `company` (`id`, `name`) VALUES
(1, 'Empresa1'),
(2, 'Empresa2'),
(3, 'Empresa3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company_address`
--

CREATE TABLE IF NOT EXISTS `company_address` (
  `companyid` int(11) NOT NULL,
  `addressid` int(11) NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=252 ;

--
-- Volcado de datos para la tabla `country`
--

INSERT INTO `country` (`id`, `code`, `country`) VALUES
(1, 'AD', 'Andorra'),
(2, 'AE', 'United Arab Emirates'),
(3, 'AF', 'Afghanistan'),
(4, 'AG', 'Antigua and Barbuda'),
(5, 'AI', 'Anguilla'),
(6, 'AL', 'Albania'),
(7, 'AM', 'Armenia'),
(8, 'AO', 'Angola'),
(9, 'AQ', 'Antarctica'),
(10, 'AR', 'Argentina'),
(11, 'AS', 'American Samoa'),
(12, 'AT', 'Austria'),
(13, 'AU', 'Australia'),
(14, 'AW', 'Aruba'),
(15, 'AX', 'Åland'),
(16, 'AZ', 'Azerbaijan'),
(17, 'BA', 'Bosnia and Herzegovina'),
(18, 'BB', 'Barbados'),
(19, 'BD', 'Bangladesh'),
(20, 'BE', 'Belgium'),
(21, 'BF', 'Burkina Faso'),
(22, 'BG', 'Bulgaria'),
(23, 'BH', 'Bahrain'),
(24, 'BI', 'Burundi'),
(25, 'BJ', 'Benin'),
(26, 'BL', 'Saint Barthélemy'),
(27, 'BM', 'Bermuda'),
(28, 'BN', 'Brunei'),
(29, 'BO', 'Bolivia'),
(30, 'BQ', 'Bonaire'),
(31, 'BR', 'Brazil'),
(32, 'BS', 'Bahamas'),
(33, 'BT', 'Bhutan'),
(34, 'BV', 'Bouvet Island'),
(35, 'BW', 'Botswana'),
(36, 'BY', 'Belarus'),
(37, 'BZ', 'Belize'),
(38, 'CA', 'Canada'),
(39, 'CC', 'Cocos [Keeling] Islands'),
(40, 'CD', 'Democratic Republic of the Congo'),
(41, 'CF', 'Central African Republic'),
(42, 'CG', 'Republic of the Congo'),
(43, 'CH', 'Switzerland'),
(44, 'CI', 'Ivory Coast'),
(45, 'CK', 'Cook Islands'),
(46, 'CL', 'Chile'),
(47, 'CM', 'Cameroon'),
(48, 'CN', 'China'),
(49, 'CO', 'Colombia'),
(50, 'CR', 'Costa Rica'),
(51, 'CU', 'Cuba'),
(52, 'CV', 'Cape Verde'),
(53, 'CW', 'Curacao'),
(54, 'CX', 'Christmas Island'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DE', 'Germany'),
(58, 'DJ', 'Djibouti'),
(59, 'DK', 'Denmark'),
(60, 'DM', 'Dominica'),
(61, 'DO', 'Dominican Republic'),
(62, 'DZ', 'Algeria'),
(63, 'EC', 'Ecuador'),
(64, 'EE', 'Estonia'),
(65, 'EG', 'Egypt'),
(66, 'EH', 'Western Sahara'),
(67, 'ER', 'Eritrea'),
(68, 'ES', 'Spain'),
(69, 'ET', 'Ethiopia'),
(70, 'FI', 'Finland'),
(71, 'FJ', 'Fiji'),
(72, 'FK', 'Falkland Islands'),
(73, 'FM', 'Micronesia'),
(74, 'FO', 'Faroe Islands'),
(75, 'FR', 'France'),
(76, 'GA', 'Gabon'),
(77, 'GB', 'United Kingdom'),
(78, 'GD', 'Grenada'),
(79, 'GE', 'Georgia'),
(80, 'GF', 'French Guiana'),
(81, 'GG', 'Guernsey'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GL', 'Greenland'),
(85, 'GM', 'Gambia'),
(86, 'GN', 'Guinea'),
(87, 'GP', 'Guadeloupe'),
(88, 'GQ', 'Equatorial Guinea'),
(89, 'GR', 'Greece'),
(90, 'GS', 'South Georgia and the South Sandwich Islands'),
(91, 'GT', 'Guatemala'),
(92, 'GU', 'Guam'),
(93, 'GW', 'Guinea-Bissau'),
(94, 'GY', 'Guyana'),
(95, 'HK', 'Hong Kong'),
(96, 'HM', 'Heard Island and McDonald Islands'),
(97, 'HN', 'Honduras'),
(98, 'HR', 'Croatia'),
(99, 'HT', 'Haiti'),
(100, 'HU', 'Hungary'),
(101, 'ID', 'Indonesia'),
(102, 'IE', 'Ireland'),
(103, 'IL', 'Israel'),
(104, 'IM', 'Isle of Man'),
(105, 'IN', 'India'),
(106, 'IO', 'British Indian Ocean Territory'),
(107, 'IQ', 'Iraq'),
(108, 'IR', 'Iran'),
(109, 'IS', 'Iceland'),
(110, 'IT', 'Italy'),
(111, 'JE', 'Jersey'),
(112, 'JM', 'Jamaica'),
(113, 'JO', 'Jordan'),
(114, 'JP', 'Japan'),
(115, 'KE', 'Kenya'),
(116, 'KG', 'Kyrgyzstan'),
(117, 'KH', 'Cambodia'),
(118, 'KI', 'Kiribati'),
(119, 'KM', 'Comoros'),
(120, 'KN', 'Saint Kitts and Nevis'),
(121, 'KP', 'North Korea'),
(122, 'KR', 'South Korea'),
(123, 'KW', 'Kuwait'),
(124, 'KY', 'Cayman Islands'),
(125, 'KZ', 'Kazakhstan'),
(126, 'LA', 'Laos'),
(127, 'LB', 'Lebanon'),
(128, 'LC', 'Saint Lucia'),
(129, 'LI', 'Liechtenstein'),
(130, 'LK', 'Sri Lanka'),
(131, 'LR', 'Liberia'),
(132, 'LS', 'Lesotho'),
(133, 'LT', 'Lithuania'),
(134, 'LU', 'Luxembourg'),
(135, 'LV', 'Latvia'),
(136, 'LY', 'Libya'),
(137, 'MA', 'Morocco'),
(138, 'MC', 'Monaco'),
(139, 'MD', 'Moldova'),
(140, 'ME', 'Montenegro'),
(141, 'MF', 'Saint Martin'),
(142, 'MG', 'Madagascar'),
(143, 'MH', 'Marshall Islands'),
(144, 'MK', 'Macedonia'),
(145, 'ML', 'Mali'),
(146, 'MM', 'Myanmar [Burma]'),
(147, 'MN', 'Mongolia'),
(148, 'MO', 'Macao'),
(149, 'MP', 'Northern Mariana Islands'),
(150, 'MQ', 'Martinique'),
(151, 'MR', 'Mauritania'),
(152, 'MS', 'Montserrat'),
(153, 'MT', 'Malta'),
(154, 'MU', 'Mauritius'),
(155, 'MV', 'Maldives'),
(156, 'MW', 'Malawi'),
(157, 'MX', 'Mexico'),
(158, 'MY', 'Malaysia'),
(159, 'MZ', 'Mozambique'),
(160, 'NA', 'Namibia'),
(161, 'NC', 'New Caledonia'),
(162, 'NE', 'Niger'),
(163, 'NF', 'Norfolk Island'),
(164, 'NG', 'Nigeria'),
(165, 'NI', 'Nicaragua'),
(166, 'NL', 'Netherlands'),
(167, 'NO', 'Norway'),
(168, 'NP', 'Nepal'),
(169, 'NR', 'Nauru'),
(170, 'NU', 'Niue'),
(171, 'NZ', 'New Zealand'),
(172, 'OM', 'Oman'),
(173, 'PA', 'Panama'),
(174, 'PE', 'Peru'),
(175, 'PF', 'French Polynesia'),
(176, 'PG', 'Papua New Guinea'),
(177, 'PH', 'Philippines'),
(178, 'PK', 'Pakistan'),
(179, 'PL', 'Poland'),
(180, 'PM', 'Saint Pierre and Miquelon'),
(181, 'PN', 'Pitcairn Islands'),
(182, 'PR', 'Puerto Rico'),
(183, 'PS', 'Palestine'),
(184, 'PT', 'Portugal'),
(185, 'PW', 'Palau'),
(186, 'PY', 'Paraguay'),
(187, 'QA', 'Qatar'),
(188, 'RE', 'Réunion'),
(189, 'RO', 'Romania'),
(190, 'RS', 'Serbia'),
(191, 'RU', 'Russia'),
(192, 'RW', 'Rwanda'),
(193, 'SA', 'Saudi Arabia'),
(194, 'SB', 'Solomon Islands'),
(195, 'SC', 'Seychelles'),
(196, 'SD', 'Sudan'),
(197, 'SE', 'Sweden'),
(198, 'SG', 'Singapore'),
(199, 'SH', 'Saint Helena'),
(200, 'SI', 'Slovenia'),
(201, 'SJ', 'Svalbard and Jan Mayen'),
(202, 'SK', 'Slovakia'),
(203, 'SL', 'Sierra Leone'),
(204, 'SM', 'San Marino'),
(205, 'SN', 'Senegal'),
(206, 'SO', 'Somalia'),
(207, 'SR', 'Suriname'),
(208, 'SS', 'South Sudan'),
(209, 'ST', 'São Tomé and Príncipe'),
(210, 'SV', 'El Salvador'),
(211, 'SX', 'Sint Maarten'),
(212, 'SY', 'Syria'),
(213, 'SZ', 'Swaziland'),
(214, 'TC', 'Turks and Caicos Islands'),
(215, 'TD', 'Chad'),
(216, 'TF', 'French Southern Territories'),
(217, 'TG', 'Togo'),
(218, 'TH', 'Thailand'),
(219, 'TJ', 'Tajikistan'),
(220, 'TK', 'Tokelau'),
(221, 'TL', 'East Timor'),
(222, 'TM', 'Turkmenistan'),
(223, 'TN', 'Tunisia'),
(224, 'TO', 'Tonga'),
(225, 'TR', 'Turkey'),
(226, 'TT', 'Trinidad and Tobago'),
(227, 'TV', 'Tuvalu'),
(228, 'TW', 'Taiwan'),
(229, 'TZ', 'Tanzania'),
(230, 'UA', 'Ukraine'),
(231, 'UG', 'Uganda'),
(232, 'UM', 'U.S. Minor Outlying Islands'),
(233, 'US', 'United States'),
(234, 'UY', 'Uruguay'),
(235, 'UZ', 'Uzbekistan'),
(236, 'VA', 'Vatican City'),
(237, 'VC', 'Saint Vincent and the Grenadines'),
(238, 'VE', 'Venezuela'),
(239, 'VG', 'British Virgin Islands'),
(240, 'VI', 'U.S. Virgin Islands'),
(241, 'VN', 'Vietnam'),
(242, 'VU', 'Vanuatu'),
(243, 'WF', 'Wallis and Futuna'),
(244, 'WS', 'Samoa'),
(245, 'XK', 'Kosovo'),
(246, 'YE', 'Yemen'),
(247, 'YT', 'Mayotte'),
(248, 'ZA', 'South Africa'),
(249, 'ZM', 'Zambia'),
(250, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `neighborhood`
--

CREATE TABLE IF NOT EXISTS `neighborhood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityid` int(11) NOT NULL,
  `townshipid` int(11) DEFAULT NULL,
  `neighborhood` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_neighborhood_township1_idx` (`townshipid`),
  KEY `fk_neighborhood_city1_idx` (`cityid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `neighborhood`
--

INSERT INTO `neighborhood` (`id`, `cityid`, `townshipid`, `neighborhood`) VALUES
(1, 1, 1, 'Chanis');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `state`
--

CREATE TABLE IF NOT EXISTS `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countryid` int(11) NOT NULL,
  `state` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_state_country1_idx` (`countryid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `state`
--

INSERT INTO `state` (`id`, `countryid`, `state`) VALUES
(1, 173, 'Panamá'),
(2, 173, 'Panamá Oeste'),
(3, 173, 'Colon'),
(4, 173, 'Coclé'),
(5, 173, 'Herrera'),
(6, 173, 'Los Santos'),
(7, 173, 'Veraguas'),
(8, 173, 'Chiriquí'),
(9, 173, 'Bocas del Toro'),
(10, 173, 'Darién'),
(11, 173, 'Comarca Guna Yala'),
(12, 173, 'Comarca Emberá-Wounaan'),
(13, 173, 'Comarca Ngäbe-Buglé'),
(14, 173, 'Comarca Madungandi'),
(15, 173, 'Comarca Wargandí'),
(16, 49, 'Cundinamarca');

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
  PRIMARY KEY (`id`),
  KEY `fk_township_city1_idx` (`cityid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `township`
--

INSERT INTO `township` (`id`, `cityid`, `township`) VALUES
(1, 1, 'Juan Diaz'),
(4, 2, 'Norte'),
(5, 1, 'San Francisco2'),
(6, 1, 'Juan Diaz'),
(7, 1, 'Tocumen'),
(8, 2, 'Usaquen2'),
(9, 1, 'sasasa'),
(15, 1, 'testr'),
(17, 2, 'test');

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
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(1, 'andres3333', 'andresfranco2@cableonda.net', 'password4'),
(2, 'pedro', 'pedro@hotmail.com', '$2a$08$aI7XSAM01l47eUQBCxNLTeDMeH7qGyVDsMQ1gn48865o3YAnQykGO'),
(3, 'pablo', 'pablo@hotmail.com', 'password'),
(4, 'as', 'andresfranco@cableonda.net', ''),
(5, '', 'pedro@hotmail.com', ''),
(6, 'test', 'afranco@adrtec.com', 'sdsd'),
(7, 'assa', 'afranco@adrtec.com', 'ssdds'),
(8, 'sdsd', 'andresfranco@cableonda.net', 'asas'),
(9, 'aass', 'andresfranco@cableonda.net', 's'),
(13, 'sas', 'andresfranco@cableonda.net', 'ss'),
(14, 'sassss', 'andresfranco@cableonda.net', 'asssss'),
(15, 'assddf', 'andresfranco@cableonda.net', 'asssssfffff'),
(16, 'asass', 'afranco@adrtec.com', 'asassa'),
(17, 'prueba', 'prueba@prueba.com', 'prueba123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`roleid`),
  KEY `fk_user_role_user1_idx` (`userid`),
  KEY `fk_user_role_role1_idx` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Filtros para la tabla `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `fk_user_role_role1` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_role_user1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
