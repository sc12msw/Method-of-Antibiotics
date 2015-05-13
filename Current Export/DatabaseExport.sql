-- MySQL dump 10.13  Distrib 5.6.22, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: CFMedDB
-- ------------------------------------------------------
-- Server version	5.6.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Adult_Administration`
--

DROP TABLE IF EXISTS `Adult_Administration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Adult_Administration` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Oral` mediumtext,
  `IV` mediumtext,
  `Inhaled` mediumtext,
  `IM` mediumtext,
  `PR` mediumtext,
  `SC` mediumtext,
  `Drugs_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Adult_Administration_Drugs1_idx` (`Drugs_ID`),
  CONSTRAINT `fk_Adult_Administration_Drugs1` FOREIGN KEY (`Drugs_ID`) REFERENCES `Drugs` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adult_Administration`
--

LOCK TABLES `Adult_Administration` WRITE;
/*!40000 ALTER TABLE `Adult_Administration` DISABLE KEYS */;
INSERT INTO `Adult_Administration` VALUES (1,'NULL','Reconstitute 2 gms in 20 ml water for injection and give as a bolus over 5 minutes or dilute with saline or 5% glucose to 50-200 ml and infuse over 15-30 minutes. ','NULL','NULL','NULL','NULL',1),(3,'Treat for 2 weeks for acute pseudomonal infection. Treat for 3 months for eradication of P.aeruginosa in combination with nebulised colistin. Available as 100 mg, 250 mg, 500 mg and 750 mg tablets or 250 mg/5ml suspension. ','Infuse over 60 minutes.','NULL','NULL','NULL','NULL',3),(4,'NULL','Reconstitute vials to 10ml with water then either dilute to 50ml with NaCl 0.9% and infuse over 30 minutes, or inject the 10ml as a bolus over 3 minutes.','NULL','NULL','NULL','NULL',4),(5,'NULL','2 g reconstituted with 10 ml 0.9% saline (3g/15 ml ) and given as a bolus over 3-5 minutes or after reconstituting with water for injection dilute to 50 ml with saline and infuse over 20-30 minutes. Best given over 30 minutes.','NULL','NULL','NULL','NULL',5),(6,'NULL','Infusion-dilute with 50 ml 0.9% saline and infuse over 30 minutes. If neurological side-effects are a problem,use 75,000 units/kg/day in 3 divided doses instead of 2 MU three times a dayBolus dose-dilute 2 million units in 10 ml NaCl 0.9% and give over 3-5 minutes through central access (adult only).','Reconstitute 1x1 MU vial with 2 ml WFI and 1x1 MU vial with 2 ml NaCl 0.9% and mix together. If administered via the i - neb reconstitute one vial of Promixin with 1 ml of WFI.','NULL','NULL','NULL',6),(7,'NULL','NULL','NULL','NULL','NULL','NULL',7),(8,'NULL','Tazocin can be diluted with 20 ml water and infused over 3 to 5 minutes or reconstituted in 50 ml saline and given over 30 minutes.','NULL','NULL','NULL','NULL',8),(9,'NULL','Infuse over 30 to 40 minutes.','NULL','NULL','NULL','NULL',9),(10,'NULL','Once daily dosing: take trough concentration immediately before next dose is due. Ensure trough is less than 1mg/litre. Give dose over 30 - 60 mins in 50ml - 100 mls sodium chloride 0.9%. Three times a day dosing: ensure trough is less 2 mg/litre, peak at one hour is 8-12mg/litre. Give dose as bolus or in 50ml NaCl 0.9% over 15 mins.','NULL','NULL','NULL','NULL',10),(11,'NULL','NULL','Ready prepared, needs no further dilution. Pari LC Plus nebuliser and filters provided by the manufacturer free of charge.','NULL','NULL','NULL',11),(12,'NULL','NULL','NULL','NULL','NULL','NULL',12),(13,'Take with plenty of water. Swallow whole with plenty of fluid during meal while sitting or standing. Available as 50mg and 100 mg capsules and 100 mg dispersible tablets.','NULL','NULL','NULL','NULL','NULL',13),(14,'Comes as 250 mg capsules.','Can be given as a bolus injection or an infusion in Glucose 5% or sodium chloridr 0.9%.','NULL','NULL','NULL','NULL',14),(15,'NULL','NULL','NULL','NULL','NULL','NULL',15),(16,'Monitor LFT\'s, FBC, monthly for the first 3 months. Ask patient to report any unexplained bruising, bleeding, purpura, sore throat, fever or malaise - stop drug immediately if there is suspicion of blood dyscrasia.','NULL','NULL','NULL','NULL','NULL',16);
/*!40000 ALTER TABLE `Adult_Administration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Adult_Dose`
--

DROP TABLE IF EXISTS `Adult_Dose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Adult_Dose` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Oral` mediumtext,
  `IV` mediumtext,
  `Inhaled` mediumtext,
  `IM` mediumtext,
  `PR` mediumtext,
  `SC` mediumtext,
  `Drugs_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Adult_Dose_Drugs1_idx` (`Drugs_ID`),
  CONSTRAINT `fk_Adult_Dose_Drugs1` FOREIGN KEY (`Drugs_ID`) REFERENCES `Drugs` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adult_Dose`
--

LOCK TABLES `Adult_Dose` WRITE;
/*!40000 ALTER TABLE `Adult_Dose` DISABLE KEYS */;
INSERT INTO `Adult_Dose` VALUES (1,'NULL','2 gm tds. (Some patients can only tolerate 1 gm tds usually due to nausea).','NULL','NULL','NULL','NULL',1),(3,'750 bd.','400 mg bd.','NULL','NULL','NULL','NULL',3),(4,'NULL','2.5 grams tds.','NULL','NULL','NULL','NULL',4),(5,'NULL','150-200 mg/kg/24 hrs given in 2 to 3 doses. Maximum dose 12 g/day.','NULL','NULL','NULL','NULL',5),(6,'NULL','75,000 units/kg/day Standard adult dose (over 60 kg) 2 million units tds. Reduce dose in renal failure or when used with an aminoglycoside (avoid if possible).','1-2 million units bd. 1 million units bd if administered via the i-neb.','NULL','NULL','NULL',6),(7,'NULL','NULL','NULL','NULL','NULL','NULL',7),(8,'NULL','Tazocin given as 4.5 gm tds.','NULL','NULL','NULL','NULL',8),(9,'NULL','3.2 g every 6-8 hourly (max 3.2 g every 4 hours).','NULL','NULL','NULL','NULL',9),(10,'NULL','10 mg/kg/24 hrs given as a single dose or as three separate doses.','NULL','NULL','NULL','NULL',10),(11,'NULL','NULL','300 mg bd on a cyclical basis ( 28 days of tobramycin followed by a 28 day tobramycin free interval).','NULL','NULL','NULL',11),(12,'NULL','NULL','NULL','NULL','NULL','NULL',12),(13,'200mg od or 100 mg bd.','NULL','NULL','NULL','NULL','NULL',13),(14,'Doses of 25mg/kg in 4 divided doses. Reduce dose in hepatic or renal impairment. Usually use 500 mg tds or qds.','50 mg/kg daily in 4 divided doses. Avoid repeated courses and prolonged treatment. Monitor blood counts before and periodically during treatment.','NULL','NULL','NULL','NULL',14),(15,'NULL','NULL','NULL','NULL','NULL','NULL',15),(16,'500mg daily week 2: 500mg bd week 3: 500mg tds week 4: 1000mg bd continue on this dose if tolerated.','NULL','NULL','NULL','NULL','NULL',16);
/*!40000 ALTER TABLE `Adult_Dose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Brand_Names`
--

DROP TABLE IF EXISTS `Brand_Names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Brand_Names` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Brand_Name` varchar(100) DEFAULT NULL,
  `Drugs_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Brand_Names_Drugs1_idx` (`Drugs_ID`),
  CONSTRAINT `fk_Brand_Names_Drugs1` FOREIGN KEY (`Drugs_ID`) REFERENCES `Drugs` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Brand_Names`
--

LOCK TABLES `Brand_Names` WRITE;
/*!40000 ALTER TABLE `Brand_Names` DISABLE KEYS */;
INSERT INTO `Brand_Names` VALUES (1,'Meronem',1),(4,'Ciproxin',3),(5,'Azactam',4),(6,'Fortum',5),(7,'Kefadim',5),(8,'Colomycin',6),(9,'Promixin',6),(10,'Primaxin',7),(11,'Tazocin',8),(12,'Timentin',9),(13,'Tobi',11),(14,'Vibramycin',13),(15,'Negban',15),(16,'Salazopyrin',16);
/*!40000 ALTER TABLE `Brand_Names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Drugs`
--

DROP TABLE IF EXISTS `Drugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Drugs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Indication` mediumtext,
  `Side_Effects` mediumtext,
  `Type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Drugs`
--

LOCK TABLES `Drugs` WRITE;
/*!40000 ALTER TABLE `Drugs` DISABLE KEYS */;
INSERT INTO `Drugs` VALUES (1,'Meropenem','Treatment of Pseudomonas aeruginosa and Burkholderia respiratory infections. Also active against H.influenza and S.aureus. ','Nausea, vomiting, diarrhoea, abdo pain, disturbance in LFTs, thrombocytopenia, leucopenia, eosinophilia, neutropenia, headaches, paraesthesia, hypersensitivity reaction s including rash, pruritus , urticaria, angioedema and anaphylaxis; also reported convulsions, phlebitis,oral and vaginal candidiasis. ','Antibiotic'),(3,'Ciprofloxacin','Treatment of Pseudomonas aeruginosa respiratory infections. Part of Pseudomonas aeruginosa eradication protocol. Treatment of community acquired pneumonia. Relatively poor activity against S. pneumoniae. ','Nausea, vomiting, dyspesia, abdo pain, diarrhoea, headaches, dizziness, UV hypersensitivity, transient disturbance in LFTs, increase in urea and creatinine,drowsiness (caution driving),convulsions, confusion, hypersensitivity reactions,eosinophilia, leucopenia, thrombocytopenia, disturbance in taste, vision, hearing,arthralgia, myalgia, tachycardia, tendon inflammation and damage.  ','Antibiotic'),(4,'Aztreonam','Treatment of Pseudomonas aeruginosa and Burkholderia respiratory infections (covers H. influenzae).','Rash, pruritus, eosinophilia, increase in PT time, thrombocytopenia, neutropenia, jaundice, hepatitis, transient elevations of hepatic transaminases and alk phos, diarrhoea, nausea, mouth ulcers, altered taste. Reduce dose in renal failure, anaemia,vaginitis, candidiasis, hypotension, weakness, confusion, vertigo, sweating, headaches, halitosis, headaches, fever, malaise, sneezing. ','Antibiotic'),(5,'Ceftazidime','Treatment of Pseudomonas aeruginosa and Burkholderia respiratory infections (covers H.influenzae). ','Diarrhoea and vomiting, colitis, abdominal pain, headaches, hypersensitivity, erythema multiforme, abnormal liver function, cholestatic jaundice, eosinophilia, thrombocytopenia, leucopenia, agranulocytosis, aplastic anaemia, candidiasis, vaginitis,nephritis, confusion, hypertonia, dizziness, bad taste, convulsions, encephalopathy.','Antibiotic'),(6,'Colistin','Treatment, prophylaxis and eradication of Pseudomonas aeruginosa infection.','Neurotoxicity especially with excessive doses (including perioral & peripheral paraesthesia, vertigo, muscle weakness, slurred speech, visual disturbance, apnoea, confusion and psychosis),nephrotoxicity, hypersensitivity reactions including rash. Inhaled therapy may cause sore throat , cough and bronchospasm which may be negated by the use of inhaled beta agonists. Bolus Colomycin should only be administered via a central line.','Antibiotic'),(7,'Imipenem and Cilastatin','Treatment of Pseudomonas aeruginosa and Burkholderia respiratory infections. Also active against community acquired bacteria such as H.influenzae, Streptococcus and S aureus. Broad spectrum of activity which includes many aerobic and anaerobic gram positive and gram negative bacteria.','Nausea, vomiting, diarrhoea (antibiotic associated colitis reported), abdo pain, disturbance in LFTs, headaches, paraesthesia.Hypersensitivity (partial cross allergenicity with other betalactam antibiotics, penicillins and cephalosporins), including rash,pruritis,urticaria, Stevens -Johnson syndrome, fever, anaphylactic reactions, rarley toxic epidermal necrolysis, exfoliative dermatitis. Convulsions, myoclonus, tremor, phlebitis. Increases in creatinine and urea,oliguria, polyuria, taste disturbance, hypotension, palpitations, tachycardia, polyarthralgia, asthenia, red coloration of urine in children.tTooth or tonugue discoloraion, positive Coombs test, blood disorders.','Antibiotic'),(8,'Piperacillin and Tazobactam','Treatment of Pseudomonas aeruginosa and Burkholderia respiratory infections. Activity against H influenzae.','Hypersensitivity reaction, haemolytic anaemia, nephritis erythema multiforme, Steven-Johnson syndrome, leucopenia, thrombocytopenia, paraesthesia, diarrhoea, colitis, hepatitis, cholestatic jaundice, increased LFT.','Antibiotic'),(9,'Ticarcillin and Clavulanic acid','Treatment of Pseudomonas aeruginosa and Burkholderia respiratory infections. Activity against H influenzae.','Nausea, vomiting, diarrhoea, colitis, coagulation disorders, heamorragic cystitis (more common in children), injection site reactions, Hypersensitivity reactions, haemolytic anaemia (rare), nephritis, erythema multiforme, Steven-Johnson syndrome, leucopenia, thrombocytopenia, confusion, hypokaleamia.','Antibiotic'),(10,'Tobramycin','Treatment of Pseudomonas aeruginosa and Burkholderia cepacia respiratory infections. Prophylaxis for Pseudomonas aeruginosa infection.','Vestibular and auditory damage, nephrotoxicity, hypomagnesaemia, hypokalemia,antibiotic associated colitis, nausea, vomiting,diarrhoea, hypersensitivity (fever, rash), raised LFT and bilirubin,haematological disorders,headaches, confusion.','Antibiotic'),(11,'Tobramycin (TOBI)','Nebulised anti pseudomonal treatment.','Bronchospasm, cough, tinnitus, haemoptysis, voice alteration and mouth ulcers.','Antibiotic'),(12,'Fosfomycin','Treatment of Pseudomonas auriginosa','Nausea','Antibiotic'),(13,'Doxycycline','Sensitive Haemophilus influenzae and Staph aureus infections. Used in combination to treat Burkholderia cepacia, Stenotrophomonas maltophilia and Achromobacter (Alcaligenes) xylosoxidans','Nausea, vomiting, diarrhoea (antibiotic associated colitis), dysphagia,anorexia and oesophageal irritation. other rare side-effects include hepatotoxicity, blood dyscrasias, photosensitivity, reactions (including rash, exfoliative dermatitis, urticaria, angioedema, anaphylaxis, pericarditis). headache and visual disturbances may indicate benign intracranial hypertension (discontinue treatment). ','Antibiotic'),(14,'Chloramphenicol','Serious infections unresponsive to other antibiotics including B.cepacia. Active against H.influenzae and Staph aureus. Caution must be taken.','Blood dycrasias including reversible and irreversible aplastic anaemia, hypoplastic anaemia, thrombocytopenia, agranulocytosis, nausea, vomiting,glossitis, stomatitis, diarrhoea, erythema multiforme, optic and peripheral neuropathy. Monitor blood count before and periodically during treatment.','Antibiotic'),(15,'Temocillin','Temocillin is a ?-lactamase resistant penicillin with activity against Burkholderia cepacia. The drug has limited efficacy in patients infected with Pseudomonas aeruginosa.','Adverse effects like any ?-lactam antibiotic, angioedema, anaphylaxis in penicillin allergic patients, convulsions.','Antibiotic'),(16,'Sulphasalazine','Rheumatoid arthritis, ulcerative colitis and Chrons diseaaase,CF related arthropathy.','Rash, diarrhoea, abdominal pain, headache,leucopenia, neutropenia, thrombocytopenia, orange urine & tears, nausea, reduced appetite, pyrexia, agranulocytosis, haemolytic anaemia, megaloblastic anaemia, hypoprolactinaemia, Stevens Johnson syndrome,pruritus, photosensitivity,urticaria, periorbital oedema, arthralgia, eosinophilia, fibrosing alveolitis, stomatitis, parotitis, pancreatitis, hepatitis, perecarditis, myocarditis, vertigo, tinnitus,neuropathy, ataxia, fits,depression, insomnia, hallucinations, oligospermia, haematuria, proteinuria/nephro.','Anti-inflammatory Agent');
/*!40000 ALTER TABLE `Drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `First_Line`
--

DROP TABLE IF EXISTS `First_Line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `First_Line` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Drug_Name` varchar(100) DEFAULT NULL,
  `Drugs_ID` int(11) NOT NULL,
  `Pathogens_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_First_Line_Pathogens1_idx` (`Pathogens_ID`),
  KEY `fk_First_Line_Drugs1_idx` (`Drugs_ID`),
  CONSTRAINT `fk_First_Line_Drugs1` FOREIGN KEY (`Drugs_ID`) REFERENCES `Drugs` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_First_Line_Pathogens1` FOREIGN KEY (`Pathogens_ID`) REFERENCES `Pathogens` (`Pathogen_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `First_Line`
--

LOCK TABLES `First_Line` WRITE;
/*!40000 ALTER TABLE `First_Line` DISABLE KEYS */;
INSERT INTO `First_Line` VALUES (8,'Meropenem',1,5),(9,'Ciprofloxacin',3,5),(10,'Aztreonam',4,5),(11,'Ceftazidime',5,5),(12,'Colistin',6,5),(13,'Imipenem and Cilastatin',7,5),(14,'Piperacillin and Tazobactam',8,5),(15,'Ticarcillin and Clavulanic acid',9,5),(16,'Tobramycin',10,5),(17,'Tobramycin (TOBI)',11,5),(18,'Meropenem',1,6),(19,'Ciprofloxacin',3,6),(20,'Aztreonam',4,6),(21,'Colistin',6,6),(22,'Imipenem and Cilastatin',7,6),(23,'Piperacillin and Tazobactam',8,6),(24,'Ticarcillin and Clavulanic acid',9,6),(25,'Tobramycin',10,6),(26,'Tobramycin (TOBI)',11,6),(27,'Doxycycline',13,6),(28,'Chloramphenicol',14,6),(29,'Temocillin',15,6);
/*!40000 ALTER TABLE `First_Line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Interactions`
--

DROP TABLE IF EXISTS `Interactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Interactions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Interacting_Drug` varchar(100) DEFAULT NULL,
  `Effect` mediumtext,
  `Drugs_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Interations_Drugs1_idx` (`Drugs_ID`),
  CONSTRAINT `fk_Interations_Drugs1` FOREIGN KEY (`Drugs_ID`) REFERENCES `Drugs` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Interactions`
--

LOCK TABLES `Interactions` WRITE;
/*!40000 ALTER TABLE `Interactions` DISABLE KEYS */;
INSERT INTO `Interactions` VALUES (1,'Probenecid','Excretion of Meropenem reduced by probenecid. Avoid concomitant use.',1),(2,'Valproate','Reduces plasma concentration of valproate may lead to subtherapeutic valproate levels. ',1),(6,'Warfarin','Increase INR',3),(7,'Cyclosporin','Increase risk of nephrotoxicity.',3),(8,'NSAID ','Increased risk of convulsions.',3),(9,'Calcium salts','Reduced absorption of Ciprofloxacin.\r\n',3),(10,'Magnesium salts ','Reduced absorption of Ciprofloxacin.',3),(11,'Ferrous sulphate','Reduced absorption of Ciprofloxacin.',3),(12,'Antacids','Reduce absorption of Ciprofloxacin.',3),(13,'Theophylline','Increases theophylline level, increases risk of convulsions. ',3),(14,'Probenecid','Reduces excretion of Ciprofloxacin. ',3),(15,'Warfarin','May increae INR',4),(16,'Warfarin','Enhances effect of warfarin ',5),(17,'Probenecid ','Excretion of cephalosporins reduced.',5),(18,'Oestrogens','Possibly reduce contraceptive effect of oestrogen.',5),(19,'Alendronate, Etidronate','Increased risk of hypocalcaemia.',6),(20,'Muscle relaxants','Enhance muscle relaxant effect.',6),(21,'Loop diuretics','Increased risk of ototoxicity. ',6),(22,'Amphotericin','Increased risk of nephrotoxicity.',6),(23,'Pyridostigmine, Neostigmine','Antagonised effect.',6),(24,'Aminoglycosides','Increases risk of nephrotoxicity, reduces doses if concurrent use essential.',6),(25,'Ciclosporin','Increased risk of nephrotoxicity.',6),(26,'Vancomycin','Increased risk of nephrotoxicity.',6),(27,'Teicoplanin','Increased risk of nephrotoxicity and ototoxicity.',6),(28,'Ganciclovir','Increased toxicity with ganciclovir with possible convulsions.',7),(29,'Probenecid','Probenecid can double the plasma level and half life of cilastatin. probenecid only slightly increases plasma level and half life of imipenem.',7),(30,'Muscle relaxants','Enhanced by piperacillin.',8),(31,'Methotrexate','Increased risk of toxicity.',8),(32,'Probenecid','Reduced piperacillin excretion.',8),(33,'Probenecid','Reduces excretion of penicillins.',9),(34,'Cyclosporin','Increased risk of nephrotoxicity.',10),(35,'Muscle relaxants','Enhanced effect.',10),(36,'Vancomycin and Teicoplanin','Increased risk of nephrotoxicity and ototoxicity.',10),(37,'Colistin','Increased risk of nephrotoxicity.',10),(38,'Loop diuretics','Increased risk of ototoxicity.',10),(39,'Tacrolimus','Increased risk of nephrotoxicity.',10),(40,'Amphotericin','Increased risk of nephrotoxicity.',10),(41,'Bisphosphonates','Increased risk of hypocalcaemia.',10),(42,'Mannitol','Enhanced aminoglycoside toxicity',11),(43,'Ethacrynic acid','Enhanced aminoglycoside toxicity.',11),(44,'Frusemide','Enhanced aminoglycoside toxicity.',11),(45,'Aluminium hydroxide','Reduced absorption. Take 2-3 hours apart.',13),(46,'Quinapril','Reduced absorption of doxycycline.',13),(47,'Warfarin','Altered INR.',13),(48,'Cyclosporin','Possible increased cyclosporin levels.',13),(49,'Phenindone','Altered INR.',13),(50,'Iron','Reduced absorption. Take 2-3 hours apart.',13),(51,'Retinoids','Increased risk of benign intracranial hypertension.',13),(52,'Zinc','Reduced absorption of doxycycline.',13),(53,'Calcium supplements','Reduced absorption. Take 2-3 hours apart.',13),(54,'Sucralfate','Reduced absorption of doxycycline.',13),(55,'Contraceptives (oral)','Risk of reduced contraceptive effect.',13),(56,'Magnesium salts','Educed absorption. Take 2-3 hours apart.',13),(57,'Antacids','Increased metabolism of doxycycline.',13),(58,'Dairy Products','Reduced absorption. Take 2-3 hours apart.',13),(59,'Warfarin','Increased INR.',14),(60,'Rifampicin','Lowers plasma concentration of chloramphenicol.',14),(61,'Tacrolimus','Possibly increases tacrolimus levels.',14),(62,'Sulphonylureas','Sulphonylureas effect enhanced.',14),(63,'Ciclosporin','Possibly increases ciclosporin levels.',14),(64,'Phenobarbitone','metabolism of chloramphenicol enhanced.',14),(65,'Phenytoin','Increased phenytoin plasma levels.',14),(66,' Folic acid','Possibly reduces absorption of folic acid.',16),(67,'Cardiac glycosides','Reduced absorption of digoxin.',16);
/*!40000 ALTER TABLE `Interactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paediatric_Administration`
--

DROP TABLE IF EXISTS `Paediatric_Administration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Paediatric_Administration` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Oral` mediumtext,
  `IV` mediumtext,
  `Inhaled` mediumtext,
  `IM` mediumtext,
  `PR` mediumtext,
  `SC` mediumtext,
  `Drugs_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Paediatric_Administration_Drugs1_idx` (`Drugs_ID`),
  CONSTRAINT `fk_Paediatric_Administration_Drugs1` FOREIGN KEY (`Drugs_ID`) REFERENCES `Drugs` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paediatric_Administration`
--

LOCK TABLES `Paediatric_Administration` WRITE;
/*!40000 ALTER TABLE `Paediatric_Administration` DISABLE KEYS */;
INSERT INTO `Paediatric_Administration` VALUES (1,'NULL','250 mg reconstituted with 5 ml of WFI and administered over at least 5 minutes or given as an infusion.','NULL','NULL','NULL','NULL',1),(3,'Treat for 2 weeks for acute pseudomonal infection. Treat for 3 months for eradication of P.aeruginosa in combination with nebulised colistin. Available as 100 mg, 250 mg, 500 mg and 750 mg tablets or 250 mg/5ml suspension. ','Infuse over 60 minutes.','NULL','NULL','NULL','NULL',3),(4,'NULL','Reconstitute vials to 10ml with water then either dilute to 50ml with NaCl 0.9% and infuse over 30 minutes, or inject the 10ml as a bolus over 3 minutes.','NULL','NULL','NULL','NULL',4),(5,'NULL','2 g reconstituted with 10 ml 0.9% saline (3g/15 ml ) and given as a bolus over 3-5 minutes or after reconstituting with water for injection dilute to 50 ml with saline and infuse over 20-30 minutes. Best given over 30 minutes.','NULL','NULL','NULL','NULL',5),(6,'NULL','NULL','Reconstitute 1x1 MU vial with 2 ml WFI and 1x1 MU vial with 2 ml NaCl 0.9% and mix together. If administered via the i - neb reconstitute one vial of Promixin with 1 ml of WFI.','NULL','NULL','NULL',6),(7,'NULL','NULL','NULL','NULL','NULL','NULL',7),(8,'NULL','Tazocin can be diluted with 20 ml water and infused over 3 to 5 minutes or reconstituted in 50 ml saline and given over 30 minutes.','NULL','NULL','NULL','NULL',8),(9,'NULL','Infuse over 30 to 40 minutes.','NULL','NULL','NULL','NULL',9),(10,'NULL','Once daily dosing: take trough concentration immediately before next dose is due. Ensure trough is less than 1mg/litre. Give dose over 30 - 60 mins in 50ml - 100 mls sodium chloride 0.9%. Three times a day dosing: ensure trough is less 2 mg/litre, peak at one hour is 8-12mg/litre. Give dose as bolus or in 50ml NaCl 0.9% over 15 mins.','NULL','NULL','NULL','NULL',10),(11,'NULL','NULL','Although only licensed for children over 6 years, this dose has been used in children over the age of 6 months.','NULL','NULL','NULL',11),(12,'NULL','NULL','NULL','NULL','NULL','NULL',12),(13,'Do not give to children under 12 as deposition of tetracyclines into growing teeth and bones (by binding to calcium)causes staining and occasionally dental hypoplasia. Also avoid in pregnant and breast feeding women.','NULL','NULL','NULL','NULL','NULL',13),(14,'Comes as 250 mg capsules.','Plasma concentration monitoring required in neonates and preferred in those under 4 years of age. Peak plasma concentation (approx 1 hour after infusion): 15-25 mg/litre; predose (trough) concentration should not exceed 15 mg/litre.','NULL','NULL','NULL','NULL',14),(15,'NULL','NULL','NULL','NULL','NULL','NULL',15),(16,'NULL','NULL','NULL','NULL','NULL','NULL',16);
/*!40000 ALTER TABLE `Paediatric_Administration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paediatric_Dose`
--

DROP TABLE IF EXISTS `Paediatric_Dose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Paediatric_Dose` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Oral` mediumtext,
  `IV` mediumtext,
  `Inhaled` mediumtext,
  `IM` mediumtext,
  `PR` mediumtext,
  `SC` mediumtext,
  `Drugs_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Paediatric_Dose_Drugs1_idx` (`Drugs_ID`),
  CONSTRAINT `fk_Paediatric_Dose_Drugs1` FOREIGN KEY (`Drugs_ID`) REFERENCES `Drugs` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paediatric_Dose`
--

LOCK TABLES `Paediatric_Dose` WRITE;
/*!40000 ALTER TABLE `Paediatric_Dose` DISABLE KEYS */;
INSERT INTO `Paediatric_Dose` VALUES (1,'NULL','120 mg/kg/day in 3 divided doses. Max 2 g tds.','NULL','NULL','NULL','NULL',1),(3,'20 mg/kg bd (licenced aged 5-17 years). Max dose 750 mg bd. Unlicensed in children under 5 years. Eradication of new P.aeruginosa 25-50 mg/kg/day.','10 mg/kg tds (maximum total daily dose 1200 mg). ','NULL','NULL','NULL','NULL',3),(4,'NULL','200-250 mg/kg/day in 3 divided doses. Max: 8 grams/day. \r\n','NULL','NULL','NULL','NULL',4),(5,'NULL','150-200 mg/kg/day in 2 to 3 doses.Give over 20 to 30 mins. Max: 12g/day. ','NULL','NULL','NULL','NULL',5),(6,'NULL','NULL','Children <2 years: 500,000 - 1 million units bd. 1 million units bd if administered via the i-neb. Children > 2 years: 1-2 million units bd.','NULL','NULL','NULL',6),(7,'NULL','NULL','NULL','NULL','NULL','NULL',7),(8,'NULL','300 mg/kg/day in 3-4 divided doses, max: 4g tds.','NULL','NULL','NULL','NULL',8),(9,'NULL','80 mg/ kg (max 3.2 g )every 6 to 8 hourly.','NULL','NULL','NULL','NULL',9),(10,'NULL','12 mg/kg/day in 3 divided doses or 10 mg/kg/day as a single dose. Titrate according to levels.','NULL','NULL','NULL','NULL',10),(11,'NULL','NULL','Over 6 years: 300 mg bd on a cyclical basis ( 28 days of tobramycin followed by a 28 day tobramycin free interval).','NULL','NULL','NULL',11),(12,'NULL','NULL','NULL','NULL','NULL','NULL',12),(13,'Children > 12 years 100-200 mg od.','NULL','NULL','NULL','NULL','NULL',13),(14,'Over 1 year 25 mg/kg 6 hrly, up to 500 mg qds.','Haemophilus epiglottis and pyogenic meningitis 50-100 mg/kg daily in divided doses(high dosages decreased as soon as clinically indicated). Infants under 2 weeks: 25 mg/kg daily in 4 divided doses, 2 weeks to 1 year 50 mg/kg daily in 4 divided doses.','NULL','NULL','NULL','NULL',14),(15,'NULL','NULL','NULL','NULL','NULL','NULL',15),(16,'NULL','NULL','NULL','NULL','NULL','NULL',16);
/*!40000 ALTER TABLE `Paediatric_Dose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pathogens`
--

DROP TABLE IF EXISTS `Pathogens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pathogens` (
  `Pathogen_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Description` mediumtext,
  PRIMARY KEY (`Pathogen_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pathogens`
--

LOCK TABLES `Pathogens` WRITE;
/*!40000 ALTER TABLE `Pathogens` DISABLE KEYS */;
INSERT INTO `Pathogens` VALUES (5,'Pseudomonas aeruginosa','A gram negative bacterium. \"Pseudomonas infection is caused by strains of bacteria found widely in the environment; the most common type causing infections in humans is called Pseudomonas aeruginosa.\" - http://www.cdc.gov/hai/organisms/pseudomonas.html'),(6,'Burkholderia Cepacia complex','Burkholderia cepacia complex (BCC) is a group of Gram negative bacteria composed of different genomovars. Examples include B. cepacia, multivorans, B. cenocepacia, B. vietnamiensis, B. stabilis.');
/*!40000 ALTER TABLE `Pathogens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `second_line`
--

DROP TABLE IF EXISTS `second_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `second_line` (
  `ID` int(11) NOT NULL,
  `Drug_Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `second_line`
--

LOCK TABLES `second_line` WRITE;
/*!40000 ALTER TABLE `second_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `second_line` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-13 11:19:11
