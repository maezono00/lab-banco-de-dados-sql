-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tarefa05
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `acessos`
--

DROP TABLE IF EXISTS `acessos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acessos` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `data_hora_login` datetime DEFAULT NULL,
  `ip_login` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_login`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `acessos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acessos`
--

LOCK TABLES `acessos` WRITE;
/*!40000 ALTER TABLE `acessos` DISABLE KEYS */;
INSERT INTO `acessos` VALUES (1,1,'2024-08-01 09:00:00','192.168.0.1'),(2,2,'2024-08-01 09:05:00','192.168.0.2'),(3,3,'2024-08-01 09:10:00','192.168.0.3'),(4,4,'2024-08-01 09:15:00','192.168.0.4'),(5,5,'2024-08-01 09:20:00','192.168.0.5'),(6,6,'2024-08-01 09:25:00','192.168.0.6'),(7,7,'2024-08-01 09:30:00','192.168.0.7'),(8,8,'2024-08-01 09:35:00','192.168.0.8'),(9,9,'2024-08-01 09:40:00','192.168.0.9'),(10,10,'2024-08-01 09:45:00','192.168.0.10');
/*!40000 ALTER TABLE `acessos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alergias`
--

DROP TABLE IF EXISTS `alergias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alergias` (
  `id_alergia` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_alergia` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `id_bebe` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_alergia`),
  KEY `id_bebe` (`id_bebe`),
  CONSTRAINT `alergias_ibfk_1` FOREIGN KEY (`id_bebe`) REFERENCES `bebes` (`id_bebe`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alergias`
--

LOCK TABLES `alergias` WRITE;
/*!40000 ALTER TABLE `alergias` DISABLE KEYS */;
/*!40000 ALTER TABLE `alergias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bebes`
--

DROP TABLE IF EXISTS `bebes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bebes` (
  `id_bebe` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `data_hora_nascimento` datetime NOT NULL,
  `sexo` char(1) NOT NULL,
  `peso` decimal(5,2) NOT NULL,
  `altura` decimal(5,2) NOT NULL,
  `tipo_parto` varchar(50) NOT NULL,
  `id_pai` int(11) DEFAULT NULL,
  `id_mae` int(11) NOT NULL,
  `observacoes` text DEFAULT NULL,
  PRIMARY KEY (`id_bebe`),
  KEY `id_pai` (`id_pai`),
  KEY `id_mae` (`id_mae`),
  CONSTRAINT `bebes_ibfk_1` FOREIGN KEY (`id_pai`) REFERENCES `genitores` (`id_genitor`),
  CONSTRAINT `bebes_ibfk_2` FOREIGN KEY (`id_mae`) REFERENCES `genitores` (`id_genitor`),
  CONSTRAINT `chk_peso` CHECK (`peso` > 0)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bebes`
--

LOCK TABLES `bebes` WRITE;
/*!40000 ALTER TABLE `bebes` DISABLE KEYS */;
INSERT INTO `bebes` VALUES (1,'Lucas Silva','2024-08-01 08:30:00','M',3.20,50.00,'Normal',1,2,NULL),(2,'Laura Costa','2024-08-02 09:45:00','F',3.00,49.50,'Cesárea',NULL,2,NULL),(3,'Pedro Santos','2024-08-03 07:15:00','M',3.50,51.00,'Normal',3,4,NULL),(4,'Alice Souza','2024-08-04 06:30:00','F',3.10,49.00,'Cesárea',5,4,NULL),(5,'Gabriel Lima','2024-08-05 10:00:00','M',3.30,50.50,'Normal',5,6,NULL),(6,'Sofia Oliveira','2024-08-06 11:15:00','F',3.20,49.80,'Cesárea',NULL,6,NULL),(7,'Henrique Almeida','2024-08-07 12:30:00','M',3.40,51.20,'Normal',7,8,NULL),(8,'Isabella Melo','2024-08-08 05:45:00','F',3.10,50.30,'Cesárea',7,8,NULL),(9,'Felipe Pereira','2024-08-09 09:00:00','M',3.50,51.50,'Normal',9,10,NULL),(10,'Beatriz Ribeiro','2024-08-10 04:15:00','F',3.00,49.40,'Cesárea',9,10,NULL);
/*!40000 ALTER TABLE `bebes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargos` (
  `id_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `nome_cargo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` VALUES (1,'Pediatra'),(2,'Enfermeiro(a)'),(3,'Nutricionista'),(4,'Fisioterapeuta'),(5,'Obstetra'),(6,'Auxiliar de Enfermagem'),(7,'Técnico(a) de Enfermagem'),(8,'Assistente Social'),(9,'Psicólogo(a)'),(10,'Recepcionista');
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultas`
--

DROP TABLE IF EXISTS `consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultas` (
  `id_consulta` int(11) NOT NULL AUTO_INCREMENT,
  `data_consulta` date NOT NULL,
  `id_bebe` int(11) NOT NULL,
  `id_profissional` int(11) NOT NULL,
  PRIMARY KEY (`id_consulta`),
  KEY `id_bebe` (`id_bebe`),
  KEY `id_profissional` (`id_profissional`),
  CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`id_bebe`) REFERENCES `bebes` (`id_bebe`) ON DELETE CASCADE,
  CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`id_profissional`) REFERENCES `profissionais_saude` (`id_profissional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultas`
--

LOCK TABLES `consultas` WRITE;
/*!40000 ALTER TABLE `consultas` DISABLE KEYS */;
/*!40000 ALTER TABLE `consultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecos`
--

DROP TABLE IF EXISTS `enderecos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecos` (
  `id_endereco` int(11) NOT NULL AUTO_INCREMENT,
  `cep` varchar(10) NOT NULL,
  `rua` varchar(255) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`id_endereco`),
  CONSTRAINT `chk_cep` CHECK (`cep` regexp '^[0-9]{5}-[0-9]{3}$')
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecos`
--

LOCK TABLES `enderecos` WRITE;
/*!40000 ALTER TABLE `enderecos` DISABLE KEYS */;
INSERT INTO `enderecos` VALUES (1,'01001-000','Rua A','123','Centro','São Paulo','SP'),(2,'02002-111','Avenida B','456','Jardins','São Paulo','SP'),(3,'03003-222','Travessa C','789','Vila Mariana','São Paulo','SP'),(4,'04004-333','Alameda D','101','Pinheiros','São Paulo','SP'),(5,'05005-444','Rua E','202','Moema','São Paulo','SP'),(6,'06006-555','Avenida F','303','Brooklin','São Paulo','SP'),(7,'07007-666','Praça G','404','Liberdade','São Paulo','SP'),(8,'08008-777','Rua H','505','Ipiranga','São Paulo','SP'),(9,'09009-888','Alameda I','606','Tatuapé','São Paulo','SP'),(10,'10010-999','Avenida J','707','Vila Madalena','São Paulo','SP');
/*!40000 ALTER TABLE `enderecos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exames`
--

DROP TABLE IF EXISTS `exames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exames` (
  `id_exame` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_exame` varchar(255) NOT NULL,
  `data_exame` date DEFAULT NULL,
  `resultado_exame` text DEFAULT NULL,
  `id_bebe` int(11) NOT NULL,
  PRIMARY KEY (`id_exame`),
  KEY `id_bebe` (`id_bebe`),
  CONSTRAINT `exames_ibfk_1` FOREIGN KEY (`id_bebe`) REFERENCES `bebes` (`id_bebe`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exames`
--

LOCK TABLES `exames` WRITE;
/*!40000 ALTER TABLE `exames` DISABLE KEYS */;
/*!40000 ALTER TABLE `exames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genitores`
--

DROP TABLE IF EXISTS `genitores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genitores` (
  `id_genitor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `rg` varchar(20) NOT NULL,
  `sexo` char(1) NOT NULL,
  `data_nascimento` date NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `id_endereco` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_genitor`),
  UNIQUE KEY `email` (`email`),
  KEY `id_endereco` (`id_endereco`),
  CONSTRAINT `genitores_ibfk_1` FOREIGN KEY (`id_endereco`) REFERENCES `enderecos` (`id_endereco`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genitores`
--

LOCK TABLES `genitores` WRITE;
/*!40000 ALTER TABLE `genitores` DISABLE KEYS */;
INSERT INTO `genitores` VALUES (1,'Carlos Silva','123456789','M','1980-01-01','11987654321',1,NULL),(2,'Ana Costa','987654321','F','1985-02-02','11987654322',2,NULL),(3,'Paulo Santos','112233445','M','1979-03-03','11987654323',3,NULL),(4,'Maria Souza','998877665','F','1988-04-04','11987654324',4,NULL),(5,'Jorge Lima','223344556','M','1982-05-05','11987654325',5,NULL),(6,'Juliana Oliveira','334455667','F','1984-06-06','11987654326',6,NULL),(7,'Roberto Almeida','445566778','M','1981-07-07','11987654327',7,NULL),(8,'Fernanda Melo','556677889','F','1987-08-08','11987654328',8,NULL),(9,'Marcelo Pereira','667788990','M','1983-09-09','11987654329',9,NULL),(10,'Luciana Ribeiro','778899001','F','1986-10-10','11987654330',10,NULL);
/*!40000 ALTER TABLE `genitores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_bebes`
--

DROP TABLE IF EXISTS `historico_bebes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_bebes` (
  `id_historico` int(11) NOT NULL AUTO_INCREMENT,
  `id_bebe` int(11) NOT NULL,
  `data_alteracao` datetime NOT NULL,
  `descricao_alteracao` text DEFAULT NULL,
  PRIMARY KEY (`id_historico`),
  KEY `id_bebe` (`id_bebe`),
  CONSTRAINT `historico_bebes_ibfk_1` FOREIGN KEY (`id_bebe`) REFERENCES `bebes` (`id_bebe`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_bebes`
--

LOCK TABLES `historico_bebes` WRITE;
/*!40000 ALTER TABLE `historico_bebes` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_bebes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papeis`
--

DROP TABLE IF EXISTS `papeis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `papeis` (
  `id_papel` int(11) NOT NULL AUTO_INCREMENT,
  `nome_papel` varchar(50) NOT NULL,
  `ativo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_papel`),
  UNIQUE KEY `nome_papel` (`nome_papel`),
  UNIQUE KEY `unique_nome_papel` (`nome_papel`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papeis`
--

LOCK TABLES `papeis` WRITE;
/*!40000 ALTER TABLE `papeis` DISABLE KEYS */;
INSERT INTO `papeis` VALUES (1,'Administrador',1),(2,'Genitor',1),(3,'Profissional de Saúde',1),(4,'Recepcionista',1),(5,'Gerente',1),(6,'Enfermeiro',1),(7,'Pediatra',1),(8,'Nutricionista',1),(9,'Fisioterapeuta',1),(10,'Assistente Social',1);
/*!40000 ALTER TABLE `papeis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papel_permissoes`
--

DROP TABLE IF EXISTS `papel_permissoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `papel_permissoes` (
  `id_papel` int(11) NOT NULL,
  `id_permissao` int(11) NOT NULL,
  PRIMARY KEY (`id_papel`,`id_permissao`),
  KEY `id_permissao` (`id_permissao`),
  CONSTRAINT `papel_permissoes_ibfk_1` FOREIGN KEY (`id_papel`) REFERENCES `papeis` (`id_papel`),
  CONSTRAINT `papel_permissoes_ibfk_2` FOREIGN KEY (`id_permissao`) REFERENCES `permissoes` (`id_permissao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papel_permissoes`
--

LOCK TABLES `papel_permissoes` WRITE;
/*!40000 ALTER TABLE `papel_permissoes` DISABLE KEYS */;
INSERT INTO `papel_permissoes` VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(2,5),(3,9),(3,10),(4,1),(4,5);
/*!40000 ALTER TABLE `papel_permissoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profissionais_saude`
--

DROP TABLE IF EXISTS `profissionais_saude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profissionais_saude` (
  `id_profissional` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `rg` varchar(20) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `data_nascimento` date NOT NULL,
  `registro_ordem` varchar(50) NOT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_profissional`),
  UNIQUE KEY `rg` (`rg`),
  UNIQUE KEY `cpf` (`cpf`),
  KEY `id_cargo` (`id_cargo`),
  CONSTRAINT `profissionais_saude_ibfk_1` FOREIGN KEY (`id_cargo`) REFERENCES `cargos` (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profissionais_saude`
--

LOCK TABLES `profissionais_saude` WRITE;
/*!40000 ALTER TABLE `profissionais_saude` DISABLE KEYS */;
INSERT INTO `profissionais_saude` VALUES (1,'Dr. João Marques','223344556','123.456.789-00','1975-01-01','CRM 12345',1),(2,'Enf. Maria Duarte','334455667','234.567.890-11','1980-02-02','COREN 67890',2),(3,'Nut. Patrícia Lima','445566778','345.678.901-22','1985-03-03','CRN 98765',3),(4,'Fisio. Carlos Nunes','556677889','456.789.012-33','1978-04-04','CREFITO 54321',4),(5,'Dr. Ana Barbosa','667788990','567.890.123-44','1982-05-05','CRM 65432',5),(6,'Aux. Joana Souza','778899001','678.901.234-55','1984-06-06','COREN 87654',6),(7,'Tec. José Silva','889900112','789.012.345-66','1977-07-07','COREN 11223',7),(8,'Ass. Carla Mendes','990011223','890.123.456-77','1981-08-08','',8),(9,'Psic. Fernanda Lima','001122334','901.234.567-88','1983-09-09','CRP 76543',9),(10,'Rec. Marcos Oliveira','112233445','012.345.678-99','1986-10-10','',10);
/*!40000 ALTER TABLE `profissionais_saude` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_papeis`
--

DROP TABLE IF EXISTS `usuario_papeis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_papeis` (
  `id_usuario` int(11) NOT NULL,
  `id_papel` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_papel`),
  KEY `id_papel` (`id_papel`),
  CONSTRAINT `usuario_papeis_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `usuario_papeis_ibfk_2` FOREIGN KEY (`id_papel`) REFERENCES `papeis` (`id_papel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_papeis`
--

LOCK TABLES `usuario_papeis` WRITE;
/*!40000 ALTER TABLE `usuario_papeis` DISABLE KEYS */;
INSERT INTO `usuario_papeis` VALUES (1,1),(2,2),(3,2),(4,2),(5,2),(6,3),(7,3),(8,3),(9,3),(10,4);
/*!40000 ALTER TABLE `usuario_papeis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Administrador','admin@bercario.com','senhaadmin',1),(2,'Carlos Silva','carlos.silva@bercario.com','senha123',1),(3,'Ana Costa','ana.costa@bercario.com','senha123',1),(4,'Paulo Santos','paulo.santos@bercario.com','senha123',1),(5,'Maria Souza','maria.souza@bercario.com','senha123',1),(6,'Jorge Lima','jorge.lima@bercario.com','senha123',1),(7,'Juliana Oliveira','juliana.oliveira@bercario.com','senha123',1),(8,'Roberto Almeida','roberto.almeida@bercario.com','senha123',1),(9,'Fernanda Melo','fernanda.melo@bercario.com','senha123',1),(10,'Marcelo Pereira','marcelo.pereira@bercario.com','senha123',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacinas`
--

DROP TABLE IF EXISTS `vacinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacinas` (
  `id_vacina` int(11) NOT NULL AUTO_INCREMENT,
  `nome_vacina` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `data_vacinacao` date DEFAULT NULL,
  `id_bebe` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_vacina`),
  KEY `id_bebe` (`id_bebe`),
  CONSTRAINT `vacinas_ibfk_1` FOREIGN KEY (`id_bebe`) REFERENCES `bebes` (`id_bebe`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacinas`
--

LOCK TABLES `vacinas` WRITE;
/*!40000 ALTER TABLE `vacinas` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacinas_bebe`
--

DROP TABLE IF EXISTS `vacinas_bebe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacinas_bebe` (
  `id_bebe` int(11) NOT NULL,
  `id_vacina` int(11) NOT NULL,
  `data_aplicacao` date NOT NULL,
  PRIMARY KEY (`id_bebe`,`id_vacina`),
  KEY `id_vacina` (`id_vacina`),
  CONSTRAINT `vacinas_bebe_ibfk_1` FOREIGN KEY (`id_bebe`) REFERENCES `bebes` (`id_bebe`) ON DELETE CASCADE,
  CONSTRAINT `vacinas_bebe_ibfk_2` FOREIGN KEY (`id_vacina`) REFERENCES `vacinas` (`id_vacina`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacinas_bebe`
--

LOCK TABLES `vacinas_bebe` WRITE;
/*!40000 ALTER TABLE `vacinas_bebe` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacinas_bebe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-29 12:34:22
