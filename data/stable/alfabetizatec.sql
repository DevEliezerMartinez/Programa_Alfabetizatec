-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-01-2025 a las 05:24:58
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
(1, 173),
(2, 174);

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
(34, 34, 1),
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
(69, 69, 63),
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
(144, 144, 1),
(145, 145, 145),
(146, 146, 146),
(147, 147, 147),
(148, 148, 148),
(149, 149, 149),
(150, 150, 150),
(151, 151, 151),
(152, 152, 152),
(153, 153, 24),
(154, 154, 159),
(155, 155, 153),
(156, 156, 1),
(157, 157, 54),
(158, 158, 146),
(159, 159, 43),
(160, 160, 96),
(161, 161, 16),
(162, 162, 130);

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
(12, 168, 5),
(13, 169, 2),
(14, 170, 4),
(15, 171, 1),
(16, 172, 3);

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
  `num_hijos` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `educadores`
--

INSERT INTO `educadores` (`id`, `id_usuario`, `tipo_participante`, `modalidad`, `numero_control`, `carrera`, `id_tecnologico`, `semestre`, `nacionalidad`, `entidad_nacimiento`, `curp`, `sexo`, `estado_civil`, `num_hijos`) VALUES
(1, 187, 'estudiante', 'alfabetizaTEC', 12, 12, 91, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 188, 'docente', 'servicio_comunitario', 0, 0, 91, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 189, 'externo', 'alfabetizaTEC', 0, 0, 91, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 190, 'externo', 'alfabetizaTEC', 0, 0, 91, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 191, 'estudiante Universitario', 'participacion_honorifica', 0, 0, 90, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 192, 'docente', 'valor_curricular', 0, 0, 90, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 193, 'externo', 'servicio_comunitario', 0, 0, 90, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 194, 'docente', 'valor_curricular', 0, 0, 90, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 175, 'estudiante Universitario', 'alfabetizaTEC', 0, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 179, 'estudiante_universitario', 'alfabetizaTEC', 0, 0, 1, 0, 'mexicano', 'Aguascalientes', 'SOME001120HGRLRLA2', 'mujer', 'soltero', '1'),
(11, 180, 'estudiante_universitario', 'alfabetizaTEC', 0, 0, 1, 0, 'mexicano', 'Aguascalientes', 'SOME001120HGRLRLA2', 'mujer', 'soltero', '1');

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
  `telefono_fijo` varchar(20) DEFAULT NULL,
  `habla_lengua_indigena` enum('si','no') DEFAULT 'no',
  `situacion_laboral` varchar(50) DEFAULT NULL,
  `discapacidad` set('ninguna','fisica','visual','auditiva','intelectual','psicosocial') DEFAULT 'ninguna',
  `nivel_educativo` varchar(50) DEFAULT NULL,
  `motivacion` set('certificado','educacion','empleo','laborales','hijos') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id`, `nombre`, `apellidos`, `domicilio`, `curp`, `telefono`, `correo`, `segundo_apellido`, `fecha_nacimiento`, `sexo`, `nacionalidad`, `entidad_nacimiento`, `estado_civil`, `num_hijos`, `vialidad_tipo`, `vialidad_nombre`, `num_exterior`, `num_interior`, `codigo_postal`, `telefono_fijo`, `habla_lengua_indigena`, `situacion_laboral`, `discapacidad`, `nivel_educativo`, `motivacion`) VALUES
(1, 'Lefty', 'mala fr', 'edomex', 'SOME001120HGRLRLA2', 7331701927, 'LEFTY@example.com', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'no', NULL, 'ninguna', NULL, NULL),
(2, 'Eliezer', 'Solano Martinez', 'San Marcos', 'SOME001120HGRLRLA2', 7331701927, 'develiezermartinez@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'no', NULL, 'ninguna', NULL, NULL),
(3, 'elie', 'dbffasdf', 'calle hg No. tjhyrgtef Int. sn', 'SOME001120HGRLRLA2', 1234567890, 'dev@gmail.com', 'qghjlkjlhjk', '2025-01-23', 'mujer', 'mexicana', 'Aguascalientes', 'soltero', 2, 'calle', 'hg', 'tjhyrgtef', 'sn', '39960', '1234567890', 'no', '', 'auditiva', 'sin_estudios', 'laborales');

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
(1, 'Analfabeta', 'Nivel educativo inicial que incluye primaria y secundaria'),
(2, 'Inicial', 'Nivel educativo intermedio que incluye preparatoria o bachillerato'),
(3, 'Superior', 'Nivel educativo avanzado que incluye licenciatura, maestría y doctorado');

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
(1, 'tuyo', '', 90, 1, 100, 0, '2025-01-22', '2025-01-22'),
(3, '', '', 1, 1, 1200, 0, '2025-11-20', '2025-11-24');

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

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`id`, `status`, `id_programa`, `id_estudiante`, `fecha`) VALUES
(1, 'Aprobado', 1, 1, '2025-01-23'),
(2, 'pendiente', 2, 2, '2025-01-23'),
(3, 'desaprobado', 3, 3, '2025-01-24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnologicos`
--

CREATE TABLE `tecnologicos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `estado_id` bigint(20) NOT NULL,
  `modalidad` varchar(255) NOT NULL,
  `director` varchar(200) DEFAULT NULL,
  `tipo_de_institucion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tecnologicos`
--

INSERT INTO `tecnologicos` (`id`, `nombre`, `estado_id`, `modalidad`, `director`, `tipo_de_institucion`) VALUES
(1, 'I.T. de Campeche', 4, '', NULL, ''),
(2, 'I.T. de Álvaro Obregón', 7, '', NULL, ''),
(3, 'I.T. de Chihuahua', 6, '', NULL, ''),
(4, 'I.T. de Celaya', 11, '', NULL, ''),
(5, 'I.T. de Delicias', 6, '', NULL, ''),
(6, 'I.T.S. de Río Verde', 24, '', NULL, ''),
(7, 'I.T. de Lázaro Cárdenas', 16, '', NULL, ''),
(8, 'I.T. de Mérida', 23, '', NULL, ''),
(9, 'I.T.S. de Álamo Temapache', 13, '', NULL, ''),
(10, 'I.T. de Culiacán', 25, '', NULL, ''),
(11, 'I.T.S. de La Costa Chica', 12, '', NULL, ''),
(12, 'I.T. de Nuevo León', 19, '', NULL, ''),
(13, 'T.E.S. de La Región Carbonifera', 8, '', NULL, ''),
(14, 'I.T.S. de Irapuato', 11, '', NULL, ''),
(15, 'I.T. de Iguala', 12, '', NULL, ''),
(16, 'I.T.S. de Zacapoaxtla', 21, '', NULL, ''),
(17, 'I.T. de Toluca', 15, '', NULL, ''),
(18, 'I.T. de Tapachula', 5, '', NULL, ''),
(19, 'I.T.S. de Centla', 27, '', NULL, ''),
(20, 'I.T. del Istmo', 20, '', NULL, ''),
(21, 'I.T. de Tláhuac', 7, '', NULL, ''),
(22, 'T.E.S. de Ote. del Edo. de México', 15, '', NULL, ''),
(23, 'I.T.S. de Teposcolula', 20, '', NULL, ''),
(24, 'I.T. de Comitancillo', 20, '', NULL, ''),
(25, 'I.T.S. de Zacatecas Sur', 32, '', NULL, ''),
(26, 'I.T. de Parral', 6, '', NULL, ''),
(27, 'T.E.S. de Ixtapaluca', 15, '', NULL, ''),
(28, 'I.T. de Cerro Azul', 13, '', NULL, ''),
(29, 'T.E.S. de Coacalco', 15, '', NULL, ''),
(30, 'T.E.S. de Tianguistenco', 15, '', NULL, ''),
(31, 'I.T.S. de La Montaña', 12, '', NULL, ''),
(32, 'I.T.S. de Xalapa', 13, '', NULL, ''),
(33, 'I.T. de Norte de Nayarit', 18, '', NULL, ''),
(34, 'Centro Interdisciplinario de Investigación y Docencia en Educación Técnica (CIIDET)', 22, '', NULL, ''),
(35, 'I.T. de Pochutla', 20, '', NULL, ''),
(36, 'I.T. de Zacatepec', 17, '', NULL, ''),
(37, 'I.T.S. de Huatusco', 13, '', NULL, ''),
(38, 'I.T. de Tláhuac II', 7, '', NULL, ''),
(39, 'I.T.S. de Acatlán de Osorio', 21, '', NULL, ''),
(40, 'I.T. de Zacatecas', 32, '', NULL, ''),
(41, 'I.T.S. de San Miguel El Grande', 20, '', NULL, ''),
(42, 'I.T. de Cancún', 23, '', NULL, ''),
(43, 'T.E.S. de Chicoloapan', 15, '', NULL, ''),
(44, 'I.T.S. de San Pedro de las Colonias', 8, '', NULL, ''),
(45, 'I.T. de Nogales', 26, '', NULL, ''),
(46, 'I.T. de San Juan del Río', 22, '', NULL, ''),
(47, 'I.T.S. de Salvatierra', 11, '', NULL, ''),
(48, 'I.T.S. de El Dorado', 25, '', NULL, ''),
(49, 'I.T. de Durango', 10, '', NULL, ''),
(50, 'I.T. de Mazatlán', 25, '', NULL, ''),
(51, 'I.T. de El Salto', 10, '', NULL, ''),
(52, 'I.T. de Chihuahua II', 6, '', NULL, ''),
(53, 'I.T. de Hermosillo', 26, '', NULL, ''),
(54, 'I.T. de Gustavo A. Madero II', 7, '', NULL, ''),
(55, 'I.T.S. de Los Ríos', 27, '', NULL, ''),
(56, 'I.T. de Ensenada', 2, '', NULL, ''),
(57, 'I.T.S. de Chicontepec', 13, '', NULL, ''),
(58, 'I.T. de Tuxtepec', 20, '', NULL, ''),
(59, 'I.T. de Tijuana', 2, '', NULL, ''),
(60, 'I.T.S. de Nuevo Casas Grandes', 6, '', NULL, ''),
(61, 'I.T.S. de Tlaxco', 21, '', NULL, ''),
(62, 'I.T. de Mexicali', 2, '', NULL, ''),
(63, 'I.T. de Iztapalapa II', 7, '', NULL, ''),
(64, 'I.T.S. de Misantla', 13, '', NULL, ''),
(65, 'I.T.S. de Guanajuato', 11, '', NULL, ''),
(66, 'I.T.S. de Purhepecha', 16, '', NULL, ''),
(67, 'I.T.S. de Cd. Acuña', 8, '', NULL, ''),
(68, 'I.T. de Pinotepa', 20, '', NULL, ''),
(69, 'I.T. de Iztapalapa', 7, '', NULL, ''),
(70, 'T.E.S. de Huixquilucan', 15, '', NULL, ''),
(71, 'T.E.S. de Chalco', 15, '', NULL, ''),
(72, 'T.E.S. de Jocotitlán', 15, '', NULL, ''),
(73, 'I.T.S. de Fresnillo', 32, '', NULL, ''),
(74, 'I.T. de Conkal', 23, '', NULL, ''),
(75, 'I.T. de La Chontalpa', 27, '', NULL, ''),
(76, 'I.T. de Huimanguillo', 27, '', NULL, ''),
(77, 'ITS de Purísima del Rincón', 11, '', NULL, ''),
(78, 'I.T.S. de Cosamaloapan', 13, '', NULL, ''),
(79, 'I.T. de Jiquilpan', 16, '', NULL, ''),
(80, 'I.T. de Tepic', 18, '', NULL, ''),
(81, 'I.T.S. de Tepexi de Rodríguez', 21, '', NULL, ''),
(82, 'I.T. de Ocotlán', 14, '', NULL, ''),
(83, 'T.E.S. de Cuautitlán Izcalli', 15, '', NULL, ''),
(84, 'I.T. de Chetumal', 23, '', NULL, ''),
(85, 'I.T. de Zitácuaro', 16, '', NULL, ''),
(86, 'I.T. de Villahermosa', 27, '', NULL, ''),
(87, 'I.T. de Lerma', 15, '', NULL, ''),
(88, 'I.T. de Acapulco', 12, '', NULL, ''),
(89, 'I.T. de Cuautla', 17, '', NULL, ''),
(90, 'I.T. de San Marcos', 12, '', NULL, ''),
(91, 'I.T.S. de Tamazunchale', 24, '', NULL, ''),
(92, 'I.T.S. de Monclova', 8, '', NULL, ''),
(93, 'I.T.S. de La Región de los Llanos', 24, '', NULL, ''),
(94, 'I.T.S. de Puerto Peñasco', 26, '', NULL, ''),
(95, 'I.T.S. de Múzquiz', 8, '', NULL, ''),
(96, 'ITS de Hopelchen', 4, '', NULL, ''),
(97, 'I.T.S. de Zacatecas Norte', 32, '', NULL, ''),
(98, 'I.T. de Valle de Morelia', 16, '', NULL, ''),
(99, 'I.T.S. de Tacámbaro', 16, '', NULL, ''),
(100, 'I.T. de Valle del Guadiana', 10, '', NULL, ''),
(101, 'I.T.S. de Alvarado', 13, '', NULL, ''),
(102, 'I.T. de Huejutla', 13, '', NULL, ''),
(103, 'I.T. de Salina Cruz', 20, '', NULL, ''),
(104, 'I.T. de Cd. Jiménez', 6, '', NULL, ''),
(105, 'I.T. de Agua Prieta', 26, '', NULL, ''),
(106, 'I.T.S. de Progreso', 23, '', NULL, ''),
(107, 'I.T.S. de Guasave', 25, '', NULL, ''),
(108, 'I.T.S. de Jesús Carranza', 13, '', NULL, ''),
(109, 'I.T. de Linares', 19, '', NULL, ''),
(110, 'I.T. de Roque', 11, '', NULL, ''),
(111, 'I.T.S. de Mulegé', 3, '', NULL, ''),
(112, 'I.T. de Cd. Juárez', 6, '', NULL, ''),
(113, 'I.T.S. de Nochistlán', 32, '', NULL, ''),
(114, 'I.T. de Tlajomulco', 14, '', NULL, ''),
(115, 'I.T. de Úrsulo Galván', 13, '', NULL, ''),
(116, 'I.T.S. de Felipe Carrillo Puerto', 23, '', NULL, ''),
(117, 'I.T. de Iztapalapa III', 7, '', NULL, ''),
(118, 'I.T. de La Piedad', 16, '', NULL, ''),
(119, 'I.T. de La Laguna', 10, '', NULL, ''),
(120, 'I.T.S. de Ote. del Edo. de Hidalgo', 13, '', NULL, ''),
(121, 'I.T. de Cd. Altamirano', 12, '', NULL, ''),
(122, 'I.T. de Tizimín', 23, '', NULL, ''),
(123, 'I.T. de Orizaba', 13, '', NULL, ''),
(124, 'I.T.S. de Lerdo', 10, '', NULL, ''),
(125, 'I.T.S. de La Sierra Negra de Ajalpan', 21, '', NULL, ''),
(126, 'I.T. de Torreón', 8, '', NULL, ''),
(127, 'I.T.S. de Tantoyuca', 13, '', NULL, ''),
(128, 'I.T.S. de Puruándiro', 16, '', NULL, ''),
(129, 'I.T. de Piedras Negras', 8, '', NULL, ''),
(130, 'I.T.S. de Santiago Papasquiaro', 10, '', NULL, ''),
(131, 'I.T. de La Zona Olmeca', 20, '', NULL, ''),
(132, 'I.T. de Apizaco', 21, '', NULL, ''),
(133, 'I.T.S. de Zongolica', 13, '', NULL, ''),
(134, 'I.T. de Cd. Victoria', 28, '', NULL, ''),
(135, 'I.T. de Atitalaquia', 13, '', NULL, ''),
(136, 'I.T. de Matehuala', 24, '', NULL, ''),
(137, 'I.T. de Valle del Yaqui', 26, '', NULL, ''),
(138, 'I.T. de Puebla', 21, '', NULL, ''),
(139, 'I.T.S. de Cajeme', 26, '', NULL, ''),
(140, 'I.T. de Nuevo Laredo', 28, '', NULL, ''),
(141, 'I.T.S. de Comalcalco', 27, '', NULL, ''),
(142, 'I.T. de Tlaxiaco', 20, '', NULL, ''),
(143, 'I.T. de Cd. Valles', 24, '', NULL, ''),
(144, 'CRODE Orizaba', 13, '', NULL, ''),
(145, 'I.T. de Oaxaca', 20, '', NULL, ''),
(146, 'I.T.S. de Atlixco', 21, '', NULL, ''),
(147, 'I.T.S. de Huichapan', 13, '', NULL, ''),
(148, 'I.T.S. de Pánuco', 13, '', NULL, ''),
(149, 'I.T. de Querétaro', 22, '', NULL, ''),
(150, 'I.T. de La Zona Maya', 23, '', NULL, ''),
(151, 'I.T.S. de Calkiní', 4, '', NULL, ''),
(152, 'T.E.S. de Jilotepec', 15, '', NULL, ''),
(153, 'I.T. de Aguascalientes', 1, 'Doctorado en Ciencias de la Ingeniería', NULL, 'Instituto Tecnológico de Aguascalientes'),
(154, 'Instituto Tecnológico de Ensenada', 2, 'Doctorado en Ciencias de la Ingeniería', NULL, 'Instituto Tecnológico de Ensenada'),
(155, 'I.T. de Baja california sur', 2, 'Arquitectura', NULL, 'Instituto Tecnológico de Estudios Superiores de Lo'),
(156, 'Instituto Tecnológico de Comitán', 5, 'Ingeniería en Agronomía', NULL, 'Instituto Tecnológico de Comitán'),
(157, 'Instituto Tecnológico de Álvaro Obregón', 7, 'Ingeniería en Diseño Industrial', NULL, 'Instituto Tecnológico de Álvaro Obregón'),
(158, 'I.T. de Coahuila', 8, 'Ingeniería Electromecánica', NULL, 'Instituto Tecnológico de Estudios Superiores de La'),
(159, 'I.T. de Colima', 9, 'Arquitectura', NULL, 'Instituto Tecnológico de Colima'),
(160, 'Instituto Tecnológico de Tlalnepantla', 15, 'Doctorado en Ciencias de la Ingeniería', NULL, 'Instituto Tecnológico de Tlalnepantla'),
(161, 'Instituto Tecnológico de Acapulco', 12, 'Arquitectura', NULL, 'Instituto Tecnológico de Acapulco'),
(162, 'Instituto Tecnológico de Ciudad Guzmán', 3, 'Arquitectura', NULL, 'Instituto Tecnológico de Ciudad Guzmán'),
(163, 'Instituto Tecnológico de Jiquilpan', 4, 'Arquitectura', NULL, 'Instituto Tecnológico de Jiquilpan'),
(164, 'I.T. de Morelos', 2, 'Doctorado en Ciencias de la Computación', NULL, 'Centro Nacional de Investigación y Desarrollo Tecn'),
(165, 'Instituto Tecnológico de Cancún', 23, 'Arquitectura', NULL, 'Instituto Tecnológico de Cancún'),
(166, 'Instituto Tecnológico de Ciudad Valles', 24, 'Ingeniería Ambiental', NULL, 'Instituto Tecnológico de Ciudad Valles'),
(167, 'Instituto Tecnológico de Culiacán', 25, 'Doctorado en Ciencias de la Ingeniería', NULL, 'Instituto Tecnológico de Culiacán'),
(168, 'Instituto Tecnológico de Agua Prieta', 26, 'Contador Público', NULL, 'Instituto Tecnológico de Agua Prieta'),
(169, 'Instituto Tecnológico de Huimanguillo', 27, 'Ingeniería en Innovación Agrícola Sustentable', NULL, 'Instituto Tecnológico de Huimanguillo'),
(170, 'Instituto Tecnológico de Altamira', 28, 'Ingeniería en Agronomía', NULL, 'Instituto Tecnológico de Altamira'),
(171, 'Instituto Tecnológico de Apizaco', 29, 'Doctorado en Ciencias de la Ingeniería', NULL, 'Instituto Tecnológico de Apizaco'),
(172, 'Instituto Tecnológico de Boca del Río', 30, 'Doctorado en Ciencias Ambientales', NULL, 'Instituto Tecnológico de Boca del Río'),
(173, 'Instituto Tecnológico de Conkal', 31, 'Doctorado en Ciencias en Agricultura Tropical Sustentable', NULL, 'Instituto Tecnológico de Conkal'),
(174, 'Instituto Tecnológico de Mérida', 31, 'A Distancia', NULL, 'Federal');

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
  `puesto` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `curp`, `telefono`, `correo`, `correo_inst`, `contrasena`, `rol_id`, `puesto`, `fecha_nacimiento`) VALUES
(1, 'Francisco Manuel Tomas ', 'Arriola Escalante ', 'AIEF890411HCCRSR19', 9811377393, 'vin_campeche@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(2, 'Alejandra', 'Baleón González', 'BAGA960106MDFLNL00', 5543716010, 'vin_aobregon@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(3, 'Yadira Judith ', 'Flores Márquez', 'FOMY801219MCHLRD03', 6144044321, 'yadira.fm@chihuahua.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(4, 'Gracia Cecilia', 'Gómez Morado', 'GOMG750923MGTMRR02', 4614063333, 'cecilia.gomez@itcelaya.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(5, 'MARIA DEL ROSARIO ', 'BARAY GUERRERO', 'BAGR670914MCHRRS13', 6391119866, 'maria.bg@delicias.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(6, 'AZALIA', 'MOYA BARRAGAN', 'MOBA960903MSPYRZ03', 4871211071, 'azalia.mb@rioverde.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(7, 'Gloria Viridiana', ' Vallejo  Navarrete', 'VANG840305MMNLVL00', 7531244706, 'vin_lcardenas@tecnm.mx ', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(8, 'Luisa Gisell', 'Pat Reyes', 'PARL780903MYNTYS05', 9994269414, 'luisa.pr@merida.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(9, 'Frida Alicia', 'Pacheco Molina', 'PAMF960822MVXCLR01', 2282287797, 'frida.pm@alamo.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Director (a) de Planeación y Vinculación', NULL),
(10, 'Raul Alfonso', 'Ayon Felix', 'AOFR8102220HSLYLL01', 6671880026, 'vin_culiacan@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(11, 'Jhonatan', 'Añorve  Torres', 'AOTJ900814HGRXRH01', 7411155599, 'sub.vinculacion@costachica.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(12, 'Lesly Yamilett', 'Treviño Reyna', 'TERL900502MNLRYS00', 8126536568, 'vin_nleon@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(13, 'EVA GUADALUPE', 'SAID FERNÁNDEZ', 'SAFE650112MCLDRV01', 8611130454, 'subvinculacion@rcarbonifera.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(14, 'Javier de Jesús', 'Rojas González', 'ROGJ790104HGTJNV07', 4621264655, 'javier.rg@irapuato.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(15, 'Carlos Alberto', 'Díaz  Lara ', 'DILC730417HGRZRR08 ', 7331012027, 'vin_iguala@tecnm.mx ', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(16, 'Delfino Cuauhtémoc  ', 'Bravo Armenta', 'BAAD681226HDFRRL09', 2331045867, 'dir.planeacion.vinculacion@zacapoaxtla.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Director (a) de Planeación y Vinculación', NULL),
(17, 'José Luis', 'García  Rivas', 'GARL710822HMCRVS05', 7221170939, 'vin@toluca.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(18, 'Ana María', 'Salazar Ortiz', 'SAOA811219MSLLRN07', 9626957266, 'vin_tapachula@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(19, 'Arturo ', 'Arias Garcia', 'AIGA750722HTCRRR06', 9934953188, 'vinculacion@centla.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(20, 'Claudia', 'Sánchez Martínez', 'SAMC840729MOCNRL01', 9711879270, 'servicio.social@itistmo.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(21, 'YAJAIRA', 'TAPIA DE LA ROSA', 'TARY950614MDFPSJ04', 5554793519, 'servicio.social@tlahuac.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(22, 'SILVIA GLORIA ', 'MENDOZA  FERNÁNDEZ', 'MEFS810128MVZNRL07', 5634352112, 'ss.rp@tesoem.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(23, 'DANIEL ', 'MIRANDA ESPINOSA', 'MIED750719HOCRSN00', 9511187744, 'vin_dteposcolula@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(24, 'YULMA', 'MENDEZ LOPEZ', 'MELY771006MOCNPL05', 9711757415, 'vin_comitancillo@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(25, 'Héctor Eduardo ', 'Gutierrez  Casanova ', 'GUCH860521HZSTSC00', 4491579793, 'hector.gc@zacatecassur.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(26, 'ABIGAIL', 'SALGADO MONÁRREZ', 'SAMA720429MDGLNB04', 6271065588, 'gestion@itparral.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(27, 'Carolina Anabel ', 'Ayala Hernández', 'AAHC841124MMCYRR02', 5548586705, 'servicio.socialyresidencias@tesi.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) de Oficina de Servicios Externos', NULL),
(28, 'Selene Inés ', 'Flores Salinas', 'FOSS880825PA6', 7851097068, 'ci_cerroazul@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(29, 'Claudia Teresa ', 'Trejo  Jiménez ', 'TEJC810720MDFRML08', 5579835575, 'deptossrp@tesco.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(30, 'EMMANUEL', ' GARDUÑO  MEDINA', 'GAME871011HMCRDM06', 5532519330, 'plan_dtianguistenco@tecnm. mx ', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Director (a) de Planeación y Vinculación', NULL),
(31, 'ANANÍAS', 'JERÓNIMO VARGAS', 'JEVA660327HGRRRN03', 7571117175, 'vin_dmontana@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(32, 'Ilse Sahil', 'Montiel  Rodríguez', 'MORI871206MVZNDL04', 2285014083, 'ilse.montiel@itsx.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(33, 'Noemí Elizabeth', 'Castañeda Inda', 'CAIN690408MNTSNM04', 3118765877, 'vinculacion@nortenayarit.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(34, 'Raúl', 'de La Torre Sánchez', 'TOSR520927HSPRNL11', 4422009790, 'raul.ds@ciidet.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Docente', NULL),
(35, 'Héctor ', 'Orozco Rodríguez', 'OORH800102HSLRDC08', 9541338203, 'ci_pochutla@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(36, 'JESUS', 'RECILLAS ROMAN', 'RERJ850329HMSCMS05', 7341815358, 'jesus.rr@zacatepec.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(37, 'María Teresa ', 'Colin Zarate', 'COZT871123MVZLRR03', 2711048372, 'dposgrado@huatusco.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(38, 'PAOLA ', 'MORENO ROMERO', 'MORP790820MDFRML00', 5624000339, 'vin_tlahuac2@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(39, 'Miriam', 'García Rojas', 'GARM620714MDFRJR12', 9531119347, 'vin_dacatlan@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(40, 'AMAURY ', 'GUEL  BÁEZ', 'GUBA800315HSPLZM09vi', 4921342319, 'vin_zacatecas@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(41, 'Brígido Gustavo ', 'González  Mora', 'GOMB800723HOCNRR00', 9531044415, 'gustavo.gm@smiguelgde.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(42, 'JAVIER', 'PACHECO HIPOLITO', 'PAHJ720107HVZCPV01', 9981478640, 'vin_cancun@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(43, 'Eduardo', 'Ramos Díaz', 'RADE850808HDFMZD01', 5539845070, 'eduardo.ramos@teschic.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(44, 'ELIZABETH ', 'SANTOS HIDROGO', 'SAHE830109MDFNDL06', 8721092309, 'sub.vinculacion@tecsanpedro.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(45, 'MARIO BENEDICTO', 'GONZALEZ LEON', 'GOLM660312HSRNNR00', 6311739700, 'vin_nogales@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(46, 'EDITH ', 'ROSALÍO URIBE', 'ROUE890620MQTSRD09', 4272724118, 'vin_sjuanrio@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(47, 'Gustavo ', 'Cortes  Arias', 'Coag880905hgtrrs02', 4661194762, 'gucortes@itess.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(48, 'JOSÉ RAFAEL', 'CONTRERAS  CHÁVEZ', 'COCR870224HSLNHF03', 6673891514, 'JOSE.CC@ELDORADO.TECNM.MX', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(49, 'Jorge Agustín', 'Pimentel Martínez', 'PIMJ790927HDGMRR03', 6181709942, 'jpimentel@itdurango.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(50, 'ANA PAOLA', 'ORTIZ BRAMBILA', 'OIBA870321MSLRRN07', 8110784143, 'vin_mazatlan@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(51, 'Aldo Alejandro', 'Lujan Espinoza', 'LUEA790910HDGJSL00', 6181800292, 'vin_salto@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(52, 'ALEJANDRA', 'ROSAS AMPARÁN', 'ROAA730424MCHSML06', 6141926067, 'servicio_social@chihuahua2.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(53, 'JULIA GRACIELA', 'PRECIADO LEON', 'PELJ660102MSRRNL00', 6621314922, 'julia.preciadol@hermosillo.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(54, 'HILDA AURORA', 'ROSAS RODRÍGUEZ', 'RORH680813MDFSDL08', 5564770869, 'hilda.rr@gamadero2.tecm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(55, 'Cindy', 'Ricardes Gutiérrez', 'RIGC910330MTCCTN05', 9341100030, 'depto.residenciaprof@rios.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(56, 'Lourdez Estephanie ', 'Campero León', 'CALL851019MBCMNR02', 6461321665, 'vin_ensenada@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(57, 'José Ángel', 'Ramírez Guerrero', 'RAGA951014HVZMNR04', 9221852608, 'jose.ramirez@chicontepec.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(58, 'Nephtali', 'Chavez Campechano', 'CACN931027HOCHMP03', 2871320345, 'nephtali.cc@tuxtepec.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(59, 'Artemio ', 'Lara Chavez', 'LACA721219HBCRHR04', 6641673728, 'alara@tectijuana.edu.mx ', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(60, 'Armando Ivan', 'Ochoa  baca', 'OOBA851115HCHCCR00', 6141651235, 'd-vinculacion@itsncg.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(61, 'Andrea ', 'Vega  Hernández ', 'VEHA820225MTLGRN06', 2462975644, 'dda_dtlaxco@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(62, 'Martha Silvia', 'Alfaro López', 'AALM681227MBCLPR01', 6861616058, 'GESTION@ITMEXICALI.EDU.MX', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(63, 'RICARDO', 'REYES  SALVADOR', 'RESR820627HMCYLC00', 5515992848, 'plan_iztapalapa2@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(64, 'BEATRIZ', 'MIRANDA JIMÉNEZ', 'MIJB780213MVZRMT04', 2351091383, 'bmirandaj@itsm.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(65, 'José Alejandro', 'Castro Téllez ', 'CATA930525HGTSLL09', 4731405690, 'jefaturadevinculacion@guanajuato.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(66, 'Florencio', 'Santos Ascencio', 'SAAF710628HMNNSL02', 3511200516, 'florencio.sa@purhepecha.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Director (a) de Planeación y Vinculación', NULL),
(67, 'CARLOS', 'GUAJARDO SANDOVAL', 'GUSC770406HCLJNR07', 8777703267, 'dir_vinculacion@cdacuna.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Director (a) de Planeación y Vinculación', NULL),
(68, 'Fernando ', 'Morales  Cortes', 'MOCF840618HOCRRR01', 9541579019, 'plan_pinotepa@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(69, 'Luis Angel ', 'Mares  Rosas', 'MARL840514HOCRSS00', 2871102573, 'plan_iztapalapa@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(70, 'María del Rocío ', 'Nava  Moreno', 'NAMR600114MDFVRC08', 5610813709, 'servicio.practicas@huixquilucan.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(71, 'JESUS ANTONIO ', 'GUEVARA SANCHEZ', 'GUSJ880713HDFVNS00', 5513403567, 'subdirvinculacionyextension@tesch.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(72, 'Gustavo Adolfo ', 'Estrada  López ', 'EALG650127HMCSPS01', 5527100349, 'direccion.vinculacion@tesjo.edu.mx      vin_djocotitlan@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Director (a) de Planeación y Vinculación', NULL),
(73, 'LETICIA ', 'HERNANDEZ ROJERO', 'HERL680418MZSRJT01', 4931030590, 'gestionyvinculacion@fresnillo.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(74, 'José Guadalupe', 'Basto Chan', 'BACG851212HYNSHD00', 9997386485, 'vin_conkal@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(75, 'ALVARO', 'LAZARO HERNANDEZ', 'LAHA770219HTCZRL05', 9932295597, 'vin_chontalpa@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(76, 'FRANCISCO', 'ALVARADO RUEDA', 'AARF800803HTCLDR01', 9171092141, 'vin_huimanguillo@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(77, 'Fernando Antonio', 'Celaya Ojeda ', 'CEOF880925HGTLJR08', 4626293158, 'fernando.co@purisima.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(78, 'ME. ROCIO ', 'ALFONSÍN FERAT', 'AOFR690221MVZLRC04', 2881064351, 'd.vinculacion@cosamaloapan.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(79, 'Tonatiuh', 'Baltazar Baez', 'BABT830311HMNLZN15', 3313969369, 'tonatiuh.bb@jiquilpan.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(80, 'Moisés', 'Garcés Martínez', 'GAMM731008HJCRRS09', 3111922893, 'gtvinculacion@ittepic.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(81, 'ELIZABETH ', 'MEDEL  MENDOZA', 'MEME880906MPLDNL01', 2226792300, 'extension.itstr@gmail.com', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(82, 'GLADYS NALLELI', 'BECERRA  SALAZAR', 'BESG860331MJCCLL00', 3929224680, 'vin_ocotlan@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(83, 'Karina Fabiola', 'Jiménez Olvera', 'JIOK751004MDFMLR06', 5544905607, 'subvinculacion@cuautitlan.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(84, 'LOLY VICTORIA', 'TENORIO RODRÍGUEZ', 'TERL810530MYNNDL00', 9831209665, 'vin_chetumal@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(85, 'Jhacer Kharen', 'Ruiz  Garduño', 'RUGJ821018MMNZRH05', 7223967206, 'jhacer.rg@zitacuaro.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(86, 'CITLALLI IRAIS', 'MARTINEZ SOBERANEZ', 'MASC850205MTCRBT04', 9931608948, 'vin_villahermosa@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(87, 'Santiago Javier', 'Ayuso Aguilar', 'AUAS720506HCCYGN05', 9818290573, 'vin_lerma@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(88, 'Paulina Amaranta ', 'Bórquez  Domínguez ', 'Bodp900222d72', 7445886952, 'Vin_acapulco@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(89, 'Areli Soledad', 'Ruiz Martinez', 'RUMA831211MMSZRR03', 7351260664, 'vin_cuautla.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(90, 'Maricela ', 'Gallegos  Cuevas', 'GACM680201MGRLVR08', 7451032304, 'vin_smarcos@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(91, 'Plácido', 'Hernández Márquez', 'HEMP871005HSPRRL04', 4831081139, 'jdrp@tamazunchale.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(92, 'Arturo ', 'Martínez  de Hoyos', 'MAHA870112HCLRYR00', 8661166769, 'arturo.martinez@monclova.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(93, 'Julián José', 'López Olivas', 'LOOJ820516HDGPLL05', 6181571191, 'julian.lo@regionllanos.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(94, 'Rodrigo ', 'Garcia Hernández', 'GAHR711125HOCRRD07', 6381097847, 'rodrigo.gh@puertopenasco.tecnm.m,x', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) Académico (a)', NULL),
(95, 'Jesús Rafael', 'Sesatty Sáenz', 'SESJ840528HCLSNS00', 8611047437, 'jesus.sesatty@tecmuzquiz.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(96, 'Mirna Montserrat', 'Alpuche Gomez', 'AUGM961225MCCLMR13', 9961026430, 'mirna.ag@hopelchen.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(97, 'PEDRO', 'MURO ZUÑIGA', 'MUZP720128HZSRXD07', 4981009328, 'pedro.mz@zacatecasnte.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Director (a) de Planeación y Vinculación', NULL),
(98, 'Adelfina', 'Alquicira Avilés', 'AUAA631209MMNLVD05', 4432133067, 'adelfina.aa@vmorelia.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(99, 'MARIA SUGEL', 'LOPEZ AGUADO', 'LOAS780124MMNPGG03', 4591229733, 'vin_dtacambaro@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(100, 'Fernando Eligio', 'Compeán  Estrada', 'COEF620528HDGMSR00', 6181586730, 'fernando.ce@vguadiana.tecnm,mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) de Oficina de Servicios Externos', NULL),
(101, 'Jenny Jesús', 'Márquez Díaz', 'MADJ780224MVZRZN02', 2971040572, 'dep_@alvarado.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) Académico (a)', NULL),
(102, 'MAYRELY', 'NAVA GUZMAN ', 'NAGM761007HM0', 7711984515, 'vin_huejutla@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(103, 'ADRIANA', 'LARA  LOPEZ', 'LALA860413MOCRPD09', 9711407214, 'ss@salinacruz.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(104, 'José René', 'Pérez Chávez', 'PECR750117HCHRHN06', 6291104056, 'jrperez@cdjimenez.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(105, 'VICTOR MANUEL ', 'VALENZUELA ALCARAZ', 'VAAV720224HSRLLC00', 6333348328, 'vin_aguaprieta@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(106, 'Froilan Guadalupe ', 'Gomez  Canul', 'GOCF821204HYNMNR07', 9991777370, 'jefevinculacion@progreso.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(107, 'LIZETH', 'ALVAREZ VILLEGAS', 'AAVL801204MSLLLZ09', 6871255770, 'dep_via@guasave.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(108, 'JOSÉ ANTONIO', 'LANDA  SÁNCHEZ', 'LASA770324HVZNNN08', 2288377926, 'vinculacion_djcarranza@itsjc.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(109, 'Elvia Rosa ', 'Ozuna  Cárdenas ', 'OUCE880204MNLZRL09', 8211218954, 'eozuna@itlinares.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Docente', NULL),
(110, 'Wendy', 'Mondragón  Moreno', 'MOMW780306MGTNRN09', 4612002850, 'subdireccion.ac@roque.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) Académico (a)', NULL),
(111, 'BIANCA YUDIRIA', 'MURILLO MURILLO', 'MUAV870602MBSRVN01', 6151041958, 'bianca.ma@mulege.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Docente', NULL),
(112, 'Elizabeth', 'Gutiérrez Anaya', 'GUAE681023UB8', 6561766972, 'jefatura_da@cdjuarez.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(113, 'Francisco Gerardo ', 'Villarreal  Luna', 'VILF890531HZSLNR01', 4631039153, 'gestion.vinculacion@itsn.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(114, 'ALEJANDRO ', 'FRIAS  CASTRO', 'FICA830309HJCRSL07', 3321816512, 'vin_tlajomulco@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(115, 'Karla Ivón ', 'Moctezuma  Herrera ', 'MOHK900620MVZCRR03', 2961040323, 'karla.mh@ugalvan.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(116, 'GILBERTO', 'CANCHE COUOH', 'CACG770203HQRNHL05', 9831060149, 'g.canche@itscarrillopuerto.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(117, 'JOSÉ', 'LUNA HERRERA', 'LUHJ580723HDFNRS09', 5564165851, 'jose.lh@iztapalapa3.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Docente', NULL),
(118, 'Jesús Eduardo ', 'Villegas  Martínez ', 'VIMJ710725HMNLRS06', 3521116222, 'vin_piedad@tecnm.mx ', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(119, 'ALMA LETICIA', 'RAMOS  RÍOS', 'RARA610428MDGMSL03', 8714144741, 'acad_laguna@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) Académico (a)', NULL),
(120, 'Sonia Guadalupe', 'Aguilar  Martínez', 'AUMS761205MHGGRN09', 7712211493, 'subdir_vinculacion@itesa.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(121, 'Sergio ', 'Vivas  Hernández', 'VIHS861008HGRVRR05', 7671026640, 'plan_cdaltamirano@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(122, 'Mayra Isabel ', 'MENDOZA LAGUNES', 'MELM790107MVZNGY01', 9862256057, 'vin_tizimin@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(123, 'Jesús Alberto ', 'Cilias Hernandez', 'Cihj710121hvzlrs00', 2721220919, 'Jesus.ch@orizaba.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(124, 'JAIME', 'RODRIGUEZ CSTAÑEDA', 'ROCJ621108HDGDSM09', 8711413232, 'subdireccionacademica@itslerdo.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) Académico (a)', NULL),
(125, 'GUSTAVO ', 'GARCÍA  BARBOSA', 'GABG821011HPLRRS04', 2361234554, 'vin_itssna@ajalpan.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(126, 'SANDRA LUZ', 'ESPINOZA PORTILLO', 'EIPS700605MPLSRN02', 8711769949, 'sandra.ep@torreon.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(127, 'Jesús Guillermo', 'Rivera Zumaya', 'RIZJ770727HVZVMS09', 7891075241, 'guillermo.rivera@itsta.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Director (a) de Planeación y Vinculación', NULL),
(128, 'Francisco', 'León  Santiago', 'LESF760720HDFNNR04', 4434407644, 'biblioteca@puruandiro.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(129, 'AÍDA ', 'HERNÁNDEZ ÁVILA', 'HEAA601108MCLRVD04', 8787912767, 'plan_piedrasnegras@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(130, 'Enrique Orlando ', 'Rodríguez  Sandoval ', 'ROSE790118HDGDNN00', 6741173041, 'enrique.rs@spapasquiaro.tec.mn', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(131, 'JUAN ', 'DE LA CRUZ  MAY', 'CUMJ800620HTCRYN05', 9932029767, 'juan.cm@zolmeca.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(132, 'MARIA VALERIA', 'MONTIEL MARQUEZ', 'MOMV560703MTLNRL11', 2411198075, 'gestion@apizaco.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(133, 'Adelina', 'Xocua González', 'XOGA850829MVZCND04', 2781044509, 'dept_serviciosocial@zongolica.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(134, 'MARTHA ADELFA', 'AVALOS  PUGA', 'AAPM630829MTSVGR04', 8341119271, 'vin_cdvictoria.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(135, 'Nancy', 'Vázquez  Barrera', 'VABN780421MHGZRN06', 7721339963, 'vin_atitalaquia@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(136, 'Juan José', 'Robles Conde', 'ROCJ771124HSPBNN05', 4881455163, 'juan.rc@matehuala.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(137, 'Alejandra Paola ', 'Borquez Lopez  ', 'BOLA820629MSRRPL02', 6441970376, 'plan_vyaqui@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(138, 'YARENTZI  ', 'GÓMEZ  CAMPOS', 'GOCY851030MPLMMR05', 5568609767, 'vinculacion@puebla.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(139, 'Belinda Virginia ', 'Lamadrid  Bours', 'LABB750531MSRMRL02', 6441263050, 'blamadrid@itesca.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) de Proyectos de Investigación', NULL),
(140, 'Gabriela', 'Rodríguez  Segura', 'ROSG830320MTSDGB01 ', 8671000850, 'gabriela.rs@nlaredo.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Docente', NULL),
(141, 'JAZMIN', 'JAUREGUI AREVALO', 'JAAJ280686MTCRRZ07', 9331013442, 'servicio_residencia@comalcalco.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(142, 'Daniel ', 'Carbajal Diaz', 'CADD8712148HOCRZN02', 9531103297, 'daniel_cd@itlaxiaco.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(143, 'María Teresa ', 'Tejeda  Jiménez', 'TEJT701206MDFJMR08', 4811135632, 'lenguas.extranjeras@tecvalles.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) de Oficina de Servicios Externos', NULL),
(144, 'Angel', 'Hernández Bretón', 'HEBA630804HVZRRN06', 2722100836, 'vin_crodeorizaba@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(145, 'Gabriela', 'Aguilar Ortiz', 'AUOG760403MOCGRB08', 9515691022, 'plan_oaxaca@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(146, 'Juana ', 'Alonso Osorio', 'AOOJ801229MPLSSN09', 2441097288, 'juana.alonso@itsatlixco.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(147, 'MARÍA ANGÉLICA ', 'CRUZ CAMARGO', 'CUCA700207MDFRMN08', 7731325737, 'macruz@iteshu.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(148, 'JOSE AGUSTIN', 'CARRIZALES OLIVARES', 'CAOA680304HVZRLG09', 8332454149, 'asgustin.carrizales@itspanuco.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(149, 'Mónica', 'Ortiz  Medrano', 'OIMM730319MQTRDN05', 4421575356, 'dgtyv_serviciosocial@queretaro.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(150, 'Victor Manuel ', 'R de León  García ', 'Rxgv780926hqrxrc06', 9831834201, 'Vin_zmaya@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(151, 'JOSE DE LOS SANTOS', 'EVIA CHOZA', 'EICS640830HCCVHN02', 9811161227, 'jevia@itescam.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(152, 'Alejandro Martínez Santiago', 'Martínez Santiago', 'MASA901016HHGRNL02', 5527510831, 'alejandro.ms@jilotepec.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Docente', NULL),
(153, 'LUCINA ', 'GUILLEN GONZALEZ', 'GUGL700619MCSLML02', 9631528902, 'acad_comitan@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) Académico (a)', NULL),
(154, 'BRAULIO GABRIEL', 'CONTRERAS GALVAN', 'COGB800422HDFNLR04', 3121078861, 'vin_colima@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(155, 'Alberto', 'Díaz Juárez', 'DIJA791130HTLZRL01', 2461556552, 'alberto.dj@aguascalientes.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(156, 'RUBEN ', 'GAYTÁN DÍAZ', 'GADR710505HCHYZB09', 6144573889, 'vin_crodechihuahua@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(157, 'JAVIER ', 'LARA  DE PAZ', 'LAPJ751007HDFRZV06', 5527501836, 'vin_gamadero@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(158, 'Beatriz', 'Castelán  Aparicio ', 'CAAB740214MPLSPT08', 2441028063, 'beatriz.castelan@itsatlixco.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) Académico (a)', NULL),
(159, 'Jonathan', 'Sánchez Muñoz', 'SAMJ001015HMCNXNA2', 5649409193, 'jonathan.sanchez@teschic.edu.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Otro (a)', NULL),
(160, 'NANCY BERENICE', 'ESPINOSA  UC', 'EIUN880715MCCSCN09', 9961078723, 'nancy.eu@hopelchen.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Jefe (a) del Departamento de Gestión Tecnológica y Vinculación ', NULL),
(161, 'Delfino Cuauhtémoc ', 'Bravo  Armenta', 'BAAD681226HDFRRL0', 2331045867, 'dir.planeacion.vinculacion@zacapoaxtla.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Director (a) de Planeación y Vinculación', NULL),
(162, 'Enrique Orlando ', 'Rodríguez Sandoval ', 'ROSE790118HDGDNN00', 6741173041, 'enrique.rs@spapasquiaro.tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'Subdirector (a) de Planeación y Vinculación', NULL),
(168, 'VICTOR HUGO', 'AGATON CATALAN', 'CATALAN', 0, 'dir_smarcos@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 2, 'Director del Tecnologico de San Marcos', NULL),
(169, 'DEYSI YESICA', 'ÁLVAREZ VERGARA', 'VERGARA', 0, 'dir_cdvictoria@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 2, 'Directora del Tecnologico de Ciudad Victoria', NULL),
(170, 'ATZIRI YERALDIN', 'MERLO RODRIGUEZ', 'RODRIGUEZ', 0, 'dir_iztapalapa2@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 2, 'Directora del Tecnologico de Iztapalapa II', NULL),
(171, 'MANUEL ÁNGEL', 'URIBE VAZQUEZ', 'VAZQUEZ', 0, 'dir_tepic@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 2, 'Director del Tecnologico de Tepic', NULL),
(172, 'RAÚL RENÉ', 'ROBLES LACAYO', 'LACAYO', 0, 'dir_roque@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 2, 'Director del Tecnologico de Roque', NULL),
(173, 'Ramon', 'Jimenez Lopez', NULL, 0, 'direccion@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 1, 'Director', NULL),
(174, 'Andrea', 'Zarate Fuentes', NULL, 0, 's_vinculacion@tecnm.mx', NULL, '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 1, 'Secretaria de Vinculacion', NULL),
(175, 'mari', 'solano', 'ISa12322d23e23', 3244324324234, 'Andrea.zarate@tecnm.mx', 'asasa@mg.ocm', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 4, '112', NULL),
(179, 'eliezr', 'solano devvvv', NULL, 1234567890, 'develiezermartinez@gmail.com', 'deveie@gmail.com', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, 'DEV', '2000-11-20'),
(180, 'rappaaa', 'solano devvvv', NULL, 1234567890, 'develiezermartinez@gmail.com', 'deveie@gmail.com', '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.', 3, '2', '2000-11-20');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT de la tabla `coordinadores_regionales`
--
ALTER TABLE `coordinadores_regionales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `educadores`
--
ALTER TABLE `educadores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `niveles`
--
ALTER TABLE `niveles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `programas`
--
ALTER TABLE `programas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tecnologicos`
--
ALTER TABLE `tecnologicos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
