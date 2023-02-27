-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: carloca
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `carro`
--

DROP TABLE IF EXISTS `carro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carro` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_MONTADORA` int NOT NULL,
  `ID_CATEGORIA` int NOT NULL,
  `MODELO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `COR` enum('Preto','Prata','Branco') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `VERSÃO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CAMBIO` enum('Manual','Automático') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `KM_TOTAL` int NOT NULL,
  `DISPONIBILIDADE` enum('Disponível','Indisponível') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Disponível',
  PRIMARY KEY (`ID`),
  KEY `ID_MONTADORA` (`ID_MONTADORA`),
  KEY `ID_CATEGORIAS` (`ID_CATEGORIA`),
  CONSTRAINT `ID_CATEGORIAS` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categorias` (`ID`),
  CONSTRAINT `ID_MONTADORA` FOREIGN KEY (`ID_MONTADORA`) REFERENCES `montadora` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carro`
--

LOCK TABLES `carro` WRITE;
/*!40000 ALTER TABLE `carro` DISABLE KEYS */;
INSERT INTO `carro` VALUES (1,1,4,'CARRINHO','Prata','1','Manual',32,'Indisponível'),(2,3,2,'CARROZITO','Branco','2.5','Automático',12,'Indisponível'),(3,1,3,'PICAPE X','Preto','1','Manual',30,'Indisponível'),(4,5,1,'CARRÃO','Preto','2.5','Automático',40,'Disponível'),(5,2,5,'CRUZE','Prata','1.5','Manual',20,'Disponível'),(6,4,6,'CAR','Branco','3.6','Automático',34,'Disponível');
/*!40000 ALTER TABLE `carro` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `LOCK_INDISPONIBILIDADE` BEFORE INSERT ON `carro` FOR EACH ROW BEGIN
	IF(NEW.DISPONIBILIDADE = 'Indisponível') THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O carro só pode estar disponível ao ser criado';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIPO_CATEGORIA` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'SUV'),(2,'Hatch'),(3,'Picape'),(4,'Sedã Compacto'),(5,'Sedã Médio'),(6,'Sedã Grande');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ENDEREÇO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Felipe','São Paulo'),(2,'Laura','Minas Gerais'),(3,'Robertinho','Rio de janeiro'),(4,'JACK','Mato Grosso do Sul'),(5,'Caio','Pernambuco'),(6,'Pedro','São Paulo');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico`
--

DROP TABLE IF EXISTS `historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_LOCAÇÃO` int NOT NULL,
  `ID_CLIENTE` int NOT NULL,
  `DATA_LOCAÇÃO` date NOT NULL,
  `LOCAL_LOCAÇÃO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DATA_DEVOLUÇÃO` date NOT NULL,
  `LOCAL_DEVOLUÇÃO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `KM_INICIAL_CARRO` int NOT NULL,
  `KM_FINAL_CARRO` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `historico_FK` (`ID_LOCAÇÃO`),
  KEY `historico_FK_1` (`ID_CLIENTE`),
  CONSTRAINT `historico_FK` FOREIGN KEY (`ID_LOCAÇÃO`) REFERENCES `locacao` (`ID`),
  CONSTRAINT `historico_FK_1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico`
--

LOCK TABLES `historico` WRITE;
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
INSERT INTO `historico` VALUES (1,3,3,'2014-12-10','RJ','2015-12-10','RJ',12,30),(2,5,5,'2015-05-24','PE','2016-05-24','SP',30,34),(3,6,6,'2015-07-14','SP','2016-07-14','SP',10,40);
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `CHECK_DATA_UPDATE` BEFORE INSERT ON `historico` FOR EACH ROW BEGIN
	IF(NEW.DATA_DEVOLUÇÃO <= NEW.DATA_LOCAÇÃO) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'DATA INVÁLIDA, DATA DE DEVOLUÇÃO DEVE SER POSTERIOR A DE LOCAÇÃO';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `LOCK_LOCAID_DUPLICADO` BEFORE INSERT ON `historico` FOR EACH ROW BEGIN 
	DECLARE variavel_controle INT;
	SELECT COUNT(ID_LOCAÇÃO) INTO variavel_controle FROM HISTORICO WHERE ID_LOCAÇÃO =NEW.ID_LOCAÇÃO;
	IF(variavel_controle > 0) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ='A locação já foi encerrada';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `LOCK_KM_TOTAL` BEFORE INSERT ON `historico` FOR EACH ROW BEGIN 
	DECLARE km_total_hist INTEGER;
	DECLARE id_carros INT;
	SELECT ID_CARRO INTO id_carros FROM LOCACAO WHERE carloca.LOCACAO.ID = NEW.ID_LOCAÇÃO;
	SELECT KM_TOTAL INTO km_total_hist FROM carloca.CARRO WHERE carloca.CARRO.ID = id_carros;
	IF(NEW.KM_INICIAL_CARRO != km_total_hist) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O KM total do carro não é idêntico ao que está na tabela carro';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `KM_FINAL_CHECK` BEFORE INSERT ON `historico` FOR EACH ROW BEGIN 
	IF(NEW.KM_FINAL_CARRO <= NEW.KM_INICIAL_CARRO) THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'KM Final inválido. A quilometragem final deve ser maior que a inicial';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `LOCK_INSERTS` BEFORE INSERT ON `historico` FOR EACH ROW BEGIN 
	DECLARE cliente_locacao INT;
	DECLARE local_locacao VARCHAR(100);
	DECLARE data_locacao DATE;
	SELECT ID_CLIENTE INTO cliente_locacao FROM LOCACAO WHERE carloca.LOCACAO.ID = NEW.ID_LOCAÇÃO;
	IF(NEW.ID_CLIENTE != cliente_locacao) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Id cliente não está compativel com a que está na locação';
	END IF;
	SELECT DATA INTO data_locacao FROM LOCACAO WHERE carloca.LOCACAO.ID = NEW.ID_LOCAÇÃO;
	IF(NEW.DATA_LOCAÇÃO != data_locacao) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data de locação não está compativel com a que está na locação';
	END IF;
	SELECT ENDEREÇO_LOCAÇÃO INTO local_locacao FROM LOCACAO WHERE carloca.LOCACAO.ID = NEW.ID_LOCAÇÃO;
	IF(NEW.LOCAL_LOCAÇÃO != local_locacao) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O local de locação não está compativel com o que está na locação';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `SET_ENCERRAMENTO` AFTER INSERT ON `historico` FOR EACH ROW UPDATE LOCACAO SET STATUS = 'Encerrado' WHERE NEW.ID_LOCAÇÃO = LOCACAO.ID */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `UPDATE_KM_TOTAL_CARRO` AFTER INSERT ON `historico` FOR EACH ROW BEGIN 
UPDATE CARRO SET KM_TOTAL = NEW.KM_FINAL_CARRO WHERE carloca.CARRO.ID = (SELECT ID_CARRO FROM LOCACAO WHERE carloca.LOCACAO.ID = NEW.ID_LOCAÇÃO); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `LOCK_LOCACAO_ID_UPDATE` BEFORE UPDATE ON `historico` FOR EACH ROW BEGIN 
	IF (NEW.ID_LOCAÇÃO != OLD.ID_LOCAÇÃO) THEN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Uma vez colocada, o ID da locação não pode ser alterado';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `CHECK_DATA` BEFORE UPDATE ON `historico` FOR EACH ROW BEGIN 
	IF(NEW.DATA_DEVOLUÇÃO <= NEW.DATA_LOCAÇÃO) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'DATA INVÁLIDA, DATA DE DEVOLUÇÃO DEVE SER POSTERIOR A DE LOCAÇÃO';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `LOCK_KM_TOTAL_UPDATE` BEFORE UPDATE ON `historico` FOR EACH ROW BEGIN 
	DECLARE km_total_hist INTEGER;
	DECLARE id_carros INT;
	SELECT ID_CARRO INTO id_carros FROM LOCACAO WHERE carloca.LOCACAO.ID = NEW.ID_LOCAÇÃO;
	SELECT KM_TOTAL INTO km_total_hist FROM carloca.CARRO WHERE carloca.CARRO.ID = id_carros;
	IF(NEW.KM_INICIAL_CARRO != km_total_hist) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O KM total do carro não é idêntico ao que está na tabela carro';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `KM_FINAL_CHECK_UPDATE` BEFORE UPDATE ON `historico` FOR EACH ROW BEGIN
IF(NEW.KM_FINAL_CARRO <= NEW.KM_INICIAL_CARRO) THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'KM Final inválido. A quilometragem final deve ser maior que a inicial';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `LOCK_INSERTS_UPDATE` BEFORE UPDATE ON `historico` FOR EACH ROW BEGIN 
	DECLARE cliente_locacao INT;
	DECLARE local_locacao VARCHAR(100);
	DECLARE data_locacao DATE;
	SELECT ID_CLIENTE INTO cliente_locacao FROM LOCACAO WHERE carloca.LOCACAO.ID = NEW.ID_LOCAÇÃO;
	IF(NEW.ID_CLIENTE != cliente_locacao) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Id cliente não está compativel com a que está na locação';
	END IF;
	SELECT DATA INTO data_locacao FROM LOCACAO WHERE carloca.LOCACAO.ID = NEW.ID_LOCAÇÃO;
	IF(NEW.DATA_LOCAÇÃO != data_locacao) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data de locação não está compativel com a que está na locação';
	END IF;
	SELECT ENDEREÇO_LOCAÇÃO INTO local_locacao FROM LOCACAO WHERE carloca.LOCACAO.ID = NEW.ID_LOCAÇÃO;
	IF(NEW.LOCAL_LOCAÇÃO != local_locacao) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O local de locação não está compativel com o que está na locação';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `SET_ENCERRAMENTO_UPDATE` AFTER UPDATE ON `historico` FOR EACH ROW UPDATE LOCACAO SET STATUS = 'Encerrado' WHERE NEW.ID_LOCAÇÃO = LOCACAO.ID */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `locacao`
--

DROP TABLE IF EXISTS `locacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locacao` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_CARRO` int NOT NULL,
  `ID_CLIENTE` int NOT NULL,
  `ENDEREÇO_LOCAÇÃO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DATA` date NOT NULL,
  `MODALIDADE` enum('Diária') NOT NULL,
  `STATUS` enum('Em andamento','Encerrado') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Em andamento',
  PRIMARY KEY (`ID`),
  KEY `ID_CARRO` (`ID_CARRO`),
  KEY `ID_CLIENTE` (`ID_CLIENTE`),
  CONSTRAINT `ID_CARRO` FOREIGN KEY (`ID_CARRO`) REFERENCES `carro` (`ID`),
  CONSTRAINT `ID_CLIENTE` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locacao`
--

LOCK TABLES `locacao` WRITE;
/*!40000 ALTER TABLE `locacao` DISABLE KEYS */;
INSERT INTO `locacao` VALUES (1,1,1,'SP','2023-02-20','Diária','Em andamento'),(2,2,2,'MG','2022-01-24','Diária','Em andamento'),(3,3,3,'RJ','2014-12-10','Diária','Encerrado'),(4,3,4,'MS','2018-10-31','Diária','Em andamento'),(5,6,5,'PE','2015-05-24','Diária','Encerrado'),(6,4,6,'SP','2015-07-14','Diária','Encerrado');
/*!40000 ALTER TABLE `locacao` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `CLIENTE_CHECK` BEFORE INSERT ON `locacao` FOR EACH ROW BEGIN
	DECLARE cliente_contagem INT;
	SELECT COUNT(ID_CLIENTE) INTO cliente_contagem FROM LOCACAO WHERE ID_CLIENTE = NEW.ID_CLIENTE;
	IF(cliente_contagem > 0) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O cliente apenas pode alugar 1 carro por vez.';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `LOCK_STATUS` BEFORE INSERT ON `locacao` FOR EACH ROW BEGIN 
	IF(NEW.STATUS = 'Encerrado') THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A Locação só pode ser encerrada caso seja computada no histórico';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `CARRO_CHECK` BEFORE INSERT ON `locacao` FOR EACH ROW BEGIN
	DECLARE carro_stts VARCHARACTER(100);
	SET carro_stts = (SELECT DISPONIBILIDADE FROM CARRO WHERE CARRO.ID = NEW.ID_CARRO);
	IF(carro_stts = 'Indisponível') THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O carro já está sendo alocado.';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `LOCA_CARRO` AFTER INSERT ON `locacao` FOR EACH ROW UPDATE CARRO SET DISPONIBILIDADE = 'Indisponível' WHERE NEW.ID_CARRO = CARRO.ID */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `DATA_UPDATE_CHECK` BEFORE UPDATE ON `locacao` FOR EACH ROW BEGIN 
	IF(NEW.DATA >'2023-12-31' OR NEW.DATA < '2010-01-01') THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'DATA INVÁLIDA, DATAS ACEITAS VÃO DE 01-01-2010 ATÉ 31-12-2023';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `DESLOCA_CARRO` BEFORE UPDATE ON `locacao` FOR EACH ROW UPDATE CARRO SET DISPONIBILIDADE = 'Disponível' WHERE OLD.ID_CARRO = CARRO.ID */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `CLIENTE_CHECK_UPDATE` BEFORE UPDATE ON `locacao` FOR EACH ROW BEGIN
	DECLARE cliente_contagem INT;
	SELECT COUNT(ID_CLIENTE) INTO cliente_contagem FROM LOCACAO WHERE ID_CLIENTE = NEW.ID_CLIENTE;
	IF(NEW.ID_CLIENTE = OLD.ID_CLIENTE) THEN
	SET cliente_contagem = 0;
	END IF;
	IF(cliente_contagem > 0) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O cliente apenas pode alugar 1 carro por vez.';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `CARRO_CHECK_UPDATE` BEFORE UPDATE ON `locacao` FOR EACH ROW BEGIN
	DECLARE carro_stts VARCHARACTER(100);
	SET carro_stts = (SELECT DISPONIBILIDADE FROM CARRO WHERE CARRO.ID = NEW.ID_CARRO);
	IF(carro_stts = 'Indisponível') THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O carro já está sendo alocado.';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `LOCA_CARRO_ UPDATE` AFTER UPDATE ON `locacao` FOR EACH ROW UPDATE CARRO SET DISPONIBILIDADE = 'Indisponível' WHERE NEW.ID_CARRO = CARRO.ID */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`felipe`@`%`*/ /*!50003 TRIGGER `LOCA_ENCERRADO_DESLOCA` AFTER UPDATE ON `locacao` FOR EACH ROW BEGIN 
	DECLARE var_encerramento INT;
	IF(NEW.STATUS = 'Encerrado') THEN
	SET var_encerramento = 1;
 	ELSE
 	SET var_encerramento = 0;
 	END IF;
 	IF (var_encerramento > 0) THEN
 	UPDATE CARRO SET DISPONIBILIDADE = 'Disponível' WHERE NEW.ID_CARRO = CARRO.ID;
 	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `montadora`
--

DROP TABLE IF EXISTS `montadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `montadora` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `montadora`
--

LOCK TABLES `montadora` WRITE;
/*!40000 ALTER TABLE `montadora` DISABLE KEYS */;
INSERT INTO `montadora` VALUES (1,'Fiat'),(2,'Chevrolet'),(3,'Ford'),(4,'Renault'),(5,'Toyota');
/*!40000 ALTER TABLE `montadora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'carloca'
--

--
-- Dumping routines for database 'carloca'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-27 11:25:49
