CREATE TABLE `login` (
  `USER_ID` int NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(40) NOT NULL,
  `CONTACT` int DEFAULT NULL,
  `USERNAME` varchar(40) NOT NULL,
  `PASSWORD` varchar(40) NOT NULL,
  `ADMIN` varchar(40) NOT NULL,
  PRIMARY KEY (`USER_ID`)
);

CREATE TABLE `location` (
  `City` varchar(45) DEFAULT NULL,
  `ZipCode` varchar(45) NOT NULL,
  `Town` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ZipCode`)
);

CREATE TABLE `costumer` (
  `Costumer_ID` int NOT NULL AUTO_INCREMENT,
  `FIRSTNAME` varchar(40) NOT NULL,
  `LASTNAME` varchar(40) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `ZipCode` varchar(50) NOT NULL,
  `User_ID` int DEFAULT NULL,
  PRIMARY KEY (`Costumer_ID`),
  KEY `fk_login` (`User_ID`),
  CONSTRAINT `fk_login` FOREIGN KEY (`User_ID`) REFERENCES `login` (`USER_ID`),
  CONSTRAINT `fk_cost_location` FOREIGN KEY (`ZipCode`) REFERENCES `location` (`ZipCode`)
);

CREATE TABLE `owner` (
  `Owner_Id` int NOT NULL AUTO_INCREMENT,
  `FIRSTNAME` varchar(40) NOT NULL,
  `LASTNAME` varchar(40) NOT NULL,
  `User_ID` int DEFAULT NULL,
  PRIMARY KEY (`Owner_Id`),
  KEY `fk_ownerLogin` (`User_ID`),
  CONSTRAINT `fk_ownerLogin` FOREIGN KEY (`User_ID`) REFERENCES `login` (`USER_ID`)
);

CREATE TABLE `properties` (
  `Property_ID` int NOT NULL AUTO_INCREMENT,
  `RentOrSale` varchar(40) NOT NULL,
  `Property_type` varchar(40) NOT NULL,
  `NumberOfRooms` varchar(40) NOT NULL,
  `Size` int NOT NULL,
  `Price` varchar(40) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `ZipCode` varchar(50) NOT NULL,
  `Owner_ID` int NOT NULL,
  PRIMARY KEY (`Property_ID`),
  KEY `fk_owner` (`Owner_ID`),
  CONSTRAINT `fk_owner` FOREIGN KEY (`Owner_ID`) REFERENCES `owner` (`Owner_Id`),
  CONSTRAINT `fk_pro_location` FOREIGN KEY (`ZipCode`) REFERENCES `location` (`ZipCode`)
);

CREATE TABLE `realestateagent` (
  `Agent_ID` int NOT NULL AUTO_INCREMENT,
  `FIRSTNAME` varchar(40) NOT NULL,
  `LASTNAME` varchar(40) NOT NULL,
  `User_ID` int DEFAULT NULL,
  PRIMARY KEY (`Agent_ID`),
  KEY `fk_loginAgent` (`User_ID`),
  CONSTRAINT `fk_loginAgent` FOREIGN KEY (`User_ID`) REFERENCES `login` (`USER_ID`)
);

CREATE TABLE `contract` (
  `CONTRACT_ID` int NOT NULL AUTO_INCREMENT,
  `STATUS` varchar(40) NOT NULL,
  `Property_ID` int DEFAULT NULL,
  `Costumer_ID` int DEFAULT NULL,
  `Agent_ID` int DEFAULT NULL,
  `Costumerrating` float DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  PRIMARY KEY (`CONTRACT_ID`),
  KEY `fk_propertiesContract` (`Property_ID`),
  KEY `fk_costumerContract` (`Costumer_ID`),
  KEY `fk_agentAppointments` (`Agent_ID`),
  CONSTRAINT `fk_agentAppointments` FOREIGN KEY (`Agent_ID`) REFERENCES `realestateagent` (`Agent_ID`),
  CONSTRAINT `fk_costumerContract` FOREIGN KEY (`Costumer_ID`) REFERENCES `costumer` (`Costumer_ID`),
  CONSTRAINT `fk_propertiesContract` FOREIGN KEY (`Property_ID`) REFERENCES `properties` (`Property_ID`)
);

CREATE TABLE `appointments` (
  `APPOINTMENT_ID` int NOT NULL AUTO_INCREMENT,
  `DATE` datetime NOT NULL,
  `NOTES` varchar(40) DEFAULT NULL,
  `Agent_ID` int DEFAULT NULL,
  `Costumer_ID` int DEFAULT NULL,
  `Property_ID` int DEFAULT NULL,
  PRIMARY KEY (`APPOINTMENT_ID`),
  KEY `fk_adminAppointments` (`Agent_ID`),
  KEY `fk_costumerAppointments` (`Costumer_ID`),
  KEY `fk_productsAppointments` (`Property_ID`),
  CONSTRAINT `fk_adminAppointments` FOREIGN KEY (`Agent_ID`) REFERENCES `realestateagent` (`Agent_ID`),
  CONSTRAINT `fk_costumerAppointments` FOREIGN KEY (`Costumer_ID`) REFERENCES `costumer` (`Costumer_ID`),
  CONSTRAINT `fk_productsAppointments` FOREIGN KEY (`Property_ID`) REFERENCES `properties` (`Property_ID`)
);

INSERT INTO `dbms`.`login` (`USER_ID`, `EMAIL`, `CONTACT`, `USERNAME`, `PASSWORD`, `ADMIN`) VALUES ('1', 'beatriz@gmail.com', '917520147', 'beatriz_granja', '123', 'Sim');
INSERT INTO `dbms`.`login` (`USER_ID`, `EMAIL`, `CONTACT`, `USERNAME`, `PASSWORD`, `ADMIN`) VALUES ('2', 'sara@gmail.com', '964520147', 'sara_nunes', '123', 'Não');
INSERT INTO `dbms`.`login` (`USER_ID`, `EMAIL`, `CONTACT`, `USERNAME`, `PASSWORD`, `ADMIN`) VALUES ('3', 'ruben@gmail.com', '921520147', 'ruben_alexandre', '123', 'Não');
INSERT INTO `dbms`.`login` (`USER_ID`, `EMAIL`, `CONTACT`, `USERNAME`, `PASSWORD`, `ADMIN`) VALUES ('4', 'joaria@gmail.com', '924757854', 'joaria_moreira', '123', 'Não');
INSERT INTO `dbms`.`login` (`USER_ID`, `EMAIL`, `CONTACT`, `USERNAME`, `PASSWORD`, `ADMIN`) VALUES ('5', 'claudio@gmail.com', '924757854', 'claudio_rodrigues', '123', 'Sim');
INSERT INTO `dbms`.`login` (`USER_ID`, `EMAIL`, `CONTACT`, `USERNAME`, `PASSWORD`, `ADMIN`) VALUES ('6', 'joão@gmail.com', '947852524', 'joao_nunes', '1234', 'Não');
INSERT INTO `dbms`.`login` (`USER_ID`, `EMAIL`, `CONTACT`, `USERNAME`, `PASSWORD`, `ADMIN`) VALUES ('7', 'inês@gmail.com', '914785297', 'ines_garcia', '1003-347', 'Não');
INSERT INTO `dbms`.`login` (`USER_ID`, `EMAIL`, `CONTACT`, `USERNAME`, `PASSWORD`, `ADMIN`) VALUES ('8', 'filipe@gmail.com', '914258741', 'filipe_pinto', 'Welcome', 'Não');
INSERT INTO `dbms`.`login` (`USER_ID`, `EMAIL`, `CONTACT`, `USERNAME`, `PASSWORD`, `ADMIN`) VALUES ('9', 'joao@gmail.com', '917875278', 'joao_espinha', '12345', 'Não');
INSERT INTO `dbms`.`login` (`USER_ID`, `EMAIL`, `CONTACT`, `USERNAME`, `PASSWORD`, `ADMIN`) VALUES ('10', 'joaol@gmail.com', '91827437', 'joao_lopes', '12324', 'Não');
INSERT INTO `dbms`.`login` (`USER_ID`, `EMAIL`, `CONTACT`, `USERNAME`, `PASSWORD`, `ADMIN`) VALUES ('11', 'luisg@gmail.com', '928437895', 'luis_garcia', '12435', 'Não');
INSERT INTO `dbms`.`login` (`USER_ID`, `EMAIL`, `CONTACT`, `USERNAME`, `PASSWORD`, `ADMIN`) VALUES ('12', 'joaquim@gmail.com', '913457826', 'joaquim_lopes', 'Welcome1', 'Não');
INSERT INTO `dbms`.`login` (`USER_ID`, `EMAIL`, `CONTACT`, `USERNAME`, `PASSWORD`, `ADMIN`) VALUES ('13', 'luisac@gmail.com', '917687802', 'luisa_costa', 'ola', 'Não');

INSERT INTO `dbms`.`location` (`City`, `ZipCode`, `Town`) VALUES ('Lisbon', '1500-003', 'Benfica');
INSERT INTO `dbms`.`location` (`City`, `ZipCode`, `Town`) VALUES ('Lisbon', '2134-011', 'Lisbon');
INSERT INTO `dbms`.`location` (`City`, `ZipCode`, `Town`) VALUES ('Cascais', '2735-121', 'Carcavelos');
INSERT INTO `dbms`.`location` (`City`, `ZipCode`, `Town`) VALUES ('Cascais', '2750-008', 'Cascais');
INSERT INTO `dbms`.`location` (`City`, `ZipCode`, `Town`) VALUES ('Cascais', '2785-347', 'Parede');
INSERT INTO `dbms`.`location` (`City`, `ZipCode`, `Town`) VALUES ('Almada', '2800-010', 'Caparica');
INSERT INTO `dbms`.`location` (`City`, `ZipCode`, `Town`) VALUES ('Almada', '2800-130', 'Almada');
INSERT INTO `dbms`.`location` (`City`, `ZipCode`, `Town`) VALUES ('Almada', '2801-103', 'Costa da Caparica');
INSERT INTO `dbms`.`location` (`City`, `ZipCode`, `Town`) VALUES ('Lisbon', '7565-017', 'Alvalade');
INSERT INTO `dbms`.`location` (`City`, `ZipCode`, `Town`) VALUES ('Lisbon', '9170-001', 'Massamá');

INSERT INTO `dbms`.`costumer` (`Costumer_ID`, `FIRSTNAME`, `LASTNAME`, `Address`, `ZipCode`, `User_ID`) VALUES ('1', 'João', 'Nunes', 'Rua Anastácio Rosa', '1500-003', '6');
INSERT INTO `dbms`.`costumer` (`Costumer_ID`, `FIRSTNAME`, `LASTNAME`, `Address`, `ZipCode`, `User_ID`) VALUES ('2', 'Sara', 'Nunes', 'Rua Oliveira Santos', '2735-121', '2');
INSERT INTO `dbms`.`costumer` (`Costumer_ID`, `FIRSTNAME`, `LASTNAME`, `Address`, `ZipCode`, `User_ID`) VALUES ('3', 'Ruben', 'Alexandre', 'Praceta Julio Matos', '2750-008', '3');
INSERT INTO `dbms`.`costumer` (`Costumer_ID`, `FIRSTNAME`, `LASTNAME`, `Address`, `ZipCode`, `User_ID`) VALUES ('4', 'Joaria', 'Moreira', 'Praça Camões', '2785-347', '4');
INSERT INTO `dbms`.`costumer` (`Costumer_ID`, `FIRSTNAME`, `LASTNAME`, `Address`, `ZipCode`, `User_ID`) VALUES ('5', 'Inês', 'Garcia', 'Rua Guerra Junqueiro', '2134-011', '7');
INSERT INTO `dbms`.`costumer` (`Costumer_ID`, `FIRSTNAME`, `LASTNAME`, `Address`, `ZipCode`, `User_ID`) VALUES ('6', 'Filipe', 'Pinto', 'Rua Natália Correia', '2801-103', '8');
INSERT INTO `dbms`.`costumer` (`Costumer_ID`, `FIRSTNAME`, `LASTNAME`, `Address`, `ZipCode`, `User_ID`) VALUES ('7', 'João', 'Espinha', 'Oxford Street', '2800-130', '9');

INSERT INTO `dbms`.`owner` (`Owner_Id`, `FIRSTNAME`, `LASTNAME`, `User_ID`) VALUES ('1', 'Joao', 'Lopes', '10');
INSERT INTO `dbms`.`owner` (`Owner_Id`, `FIRSTNAME`, `LASTNAME`, `User_ID`) VALUES ('2', 'Luis', 'Garcia', '11');
INSERT INTO `dbms`.`owner` (`Owner_Id`, `FIRSTNAME`, `LASTNAME`, `User_ID`) VALUES ('3', 'Joaquim', 'Chaves', '12');
INSERT INTO `dbms`.`owner` (`Owner_Id`, `FIRSTNAME`, `LASTNAME`, `User_ID`) VALUES ('4', 'Luisa', 'Costa', '13');

INSERT INTO `dbms`.`realestateagent` (`Agent_ID`, `FIRSTNAME`, `LASTNAME`, `User_ID`) VALUES ('1', 'Beatriz', 'Granja', '1');
INSERT INTO `dbms`.`realestateagent` (`Agent_ID`, `FIRSTNAME`, `LASTNAME`, `User_ID`) VALUES ('2', 'Cláudio', 'Rodrigues', '5');
INSERT INTO `dbms`.`properties` (`Property_ID`, `RentOrSale`, `Property_type`, `NumberOfRooms`, `Size`, `Price`, `Address`, `ZipCode`, `Owner_ID`) VALUES ('1', 'Sale', 'Apartment', '4', '120', '150000', 'Rua Natália Correia', '2735-121', '2');
INSERT INTO `dbms`.`properties` (`Property_ID`, `RentOrSale`, `Property_type`, `NumberOfRooms`, `Size`, `Price`, `Address`, `ZipCode`, `Owner_ID`) VALUES ('2', 'Rent', 'House', '5', '200', '2000', 'Praça Marques de Pombal', '1500-003', '2');
INSERT INTO `dbms`.`properties` (`Property_ID`, `RentOrSale`, `Property_type`, `NumberOfRooms`, `Size`, `Price`, `Address`, `ZipCode`, `Owner_ID`) VALUES ('3', 'Rent', 'Apartment', '1', '50', '700', 'Rua João Pinto', '2735-121', '1');
INSERT INTO `dbms`.`properties` (`Property_ID`, `RentOrSale`, `Property_type`, `NumberOfRooms`, `Size`, `Price`, `Address`, `ZipCode`, `Owner_ID`) VALUES ('5', 'Sale', 'Apartment', '3', '100', '200000', 'Rua João Costa', '9170-001', '3');
INSERT INTO `dbms`.`properties` (`Property_ID`, `RentOrSale`, `Property_type`, `NumberOfRooms`, `Size`, `Price`, `Address`, `ZipCode`, `Owner_ID`) VALUES ('6', 'Sale', 'Apartment', '0', '40', '70000', 'Rua Julio Dinis', '2735-121', '4');
INSERT INTO `dbms`.`properties` (`Property_ID`, `RentOrSale`, `Property_type`, `NumberOfRooms`, `Size`, `Price`, `Address`, `ZipCode`, `Owner_ID`) VALUES ('7', 'Sale', 'Garage', '0', '50', '50000', 'Rua Padre Gouveira', '2800-010', '1');
INSERT INTO `dbms`.`properties` (`Property_ID`, `RentOrSale`, `Property_type`, `NumberOfRooms`, `Size`, `Price`, `Address`, `ZipCode`, `Owner_ID`) VALUES ('8', 'Sale', 'Apartment', '3', '100', '140000', 'Rua João Carlos', '7565-017', '4');
INSERT INTO `dbms`.`properties` (`Property_ID`, `RentOrSale`, `Property_type`, `NumberOfRooms`, `Size`, `Price`, `Address`, `ZipCode`, `Owner_ID`) VALUES ('9', 'Sale', 'House', '10', '10000', '1000000', 'Praceta Rosa Henriques', '7565-017', '4');
INSERT INTO `dbms`.`properties` (`Property_ID`, `RentOrSale`, `Property_type`, `NumberOfRooms`, `Size`, `Price`, `Address`, `ZipCode`, `Owner_ID`) VALUES ('10', 'Sale', 'House', '4', '300', '500000', 'Rua Frederico Quentinhas', '1500-003', '1');
INSERT INTO `dbms`.`properties` (`Property_ID`, `RentOrSale`, `Property_type`, `NumberOfRooms`, `Size`, `Price`, `Address`, `ZipCode`, `Owner_ID`) VALUES ('11', 'Rent', 'Apartment', '2', '70', '1200', 'Rua Afonso Henriques', '1500-003', '2');

INSERT INTO `dbms`.`contract` (`CONTRACT_ID`, `STATUS`, `Property_ID`, `Costumer_ID`, `Agent_ID`, `Costumerrating`, `Date`) VALUES ('1', 'Sold', '3', '2', '1', '8', '2020-10-27 00:00:00');
INSERT INTO `dbms`.`contract` (`CONTRACT_ID`, `STATUS`, `Property_ID`, `Costumer_ID`, `Agent_ID`, `Costumerrating`, `Date`) VALUES ('2', 'Sold', '2', '5', '1', '8', '2020-09-10 00:00:00');
INSERT INTO `dbms`.`contract` (`CONTRACT_ID`, `STATUS`, `Property_ID`, `Costumer_ID`, `Agent_ID`, `Costumerrating`, `Date`) VALUES ('3', 'Rented', '5', '6', '1', '5', '2020-03-15 00:00:00');
INSERT INTO `dbms`.`contract` (`CONTRACT_ID`, `STATUS`, `Property_ID`, `Costumer_ID`, `Agent_ID`, `Costumerrating`, `Date`) VALUES ('4', 'Sold', '1', '6', '2', '7', '2020-05-01 00:00:00');
INSERT INTO `dbms`.`contract` (`CONTRACT_ID`, `STATUS`, `Property_ID`, `Costumer_ID`, `Agent_ID`, `Costumerrating`, `Date`) VALUES ('5', 'Sold', '7', '4', '1', '9', '2020-05-06 00:00:00');
INSERT INTO `dbms`.`contract` (`CONTRACT_ID`, `STATUS`, `Property_ID`, `Costumer_ID`, `Agent_ID`, `Costumerrating`, `Date`) VALUES ('6', 'Rented', '6', '3', '1', '6', '2020-05-08 00:00:00');
INSERT INTO `dbms`.`contract` (`CONTRACT_ID`, `STATUS`, `Property_ID`, `Costumer_ID`, `Agent_ID`, `Costumerrating`, `Date`) VALUES ('7', 'Rented', '8', '1', '2', '6', '2019-05-01 00:00:00');
INSERT INTO `dbms`.`contract` (`CONTRACT_ID`, `STATUS`, `Property_ID`, `Costumer_ID`, `Agent_ID`, `Costumerrating`, `Date`) VALUES ('8', 'Sold', '9', '6', '1', '4', '2019-03-01 00:00:00');
INSERT INTO `dbms`.`contract` (`CONTRACT_ID`, `STATUS`, `Property_ID`, `Costumer_ID`, `Agent_ID`, `Costumerrating`, `Date`) VALUES ('10', 'Sold', '10', '6', '1', '7', '2019-07-01 00:00:00');
INSERT INTO `dbms`.`contract` (`CONTRACT_ID`, `STATUS`, `Property_ID`, `Costumer_ID`, `Agent_ID`, `Costumerrating`, `Date`) VALUES ('11', 'Rented', '11', '4', '1', '4', '2019-08-01 00:00:00');

INSERT INTO `dbms`.`appointments` (`APPOINTMENT_ID`, `DATE`, `NOTES`, `Agent_ID`, `Costumer_ID`, `Property_ID`) VALUES ('2', '2020-12-20 20:00:00', '', '1', '4', '5');
INSERT INTO `dbms`.`appointments` (`APPOINTMENT_ID`, `DATE`, `NOTES`, `Agent_ID`, `Costumer_ID`, `Property_ID`) VALUES ('3', '2020-11-24 15:00:00', '', '2', '3', '3');
INSERT INTO `dbms`.`appointments` (`APPOINTMENT_ID`, `DATE`, `NOTES`, `Agent_ID`, `Costumer_ID`, `Property_ID`) VALUES ('4', '2020-10-20 15:00:00', '', '1', '2', '5');
