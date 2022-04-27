-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbsistema
-- ------------------------------------------------------
-- Server version	5.7.33

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
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulo` (
  `idarticulo` int(11) NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `condicion` tinyint(4) DEFAULT '1',
  `marca` varchar(250) DEFAULT NULL,
  `aplicacion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idarticulo`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_articulo_categoria_idx` (`idcategoria`),
  CONSTRAINT `fk_articulo_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT INTO `articulo` VALUES (6,7,'00458','Ligheter',42,'modelo lighter de MICRONICS','1535417422.jpg',1,'111','111'),(7,9,'0040kl','disco solido',55,'disco marca KINGSTON','1535417431.jfif',1,NULL,NULL),(8,9,'HJL-OP','DATATRABEL',106,'usb de 15gb','1535417452.jpg',1,NULL,NULL),(9,12,'003215','nnn',20,'wqweqwe','1650299773.png',1,NULL,NULL),(10,7,'003215aa','nuevo',23,'s','1650309038.png',1,'prueba_1a','prueba1'),(11,9,'asdasd','miguel',45,'dasdasd','1650309264.png',1,'asdasdasd','prueba1');
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `condicion` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcategoria`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (7,'TECLADOS','teclados gamers',1),(8,'CPU\'s','cpus gamers de alta categoria',1),(9,'DISCOS DUROS','disco solidos',1),(12,'MONITORES','monitores gamers',1);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_ingreso`
--

DROP TABLE IF EXISTS `detalle_ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_ingreso` (
  `iddetalle_ingreso` int(11) NOT NULL AUTO_INCREMENT,
  `idingreso` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_compra` decimal(11,2) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  PRIMARY KEY (`iddetalle_ingreso`),
  KEY `fk_detalle_ingreso_idx` (`idingreso`),
  KEY `fk_detalle_articulo_idx` (`idarticulo`),
  CONSTRAINT `fk_detalle_articulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_ingreso` FOREIGN KEY (`idingreso`) REFERENCES `ingreso` (`idingreso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ingreso`
--

LOCK TABLES `detalle_ingreso` WRITE;
/*!40000 ALTER TABLE `detalle_ingreso` DISABLE KEYS */;
INSERT INTO `detalle_ingreso` VALUES (16,6,6,10,20.00,30.00),(17,6,7,5,200.00,250.00),(18,7,8,10,16.00,25.00),(19,8,7,10,250.00,300.00),(20,9,8,50,20.00,30.00),(21,10,6,10,25.00,30.00),(22,11,7,15,250.00,300.00),(23,12,6,10,100.00,150.00),(25,13,6,2,1.00,1.00),(28,14,11,1,1.00,1.00),(29,15,11,20,40.00,50.00),(30,16,11,5,20.00,20.00);
/*!40000 ALTER TABLE `detalle_ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL,
  PRIMARY KEY (`iddetalle_venta`),
  KEY `fk_detalle_venta_venta_idx` (`idventa`),
  KEY `fk_detalle_venta_articulo_idx` (`idarticulo`),
  CONSTRAINT `fk_detalle_venta_articulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_venta_venta` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (12,10,6,10,30.00,5.00),(13,10,7,10,250.00,10.00),(14,11,6,1,30.00,0.00),(15,11,7,1,250.00,0.00),(16,12,7,4,250.00,0.00),(17,13,7,1,250.00,10.00),(18,14,7,2,250.00,10.00),(19,15,6,1,30.00,10.00),(20,16,7,1,250.00,5.00),(21,17,7,1,250.00,5.00),(22,18,6,1,30.00,0.00),(23,19,7,1,250.00,2.00),(24,20,8,2,25.00,0.00),(25,21,6,1,30.00,5.00),(26,22,6,1,30.00,0.00),(27,22,7,1,300.00,0.00),(28,22,8,1,30.00,0.00),(29,23,6,2,30.00,0.00),(30,24,6,1,150.00,0.00),(31,24,7,1,300.00,0.00),(32,24,8,1,30.00,0.00),(34,25,7,1,300.00,0.00),(35,26,6,1,150.00,5.00),(36,27,7,1,300.00,0.00),(37,28,6,1,1.00,0.00),(38,28,6,1,1.00,0.00),(39,28,6,1,1.00,0.00),(40,28,6,1,1.00,0.00),(41,28,6,1,1.00,0.00),(42,28,6,1,1.00,0.00),(43,28,6,1,1.00,0.00),(44,28,6,1,1.00,0.00),(45,29,11,4,20.00,0.00);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingreso`
--

DROP TABLE IF EXISTS `ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingreso` (
  `idingreso` int(11) NOT NULL AUTO_INCREMENT,
  `idproveedor` int(11) NOT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `total_compra` decimal(11,2) NOT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`idingreso`),
  KEY `fk_ingreso_persona_idx` (`idproveedor`),
  KEY `fk_ingreso_usuario_idx` (`idusuario`),
  CONSTRAINT `fk_ingreso_persona` FOREIGN KEY (`idproveedor`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingreso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingreso`
--

LOCK TABLES `ingreso` WRITE;
/*!40000 ALTER TABLE `ingreso` DISABLE KEYS */;
INSERT INTO `ingreso` VALUES (6,7,1,'Factura','001','0001','2018-08-20 00:00:00',18.00,1200.00,'Aceptado'),(7,7,1,'Factura','001','008','2018-08-21 00:00:00',18.00,160.00,'Aceptado'),(8,7,1,'Boleta','0002','0004','2018-08-22 00:00:00',0.00,2500.00,'Aceptado'),(9,9,1,'Factura','001','0005','2018-08-23 00:00:00',18.00,1000.00,'Aceptado'),(10,10,1,'Factura','001','0006','2018-08-25 00:00:00',18.00,250.00,'Aceptado'),(11,10,1,'Factura','001','0007','2018-08-27 00:00:00',18.00,3750.00,'Aceptado'),(12,10,1,'Factura','1','2','2022-04-18 00:00:00',18.00,1000.00,'Aceptado'),(13,9,1,'Ticket','','2','2022-04-18 00:00:00',0.00,1.00,'Aceptado'),(14,7,1,'Ticket','','000001','2022-04-18 00:00:00',0.00,1.00,'Aceptado'),(15,9,1,'Ticket','00003','0000369','2022-04-18 00:00:00',0.00,800.00,'Aceptado'),(16,9,1,'Ticket','00321','02','2022-04-18 00:00:00',0.00,100.00,'Aceptado');
/*!40000 ALTER TABLE `ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permiso` (
  `idpermiso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`idpermiso`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
INSERT INTO `permiso` VALUES (1,'Escritorio'),(2,'Almacen'),(3,'Compras'),(4,'Ventas'),(5,'Acceso'),(6,'Consulta Compras'),(7,'Consulta Ventas'),(8,'Corte');
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_persona` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `num_documento` varchar(20) DEFAULT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (7,'Proveedor','INKA-PC S.R.L','RUC','12587845254','Av. los pinos 201','54328730','inkapc@hotmail.com'),(8,'Cliente','publico general','DNI','30224520','Av.jose olaya 215','54325230','public@hotmail.com'),(9,'Proveedor','TECNO-PC','RUC','20485248751','Calle los naranjales 245','054587852','tecno@gmail.com'),(10,'Proveedor','INFONET','RUC','40485245824','Av. quiñones 102','054789854','infonet@hotmail.com'),(11,'Cliente','pedro','DNI','458521748','Simon bolivar 120','78954263','pedro@gmailcom');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `num_documento` varchar(20) NOT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cargo` varchar(20) DEFAULT NULL,
  `login` varchar(20) NOT NULL,
  `clave` varchar(64) NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `condicion` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'angel','DNI','72154871','Calle los alpes 210','547821','admin@gmail.com','Administrador','admin','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f','1535417472.jpg',1),(2,'juan','DNI','30115425','calle los jirasoles 450','054789521','juan@hotmail.com','empleado','juan','5b065b0996c44ab2e641e24472b28d3e38554ce13d06d72b1aa93480dda21d43','1535417486.jpg',1),(3,'miguel','DNI','a','a','484562165','miguelbarcenasgarcia@gmail.com','a','miguel','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f','',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_permiso`
--

DROP TABLE IF EXISTS `usuario_permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_permiso` (
  `idusuario_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `idpermiso` int(11) NOT NULL,
  PRIMARY KEY (`idusuario_permiso`),
  KEY `fk_u_permiso_usuario_idx` (`idusuario`),
  KEY `fk_usuario_permiso_idx` (`idpermiso`),
  CONSTRAINT `fk_u_permiso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_permiso` FOREIGN KEY (`idpermiso`) REFERENCES `permiso` (`idpermiso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_permiso`
--

LOCK TABLES `usuario_permiso` WRITE;
/*!40000 ALTER TABLE `usuario_permiso` DISABLE KEYS */;
INSERT INTO `usuario_permiso` VALUES (97,2,1),(98,2,4),(99,3,4),(101,1,1),(102,1,2),(103,1,3),(104,1,4),(105,1,5),(106,1,6),(107,1,7),(108,1,8);
/*!40000 ALTER TABLE `usuario_permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) DEFAULT NULL,
  `total_venta` decimal(11,2) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idventa`),
  KEY `fk_venta_persona_idx` (`idcliente`),
  KEY `fk_venta_usuario_idx` (`idusuario`),
  CONSTRAINT `fk_venta_persona` FOREIGN KEY (`idcliente`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (10,8,1,'Boleta','001','0001','2018-01-08 00:00:00',0.00,11800.15,'Aceptado'),(11,8,1,'Factura','001','0002','2018-03-05 00:00:00',18.00,3800.00,'Aceptado'),(12,8,1,'Ticket','001','0001','2018-04-17 00:00:00',0.00,1000.00,'Aceptado'),(13,8,1,'Factura','001','0002','2018-06-09 00:00:00',18.00,240.00,'Aceptado'),(14,8,1,'Factura','20','30','2018-07-24 00:00:00',18.00,490.00,'Aceptado'),(15,8,1,'Factura','001','0008','2018-08-26 00:00:00',18.00,20.00,'Aceptado'),(16,8,1,'Boleta','001','0070','2018-08-26 00:00:00',0.00,245.00,'Aceptado'),(17,8,1,'Factura','002','0004','2018-08-26 00:00:00',18.00,245.00,'Aceptado'),(18,8,1,'Boleta','001','0006','2018-08-26 00:00:00',0.00,30.00,'Aceptado'),(19,8,1,'Factura','001','0009','2018-08-26 00:00:00',18.00,248.00,'Aceptado'),(20,8,1,'Factura','001','002','2018-08-26 00:00:00',18.00,50.00,'Aceptado'),(21,8,1,'Factura','001','0004','2018-08-27 00:00:00',18.00,25.00,'Aceptado'),(22,11,1,'Ticket','001','0004','2018-08-27 00:00:00',0.00,360.00,'Aceptado'),(23,11,1,'Ticket','1','2','2022-04-18 00:00:00',0.00,60.00,'Aceptado'),(24,11,1,'Factura','','000-052','2022-04-18 00:00:00',18.00,480.00,'Aceptado'),(25,8,3,'Boleta','133','233','2022-04-18 00:00:00',18.00,300.00,'Aceptado'),(26,8,1,'Boleta','','2','2022-04-18 00:00:00',18.00,145.00,'Aceptado'),(27,8,1,'Ticket','1','2','2022-04-18 00:00:00',0.00,300.00,'Aceptado'),(28,8,1,'Ticket','','000315877','2022-04-18 00:00:00',0.00,8.00,'Aceptado'),(29,8,1,'Ticket','00003','002','2022-04-18 00:00:00',0.00,80.00,'Aceptado');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-18 17:45:47
