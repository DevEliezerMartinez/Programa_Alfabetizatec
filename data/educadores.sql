-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-01-2025 a las 19:10:59
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
  `semestre` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `educadores`
--

INSERT INTO `educadores` (`id`, `id_usuario`, `tipo_participante`, `modalidad`, `numero_control`, `carrera`, `id_tecnologico`, `semestre`) VALUES
(1, 187, 'estudiante', 'alfabetizaTEC', 12, 12, 91, 12),
(2, 188, 'docente', 'servicio_comunitario', 0, 0, 91, 0),
(3, 189, 'externo', 'alfabetizaTEC', 0, 0, 91, 0),
(4, 190, 'externo', 'alfabetizaTEC', 0, 0, 91, 0),
(5, 191, 'estudiante Universitario', 'participacion_honorifica', 0, 0, 90, 0),
(6, 192, 'docente', 'valor_curricular', 0, 0, 90, 0),
(7, 193, 'externo', 'servicio_comunitario', 0, 0, 90, 0),
(8, 194, 'docente', 'valor_curricular', 0, 0, 90, 0),
(9, 175, 'estudiante Universitario', 'alfabetizaTEC', 0, 0, 1, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `educadores`
--
ALTER TABLE `educadores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `educadores`
--
ALTER TABLE `educadores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
