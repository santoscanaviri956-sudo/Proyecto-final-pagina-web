-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-10-2026 a las 21:05:17
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuelas360`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `escuela_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `autor` varchar(150) NOT NULL,
  `texto` text NOT NULL,
  `estrellas` tinyint(4) NOT NULL DEFAULT 5,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `escuela_id`, `usuario_id`, `autor`, `texto`, `estrellas`, `fecha`) VALUES
(1, 20000100, 2, 'Adriel rivas martinez', 'Bastante buena la verdad eh', 5, '2026-10-08 11:46:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comparaciones`
--

CREATE TABLE `comparaciones` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `escuela_id` int(11) NOT NULL,
  `fecha_agregado` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `comparaciones`
--

INSERT INTO `comparaciones` (`id`, `usuario_id`, `escuela_id`, `fecha_agregado`) VALUES
(7, 1, 20000100, '2026-10-08 13:39:04'),
(8, 1, 20000102, '2026-10-08 13:39:04'),
(9, 1, 20000200, '2026-10-08 13:39:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuraciones_usuario`
--

CREATE TABLE `configuraciones_usuario` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `tema` varchar(20) DEFAULT 'claro',
  `notificaciones_email` tinyint(1) DEFAULT 1,
  `orientacion_preferida` varchar(100) DEFAULT NULL,
  `barrio_preferido` varchar(100) DEFAULT NULL,
  `texto_grande` tinyint(1) NOT NULL DEFAULT 0,
  `nivel_preferido` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuraciones_usuario`
--

INSERT INTO `configuraciones_usuario` (`id`, `usuario_id`, `tema`, `notificaciones_email`, `orientacion_preferida`, `barrio_preferido`, `texto_grande`, `nivel_preferido`) VALUES
(1, 1, 'claro', 1, NULL, NULL, 0, NULL),
(2, 2, 'claro', 0, NULL, NULL, 0, NULL),
(3, 3, 'claro', 1, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eduai_conversaciones`
--

CREATE TABLE `eduai_conversaciones` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `pregunta` text NOT NULL,
  `respuesta` text NOT NULL,
  `contexto` longtext DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escuelas`
--

CREATE TABLE `escuelas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `barrio` varchar(100) NOT NULL,
  `nivel_educativo` varchar(50) NOT NULL,
  `tipo_gestion` varchar(20) NOT NULL,
  `jornada` varchar(50) NOT NULL,
  `modalidad` varchar(100) DEFAULT NULL,
  `orientacion` varchar(100) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email_contacto` varchar(150) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `cuota` int(11) DEFAULT 0,
  `matricula` int(11) DEFAULT 0,
  `metodologia` varchar(100) DEFAULT NULL,
  `becas` tinyint(1) NOT NULL DEFAULT 0,
  `servicios` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

CREATE TABLE `favoritos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `escuela_id` int(11) NOT NULL,
  `fecha_guardado` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `favoritos`
--

INSERT INTO `favoritos` (`id`, `usuario_id`, `escuela_id`, `fecha_guardado`) VALUES
(1, 2, 20000100, '2026-10-08 11:46:17'),
(12, 1, 20000100, '2026-10-08 13:39:04'),
(13, 1, 20000102, '2026-10-08 13:39:04'),
(14, 1, 20000200, '2026-10-08 13:39:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(20) DEFAULT 'usuario',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `birth_year` smallint(6) DEFAULT NULL,
  `google_sub` varchar(255) DEFAULT NULL,
  `zona` varchar(100) DEFAULT NULL,
  `telefono` varchar(40) DEFAULT NULL,
  `direccion` varchar(190) DEFAULT NULL,
  `dni` varchar(30) DEFAULT NULL,
  `notif_email` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `rol`, `fecha_registro`, `birth_year`, `google_sub`, `zona`, `telefono`, `direccion`, `dni`, `notif_email`) VALUES
(1, 'Adriel Rivas Martinez', 'adrielr777@gmail.com', '$2y$10$1ywneluJexcy0ePjCtxkdujxK7703DgrpuhX8PRJetb.tOZPG8ppe', 'usuario', '2026-08-26 00:29:03', 2008, '102003750173384426893', 'Mataderos', '1154764648', 'Corvalan 2237', '48941798', 1),
(2, 'Adriel rivas martinez', 'adrielr122@gmail.com', '$2y$10$pCQt4pwKlhZ7.L.qczSwnOhwpS6ClTuo1b3Y8Q4pdE8L5f1e1kJ6G', 'usuario', '2026-10-05 22:23:12', 2008, '102283220468835978226', NULL, NULL, NULL, NULL, 0),
(3, 'NotDemonix_', 'notdemonix778@gmail.com', '$2y$10$z2kzUuGDO/pIMHqzUVlJFORjhhM8.95G5FBPF0h/oTLWJRjqo6yzS', 'usuario', '2026-10-08 01:09:19', 2008, '102594206680703713803', NULL, NULL, NULL, NULL, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_comentarios_escuela` (`escuela_id`),
  ADD KEY `idx_comentarios_usuario` (`usuario_id`);

--
-- Indices de la tabla `comparaciones`
--
ALTER TABLE `comparaciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_comparacion_usuario_escuela` (`usuario_id`,`escuela_id`),
  ADD KEY `idx_comparaciones_usuario` (`usuario_id`),
  ADD KEY `idx_comparaciones_escuela` (`escuela_id`);

--
-- Indices de la tabla `configuraciones_usuario`
--
ALTER TABLE `configuraciones_usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `eduai_conversaciones`
--
ALTER TABLE `eduai_conversaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_eduai_usuario_fecha` (`usuario_id`,`fecha`);

--
-- Indices de la tabla `escuelas`
--
ALTER TABLE `escuelas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_favorito_usuario_escuela` (`usuario_id`,`escuela_id`),
  ADD KEY `idx_favoritos_usuario` (`usuario_id`),
  ADD KEY `idx_favoritos_escuela` (`escuela_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `google_sub` (`google_sub`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `comparaciones`
--
ALTER TABLE `comparaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `configuraciones_usuario`
--
ALTER TABLE `configuraciones_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `eduai_conversaciones`
--
ALTER TABLE `eduai_conversaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `escuelas`
--
ALTER TABLE `escuelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_comentarios_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comparaciones`
--
ALTER TABLE `comparaciones`
  ADD CONSTRAINT `fk_comparaciones_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `configuraciones_usuario`
--
ALTER TABLE `configuraciones_usuario`
  ADD CONSTRAINT `configuraciones_usuario_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `eduai_conversaciones`
--
ALTER TABLE `eduai_conversaciones`
  ADD CONSTRAINT `fk_eduai_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `fk_favoritos_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
