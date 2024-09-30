-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-08-2023 a las 06:19:23
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `usuarios`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `alumno_id` int(3) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `edad` int(3) NOT NULL,
  `puntos` int(2) NOT NULL,
  `usuario_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`alumno_id`, `nombre`, `edad`, `puntos`, `usuario_id`) VALUES
(43, 'Fernando Bernal', 21, 7, 7),
(44, 'Camila Garcia', 28, 2, 7),
(45, 'Jorge Zarate', 65, 3, 7),
(46, 'Hermenegildo Abeldaño', 1, 5, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos_resultado`
--

CREATE TABLE `alumnos_resultado` (
  `alumno_id` int(3) NOT NULL,
  `resultado_id` int(3) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `edad` int(3) DEFAULT NULL,
  `puntos` int(2) NOT NULL,
  `usuario_id` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumnos_resultado`
--

INSERT INTO `alumnos_resultado` (`alumno_id`, `resultado_id`, `nombre`, `edad`, `puntos`, `usuario_id`) VALUES
(43, 4, 'Fernando Bernal', 21, 7, 7),
(44, 4, 'Camila Garcia', 28, 2, 7),
(45, 4, 'Jorge Zarate', 65, 3, 7),
(46, 4, 'Hermenegildo Abeldaño', 1, 5, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfrentamientos`
--

CREATE TABLE `enfrentamientos` (
  `enfrentamiento_id` int(3) NOT NULL,
  `ronda_id` int(3) NOT NULL,
  `num_enfrentamiento` int(3) NOT NULL,
  `alumno1_id` int(3) DEFAULT NULL,
  `alumno2_id` int(3) DEFAULT NULL,
  `usuario_id` int(3) NOT NULL,
  `ganador_id` int(3) DEFAULT NULL,
  `perdedor_id` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `enfrentamientos`
--

INSERT INTO `enfrentamientos` (`enfrentamiento_id`, `ronda_id`, `num_enfrentamiento`, `alumno1_id`, `alumno2_id`, `usuario_id`, `ganador_id`, `perdedor_id`) VALUES
(131, 108, 1, 43, 44, 7, 43, 44),
(132, 109, 1, 45, 46, 7, 46, 45),
(133, 110, 2, 43, 46, 7, 43, 46);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escuelas`
--

CREATE TABLE `escuelas` (
  `escuela_id` int(11) NOT NULL,
  `nombreEscuela` varchar(30) NOT NULL,
  `usuario_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escuela_alumno`
--

CREATE TABLE `escuela_alumno` (
  `escuela_id` int(11) NOT NULL,
  `alumno_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados_torneo`
--

CREATE TABLE `resultados_torneo` (
  `resultado_id` int(3) NOT NULL,
  `torneo_id` int(3) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `fecha` varchar(25) NOT NULL,
  `estado` varchar(16) NOT NULL,
  `usuario_id` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `resultados_torneo`
--

INSERT INTO `resultados_torneo` (`resultado_id`, `torneo_id`, `nombre`, `fecha`, `estado`, `usuario_id`) VALUES
(4, 40, 'chau', '2231-11-11', 'en curso', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rondas`
--

CREATE TABLE `rondas` (
  `ronda_id` int(3) NOT NULL,
  `torneo_id` int(3) NOT NULL,
  `numero` int(1) NOT NULL,
  `estado` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rondas`
--

INSERT INTO `rondas` (`ronda_id`, `torneo_id`, `numero`, `estado`) VALUES
(108, 40, 1, 'finalizada'),
(109, 40, 2, 'finalizada'),
(110, 40, 3, 'finalizada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneo`
--

CREATE TABLE `torneo` (
  `torneo_id` int(3) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `fecha` varchar(25) NOT NULL,
  `usuario_id` int(3) NOT NULL,
  `primer_lugar` int(3) DEFAULT NULL,
  `segundo_lugar` int(3) DEFAULT NULL,
  `estado` varchar(16) NOT NULL DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `torneo`
--

INSERT INTO `torneo` (`torneo_id`, `nombre`, `fecha`, `usuario_id`, `primer_lugar`, `segundo_lugar`, `estado`) VALUES
(40, 'chau', '2231-11-11', 7, 43, 46, 'en curso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(3) NOT NULL,
  `usuario` varchar(16) NOT NULL,
  `contraseña` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `usuario`, `contraseña`) VALUES
(7, 'Fer', '$2y$10$eF0vI.DDZMS1Jxtz.Km48eG6zb5WWugCttX3hkcExz6fGijChsvRe'),
(8, 'Caami', '$2y$10$ZqU11D5WQQMqTawP7srBc.CXLDhnjVCtvhqEZsZM9B.ATiUi5OOKS'),
(9, 'jorge123', '$2y$10$k/kfjuIxrMDJNOPuZxASzuBoIGUfeEjUQNRdDIXUoAXQWOKKgj.dq'),
(10, 'jorgezarate', '$2y$10$ENRL0e1twEYr5hV4t/oIMuB6zgVSrAu1K5pYt20dwaC4xdnbgatr2'),
(11, 'Cami12', '$2y$10$5iUNUmGzYpN15/Tb8v8YdehgvKJG594u4ZJjHq7MafAx1MRQI5ure'),
(12, 'Cami12', '$2y$10$pRvu3BAKUu3lekw976ivFObLFixk1agJ1cO5MSTqVFBsKfldPJoSu'),
(13, 'Picasso2', '$2y$10$MbIYkQQdf3jLpx9p4bQAce3wHYsuveuGIQCEtOMSpcak1KJTwS0Fe');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`alumno_id`);

--
-- Indices de la tabla `alumnos_resultado`
--
ALTER TABLE `alumnos_resultado`
  ADD PRIMARY KEY (`alumno_id`,`resultado_id`),
  ADD KEY `resultado_id` (`resultado_id`);

--
-- Indices de la tabla `enfrentamientos`
--
ALTER TABLE `enfrentamientos`
  ADD PRIMARY KEY (`enfrentamiento_id`),
  ADD KEY `ronda_id` (`ronda_id`);

--
-- Indices de la tabla `escuelas`
--
ALTER TABLE `escuelas`
  ADD PRIMARY KEY (`escuela_id`);

--
-- Indices de la tabla `resultados_torneo`
--
ALTER TABLE `resultados_torneo`
  ADD PRIMARY KEY (`resultado_id`);

--
-- Indices de la tabla `rondas`
--
ALTER TABLE `rondas`
  ADD PRIMARY KEY (`ronda_id`);

--
-- Indices de la tabla `torneo`
--
ALTER TABLE `torneo`
  ADD PRIMARY KEY (`torneo_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `alumno_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `enfrentamientos`
--
ALTER TABLE `enfrentamientos`
  MODIFY `enfrentamiento_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT de la tabla `escuelas`
--
ALTER TABLE `escuelas`
  MODIFY `escuela_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `resultados_torneo`
--
ALTER TABLE `resultados_torneo`
  MODIFY `resultado_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `rondas`
--
ALTER TABLE `rondas`
  MODIFY `ronda_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT de la tabla `torneo`
--
ALTER TABLE `torneo`
  MODIFY `torneo_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos_resultado`
--
ALTER TABLE `alumnos_resultado`
  ADD CONSTRAINT `alumnos_resultado_ibfk_1` FOREIGN KEY (`resultado_id`) REFERENCES `resultados_torneo` (`resultado_id`),
  ADD CONSTRAINT `alumnos_resultado_ibfk_2` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`alumno_id`);

--
-- Filtros para la tabla `enfrentamientos`
--
ALTER TABLE `enfrentamientos`
  ADD CONSTRAINT `enfrentamientos_ibfk_1` FOREIGN KEY (`ronda_id`) REFERENCES `rondas` (`ronda_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
