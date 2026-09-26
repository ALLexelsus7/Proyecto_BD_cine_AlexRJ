-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-12-2025 a las 19:53:04
-- Versión del servidor: 10.1.9-MariaDB
-- Versión de PHP: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cine`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener_Reparto_Pelicula` (IN `p_id_pelicula` INT)  BEGIN
    SELECT 
        p.titulo, 
        a.nombre AS actor, 
        r.rol, 
        r.salario
    FROM reparto r
    JOIN actores a ON r.id_actor = a.id_actor
    JOIN peliculas p ON r.id_pelicula = p.id_pelicula
    WHERE p.id_pelicula = p_id_pelicula;
END$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `Calificar_Presupuesto` (`monto` DECIMAL(15,2)) RETURNS VARCHAR(20) CHARSET utf8 BEGIN
    DECLARE nivel VARCHAR(20);
    IF monto > 11000 THEN
        SET nivel = 'Alto Presupuesto';
    ELSEIF monto BETWEEN 9000 AND 11000 THEN
        SET nivel = 'Presupuesto Medio';
    ELSE
        SET nivel = 'Bajo Presupuesto';
    END IF;
    RETURN nivel;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actores`
--

CREATE TABLE `actores` (
  `id_actor` int(2) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `nacionalidad` varchar(50) NOT NULL,
  `fnac` date NOT NULL COMMENT 'Fecha de Nacimiento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `actores`
--

INSERT INTO `actores` (`id_actor`, `nombre`, `nacionalidad`, `fnac`) VALUES
(1, 'Eugenio Derbez', 'Mexicana', '1961-09-02'),
(2, 'Paquita La del Barrio', 'Mexicana', '1947-05-02'),
(3, 'Jim Carrey', 'Canadiense', '1962-01-17'),
(4, 'Eddie Murphy', 'Estadounidense', '1961-05-03'),
(5, 'Jack Black', 'Estadounidense', '1969-08-28'),
(9, 'Ryan Reynolds', 'Canadiense', '1976-10-23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `directores`
--

CREATE TABLE `directores` (
  `id_director` int(2) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `nacionalidad` varchar(50) NOT NULL,
  `fnac` date NOT NULL COMMENT 'Fecha de Nacimiento',
  `premios_ganados` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `directores`
--

INSERT INTO `directores` (`id_director`, `nombre`, `nacionalidad`, `fnac`, `premios_ganados`) VALUES
(1, 'Quentin Tarantino', 'Estadounidense', '1963-03-27', 11),
(2, 'Christopher Nolan', 'Britanica', '1970-07-30', 15),
(3, 'Stanley Kubrick', 'Britanica', '1928-06-08', 23),
(4, 'Steven Spielberg', 'Estadounidense', '1946-12-18', 13),
(5, 'Guillermo del Toro', 'Mexicana', '1964-10-09', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE `peliculas` (
  `id_pelicula` int(2) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `anio_estreno` int(4) NOT NULL,
  `duracion_min` int(3) NOT NULL,
  `presupuesto` decimal(15,2) NOT NULL,
  `sinopsis` text NOT NULL,
  `id_director` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`id_pelicula`, `titulo`, `anio_estreno`, `duracion_min`, `presupuesto`, `sinopsis`, `id_director`) VALUES
(1, 'Interestelar', 2014, 169, '13587.42', 'Gracias a un descubrimiento, un grupo de científicos y exploradores, encabezados por Cooper, se embarcan en un viaje espacial para encontrar un lugar con las condiciones necesarias para reemplazar a la Tierra y comenzar una nueva vida allí.', 2),
(2, 'Bastardos sin gloria', 2009, 153, '9352.78', 'Es el primer año de la ocupación alemana de Francia. El oficial aliado, teniente Aldo Raine, ensambla un equipo de soldados judíos para cometer actos violentos en contra de los nazis, incluyendo la toma de cabelleras. Él y sus hombres unen fuerzas con Bridget von Hammersmark, una actriz alemana y agente encubierto, para derrocar a los líderes del Tercer Reich. Sus destinos convergen con la dueña de teatro Shosanna Dreyfus, quien busca vengar la ejecución de su familia.', 1),
(3, 'Frankenstein', 2025, 150, '11123.20', 'Frankenstein es una película de ciencia ficción gótica estadounidense de 2025​ escrita y dirigida por Guillermo del Toro, basada en la novela homónima de Mary Shelley de 1818.', 5),
(4, 'El resplandor', 1980, 143, '9352.90', 'Un escritor enloquece mientras trabaja como cuidador, junto con su esposa e hijo clarividente, en un hotel de Colorado que está bloqueado por la nieve.', 3),
(5, 'E.T, el extraterrestre', 1982, 120, '8975.23', 'Elliott es un niño de nueve años que se encuentra con un extraterrestre y decide esconderlo en su casa para protegerlo. Contará con la ayuda de su pequeña hermana y su hermano mayor para mantener el secreto y juntos vivirán una aventura inolvidable.', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reparto`
--

CREATE TABLE `reparto` (
  `id_reparto` int(2) NOT NULL,
  `rol` varchar(50) NOT NULL COMMENT 'Su puesto o papel en la pelicula',
  `salario` decimal(12,2) NOT NULL,
  `id_pelicula` int(2) NOT NULL,
  `id_actor` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reparto`
--

INSERT INTO `reparto` (`id_reparto`, `rol`, `salario`, `id_pelicula`, `id_actor`) VALUES
(1, 'Monstruo', '1000000.12', 3, 1),
(2, 'Soldado Aleman', '23000.11', 2, 2),
(3, 'Extraterrestre', '8000000.01', 5, 3),
(4, 'Astronauta', '5000000.23', 1, 4),
(5, 'Loquito del Hacha', '6000000.43', 4, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resenias`
--

CREATE TABLE `resenias` (
  `id_resenia` int(2) NOT NULL,
  `autor` varchar(50) NOT NULL,
  `calificacion` int(2) NOT NULL COMMENT 'de 1 a 10',
  `fecha` date NOT NULL COMMENT 'De publicacion',
  `id_pelicula` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `resenias`
--

INSERT INTO `resenias` (`id_resenia`, `autor`, `calificacion`, `fecha`, `id_pelicula`) VALUES
(1, 'Miky', 10, '2015-01-02', 1),
(2, 'Pedrin', 9, '2010-01-08', 2),
(3, 'Patrick', 9, '2025-12-08', 3),
(4, 'Fabiola', 8, '1989-04-01', 4),
(5, 'Stacy', 10, '1986-11-09', 5);

--
-- Disparadores `resenias`
--
DELIMITER $$
CREATE TRIGGER `Validar_Calificacion_Resenia` BEFORE INSERT ON `resenias` FOR EACH ROW BEGIN
    IF NEW.calificacion < 1 OR NEW.calificacion > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La calificación debe estar entre 1 y 10';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_actores_sesentas`
--
CREATE TABLE `vista_actores_sesentas` (
`nombre` varchar(50)
,`nacionalidad` varchar(50)
,`fnac` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_catalogo_general`
--
CREATE TABLE `vista_catalogo_general` (
`id_pelicula` int(2)
,`titulo_mayusculas` varchar(50)
,`director` varchar(50)
,`anio_estreno` int(4)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_costo_por_minuto`
--
CREATE TABLE `vista_costo_por_minuto` (
`titulo` varchar(50)
,`duracion_min` int(3)
,`presupuesto` decimal(15,2)
,`costo_por_minuto` decimal(16,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_directores_sin_critica`
--
CREATE TABLE `vista_directores_sin_critica` (
`nombre` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_nomina_neta`
--
CREATE TABLE `vista_nomina_neta` (
`rol` varchar(50)
,`nombre` varchar(50)
,`salario_bruto` decimal(12,2)
,`retencion_impuestos` decimal(15,4)
,`salario_neto` decimal(16,4)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_peliculas_costosas`
--
CREATE TABLE `vista_peliculas_costosas` (
`titulo` varchar(50)
,`presupuesto` decimal(15,2)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_actores_sesentas`
--
DROP TABLE IF EXISTS `vista_actores_sesentas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_actores_sesentas`  AS  select `actores`.`nombre` AS `nombre`,`actores`.`nacionalidad` AS `nacionalidad`,`actores`.`fnac` AS `fnac` from `actores` where (`actores`.`fnac` between '1960-01-01' and '1969-12-31') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_catalogo_general`
--
DROP TABLE IF EXISTS `vista_catalogo_general`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_catalogo_general`  AS  select `p`.`id_pelicula` AS `id_pelicula`,ucase(`p`.`titulo`) AS `titulo_mayusculas`,`d`.`nombre` AS `director`,`p`.`anio_estreno` AS `anio_estreno` from (`peliculas` `p` join `directores` `d` on((`p`.`id_director` = `d`.`id_director`))) order by `p`.`anio_estreno` desc ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_costo_por_minuto`
--
DROP TABLE IF EXISTS `vista_costo_por_minuto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_costo_por_minuto`  AS  select `peliculas`.`titulo` AS `titulo`,`peliculas`.`duracion_min` AS `duracion_min`,`peliculas`.`presupuesto` AS `presupuesto`,round((`peliculas`.`presupuesto` / `peliculas`.`duracion_min`),2) AS `costo_por_minuto` from `peliculas` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_directores_sin_critica`
--
DROP TABLE IF EXISTS `vista_directores_sin_critica`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_directores_sin_critica`  AS  select `directores`.`nombre` AS `nombre` from `directores` where (not(`directores`.`id_director` in (select distinct `p`.`id_director` from (`peliculas` `p` join `resenias` `r` on((`p`.`id_pelicula` = `r`.`id_pelicula`)))))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_nomina_neta`
--
DROP TABLE IF EXISTS `vista_nomina_neta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_nomina_neta`  AS  select `r`.`rol` AS `rol`,`a`.`nombre` AS `nombre`,`r`.`salario` AS `salario_bruto`,(`r`.`salario` * 0.16) AS `retencion_impuestos`,(`r`.`salario` - (`r`.`salario` * 0.16)) AS `salario_neto` from (`reparto` `r` join `actores` `a` on((`r`.`id_actor` = `a`.`id_actor`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_peliculas_costosas`
--
DROP TABLE IF EXISTS `vista_peliculas_costosas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_peliculas_costosas`  AS  select `peliculas`.`titulo` AS `titulo`,`peliculas`.`presupuesto` AS `presupuesto` from `peliculas` where (`peliculas`.`presupuesto` > (select avg(`peliculas`.`presupuesto`) from `peliculas`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actores`
--
ALTER TABLE `actores`
  ADD PRIMARY KEY (`id_actor`);

--
-- Indices de la tabla `directores`
--
ALTER TABLE `directores`
  ADD PRIMARY KEY (`id_director`);

--
-- Indices de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`id_pelicula`),
  ADD KEY `id_director` (`id_director`);

--
-- Indices de la tabla `reparto`
--
ALTER TABLE `reparto`
  ADD PRIMARY KEY (`id_reparto`),
  ADD KEY `id_pelicula` (`id_pelicula`),
  ADD KEY `id_actor` (`id_actor`);

--
-- Indices de la tabla `resenias`
--
ALTER TABLE `resenias`
  ADD PRIMARY KEY (`id_resenia`),
  ADD KEY `id_pelicula` (`id_pelicula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actores`
--
ALTER TABLE `actores`
  MODIFY `id_actor` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `directores`
--
ALTER TABLE `directores`
  MODIFY `id_director` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  MODIFY `id_pelicula` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `reparto`
--
ALTER TABLE `reparto`
  MODIFY `id_reparto` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `resenias`
--
ALTER TABLE `resenias`
  MODIFY `id_resenia` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD CONSTRAINT `peliculas_ibfk_1` FOREIGN KEY (`id_director`) REFERENCES `directores` (`id_director`);

--
-- Filtros para la tabla `reparto`
--
ALTER TABLE `reparto`
  ADD CONSTRAINT `reparto_ibfk_2` FOREIGN KEY (`id_actor`) REFERENCES `actores` (`id_actor`),
  ADD CONSTRAINT `reparto_ibfk_3` FOREIGN KEY (`id_pelicula`) REFERENCES `peliculas` (`id_pelicula`);

--
-- Filtros para la tabla `resenias`
--
ALTER TABLE `resenias`
  ADD CONSTRAINT `resenias_ibfk_1` FOREIGN KEY (`id_pelicula`) REFERENCES `peliculas` (`id_pelicula`);

DELIMITER $$
--
-- Eventos
--
CREATE DEFINER=`root`@`localhost` EVENT `Limpieza_Resenias_Antiguas` ON SCHEDULE EVERY 1 WEEK STARTS '2025-12-09 11:49:15' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    DELETE FROM resenias WHERE fecha < '1950-01-01';
END$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
