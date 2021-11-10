-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2021. Nov 09. 17:45
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
-- Tábla szerkezet ehhez a táblához `gyarto`
--

CREATE TABLE `gyarto` (
  `adoszam` int(11) NOT NULL,
  `nev` varbinary(30) NOT NULL,
  `telephely` varbinary(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Indexek a kiírt táblákhoz
--

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
