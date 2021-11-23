-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2021. Nov 23. 15:02
-- Kiszolgáló verziója: 10.4.21-MariaDB
-- PHP verzió: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `feladat1`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `alaktresz`
--

CREATE TABLE `alaktresz` (
  `akod` int(11) NOT NULL,
  `nev` varbinary(50) NOT NULL,
  `ar` int(11) DEFAULT NULL CHECK (`ar` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `alaktresz`
--

INSERT INTO `alaktresz` (`akod`, `nev`, `ar`) VALUES
(1, 0x6b616b616f, 300);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `egysegek`
--

CREATE TABLE `egysegek` (
  `aru` int(11) DEFAULT NULL,
  `db` int(11) DEFAULT NULL CHECK (`db` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `egysegek`
--

INSERT INTO `egysegek` (`aru`, `db`) VALUES
(1, 1523),
(2, 5255),
(3, 775),
(4, 1664),
(5, 1463);

-- --------------------------------------------------------

--
-- A nézet helyettes szerkezete `et`
-- (Lásd alább az aktuális nézetet)
--
CREATE TABLE `et` (
`nev` varbinary(50)
,`tkod` int(11)
,`db` bigint(21)
);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `gyarto`
--

CREATE TABLE `gyarto` (
  `adoszam` int(11) NOT NULL,
  `nev` varbinary(30) NOT NULL,
  `telephely` varbinary(200) DEFAULT NULL,
  `irsz` char(4) DEFAULT NULL,
  `varos` char(40) DEFAULT NULL,
  `utca` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `gyarto`
--

INSERT INTO `gyarto` (`adoszam`, `nev`, `telephely`, `irsz`, `varos`, `utca`) VALUES
(1098765432, 0x67796172746f32, 0x74656c657068656c7932, '1245', 'Rinyaújnép', 'Pék utca'),
(1234567891, 0x67796172746f31, 0x74656c657068656c7931, '6666', 'Dunaböszörmény', 'Nagy Márton utca'),
(1357911131, 0x67796172746f34, NULL, NULL, NULL, NULL),
(2068101213, 0x67796172746f33, NULL, NULL, NULL, NULL),
(2147483647, 0x67796172746f35, 0x74656c657068656c7933, '6354', 'Makkoshotyka', 'Dió utca');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `komponens`
--

CREATE TABLE `komponens` (
  `termek` int(11) DEFAULT NULL,
  `alkatresz` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `komponens`
--

INSERT INTO `komponens` (`termek`, `alkatresz`) VALUES
(3, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termek`
--

CREATE TABLE `termek` (
  `tkod` int(11) NOT NULL,
  `nev` varbinary(50) NOT NULL,
  `ear` int(11) DEFAULT NULL CHECK (`ear` > 0),
  `gyarto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `termek`
--

INSERT INTO `termek` (`tkod`, `nev`, `ear`, `gyarto`) VALUES
(1, 0x6b656e796572, 400, 1098765432),
(2, 0x74656a, 300, 2068101213),
(3, 0x6b616b616f732074656a, 385, 1234567891),
(4, 0x76697a, 80, 2147483647),
(5, 0x6a6f6768757274, 150, 2068101213);

-- --------------------------------------------------------

--
-- Nézet szerkezete `et`
--
DROP TABLE IF EXISTS `et`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `et`  AS SELECT max(`t`.`nev`) AS `nev`, `t`.`tkod` AS `tkod`, count(0) AS `db` FROM (`termek` `t` join `egysegek` `e` on(`e`.`aru` = `t`.`tkod`)) GROUP BY `t`.`tkod` ;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `alaktresz`
--
ALTER TABLE `alaktresz`
  ADD PRIMARY KEY (`akod`);

--
-- A tábla indexei `gyarto`
--
ALTER TABLE `gyarto`
  ADD PRIMARY KEY (`adoszam`);

--
-- A tábla indexei `termek`
--
ALTER TABLE `termek`
  ADD PRIMARY KEY (`tkod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
