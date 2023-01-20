-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 20. Jan 2023 um 19:46
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
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
