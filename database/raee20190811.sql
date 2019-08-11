-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-08-2019 a las 20:04:48
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `raee`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcargoempleado`
--

CREATE TABLE `tblcargoempleado` (
  `codCargoEmple` int(3) NOT NULL,
  `cargoEmple` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblcargoempleado`
--

INSERT INTO `tblcargoempleado` (`codCargoEmple`, `cargoEmple`) VALUES
(4, 'Aprendiz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblciudad`
--

CREATE TABLE `tblciudad` (
  `codCiud` int(4) NOT NULL,
  `nomCiud` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblciudad`
--

INSERT INTO `tblciudad` (`codCiud`, `nomCiud`) VALUES
(4, 'Rionegro'),
(5, 'Marinilla'),
(6, 'La ceja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcomponenteresiduo`
--

CREATE TABLE `tblcomponenteresiduo` (
  `codCompoResi` int(4) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `codTipoResiduo` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblcomponenteresiduo`
--

INSERT INTO `tblcomponenteresiduo` (`codCompoResi`, `nombre`, `codTipoResiduo`) VALUES
(1, 'Memoria RAM', 7),
(2, 'Motor', 6),
(3, 'Disco Duro', 7),
(4, 'Bobina', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcomponenteresiduodesensamble`
--

CREATE TABLE `tblcomponenteresiduodesensamble` (
  `consDesen` int(4) NOT NULL,
  `codCompoResi` int(4) NOT NULL,
  `cantidad` int(3) NOT NULL,
  `observacion` varchar(1000) DEFAULT NULL,
  `cantidadDisponible` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblcomponenteresiduodesensamble`
--

INSERT INTO `tblcomponenteresiduodesensamble` (`consDesen`, `codCompoResi`, `cantidad`, `observacion`, `cantidadDisponible`) VALUES
(3, 1, 4, '', 2),
(3, 2, 4, '', 4),
(3, 3, 2, 'bueno', 0),
(4, 1, 3, '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblconfiguracion`
--

CREATE TABLE `tblconfiguracion` (
  `codigo` int(5) NOT NULL,
  `clave` varchar(200) NOT NULL,
  `valor` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblconfiguracion`
--

INSERT INTO `tblconfiguracion` (`codigo`, `clave`, `valor`) VALUES
(1, 'RutaDB', 'C:/xampp/htdocs/raee/backup/');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldesensamble`
--

CREATE TABLE `tbldesensamble` (
  `consDesen` int(4) NOT NULL,
  `fechaDesen` date NOT NULL,
  `consRecibo` int(4) NOT NULL,
  `codResi` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbldesensamble`
--

INSERT INTO `tbldesensamble` (`consDesen`, `fechaDesen`, `consRecibo`, `codResi`) VALUES
(1, '2018-10-04', 1, 10),
(2, '2018-10-04', 2, 10),
(3, '2018-10-20', 4, 10),
(4, '2018-10-20', 4, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblempleado`
--

CREATE TABLE `tblempleado` (
  `docEmple` varchar(18) NOT NULL,
  `nomEmple` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `apeEmple` varchar(40) NOT NULL,
  `emailEmple` varchar(50) DEFAULT NULL,
  `telFijoEmple` varchar(20) DEFAULT NULL,
  `telMovilEmple` varchar(20) DEFAULT NULL,
  `codCarEmple` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblempleado`
--

INSERT INTO `tblempleado` (`docEmple`, `nomEmple`, `apeEmple`, `emailEmple`, `telFijoEmple`, `telMovilEmple`, `codCarEmple`) VALUES
('1007309580', 'Jhon Ferley', 'Parra Giraldo', 'jhonferley18@gmail.com', '', '', 4),
('1007316454', 'Yurley Alejandra', 'Gallego', 'yagallego45@misena.edu.co', '', '3146931280', 4),
('1007586425', 'Carlos', 'Sanchez', 'Carlos@gmail.com', '', '', 4),
('123456', 'Juan', 'Garcia', 'juan@gmail.com', '', '', 4),
('987432984732', 'Armando', 'Paredes', 'jhkg@gmail.com', '', '', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblempleadodesensamble`
--

CREATE TABLE `tblempleadodesensamble` (
  `consDesen` int(4) NOT NULL,
  `docEmple` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblempleadodesensamble`
--

INSERT INTO `tblempleadodesensamble` (`consDesen`, `docEmple`) VALUES
(3, '1007586425'),
(4, '1007316454');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblperfil`
--

CREATE TABLE `tblperfil` (
  `codPerfil` int(3) NOT NULL,
  `nomPerfil` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblperfil`
--

INSERT INTO `tblperfil` (`codPerfil`, `nomPerfil`) VALUES
(4, 'Administrador'),
(5, 'Operario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblpersona`
--

CREATE TABLE `tblpersona` (
  `docPersona` varchar(18) NOT NULL,
  `nomPerso` varchar(40) NOT NULL,
  `apePerso` varchar(30) NOT NULL,
  `direcPerso` varchar(60) NOT NULL,
  `ciudad` int(4) NOT NULL,
  `emailPerso` varchar(50) DEFAULT NULL,
  `telFijoPerso` varchar(20) DEFAULT NULL,
  `telmovilPerso` varchar(20) NOT NULL,
  `codTipoPersona` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblpersona`
--

INSERT INTO `tblpersona` (`docPersona`, `nomPerso`, `apePerso`, `direcPerso`, `ciudad`, `emailPerso`, `telFijoPerso`, `telmovilPerso`, `codTipoPersona`) VALUES
('356332', 'Yulieth', 'Alvarez', 'cra 56 num 65 54', 4, 'jjjj@gmail.com', '', '45545646', 4),
('36452456', 'Julian andres ', 'Perez', 'cra 45 num 85 25', 5, 'fullnet24@vfemail.net', '', '3542241245', 3),
('56422588', 'Karen', 'Aguirre', 'cra 12 num 45 25', 6, 'karen@gmail.com', '', '45654652', 4),
('675865', 'Natalia', 'Arango', 'cra 45-34', 5, 'jhkg@gmail.com', '', '3543634', 4),
('687687', 'Pacho', 'Gil', 'cra 45-34', 5, 'jhkg@gmail.com', '', '6764754', 3),
('98359738658', 'Juan', 'Perez', 'cra 34 num 34-23', 5, 'jp@gmail.co', '', '464564', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblrecibo`
--

CREATE TABLE `tblrecibo` (
  `consRecibo` int(4) NOT NULL,
  `fecha` date NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `docProveedor` varchar(18) NOT NULL,
  `docEmpleado` varchar(18) NOT NULL,
  `pesoTotal` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblrecibo`
--

INSERT INTO `tblrecibo` (`consRecibo`, `fecha`, `estado`, `docProveedor`, `docEmpleado`, `pesoTotal`) VALUES
(1, '2018-10-02', 1, '56422588', '1007309580', '25.52'),
(2, '2018-10-02', 1, '675865', '1007309580', '23.00'),
(3, '2018-10-02', 1, '56422588', '1007309580', '21.00'),
(4, '2018-10-20', 1, '356332', '1007586425', '20.00'),
(5, '2018-10-20', 1, '356332', '1007309580', '45.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblreciboresiduo`
--

CREATE TABLE `tblreciboresiduo` (
  `consRecibo` int(4) NOT NULL,
  `codResi` int(3) NOT NULL,
  `cantidad` int(3) NOT NULL,
  `observacion` varchar(1000) DEFAULT NULL,
  `codUbicacion` int(2) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `cantidadDisponible` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblreciboresiduo`
--

INSERT INTO `tblreciboresiduo` (`consRecibo`, `codResi`, `cantidad`, `observacion`, `codUbicacion`, `estado`, `cantidadDisponible`) VALUES
(4, 8, 4, '', 4, 1, 4),
(4, 9, 2, 'buenos', 6, 1, 1),
(4, 10, 1, '', 5, 1, 0),
(5, 11, 3, '', 6, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblresiduo`
--

CREATE TABLE `tblresiduo` (
  `codResi` int(3) NOT NULL,
  `nomResi` varchar(40) NOT NULL,
  `codTipoResiduo` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblresiduo`
--

INSERT INTO `tblresiduo` (`codResi`, `nomResi`, `codTipoResiduo`) VALUES
(7, 'Motor', 6),
(8, 'Televisor', 7),
(9, 'Portatil', 7),
(10, 'Computadora Mesa', 7),
(11, 'Toner', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblsalida`
--

CREATE TABLE `tblsalida` (
  `consSalida` int(8) NOT NULL,
  `fechaSalida` date NOT NULL,
  `pesoTotal` decimal(6,2) NOT NULL,
  `archivo` varchar(1500) DEFAULT NULL,
  `docEmple` varchar(18) NOT NULL,
  `docCliente` varchar(18) NOT NULL,
  `codTipoSalida` int(3) NOT NULL,
  `observacion` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblsalida`
--

INSERT INTO `tblsalida` (`consSalida`, `fechaSalida`, `pesoTotal`, `archivo`, `docEmple`, `docCliente`, `codTipoSalida`, `observacion`) VALUES
(1, '2018-09-19', '4.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(2, '2018-09-19', '55.00', 'msdia80.dll', '1007309580', '687687', 1, ''),
(3, '2018-09-19', '54.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(4, '2018-09-17', '45.00', 'msdia80.dll', '1007309580', '36452456', 1, ''),
(5, '2018-09-19', '454.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(6, '2018-09-18', '545.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(7, '2018-09-19', '45.00', 'msdia80.dll', '1007309580', '36452456', 1, ''),
(8, '2018-09-19', '78.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(9, '2018-09-19', '45.00', 'msdia80.dll', '1007309580', '36452456', 1, ''),
(10, '2018-09-18', '45.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(11, '2018-09-19', '45.00', 'VisualBasicPowerPacks3Setup.exe', '1007309580', '36452456', 1, ''),
(12, '2018-09-19', '4745.00', 'VisualBasicPowerPacks3Setup.exe', '1007309580', '36452456', 1, ''),
(13, '2018-09-17', '54.00', 'VisualBasicPowerPacks3Setup.exe', '1007309580', '687687', 1, ''),
(14, '2018-09-19', '4464.00', 'VisualBasicPowerPacks3Setup.exe', '1007309580', '36452456', 2, ''),
(15, '2018-09-19', '564.00', 'VisualBasicPowerPacks3Setup.exe', '1007309580', '36452456', 2, ''),
(16, '2018-09-17', '45.00', 'msdia80.dll', '1007309580', '36452456', 1, ''),
(17, '2018-09-17', '54.00', 'VisualBasicPowerPacks3Setup.exe', '1007309580', '687687', 1, ''),
(18, '2018-09-18', '545.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(19, '2018-09-18', '45.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(20, '2018-09-19', '4.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(21, '2018-09-19', '55.00', 'msdia80.dll', '1007309580', '687687', 1, ''),
(22, '2018-09-19', '54.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(23, '2018-09-19', '454.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(24, '2018-09-19', '45.00', 'msdia80.dll', '1007309580', '36452456', 1, ''),
(25, '2018-09-19', '78.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(26, '2018-09-19', '45.00', 'msdia80.dll', '1007309580', '36452456', 1, ''),
(27, '2018-09-19', '45.00', 'VisualBasicPowerPacks3Setup.exe', '1007309580', '36452456', 1, ''),
(28, '2018-09-19', '4745.00', 'VisualBasicPowerPacks3Setup.exe', '1007309580', '36452456', 1, ''),
(29, '2018-09-19', '4464.00', 'VisualBasicPowerPacks3Setup.exe', '1007309580', '36452456', 2, ''),
(30, '2018-09-19', '564.00', 'VisualBasicPowerPacks3Setup.exe', '1007309580', '36452456', 2, ''),
(31, '2018-09-19', '4.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(32, '2018-09-19', '55.00', 'msdia80.dll', '1007309580', '687687', 1, ''),
(33, '2018-09-19', '54.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(34, '2018-09-17', '45.00', 'msdia80.dll', '1007309580', '36452456', 1, ''),
(35, '2018-09-19', '454.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(36, '2018-09-18', '545.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(37, '2018-09-19', '45.00', 'msdia80.dll', '1007309580', '36452456', 1, ''),
(38, '2018-09-19', '78.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(39, '2018-09-19', '45.00', 'msdia80.dll', '1007309580', '36452456', 1, ''),
(40, '2018-09-18', '45.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(41, '2018-09-19', '45.00', 'VisualBasicPowerPacks3Setup.exe', '1007309580', '36452456', 1, ''),
(42, '2018-09-19', '4745.00', 'VisualBasicPowerPacks3Setup.exe', '1007309580', '36452456', 1, ''),
(43, '2018-09-17', '54.00', 'VisualBasicPowerPacks3Setup.exe', '1007309580', '687687', 1, ''),
(44, '2018-09-19', '4464.00', 'VisualBasicPowerPacks3Setup.exe', '1007309580', '36452456', 2, ''),
(45, '2018-09-19', '564.00', 'VisualBasicPowerPacks3Setup.exe', '1007309580', '36452456', 2, ''),
(46, '2018-09-17', '45.00', 'msdia80.dll', '1007309580', '36452456', 1, ''),
(47, '2018-09-17', '54.00', 'VisualBasicPowerPacks3Setup.exe', '1007309580', '687687', 1, ''),
(48, '2018-09-18', '545.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(49, '2018-09-18', '45.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(50, '2018-09-19', '4.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(51, '2018-09-19', '55.00', 'msdia80.dll', '1007309580', '687687', 1, ''),
(52, '2018-09-19', '54.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(53, '2018-09-19', '454.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(54, '2018-09-19', '45.00', 'msdia80.dll', '1007309580', '36452456', 1, ''),
(55, '2018-09-19', '78.00', 'msdia80.dll', '1007309580', '36452456', 2, ''),
(56, '2018-09-19', '45.00', 'msdia80.dll', '1007309580', '36452456', 1, ''),
(57, '2018-09-19', '45.00', 'VisualBasicPowerPacks3Setup.exe', '1007309580', '36452456', 1, ''),
(58, '2018-09-19', '4745.00', 'VisualBasicPowerPacks3Setup.exe', '1007309580', '36452456', 1, ''),
(59, '2018-09-19', '4464.00', 'VisualBasicPowerPacks3Setup.exe', '1007309580', '36452456', 2, ''),
(60, '2018-09-19', '564.00', 'VisualBasicPowerPacks3Setup.exe', '1007309580', '36452456', 2, ''),
(61, '2018-09-23', '32.50', '', '1007309580', '36452456', 1, ''),
(62, '2018-10-04', '45.00', '', '1007309580', '36452456', 2, 'fguyfhj'),
(63, '2018-10-04', '8545.00', 'Captura de pantalla (13).png', '1007309580', '36452456', 1, 'jhkjh'),
(64, '2018-10-04', '12.00', 'Captura de pantalla (15).png', '1007309580', '36452456', 2, 'vghfg'),
(65, '2018-10-04', '45.00', 'Captura de pantalla (14).png', '1007309580', '36452456', 2, 'd'),
(66, '2018-10-04', '45.00', 'Captura de pantalla (15).png', '1007309580', '36452456', 1, 'fg'),
(67, '2018-10-04', '454.00', 'Captura de pantalla (15).png', '1007309580', '36452456', 1, 'dfghf'),
(68, '2018-10-04', '564.00', 'Captura de pantalla (14).png', '1007309580', '36452456', 1, ''),
(69, '2018-10-04', '4.00', 'Captura de pantalla (15).png', '1007309580', '687687', 2, ''),
(70, '2018-10-20', '65.00', 'estado de cuenta-0012231036964723.pdf', '1007586425', '98359738658', 2, ''),
(71, '2018-10-20', '34.00', '', '1007309580', '36452456', 3, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblsalidacomponente`
--

CREATE TABLE `tblsalidacomponente` (
  `cons_salida` int(8) NOT NULL,
  `consDesen` int(4) NOT NULL,
  `codCompoResi` int(4) NOT NULL,
  `cantidad` int(3) NOT NULL,
  `observacion` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblsalidacomponente`
--

INSERT INTO `tblsalidacomponente` (`cons_salida`, `consDesen`, `codCompoResi`, `cantidad`, `observacion`) VALUES
(70, 3, 3, 2, ''),
(70, 4, 1, 2, ''),
(71, 3, 1, 2, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblsalidaresiduo`
--

CREATE TABLE `tblsalidaresiduo` (
  `consSalida` int(8) NOT NULL,
  `consRecibo` int(4) NOT NULL,
  `codResi` int(3) NOT NULL,
  `cantidad` int(3) NOT NULL,
  `observacion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblsalidaresiduo`
--

INSERT INTO `tblsalidaresiduo` (`consSalida`, `consRecibo`, `codResi`, `cantidad`, `observacion`) VALUES
(71, 5, 11, 2, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbltipopersona`
--

CREATE TABLE `tbltipopersona` (
  `codTipoPersona` int(3) NOT NULL,
  `nomTipoPer` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbltipopersona`
--

INSERT INTO `tbltipopersona` (`codTipoPersona`, `nomTipoPer`) VALUES
(3, 'Gestor externo'),
(4, 'Proveedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbltiporesiduo`
--

CREATE TABLE `tbltiporesiduo` (
  `codTipoResi` int(3) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbltiporesiduo`
--

INSERT INTO `tbltiporesiduo` (`codTipoResi`, `nombre`) VALUES
(6, 'Eléctrico'),
(7, 'Electrónico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbltiposalida`
--

CREATE TABLE `tbltiposalida` (
  `codTipoSalida` int(3) NOT NULL,
  `nomTipoSal` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbltiposalida`
--

INSERT INTO `tbltiposalida` (`codTipoSalida`, `nomTipoSal`) VALUES
(1, 'Donación'),
(2, 'Reutilización'),
(3, 'Desecho');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblubicacion`
--

CREATE TABLE `tblubicacion` (
  `codUbicacion` int(2) NOT NULL,
  `ubicacion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblubicacion`
--

INSERT INTO `tblubicacion` (`codUbicacion`, `ubicacion`) VALUES
(4, 'Bodega 1'),
(5, 'Bodega 2'),
(6, 'Bodega 3'),
(7, 'Bodega 4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblusuario`
--

CREATE TABLE `tblusuario` (
  `codUsu` int(3) NOT NULL,
  `docEmple` varchar(18) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `codPerfil` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblusuario`
--

INSERT INTO `tblusuario` (`codUsu`, `docEmple`, `clave`, `codPerfil`) VALUES
(21, '1007316454', '$2y$12$ArWUQxPH1LHcnlfzx8ldoOaB1HBd5Nljlt52n4qh8dqaKfgDKNG/.', 4),
(22, '1007309580', '$2y$12$tvjdx021P4qskf73TFmZI.8XIO4BAwJOJt7.kHmT4dgEOiNd9B4Xe', 4),
(23, '1007586425', '$2y$12$gCkkVohCLNhV3efwtl18CuPqw5UWAWPQsZPdbiaeUw2RUE2q7XWaO', 5),
(24, '987432984732', '$2y$12$P/m3NZSvYQBc2mtSzt/ArefPlv./AQm2Vk8H/5HIlHkIh4dTpIEji', 4),
(25, '123456', '$2y$12$el4EeDdlPNQeYydsO7D5aeRaUv/Wt5gT2whCz4e3k/Z32jmUDgdFy', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblcargoempleado`
--
ALTER TABLE `tblcargoempleado`
  ADD PRIMARY KEY (`codCargoEmple`);

--
-- Indices de la tabla `tblciudad`
--
ALTER TABLE `tblciudad`
  ADD PRIMARY KEY (`codCiud`);

--
-- Indices de la tabla `tblcomponenteresiduo`
--
ALTER TABLE `tblcomponenteresiduo`
  ADD PRIMARY KEY (`codCompoResi`),
  ADD KEY `fk_tbl_componeteresiduo_tbl_tiporesiduo1_idx` (`codTipoResiduo`);

--
-- Indices de la tabla `tblcomponenteresiduodesensamble`
--
ALTER TABLE `tblcomponenteresiduodesensamble`
  ADD PRIMARY KEY (`consDesen`,`codCompoResi`),
  ADD KEY `fk_tbl_componenteresiduodesensamble_tbl_componeteresiduo1_idx` (`codCompoResi`);

--
-- Indices de la tabla `tblconfiguracion`
--
ALTER TABLE `tblconfiguracion`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `tbldesensamble`
--
ALTER TABLE `tbldesensamble`
  ADD PRIMARY KEY (`consDesen`),
  ADD KEY `fk_tbl_desensamble_tbl_recibo1_idx` (`consRecibo`),
  ADD KEY `fk_tbl_desensamble_tbl_residuo1_idx` (`codResi`);

--
-- Indices de la tabla `tblempleado`
--
ALTER TABLE `tblempleado`
  ADD PRIMARY KEY (`docEmple`),
  ADD KEY `fk_tbl_empleado_tbl_cargo1_idx` (`codCarEmple`);

--
-- Indices de la tabla `tblempleadodesensamble`
--
ALTER TABLE `tblempleadodesensamble`
  ADD PRIMARY KEY (`consDesen`,`docEmple`),
  ADD KEY `fk_tbl_empleadodesensamble_tbl_empleado1_idx` (`docEmple`),
  ADD KEY `fk_tbl_empleadodesensamble_tbl_desensamble1_idx` (`consDesen`);

--
-- Indices de la tabla `tblperfil`
--
ALTER TABLE `tblperfil`
  ADD PRIMARY KEY (`codPerfil`);

--
-- Indices de la tabla `tblpersona`
--
ALTER TABLE `tblpersona`
  ADD PRIMARY KEY (`docPersona`),
  ADD KEY `fk_tbl_persona_tbl_tipopersona1_idx` (`codTipoPersona`),
  ADD KEY `fk_tbl_persona_tbl_ciudad1_idx` (`ciudad`);

--
-- Indices de la tabla `tblrecibo`
--
ALTER TABLE `tblrecibo`
  ADD PRIMARY KEY (`consRecibo`),
  ADD KEY `fk_tbl_recibo_tbl_persona1_idx` (`docProveedor`),
  ADD KEY `fk_tbl_recibo_tbl_empleado1_idx` (`docEmpleado`);

--
-- Indices de la tabla `tblreciboresiduo`
--
ALTER TABLE `tblreciboresiduo`
  ADD PRIMARY KEY (`consRecibo`,`codResi`),
  ADD KEY `fk_tbl_reciboresiduo_tbl_ubicacion_idx` (`codUbicacion`),
  ADD KEY `fk_tbl_reciboresiduo_tbl_residuo1_idx` (`codResi`),
  ADD KEY `fk_tbl_reciboresiduo_tbl_recibo1_idx` (`consRecibo`);

--
-- Indices de la tabla `tblresiduo`
--
ALTER TABLE `tblresiduo`
  ADD PRIMARY KEY (`codResi`),
  ADD KEY `fk_tbl_residuo_tbl_tiporesiduo1_idx` (`codTipoResiduo`);

--
-- Indices de la tabla `tblsalida`
--
ALTER TABLE `tblsalida`
  ADD PRIMARY KEY (`consSalida`),
  ADD KEY `fk_tbl_salida_tbl_persona1_idx` (`docCliente`),
  ADD KEY `fk_tbl_salida_tbl_tiposalida1_idx` (`codTipoSalida`),
  ADD KEY `fk_tbl_salida_tbl_empleado1_idx` (`docEmple`);

--
-- Indices de la tabla `tblsalidacomponente`
--
ALTER TABLE `tblsalidacomponente`
  ADD PRIMARY KEY (`cons_salida`,`consDesen`,`codCompoResi`),
  ADD KEY `fk_tbl_salidacomponente_tbl_salida1_idx` (`cons_salida`),
  ADD KEY `fk_tbl_salidacomponente_tbl_componeteresiduo1_idx` (`codCompoResi`),
  ADD KEY `fk_tblSalidaComponente_tblDesensamble1_idx` (`consDesen`);

--
-- Indices de la tabla `tblsalidaresiduo`
--
ALTER TABLE `tblsalidaresiduo`
  ADD PRIMARY KEY (`consSalida`,`codResi`,`consRecibo`),
  ADD KEY `fk_tblsalidaresiduo_tblsalida1_idx` (`consSalida`),
  ADD KEY `fk_tblsalidaresiduo_tblrecibo2_idx` (`consRecibo`),
  ADD KEY `fk_tblsalidaresiduo_tblresiduo2_idx` (`codResi`);

--
-- Indices de la tabla `tbltipopersona`
--
ALTER TABLE `tbltipopersona`
  ADD PRIMARY KEY (`codTipoPersona`);

--
-- Indices de la tabla `tbltiporesiduo`
--
ALTER TABLE `tbltiporesiduo`
  ADD PRIMARY KEY (`codTipoResi`);

--
-- Indices de la tabla `tbltiposalida`
--
ALTER TABLE `tbltiposalida`
  ADD PRIMARY KEY (`codTipoSalida`);

--
-- Indices de la tabla `tblubicacion`
--
ALTER TABLE `tblubicacion`
  ADD PRIMARY KEY (`codUbicacion`);

--
-- Indices de la tabla `tblusuario`
--
ALTER TABLE `tblusuario`
  ADD PRIMARY KEY (`codUsu`),
  ADD KEY `fk_tbl_usuario_tbl_empleado1_idx` (`docEmple`),
  ADD KEY `fk_tbl_usuario_tbl_perfil1_idx` (`codPerfil`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tblcargoempleado`
--
ALTER TABLE `tblcargoempleado`
  MODIFY `codCargoEmple` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tblciudad`
--
ALTER TABLE `tblciudad`
  MODIFY `codCiud` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tblcomponenteresiduo`
--
ALTER TABLE `tblcomponenteresiduo`
  MODIFY `codCompoResi` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tblconfiguracion`
--
ALTER TABLE `tblconfiguracion`
  MODIFY `codigo` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tblperfil`
--
ALTER TABLE `tblperfil`
  MODIFY `codPerfil` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tblrecibo`
--
ALTER TABLE `tblrecibo`
  MODIFY `consRecibo` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tblresiduo`
--
ALTER TABLE `tblresiduo`
  MODIFY `codResi` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tblsalida`
--
ALTER TABLE `tblsalida`
  MODIFY `consSalida` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de la tabla `tbltipopersona`
--
ALTER TABLE `tbltipopersona`
  MODIFY `codTipoPersona` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbltiporesiduo`
--
ALTER TABLE `tbltiporesiduo`
  MODIFY `codTipoResi` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tbltiposalida`
--
ALTER TABLE `tbltiposalida`
  MODIFY `codTipoSalida` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tblubicacion`
--
ALTER TABLE `tblubicacion`
  MODIFY `codUbicacion` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tblusuario`
--
ALTER TABLE `tblusuario`
  MODIFY `codUsu` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tblcomponenteresiduo`
--
ALTER TABLE `tblcomponenteresiduo`
  ADD CONSTRAINT `fk_tbl_componeteresiduo_tbl_tiporesiduo1` FOREIGN KEY (`codTipoResiduo`) REFERENCES `tbltiporesiduo` (`codTipoResi`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblcomponenteresiduodesensamble`
--
ALTER TABLE `tblcomponenteresiduodesensamble`
  ADD CONSTRAINT `fk_tbl_componenteresiduodesensamble_tbl_componeteresiduo1` FOREIGN KEY (`codCompoResi`) REFERENCES `tblcomponenteresiduo` (`codCompoResi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_componenteresiduodesensamble_tbl_desensamble1` FOREIGN KEY (`consDesen`) REFERENCES `tbldesensamble` (`consDesen`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbldesensamble`
--
ALTER TABLE `tbldesensamble`
  ADD CONSTRAINT `fk_tbl_desensamble_tbl_recibo1` FOREIGN KEY (`consRecibo`) REFERENCES `tblrecibo` (`consRecibo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_desensamble_tbl_residuo1` FOREIGN KEY (`codResi`) REFERENCES `tblresiduo` (`codResi`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblempleado`
--
ALTER TABLE `tblempleado`
  ADD CONSTRAINT `fk_tbl_empleado_tbl_cargo1` FOREIGN KEY (`codCarEmple`) REFERENCES `tblcargoempleado` (`codCargoEmple`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblempleadodesensamble`
--
ALTER TABLE `tblempleadodesensamble`
  ADD CONSTRAINT `fk_tbl_empleadodesensamble_tbl_desensamble1` FOREIGN KEY (`consDesen`) REFERENCES `tbldesensamble` (`consDesen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_empleadodesensamble_tbl_empleado1` FOREIGN KEY (`docEmple`) REFERENCES `tblempleado` (`docEmple`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblpersona`
--
ALTER TABLE `tblpersona`
  ADD CONSTRAINT `fk_tbl_persona_tbl_ciudad1` FOREIGN KEY (`ciudad`) REFERENCES `tblciudad` (`codCiud`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_persona_tbl_tipopersona1` FOREIGN KEY (`codTipoPersona`) REFERENCES `tbltipopersona` (`codTipoPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblrecibo`
--
ALTER TABLE `tblrecibo`
  ADD CONSTRAINT `fk_tbl_recibo_tbl_empleado1` FOREIGN KEY (`docEmpleado`) REFERENCES `tblempleado` (`docEmple`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_recibo_tbl_persona1` FOREIGN KEY (`docProveedor`) REFERENCES `tblpersona` (`docPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblreciboresiduo`
--
ALTER TABLE `tblreciboresiduo`
  ADD CONSTRAINT `fk_tbl_reciboresiduo_tbl_recibo1` FOREIGN KEY (`consRecibo`) REFERENCES `tblrecibo` (`consRecibo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_reciboresiduo_tbl_residuo1` FOREIGN KEY (`codResi`) REFERENCES `tblresiduo` (`codResi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_reciboresiduo_tbl_ubicacion` FOREIGN KEY (`codUbicacion`) REFERENCES `tblubicacion` (`codUbicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblresiduo`
--
ALTER TABLE `tblresiduo`
  ADD CONSTRAINT `fk_tbl_residuo_tbl_tiporesiduo1` FOREIGN KEY (`codTipoResiduo`) REFERENCES `tbltiporesiduo` (`codTipoResi`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblsalida`
--
ALTER TABLE `tblsalida`
  ADD CONSTRAINT `fk_tbl_salida_tbl_empleado1` FOREIGN KEY (`docEmple`) REFERENCES `tblempleado` (`docEmple`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_salida_tbl_persona1` FOREIGN KEY (`docCliente`) REFERENCES `tblpersona` (`docPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_salida_tbl_tiposalida1` FOREIGN KEY (`codTipoSalida`) REFERENCES `tbltiposalida` (`codTipoSalida`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblsalidacomponente`
--
ALTER TABLE `tblsalidacomponente`
  ADD CONSTRAINT `fk_tblSalidaComponente_tblDesensamble1` FOREIGN KEY (`consDesen`) REFERENCES `tbldesensamble` (`consDesen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_salidacomponente_tbl_componeteresiduo1` FOREIGN KEY (`codCompoResi`) REFERENCES `tblcomponenteresiduo` (`codCompoResi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_salidacomponente_tbl_salida1` FOREIGN KEY (`cons_salida`) REFERENCES `tblsalida` (`consSalida`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblsalidaresiduo`
--
ALTER TABLE `tblsalidaresiduo`
  ADD CONSTRAINT `fk_tblsalidaresiduo_tblrecibo2` FOREIGN KEY (`consRecibo`) REFERENCES `tblrecibo` (`consRecibo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblsalidaresiduo_tblresiduo2` FOREIGN KEY (`codResi`) REFERENCES `tblresiduo` (`codResi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblsalidaresiduo_tblsalida1` FOREIGN KEY (`consSalida`) REFERENCES `tblsalida` (`consSalida`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblusuario`
--
ALTER TABLE `tblusuario`
  ADD CONSTRAINT `fk_tbl_usuario_tbl_empleado1` FOREIGN KEY (`docEmple`) REFERENCES `tblempleado` (`docEmple`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_usuario_tbl_perfil1` FOREIGN KEY (`codPerfil`) REFERENCES `tblperfil` (`codPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
