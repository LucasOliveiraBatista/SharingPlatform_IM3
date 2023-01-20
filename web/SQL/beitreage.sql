-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 20. Jan 2023 um 19:47
-- Server-Version: 10.3.31-MariaDB-0+deb10u1
-- PHP-Version: 7.0.33-57+0~20211119.61+debian10~1.gbp5d8ba5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `173662_5_1`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `beitreage`
--

CREATE TABLE `beitreage` (
  `ID` int(11) NOT NULL,
  `profilbild` varchar(256) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `beschreibung` text NOT NULL,
  `links` varchar(256) NOT NULL,
  `kanton` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `beitreage`
--

INSERT INTO `beitreage` (`ID`, `profilbild`, `name`, `email`, `beschreibung`, `links`, `kanton`, `status`, `user_id`) VALUES
(80, 'https://www.digezz.ch/app/uploads/2022/01/Thumbnail_2400px_1350px-1200x675.png', 'Sacul', 'Sacul@hotmail.com', ' Hallo, ich bin ein Songwriter, Gitarrist und Sänger, der in den letzten paar Jahren immer wieder neue Latin-Melodien im schönen Alpenkanton Graubünden produziert hat. Meine Ziele für 2023 sind weitere Songs zu komponieren und coole Gigs spielen. ', 'https://open.spotify.com/album/1fnFOR9BrUQTpJwMv7vNQs', 'Graubünden', 1, 142),
(81, 'https://rutacontrabando.com/wp/wp-content/uploads/2021/07/Ruta-Contrabando-Pressefoto-300x219.jpg', 'Tito', 'tito@gmail.com', ' Lead-Sänger von Ruta-Contrabando', 'https://rutacontrabando.com/', 'Graubünden', 1, 143),
(82, 'https://img.freepik.com/free-photo/passionate-black-male-singer-performing-against-red_1258-26348.jpg?w=2000', 'Amore', 'Amor@amora.com', ' The vibes of Zürich', '', 'Zürich', 1, 144),
(83, 'https://i.ytimg.com/vi/FtIE7juUBdo/maxresdefault.jpg', 'Ariana', 'huhu@huhu,com', ' Next Konzert in Geneve, don\'t miss it!!', 'https://www.arianagrande.com/', 'Genf', 1, 145),
(84, 'https://www.parks.swiss/ressourcen/fotos/03_die_schweizer_paerke/parkportraits/bvm/impressionen/biosfera_val_muestair_kloster_st_johann.jpg', 'Val Müstair', 'Valmüstar@ouyeah.com', ' Near top of the world', 'naja', 'Graubünden', 1, 141);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `beitreage`
--
ALTER TABLE `beitreage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Beitraege-UserId` (`user_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `beitreage`
--
ALTER TABLE `beitreage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `beitreage`
--
ALTER TABLE `beitreage`
  ADD CONSTRAINT `Beitraege-UserId` FOREIGN KEY (`user_id`) REFERENCES `user` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
