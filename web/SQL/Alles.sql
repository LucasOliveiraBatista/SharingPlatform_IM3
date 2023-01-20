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

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `session`
--

CREATE TABLE `session` (
  `ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Token` varchar(100) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `session`
--

INSERT INTO `session` (`ID`, `User_ID`, `Token`, `Timestamp`) VALUES
(84, 146, 'pQ7lz2FUhgHBjHvjgoB4bLykAPSG8oS00Bexf9vtBN', '2023-01-20 18:15:56'),
(85, 142, 'SWECBNf2VPfAQfVygWcx8mFhVWRAi1fPs6JOtONklk', '2023-01-20 18:24:39'),
(86, 149, 'qqNhLyfRWP0Vxkfs7Ovi7LWu2BhdKWYQu2hGA8EQge', '2023-01-20 18:26:51');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `name` varchar(42) NOT NULL,
  `email` varchar(42) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`ID`, `name`, `email`, `password`) VALUES
(132, 'asd', 'asd@gmail.com', '$2y$10$jsPQZPTAzu21r7aVXYYynujZ864JStTR4ntgpkInq7xhpyenIy3MK'),
(133, '1', '1@2.com', '$2y$10$BO8q5D/NWDYzWBHJigUCBe.CRcCPayE4axn/Bh26/IAgl8fMtKlE.'),
(134, '2', '2@2.com', '$2y$10$y5yMlWDD2ESTO9F266HgUea4sRp0mi0JUSiUbzodFpXaK0pmGSSyC'),
(135, '3', '3@2.com', '$2y$10$YYEtG7wXjRmH78/jk3BuO.Rz/b10SxgfMfayO4bylxW9/y9ZEM9o6'),
(140, 'mike', 'mike@123.com', '$2y$10$AKbX5VDsujV0LSndYenUGORNyD30q88H.du3KCMfsEu6MYiuwfFAi'),
(141, 'Hallo', 'hallo@ha.lo', '$2y$10$q4ezTCaucCNoWTpzPiM6ROCWjhGfYuDhk3E9JI.HPo/1yNf62o/BS'),
(142, 'Lucas', 'Lucas@gmail.com', '$2y$10$GPsoK.qZlfiq27TJTSkCqOPTKI8WfbCnswcRwXsGfpNhoUV5UUmI.'),
(143, 'Tito', 'Tito@gmail.com', '$2y$10$qHEPMe6QH4HnP78XlpeoTu4FOgxo5i./xjXrzWpBPVfhFt6CB5tEu'),
(144, 'Amore', 'A@a.com', '$2y$10$g4q9T4fc6bMUxb3TRxIaF.aaET.6fNWW94y05aZ0a/tDXVWYvxiW.'),
(145, 'Ariana', 'b@b.com', '$2y$10$7Rlwj83rBW2qB5vYc2QSyeUA461reg6qyiimaSHdnhyBPQoSOlCbW'),
(146, 'Lucas1', 'lucas@hallo.com', '$2y$10$gi1uztDPzWUnK2o9Nt1aXuWn8IUM3dL8x/CWFn7qUKgfVIgkH2MGq'),
(147, 'hoi', 'h@h.ch', '$2y$10$2SvCBVYefpGJFYGIFCajUu8zyNW/5ir6X6z9XFLCGSq5uRnNMLGj.'),
(148, 'lucas123', 'l@l.com', '$2y$10$glNDf81CTVChh6EJuIk7guG.ozUcZKlVPBCRlMmuBtonsFmPnBz2C'),
(149, 'LucasOliveira', 'l@lucas.com', '$2y$10$7y6BmWwXJCqchDKzM4RUxO7eY7FoSAU4n0ichxyxBWspIkQnuI0XK');

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
-- Indizes für die Tabelle `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `session_userid` (`User_ID`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `beitreage`
--
ALTER TABLE `beitreage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
--
-- AUTO_INCREMENT für Tabelle `session`
--
ALTER TABLE `session`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `beitreage`
--
ALTER TABLE `beitreage`
  ADD CONSTRAINT `Beitraege-UserId` FOREIGN KEY (`user_id`) REFERENCES `user` (`ID`);

--
-- Constraints der Tabelle `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_userid` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
