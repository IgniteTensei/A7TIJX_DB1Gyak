-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2021. Nov 10. 10:07
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
-- Adatbázis: `feladat3`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `befizetes`
--

CREATE TABLE `befizetes` (
  `diak` int(11) DEFAULT NULL,
  `kurzus` int(11) DEFAULT NULL,
  `befizetes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `resztvevo`
--

CREATE TABLE `resztvevo` (
  `tajszam` char(13) NOT NULL,
  `nev` char(30) NOT NULL,
  `lakcim` varbinary(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tanfolyam`
--

CREATE TABLE `tanfolyam` (
  `tkod` int(11) NOT NULL,
  `ar` int(11) NOT NULL,
  `tipus` varbinary(30) NOT NULL,
  `megnevezes` varbinary(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `resztvevo`
--
ALTER TABLE `resztvevo`
  ADD PRIMARY KEY (`tajszam`);

--
-- A tábla indexei `tanfolyam`
--
ALTER TABLE `tanfolyam`
  ADD PRIMARY KEY (`tkod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
