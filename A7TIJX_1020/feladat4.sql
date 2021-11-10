-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2021. Nov 10. 10:14
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
-- Adatbázis: `feladat4`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termekek`
--

CREATE TABLE `termekek` (
  `tkod` int(11) NOT NULL,
  `nev` varbinary(50) NOT NULL,
  `ear` int(11) DEFAULT NULL CHECK (`ear` > 0),
  `kategoria` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `termekek`
--

INSERT INTO `termekek` (`tkod`, `nev`, `ear`, `kategoria`) VALUES
(1, 0x6c61706174, 2000, 'K1'),
(2, 0x7365707275, 4000, 'K1'),
(3, 0x6d6f736f6761746f2067656c, 1500, 'K2'),
(4, 0x737a617070616e, 1000, 'K2'),
(5, 0x706f686172, 2400, 'K3');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `termekek`
--
ALTER TABLE `termekek`
  ADD PRIMARY KEY (`tkod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
