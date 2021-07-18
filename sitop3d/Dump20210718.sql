CREATE DATABASE  IF NOT EXISTS `print3d` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `print3d`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: print3d
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `composizione`
--

DROP TABLE IF EXISTS `composizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composizione` (
  `fattura` int NOT NULL,
  `prodotto` int NOT NULL,
  `prezzo_acquisto` float DEFAULT NULL,
  `iva` float DEFAULT NULL,
  PRIMARY KEY (`fattura`,`prodotto`),
  KEY `prodref_idx` (`prodotto`),
  CONSTRAINT `fattref` FOREIGN KEY (`fattura`) REFERENCES `fattura` (`id_fattura`),
  CONSTRAINT `prodref` FOREIGN KEY (`prodotto`) REFERENCES `prodotto` (`id_prodotto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composizione`
--

LOCK TABLES `composizione` WRITE;
/*!40000 ALTER TABLE `composizione` DISABLE KEYS */;
/*!40000 ALTER TABLE `composizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `dettagli_ordini`
--

DROP TABLE IF EXISTS `dettagli_ordini`;
/*!50001 DROP VIEW IF EXISTS `dettagli_ordini`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dettagli_ordini` AS SELECT 
 1 AS `prodotto`,
 1 AS `prezzo_acquisto`,
 1 AS `iva`,
 1 AS `categoria`,
 1 AS `utente`,
 1 AS `id_ordine`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fattura`
--

DROP TABLE IF EXISTS `fattura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fattura` (
  `id_fattura` int NOT NULL AUTO_INCREMENT,
  `ordine` int NOT NULL,
  `costo_totale` float DEFAULT NULL,
  `spese_spedizione` float DEFAULT NULL,
  `pagamento` varchar(20) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id_fattura`),
  UNIQUE KEY `ordine_UNIQUE` (`ordine`),
  CONSTRAINT `ordine` FOREIGN KEY (`ordine`) REFERENCES `ordine` (`id_ordine`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fattura`
--

LOCK TABLES `fattura` WRITE;
/*!40000 ALTER TABLE `fattura` DISABLE KEYS */;
/*!40000 ALTER TABLE `fattura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordine`
--

DROP TABLE IF EXISTS `ordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordine` (
  `id_ordine` int NOT NULL AUTO_INCREMENT,
  `utente` int NOT NULL,
  `data_ordine` date NOT NULL,
  `data_spedizione` date DEFAULT NULL,
  `stato_ordine` varchar(15) NOT NULL,
  `indirizzo_spedizione` varchar(40) NOT NULL,
  `costo_totale` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id_ordine`),
  KEY `utente` (`utente`),
  CONSTRAINT `ordine_ibfk_1` FOREIGN KEY (`utente`) REFERENCES `utente` (`id_utente`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine`
--

LOCK TABLES `ordine` WRITE;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodotto`
--

DROP TABLE IF EXISTS `prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodotto` (
  `id_prodotto` int NOT NULL AUTO_INCREMENT,
  `descrizione_breve` varchar(50) NOT NULL,
  `descrizione` varchar(300) NOT NULL,
  `disponibilita` tinyint(1) DEFAULT NULL,
  `iva` float DEFAULT NULL,
  `prezzo_base` float DEFAULT NULL,
  `categoria` varchar(20) NOT NULL,
  PRIMARY KEY (`id_prodotto`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `codice_fiscale` char(16) NOT NULL,
  `id_utente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `indirizzo` varchar(40) NOT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(20) NOT NULL,
  `tipo_utente` varchar(15) NOT NULL,
  `codice_sdi` varchar(25) DEFAULT NULL,
  `ragione_sociale` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_utente`),
  UNIQUE KEY `codice_fiscale` (`codice_fiscale`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `telefono` (`telefono`),
  UNIQUE KEY `codice_sdi` (`codice_sdi`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES ('abcdefghij123456',22,'Amministratore','Del Sito','admin@admin.com','via Roma 5','3456874123','adminp3d','adminp3d','admin',NULL,NULL),('BCADFE88I33O123J',23,'Mario','Rossi','mail1@mail.com','vai roma 6 ','3486574123','username1','password1','utente',NULL,NULL),('BDADFE88I33O123J',24,'Mario','Marino','mail2@mail.com','via roma 7','3485521765','username2','password2','utente',NULL,NULL),('BCEDFE88I33O123J',25,'Laura','Lotti','mail3@mail.com','via roma 8','3669825431','username3','password3','utente',NULL,NULL),('BCAPFE88I33O123J',26,'Mehdi','Mussail','mail4@mail.com','via roma 9','3357426987','username4','password4','utente',NULL,NULL),('BCADFE88I33O123K',27,'Anna','De Santis','mail5@mail.com','via roma 10','3296587154','username5','password5','utente',NULL,NULL);
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'print3d'
--

--
-- Dumping routines for database 'print3d'
--
/*!50003 DROP FUNCTION IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `login`(un varchar(15), pwd varchar (20)) RETURNS int
    READS SQL DATA
BEGIN
if (1=(select count(*) from utente where username=un and password=pwd))
then RETURN 1;
else return 0;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cambia_prezzo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cambia_prezzo`(prod integer, nuovo float, ivan float)
BEGIN
update prodotto set prezzo_base=nuovo, iva=ivan where id_prodotto=prod;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserisci_prodotto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserisci_prodotto`(descb varchar(50), _descrizione varchar(300), disp tinyint, _iva float, _prezzo_base float, _categoria varchar(20))
BEGIN
insert into prodotto (descrizione_breve, descrizione, disponibilita, iva, prezzo_base, categoria)values(descb, _descrizione, disp, _iva, _prezzo_base, _categoria);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registra_fattura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registra_fattura`(id_ordine int, costo float, spedizione float, pagam varchar(20))
BEGIN
insert into fattura(ordine, costo_totale, spese_spedizione, pagamento, data) values (id_ordine, costo, spedizione, pagam, curdate());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registra_ordine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registra_ordine`(utente int, indirizzo varchar(40), costo float)
BEGIN
insert into ordine(utente, data_ordine, stato_ordine, indirizzo_spedizione, costo_totale) values(utente, CURDATE(), 'preso in carico', indirizzo, costo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registra_privato` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registra_privato`(cf char(16),  nome varchar(20), cognome varchar(20), email varchar(20), indirizzo varchar(40), telefono varchar(12), u_name varchar(15), pwd varchar(20))
BEGIN
INSERT INTO utente(codice_fiscale, nome, cognome, email, indirizzo, telefono, username, password, tipo_utente) values(cf, nome, cognome, email, indirizzo, telefono , u_name, pwd, 'Privato');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registra_societa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registra_societa`(cf char(16),  nome varchar(20), cognome varchar(20), email varchar(20), indirizzo varchar(40), telefono varchar(12), u_name varchar(15), pwd varchar(20), tipo varchar(15), sdi varchar(25), ragionsociale varchar(30))
BEGIN
INSERT INTO utente(codice_fiscale, nome, cognome, email, indirizzo, telefono, username, password, tipo_utente, codice_sdi, ragione_sociale) values(cf, nome, cognome, email, indirizzo, telefono , u_name, pwd, tipo, sdi, ragionsociale);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `dettagli_ordini`
--

/*!50001 DROP VIEW IF EXISTS `dettagli_ordini`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dettagli_ordini` AS select `composizione`.`prodotto` AS `prodotto`,`composizione`.`prezzo_acquisto` AS `prezzo_acquisto`,`composizione`.`iva` AS `iva`,`prodotto`.`categoria` AS `categoria`,`ordine`.`utente` AS `utente`,`ordine`.`id_ordine` AS `id_ordine` from (((`composizione` join `ordine`) join `prodotto`) join `fattura`) where ((`ordine`.`id_ordine` = `fattura`.`ordine`) and (`fattura`.`id_fattura` = `composizione`.`fattura`) and (`prodotto`.`id_prodotto` = `composizione`.`prodotto`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-18  2:43:56
