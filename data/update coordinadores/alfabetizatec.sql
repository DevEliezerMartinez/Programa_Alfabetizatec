-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-01-2025 a las 14:01:09
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
-- Base de datos: `alfabetizatec`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coordinadores_nacionales`
--

CREATE TABLE `coordinadores_nacionales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_usuario` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `coordinadores_nacionales`
--

INSERT INTO `coordinadores_nacionales` (`id`, `id_usuario`) VALUES
(1, 255),
(2, 256);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coordinadores_programa`
--

CREATE TABLE `coordinadores_programa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `id_tecnologico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `coordinadores_programa`
--

INSERT INTO `coordinadores_programa` (`id`, `id_usuario`, `id_tecnologico`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20),
(21, 21, 21),
(22, 22, 22),
(23, 23, 23),
(24, 24, 24),
(25, 25, 25),
(26, 26, 26),
(27, 27, 27),
(28, 28, 28),
(29, 29, 29),
(30, 30, 30),
(31, 31, 31),
(32, 32, 32),
(33, 33, 33),
(34, 34, 34),
(35, 35, 35),
(36, 36, 36),
(37, 37, 37),
(38, 38, 38),
(39, 39, 39),
(40, 40, 40),
(41, 41, 41),
(42, 42, 42),
(43, 43, 43),
(44, 44, 44),
(45, 45, 45),
(46, 46, 46),
(47, 47, 47),
(48, 48, 48),
(49, 49, 49),
(50, 50, 50),
(51, 51, 51),
(52, 52, 52),
(53, 53, 53),
(54, 54, 54),
(55, 55, 55),
(56, 56, 56),
(57, 57, 57),
(58, 58, 58),
(59, 59, 59),
(60, 60, 60),
(61, 61, 61),
(62, 62, 62),
(63, 63, 63),
(64, 64, 64),
(65, 65, 65),
(66, 66, 66),
(67, 67, 67),
(68, 68, 68),
(69, 69, 69),
(70, 70, 70),
(71, 71, 71),
(72, 72, 72),
(73, 73, 73),
(74, 74, 74),
(75, 75, 75),
(76, 76, 76),
(77, 77, 77),
(78, 78, 78),
(79, 79, 79),
(80, 80, 80),
(81, 81, 81),
(82, 82, 82),
(83, 83, 83),
(84, 84, 84),
(85, 85, 85),
(86, 86, 86),
(87, 87, 87),
(88, 88, 88),
(89, 89, 89),
(90, 90, 90),
(91, 91, 91),
(92, 92, 92),
(93, 93, 93),
(94, 94, 94),
(95, 95, 95),
(96, 96, 96),
(97, 97, 97),
(98, 98, 98),
(99, 99, 99),
(100, 100, 100),
(101, 101, 101),
(102, 102, 102),
(103, 103, 103),
(104, 104, 104),
(105, 105, 105),
(106, 106, 106),
(107, 107, 107),
(108, 108, 108),
(109, 109, 109),
(110, 110, 110),
(111, 111, 111),
(112, 112, 112),
(113, 113, 113),
(114, 114, 114),
(115, 115, 115),
(116, 116, 116),
(117, 117, 117),
(118, 118, 118),
(119, 119, 119),
(120, 120, 120),
(121, 121, 121),
(122, 122, 122),
(123, 123, 123),
(124, 124, 124),
(125, 125, 125),
(126, 126, 126),
(127, 127, 127),
(128, 128, 128),
(129, 129, 129),
(130, 130, 130),
(131, 131, 131),
(132, 132, 132),
(133, 133, 133),
(134, 134, 134),
(135, 135, 135),
(136, 136, 136),
(137, 137, 137),
(138, 138, 138),
(139, 139, 139),
(140, 140, 140),
(141, 141, 141),
(142, 142, 142),
(143, 143, 143),
(144, 144, 144),
(145, 145, 145),
(146, 146, 146),
(147, 147, 147),
(148, 148, 148),
(149, 149, 149),
(150, 150, 150),
(151, 151, 151),
(152, 152, 152),
(153, 153, 153),
(154, 154, 154),
(155, 155, 155),
(156, 156, 156),
(157, 157, 157),
(158, 158, 158),
(159, 159, 159),
(160, 160, 160),
(161, 161, 161),
(162, 162, 162),
(163, 163, 163),
(164, 164, 164),
(165, 165, 165),
(166, 166, 166),
(167, 167, 167),
(168, 168, 168),
(169, 169, 169),
(170, 170, 170),
(171, 171, 171),
(172, 172, 172),
(173, 173, 173),
(174, 174, 174),
(175, 175, 175),
(176, 176, 176),
(177, 177, 177),
(178, 178, 178),
(179, 179, 179),
(180, 180, 180),
(181, 181, 181),
(182, 182, 182),
(183, 183, 183),
(184, 184, 184),
(185, 185, 185),
(186, 186, 186),
(187, 187, 187),
(188, 188, 188),
(189, 189, 189),
(190, 190, 190),
(191, 191, 191),
(192, 192, 192),
(193, 193, 193),
(194, 194, 194),
(195, 195, 195),
(196, 196, 196),
(197, 197, 197),
(198, 198, 198),
(199, 199, 199),
(200, 200, 200),
(201, 201, 201),
(202, 202, 202),
(203, 203, 203),
(204, 204, 204),
(205, 205, 205),
(206, 206, 206),
(207, 207, 207),
(208, 208, 208),
(209, 209, 209),
(210, 210, 210),
(211, 211, 211),
(212, 212, 212),
(213, 213, 213),
(214, 214, 214),
(215, 215, 215),
(216, 216, 216),
(217, 217, 217),
(218, 218, 218),
(219, 219, 219),
(220, 220, 220),
(221, 221, 221),
(222, 222, 222),
(223, 223, 223),
(224, 224, 224),
(225, 225, 225),
(226, 226, 226),
(227, 227, 227),
(228, 228, 228),
(229, 229, 229),
(230, 230, 230),
(231, 231, 231),
(232, 232, 232),
(233, 233, 233),
(234, 234, 234),
(235, 235, 235),
(236, 236, 236),
(237, 237, 237),
(238, 238, 238),
(239, 239, 239),
(240, 240, 240),
(241, 241, 241),
(242, 242, 242),
(243, 243, 243),
(244, 244, 244),
(245, 245, 245),
(246, 246, 246),
(247, 247, 247),
(248, 248, 248),
(249, 249, 249);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coordinadores_regionales`
--

CREATE TABLE `coordinadores_regionales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `id_region` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `coordinadores_regionales`
--

INSERT INTO `coordinadores_regionales` (`id`, `id_usuario`, `id_region`) VALUES
(1, 250, 5),
(2, 251, 2),
(3, 252, 4),
(4, 254, 3),
(5, 253, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `educadores`
--

CREATE TABLE `educadores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `tipo_participante` varchar(255) NOT NULL,
  `modalidad` varchar(200) NOT NULL,
  `numero_control` bigint(20) DEFAULT NULL,
  `carrera` bigint(20) DEFAULT NULL,
  `id_tecnologico` bigint(20) DEFAULT NULL,
  `semestre` bigint(20) DEFAULT NULL,
  `nacionalidad` varchar(255) DEFAULT NULL,
  `entidad_nacimiento` varchar(255) DEFAULT NULL,
  `curp` varchar(50) DEFAULT NULL,
  `sexo` varchar(50) DEFAULT NULL,
  `estado_civil` varchar(40) DEFAULT NULL,
  `num_hijos` varchar(40) DEFAULT NULL,
  `escolaridad` varchar(100) DEFAULT NULL,
  `ocupacion` varchar(255) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `alianza` varchar(255) DEFAULT NULL,
  `subproyecto` varchar(255) DEFAULT NULL,
  `tipo_vinculacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `educadores`
--

INSERT INTO `educadores` (`id`, `id_usuario`, `tipo_participante`, `modalidad`, `numero_control`, `carrera`, `id_tecnologico`, `semestre`, `nacionalidad`, `entidad_nacimiento`, `curp`, `sexo`, `estado_civil`, `num_hijos`, `escolaridad`, `ocupacion`, `fecha_registro`, `alianza`, `subproyecto`, `tipo_vinculacion`) VALUES
(5, 268, '0', 'Constancia de Valor Curricular', 0, 0, 89, 0, 'mexicano', 'Morelos', 'SOME001120HGRLRLA2', 'hombre', 'soltero', '0', 'secundaria_completa', 'Trabajador ambulante', '2025-01-27', 'none', 'oneee', 'neneee'),
(6, 269, '0', 'Constancia de Valor Curricular', 0, 0, 89, 0, 'mexicano', 'Morelos', 'SOME001120HGRLRLA2', 'hombre', 'soltero', '0', 'secundaria_completa', 'Trabajador ambulante', '2025-01-27', 'none', 'oneee', 'neneee');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `id_region` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `nombre`, `id_region`) VALUES
(1, 'Aguascalientes', 3),
(2, 'Baja California', 1),
(3, 'Baja California Sur', 1),
(4, 'Campeche', 5),
(5, 'Chiapas', 5),
(6, 'Chihuahua', 2),
(7, 'Ciudad de México', 4),
(8, 'Coahuila', 2),
(9, 'Colima', 3),
(10, 'Durango', 1),
(11, 'Guanajuato', 3),
(12, 'Guerrero', 5),
(13, 'Hidalgo', 2),
(14, 'Jalisco', 3),
(15, 'Estado de México', 4),
(16, 'Michoacán', 3),
(17, 'Morelos', 4),
(18, 'Nayarit', 1),
(19, 'Nuevo León', 2),
(20, 'Oaxaca', 5),
(21, 'Puebla', 4),
(22, 'Querétaro', 3),
(23, 'Quintana Roo', 5),
(24, 'San Luis Potosí', 3),
(25, 'Sinaloa', 1),
(26, 'Sonora', 1),
(27, 'Tabasco', 5),
(28, 'Tamaulipas', 2),
(29, 'Tlaxcala', 4),
(30, 'Veracruz', 2),
(31, 'Yucatán', 5),
(32, 'Zacatecas', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `domicilio` varchar(255) NOT NULL,
  `curp` varchar(255) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `segundo_apellido` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` enum('mujer','hombre','no_binario') DEFAULT NULL,
  `nacionalidad` varchar(100) DEFAULT NULL,
  `entidad_nacimiento` varchar(100) DEFAULT NULL,
  `estado_civil` enum('soltero','casado','union_libre','separado','divorciado','viudo') DEFAULT NULL,
  `num_hijos` tinyint(3) UNSIGNED DEFAULT 0,
  `vialidad_tipo` varchar(50) DEFAULT NULL,
  `vialidad_nombre` varchar(255) DEFAULT NULL,
  `num_exterior` varchar(50) DEFAULT NULL,
  `num_interior` varchar(50) DEFAULT NULL,
  `codigo_postal` varchar(10) DEFAULT NULL,
  `colonia` varchar(100) DEFAULT NULL,
  `entidad_federativa` varchar(50) DEFAULT NULL,
  `telefono_fijo` varchar(20) DEFAULT NULL,
  `habla_lengua_indigena` enum('si','no') DEFAULT 'no',
  `habla_otro_idioma` enum('si','no') DEFAULT 'no',
  `lengua_indigena` varchar(50) DEFAULT NULL,
  `municipio` varchar(100) DEFAULT NULL,
  `otro_idioma` varchar(50) DEFAULT NULL,
  `proceso_nivel_ingresa` varchar(50) DEFAULT NULL,
  `se_considera_afromexicano` enum('si','no') DEFAULT 'no',
  `se_considera_indigena` enum('si','no') DEFAULT 'no',
  `servicio_educativo` varchar(100) DEFAULT NULL,
  `tiene_acceso_internet` enum('si','no') DEFAULT 'no',
  `tiene_equipo_computo` enum('si','no') DEFAULT 'no',
  `situacion_laboral` varchar(50) DEFAULT NULL,
  `discapacidad` set('ninguna','fisica','visual','auditiva','intelectual','psicosocial') DEFAULT 'ninguna',
  `nivel_educativo` varchar(50) DEFAULT NULL,
  `motivacion` set('certificado','educacion','empleo','laborales','hijos') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles`
--

CREATE TABLE `niveles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `niveles`
--

INSERT INTO `niveles` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Analfabeta', 'Nivel educativo inicial.'),
(2, 'Inicial', 'Nivel educativo intermedio.'),
(3, 'Superior', 'Nivel educativo avanzado.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas`
--

CREATE TABLE `programas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `id_tecnologico` bigint(20) NOT NULL,
  `id_nivel` bigint(20) NOT NULL,
  `meta` bigint(20) NOT NULL,
  `id_coordinador` bigint(20) DEFAULT NULL,
  `inicio_periodo` date NOT NULL,
  `fin_periodo` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `programas`
--

INSERT INTO `programas` (`id`, `nombre`, `descripcion`, `id_tecnologico`, `id_nivel`, `meta`, `id_coordinador`, `inicio_periodo`, `fin_periodo`) VALUES
(1, '', '', 89, 1, 100, 0, '2025-01-27', '2025-01-31'),
(2, '', '', 89, 1, 100, 0, '2025-01-28', '2025-01-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa_educadores`
--

CREATE TABLE `programa_educadores` (
  `id` bigint(20) NOT NULL,
  `id_programa` bigint(20) NOT NULL,
  `id_educador` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regiones`
--

CREATE TABLE `regiones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `regiones`
--

INSERT INTO `regiones` (`id`, `nombre`) VALUES
(1, 'Occidente'),
(2, 'Noreste'),
(3, 'Bajio'),
(4, 'Centro'),
(5, 'Sureste');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `nivel_permiso` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `nivel_permiso`) VALUES
(1, 'Coordinador Nacional', '1'),
(2, 'Coordinador Regional', '2'),
(3, 'Coordinador de programa', '3'),
(4, 'Educador', '4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL,
  `id_programa` bigint(20) NOT NULL,
  `id_estudiante` bigint(20) NOT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnologicos`
--

CREATE TABLE `tecnologicos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `estado_id` bigint(20) NOT NULL,
  `modalidad` varchar(255) NOT NULL,
  `director` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tecnologicos`
--

INSERT INTO `tecnologicos` (`id`, `nombre`, `estado_id`, `modalidad`, `director`) VALUES
(1, 'I.T. de Campeche', 4, 'Federal', ''),
(2, 'I.T. de Álvaro Obregón', 7, 'Federal', ''),
(3, 'I.T. de Chihuahua', 6, 'Federal', ''),
(4, 'I.T. de Celaya', 11, 'Federal', ''),
(5, 'I.T. de Delicias', 6, 'Federal', ''),
(6, 'I.T.S. de Río Verde', 24, 'Descentralizado', ''),
(7, 'I.T. de Lázaro Cárdenas', 16, 'Federal', ''),
(8, 'I.T. de Mérida', 31, 'Federal', ''),
(9, 'I.T.S. de Álamo Temapache', 30, 'Descentralizado', ''),
(10, 'I.T. de Culiacán', 25, 'Federal', ''),
(11, 'I.T.S. de La Costa Chica', 12, 'Descentralizado', ''),
(12, 'I.T. de Nuevo León', 19, 'Federal', ''),
(13, 'T.E.S. de La Región Carbonifera', 8, 'Descentralizado', ''),
(14, 'I.T.S. de Irapuato', 11, 'Descentralizado', ''),
(15, 'I.T. de Iguala', 12, 'Federal', ''),
(16, 'I.T.S. de Zacapoaxtla', 21, 'Descentralizado', ''),
(17, 'I.T. de Toluca', 15, 'Federal', ''),
(18, 'I.T. de Tapachula', 5, 'Federal', ''),
(19, 'I.T.S. de Centla', 27, 'Descentralizado', ''),
(20, 'I.T. del Istmo', 20, 'Federal', ''),
(21, 'I.T. de Tláhuac', 7, 'Federal', ''),
(22, 'T.E.S. de Ote. del Edo. de México', 15, 'Descentralizado', ''),
(23, 'I.T.S. de Teposcolula', 20, 'Descentralizado', ''),
(24, 'I.T. de Comitancillo', 20, 'Federal', ''),
(25, 'I.T.S. de Zacatecas Sur', 32, 'Descentralizado', ''),
(26, 'I.T. de Parral', 6, 'Federal', ''),
(27, 'T.E.S. de Ixtapaluca', 15, 'Descentralizado', ''),
(28, 'I.T. de Cerro Azul', 30, 'Federal', ''),
(29, 'T.E.S. de Coacalco', 15, 'Descentralizado', ''),
(30, 'T.E.S. de Tianguistenco', 15, 'Descentralizado', ''),
(31, 'I.T.S. de La Montaña', 12, 'Descentralizado', ''),
(32, 'I.T.S. de Xalapa', 30, 'Descentralizado', ''),
(33, 'I.T. de Norte de Nayarit', 18, 'Federal', ''),
(34, 'I.T. de Pochutla', 20, 'Federal', ''),
(35, 'I.T. de Zacatepec', 17, 'Federal', ''),
(36, 'I.T.S. de Huatusco', 30, 'Descentralizado', ''),
(37, 'I.T. de Tláhuac II', 7, 'Federal', ''),
(38, 'I.T.S. de Acatlán de Osorio', 21, 'Descentralizado', ''),
(39, 'I.T. de Zacatecas', 32, 'Federal', ''),
(40, 'I.T.S. de San Miguel El Grande', 20, 'Descentralizado', ''),
(41, 'I.T. de Cancún', 23, 'Federal', ''),
(42, 'T.E.S. de Chicoloapan', 15, 'Descentralizado', ''),
(43, 'I.T.S. de San Pedro de las Colonias', 8, 'Descentralizado', ''),
(44, 'I.T. de Nogales', 26, 'Federal', ''),
(45, 'I.T. de San Juan del Río', 22, 'Federal', ''),
(46, 'I.T.S. de Salvatierra', 11, 'Descentralizado', ''),
(47, 'I.T.S. de El Dorado', 25, 'Descentralizado', ''),
(48, 'I.T. de Durango', 10, 'Federal', ''),
(49, 'I.T. de Mazatlán', 25, 'Federal', ''),
(50, 'I.T. de El Salto', 10, 'Federal', ''),
(51, 'I.T. de Chihuahua II', 6, 'Federal', ''),
(52, 'I.T. de Hermosillo', 26, 'Federal', ''),
(53, 'I.T. de Gustavo A. Madero II', 7, 'Federal', ''),
(54, 'I.T.S. de Los Ríos', 27, 'Descentralizado', ''),
(55, 'I.T. de Ensenada', 2, 'Federal', ''),
(56, 'I.T.S. de Chicontepec', 30, 'Descentralizado', ''),
(57, 'I.T. de Tuxtepec', 20, 'Federal', ''),
(58, 'I.T. de Tijuana', 2, 'Federal', ''),
(59, 'I.T.S. de Nuevo Casas Grandes', 6, 'Descentralizado', ''),
(60, 'I.T.S. de Tlaxco', 29, 'Descentralizado', ''),
(61, 'I.T. de Mexicali', 2, 'Federal', ''),
(62, 'I.T. de Iztapalapa II', 7, 'Federal', ''),
(63, 'I.T.S. de Misantla', 30, 'Descentralizado', ''),
(64, 'I.T.S. de Guanajuato', 11, 'Descentralizado', ''),
(65, 'I.T.S. de Purhepecha', 16, 'Descentralizado', ''),
(66, 'I.T.S. de Cd. Acuña', 8, 'Descentralizado', ''),
(67, 'I.T. de Pinotepa', 20, 'Federal', ''),
(68, 'I.T. de Iztapalapa', 7, 'Federal', ''),
(69, 'T.E.S. de Huixquilucan', 15, 'Descentralizado', ''),
(70, 'T.E.S. de Chalco', 15, 'Descentralizado', ''),
(71, 'T.E.S. de Jocotitlán', 15, 'Descentralizado', ''),
(72, 'I.T.S. de Fresnillo', 32, 'Descentralizado', ''),
(73, 'I.T. de Conkal', 31, 'Federal', ''),
(74, 'I.T. de La Chontalpa', 27, 'Federal', ''),
(75, 'I.T. de Huimanguillo', 27, 'Federal', ''),
(76, 'ITS de Purísima del Rincón', 11, 'Descentralizado', ''),
(77, 'I.T.S. de Cosamaloapan', 30, 'Descentralizado', ''),
(78, 'I.T. de Jiquilpan', 16, 'Federal', ''),
(79, 'I.T. de Tepic', 18, 'Federal', ''),
(80, 'I.T.S. de Tepexi de Rodríguez', 21, 'Descentralizado', ''),
(81, 'I.T. de Ocotlán', 14, 'Federal', ''),
(82, 'T.E.S. de Cuautitlán Izcalli', 15, 'Descentralizado', ''),
(83, 'I.T. de Chetumal', 23, 'Federal', ''),
(84, 'I.T. de Zitácuaro', 16, 'Federal', ''),
(85, 'I.T. de Villahermosa', 27, 'Federal', ''),
(86, 'I.T. de Lerma', 4, 'Federal', ''),
(87, 'I.T. de Acapulco', 12, 'Federal', ''),
(88, 'I.T. de Cuautla', 17, 'Federal', ''),
(89, 'I.T. de San Marcos', 12, 'Federal', ''),
(90, 'I.T.S. de Tamazunchale', 24, 'Descentralizado', ''),
(91, 'I.T.S. de Monclova', 8, 'Descentralizado', ''),
(92, 'I.T.S. de La Región de los Llanos', 10, 'Descentralizado', ''),
(93, 'I.T.S. de Puerto Peñasco', 26, 'Descentralizado', ''),
(94, 'I.T.S. de Múzquiz', 8, 'Descentralizado', ''),
(95, 'ITS de Hopelchen', 4, 'Descentralizado', ''),
(96, 'I.T.S. de Zacatecas Norte', 32, 'Descentralizado', ''),
(97, 'I.T. de Valle de Morelia', 16, 'Federal', ''),
(98, 'I.T.S. de Tacámbaro', 16, 'Descentralizado', ''),
(99, 'I.T. de Valle del Guadiana', 10, 'Federal', ''),
(100, 'I.T.S. de Alvarado', 30, 'Descentralizado', ''),
(101, 'I.T. de Huejutla', 13, 'Federal', ''),
(102, 'I.T. de Salina Cruz', 20, 'Federal', ''),
(103, 'I.T. de Cd. Jiménez', 6, 'Federal', ''),
(104, 'I.T. de Agua Prieta', 26, 'Federal', ''),
(105, 'I.T.S. de Progreso', 31, 'Descentralizado', ''),
(106, 'I.T.S. de Guasave', 25, 'Descentralizado', ''),
(107, 'I.T.S. de Jesús Carranza', 30, 'Descentralizado', ''),
(108, 'I.T. de Linares', 19, 'Federal', ''),
(109, 'I.T. de Roque', 11, 'Federal', ''),
(110, 'I.T.S. de Mulegé', 3, 'Descentralizado', ''),
(111, 'I.T. de Cd. Juárez', 6, 'Federal', ''),
(112, 'I.T.S. de Nochistlán', 32, 'Descentralizado', ''),
(113, 'I.T. de Tlajomulco', 14, 'Federal', ''),
(114, 'I.T. de Úrsulo Galván', 30, 'Federal', ''),
(115, 'I.T.S. de Felipe Carrillo Puerto', 23, 'Descentralizado', ''),
(116, 'I.T. de Iztapalapa III', 7, 'Federal', ''),
(117, 'I.T. de La Piedad', 16, 'Federal', ''),
(118, 'I.T. de La Laguna', 8, 'Federal', ''),
(119, 'I.T.S. de Ote. del Edo. de Hidalgo', 13, 'Descentralizado', ''),
(120, 'I.T. de Cd. Altamirano', 12, 'Federal', ''),
(121, 'I.T. de Tizimín', 31, 'Federal', ''),
(122, 'I.T. de Orizaba', 30, 'Federal', ''),
(123, 'I.T.S. de Lerdo', 10, 'Descentralizado', ''),
(124, 'I.T.S. de La Sierra Negra de Ajalpan', 21, 'Descentralizado', ''),
(125, 'I.T. de Torreón', 8, 'Federal', ''),
(126, 'I.T.S. de Tantoyuca', 30, 'Descentralizado', ''),
(127, 'I.T.S. de Puruándiro', 16, 'Descentralizado', ''),
(128, 'I.T. de Piedras Negras', 8, 'Federal', ''),
(129, 'I.T.S. de Santiago Papasquiaro', 10, 'Descentralizado', ''),
(130, 'I.T. de La Zona Olmeca', 30, 'Federal', ''),
(131, 'I.T. de Apizaco', 29, 'Federal', ''),
(132, 'I.T.S. de Zongolica', 30, 'Descentralizado', ''),
(133, 'I.T. de Cd. Victoria', 28, 'Federal', ''),
(134, 'I.T. de Atitalaquia', 13, 'Federal', ''),
(135, 'I.T. de Matehuala', 24, 'Federal', ''),
(136, 'I.T. de Valle del Yaqui', 26, 'Federal', ''),
(137, 'I.T. de Puebla', 21, 'Federal', ''),
(138, 'I.T.S. de Cajeme', 26, 'Descentralizado', ''),
(139, 'I.T. de Nuevo Laredo', 28, 'Federal', ''),
(140, 'I.T.S. de Comalcalco', 27, 'Descentralizado', ''),
(141, 'I.T. de Tlaxiaco', 20, 'Federal', ''),
(142, 'I.T. de Cd. Valles', 24, 'Federal', ''),
(143, 'CRODE Orizaba', 30, 'CRODE', ''),
(144, 'I.T. de Oaxaca', 20, 'Federal', ''),
(145, 'I.T.S. de Atlixco', 21, 'Descentralizado', ''),
(146, 'I.T.S. de Huichapan', 13, 'Descentralizado', ''),
(147, 'I.T.S. de Pánuco', 30, 'Descentralizado', ''),
(148, 'I.T. de Querétaro', 22, 'Federal', ''),
(149, 'I.T. de La Zona Maya', 23, 'Federal', ''),
(150, 'I.T.S. de Calkiní', 4, 'Descentralizado', ''),
(151, 'T.E.S. de Jilotepec', 15, 'Descentralizado', ''),
(152, 'ITS de Abasolo', 11, 'Descentralizado', ''),
(153, 'I.T. de Sur de Nayarit', 18, 'Federal', ''),
(154, 'I.T.S. de Apatzingán', 16, 'Descentralizado', ''),
(155, 'I.T. de Valle de Oaxaca', 20, 'Federal', ''),
(156, 'I.T. de Comitán', 5, 'Federal', ''),
(157, 'I.T. de Colima', 9, 'Federal', ''),
(158, 'T.E.S. de Chimalhuacán', 15, 'Descentralizado', ''),
(159, 'I.T.S. de Juan Rodríguez Clara', 30, 'Descentralizado', ''),
(160, 'I.T. de Saltillo', 8, 'Federal', ''),
(161, 'I.T.S. de Coatzacoalcos', 30, 'Descentralizado', ''),
(162, 'I.T. de Cd. Madero', 28, 'Federal', ''),
(163, 'I.T. de Frontera Comalapa', 5, 'Federal', ''),
(164, 'I.T. de Aguascalientes', 1, 'Federal', ''),
(165, 'I.T. de Tlalnepantla', 15, 'Federal', ''),
(166, 'I.T. de Cd. Cuauhtémoc', 6, 'Federal', ''),
(167, 'CRODE Chihuahua', 6, 'CRODE', ''),
(168, 'I.T. de Valle de Etla', 20, 'Federal', ''),
(169, 'I.T. de Huatabampo', 26, 'Federal', ''),
(170, 'I.T. de Chilpancingo', 12, 'Federal', ''),
(171, 'I.T.S. de Mante', 28, 'Descentralizado', ''),
(172, 'I.T.S. de Valladolid', 31, 'Descentralizado', ''),
(173, 'I.T. de Milpa Alta', 7, 'Federal', ''),
(174, 'I.T. de Tuxtla Gutiérrez', 5, 'Federal', ''),
(175, 'I.T.S. de Sur de Guanajuato', 11, 'Descentralizado', ''),
(176, 'I.T. de Cd. Guzmán', 14, 'Federal', ''),
(177, 'I.T. de Gustavo A. Madero', 7, 'Federal', ''),
(178, 'I.T.S. de Villa La Venta', 27, 'Descentralizado', ''),
(179, 'I.T.S. de Tepeaca', 21, 'Descentralizado', ''),
(180, 'T.E.S. de Ecatepec', 15, 'Descentralizado', ''),
(181, 'I.T. de San Luis Potosí', 24, 'Federal', ''),
(182, 'I.T. de Boca del Río', 30, 'Federal', ''),
(183, 'I.T. de Pabellón de Arteaga', 1, 'Federal', ''),
(184, 'I.T. de Tehuacán', 21, 'Federal', ''),
(185, 'I.T. de Morelia', 16, 'Federal', ''),
(186, 'I.T. de Sinaloa de Leyva', 25, 'Federal', ''),
(187, 'I.T. de Sinaloa de Leyva', 25, 'Federal', ''),
(188, 'I.T. de Reynosa', 28, 'Federal', ''),
(189, 'I.T. de Reynosa', 28, 'Federal', ''),
(190, 'I.T. de Costa Grande', 12, 'Federal', ''),
(191, 'I.T. de Costa Grande', 12, 'Federal', ''),
(192, 'I.T. de Tecomatlán', 21, 'Federal', ''),
(193, 'I.T. de Tecomatlán', 21, 'Federal', ''),
(194, 'I.T.S. de Cd. Constitución', 3, 'Descentralizado', ''),
(195, 'I.T.S. de Cd. Constitución', 3, 'Descentralizado', ''),
(196, 'I.T.S. de Cd. Hidalgo', 16, 'Descentralizado', ''),
(197, 'I.T.S. de Cd. Hidalgo', 16, 'Descentralizado', ''),
(198, 'I.T.S. de Huetamo', 16, 'Descentralizado', ''),
(199, 'I.T.S. de Huetamo', 16, 'Descentralizado', ''),
(200, 'I.T.S. de Tlatlauquitepec', 21, 'Descentralizado', ''),
(201, 'I.T.S. de Tlatlauquitepec', 21, 'Descentralizado', ''),
(202, 'I.T.S. de Venustiano Carranza', 21, 'Descentralizado', ''),
(203, 'I.T.S. de Venustiano Carranza', 21, 'Descentralizado', ''),
(204, 'I.T.S. de Acayucan', 30, 'Descentralizado', ''),
(205, 'I.T.S. de Acayucan', 30, 'Descentralizado', ''),
(206, 'I.T.S. de Naranjos', 30, 'Descentralizado', ''),
(207, 'I.T.S. de Naranjos', 30, 'Descentralizado', ''),
(208, 'I.T.S. de San Andrés Tuxtla', 30, 'Descentralizado', ''),
(209, 'I.T.S. de San Andrés Tuxtla', 30, 'Descentralizado', ''),
(210, 'T.E.S. de San Felipe del Progreso', 15, 'Descentralizado', ''),
(211, 'T.E.S. de San Felipe del Progreso', 15, 'Descentralizado', ''),
(212, 'I.T. de Tláhuac III', 7, 'Federal', ''),
(213, 'I.T.S. de Poza Rica', 30, 'Descentralizado', ''),
(214, 'I.T.S. de Teziutlán', 21, 'Descentralizado', ''),
(215, 'I.T. de Altamira', 28, 'Federal', ''),
(216, 'T.E.S. de Villa Guerrero', 15, 'Descentralizado', ''),
(217, 'I.T.S. de Martínez de la Torre', 30, 'Descentralizado', ''),
(218, 'I.T.S. de Atlixco', 21, 'Descentralizado', ''),
(219, 'I.T. de Milpa Alta II', 7, 'Federal', ''),
(220, 'I.T. de Guaymas', 26, 'Federal', ''),
(221, 'I.T. de El Llano Aguascalientes', 1, 'Federal', ''),
(222, 'I.T. de Minatitlán', 30, 'Federal', ''),
(223, 'T.E.S. de Zamora', 16, 'Descentralizado', ''),
(224, 'I.T.S. de Los Reyes', 16, 'Descentralizado', ''),
(225, 'I.T.S. de Tierra Blanca', 30, 'Descentralizado', ''),
(226, 'I.T.S. de Perote', 30, 'Descentralizado', ''),
(227, 'I.T.E.S. de Valle de Bravo', 15, 'Descentralizado', ''),
(228, 'I.T.S. de Cd. Serdán', 21, 'Descentralizado', ''),
(229, 'I.T.S. de Zacatecas Occidente', 32, 'Descentralizado', ''),
(230, 'T.E.S. de Chicoloapan', 15, 'Descentralizado', ''),
(231, 'I.T.S. de Juan Rodríguez Clara', 30, 'Descentralizado', ''),
(232, 'ITS de Hopelchen', 4, 'Descentralizado', ''),
(233, 'I.T.S. de Cananea', 26, 'Descentralizado', ''),
(234, 'I.T.S. de Santa María del Oro', 18, 'Descentralizado', ''),
(235, 'I.T.S. de Loreto', 3, 'Descentralizado', ''),
(236, 'I.T.S. de Coalcomán', 16, 'Descentralizado', ''),
(237, 'I.T.S. de Pátzcuaro', 16, 'Descentralizado', ''),
(238, 'I.T.S. de Coatzacoalcos', 30, 'Descentralizado', ''),
(239, 'I.T.E.S. de Los Cabos', 3, 'Descentralizado', ''),
(240, 'I.T.S. de Coatzacoalcos', 30, 'Descentralizado', ''),
(241, 'I.T.S. de Zacapoaxtla', 21, 'Descentralizado', ''),
(242, 'I.T.S. de Santiago Papasquiaro', 10, 'Descentralizado', ''),
(243, 'I.T. de Chiná', 4, 'Federal', ''),
(244, 'I.T.S. de La Sierra Norte de Puebla', 21, 'Descentralizado', ''),
(245, 'I.T.S. de Champotón', 4, 'Descentralizado', ''),
(246, 'I.T.S. de Escárcega', 4, 'Descentralizado', ''),
(247, 'I.T. de Bahía de Banderas', 18, 'Federal', ''),
(248, 'I.T.S. de Las Choapas', 30, 'Descentralizado', ''),
(249, 'I.T.S. de Motul', 31, 'Descentralizado', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `curp` varchar(20) DEFAULT NULL,
  `telefono` bigint(20) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `correo_inst` varchar(255) DEFAULT NULL,
  `contrasena` text NOT NULL,
  `rol_id` int(11) NOT NULL,
  `puesto` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `curp`, `telefono`, `correo`, `correo_inst`, `contrasena`, `rol_id`, `puesto`, `fecha_nacimiento`) VALUES
(1, 'Francisco Manuel Tomas ', 'Arriola Escalante ', 'AIEF890411HCCRSR19', 9811377393, 'vin_campeche@tecnm.mx', 'vin_campeche@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(2, 'Alejandra', 'Baleón González', 'BAGA960106MDFLNL00', 5543716010, 'vin_aobregon@tecnm.mx', 'vin_aobregon@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(3, 'Yadira Judith ', 'Flores Márquez', 'FOMY801219MCHLRD03', 6144044321, 'yadira.fm@chihuahua.tecnm.mx', 'yadira.fm@chihuahua.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(4, 'Gracia Cecilia', 'Gómez Morado', 'GOMG750923MGTMRR02', 4614063333, 'cecilia.gomez@itcelaya.edu.mx', 'cecilia.gomez@itcelaya.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(5, 'MARIA DEL ROSARIO ', 'BARAY GUERRERO', 'BAGR670914MCHRRS13', 6391119866, 'maria.bg@delicias.tecnm.mx', 'maria.bg@delicias.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(6, 'AZALIA', 'MOYA BARRAGAN', 'MOBA960903MSPYRZ03', 4871211071, 'azalia.mb@rioverde.tecnm.mx', 'azalia.mb@rioverde.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(7, 'Gloria Viridiana', ' Vallejo  Navarrete', 'VANG840305MMNLVL00', 7531244706, 'vin_lcardenas@tecnm.mx ', 'vin_lcardenas@tecnm.mx ', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(8, 'Luisa Gisell', 'Pat Reyes', 'PARL780903MYNTYS05', 9994269414, 'luisa.pr@merida.tecnm.mx', 'luisa.pr@merida.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(9, 'Frida Alicia', 'Pacheco Molina', 'PAMF960822MVXCLR01', 2282287797, 'frida.pm@alamo.tecnm.mx', 'frida.pm@alamo.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Director (a) de Planeación y Vinculación', NULL),
(10, 'Raul Alfonso', 'Ayon Felix', 'AOFR8102220HSLYLL01', 6671880026, 'vin_culiacan@tecnm.mx', 'vin_culiacan@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(11, 'Jhonatan', 'Añorve  Torres', 'AOTJ900814HGRXRH01', 7411155599, 'sub.vinculacion@costachica.tecnm.mx', 'sub.vinculacion@costachica.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(12, 'Lesly Yamilett', 'Treviño Reyna', 'TERL900502MNLRYS00', 8126536568, 'vin_nleon@tecnm.mx', 'vin_nleon@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(13, 'EVA GUADALUPE', 'SAID FERNÁNDEZ', 'SAFE650112MCLDRV01', 8611130454, 'subvinculacion@rcarbonifera.tecnm.mx', 'subvinculacion@rcarbonifera.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(14, 'Javier de Jesús', 'Rojas González', 'ROGJ790104HGTJNV07', 4621264655, 'javier.rg@irapuato.tecnm.mx', 'javier.rg@irapuato.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(15, 'Carlos Alberto', 'Díaz  Lara ', 'DILC730417HGRZRR08 ', 7331012027, 'vin_iguala@tecnm.mx ', 'vin_iguala@tecnm.mx ', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(16, 'Delfino Cuauhtémoc  ', 'Bravo Armenta', 'BAAD681226HDFRRL09', 2331045867, 'dir.planeacion.vinculacion@zacapoaxtla.tecnm.mx', 'dir.planeacion.vinculacion@zacapoaxtla.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Director (a) de Planeación y Vinculación', NULL),
(17, 'José Luis', 'García  Rivas', 'GARL710822HMCRVS05', 7221170939, 'vin@toluca.tecnm.mx', 'vin@toluca.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(18, 'Ana María', 'Salazar Ortiz', 'SAOA811219MSLLRN07', 9626957266, 'vin_tapachula@tecnm.mx', 'vin_tapachula@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(19, 'Arturo ', 'Arias Garcia', 'AIGA750722HTCRRR06', 9934953188, 'vinculacion@centla.tecnm.mx', 'vinculacion@centla.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(20, 'Claudia', 'Sánchez Martínez', 'SAMC840729MOCNRL01', 9711879270, 'servicio.social@itistmo.edu.mx', 'servicio.social@itistmo.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(21, 'YAJAIRA', 'TAPIA DE LA ROSA', 'TARY950614MDFPSJ04', 5554793519, 'servicio.social@tlahuac.tecnm.mx', 'servicio.social@tlahuac.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(22, 'SILVIA GLORIA ', 'MENDOZA  FERNÁNDEZ', 'MEFS810128MVZNRL07', 5634352112, 'ss.rp@tesoem.edu.mx', 'ss.rp@tesoem.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(23, 'DANIEL ', 'MIRANDA ESPINOSA', 'MIED750719HOCRSN00', 9511187744, 'vin_dteposcolula@tecnm.mx', 'vin_dteposcolula@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(24, 'YULMA', 'MENDEZ LOPEZ', 'MELY771006MOCNPL05', 9711757415, 'vin_comitancillo@tecnm.mx', 'vin_comitancillo@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(25, 'Héctor Eduardo ', 'Gutierrez  Casanova ', 'GUCH860521HZSTSC00', 4491579793, 'hector.gc@zacatecassur.tecnm.mx', 'hector.gc@zacatecassur.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(26, 'ABIGAIL', 'SALGADO MONÁRREZ', 'SAMA720429MDGLNB04', 6271065588, 'gestion@itparral.edu.mx', 'gestion@itparral.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(27, 'Carolina Anabel ', 'Ayala Hernández', 'AAHC841124MMCYRR02', 5548586705, 'servicio.socialyresidencias@tesi.edu.mx', 'servicio.socialyresidencias@tesi.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) de Oficina de Servicios Externos', NULL),
(28, 'Selene Inés ', 'Flores Salinas', 'FOSS880825PA6', 7851097068, 'ci_cerroazul@tecnm.mx', 'ci_cerroazul@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(29, 'Claudia Teresa ', 'Trejo  Jiménez ', 'TEJC810720MDFRML08', 5579835575, 'deptossrp@tesco.edu.mx', 'deptossrp@tesco.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(30, 'EMMANUEL', ' GARDUÑO  MEDINA', 'GAME871011HMCRDM06', 5532519330, 'plan_dtianguistenco@tecnm. mx ', 'plan_dtianguistenco@tecnm. mx ', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Director (a) de Planeación y Vinculación', NULL),
(31, 'ANANÍAS', 'JERÓNIMO VARGAS', 'JEVA660327HGRRRN03', 7571117175, 'vin_dmontana@tecnm.mx', 'vin_dmontana@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(32, 'Ilse Sahil', 'Montiel  Rodríguez', 'MORI871206MVZNDL04', 2285014083, 'ilse.montiel@itsx.edu.mx', 'ilse.montiel@itsx.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(33, 'Noemí Elizabeth', 'Castañeda Inda', 'CAIN690408MNTSNM04', 3118765877, 'vinculacion@nortenayarit.tecnm.mx', 'vinculacion@nortenayarit.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(34, 'Héctor ', 'Orozco Rodríguez', 'OORH800102HSLRDC08', 9541338203, 'ci_pochutla@tecnm.mx', 'ci_pochutla@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(35, 'JESUS', 'RECILLAS ROMAN', 'RERJ850329HMSCMS05', 7341815358, 'jesus.rr@zacatepec.tecnm.mx', 'jesus.rr@zacatepec.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(36, 'María Teresa ', 'Colin Zarate', 'COZT871123MVZLRR03', 2711048372, 'dposgrado@huatusco.tecnm.mx', 'dposgrado@huatusco.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(37, 'PAOLA ', 'MORENO ROMERO', 'MORP790820MDFRML00', 5624000339, 'vin_tlahuac2@tecnm.mx', 'vin_tlahuac2@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(38, 'Miriam', 'García Rojas', 'GARM620714MDFRJR12', 9531119347, 'vin_dacatlan@tecnm.mx', 'vin_dacatlan@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(39, 'AMAURY ', 'GUEL  BÁEZ', 'GUBA800315HSPLZM09vi', 4921342319, 'vin_zacatecas@tecnm.mx', 'vin_zacatecas@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(40, 'Brígido Gustavo ', 'González  Mora', 'GOMB800723HOCNRR00', 9531044415, 'gustavo.gm@smiguelgde.tecnm.mx', 'gustavo.gm@smiguelgde.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(41, 'JAVIER', 'PACHECO HIPOLITO', 'PAHJ720107HVZCPV01', 9981478640, 'vin_cancun@tecnm.mx', 'vin_cancun@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(42, 'Eduardo', 'Ramos Díaz', 'RADE850808HDFMZD01', 5539845070, 'eduardo.ramos@teschic.edu.mx', 'eduardo.ramos@teschic.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(43, 'ELIZABETH ', 'SANTOS HIDROGO', 'SAHE830109MDFNDL06', 8721092309, 'sub.vinculacion@tecsanpedro.edu.mx', 'sub.vinculacion@tecsanpedro.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(44, 'MARIO BENEDICTO', 'GONZALEZ LEON', 'GOLM660312HSRNNR00', 6311739700, 'vin_nogales@tecnm.mx', 'vin_nogales@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(45, 'EDITH ', 'ROSALÍO URIBE', 'ROUE890620MQTSRD09', 4272724118, 'vin_sjuanrio@tecnm.mx', 'vin_sjuanrio@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(46, 'Gustavo ', 'Cortes  Arias', 'Coag880905hgtrrs02', 4661194762, 'gucortes@itess.edu.mx', 'gucortes@itess.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(47, 'JOSÉ RAFAEL', 'CONTRERAS  CHÁVEZ', 'COCR870224HSLNHF03', 6673891514, 'JOSE.CC@ELDORADO.TECNM.MX', 'JOSE.CC@ELDORADO.TECNM.MX', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(48, 'Jorge Agustín', 'Pimentel Martínez', 'PIMJ790927HDGMRR03', 6181709942, 'jpimentel@itdurango.edu.mx', 'jpimentel@itdurango.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(49, 'ANA PAOLA', 'ORTIZ BRAMBILA', 'OIBA870321MSLRRN07', 8110784143, 'vin_mazatlan@tecnm.mx', 'vin_mazatlan@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(50, 'Aldo Alejandro', 'Lujan Espinoza', 'LUEA790910HDGJSL00', 6181800292, 'vin_salto@tecnm.mx', 'vin_salto@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(51, 'ALEJANDRA', 'ROSAS AMPARÁN', 'ROAA730424MCHSML06', 6141926067, 'servicio_social@chihuahua2.tecnm.mx', 'servicio_social@chihuahua2.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(52, 'JULIA GRACIELA', 'PRECIADO LEON', 'PELJ660102MSRRNL00', 6621314922, 'julia.preciadol@hermosillo.tecnm.mx', 'julia.preciadol@hermosillo.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(53, 'HILDA AURORA', 'ROSAS RODRÍGUEZ', 'RORH680813MDFSDL08', 5564770869, 'hilda.rr@gamadero2.tecm.mx', 'hilda.rr@gamadero2.tecm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(54, 'Cindy', 'Ricardes Gutiérrez', 'RIGC910330MTCCTN05', 9341100030, 'depto.residenciaprof@rios.tecnm.mx', 'depto.residenciaprof@rios.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(55, 'Lourdez Estephanie ', 'Campero León', 'CALL851019MBCMNR02', 6461321665, 'vin_ensenada@tecnm.mx', 'vin_ensenada@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(56, 'José Ángel', 'Ramírez Guerrero', 'RAGA951014HVZMNR04', 9221852608, 'jose.ramirez@chicontepec.tecnm.mx', 'jose.ramirez@chicontepec.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(57, 'Nephtali', 'Chavez Campechano', 'CACN931027HOCHMP03', 2871320345, 'nephtali.cc@tuxtepec.tecnm.mx', 'nephtali.cc@tuxtepec.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(58, 'Artemio ', 'Lara Chavez', 'LACA721219HBCRHR04', 6641673728, 'alara@tectijuana.edu.mx ', 'alara@tectijuana.edu.mx ', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(59, 'Armando Ivan', 'Ochoa  baca', 'OOBA851115HCHCCR00', 6141651235, 'd-vinculacion@itsncg.edu.mx', 'd-vinculacion@itsncg.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(60, 'Andrea ', 'Vega  Hernández ', 'VEHA820225MTLGRN06', 2462975644, 'dda_dtlaxco@tecnm.mx', 'dda_dtlaxco@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(61, 'Martha Silvia', 'Alfaro López', 'AALM681227MBCLPR01', 6861616058, 'GESTION@ITMEXICALI.EDU.MX', 'GESTION@ITMEXICALI.EDU.MX', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(62, 'RICARDO', 'REYES  SALVADOR', 'RESR820627HMCYLC00', 5515992848, 'plan_iztapalapa2@tecnm.mx', 'plan_iztapalapa2@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(63, 'BEATRIZ', 'MIRANDA JIMÉNEZ', 'MIJB780213MVZRMT04', 2351091383, 'bmirandaj@itsm.edu.mx', 'bmirandaj@itsm.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(64, 'José Alejandro', 'Castro Téllez ', 'CATA930525HGTSLL09', 4731405690, 'jefaturadevinculacion@guanajuato.tecnm.mx', 'jefaturadevinculacion@guanajuato.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(65, 'Florencio', 'Santos Ascencio', 'SAAF710628HMNNSL02', 3511200516, 'florencio.sa@purhepecha.tecnm.mx', 'florencio.sa@purhepecha.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Director (a) de Planeación y Vinculación', NULL),
(66, 'CARLOS', 'GUAJARDO SANDOVAL', 'GUSC770406HCLJNR07', 8777703267, 'dir_vinculacion@cdacuna.tecnm.mx', 'dir_vinculacion@cdacuna.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Director (a) de Planeación y Vinculación', NULL),
(67, 'Fernando ', 'Morales  Cortes', 'MOCF840618HOCRRR01', 9541579019, 'plan_pinotepa@tecnm.mx', 'plan_pinotepa@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(68, 'Luis Angel ', 'Mares  Rosas', 'MARL840514HOCRSS00', 2871102573, 'plan_iztapalapa@tecnm.mx', 'plan_iztapalapa@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(69, 'María del Rocío ', 'Nava  Moreno', 'NAMR600114MDFVRC08', 5610813709, 'servicio.practicas@huixquilucan.tecnm.mx', 'servicio.practicas@huixquilucan.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(70, 'JESUS ANTONIO ', 'GUEVARA SANCHEZ', 'GUSJ880713HDFVNS00', 5513403567, 'subdirvinculacionyextension@tesch.edu.mx', 'subdirvinculacionyextension@tesch.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(71, 'Gustavo Adolfo ', 'Estrada  López ', 'EALG650127HMCSPS01', 5527100349, 'direccion.vinculacion@tesjo.edu.mx      vin_djocotitlan@tecnm.mx', 'direccion.vinculacion@tesjo.edu.mx      vin_djocotitlan@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Director (a) de Planeación y Vinculación', NULL),
(72, 'LETICIA ', 'HERNANDEZ ROJERO', 'HERL680418MZSRJT01', 4931030590, 'gestionyvinculacion@fresnillo.tecnm.mx', 'gestionyvinculacion@fresnillo.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(73, 'José Guadalupe', 'Basto Chan', 'BACG851212HYNSHD00', 9997386485, 'vin_conkal@tecnm.mx', 'vin_conkal@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(74, 'ALVARO', 'LAZARO HERNANDEZ', 'LAHA770219HTCZRL05', 9932295597, 'vin_chontalpa@tecnm.mx', 'vin_chontalpa@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(75, 'FRANCISCO', 'ALVARADO RUEDA', 'AARF800803HTCLDR01', 9171092141, 'vin_huimanguillo@tecnm.mx', 'vin_huimanguillo@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(76, 'Fernando Antonio', 'Celaya Ojeda ', 'CEOF880925HGTLJR08', 4626293158, 'fernando.co@purisima.tecnm.mx', 'fernando.co@purisima.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(77, 'ME. ROCIO ', 'ALFONSÍN FERAT', 'AOFR690221MVZLRC04', 2881064351, 'd.vinculacion@cosamaloapan.tecnm.mx', 'd.vinculacion@cosamaloapan.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(78, 'Tonatiuh', 'Baltazar Baez', 'BABT830311HMNLZN15', 3313969369, 'tonatiuh.bb@jiquilpan.tecnm.mx', 'tonatiuh.bb@jiquilpan.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(79, 'Moisés', 'Garcés Martínez', 'GAMM731008HJCRRS09', 3111922893, 'gtvinculacion@ittepic.edu.mx', 'gtvinculacion@ittepic.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(80, 'ELIZABETH ', 'MEDEL  MENDOZA', 'MEME880906MPLDNL01', 2226792300, 'extension.itstr@gmail.com', 'extension.itstr@gmail.com', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(81, 'GLADYS NALLELI', 'BECERRA  SALAZAR', 'BESG860331MJCCLL00', 3929224680, 'vin_ocotlan@tecnm.mx', 'vin_ocotlan@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(82, 'Karina Fabiola', 'Jiménez Olvera', 'JIOK751004MDFMLR06', 5544905607, 'subvinculacion@cuautitlan.tecnm.mx', 'subvinculacion@cuautitlan.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(83, 'LOLY VICTORIA', 'TENORIO RODRÍGUEZ', 'TERL810530MYNNDL00', 9831209665, 'vin_chetumal@tecnm.mx', 'vin_chetumal@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(84, 'Jhacer Kharen', 'Ruiz  Garduño', 'RUGJ821018MMNZRH05', 7223967206, 'jhacer.rg@zitacuaro.tecnm.mx', 'jhacer.rg@zitacuaro.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(85, 'CITLALLI IRAIS', 'MARTINEZ SOBERANEZ', 'MASC850205MTCRBT04', 9931608948, 'vin_villahermosa@tecnm.mx', 'vin_villahermosa@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(86, 'Santiago Javier', 'Ayuso Aguilar', 'AUAS720506HCCYGN05', 9818290573, 'vin_lerma@tecnm.mx', 'vin_lerma@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(87, 'Paulina Amaranta ', 'Bórquez  Domínguez ', 'Bodp900222d72', 7445886952, 'Vin_acapulco@tecnm.mx', 'Vin_acapulco@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(88, 'Areli Soledad', 'Ruiz Martinez', 'RUMA831211MMSZRR03', 7351260664, 'vin_cuautla.tecnm.mx', 'vin_cuautla.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(89, 'Maricela ', 'Gallegos  Cuevas', 'GACM680201MGRLVR08', 7451032304, 'vin_smarcos@tecnm.mx', 'vin_smarcos@tecnm.mx', '$2y$10$5K.OHNUaETPXghybI4A2ZuPek7evTrPXDWjhDNsVYfIBFXnXYtA3q', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(90, 'Plácido', 'Hernández Márquez', 'HEMP871005HSPRRL04', 4831081139, 'jdrp@tamazunchale.tecnm.mx', 'jdrp@tamazunchale.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(91, 'Arturo ', 'Martínez  de Hoyos', 'MAHA870112HCLRYR00', 8661166769, 'arturo.martinez@monclova.tecnm.mx', 'arturo.martinez@monclova.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(92, 'Julián José', 'López Olivas', 'LOOJ820516HDGPLL05', 6181571191, 'julian.lo@regionllanos.tecnm.mx', 'julian.lo@regionllanos.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(93, 'Rodrigo ', 'Garcia Hernández', 'GAHR711125HOCRRD07', 6381097847, 'rodrigo.gh@puertopenasco.tecnm.m,x', 'rodrigo.gh@puertopenasco.tecnm.m,x', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) Académico (a)', NULL),
(94, 'Jesús Rafael', 'Sesatty Sáenz', 'SESJ840528HCLSNS00', 8611047437, 'jesus.sesatty@tecmuzquiz.edu.mx', 'jesus.sesatty@tecmuzquiz.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(95, 'Mirna Montserrat', 'Alpuche Gomez', 'AUGM961225MCCLMR13', 9961026430, 'mirna.ag@hopelchen.tecnm.mx', 'mirna.ag@hopelchen.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(96, 'PEDRO', 'MURO ZUÑIGA', 'MUZP720128HZSRXD07', 4981009328, 'pedro.mz@zacatecasnte.tecnm.mx', 'pedro.mz@zacatecasnte.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Director (a) de Planeación y Vinculación', NULL),
(97, 'Adelfina', 'Alquicira Avilés', 'AUAA631209MMNLVD05', 4432133067, 'adelfina.aa@vmorelia.tecnm.mx', 'adelfina.aa@vmorelia.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(98, 'MARIA SUGEL', 'LOPEZ AGUADO', 'LOAS780124MMNPGG03', 4591229733, 'vin_dtacambaro@tecnm.mx', 'vin_dtacambaro@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(99, 'Fernando Eligio', 'Compeán  Estrada', 'COEF620528HDGMSR00', 6181586730, 'fernando.ce@vguadiana.tecnm,mx', 'fernando.ce@vguadiana.tecnm,mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) de Oficina de Servicios Externos', NULL),
(100, 'Jenny Jesús', 'Márquez Díaz', 'MADJ780224MVZRZN02', 2971040572, 'dep_@alvarado.tecnm.mx', 'dep_@alvarado.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) Académico (a)', NULL),
(101, 'MAYRELY', 'NAVA GUZMAN ', 'NAGM761007HM0', 7711984515, 'vin_huejutla@tecnm.mx', 'vin_huejutla@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(102, 'ADRIANA', 'LARA  LOPEZ', 'LALA860413MOCRPD09', 9711407214, 'ss@salinacruz.tecnm.mx', 'ss@salinacruz.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(103, 'José René', 'Pérez Chávez', 'PECR750117HCHRHN06', 6291104056, 'jrperez@cdjimenez.tecnm.mx', 'jrperez@cdjimenez.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(104, 'VICTOR MANUEL ', 'VALENZUELA ALCARAZ', 'VAAV720224HSRLLC00', 6333348328, 'vin_aguaprieta@tecnm.mx', 'vin_aguaprieta@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(105, 'Froilan Guadalupe ', 'Gomez  Canul', 'GOCF821204HYNMNR07', 9991777370, 'jefevinculacion@progreso.tecnm.mx', 'jefevinculacion@progreso.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(106, 'LIZETH', 'ALVAREZ VILLEGAS', 'AAVL801204MSLLLZ09', 6871255770, 'dep_via@guasave.tecnm.mx', 'dep_via@guasave.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(107, 'JOSÉ ANTONIO', 'LANDA  SÁNCHEZ', 'LASA770324HVZNNN08', 2288377926, 'vinculacion_djcarranza@itsjc.edu.mx', 'vinculacion_djcarranza@itsjc.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(108, 'Elvia Rosa ', 'Ozuna  Cárdenas ', 'OUCE880204MNLZRL09', 8211218954, 'eozuna@itlinares.edu.mx', 'eozuna@itlinares.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Docente', NULL),
(109, 'Wendy', 'Mondragón  Moreno', 'MOMW780306MGTNRN09', 4612002850, 'subdireccion.ac@roque.tecnm.mx', 'subdireccion.ac@roque.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) Académico (a)', NULL),
(110, 'BIANCA YUDIRIA', 'MURILLO MURILLO', 'MUAV870602MBSRVN01', 6151041958, 'bianca.ma@mulege.tecnm.mx', 'bianca.ma@mulege.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Docente', NULL),
(111, 'Elizabeth', 'Gutiérrez Anaya', 'GUAE681023UB8', 6561766972, 'jefatura_da@cdjuarez.tecnm.mx', 'jefatura_da@cdjuarez.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(112, 'Francisco Gerardo ', 'Villarreal  Luna', 'VILF890531HZSLNR01', 4631039153, 'gestion.vinculacion@itsn.edu.mx', 'gestion.vinculacion@itsn.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(113, 'ALEJANDRO ', 'FRIAS  CASTRO', 'FICA830309HJCRSL07', 3321816512, 'vin_tlajomulco@tecnm.mx', 'vin_tlajomulco@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(114, 'Karla Ivón ', 'Moctezuma  Herrera ', 'MOHK900620MVZCRR03', 2961040323, 'karla.mh@ugalvan.tecnm.mx', 'karla.mh@ugalvan.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(115, 'GILBERTO', 'CANCHE COUOH', 'CACG770203HQRNHL05', 9831060149, 'g.canche@itscarrillopuerto.edu.mx', 'g.canche@itscarrillopuerto.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(116, 'JOSÉ', 'LUNA HERRERA', 'LUHJ580723HDFNRS09', 5564165851, 'jose.lh@iztapalapa3.tecnm.mx', 'jose.lh@iztapalapa3.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Docente', NULL),
(117, 'Jesús Eduardo ', 'Villegas  Martínez ', 'VIMJ710725HMNLRS06', 3521116222, 'vin_piedad@tecnm.mx ', 'vin_piedad@tecnm.mx ', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(118, 'ALMA LETICIA', 'RAMOS  RÍOS', 'RARA610428MDGMSL03', 8714144741, 'acad_laguna@tecnm.mx', 'acad_laguna@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) Académico (a)', NULL),
(119, 'Sonia Guadalupe', 'Aguilar  Martínez', 'AUMS761205MHGGRN09', 7712211493, 'subdir_vinculacion@itesa.edu.mx', 'subdir_vinculacion@itesa.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(120, 'Sergio ', 'Vivas  Hernández', 'VIHS861008HGRVRR05', 7671026640, 'plan_cdaltamirano@tecnm.mx', 'plan_cdaltamirano@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(121, 'Mayra Isabel ', 'MENDOZA LAGUNES', 'MELM790107MVZNGY01', 9862256057, 'vin_tizimin@tecnm.mx', 'vin_tizimin@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(122, 'Jesús Alberto ', 'Cilias Hernandez', 'Cihj710121hvzlrs00', 2721220919, 'Jesus.ch@orizaba.tecnm.mx', 'Jesus.ch@orizaba.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(123, 'JAIME', 'RODRIGUEZ CSTAÑEDA', 'ROCJ621108HDGDSM09', 8711413232, 'subdireccionacademica@itslerdo.edu.mx', 'subdireccionacademica@itslerdo.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) Académico (a)', NULL),
(124, 'GUSTAVO ', 'GARCÍA  BARBOSA', 'GABG821011HPLRRS04', 2361234554, 'vin_itssna@ajalpan.tecnm.mx', 'vin_itssna@ajalpan.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(125, 'SANDRA LUZ', 'ESPINOZA PORTILLO', 'EIPS700605MPLSRN02', 8711769949, 'sandra.ep@torreon.tecnm.mx', 'sandra.ep@torreon.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(126, 'Jesús Guillermo', 'Rivera Zumaya', 'RIZJ770727HVZVMS09', 7891075241, 'guillermo.rivera@itsta.edu.mx', 'guillermo.rivera@itsta.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Director (a) de Planeación y Vinculación', NULL),
(127, 'Francisco', 'León  Santiago', 'LESF760720HDFNNR04', 4434407644, 'biblioteca@puruandiro.tecnm.mx', 'biblioteca@puruandiro.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(128, 'AÍDA ', 'HERNÁNDEZ ÁVILA', 'HEAA601108MCLRVD04', 8787912767, 'plan_piedrasnegras@tecnm.mx', 'plan_piedrasnegras@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(129, 'Enrique Orlando ', 'Rodríguez  Sandoval ', 'ROSE790118HDGDNN00', 6741173041, 'enrique.rs@spapasquiaro.tec.mn', 'enrique.rs@spapasquiaro.tec.mn', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(130, 'JUAN ', 'DE LA CRUZ  MAY', 'CUMJ800620HTCRYN05', 9932029767, 'juan.cm@zolmeca.tecnm.mx', 'juan.cm@zolmeca.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(131, 'MARIA VALERIA', 'MONTIEL MARQUEZ', 'MOMV560703MTLNRL11', 2411198075, 'gestion@apizaco.tecnm.mx', 'gestion@apizaco.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(132, 'Adelina', 'Xocua González', 'XOGA850829MVZCND04', 2781044509, 'dept_serviciosocial@zongolica.tecnm.mx', 'dept_serviciosocial@zongolica.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(133, 'MARTHA ADELFA', 'AVALOS  PUGA', 'AAPM630829MTSVGR04', 8341119271, 'vin_cdvictoria.tecnm.mx', 'vin_cdvictoria.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(134, 'Nancy', 'Vázquez  Barrera', 'VABN780421MHGZRN06', 7721339963, 'vin_atitalaquia@tecnm.mx', 'vin_atitalaquia@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(135, 'Juan José', 'Robles Conde', 'ROCJ771124HSPBNN05', 4881455163, 'juan.rc@matehuala.tecnm.mx', 'juan.rc@matehuala.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(136, 'Alejandra Paola ', 'Borquez Lopez  ', 'BOLA820629MSRRPL02', 6441970376, 'plan_vyaqui@tecnm.mx', 'plan_vyaqui@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(137, 'YARENTZI  ', 'GÓMEZ  CAMPOS', 'GOCY851030MPLMMR05', 5568609767, 'vinculacion@puebla.tecnm.mx', 'vinculacion@puebla.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(138, 'Belinda Virginia ', 'Lamadrid  Bours', 'LABB750531MSRMRL02', 6441263050, 'blamadrid@itesca.edu.mx', 'blamadrid@itesca.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) de Proyectos de Investigación', NULL),
(139, 'Gabriela', 'Rodríguez  Segura', 'ROSG830320MTSDGB01 ', 8671000850, 'gabriela.rs@nlaredo.tecnm.mx', 'gabriela.rs@nlaredo.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Docente', NULL),
(140, 'JAZMIN', 'JAUREGUI AREVALO', 'JAAJ280686MTCRRZ07', 9331013442, 'servicio_residencia@comalcalco.tecnm.mx', 'servicio_residencia@comalcalco.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(141, 'Daniel ', 'Carbajal Diaz', 'CADD8712148HOCRZN02', 9531103297, 'daniel_cd@itlaxiaco.tecnm.mx', 'daniel_cd@itlaxiaco.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(142, 'María Teresa ', 'Tejeda  Jiménez', 'TEJT701206MDFJMR08', 4811135632, 'lenguas.extranjeras@tecvalles.mx', 'lenguas.extranjeras@tecvalles.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) de Oficina de Servicios Externos', NULL),
(143, 'Angel', 'Hernández Bretón', 'HEBA630804HVZRRN06', 2722100836, 'vin_crodeorizaba@tecnm.mx', 'vin_crodeorizaba@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(144, 'Gabriela', 'Aguilar Ortiz', 'AUOG760403MOCGRB08', 9515691022, 'plan_oaxaca@tecnm.mx', 'plan_oaxaca@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(145, 'Juana ', 'Alonso Osorio', 'AOOJ801229MPLSSN09', 2441097288, 'juana.alonso@itsatlixco.edu.mx', 'juana.alonso@itsatlixco.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(146, 'MARÍA ANGÉLICA ', 'CRUZ CAMARGO', 'CUCA700207MDFRMN08', 7731325737, 'macruz@iteshu.edu.mx', 'macruz@iteshu.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(147, 'JOSE AGUSTIN', 'CARRIZALES OLIVARES', 'CAOA680304HVZRLG09', 8332454149, 'asgustin.carrizales@itspanuco.edu.mx', 'asgustin.carrizales@itspanuco.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(148, 'Mónica', 'Ortiz  Medrano', 'OIMM730319MQTRDN05', 4421575356, 'dgtyv_serviciosocial@queretaro.tecnm.mx', 'dgtyv_serviciosocial@queretaro.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(149, 'Victor Manuel ', 'R de León  García ', 'Rxgv780926hqrxrc06', 9831834201, 'Vin_zmaya@tecnm.mx', 'Vin_zmaya@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(150, 'JOSE DE LOS SANTOS', 'EVIA CHOZA', 'EICS640830HCCVHN02', 9811161227, 'jevia@itescam.edu.mx', 'jevia@itescam.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(151, 'Alejandro Martínez Santiago', 'Martínez Santiago', 'MASA901016HHGRNL02', 5527510831, 'alejandro.ms@jilotepec.tecnm.mx', 'alejandro.ms@jilotepec.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Docente', NULL),
(152, 'Rocío ', 'Contreras  Mendoza', 'COMR940406MGTNNC00', 4621265902, 'rocio.cm@abasolo.tecnm.mx', 'rocio.cm@abasolo.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(153, 'Adriana Alejandra', 'Martinez Banda', 'MABA901128MNTRND09', 3111471247, 'vin_surnayarit@tecnm.mx', 'vin_surnayarit@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(154, 'Luis Ricardo', 'Beltran Peñaloza', 'BEPL850530HMNLXS05', 4531596127, 'residenciasyservicio@apatzingan.tecnm.mx', 'residenciasyservicio@apatzingan.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(155, 'Jesús Erick', 'Antonio Sosa', 'AOSJ910602HMCNSS03', 9511748574, 'vin_voaxaca@tecnm.mx', 'vin_voaxaca@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(156, 'LUCINA ', 'GUILLEN GONZALEZ', 'GUGL700619MCSLML02', 9631528902, 'acad_comitan@tecnm.mx', 'acad_comitan@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) Académico (a)', NULL),
(157, 'BRAULIO GABRIEL', 'CONTRERAS GALVAN', 'COGB800422HDFNLR04', 3121078861, 'vin_colima@tecnm.mx', 'vin_colima@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(158, 'Jorge ', 'García Nájera', 'GANJ801006HDFRJR04', 5518462720, 'subvinculacion@teschi.edu.mx', 'subvinculacion@teschi.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(159, 'LUCIA GUADALUPE', 'BARRADAS HERNANDEZ', 'HEBL870130MVZRRC07', 2284965416, 'jrc_auxve@itsjuanrodriguezclara.edu.mx', 'jrc_auxve@itsjuanrodriguezclara.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(160, 'GLORIA ESTHELA', 'MARTINEZ MONTEMAYOR', 'MAMG840501MCLRNL03', 8441222811, 'gloria.mm@saltillo.tecnm.mx', 'gloria.mm@saltillo.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(161, 'LIZETH', 'ROSILES VILLALOBOS', 'ROVL760102MVZSLZ06', 9211377186, 'lrosilesv@itesco.edu.mx', 'lrosilesv@itesco.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(162, 'LUIS ALBERTO', 'GARCIA REYES', 'GARL851121HTSRYS03', 8333001293, 'luis.gr@cdmadero.tecnm.mx', 'luis.gr@cdmadero.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Docente', NULL),
(163, 'Rosario de Jesús', 'Aguilar  Domínguez', 'AUDR851119MCSGMS05', 9631739634, 'Rosario.ad@fcomalapa.tecnm.mx', 'Rosario.ad@fcomalapa.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(164, 'Alberto', 'Díaz Juárez', 'DIJA791130HTLZRL01', 2461556552, 'alberto.dj@aguascalientes.tecnm.mx', 'alberto.dj@aguascalientes.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(165, 'Ivett', 'Vásquez Lagunas', 'VALI740107MOCSGV06', 5519101089, 'ivett.vl@tlalnepantla.tecnm.mx', 'ivett.vl@tlalnepantla.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(166, 'Javier', 'Aguilar Contreras', 'AUCJ630920HCHGNV04', 6251190748, 'vin_cdciauhtemoc@tecnm.mx', 'vin_cdciauhtemoc@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(167, 'RUBEN ', 'GAYTÁN DÍAZ', 'GADR710505HCHYZB09', 6144573889, 'vin_crodechihuahua@tecnm.mx', 'vin_crodechihuahua@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(168, 'Violeta ', 'López Juárez', 'LOJV790327MOCPRL04', 9511211685, 'vin_vetla@tecnm.mx', 'vin_vetla@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(169, 'Zulma Saraih ', 'Vargas  Melendez', 'VAMZ900917MSRRLL00', 6471178976, 'vin_huatabampo@tecnm.mx', 'vin_huatabampo@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(170, 'Lorena', 'Garcia Rodríguez', 'GARL741111MGRRDR05', 2223472749, 'vin_chilpancingo@tecnm.mx', 'vin_chilpancingo@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(171, 'Leonardo Gibrán', 'González Peredo', 'GOPL950509HTSNRN03', 8341794678, 'lggonzalez@itsmante.edu.mx', 'lggonzalez@itsmante.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(172, 'JUSTINO', 'POOT CEN', 'POCJ670801HYNTNS00', 9851155425, 'justino.pc@valladolid.tecnm.mx', 'justino.pc@valladolid.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(173, 'Cinthya', 'Becerril  González ', 'BEGC850118MDFCNN00', 5534670369, 'vin_milpaalta@tecnm.mx', 'vin_milpaalta@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(174, 'CAROLINA', 'CUETO DOMINGUEZ', 'CUDC851215MCSTMR07', 9615936156, 'vin_tgutierrez@tecnm.mx', 'vin_tgutierrez@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(175, 'Claudia Guadalupe ', 'Ramírez Galindo ', 'RAGC801118MGTMLL08', 4121719417, 'sub_vinculacion@itsur.edu.mx', 'sub_vinculacion@itsur.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(176, 'Daraly', 'Vázquez  Verduzco ', 'VAVD910701MJCZRR05', 3411022198, 'daraly.vv@cdguzman.tecnm.mx', 'daraly.vv@cdguzman.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Docente', NULL),
(177, 'JAVIER ', 'LARA  DE PAZ', 'LAPJ751007HDFRZV06', 5527501836, 'vin_gamadero@tecnm.mx', 'vin_gamadero@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(178, 'Cynthia Guadalupe', 'Canabal Herrera', 'CAHC900424MTCYNRY06', 9935010142, 'dir.planvinculacion@laventa.tecnm.mx', 'dir.planvinculacion@laventa.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Director (a) de Planeación y Vinculación', NULL),
(179, 'Elvira Elizabeth  ', 'Cortes Aguirre', 'COAE700125MPLRLG38', 2231140328, 'direccion.academica@tepeaca.tecnm.mx', 'direccion.academica@tepeaca.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(180, 'RAÚL', 'FLORES TOBÓN', 'FOTR800902HDFLBL07', 5582139893, 'rflores@tese.edu.mx', 'rflores@tese.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(181, 'Irany', 'Fuentes  García ', 'FUGI830919MSPNRR00', 4441332845, 'irany.fg@slp.tecnm.mx', 'irany.fg@slp.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(182, 'Griselda', 'Puente Guzman', 'PUGG620226MVZNZR04', 2299151350, 'griseldapuente@bdelrio.tecnm.mx', 'griseldapuente@bdelrio.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(183, 'Angie Johanna ', 'Zamora  Lopez', 'ZALA800202MDFMP04', 4492098402, 'vin_parteaga@tecnm.mx', 'vin_parteaga@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(184, 'LILIANA', 'LÓPEZ ESCOBAR', 'LOEL960309MPLPSL07', 2381472953, 'oficina_serviciosocial@ittehuacan.edu.mx', 'oficina_serviciosocial@ittehuacan.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(185, 'Bertha Isela ', 'Gómez Palomares', 'GOPB870223MMNMLR08', 4431094816, 'vinculacion@morelia.tecnm.mx', 'vinculacion@morelia.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(186, 'EDNA NATHALIE ', 'MAÑON  RIOS ', 'MARE840529MSLXSD06', 6871077710, 'PLAN_SLEYVA@TECNM.MX', 'PLAN_SLEYVA@TECNM.MX', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(187, 'DIEGO ERNESTO', 'VALENZUELA  ARMENTA', 'VAAD790225HSLLRG07', 6871051991, 'diego.va@sleyva.tecnm.mx', 'diego.va@sleyva.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Docente', NULL),
(188, 'EDGAR OCXIEL', 'OCHOA HERRERA', 'OOHE760630HTSCRD00', 8998724625, 'acad_reynosa@tecnm.mx', 'acad_reynosa@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) Académico (a)', NULL),
(189, 'Irela ', 'Chavez Arvizu', 'CAAI700923MNEHRR08', 9568278397, 'irela.ca@reynosa. tecnm.mx', 'irela.ca@reynosa. tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) de Oficina de Servicios Externos', NULL),
(190, 'Miguel Ángel ', 'Silva Mondragón', 'SIMM750221HGRLNG05', 7551438216, 'plan_costagrande@tecnm.mx', 'plan_costagrande@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(191, 'Ameyatzin Rosalía', 'Peña  Villegas', 'PEVA830127MDFXLM00', 5511448948, 'vin_costagrande@tecnm.mx', 'vin_costagrande@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(192, 'Nadia Luz ', 'Tapia Llanos', 'TALN910517MPLPLD05', 2228951115, 'nadia.tl@tecomatlan.tecnm.mx', 'nadia.tl@tecomatlan.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Docente', NULL),
(193, 'Atzinia Teresa', 'Balbuena  Bravo', 'BABA901003MPLLRT00', 2751113737, 'vin_tecomatlan@tecnm.mx', 'vin_tecomatlan@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(194, 'ANA PAOLA', 'MENDOZA RIOS', 'MERA970906MBSNSN01', 6131244152, 'vin04@cdconstitucion.tecnm.mx', 'vin04@cdconstitucion.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(195, 'Mayra Araceli', 'Chavira Niño', 'CANM810404MBSHXY08', 6131057476, 'mayra.cn@cdconstitucion.tecnm.mx', 'mayra.cn@cdconstitucion.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Docente', NULL),
(196, 'Juan José ', 'Maldonado  García', 'MAGJ771013HMNLRN01', 7861190864, 'jmaldonado@cdhidalgo.tecnm.mx', 'jmaldonado@cdhidalgo.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(197, 'Lyzbeth Esther ', 'Boyzo Sánchez', 'BOSL831003MMNYNY08', 7861417983, 'esanchez@cdhidalgo.tecnm.mx', 'esanchez@cdhidalgo.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(198, 'Alejandro ', 'Rodriguez  Madrigal', 'ROMA740328HMNDDL06', 4351037128, 'alejandro.rm@huetamo.tecnm.mx', 'alejandro.rm@huetamo.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Docente', NULL),
(199, 'Rey David', 'Aguirre  Ferreyra ', 'AUFR840106HMNGRY09', 7671151904, 'sub.planeacion@huetamo.tecnm.mx', 'sub.planeacion@huetamo.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL);
INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `curp`, `telefono`, `correo`, `correo_inst`, `contrasena`, `rol_id`, `puesto`, `fecha_nacimiento`) VALUES
(200, 'LILIANA', 'TRUJILLO NAVARRO', 'TUNL811008MPLRVL06', 9532318425, 'vin_dtlatlauquitec@tecnm.mx', 'vin_dtlatlauquitec@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(201, 'Ana Paulina', 'Cárcamo Martínez', 'CAMA870113MPLRRN06', 2331238677, 'plan_dtlatlauquitepec@tecnm.mx', 'plan_dtlatlauquitepec@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(202, 'Diana Lizeth', 'González  Martínez', 'GOMD020624MPLNRNA2', 7461308484, 'dianaliz.martinez@itsvc.edu.mx', 'dianaliz.martinez@itsvc.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(203, 'Norma Lizbeth ', 'Rojas  Vázquez', 'ROVN940511MPLJZR05', 7461123099, 'vinculacion@itsvc.edu.mx', 'vinculacion@itsvc.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(204, 'Auricely ', 'Gaspar  Marcial', 'GAMA940821MVZSRR08', 9241955687, 'dep.vinculacion.itsa@gmail.com', 'dep.vinculacion.itsa@gmail.com', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(205, 'MARTHA MARIA ', 'CARRILLO  RAMIREZ', 'CARM890606MVZRMR09', 9241428695, 'martha.cr@acayucan.tecnm.mx', 'martha.cr@acayucan.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) Académico (a)', NULL),
(206, 'María José ', 'Ramírez Dominguez ', 'RADJ980723MVZMMS08', 8331059816, 'maria.ramirez@itsna.edu.mx', 'maria.ramirez@itsna.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(207, 'NORMAN', 'HERNANDEZ CARDENAS', 'HCN800508HVZRRR08', 7851087665, 'norman.hernandez@itsna.edu.mx', 'norman.hernandez@itsna.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(208, 'Jesús Alberto', 'Hernández  Pacheco', 'HEPJ721225HVZRCS01', 2941035918, 'evaluacionpresupuestal@itssat.edu.mx', 'evaluacionpresupuestal@itssat.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(209, 'David de Guadalupe ', 'Guzmán Absalón', 'GUAD700314HVZZBV07', 2941012871, 'degetyv@itssat.edu.mx', 'degetyv@itssat.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(210, 'Leticia', 'Plata Martínez', 'PAML781220MDFLRT05', 7121893916, 'dep_vinculacion@tessanfe.edu.mx', 'dep_vinculacion@tessanfe.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(211, 'Gabriel ', 'Salazar Colin', 'SACG720307HMCLLB02', 7121326459, 'dep_ssyrp@tessanfe.edu.mx', 'dep_ssyrp@tessanfe.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(212, 'Ignacio ', 'Nava Díaz', 'NADI770505HTCVZG09 ', 5643197712, 'plan_tlahuac3@tecnm.mx', 'plan_tlahuac3@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(213, 'ROSARELY ', 'LOPEZ  ATILANO', 'LOAR810820MVZPTS01 ', 7822246603, 'rosarely.lopez@pozarica.tecnm.mx', 'rosarely.lopez@pozarica.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(214, 'LILIANA IVETTE', 'ARCOS PERDOMO', 'AOPL790125MPLRRL04', 2311193365, 'liliana.ar@teziutlan.tecnm.mx', 'liliana.ar@teziutlan.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(215, 'Fidel', 'Aguillon Hernández ', 'AUHF520502HTSGRD06', 8333156820, 'plan_altamira@tecnm.mx', 'plan_altamira@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(216, 'María del Carmen', 'Romero Morales', 'ROMC890814MMCMRR08', 7223769177, 'dda_dvillaguerrero@tecnm.mx', 'dda_dvillaguerrero@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(217, 'MARIO', 'CONTRERAS BARRERA', 'COBM740520HDFNRR00', 2288366477, 'dirplaneacion@martineztorre.tecnm.mx', 'dirplaneacion@martineztorre.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Director (a) de Planeación y Vinculación', NULL),
(218, 'Beatriz', 'Castelán  Aparicio ', 'CAAB740214MPLSPT08', 2441028063, 'beatriz.castelan@itsatlixco.edu.mx', 'beatriz.castelan@itsatlixco.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) Académico (a)', NULL),
(219, 'Ros Inés de Lourdes ', 'Guzmán  Nápoles ', 'GUNR720211MDFZPS04', 5583638044, 'plan_milpaalta2@tecnm.mx', 'plan_milpaalta2@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(220, 'RAMON EFREN', 'TRILLAS ARBALLO', 'TIAR820429HSRRRM06', 6221069173, 'dda_guaymas@tecnm.mx', 'dda_guaymas@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(221, 'JOSE DANIEL', 'REYES MOREIRA', 'REMD830612A18', 4491438015, 'vin_llano@tecnm.mx', 'vin_llano@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(222, 'LAURA GABRIELA', 'QUINTERO CABRERA', 'QUCL770402MGTNBR08', 9221128950, 'gestiontecnologica@minatitlan.tecnm.mx', 'gestiontecnologica@minatitlan.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(223, 'AGUSTIN', 'VERDUZCO NAVARRO', 'VENA860807HMNRVG03', 3325060478, 'agustin.vn@zamora.tecnm.mx', 'agustin.vn@zamora.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(224, 'JOSE LUIS ', 'SANDOVAL ALVARADO', 'SAAL711020HMNNLS06', 3511726605, 'joseluis.sa@losreyes.tecnm.mx', 'joseluis.sa@losreyes.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(225, 'David ', 'Lobato Elvira', 'LOED831119HVZBLV02', 2741375483, 'promocion.profesional@itstb.edu.mx', 'promocion.profesional@itstb.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(226, 'Sylvia Mariel', 'Hernández Ramos', 'hers900712mvzrmy03', 2285310940, 'subdireccionvinculacion@itsperote.edu.mx', 'subdireccionvinculacion@itsperote.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(227, 'MARÍA ISABEL ', 'SALGUERO SANTANA', 'SASI851126MMCLNS04', 7224568522, 'servicio.social@vbravo.tecnm.mx', 'servicio.social@vbravo.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(228, 'Victor Alejandro', 'Luna  Diaz', 'LUDV650526HPLNZC00', 2431017696, 'subdirecciondevinculacion@cdserdan.tecnm.mx', 'subdirecciondevinculacion@cdserdan.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(229, 'Francisco ', '  Casas', 'CAXF770704HZSSXR06', 4331137032, 'francisco.c@zacatecasocc.tecnm.mx', 'francisco.c@zacatecasocc.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(230, 'Jonathan', 'Sánchez Muñoz', 'SAMJ001015HMCNXNA2', 5649409193, 'jonathan.sanchez@teschic.edu.mx', 'jonathan.sanchez@teschic.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(231, 'Diana Denise ', 'Calderón Zúñiga', 'CAZD811223MVZLXN01', 9211255478, 'jrc_vye@itsjuanrodriguezclara.edu.mx', 'jrc_vye@itsjuanrodriguezclara.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(232, 'NANCY BERENICE', 'ESPINOSA  UC', 'EIUN880715MCCSCN09', 9961078723, 'nancy.eu@hopelchen.tecnm.mx', 'nancy.eu@hopelchen.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(233, 'Ulises', 'Gutierrez Preciado', 'GUPU690727HSRTRL01', 6453405326, 'ulises.gutierrez@cananea.tecnm.mx', 'ulises.gutierrez@cananea.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(234, 'JESUS ALFREDO ', 'TECALERO MOTA', 'TEMJ851003HDGCTS09', 6491043807, 'vin_dsmariaoro@tecnm.mx', 'vin_dsmariaoro@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(235, 'Anallely', 'Briano LOPEZ', 'BILA950604MZSRPN02', 4922931405, 'sdirvinculacion@itsloreto.edu.mx', 'sdirvinculacion@itsloreto.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(236, 'Carlos ', 'Quiroz  Sanchez ', 'Qusc920709hmnrnr09', 4531098139, 'Carlos_q@itscoalcoman.edu.mx', 'Carlos_q@itscoalcoman.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(237, 'José Armando ', 'González  Abarca ', 'GOAA900613HMNNBR07', 4433305362, 'acad_dpatzcuaro@tecnm.mx', 'acad_dpatzcuaro@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) Académico (a)', NULL),
(238, 'Lizeth ', 'Rosiles Villalobos', 'ROVL 760102MVZSLZ06', 9211377186, 'lrosilesv@itesco.edu.mx', 'lrosilesv@itesco.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(239, 'JOSE RUBEN', 'COTA MANRIQUEZ', 'COMR730326HBSTNB01', 6242301167, 'direccionplanvinc@loscabos.tecnm.mx', 'direccionplanvinc@loscabos.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Director (a) de Planeación y Vinculación', NULL),
(240, 'Lizeth', 'Rosiles  Villalobos', 'ROVL760102MVZSLZ06', 9211377186, 'lrosilesv@itesco.edu.mx', 'lrosilesv@itesco.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(241, 'Delfino Cuauhtémoc ', 'Bravo  Armenta', 'BAAD681226HDFRRL0', 2331045867, 'dir.planeacion.vinculacion@zacapoaxtla.tecnm.mx', 'dir.planeacion.vinculacion@zacapoaxtla.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Director (a) de Planeación y Vinculación', NULL),
(242, 'Enrique Orlando ', 'Rodríguez Sandoval ', 'ROSE790118HDGDNN00', 6741173041, 'enrique.rs@spapasquiaro.tecnm.mx', 'enrique.rs@spapasquiaro.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(243, 'Edmundo Salvador ', 'Rojas  Ehuan', 'Roee820731hmcjhd09', 9811309427, 'vin_china@tecnm.mx ', 'vin_china@tecnm.mx ', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(244, 'Andrés', 'Cruz Ramírez', 'CURA820215HPLRMN03', 7971069547, 'direccion.plan.vin@zacatlan.tecnm.mx', 'direccion.plan.vin@zacatlan.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Director (a) de Planeación y Vinculación', NULL),
(245, 'Enrique Alberto ', 'Villanueva Lugo', 'VILE860221HCCLGN01', 9811075835, 'enrique.vl@champoton.tecnm.mx', 'enrique.vl@champoton.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(246, 'Martín de la Cruz', 'Castillo Valenzuela', 'CAVM620223HBCSLR05', 9821274130, 'vinculacion@itsescarcega.edu.mx', 'vinculacion@itsescarcega.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(247, 'Laura Jessica', 'Martinez Garcia', 'MAGL910822MQTRRR07', 3221028329, 'depto.vinculacion@bahia.tecnm.mx', 'depto.vinculacion@bahia.tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(248, 'Hilda ', 'Zamora  Sánchez', 'ZASH940821MVZMNL07', 9231276207, 's-vinculacion@homail.com', 's-vinculacion@homail.com', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(249, 'JOSE GABRIEL', 'MAY TEC', 'MATG801110HYNYCB04', 9911115974, 'control.interno@itsmotul.edu.mx', 'control.interno@itsmotul.edu.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(250, 'VICTOR HUGO', 'AGATON CATALAN', 'AIEF890411HCCRSR19', 9811377393, 'dir_smarcos@tecnm.mx', 'dir_smarcos@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 2, 'Director del Tecnologico de San Marcos', NULL),
(251, 'DEYSI YESICA', 'ÁLVAREZ VERGARA', 'AIEF890411HCCRSR19', 9811377393, 'dir_cdvictoria@tecnm.mx', 'dir_cdvictoria@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 2, 'Directora del Tecnologico de Ciudad Victoria', NULL),
(252, 'ATZIRI YERALDIN', 'MERLO RODRIGUEZ', 'AIEF890411HCCRSR19', 9811377393, 'dir_iztapalapa2@tecnm.mx', 'dir_iztapalapa2@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 2, 'Directora del Tecnologico de Iztapalapa II', NULL),
(253, 'MANUEL ÁNGEL', 'URIBE VAZQUEZ', 'AIEF890411HCCRSR19', 9811377393, 'dir_tepic@tecnm.mx', 'dir_tepic@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 2, 'Director del Tecnologico de Tepic', NULL),
(254, 'RAÚL RENÉ', 'ROBLES LACAYO', 'AIEF890411HCCRSR19', 9811377393, 'dir_roque@tecnm.mx', 'dir_roque@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 2, 'Director del Tecnologico de Roque', NULL),
(255, 'Ramon', 'Jimenez Lopez', NULL, 9811377393, 'direccion@tecnm.mx', 'direccion@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 1, 'Director', NULL),
(256, 'Andrea', 'Zarate Fuentes', NULL, 9811377393, 's_vinculacion@tecnm.mx', 's_vinculacion@tecnm.mx', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 1, 'Secretaria de Vinculacion', NULL),
(268, 'Antonio', 'Herrera Vazquez', NULL, 7331701927, 'alfredo@gmail.com', 'deveie@gmail.com', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 4, 'dev', '2011-11-11'),
(269, 'Antonio', 'Herrera Vazquez', NULL, 7331701927, 'alfredo@gmail.com', 'deveie@gmail.com', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 4, 'dev', '2011-11-11'),
(270, 'por una mujer', 'asdasdasd', 'SOME001120HGRLRLA2', 73317012927, 'develiezermartinez@gmail.com', '', '$2y$10$29nBx2fT07OPSRwUFNIUUeOaCkF7tRDYDizcabq8SVANKVYWSmv1y', 2, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `coordinadores_nacionales`
--
ALTER TABLE `coordinadores_nacionales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `coordinadores_programa`
--
ALTER TABLE `coordinadores_programa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `coordinadores_regionales`
--
ALTER TABLE `coordinadores_regionales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `educadores`
--
ALTER TABLE `educadores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `niveles`
--
ALTER TABLE `niveles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `programas`
--
ALTER TABLE `programas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `programa_educadores`
--
ALTER TABLE `programa_educadores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `regiones`
--
ALTER TABLE `regiones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tecnologicos`
--
ALTER TABLE `tecnologicos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `coordinadores_nacionales`
--
ALTER TABLE `coordinadores_nacionales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `coordinadores_programa`
--
ALTER TABLE `coordinadores_programa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT de la tabla `coordinadores_regionales`
--
ALTER TABLE `coordinadores_regionales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `educadores`
--
ALTER TABLE `educadores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `niveles`
--
ALTER TABLE `niveles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `programas`
--
ALTER TABLE `programas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `programa_educadores`
--
ALTER TABLE `programa_educadores`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `regiones`
--
ALTER TABLE `regiones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tecnologicos`
--
ALTER TABLE `tecnologicos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
