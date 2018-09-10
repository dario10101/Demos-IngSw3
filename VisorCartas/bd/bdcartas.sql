-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-09-2018 a las 08:15:59
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdcartas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cartas`
--

CREATE TABLE `cartas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_bin NOT NULL,
  `url_imagen` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `texto` text COLLATE utf8_bin NOT NULL,
  `nombre_corto` varchar(20) COLLATE utf8_bin NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `cartas`
--

INSERT INTO `cartas` (`id`, `nombre`, `url_imagen`, `texto`, `nombre_corto`, `usuario_id`) VALUES
(5, 'Ángel de esperanza', 'angel.jpg', 'El ángel de la esperanza trajo luz al pueblo de Waroburgo', 'angel', 1),
(6, 'Dragon Shivano', 'dragon.jpg', 'El Dragón destruyó Waroburgo hace 500 años y ahora ha despertado de su sueño...', 'dragón', 2),
(7, 'Bola de Fuego', 'fireball.jpg', 'La Bola de Fuego inflige daño a sus oponentes de 3 puntos', 'bola', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cartas_colores`
--

CREATE TABLE `cartas_colores` (
  `carta_id` int(11) NOT NULL,
  `colore_id` char(1) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `cartas_colores`
--

INSERT INTO `cartas_colores` (`carta_id`, `colore_id`) VALUES
(5, 'W'),
(6, 'R'),
(7, 'R');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colores`
--

CREATE TABLE `colores` (
  `id` char(1) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(10) COLLATE utf8_bin NOT NULL,
  `definicion1` varchar(20) COLLATE utf8_bin NOT NULL,
  `definicion2` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `colores`
--

INSERT INTO `colores` (`id`, `nombre`, `definicion1`, `definicion2`) VALUES
('B', 'Negro', 'Poder', 'Individuo'),
('G', 'Verde', 'Instinto', 'Naturaleza'),
('I', 'Incoloro', 'Vacío', 'Artefactos'),
('R', 'Rojo', 'Emoción', 'caos'),
('U', 'Azul', 'Conocimiento', 'Perfección'),
('W', 'Blanco', 'Paz', 'Comunidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_bin NOT NULL,
  `correo` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `password`) VALUES
(1, 'Luisa Fernanda Gómez', 'lfgomez@unicauca.edu.co', 'qwerty'),
(2, 'Edwin Rivera', 'erivera@unicauca.edu.co', 'qwerty');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cartas`
--
ALTER TABLE `cartas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_clave` (`usuario_id`);

--
-- Indices de la tabla `cartas_colores`
--
ALTER TABLE `cartas_colores`
  ADD PRIMARY KEY (`carta_id`,`colore_id`),
  ADD KEY `color_clave` (`colore_id`);

--
-- Indices de la tabla `colores`
--
ALTER TABLE `colores`
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
-- AUTO_INCREMENT de la tabla `cartas`
--
ALTER TABLE `cartas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cartas`
--
ALTER TABLE `cartas`
  ADD CONSTRAINT `usuario_clave` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cartas_colores`
--
ALTER TABLE `cartas_colores`
  ADD CONSTRAINT `carta_clave` FOREIGN KEY (`carta_id`) REFERENCES `cartas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `color_clave` FOREIGN KEY (`colore_id`) REFERENCES `colores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
