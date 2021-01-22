CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Data` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `Data`;
DROP TABLE IF EXISTS `Connections`;
CREATE TABLE `Connections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `nodename` varchar(45) DEFAULT NULL,
  `podname` varchar(45) DEFAULT NULL,
  `podip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
