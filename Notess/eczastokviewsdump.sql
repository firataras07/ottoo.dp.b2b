-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: eczastok-mysql.c4wxkzrdt8ra.eu-central-1.rds.amazonaws.com    Database: eczastok
-- ------------------------------------------------------
-- Server version	8.0.23

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Temporary view structure for view `AktifDepoSayisi`
--

DROP TABLE IF EXISTS `AktifDepoSayisi`;
/*!50001 DROP VIEW IF EXISTS `AktifDepoSayisi`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `AktifDepoSayisi` AS SELECT 
 1 AS `Baslangic`,
 1 AS `Bitis`,
 1 AS `AktifDepoSayisi`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `AktifEczaDeposu`
--

DROP TABLE IF EXISTS `AktifEczaDeposu`;
/*!50001 DROP VIEW IF EXISTS `AktifEczaDeposu`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `AktifEczaDeposu` AS SELECT 
 1 AS `Baslangic`,
 1 AS `Bitis`,
 1 AS `AktifEczaDeposu`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `AktifFirma`
--

DROP TABLE IF EXISTS `AktifFirma`;
/*!50001 DROP VIEW IF EXISTS `AktifFirma`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `AktifFirma` AS SELECT 
 1 AS `Baslangic`,
 1 AS `Bitis`,
 1 AS `AktifFirma`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `AktifItriyatDeposu`
--

DROP TABLE IF EXISTS `AktifItriyatDeposu`;
/*!50001 DROP VIEW IF EXISTS `AktifItriyatDeposu`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `AktifItriyatDeposu` AS SELECT 
 1 AS `Baslangic`,
 1 AS `Bitis`,
 1 AS `AktifItriyatDeposu`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `AllCategoriesByParent`
--

DROP TABLE IF EXISTS `AllCategoriesByParent`;
/*!50001 DROP VIEW IF EXISTS `AllCategoriesByParent`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `AllCategoriesByParent` AS SELECT 
 1 AS `MainCategoryId`,
 1 AS `Ids`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `AnneBebek`
--

DROP TABLE IF EXISTS `AnneBebek`;
/*!50001 DROP VIEW IF EXISTS `AnneBebek`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `AnneBebek` AS SELECT 
 1 AS `Baslangic`,
 1 AS `Bitis`,
 1 AS `Name2`,
 1 AS `IlanSayisi2`,
 1 AS `SatisMiktari2`,
 1 AS `SatisTutari2`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `BesinTakviyesi`
--

DROP TABLE IF EXISTS `BesinTakviyesi`;
/*!50001 DROP VIEW IF EXISTS `BesinTakviyesi`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `BesinTakviyesi` AS SELECT 
 1 AS `Baslangic`,
 1 AS `Bitis`,
 1 AS `Name3`,
 1 AS `IlanSayisi3`,
 1 AS `SatisMiktari3`,
 1 AS `SatisTutari3`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `HaftalikDepo`
--

DROP TABLE IF EXISTS `HaftalikDepo`;
/*!50001 DROP VIEW IF EXISTS `HaftalikDepo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `HaftalikDepo` AS SELECT 
 1 AS `Baslangic`,
 1 AS `Bitis`,
 1 AS `HaftalikDepo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `HaftalikEczaDeposu`
--

DROP TABLE IF EXISTS `HaftalikEczaDeposu`;
/*!50001 DROP VIEW IF EXISTS `HaftalikEczaDeposu`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `HaftalikEczaDeposu` AS SELECT 
 1 AS `Baslangic`,
 1 AS `Bitis`,
 1 AS `HaftalikEczaDeposu`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `HaftalikFirma`
--

DROP TABLE IF EXISTS `HaftalikFirma`;
/*!50001 DROP VIEW IF EXISTS `HaftalikFirma`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `HaftalikFirma` AS SELECT 
 1 AS `Baslangic`,
 1 AS `Bitis`,
 1 AS `HaftalikFirma`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `HaftalikItriyatDeposu`
--

DROP TABLE IF EXISTS `HaftalikItriyatDeposu`;
/*!50001 DROP VIEW IF EXISTS `HaftalikItriyatDeposu`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `HaftalikItriyatDeposu` AS SELECT 
 1 AS `Baslangic`,
 1 AS `Bitis`,
 1 AS `HaftalikItriyatDeposu`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `HaftalikSatis`
--

DROP TABLE IF EXISTS `HaftalikSatis`;
/*!50001 DROP VIEW IF EXISTS `HaftalikSatis`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `HaftalikSatis` AS SELECT 
 1 AS `Baslangic`,
 1 AS `Bitis`,
 1 AS `SiparisSayisi`,
 1 AS `Miktar`,
 1 AS `Tutar`,
 1 AS `IptalSayisi`,
 1 AS `IptalMiktar`,
 1 AS `IptalTutar`,
 1 AS `NetSiparis`,
 1 AS `NetMiktar`,
 1 AS `NetTutar`,
 1 AS `OrtalamaSepetTutari`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Kategorisiz`
--

DROP TABLE IF EXISTS `Kategorisiz`;
/*!50001 DROP VIEW IF EXISTS `Kategorisiz`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Kategorisiz` AS SELECT 
 1 AS `Baslangic`,
 1 AS `Bitis`,
 1 AS `Name8`,
 1 AS `IlanSayisi8`,
 1 AS `SatisMiktari8`,
 1 AS `SatisTutari8`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `KayitOlanEczaneler`
--

DROP TABLE IF EXISTS `KayitOlanEczaneler`;
/*!50001 DROP VIEW IF EXISTS `KayitOlanEczaneler`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `KayitOlanEczaneler` AS SELECT 
 1 AS `Baslangic`,
 1 AS `Bitis`,
 1 AS `KayitOlanEczane`,
 1 AS `AVMEczanesi`,
 1 AS `CaddeEczanesi`,
 1 AS `SemtEczanesi`,
 1 AS `AsmCevresiEczanesi`,
 1 AS `HastaneCevresiEczanesi`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `KisiselBakim`
--

DROP TABLE IF EXISTS `KisiselBakim`;
/*!50001 DROP VIEW IF EXISTS `KisiselBakim`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `KisiselBakim` AS SELECT 
 1 AS `Baslangic`,
 1 AS `Bitis`,
 1 AS `Name5`,
 1 AS `IlanSayisi5`,
 1 AS `SatisMiktari5`,
 1 AS `SatisTutari5`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `LoginYapmamis`
--

DROP TABLE IF EXISTS `LoginYapmamis`;
/*!50001 DROP VIEW IF EXISTS `LoginYapmamis`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `LoginYapmamis` AS SELECT 
 1 AS `Baslangic`,
 1 AS `Bitis`,
 1 AS `LoginOlmamislar`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Medikal`
--

DROP TABLE IF EXISTS `Medikal`;
/*!50001 DROP VIEW IF EXISTS `Medikal`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Medikal` AS SELECT 
 1 AS `Baslangic`,
 1 AS `Bitis`,
 1 AS `Name4`,
 1 AS `IlanSayisi4`,
 1 AS `SatisMiktari4`,
 1 AS `SatisTutari4`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ReceteliIlac`
--

DROP TABLE IF EXISTS `ReceteliIlac`;
/*!50001 DROP VIEW IF EXISTS `ReceteliIlac`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ReceteliIlac` AS SELECT 
 1 AS `Baslangic`,
 1 AS `Bitis`,
 1 AS `Name1`,
 1 AS `IlanSayisi1`,
 1 AS `SatisMiktari1`,
 1 AS `SatisTutari1`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Saglik`
--

DROP TABLE IF EXISTS `Saglik`;
/*!50001 DROP VIEW IF EXISTS `Saglik`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Saglik` AS SELECT 
 1 AS `Baslangic`,
 1 AS `Bitis`,
 1 AS `Name6`,
 1 AS `IlanSayisi6`,
 1 AS `SatisMiktari6`,
 1 AS `SatisTutari6`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `SarfMalzemeleri`
--

DROP TABLE IF EXISTS `SarfMalzemeleri`;
/*!50001 DROP VIEW IF EXISTS `SarfMalzemeleri`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `SarfMalzemeleri` AS SELECT 
 1 AS `Baslangic`,
 1 AS `Bitis`,
 1 AS `Name7`,
 1 AS `IlanSayisi7`,
 1 AS `SatisMiktari7`,
 1 AS `SatisTutari7`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `SiparisVerenEczane`
--

DROP TABLE IF EXISTS `SiparisVerenEczane`;
/*!50001 DROP VIEW IF EXISTS `SiparisVerenEczane`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `SiparisVerenEczane` AS SELECT 
 1 AS `Baslangic`,
 1 AS `Bitis`,
 1 AS `SiparisVerenEczane`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `SiparisVermemis`
--

DROP TABLE IF EXISTS `SiparisVermemis`;
/*!50001 DROP VIEW IF EXISTS `SiparisVermemis`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `SiparisVermemis` AS SELECT 
 1 AS `Baslangic`,
 1 AS `Bitis`,
 1 AS `SiparisVermemisler`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `YorumvePuan`
--

DROP TABLE IF EXISTS `YorumvePuan`;
/*!50001 DROP VIEW IF EXISTS `YorumvePuan`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `YorumvePuan` AS SELECT 
 1 AS `Baslangic`,
 1 AS `Bitis`,
 1 AS `YorumSayisi`,
 1 AS `Puanlama`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `AktifDepoSayisi`
--

/*!50001 DROP VIEW IF EXISTS `AktifDepoSayisi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `AktifDepoSayisi` AS select date_format((curdate() + interval ((1 - dayofweek(curdate())) - 1) day),'%Y-%m-%e') AS `Baslangic`,date_format((curdate() + interval ((7 - dayofweek(curdate())) - 1) day),'%Y-%m-%e') AS `Bitis`,count(distinct `Product`.`VendorId`) AS `AktifDepoSayisi` from `Product` where ((0 = `Product`.`Deleted`) and (0 <> `Product`.`Published`) and (`Product`.`VendorId` > 0) and (`Product`.`ProductTypeId` = 5)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `AktifEczaDeposu`
--

/*!50001 DROP VIEW IF EXISTS `AktifEczaDeposu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `AktifEczaDeposu` AS select date_format((curdate() + interval ((1 - dayofweek(curdate())) - 1) day),'%Y-%m-%e') AS `Baslangic`,date_format((curdate() + interval ((7 - dayofweek(curdate())) - 1) day),'%Y-%m-%e') AS `Bitis`,count(distinct `v`.`Id`) AS `AktifEczaDeposu` from (((`Vendor` `v` join `Product` `p` on((`v`.`Id` = `p`.`VendorId`))) join `Customer` `c` on((`v`.`Id` = `c`.`VendorId`))) join `Customer_CustomerRole_Mapping` `cr` on((`c`.`Id` = `cr`.`Customer_Id`))) where ((0 = `p`.`Deleted`) and (0 <> `p`.`Published`) and (`p`.`VendorId` > 0) and (`p`.`ProductTypeId` = 5) and (`c`.`Active` = 1) and (`cr`.`CustomerRole_Id` = 91)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `AktifFirma`
--

/*!50001 DROP VIEW IF EXISTS `AktifFirma`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `AktifFirma` AS select date_format((curdate() + interval ((1 - dayofweek(curdate())) - 1) day),'%Y-%m-%e') AS `Baslangic`,date_format((curdate() + interval ((7 - dayofweek(curdate())) - 1) day),'%Y-%m-%e') AS `Bitis`,count(distinct `v`.`Id`) AS `AktifFirma` from (((`Vendor` `v` join `Product` `p` on((`v`.`Id` = `p`.`VendorId`))) join `Customer` `c` on((`v`.`Id` = `c`.`VendorId`))) join `Customer_CustomerRole_Mapping` `cr` on((`c`.`Id` = `cr`.`Customer_Id`))) where ((0 = `p`.`Deleted`) and (0 <> `p`.`Published`) and (`p`.`VendorId` > 0) and (`p`.`ProductTypeId` = 5) and (`c`.`Active` = 1) and (`cr`.`CustomerRole_Id` = 92)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `AktifItriyatDeposu`
--

/*!50001 DROP VIEW IF EXISTS `AktifItriyatDeposu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `AktifItriyatDeposu` AS select date_format((curdate() + interval ((1 - dayofweek(curdate())) - 1) day),'%Y-%m-%e') AS `Baslangic`,date_format((curdate() + interval ((7 - dayofweek(curdate())) - 1) day),'%Y-%m-%e') AS `Bitis`,count(distinct `v`.`Id`) AS `AktifItriyatDeposu` from (((`Vendor` `v` join `Product` `p` on((`v`.`Id` = `p`.`VendorId`))) join `Customer` `c` on((`v`.`Id` = `c`.`VendorId`))) join `Customer_CustomerRole_Mapping` `cr` on((`c`.`Id` = `cr`.`Customer_Id`))) where ((0 = `p`.`Deleted`) and (0 <> `p`.`Published`) and (`p`.`VendorId` > 0) and (`p`.`ProductTypeId` = 5) and (`c`.`Active` = 1) and (`cr`.`CustomerRole_Id` = 93)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `AllCategoriesByParent`
--

/*!50001 DROP VIEW IF EXISTS `AllCategoriesByParent`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `AllCategoriesByParent` AS select `c`.`Id` AS `MainCategoryId`,(with recursive `cte` (`Id`,`ParentId`) as (select `Category`.`Id` AS `Id`,`Category`.`ParentCategoryId` AS `ParentCategoryId` from `Category` where ((`Category`.`Id` = `c`.`Id`) and (0 <> `Category`.`Published`) and (0 = `Category`.`Deleted`)) union all select `c`.`Id` AS `Id`,`c`.`ParentCategoryId` AS `ParentCategoryId` from (`Category` `c` join `cte` on((`c`.`ParentCategoryId` = `cte`.`Id`))) where ((0 <> `c`.`Published`) and (0 = `c`.`Deleted`))) select group_concat(`cte`.`Id` separator ',') from `cte`) AS `Ids` from `Category` `c` where ((`c`.`ParentCategoryId` = 0) and (0 <> `c`.`Published`) and (0 = `c`.`Deleted`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `AnneBebek`
--

/*!50001 DROP VIEW IF EXISTS `AnneBebek`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `AnneBebek` AS select date_format((`o`.`CreatedOnUtc` + interval ((1 - dayofweek(`o`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Baslangic`,date_format((`o`.`CreatedOnUtc` + interval ((7 - dayofweek(`o`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Bitis`,`c`.`Name` AS `Name2`,count(distinct `p`.`Id`) AS `IlanSayisi2`,sum(`oi`.`Quantity`) AS `SatisMiktari2`,sum(`oi`.`PriceInclTax`) AS `SatisTutari2` from ((((((`AllCategoriesByParent` `mc` join `Category` `c` on((`mc`.`MainCategoryId` = `c`.`Id`))) join `Product_Category_Mapping` `pcm` on((find_in_set(`pcm`.`CategoryId`,`mc`.`Ids`) > 0))) join `Product` `p` on((`pcm`.`ProductId` = `p`.`Id`))) join (select `Product`.`Id` AS `Id`,`Product`.`ProductTypeId` AS `ProductTypeId`,`Product`.`ParentGroupedProductId` AS `ParentGroupedProductId`,`Product`.`VisibleIndividually` AS `VisibleIndividually`,`Product`.`Name` AS `Name`,`Product`.`ShortDescription` AS `ShortDescription`,`Product`.`FullDescription` AS `FullDescription`,`Product`.`AdminComment` AS `AdminComment`,`Product`.`ProductTemplateId` AS `ProductTemplateId`,`Product`.`VendorId` AS `VendorId`,`Product`.`ShowOnHomepage` AS `ShowOnHomepage`,`Product`.`MetaKeywords` AS `MetaKeywords`,`Product`.`MetaDescription` AS `MetaDescription`,`Product`.`MetaTitle` AS `MetaTitle`,`Product`.`AllowCustomerReviews` AS `AllowCustomerReviews`,`Product`.`ApprovedRatingSum` AS `ApprovedRatingSum`,`Product`.`NotApprovedRatingSum` AS `NotApprovedRatingSum`,`Product`.`ApprovedTotalReviews` AS `ApprovedTotalReviews`,`Product`.`NotApprovedTotalReviews` AS `NotApprovedTotalReviews`,`Product`.`SubjectToAcl` AS `SubjectToAcl`,`Product`.`LimitedToStores` AS `LimitedToStores`,`Product`.`Sku` AS `Sku`,`Product`.`ManufacturerPartNumber` AS `ManufacturerPartNumber`,`Product`.`Gtin` AS `Gtin`,`Product`.`IsGiftCard` AS `IsGiftCard`,`Product`.`GiftCardTypeId` AS `GiftCardTypeId`,`Product`.`OverriddenGiftCardAmount` AS `OverriddenGiftCardAmount`,`Product`.`RequireOtherProducts` AS `RequireOtherProducts`,`Product`.`RequiredProductIds` AS `RequiredProductIds`,`Product`.`AutomaticallyAddRequiredProducts` AS `AutomaticallyAddRequiredProducts`,`Product`.`IsDownload` AS `IsDownload`,`Product`.`DownloadId` AS `DownloadId`,`Product`.`UnlimitedDownloads` AS `UnlimitedDownloads`,`Product`.`MaxNumberOfDownloads` AS `MaxNumberOfDownloads`,`Product`.`DownloadExpirationDays` AS `DownloadExpirationDays`,`Product`.`DownloadActivationTypeId` AS `DownloadActivationTypeId`,`Product`.`HasSampleDownload` AS `HasSampleDownload`,`Product`.`SampleDownloadId` AS `SampleDownloadId`,`Product`.`HasUserAgreement` AS `HasUserAgreement`,`Product`.`UserAgreementText` AS `UserAgreementText`,`Product`.`IsRecurring` AS `IsRecurring`,`Product`.`RecurringCycleLength` AS `RecurringCycleLength`,`Product`.`RecurringCyclePeriodId` AS `RecurringCyclePeriodId`,`Product`.`RecurringTotalCycles` AS `RecurringTotalCycles`,`Product`.`IsRental` AS `IsRental`,`Product`.`RentalPriceLength` AS `RentalPriceLength`,`Product`.`RentalPricePeriodId` AS `RentalPricePeriodId`,`Product`.`IsShipEnabled` AS `IsShipEnabled`,`Product`.`IsFreeShipping` AS `IsFreeShipping`,`Product`.`ShipSeparately` AS `ShipSeparately`,`Product`.`AdditionalShippingCharge` AS `AdditionalShippingCharge`,`Product`.`DeliveryDateId` AS `DeliveryDateId`,`Product`.`IsTaxExempt` AS `IsTaxExempt`,`Product`.`TaxCategoryId` AS `TaxCategoryId`,`Product`.`IsTelecommunicationsOrBroadcastingOrElectronicServices` AS `IsTelecommunicationsOrBroadcastingOrElectronicServices`,`Product`.`ManageInventoryMethodId` AS `ManageInventoryMethodId`,`Product`.`ProductAvailabilityRangeId` AS `ProductAvailabilityRangeId`,`Product`.`UseMultipleWarehouses` AS `UseMultipleWarehouses`,`Product`.`WarehouseId` AS `WarehouseId`,`Product`.`StockQuantity` AS `StockQuantity`,`Product`.`DisplayStockAvailability` AS `DisplayStockAvailability`,`Product`.`DisplayStockQuantity` AS `DisplayStockQuantity`,`Product`.`MinStockQuantity` AS `MinStockQuantity`,`Product`.`LowStockActivityId` AS `LowStockActivityId`,`Product`.`NotifyAdminForQuantityBelow` AS `NotifyAdminForQuantityBelow`,`Product`.`BackorderModeId` AS `BackorderModeId`,`Product`.`AllowBackInStockSubscriptions` AS `AllowBackInStockSubscriptions`,`Product`.`OrderMinimumQuantity` AS `OrderMinimumQuantity`,`Product`.`OrderMaximumQuantity` AS `OrderMaximumQuantity`,`Product`.`AllowedQuantities` AS `AllowedQuantities`,`Product`.`AllowAddingOnlyExistingAttributeCombinations` AS `AllowAddingOnlyExistingAttributeCombinations`,`Product`.`NotReturnable` AS `NotReturnable`,`Product`.`DisableBuyButton` AS `DisableBuyButton`,`Product`.`DisableWishlistButton` AS `DisableWishlistButton`,`Product`.`AvailableForPreOrder` AS `AvailableForPreOrder`,`Product`.`PreOrderAvailabilityStartDateTimeUtc` AS `PreOrderAvailabilityStartDateTimeUtc`,`Product`.`CallForPrice` AS `CallForPrice`,`Product`.`Price` AS `Price`,`Product`.`OldPrice` AS `OldPrice`,`Product`.`ProductCost` AS `ProductCost`,`Product`.`CustomerEntersPrice` AS `CustomerEntersPrice`,`Product`.`MinimumCustomerEnteredPrice` AS `MinimumCustomerEnteredPrice`,`Product`.`MaximumCustomerEnteredPrice` AS `MaximumCustomerEnteredPrice`,`Product`.`BasepriceEnabled` AS `BasepriceEnabled`,`Product`.`BasepriceAmount` AS `BasepriceAmount`,`Product`.`BasepriceUnitId` AS `BasepriceUnitId`,`Product`.`BasepriceBaseAmount` AS `BasepriceBaseAmount`,`Product`.`BasepriceBaseUnitId` AS `BasepriceBaseUnitId`,`Product`.`MarkAsNew` AS `MarkAsNew`,`Product`.`MarkAsNewStartDateTimeUtc` AS `MarkAsNewStartDateTimeUtc`,`Product`.`MarkAsNewEndDateTimeUtc` AS `MarkAsNewEndDateTimeUtc`,`Product`.`HasTierPrices` AS `HasTierPrices`,`Product`.`HasDiscountsApplied` AS `HasDiscountsApplied`,`Product`.`Weight` AS `Weight`,`Product`.`Length` AS `Length`,`Product`.`Width` AS `Width`,`Product`.`Height` AS `Height`,`Product`.`AvailableStartDateTimeUtc` AS `AvailableStartDateTimeUtc`,`Product`.`AvailableEndDateTimeUtc` AS `AvailableEndDateTimeUtc`,`Product`.`DisplayOrder` AS `DisplayOrder`,`Product`.`Published` AS `Published`,`Product`.`Deleted` AS `Deleted`,`Product`.`CreatedOnUtc` AS `CreatedOnUtc`,`Product`.`UpdatedOnUtc` AS `UpdatedOnUtc`,`Product`.`Mf` AS `Mf`,`Product`.`MfAdet` AS `MfAdet`,`Product`.`MfAdetFazla` AS `MfAdetFazla`,`Product`.`Miad` AS `Miad`,`Product`.`MiadDate` AS `MiadDate`,`Product`.`KamuOdenen` AS `KamuOdenen`,`Product`.`FiyatFarki` AS `FiyatFarki` from `Product` where ((`Product`.`ProductTypeId` = 5) and (`Product`.`ParentGroupedProductId` <> 0) and (0 <> `Product`.`Published`) and (0 = `Product`.`Deleted`))) `p2` on((`p`.`Id` = `p2`.`ParentGroupedProductId`))) join `OrderItem` `oi` on((`p2`.`Id` = `oi`.`ProductId`))) join (select `Order`.`Id` AS `Id`,`Order`.`OrderGuid` AS `OrderGuid`,`Order`.`StoreId` AS `StoreId`,`Order`.`CustomerId` AS `CustomerId`,`Order`.`BillingAddressId` AS `BillingAddressId`,`Order`.`ShippingAddressId` AS `ShippingAddressId`,`Order`.`PickupAddressId` AS `PickupAddressId`,`Order`.`PickupInStore` AS `PickupInStore`,`Order`.`OrderStatusId` AS `OrderStatusId`,`Order`.`ShippingStatusId` AS `ShippingStatusId`,`Order`.`PaymentStatusId` AS `PaymentStatusId`,`Order`.`PaymentMethodSystemName` AS `PaymentMethodSystemName`,`Order`.`CustomerCurrencyCode` AS `CustomerCurrencyCode`,`Order`.`CurrencyRate` AS `CurrencyRate`,`Order`.`CustomerTaxDisplayTypeId` AS `CustomerTaxDisplayTypeId`,`Order`.`VatNumber` AS `VatNumber`,`Order`.`OrderSubtotalInclTax` AS `OrderSubtotalInclTax`,`Order`.`OrderSubtotalExclTax` AS `OrderSubtotalExclTax`,`Order`.`OrderSubTotalDiscountInclTax` AS `OrderSubTotalDiscountInclTax`,`Order`.`OrderSubTotalDiscountExclTax` AS `OrderSubTotalDiscountExclTax`,`Order`.`OrderShippingInclTax` AS `OrderShippingInclTax`,`Order`.`OrderShippingExclTax` AS `OrderShippingExclTax`,`Order`.`PaymentMethodAdditionalFeeInclTax` AS `PaymentMethodAdditionalFeeInclTax`,`Order`.`PaymentMethodAdditionalFeeExclTax` AS `PaymentMethodAdditionalFeeExclTax`,`Order`.`TaxRates` AS `TaxRates`,`Order`.`OrderTax` AS `OrderTax`,`Order`.`OrderDiscount` AS `OrderDiscount`,`Order`.`OrderTotal` AS `OrderTotal`,`Order`.`RefundedAmount` AS `RefundedAmount`,`Order`.`RewardPointsHistoryEntryId` AS `RewardPointsHistoryEntryId`,`Order`.`CheckoutAttributeDescription` AS `CheckoutAttributeDescription`,`Order`.`CheckoutAttributesXml` AS `CheckoutAttributesXml`,`Order`.`CustomerLanguageId` AS `CustomerLanguageId`,`Order`.`AffiliateId` AS `AffiliateId`,`Order`.`CustomerIp` AS `CustomerIp`,`Order`.`AllowStoringCreditCardNumber` AS `AllowStoringCreditCardNumber`,`Order`.`CardType` AS `CardType`,`Order`.`CardName` AS `CardName`,`Order`.`CardNumber` AS `CardNumber`,`Order`.`MaskedCreditCardNumber` AS `MaskedCreditCardNumber`,`Order`.`CardCvv2` AS `CardCvv2`,`Order`.`CardExpirationMonth` AS `CardExpirationMonth`,`Order`.`CardExpirationYear` AS `CardExpirationYear`,`Order`.`AuthorizationTransactionId` AS `AuthorizationTransactionId`,`Order`.`AuthorizationTransactionCode` AS `AuthorizationTransactionCode`,`Order`.`AuthorizationTransactionResult` AS `AuthorizationTransactionResult`,`Order`.`CaptureTransactionId` AS `CaptureTransactionId`,`Order`.`CaptureTransactionResult` AS `CaptureTransactionResult`,`Order`.`SubscriptionTransactionId` AS `SubscriptionTransactionId`,`Order`.`PaidDateUtc` AS `PaidDateUtc`,`Order`.`ShippingMethod` AS `ShippingMethod`,`Order`.`ShippingRateComputationMethodSystemName` AS `ShippingRateComputationMethodSystemName`,`Order`.`CustomValuesXml` AS `CustomValuesXml`,`Order`.`Deleted` AS `Deleted`,`Order`.`CreatedOnUtc` AS `CreatedOnUtc`,`Order`.`CustomOrderNumber` AS `CustomOrderNumber`,`Order`.`RedeemedRewardPointsEntryId` AS `RedeemedRewardPointsEntryId` from `Order` where ((`Order`.`OrderStatusId` <> 40) and (`Order`.`PaymentStatusId` <> 20) and (0 = `Order`.`Deleted`))) `o` on((`oi`.`OrderId` = `o`.`Id`))) where ((`p`.`ProductTypeId` = 10) and (`p`.`ParentGroupedProductId` = 0) and (0 <> `p`.`Published`) and (0 = `p`.`Deleted`) and (0 = `o`.`Deleted`) and (`o`.`CreatedOnUtc` >= '2020-10-24') and (`c`.`Name` = 'Anne & Bebek')) group by `Baslangic` order by `o`.`CreatedOnUtc` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `BesinTakviyesi`
--

/*!50001 DROP VIEW IF EXISTS `BesinTakviyesi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `BesinTakviyesi` AS select date_format((`o`.`CreatedOnUtc` + interval ((1 - dayofweek(`o`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Baslangic`,date_format((`o`.`CreatedOnUtc` + interval ((7 - dayofweek(`o`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Bitis`,`c`.`Name` AS `Name3`,count(distinct `p`.`Id`) AS `IlanSayisi3`,sum(`oi`.`Quantity`) AS `SatisMiktari3`,sum(`oi`.`PriceInclTax`) AS `SatisTutari3` from ((((((`AllCategoriesByParent` `mc` join `Category` `c` on((`mc`.`MainCategoryId` = `c`.`Id`))) join `Product_Category_Mapping` `pcm` on((find_in_set(`pcm`.`CategoryId`,`mc`.`Ids`) > 0))) join `Product` `p` on((`pcm`.`ProductId` = `p`.`Id`))) join (select `Product`.`Id` AS `Id`,`Product`.`ProductTypeId` AS `ProductTypeId`,`Product`.`ParentGroupedProductId` AS `ParentGroupedProductId`,`Product`.`VisibleIndividually` AS `VisibleIndividually`,`Product`.`Name` AS `Name`,`Product`.`ShortDescription` AS `ShortDescription`,`Product`.`FullDescription` AS `FullDescription`,`Product`.`AdminComment` AS `AdminComment`,`Product`.`ProductTemplateId` AS `ProductTemplateId`,`Product`.`VendorId` AS `VendorId`,`Product`.`ShowOnHomepage` AS `ShowOnHomepage`,`Product`.`MetaKeywords` AS `MetaKeywords`,`Product`.`MetaDescription` AS `MetaDescription`,`Product`.`MetaTitle` AS `MetaTitle`,`Product`.`AllowCustomerReviews` AS `AllowCustomerReviews`,`Product`.`ApprovedRatingSum` AS `ApprovedRatingSum`,`Product`.`NotApprovedRatingSum` AS `NotApprovedRatingSum`,`Product`.`ApprovedTotalReviews` AS `ApprovedTotalReviews`,`Product`.`NotApprovedTotalReviews` AS `NotApprovedTotalReviews`,`Product`.`SubjectToAcl` AS `SubjectToAcl`,`Product`.`LimitedToStores` AS `LimitedToStores`,`Product`.`Sku` AS `Sku`,`Product`.`ManufacturerPartNumber` AS `ManufacturerPartNumber`,`Product`.`Gtin` AS `Gtin`,`Product`.`IsGiftCard` AS `IsGiftCard`,`Product`.`GiftCardTypeId` AS `GiftCardTypeId`,`Product`.`OverriddenGiftCardAmount` AS `OverriddenGiftCardAmount`,`Product`.`RequireOtherProducts` AS `RequireOtherProducts`,`Product`.`RequiredProductIds` AS `RequiredProductIds`,`Product`.`AutomaticallyAddRequiredProducts` AS `AutomaticallyAddRequiredProducts`,`Product`.`IsDownload` AS `IsDownload`,`Product`.`DownloadId` AS `DownloadId`,`Product`.`UnlimitedDownloads` AS `UnlimitedDownloads`,`Product`.`MaxNumberOfDownloads` AS `MaxNumberOfDownloads`,`Product`.`DownloadExpirationDays` AS `DownloadExpirationDays`,`Product`.`DownloadActivationTypeId` AS `DownloadActivationTypeId`,`Product`.`HasSampleDownload` AS `HasSampleDownload`,`Product`.`SampleDownloadId` AS `SampleDownloadId`,`Product`.`HasUserAgreement` AS `HasUserAgreement`,`Product`.`UserAgreementText` AS `UserAgreementText`,`Product`.`IsRecurring` AS `IsRecurring`,`Product`.`RecurringCycleLength` AS `RecurringCycleLength`,`Product`.`RecurringCyclePeriodId` AS `RecurringCyclePeriodId`,`Product`.`RecurringTotalCycles` AS `RecurringTotalCycles`,`Product`.`IsRental` AS `IsRental`,`Product`.`RentalPriceLength` AS `RentalPriceLength`,`Product`.`RentalPricePeriodId` AS `RentalPricePeriodId`,`Product`.`IsShipEnabled` AS `IsShipEnabled`,`Product`.`IsFreeShipping` AS `IsFreeShipping`,`Product`.`ShipSeparately` AS `ShipSeparately`,`Product`.`AdditionalShippingCharge` AS `AdditionalShippingCharge`,`Product`.`DeliveryDateId` AS `DeliveryDateId`,`Product`.`IsTaxExempt` AS `IsTaxExempt`,`Product`.`TaxCategoryId` AS `TaxCategoryId`,`Product`.`IsTelecommunicationsOrBroadcastingOrElectronicServices` AS `IsTelecommunicationsOrBroadcastingOrElectronicServices`,`Product`.`ManageInventoryMethodId` AS `ManageInventoryMethodId`,`Product`.`ProductAvailabilityRangeId` AS `ProductAvailabilityRangeId`,`Product`.`UseMultipleWarehouses` AS `UseMultipleWarehouses`,`Product`.`WarehouseId` AS `WarehouseId`,`Product`.`StockQuantity` AS `StockQuantity`,`Product`.`DisplayStockAvailability` AS `DisplayStockAvailability`,`Product`.`DisplayStockQuantity` AS `DisplayStockQuantity`,`Product`.`MinStockQuantity` AS `MinStockQuantity`,`Product`.`LowStockActivityId` AS `LowStockActivityId`,`Product`.`NotifyAdminForQuantityBelow` AS `NotifyAdminForQuantityBelow`,`Product`.`BackorderModeId` AS `BackorderModeId`,`Product`.`AllowBackInStockSubscriptions` AS `AllowBackInStockSubscriptions`,`Product`.`OrderMinimumQuantity` AS `OrderMinimumQuantity`,`Product`.`OrderMaximumQuantity` AS `OrderMaximumQuantity`,`Product`.`AllowedQuantities` AS `AllowedQuantities`,`Product`.`AllowAddingOnlyExistingAttributeCombinations` AS `AllowAddingOnlyExistingAttributeCombinations`,`Product`.`NotReturnable` AS `NotReturnable`,`Product`.`DisableBuyButton` AS `DisableBuyButton`,`Product`.`DisableWishlistButton` AS `DisableWishlistButton`,`Product`.`AvailableForPreOrder` AS `AvailableForPreOrder`,`Product`.`PreOrderAvailabilityStartDateTimeUtc` AS `PreOrderAvailabilityStartDateTimeUtc`,`Product`.`CallForPrice` AS `CallForPrice`,`Product`.`Price` AS `Price`,`Product`.`OldPrice` AS `OldPrice`,`Product`.`ProductCost` AS `ProductCost`,`Product`.`CustomerEntersPrice` AS `CustomerEntersPrice`,`Product`.`MinimumCustomerEnteredPrice` AS `MinimumCustomerEnteredPrice`,`Product`.`MaximumCustomerEnteredPrice` AS `MaximumCustomerEnteredPrice`,`Product`.`BasepriceEnabled` AS `BasepriceEnabled`,`Product`.`BasepriceAmount` AS `BasepriceAmount`,`Product`.`BasepriceUnitId` AS `BasepriceUnitId`,`Product`.`BasepriceBaseAmount` AS `BasepriceBaseAmount`,`Product`.`BasepriceBaseUnitId` AS `BasepriceBaseUnitId`,`Product`.`MarkAsNew` AS `MarkAsNew`,`Product`.`MarkAsNewStartDateTimeUtc` AS `MarkAsNewStartDateTimeUtc`,`Product`.`MarkAsNewEndDateTimeUtc` AS `MarkAsNewEndDateTimeUtc`,`Product`.`HasTierPrices` AS `HasTierPrices`,`Product`.`HasDiscountsApplied` AS `HasDiscountsApplied`,`Product`.`Weight` AS `Weight`,`Product`.`Length` AS `Length`,`Product`.`Width` AS `Width`,`Product`.`Height` AS `Height`,`Product`.`AvailableStartDateTimeUtc` AS `AvailableStartDateTimeUtc`,`Product`.`AvailableEndDateTimeUtc` AS `AvailableEndDateTimeUtc`,`Product`.`DisplayOrder` AS `DisplayOrder`,`Product`.`Published` AS `Published`,`Product`.`Deleted` AS `Deleted`,`Product`.`CreatedOnUtc` AS `CreatedOnUtc`,`Product`.`UpdatedOnUtc` AS `UpdatedOnUtc`,`Product`.`Mf` AS `Mf`,`Product`.`MfAdet` AS `MfAdet`,`Product`.`MfAdetFazla` AS `MfAdetFazla`,`Product`.`Miad` AS `Miad`,`Product`.`MiadDate` AS `MiadDate`,`Product`.`KamuOdenen` AS `KamuOdenen`,`Product`.`FiyatFarki` AS `FiyatFarki` from `Product` where ((`Product`.`ProductTypeId` = 5) and (`Product`.`ParentGroupedProductId` <> 0) and (0 <> `Product`.`Published`) and (0 = `Product`.`Deleted`))) `p2` on((`p`.`Id` = `p2`.`ParentGroupedProductId`))) join `OrderItem` `oi` on((`p2`.`Id` = `oi`.`ProductId`))) join (select `Order`.`Id` AS `Id`,`Order`.`OrderGuid` AS `OrderGuid`,`Order`.`StoreId` AS `StoreId`,`Order`.`CustomerId` AS `CustomerId`,`Order`.`BillingAddressId` AS `BillingAddressId`,`Order`.`ShippingAddressId` AS `ShippingAddressId`,`Order`.`PickupAddressId` AS `PickupAddressId`,`Order`.`PickupInStore` AS `PickupInStore`,`Order`.`OrderStatusId` AS `OrderStatusId`,`Order`.`ShippingStatusId` AS `ShippingStatusId`,`Order`.`PaymentStatusId` AS `PaymentStatusId`,`Order`.`PaymentMethodSystemName` AS `PaymentMethodSystemName`,`Order`.`CustomerCurrencyCode` AS `CustomerCurrencyCode`,`Order`.`CurrencyRate` AS `CurrencyRate`,`Order`.`CustomerTaxDisplayTypeId` AS `CustomerTaxDisplayTypeId`,`Order`.`VatNumber` AS `VatNumber`,`Order`.`OrderSubtotalInclTax` AS `OrderSubtotalInclTax`,`Order`.`OrderSubtotalExclTax` AS `OrderSubtotalExclTax`,`Order`.`OrderSubTotalDiscountInclTax` AS `OrderSubTotalDiscountInclTax`,`Order`.`OrderSubTotalDiscountExclTax` AS `OrderSubTotalDiscountExclTax`,`Order`.`OrderShippingInclTax` AS `OrderShippingInclTax`,`Order`.`OrderShippingExclTax` AS `OrderShippingExclTax`,`Order`.`PaymentMethodAdditionalFeeInclTax` AS `PaymentMethodAdditionalFeeInclTax`,`Order`.`PaymentMethodAdditionalFeeExclTax` AS `PaymentMethodAdditionalFeeExclTax`,`Order`.`TaxRates` AS `TaxRates`,`Order`.`OrderTax` AS `OrderTax`,`Order`.`OrderDiscount` AS `OrderDiscount`,`Order`.`OrderTotal` AS `OrderTotal`,`Order`.`RefundedAmount` AS `RefundedAmount`,`Order`.`RewardPointsHistoryEntryId` AS `RewardPointsHistoryEntryId`,`Order`.`CheckoutAttributeDescription` AS `CheckoutAttributeDescription`,`Order`.`CheckoutAttributesXml` AS `CheckoutAttributesXml`,`Order`.`CustomerLanguageId` AS `CustomerLanguageId`,`Order`.`AffiliateId` AS `AffiliateId`,`Order`.`CustomerIp` AS `CustomerIp`,`Order`.`AllowStoringCreditCardNumber` AS `AllowStoringCreditCardNumber`,`Order`.`CardType` AS `CardType`,`Order`.`CardName` AS `CardName`,`Order`.`CardNumber` AS `CardNumber`,`Order`.`MaskedCreditCardNumber` AS `MaskedCreditCardNumber`,`Order`.`CardCvv2` AS `CardCvv2`,`Order`.`CardExpirationMonth` AS `CardExpirationMonth`,`Order`.`CardExpirationYear` AS `CardExpirationYear`,`Order`.`AuthorizationTransactionId` AS `AuthorizationTransactionId`,`Order`.`AuthorizationTransactionCode` AS `AuthorizationTransactionCode`,`Order`.`AuthorizationTransactionResult` AS `AuthorizationTransactionResult`,`Order`.`CaptureTransactionId` AS `CaptureTransactionId`,`Order`.`CaptureTransactionResult` AS `CaptureTransactionResult`,`Order`.`SubscriptionTransactionId` AS `SubscriptionTransactionId`,`Order`.`PaidDateUtc` AS `PaidDateUtc`,`Order`.`ShippingMethod` AS `ShippingMethod`,`Order`.`ShippingRateComputationMethodSystemName` AS `ShippingRateComputationMethodSystemName`,`Order`.`CustomValuesXml` AS `CustomValuesXml`,`Order`.`Deleted` AS `Deleted`,`Order`.`CreatedOnUtc` AS `CreatedOnUtc`,`Order`.`CustomOrderNumber` AS `CustomOrderNumber`,`Order`.`RedeemedRewardPointsEntryId` AS `RedeemedRewardPointsEntryId` from `Order` where ((`Order`.`OrderStatusId` <> 40) and (`Order`.`PaymentStatusId` <> 20) and (0 = `Order`.`Deleted`))) `o` on((`oi`.`OrderId` = `o`.`Id`))) where ((`p`.`ProductTypeId` = 10) and (`p`.`ParentGroupedProductId` = 0) and (0 <> `p`.`Published`) and (0 = `p`.`Deleted`) and (0 = `o`.`Deleted`) and (`o`.`CreatedOnUtc` >= '2020-10-24') and (`c`.`Name` = 'Besin Takviyesi')) group by `Baslangic` order by `o`.`CreatedOnUtc` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `HaftalikDepo`
--

/*!50001 DROP VIEW IF EXISTS `HaftalikDepo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `HaftalikDepo` AS select date_format((`c`.`CreatedOnUtc` + interval ((1 - dayofweek(`c`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Baslangic`,date_format((`c`.`CreatedOnUtc` + interval ((7 - dayofweek(`c`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Bitis`,count(`c`.`VendorId`) AS `HaftalikDepo` from (`Customer` `c` left join `Vendor` `v` on((`v`.`Id` = `c`.`VendorId`))) where ((`c`.`VendorId` <> 0) and (`c`.`Active` = 1) and (`c`.`CreatedOnUtc` >= '2020-10-24')) group by `Baslangic` order by `c`.`CreatedOnUtc` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `HaftalikEczaDeposu`
--

/*!50001 DROP VIEW IF EXISTS `HaftalikEczaDeposu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `HaftalikEczaDeposu` AS select date_format((`c`.`CreatedOnUtc` + interval ((1 - dayofweek(`c`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Baslangic`,date_format((`c`.`CreatedOnUtc` + interval ((7 - dayofweek(`c`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Bitis`,count(`c`.`VendorId`) OVER (ORDER BY `c`.`CreatedOnUtc` )  AS `HaftalikEczaDeposu` from ((`Customer` `c` left join `Vendor` `v` on((`v`.`Id` = `c`.`VendorId`))) join `Customer_CustomerRole_Mapping` `cr` on((`c`.`Id` = `cr`.`Customer_Id`))) where ((`c`.`VendorId` <> 0) and (`c`.`Active` = 1) and (`c`.`CreatedOnUtc` >= '2020-10-24') and (`cr`.`CustomerRole_Id` = 91)) group by `Baslangic` order by `c`.`CreatedOnUtc` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `HaftalikFirma`
--

/*!50001 DROP VIEW IF EXISTS `HaftalikFirma`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `HaftalikFirma` AS select date_format((`c`.`CreatedOnUtc` + interval ((1 - dayofweek(`c`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Baslangic`,date_format((`c`.`CreatedOnUtc` + interval ((7 - dayofweek(`c`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Bitis`,count(`c`.`VendorId`) OVER (ORDER BY `c`.`CreatedOnUtc` )  AS `HaftalikFirma` from ((`Customer` `c` left join `Vendor` `v` on((`v`.`Id` = `c`.`VendorId`))) join `Customer_CustomerRole_Mapping` `cr` on((`c`.`Id` = `cr`.`Customer_Id`))) where ((`c`.`VendorId` <> 0) and (`c`.`Active` = 1) and (`c`.`CreatedOnUtc` >= '2020-10-24') and (`cr`.`CustomerRole_Id` = 92)) group by `Baslangic` order by `c`.`CreatedOnUtc` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `HaftalikItriyatDeposu`
--

/*!50001 DROP VIEW IF EXISTS `HaftalikItriyatDeposu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `HaftalikItriyatDeposu` AS select date_format((`c`.`CreatedOnUtc` + interval ((1 - dayofweek(`c`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Baslangic`,date_format((`c`.`CreatedOnUtc` + interval ((7 - dayofweek(`c`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Bitis`,count(`c`.`VendorId`) OVER (ORDER BY `c`.`CreatedOnUtc` )  AS `HaftalikItriyatDeposu` from ((`Customer` `c` left join `Vendor` `v` on((`v`.`Id` = `c`.`VendorId`))) join `Customer_CustomerRole_Mapping` `cr` on((`c`.`Id` = `cr`.`Customer_Id`))) where ((`c`.`VendorId` <> 0) and (`c`.`Active` = 1) and (`c`.`CreatedOnUtc` >= '2020-10-24') and (`cr`.`CustomerRole_Id` = 93)) group by `Baslangic` order by `c`.`CreatedOnUtc` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `HaftalikSatis`
--

/*!50001 DROP VIEW IF EXISTS `HaftalikSatis`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `HaftalikSatis` AS select date_format((`o`.`CreatedOnUtc` + interval ((1 - dayofweek(`o`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Baslangic`,date_format((`o`.`CreatedOnUtc` + interval ((7 - dayofweek(`o`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Bitis`,count(distinct `o`.`Id`) AS `SiparisSayisi`,sum(`oi`.`Quantity`) AS `Miktar`,sum(`o`.`OrderTotal`) AS `Tutar`,count(distinct `o2`.`Id`) AS `IptalSayisi`,sum(`oi2`.`Quantity`) AS `IptalMiktar`,sum(`o2`.`OrderTotal`) AS `IptalTutar`,count(distinct `o3`.`Id`) AS `NetSiparis`,sum(`oi3`.`Quantity`) AS `NetMiktar`,sum(`o3`.`OrderTotal`) AS `NetTutar`,(sum(`o3`.`OrderTotal`) / count(distinct `o3`.`Id`)) AS `OrtalamaSepetTutari` from (((((`Order` `o` left join (select `OrderItem`.`OrderId` AS `OrderId`,sum(`OrderItem`.`Quantity`) AS `Quantity` from `OrderItem` group by `OrderItem`.`OrderId`) `oi` on((`o`.`Id` = `oi`.`OrderId`))) left join (select `Order`.`Id` AS `Id`,`Order`.`OrderGuid` AS `OrderGuid`,`Order`.`StoreId` AS `StoreId`,`Order`.`CustomerId` AS `CustomerId`,`Order`.`BillingAddressId` AS `BillingAddressId`,`Order`.`ShippingAddressId` AS `ShippingAddressId`,`Order`.`PickupAddressId` AS `PickupAddressId`,`Order`.`PickupInStore` AS `PickupInStore`,`Order`.`OrderStatusId` AS `OrderStatusId`,`Order`.`ShippingStatusId` AS `ShippingStatusId`,`Order`.`PaymentStatusId` AS `PaymentStatusId`,`Order`.`PaymentMethodSystemName` AS `PaymentMethodSystemName`,`Order`.`CustomerCurrencyCode` AS `CustomerCurrencyCode`,`Order`.`CurrencyRate` AS `CurrencyRate`,`Order`.`CustomerTaxDisplayTypeId` AS `CustomerTaxDisplayTypeId`,`Order`.`VatNumber` AS `VatNumber`,`Order`.`OrderSubtotalInclTax` AS `OrderSubtotalInclTax`,`Order`.`OrderSubtotalExclTax` AS `OrderSubtotalExclTax`,`Order`.`OrderSubTotalDiscountInclTax` AS `OrderSubTotalDiscountInclTax`,`Order`.`OrderSubTotalDiscountExclTax` AS `OrderSubTotalDiscountExclTax`,`Order`.`OrderShippingInclTax` AS `OrderShippingInclTax`,`Order`.`OrderShippingExclTax` AS `OrderShippingExclTax`,`Order`.`PaymentMethodAdditionalFeeInclTax` AS `PaymentMethodAdditionalFeeInclTax`,`Order`.`PaymentMethodAdditionalFeeExclTax` AS `PaymentMethodAdditionalFeeExclTax`,`Order`.`TaxRates` AS `TaxRates`,`Order`.`OrderTax` AS `OrderTax`,`Order`.`OrderDiscount` AS `OrderDiscount`,`Order`.`OrderTotal` AS `OrderTotal`,`Order`.`RefundedAmount` AS `RefundedAmount`,`Order`.`RewardPointsHistoryEntryId` AS `RewardPointsHistoryEntryId`,`Order`.`CheckoutAttributeDescription` AS `CheckoutAttributeDescription`,`Order`.`CheckoutAttributesXml` AS `CheckoutAttributesXml`,`Order`.`CustomerLanguageId` AS `CustomerLanguageId`,`Order`.`AffiliateId` AS `AffiliateId`,`Order`.`CustomerIp` AS `CustomerIp`,`Order`.`AllowStoringCreditCardNumber` AS `AllowStoringCreditCardNumber`,`Order`.`CardType` AS `CardType`,`Order`.`CardName` AS `CardName`,`Order`.`CardNumber` AS `CardNumber`,`Order`.`MaskedCreditCardNumber` AS `MaskedCreditCardNumber`,`Order`.`CardCvv2` AS `CardCvv2`,`Order`.`CardExpirationMonth` AS `CardExpirationMonth`,`Order`.`CardExpirationYear` AS `CardExpirationYear`,`Order`.`AuthorizationTransactionId` AS `AuthorizationTransactionId`,`Order`.`AuthorizationTransactionCode` AS `AuthorizationTransactionCode`,`Order`.`AuthorizationTransactionResult` AS `AuthorizationTransactionResult`,`Order`.`CaptureTransactionId` AS `CaptureTransactionId`,`Order`.`CaptureTransactionResult` AS `CaptureTransactionResult`,`Order`.`SubscriptionTransactionId` AS `SubscriptionTransactionId`,`Order`.`PaidDateUtc` AS `PaidDateUtc`,`Order`.`ShippingMethod` AS `ShippingMethod`,`Order`.`ShippingRateComputationMethodSystemName` AS `ShippingRateComputationMethodSystemName`,`Order`.`CustomValuesXml` AS `CustomValuesXml`,`Order`.`Deleted` AS `Deleted`,`Order`.`CreatedOnUtc` AS `CreatedOnUtc`,`Order`.`CustomOrderNumber` AS `CustomOrderNumber`,`Order`.`RedeemedRewardPointsEntryId` AS `RedeemedRewardPointsEntryId` from `Order` where (`Order`.`OrderStatusId` = 40)) `o2` on((`o`.`Id` = `o2`.`Id`))) left join (select `OrderItem`.`OrderId` AS `OrderId`,sum(`OrderItem`.`Quantity`) AS `Quantity` from `OrderItem` group by `OrderItem`.`OrderId`) `oi2` on((`o2`.`Id` = `oi2`.`OrderId`))) left join (select `Order`.`Id` AS `Id`,`Order`.`OrderGuid` AS `OrderGuid`,`Order`.`StoreId` AS `StoreId`,`Order`.`CustomerId` AS `CustomerId`,`Order`.`BillingAddressId` AS `BillingAddressId`,`Order`.`ShippingAddressId` AS `ShippingAddressId`,`Order`.`PickupAddressId` AS `PickupAddressId`,`Order`.`PickupInStore` AS `PickupInStore`,`Order`.`OrderStatusId` AS `OrderStatusId`,`Order`.`ShippingStatusId` AS `ShippingStatusId`,`Order`.`PaymentStatusId` AS `PaymentStatusId`,`Order`.`PaymentMethodSystemName` AS `PaymentMethodSystemName`,`Order`.`CustomerCurrencyCode` AS `CustomerCurrencyCode`,`Order`.`CurrencyRate` AS `CurrencyRate`,`Order`.`CustomerTaxDisplayTypeId` AS `CustomerTaxDisplayTypeId`,`Order`.`VatNumber` AS `VatNumber`,`Order`.`OrderSubtotalInclTax` AS `OrderSubtotalInclTax`,`Order`.`OrderSubtotalExclTax` AS `OrderSubtotalExclTax`,`Order`.`OrderSubTotalDiscountInclTax` AS `OrderSubTotalDiscountInclTax`,`Order`.`OrderSubTotalDiscountExclTax` AS `OrderSubTotalDiscountExclTax`,`Order`.`OrderShippingInclTax` AS `OrderShippingInclTax`,`Order`.`OrderShippingExclTax` AS `OrderShippingExclTax`,`Order`.`PaymentMethodAdditionalFeeInclTax` AS `PaymentMethodAdditionalFeeInclTax`,`Order`.`PaymentMethodAdditionalFeeExclTax` AS `PaymentMethodAdditionalFeeExclTax`,`Order`.`TaxRates` AS `TaxRates`,`Order`.`OrderTax` AS `OrderTax`,`Order`.`OrderDiscount` AS `OrderDiscount`,`Order`.`OrderTotal` AS `OrderTotal`,`Order`.`RefundedAmount` AS `RefundedAmount`,`Order`.`RewardPointsHistoryEntryId` AS `RewardPointsHistoryEntryId`,`Order`.`CheckoutAttributeDescription` AS `CheckoutAttributeDescription`,`Order`.`CheckoutAttributesXml` AS `CheckoutAttributesXml`,`Order`.`CustomerLanguageId` AS `CustomerLanguageId`,`Order`.`AffiliateId` AS `AffiliateId`,`Order`.`CustomerIp` AS `CustomerIp`,`Order`.`AllowStoringCreditCardNumber` AS `AllowStoringCreditCardNumber`,`Order`.`CardType` AS `CardType`,`Order`.`CardName` AS `CardName`,`Order`.`CardNumber` AS `CardNumber`,`Order`.`MaskedCreditCardNumber` AS `MaskedCreditCardNumber`,`Order`.`CardCvv2` AS `CardCvv2`,`Order`.`CardExpirationMonth` AS `CardExpirationMonth`,`Order`.`CardExpirationYear` AS `CardExpirationYear`,`Order`.`AuthorizationTransactionId` AS `AuthorizationTransactionId`,`Order`.`AuthorizationTransactionCode` AS `AuthorizationTransactionCode`,`Order`.`AuthorizationTransactionResult` AS `AuthorizationTransactionResult`,`Order`.`CaptureTransactionId` AS `CaptureTransactionId`,`Order`.`CaptureTransactionResult` AS `CaptureTransactionResult`,`Order`.`SubscriptionTransactionId` AS `SubscriptionTransactionId`,`Order`.`PaidDateUtc` AS `PaidDateUtc`,`Order`.`ShippingMethod` AS `ShippingMethod`,`Order`.`ShippingRateComputationMethodSystemName` AS `ShippingRateComputationMethodSystemName`,`Order`.`CustomValuesXml` AS `CustomValuesXml`,`Order`.`Deleted` AS `Deleted`,`Order`.`CreatedOnUtc` AS `CreatedOnUtc`,`Order`.`CustomOrderNumber` AS `CustomOrderNumber`,`Order`.`RedeemedRewardPointsEntryId` AS `RedeemedRewardPointsEntryId` from `Order` where ((`Order`.`OrderStatusId` = 30) and ((`Order`.`PaymentStatusId` = 30) or (`Order`.`PaymentStatusId` = 35)))) `o3` on((`o`.`Id` = `o3`.`Id`))) left join (select `OrderItem`.`OrderId` AS `OrderId`,sum(`OrderItem`.`Quantity`) AS `Quantity` from `OrderItem` group by `OrderItem`.`OrderId`) `oi3` on((`o3`.`Id` = `oi3`.`OrderId`))) where ((`o`.`CreatedOnUtc` >= '2020-10-24') and (0 = `o`.`Deleted`) and (`o`.`PaymentStatusId` <> 20)) group by `Baslangic` order by `o`.`CreatedOnUtc` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Kategorisiz`
--

/*!50001 DROP VIEW IF EXISTS `Kategorisiz`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Kategorisiz` AS select date_format((`o`.`CreatedOnUtc` + interval ((1 - dayofweek(`o`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Baslangic`,date_format((`o`.`CreatedOnUtc` + interval ((7 - dayofweek(`o`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Bitis`,'Kategorisiz' AS `Name8`,count(distinct `p`.`Id`) AS `IlanSayisi8`,sum(`oi`.`Quantity`) AS `SatisMiktari8`,sum(`oi`.`PriceInclTax`) AS `SatisTutari8` from (((`Product` `p` join (select `Product`.`Id` AS `Id`,`Product`.`ProductTypeId` AS `ProductTypeId`,`Product`.`ParentGroupedProductId` AS `ParentGroupedProductId`,`Product`.`VisibleIndividually` AS `VisibleIndividually`,`Product`.`Name` AS `Name`,`Product`.`ShortDescription` AS `ShortDescription`,`Product`.`FullDescription` AS `FullDescription`,`Product`.`AdminComment` AS `AdminComment`,`Product`.`ProductTemplateId` AS `ProductTemplateId`,`Product`.`VendorId` AS `VendorId`,`Product`.`ShowOnHomepage` AS `ShowOnHomepage`,`Product`.`MetaKeywords` AS `MetaKeywords`,`Product`.`MetaDescription` AS `MetaDescription`,`Product`.`MetaTitle` AS `MetaTitle`,`Product`.`AllowCustomerReviews` AS `AllowCustomerReviews`,`Product`.`ApprovedRatingSum` AS `ApprovedRatingSum`,`Product`.`NotApprovedRatingSum` AS `NotApprovedRatingSum`,`Product`.`ApprovedTotalReviews` AS `ApprovedTotalReviews`,`Product`.`NotApprovedTotalReviews` AS `NotApprovedTotalReviews`,`Product`.`SubjectToAcl` AS `SubjectToAcl`,`Product`.`LimitedToStores` AS `LimitedToStores`,`Product`.`Sku` AS `Sku`,`Product`.`ManufacturerPartNumber` AS `ManufacturerPartNumber`,`Product`.`Gtin` AS `Gtin`,`Product`.`IsGiftCard` AS `IsGiftCard`,`Product`.`GiftCardTypeId` AS `GiftCardTypeId`,`Product`.`OverriddenGiftCardAmount` AS `OverriddenGiftCardAmount`,`Product`.`RequireOtherProducts` AS `RequireOtherProducts`,`Product`.`RequiredProductIds` AS `RequiredProductIds`,`Product`.`AutomaticallyAddRequiredProducts` AS `AutomaticallyAddRequiredProducts`,`Product`.`IsDownload` AS `IsDownload`,`Product`.`DownloadId` AS `DownloadId`,`Product`.`UnlimitedDownloads` AS `UnlimitedDownloads`,`Product`.`MaxNumberOfDownloads` AS `MaxNumberOfDownloads`,`Product`.`DownloadExpirationDays` AS `DownloadExpirationDays`,`Product`.`DownloadActivationTypeId` AS `DownloadActivationTypeId`,`Product`.`HasSampleDownload` AS `HasSampleDownload`,`Product`.`SampleDownloadId` AS `SampleDownloadId`,`Product`.`HasUserAgreement` AS `HasUserAgreement`,`Product`.`UserAgreementText` AS `UserAgreementText`,`Product`.`IsRecurring` AS `IsRecurring`,`Product`.`RecurringCycleLength` AS `RecurringCycleLength`,`Product`.`RecurringCyclePeriodId` AS `RecurringCyclePeriodId`,`Product`.`RecurringTotalCycles` AS `RecurringTotalCycles`,`Product`.`IsRental` AS `IsRental`,`Product`.`RentalPriceLength` AS `RentalPriceLength`,`Product`.`RentalPricePeriodId` AS `RentalPricePeriodId`,`Product`.`IsShipEnabled` AS `IsShipEnabled`,`Product`.`IsFreeShipping` AS `IsFreeShipping`,`Product`.`ShipSeparately` AS `ShipSeparately`,`Product`.`AdditionalShippingCharge` AS `AdditionalShippingCharge`,`Product`.`DeliveryDateId` AS `DeliveryDateId`,`Product`.`IsTaxExempt` AS `IsTaxExempt`,`Product`.`TaxCategoryId` AS `TaxCategoryId`,`Product`.`IsTelecommunicationsOrBroadcastingOrElectronicServices` AS `IsTelecommunicationsOrBroadcastingOrElectronicServices`,`Product`.`ManageInventoryMethodId` AS `ManageInventoryMethodId`,`Product`.`ProductAvailabilityRangeId` AS `ProductAvailabilityRangeId`,`Product`.`UseMultipleWarehouses` AS `UseMultipleWarehouses`,`Product`.`WarehouseId` AS `WarehouseId`,`Product`.`StockQuantity` AS `StockQuantity`,`Product`.`DisplayStockAvailability` AS `DisplayStockAvailability`,`Product`.`DisplayStockQuantity` AS `DisplayStockQuantity`,`Product`.`MinStockQuantity` AS `MinStockQuantity`,`Product`.`LowStockActivityId` AS `LowStockActivityId`,`Product`.`NotifyAdminForQuantityBelow` AS `NotifyAdminForQuantityBelow`,`Product`.`BackorderModeId` AS `BackorderModeId`,`Product`.`AllowBackInStockSubscriptions` AS `AllowBackInStockSubscriptions`,`Product`.`OrderMinimumQuantity` AS `OrderMinimumQuantity`,`Product`.`OrderMaximumQuantity` AS `OrderMaximumQuantity`,`Product`.`AllowedQuantities` AS `AllowedQuantities`,`Product`.`AllowAddingOnlyExistingAttributeCombinations` AS `AllowAddingOnlyExistingAttributeCombinations`,`Product`.`NotReturnable` AS `NotReturnable`,`Product`.`DisableBuyButton` AS `DisableBuyButton`,`Product`.`DisableWishlistButton` AS `DisableWishlistButton`,`Product`.`AvailableForPreOrder` AS `AvailableForPreOrder`,`Product`.`PreOrderAvailabilityStartDateTimeUtc` AS `PreOrderAvailabilityStartDateTimeUtc`,`Product`.`CallForPrice` AS `CallForPrice`,`Product`.`Price` AS `Price`,`Product`.`OldPrice` AS `OldPrice`,`Product`.`ProductCost` AS `ProductCost`,`Product`.`CustomerEntersPrice` AS `CustomerEntersPrice`,`Product`.`MinimumCustomerEnteredPrice` AS `MinimumCustomerEnteredPrice`,`Product`.`MaximumCustomerEnteredPrice` AS `MaximumCustomerEnteredPrice`,`Product`.`BasepriceEnabled` AS `BasepriceEnabled`,`Product`.`BasepriceAmount` AS `BasepriceAmount`,`Product`.`BasepriceUnitId` AS `BasepriceUnitId`,`Product`.`BasepriceBaseAmount` AS `BasepriceBaseAmount`,`Product`.`BasepriceBaseUnitId` AS `BasepriceBaseUnitId`,`Product`.`MarkAsNew` AS `MarkAsNew`,`Product`.`MarkAsNewStartDateTimeUtc` AS `MarkAsNewStartDateTimeUtc`,`Product`.`MarkAsNewEndDateTimeUtc` AS `MarkAsNewEndDateTimeUtc`,`Product`.`HasTierPrices` AS `HasTierPrices`,`Product`.`HasDiscountsApplied` AS `HasDiscountsApplied`,`Product`.`Weight` AS `Weight`,`Product`.`Length` AS `Length`,`Product`.`Width` AS `Width`,`Product`.`Height` AS `Height`,`Product`.`AvailableStartDateTimeUtc` AS `AvailableStartDateTimeUtc`,`Product`.`AvailableEndDateTimeUtc` AS `AvailableEndDateTimeUtc`,`Product`.`DisplayOrder` AS `DisplayOrder`,`Product`.`Published` AS `Published`,`Product`.`Deleted` AS `Deleted`,`Product`.`CreatedOnUtc` AS `CreatedOnUtc`,`Product`.`UpdatedOnUtc` AS `UpdatedOnUtc`,`Product`.`Mf` AS `Mf`,`Product`.`MfAdet` AS `MfAdet`,`Product`.`MfAdetFazla` AS `MfAdetFazla`,`Product`.`Miad` AS `Miad`,`Product`.`MiadDate` AS `MiadDate`,`Product`.`KamuOdenen` AS `KamuOdenen`,`Product`.`FiyatFarki` AS `FiyatFarki` from `Product` where ((`Product`.`ProductTypeId` = 5) and (`Product`.`ParentGroupedProductId` <> 0) and (0 <> `Product`.`Published`) and (0 = `Product`.`Deleted`))) `p2` on((`p`.`Id` = `p2`.`ParentGroupedProductId`))) join `OrderItem` `oi` on((`p2`.`Id` = `oi`.`ProductId`))) join (select `Order`.`Id` AS `Id`,`Order`.`OrderGuid` AS `OrderGuid`,`Order`.`StoreId` AS `StoreId`,`Order`.`CustomerId` AS `CustomerId`,`Order`.`BillingAddressId` AS `BillingAddressId`,`Order`.`ShippingAddressId` AS `ShippingAddressId`,`Order`.`PickupAddressId` AS `PickupAddressId`,`Order`.`PickupInStore` AS `PickupInStore`,`Order`.`OrderStatusId` AS `OrderStatusId`,`Order`.`ShippingStatusId` AS `ShippingStatusId`,`Order`.`PaymentStatusId` AS `PaymentStatusId`,`Order`.`PaymentMethodSystemName` AS `PaymentMethodSystemName`,`Order`.`CustomerCurrencyCode` AS `CustomerCurrencyCode`,`Order`.`CurrencyRate` AS `CurrencyRate`,`Order`.`CustomerTaxDisplayTypeId` AS `CustomerTaxDisplayTypeId`,`Order`.`VatNumber` AS `VatNumber`,`Order`.`OrderSubtotalInclTax` AS `OrderSubtotalInclTax`,`Order`.`OrderSubtotalExclTax` AS `OrderSubtotalExclTax`,`Order`.`OrderSubTotalDiscountInclTax` AS `OrderSubTotalDiscountInclTax`,`Order`.`OrderSubTotalDiscountExclTax` AS `OrderSubTotalDiscountExclTax`,`Order`.`OrderShippingInclTax` AS `OrderShippingInclTax`,`Order`.`OrderShippingExclTax` AS `OrderShippingExclTax`,`Order`.`PaymentMethodAdditionalFeeInclTax` AS `PaymentMethodAdditionalFeeInclTax`,`Order`.`PaymentMethodAdditionalFeeExclTax` AS `PaymentMethodAdditionalFeeExclTax`,`Order`.`TaxRates` AS `TaxRates`,`Order`.`OrderTax` AS `OrderTax`,`Order`.`OrderDiscount` AS `OrderDiscount`,`Order`.`OrderTotal` AS `OrderTotal`,`Order`.`RefundedAmount` AS `RefundedAmount`,`Order`.`RewardPointsHistoryEntryId` AS `RewardPointsHistoryEntryId`,`Order`.`CheckoutAttributeDescription` AS `CheckoutAttributeDescription`,`Order`.`CheckoutAttributesXml` AS `CheckoutAttributesXml`,`Order`.`CustomerLanguageId` AS `CustomerLanguageId`,`Order`.`AffiliateId` AS `AffiliateId`,`Order`.`CustomerIp` AS `CustomerIp`,`Order`.`AllowStoringCreditCardNumber` AS `AllowStoringCreditCardNumber`,`Order`.`CardType` AS `CardType`,`Order`.`CardName` AS `CardName`,`Order`.`CardNumber` AS `CardNumber`,`Order`.`MaskedCreditCardNumber` AS `MaskedCreditCardNumber`,`Order`.`CardCvv2` AS `CardCvv2`,`Order`.`CardExpirationMonth` AS `CardExpirationMonth`,`Order`.`CardExpirationYear` AS `CardExpirationYear`,`Order`.`AuthorizationTransactionId` AS `AuthorizationTransactionId`,`Order`.`AuthorizationTransactionCode` AS `AuthorizationTransactionCode`,`Order`.`AuthorizationTransactionResult` AS `AuthorizationTransactionResult`,`Order`.`CaptureTransactionId` AS `CaptureTransactionId`,`Order`.`CaptureTransactionResult` AS `CaptureTransactionResult`,`Order`.`SubscriptionTransactionId` AS `SubscriptionTransactionId`,`Order`.`PaidDateUtc` AS `PaidDateUtc`,`Order`.`ShippingMethod` AS `ShippingMethod`,`Order`.`ShippingRateComputationMethodSystemName` AS `ShippingRateComputationMethodSystemName`,`Order`.`CustomValuesXml` AS `CustomValuesXml`,`Order`.`Deleted` AS `Deleted`,`Order`.`CreatedOnUtc` AS `CreatedOnUtc`,`Order`.`CustomOrderNumber` AS `CustomOrderNumber`,`Order`.`RedeemedRewardPointsEntryId` AS `RedeemedRewardPointsEntryId` from `Order` where ((`Order`.`OrderStatusId` <> 40) and (`Order`.`PaymentStatusId` <> 20) and (0 = `Order`.`Deleted`))) `o` on((`oi`.`OrderId` = `o`.`Id`))) where ((`p`.`ProductTypeId` = 10) and (`p`.`ParentGroupedProductId` = 0) and (0 <> `p`.`Published`) and (0 = `p`.`Deleted`) and (0 = `o`.`Deleted`) and (`o`.`CreatedOnUtc` >= '2020-10-24') and `p`.`Id` in (select `Product_Category_Mapping`.`ProductId` from `Product_Category_Mapping`) is false) group by `Baslangic` order by `o`.`CreatedOnUtc` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `KayitOlanEczaneler`
--

/*!50001 DROP VIEW IF EXISTS `KayitOlanEczaneler`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `KayitOlanEczaneler` AS select date_format((`c`.`CreatedOnUtc` + interval ((1 - dayofweek(`c`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Baslangic`,date_format((`c`.`CreatedOnUtc` + interval ((7 - dayofweek(`c`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Bitis`,sum(count(distinct `c`.`Id`)) OVER (ORDER BY `c`.`CreatedOnUtc` )  AS `KayitOlanEczane`,sum(count(distinct `ga1`.`EntityId`)) OVER (ORDER BY `c`.`CreatedOnUtc` )  AS `AVMEczanesi`,sum(count(distinct `ga2`.`EntityId`)) OVER (ORDER BY `c`.`CreatedOnUtc` )  AS `CaddeEczanesi`,sum(count(distinct `ga3`.`EntityId`)) OVER (ORDER BY `c`.`CreatedOnUtc` )  AS `SemtEczanesi`,sum(count(distinct `ga4`.`EntityId`)) OVER (ORDER BY `c`.`CreatedOnUtc` )  AS `AsmCevresiEczanesi`,sum(count(distinct `ga5`.`EntityId`)) OVER (ORDER BY `c`.`CreatedOnUtc` )  AS `HastaneCevresiEczanesi` from (((((`Customer` `c` left join (select `ga`.`Id` AS `Id`,`ga`.`EntityId` AS `EntityId`,`ga`.`KeyGroup` AS `KeyGroup`,`ga`.`Key` AS `Key`,`ga`.`Value` AS `Value`,`ga`.`StoreId` AS `StoreId`,`ga`.`CreatedOrUpdatedDateUTC` AS `CreatedOrUpdatedDateUTC` from `GenericAttribute` `ga` where ((`ga`.`Key` = 'CustomCustomerAttributes') and (`ga`.`Value` like '%ID="5"%') and (`ga`.`Value` like '%<Value>1</Value>%'))) `ga1` on((`c`.`Id` = `ga1`.`EntityId`))) left join (select `ga`.`Id` AS `Id`,`ga`.`EntityId` AS `EntityId`,`ga`.`KeyGroup` AS `KeyGroup`,`ga`.`Key` AS `Key`,`ga`.`Value` AS `Value`,`ga`.`StoreId` AS `StoreId`,`ga`.`CreatedOrUpdatedDateUTC` AS `CreatedOrUpdatedDateUTC` from `GenericAttribute` `ga` where ((`ga`.`Key` = 'CustomCustomerAttributes') and (`ga`.`Value` like '%ID="5"%') and (`ga`.`Value` like '%<Value>2</Value>%'))) `ga2` on((`c`.`Id` = `ga2`.`EntityId`))) left join (select `ga`.`Id` AS `Id`,`ga`.`EntityId` AS `EntityId`,`ga`.`KeyGroup` AS `KeyGroup`,`ga`.`Key` AS `Key`,`ga`.`Value` AS `Value`,`ga`.`StoreId` AS `StoreId`,`ga`.`CreatedOrUpdatedDateUTC` AS `CreatedOrUpdatedDateUTC` from `GenericAttribute` `ga` where ((`ga`.`Key` = 'CustomCustomerAttributes') and (`ga`.`Value` like '%ID="5"%') and (`ga`.`Value` like '%<Value>3</Value>%'))) `ga3` on((`c`.`Id` = `ga3`.`EntityId`))) left join (select `ga`.`Id` AS `Id`,`ga`.`EntityId` AS `EntityId`,`ga`.`KeyGroup` AS `KeyGroup`,`ga`.`Key` AS `Key`,`ga`.`Value` AS `Value`,`ga`.`StoreId` AS `StoreId`,`ga`.`CreatedOrUpdatedDateUTC` AS `CreatedOrUpdatedDateUTC` from `GenericAttribute` `ga` where ((`ga`.`Key` = 'CustomCustomerAttributes') and (`ga`.`Value` like '%ID="5"%') and (`ga`.`Value` like '%<Value>4</Value>%'))) `ga4` on((`c`.`Id` = `ga4`.`EntityId`))) left join (select `ga`.`Id` AS `Id`,`ga`.`EntityId` AS `EntityId`,`ga`.`KeyGroup` AS `KeyGroup`,`ga`.`Key` AS `Key`,`ga`.`Value` AS `Value`,`ga`.`StoreId` AS `StoreId`,`ga`.`CreatedOrUpdatedDateUTC` AS `CreatedOrUpdatedDateUTC` from `GenericAttribute` `ga` where ((`ga`.`Key` = 'CustomCustomerAttributes') and (`ga`.`Value` like '%ID="5"%') and (`ga`.`Value` like '%<Value>5</Value>%'))) `ga5` on((`c`.`Id` = `ga5`.`EntityId`))) where ((`c`.`CreatedOnUtc` >= '2020-10-24') and (0 = `c`.`Deleted`) and (0 <> `c`.`Active`) and (`c`.`Email` is not null) and ((`c`.`Id` < 1078412) or (`c`.`Id` > 1078648))) group by `Baslangic` order by `c`.`CreatedOnUtc` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `KisiselBakim`
--

/*!50001 DROP VIEW IF EXISTS `KisiselBakim`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `KisiselBakim` AS select date_format((`o`.`CreatedOnUtc` + interval ((1 - dayofweek(`o`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Baslangic`,date_format((`o`.`CreatedOnUtc` + interval ((7 - dayofweek(`o`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Bitis`,`c`.`Name` AS `Name5`,count(distinct `p`.`Id`) AS `IlanSayisi5`,sum(`oi`.`Quantity`) AS `SatisMiktari5`,sum(`oi`.`PriceInclTax`) AS `SatisTutari5` from ((((((`AllCategoriesByParent` `mc` join `Category` `c` on((`mc`.`MainCategoryId` = `c`.`Id`))) join `Product_Category_Mapping` `pcm` on((find_in_set(`pcm`.`CategoryId`,`mc`.`Ids`) > 0))) join `Product` `p` on((`pcm`.`ProductId` = `p`.`Id`))) join (select `Product`.`Id` AS `Id`,`Product`.`ProductTypeId` AS `ProductTypeId`,`Product`.`ParentGroupedProductId` AS `ParentGroupedProductId`,`Product`.`VisibleIndividually` AS `VisibleIndividually`,`Product`.`Name` AS `Name`,`Product`.`ShortDescription` AS `ShortDescription`,`Product`.`FullDescription` AS `FullDescription`,`Product`.`AdminComment` AS `AdminComment`,`Product`.`ProductTemplateId` AS `ProductTemplateId`,`Product`.`VendorId` AS `VendorId`,`Product`.`ShowOnHomepage` AS `ShowOnHomepage`,`Product`.`MetaKeywords` AS `MetaKeywords`,`Product`.`MetaDescription` AS `MetaDescription`,`Product`.`MetaTitle` AS `MetaTitle`,`Product`.`AllowCustomerReviews` AS `AllowCustomerReviews`,`Product`.`ApprovedRatingSum` AS `ApprovedRatingSum`,`Product`.`NotApprovedRatingSum` AS `NotApprovedRatingSum`,`Product`.`ApprovedTotalReviews` AS `ApprovedTotalReviews`,`Product`.`NotApprovedTotalReviews` AS `NotApprovedTotalReviews`,`Product`.`SubjectToAcl` AS `SubjectToAcl`,`Product`.`LimitedToStores` AS `LimitedToStores`,`Product`.`Sku` AS `Sku`,`Product`.`ManufacturerPartNumber` AS `ManufacturerPartNumber`,`Product`.`Gtin` AS `Gtin`,`Product`.`IsGiftCard` AS `IsGiftCard`,`Product`.`GiftCardTypeId` AS `GiftCardTypeId`,`Product`.`OverriddenGiftCardAmount` AS `OverriddenGiftCardAmount`,`Product`.`RequireOtherProducts` AS `RequireOtherProducts`,`Product`.`RequiredProductIds` AS `RequiredProductIds`,`Product`.`AutomaticallyAddRequiredProducts` AS `AutomaticallyAddRequiredProducts`,`Product`.`IsDownload` AS `IsDownload`,`Product`.`DownloadId` AS `DownloadId`,`Product`.`UnlimitedDownloads` AS `UnlimitedDownloads`,`Product`.`MaxNumberOfDownloads` AS `MaxNumberOfDownloads`,`Product`.`DownloadExpirationDays` AS `DownloadExpirationDays`,`Product`.`DownloadActivationTypeId` AS `DownloadActivationTypeId`,`Product`.`HasSampleDownload` AS `HasSampleDownload`,`Product`.`SampleDownloadId` AS `SampleDownloadId`,`Product`.`HasUserAgreement` AS `HasUserAgreement`,`Product`.`UserAgreementText` AS `UserAgreementText`,`Product`.`IsRecurring` AS `IsRecurring`,`Product`.`RecurringCycleLength` AS `RecurringCycleLength`,`Product`.`RecurringCyclePeriodId` AS `RecurringCyclePeriodId`,`Product`.`RecurringTotalCycles` AS `RecurringTotalCycles`,`Product`.`IsRental` AS `IsRental`,`Product`.`RentalPriceLength` AS `RentalPriceLength`,`Product`.`RentalPricePeriodId` AS `RentalPricePeriodId`,`Product`.`IsShipEnabled` AS `IsShipEnabled`,`Product`.`IsFreeShipping` AS `IsFreeShipping`,`Product`.`ShipSeparately` AS `ShipSeparately`,`Product`.`AdditionalShippingCharge` AS `AdditionalShippingCharge`,`Product`.`DeliveryDateId` AS `DeliveryDateId`,`Product`.`IsTaxExempt` AS `IsTaxExempt`,`Product`.`TaxCategoryId` AS `TaxCategoryId`,`Product`.`IsTelecommunicationsOrBroadcastingOrElectronicServices` AS `IsTelecommunicationsOrBroadcastingOrElectronicServices`,`Product`.`ManageInventoryMethodId` AS `ManageInventoryMethodId`,`Product`.`ProductAvailabilityRangeId` AS `ProductAvailabilityRangeId`,`Product`.`UseMultipleWarehouses` AS `UseMultipleWarehouses`,`Product`.`WarehouseId` AS `WarehouseId`,`Product`.`StockQuantity` AS `StockQuantity`,`Product`.`DisplayStockAvailability` AS `DisplayStockAvailability`,`Product`.`DisplayStockQuantity` AS `DisplayStockQuantity`,`Product`.`MinStockQuantity` AS `MinStockQuantity`,`Product`.`LowStockActivityId` AS `LowStockActivityId`,`Product`.`NotifyAdminForQuantityBelow` AS `NotifyAdminForQuantityBelow`,`Product`.`BackorderModeId` AS `BackorderModeId`,`Product`.`AllowBackInStockSubscriptions` AS `AllowBackInStockSubscriptions`,`Product`.`OrderMinimumQuantity` AS `OrderMinimumQuantity`,`Product`.`OrderMaximumQuantity` AS `OrderMaximumQuantity`,`Product`.`AllowedQuantities` AS `AllowedQuantities`,`Product`.`AllowAddingOnlyExistingAttributeCombinations` AS `AllowAddingOnlyExistingAttributeCombinations`,`Product`.`NotReturnable` AS `NotReturnable`,`Product`.`DisableBuyButton` AS `DisableBuyButton`,`Product`.`DisableWishlistButton` AS `DisableWishlistButton`,`Product`.`AvailableForPreOrder` AS `AvailableForPreOrder`,`Product`.`PreOrderAvailabilityStartDateTimeUtc` AS `PreOrderAvailabilityStartDateTimeUtc`,`Product`.`CallForPrice` AS `CallForPrice`,`Product`.`Price` AS `Price`,`Product`.`OldPrice` AS `OldPrice`,`Product`.`ProductCost` AS `ProductCost`,`Product`.`CustomerEntersPrice` AS `CustomerEntersPrice`,`Product`.`MinimumCustomerEnteredPrice` AS `MinimumCustomerEnteredPrice`,`Product`.`MaximumCustomerEnteredPrice` AS `MaximumCustomerEnteredPrice`,`Product`.`BasepriceEnabled` AS `BasepriceEnabled`,`Product`.`BasepriceAmount` AS `BasepriceAmount`,`Product`.`BasepriceUnitId` AS `BasepriceUnitId`,`Product`.`BasepriceBaseAmount` AS `BasepriceBaseAmount`,`Product`.`BasepriceBaseUnitId` AS `BasepriceBaseUnitId`,`Product`.`MarkAsNew` AS `MarkAsNew`,`Product`.`MarkAsNewStartDateTimeUtc` AS `MarkAsNewStartDateTimeUtc`,`Product`.`MarkAsNewEndDateTimeUtc` AS `MarkAsNewEndDateTimeUtc`,`Product`.`HasTierPrices` AS `HasTierPrices`,`Product`.`HasDiscountsApplied` AS `HasDiscountsApplied`,`Product`.`Weight` AS `Weight`,`Product`.`Length` AS `Length`,`Product`.`Width` AS `Width`,`Product`.`Height` AS `Height`,`Product`.`AvailableStartDateTimeUtc` AS `AvailableStartDateTimeUtc`,`Product`.`AvailableEndDateTimeUtc` AS `AvailableEndDateTimeUtc`,`Product`.`DisplayOrder` AS `DisplayOrder`,`Product`.`Published` AS `Published`,`Product`.`Deleted` AS `Deleted`,`Product`.`CreatedOnUtc` AS `CreatedOnUtc`,`Product`.`UpdatedOnUtc` AS `UpdatedOnUtc`,`Product`.`Mf` AS `Mf`,`Product`.`MfAdet` AS `MfAdet`,`Product`.`MfAdetFazla` AS `MfAdetFazla`,`Product`.`Miad` AS `Miad`,`Product`.`MiadDate` AS `MiadDate`,`Product`.`KamuOdenen` AS `KamuOdenen`,`Product`.`FiyatFarki` AS `FiyatFarki` from `Product` where ((`Product`.`ProductTypeId` = 5) and (`Product`.`ParentGroupedProductId` <> 0) and (0 <> `Product`.`Published`) and (0 = `Product`.`Deleted`))) `p2` on((`p`.`Id` = `p2`.`ParentGroupedProductId`))) join `OrderItem` `oi` on((`p2`.`Id` = `oi`.`ProductId`))) join (select `Order`.`Id` AS `Id`,`Order`.`OrderGuid` AS `OrderGuid`,`Order`.`StoreId` AS `StoreId`,`Order`.`CustomerId` AS `CustomerId`,`Order`.`BillingAddressId` AS `BillingAddressId`,`Order`.`ShippingAddressId` AS `ShippingAddressId`,`Order`.`PickupAddressId` AS `PickupAddressId`,`Order`.`PickupInStore` AS `PickupInStore`,`Order`.`OrderStatusId` AS `OrderStatusId`,`Order`.`ShippingStatusId` AS `ShippingStatusId`,`Order`.`PaymentStatusId` AS `PaymentStatusId`,`Order`.`PaymentMethodSystemName` AS `PaymentMethodSystemName`,`Order`.`CustomerCurrencyCode` AS `CustomerCurrencyCode`,`Order`.`CurrencyRate` AS `CurrencyRate`,`Order`.`CustomerTaxDisplayTypeId` AS `CustomerTaxDisplayTypeId`,`Order`.`VatNumber` AS `VatNumber`,`Order`.`OrderSubtotalInclTax` AS `OrderSubtotalInclTax`,`Order`.`OrderSubtotalExclTax` AS `OrderSubtotalExclTax`,`Order`.`OrderSubTotalDiscountInclTax` AS `OrderSubTotalDiscountInclTax`,`Order`.`OrderSubTotalDiscountExclTax` AS `OrderSubTotalDiscountExclTax`,`Order`.`OrderShippingInclTax` AS `OrderShippingInclTax`,`Order`.`OrderShippingExclTax` AS `OrderShippingExclTax`,`Order`.`PaymentMethodAdditionalFeeInclTax` AS `PaymentMethodAdditionalFeeInclTax`,`Order`.`PaymentMethodAdditionalFeeExclTax` AS `PaymentMethodAdditionalFeeExclTax`,`Order`.`TaxRates` AS `TaxRates`,`Order`.`OrderTax` AS `OrderTax`,`Order`.`OrderDiscount` AS `OrderDiscount`,`Order`.`OrderTotal` AS `OrderTotal`,`Order`.`RefundedAmount` AS `RefundedAmount`,`Order`.`RewardPointsHistoryEntryId` AS `RewardPointsHistoryEntryId`,`Order`.`CheckoutAttributeDescription` AS `CheckoutAttributeDescription`,`Order`.`CheckoutAttributesXml` AS `CheckoutAttributesXml`,`Order`.`CustomerLanguageId` AS `CustomerLanguageId`,`Order`.`AffiliateId` AS `AffiliateId`,`Order`.`CustomerIp` AS `CustomerIp`,`Order`.`AllowStoringCreditCardNumber` AS `AllowStoringCreditCardNumber`,`Order`.`CardType` AS `CardType`,`Order`.`CardName` AS `CardName`,`Order`.`CardNumber` AS `CardNumber`,`Order`.`MaskedCreditCardNumber` AS `MaskedCreditCardNumber`,`Order`.`CardCvv2` AS `CardCvv2`,`Order`.`CardExpirationMonth` AS `CardExpirationMonth`,`Order`.`CardExpirationYear` AS `CardExpirationYear`,`Order`.`AuthorizationTransactionId` AS `AuthorizationTransactionId`,`Order`.`AuthorizationTransactionCode` AS `AuthorizationTransactionCode`,`Order`.`AuthorizationTransactionResult` AS `AuthorizationTransactionResult`,`Order`.`CaptureTransactionId` AS `CaptureTransactionId`,`Order`.`CaptureTransactionResult` AS `CaptureTransactionResult`,`Order`.`SubscriptionTransactionId` AS `SubscriptionTransactionId`,`Order`.`PaidDateUtc` AS `PaidDateUtc`,`Order`.`ShippingMethod` AS `ShippingMethod`,`Order`.`ShippingRateComputationMethodSystemName` AS `ShippingRateComputationMethodSystemName`,`Order`.`CustomValuesXml` AS `CustomValuesXml`,`Order`.`Deleted` AS `Deleted`,`Order`.`CreatedOnUtc` AS `CreatedOnUtc`,`Order`.`CustomOrderNumber` AS `CustomOrderNumber`,`Order`.`RedeemedRewardPointsEntryId` AS `RedeemedRewardPointsEntryId` from `Order` where ((`Order`.`OrderStatusId` <> 40) and (`Order`.`PaymentStatusId` <> 20) and (0 = `Order`.`Deleted`))) `o` on((`oi`.`OrderId` = `o`.`Id`))) where ((`p`.`ProductTypeId` = 10) and (`p`.`ParentGroupedProductId` = 0) and (0 <> `p`.`Published`) and (0 = `p`.`Deleted`) and (0 = `o`.`Deleted`) and (`o`.`CreatedOnUtc` >= '2020-10-24') and (`c`.`Name` = 'Kişisel Bakım')) group by `Baslangic` order by `o`.`CreatedOnUtc` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `LoginYapmamis`
--

/*!50001 DROP VIEW IF EXISTS `LoginYapmamis`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `LoginYapmamis` AS select date_format((`c`.`CreatedOnUtc` + interval ((1 - dayofweek(`c`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Baslangic`,date_format((`c`.`CreatedOnUtc` + interval ((7 - dayofweek(`c`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Bitis`,sum(count(0)) OVER (ORDER BY `c`.`CreatedOnUtc` )  AS `LoginOlmamislar` from `Customer` `c` where ((`c`.`Deleted` = 0) and (`c`.`CreatedOnUtc` >= '2020-10-24') and (`c`.`Active` = 1) and `c`.`Id` in (select `Customer`.`Id` from `Customer` where ((`Customer`.`Id` >= 1078412) and (`Customer`.`Id` <= 1078648))) is false and (`c`.`Email` is not null) and (`c`.`Email` <> '') and (`c`.`VendorId` = 0)) group by `Baslangic` order by `c`.`CreatedOnUtc` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Medikal`
--

/*!50001 DROP VIEW IF EXISTS `Medikal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Medikal` AS select date_format((`o`.`CreatedOnUtc` + interval ((1 - dayofweek(`o`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Baslangic`,date_format((`o`.`CreatedOnUtc` + interval ((7 - dayofweek(`o`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Bitis`,`c`.`Name` AS `Name4`,count(distinct `p`.`Id`) AS `IlanSayisi4`,sum(`oi`.`Quantity`) AS `SatisMiktari4`,sum(`oi`.`PriceInclTax`) AS `SatisTutari4` from ((((((`AllCategoriesByParent` `mc` join `Category` `c` on((`mc`.`MainCategoryId` = `c`.`Id`))) join `Product_Category_Mapping` `pcm` on((find_in_set(`pcm`.`CategoryId`,`mc`.`Ids`) > 0))) join `Product` `p` on((`pcm`.`ProductId` = `p`.`Id`))) join (select `Product`.`Id` AS `Id`,`Product`.`ProductTypeId` AS `ProductTypeId`,`Product`.`ParentGroupedProductId` AS `ParentGroupedProductId`,`Product`.`VisibleIndividually` AS `VisibleIndividually`,`Product`.`Name` AS `Name`,`Product`.`ShortDescription` AS `ShortDescription`,`Product`.`FullDescription` AS `FullDescription`,`Product`.`AdminComment` AS `AdminComment`,`Product`.`ProductTemplateId` AS `ProductTemplateId`,`Product`.`VendorId` AS `VendorId`,`Product`.`ShowOnHomepage` AS `ShowOnHomepage`,`Product`.`MetaKeywords` AS `MetaKeywords`,`Product`.`MetaDescription` AS `MetaDescription`,`Product`.`MetaTitle` AS `MetaTitle`,`Product`.`AllowCustomerReviews` AS `AllowCustomerReviews`,`Product`.`ApprovedRatingSum` AS `ApprovedRatingSum`,`Product`.`NotApprovedRatingSum` AS `NotApprovedRatingSum`,`Product`.`ApprovedTotalReviews` AS `ApprovedTotalReviews`,`Product`.`NotApprovedTotalReviews` AS `NotApprovedTotalReviews`,`Product`.`SubjectToAcl` AS `SubjectToAcl`,`Product`.`LimitedToStores` AS `LimitedToStores`,`Product`.`Sku` AS `Sku`,`Product`.`ManufacturerPartNumber` AS `ManufacturerPartNumber`,`Product`.`Gtin` AS `Gtin`,`Product`.`IsGiftCard` AS `IsGiftCard`,`Product`.`GiftCardTypeId` AS `GiftCardTypeId`,`Product`.`OverriddenGiftCardAmount` AS `OverriddenGiftCardAmount`,`Product`.`RequireOtherProducts` AS `RequireOtherProducts`,`Product`.`RequiredProductIds` AS `RequiredProductIds`,`Product`.`AutomaticallyAddRequiredProducts` AS `AutomaticallyAddRequiredProducts`,`Product`.`IsDownload` AS `IsDownload`,`Product`.`DownloadId` AS `DownloadId`,`Product`.`UnlimitedDownloads` AS `UnlimitedDownloads`,`Product`.`MaxNumberOfDownloads` AS `MaxNumberOfDownloads`,`Product`.`DownloadExpirationDays` AS `DownloadExpirationDays`,`Product`.`DownloadActivationTypeId` AS `DownloadActivationTypeId`,`Product`.`HasSampleDownload` AS `HasSampleDownload`,`Product`.`SampleDownloadId` AS `SampleDownloadId`,`Product`.`HasUserAgreement` AS `HasUserAgreement`,`Product`.`UserAgreementText` AS `UserAgreementText`,`Product`.`IsRecurring` AS `IsRecurring`,`Product`.`RecurringCycleLength` AS `RecurringCycleLength`,`Product`.`RecurringCyclePeriodId` AS `RecurringCyclePeriodId`,`Product`.`RecurringTotalCycles` AS `RecurringTotalCycles`,`Product`.`IsRental` AS `IsRental`,`Product`.`RentalPriceLength` AS `RentalPriceLength`,`Product`.`RentalPricePeriodId` AS `RentalPricePeriodId`,`Product`.`IsShipEnabled` AS `IsShipEnabled`,`Product`.`IsFreeShipping` AS `IsFreeShipping`,`Product`.`ShipSeparately` AS `ShipSeparately`,`Product`.`AdditionalShippingCharge` AS `AdditionalShippingCharge`,`Product`.`DeliveryDateId` AS `DeliveryDateId`,`Product`.`IsTaxExempt` AS `IsTaxExempt`,`Product`.`TaxCategoryId` AS `TaxCategoryId`,`Product`.`IsTelecommunicationsOrBroadcastingOrElectronicServices` AS `IsTelecommunicationsOrBroadcastingOrElectronicServices`,`Product`.`ManageInventoryMethodId` AS `ManageInventoryMethodId`,`Product`.`ProductAvailabilityRangeId` AS `ProductAvailabilityRangeId`,`Product`.`UseMultipleWarehouses` AS `UseMultipleWarehouses`,`Product`.`WarehouseId` AS `WarehouseId`,`Product`.`StockQuantity` AS `StockQuantity`,`Product`.`DisplayStockAvailability` AS `DisplayStockAvailability`,`Product`.`DisplayStockQuantity` AS `DisplayStockQuantity`,`Product`.`MinStockQuantity` AS `MinStockQuantity`,`Product`.`LowStockActivityId` AS `LowStockActivityId`,`Product`.`NotifyAdminForQuantityBelow` AS `NotifyAdminForQuantityBelow`,`Product`.`BackorderModeId` AS `BackorderModeId`,`Product`.`AllowBackInStockSubscriptions` AS `AllowBackInStockSubscriptions`,`Product`.`OrderMinimumQuantity` AS `OrderMinimumQuantity`,`Product`.`OrderMaximumQuantity` AS `OrderMaximumQuantity`,`Product`.`AllowedQuantities` AS `AllowedQuantities`,`Product`.`AllowAddingOnlyExistingAttributeCombinations` AS `AllowAddingOnlyExistingAttributeCombinations`,`Product`.`NotReturnable` AS `NotReturnable`,`Product`.`DisableBuyButton` AS `DisableBuyButton`,`Product`.`DisableWishlistButton` AS `DisableWishlistButton`,`Product`.`AvailableForPreOrder` AS `AvailableForPreOrder`,`Product`.`PreOrderAvailabilityStartDateTimeUtc` AS `PreOrderAvailabilityStartDateTimeUtc`,`Product`.`CallForPrice` AS `CallForPrice`,`Product`.`Price` AS `Price`,`Product`.`OldPrice` AS `OldPrice`,`Product`.`ProductCost` AS `ProductCost`,`Product`.`CustomerEntersPrice` AS `CustomerEntersPrice`,`Product`.`MinimumCustomerEnteredPrice` AS `MinimumCustomerEnteredPrice`,`Product`.`MaximumCustomerEnteredPrice` AS `MaximumCustomerEnteredPrice`,`Product`.`BasepriceEnabled` AS `BasepriceEnabled`,`Product`.`BasepriceAmount` AS `BasepriceAmount`,`Product`.`BasepriceUnitId` AS `BasepriceUnitId`,`Product`.`BasepriceBaseAmount` AS `BasepriceBaseAmount`,`Product`.`BasepriceBaseUnitId` AS `BasepriceBaseUnitId`,`Product`.`MarkAsNew` AS `MarkAsNew`,`Product`.`MarkAsNewStartDateTimeUtc` AS `MarkAsNewStartDateTimeUtc`,`Product`.`MarkAsNewEndDateTimeUtc` AS `MarkAsNewEndDateTimeUtc`,`Product`.`HasTierPrices` AS `HasTierPrices`,`Product`.`HasDiscountsApplied` AS `HasDiscountsApplied`,`Product`.`Weight` AS `Weight`,`Product`.`Length` AS `Length`,`Product`.`Width` AS `Width`,`Product`.`Height` AS `Height`,`Product`.`AvailableStartDateTimeUtc` AS `AvailableStartDateTimeUtc`,`Product`.`AvailableEndDateTimeUtc` AS `AvailableEndDateTimeUtc`,`Product`.`DisplayOrder` AS `DisplayOrder`,`Product`.`Published` AS `Published`,`Product`.`Deleted` AS `Deleted`,`Product`.`CreatedOnUtc` AS `CreatedOnUtc`,`Product`.`UpdatedOnUtc` AS `UpdatedOnUtc`,`Product`.`Mf` AS `Mf`,`Product`.`MfAdet` AS `MfAdet`,`Product`.`MfAdetFazla` AS `MfAdetFazla`,`Product`.`Miad` AS `Miad`,`Product`.`MiadDate` AS `MiadDate`,`Product`.`KamuOdenen` AS `KamuOdenen`,`Product`.`FiyatFarki` AS `FiyatFarki` from `Product` where ((`Product`.`ProductTypeId` = 5) and (`Product`.`ParentGroupedProductId` <> 0) and (0 <> `Product`.`Published`) and (0 = `Product`.`Deleted`))) `p2` on((`p`.`Id` = `p2`.`ParentGroupedProductId`))) join `OrderItem` `oi` on((`p2`.`Id` = `oi`.`ProductId`))) join (select `Order`.`Id` AS `Id`,`Order`.`OrderGuid` AS `OrderGuid`,`Order`.`StoreId` AS `StoreId`,`Order`.`CustomerId` AS `CustomerId`,`Order`.`BillingAddressId` AS `BillingAddressId`,`Order`.`ShippingAddressId` AS `ShippingAddressId`,`Order`.`PickupAddressId` AS `PickupAddressId`,`Order`.`PickupInStore` AS `PickupInStore`,`Order`.`OrderStatusId` AS `OrderStatusId`,`Order`.`ShippingStatusId` AS `ShippingStatusId`,`Order`.`PaymentStatusId` AS `PaymentStatusId`,`Order`.`PaymentMethodSystemName` AS `PaymentMethodSystemName`,`Order`.`CustomerCurrencyCode` AS `CustomerCurrencyCode`,`Order`.`CurrencyRate` AS `CurrencyRate`,`Order`.`CustomerTaxDisplayTypeId` AS `CustomerTaxDisplayTypeId`,`Order`.`VatNumber` AS `VatNumber`,`Order`.`OrderSubtotalInclTax` AS `OrderSubtotalInclTax`,`Order`.`OrderSubtotalExclTax` AS `OrderSubtotalExclTax`,`Order`.`OrderSubTotalDiscountInclTax` AS `OrderSubTotalDiscountInclTax`,`Order`.`OrderSubTotalDiscountExclTax` AS `OrderSubTotalDiscountExclTax`,`Order`.`OrderShippingInclTax` AS `OrderShippingInclTax`,`Order`.`OrderShippingExclTax` AS `OrderShippingExclTax`,`Order`.`PaymentMethodAdditionalFeeInclTax` AS `PaymentMethodAdditionalFeeInclTax`,`Order`.`PaymentMethodAdditionalFeeExclTax` AS `PaymentMethodAdditionalFeeExclTax`,`Order`.`TaxRates` AS `TaxRates`,`Order`.`OrderTax` AS `OrderTax`,`Order`.`OrderDiscount` AS `OrderDiscount`,`Order`.`OrderTotal` AS `OrderTotal`,`Order`.`RefundedAmount` AS `RefundedAmount`,`Order`.`RewardPointsHistoryEntryId` AS `RewardPointsHistoryEntryId`,`Order`.`CheckoutAttributeDescription` AS `CheckoutAttributeDescription`,`Order`.`CheckoutAttributesXml` AS `CheckoutAttributesXml`,`Order`.`CustomerLanguageId` AS `CustomerLanguageId`,`Order`.`AffiliateId` AS `AffiliateId`,`Order`.`CustomerIp` AS `CustomerIp`,`Order`.`AllowStoringCreditCardNumber` AS `AllowStoringCreditCardNumber`,`Order`.`CardType` AS `CardType`,`Order`.`CardName` AS `CardName`,`Order`.`CardNumber` AS `CardNumber`,`Order`.`MaskedCreditCardNumber` AS `MaskedCreditCardNumber`,`Order`.`CardCvv2` AS `CardCvv2`,`Order`.`CardExpirationMonth` AS `CardExpirationMonth`,`Order`.`CardExpirationYear` AS `CardExpirationYear`,`Order`.`AuthorizationTransactionId` AS `AuthorizationTransactionId`,`Order`.`AuthorizationTransactionCode` AS `AuthorizationTransactionCode`,`Order`.`AuthorizationTransactionResult` AS `AuthorizationTransactionResult`,`Order`.`CaptureTransactionId` AS `CaptureTransactionId`,`Order`.`CaptureTransactionResult` AS `CaptureTransactionResult`,`Order`.`SubscriptionTransactionId` AS `SubscriptionTransactionId`,`Order`.`PaidDateUtc` AS `PaidDateUtc`,`Order`.`ShippingMethod` AS `ShippingMethod`,`Order`.`ShippingRateComputationMethodSystemName` AS `ShippingRateComputationMethodSystemName`,`Order`.`CustomValuesXml` AS `CustomValuesXml`,`Order`.`Deleted` AS `Deleted`,`Order`.`CreatedOnUtc` AS `CreatedOnUtc`,`Order`.`CustomOrderNumber` AS `CustomOrderNumber`,`Order`.`RedeemedRewardPointsEntryId` AS `RedeemedRewardPointsEntryId` from `Order` where ((`Order`.`OrderStatusId` <> 40) and (`Order`.`PaymentStatusId` <> 20) and (0 = `Order`.`Deleted`))) `o` on((`oi`.`OrderId` = `o`.`Id`))) where ((`p`.`ProductTypeId` = 10) and (`p`.`ParentGroupedProductId` = 0) and (0 <> `p`.`Published`) and (0 = `p`.`Deleted`) and (0 = `o`.`Deleted`) and (`o`.`CreatedOnUtc` >= '2020-10-24') and (`c`.`Name` = 'Medikal')) group by `Baslangic` order by `o`.`CreatedOnUtc` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ReceteliIlac`
--

/*!50001 DROP VIEW IF EXISTS `ReceteliIlac`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ReceteliIlac` AS select date_format((`o`.`CreatedOnUtc` + interval ((1 - dayofweek(`o`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Baslangic`,date_format((`o`.`CreatedOnUtc` + interval ((7 - dayofweek(`o`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Bitis`,`c`.`Name` AS `Name1`,count(distinct `p`.`Id`) AS `IlanSayisi1`,sum(`oi`.`Quantity`) AS `SatisMiktari1`,sum(`oi`.`PriceInclTax`) AS `SatisTutari1` from ((((((`AllCategoriesByParent` `mc` join `Category` `c` on((`mc`.`MainCategoryId` = `c`.`Id`))) join `Product_Category_Mapping` `pcm` on((find_in_set(`pcm`.`CategoryId`,`mc`.`Ids`) > 0))) join `Product` `p` on((`pcm`.`ProductId` = `p`.`Id`))) join (select `Product`.`Id` AS `Id`,`Product`.`ProductTypeId` AS `ProductTypeId`,`Product`.`ParentGroupedProductId` AS `ParentGroupedProductId`,`Product`.`VisibleIndividually` AS `VisibleIndividually`,`Product`.`Name` AS `Name`,`Product`.`ShortDescription` AS `ShortDescription`,`Product`.`FullDescription` AS `FullDescription`,`Product`.`AdminComment` AS `AdminComment`,`Product`.`ProductTemplateId` AS `ProductTemplateId`,`Product`.`VendorId` AS `VendorId`,`Product`.`ShowOnHomepage` AS `ShowOnHomepage`,`Product`.`MetaKeywords` AS `MetaKeywords`,`Product`.`MetaDescription` AS `MetaDescription`,`Product`.`MetaTitle` AS `MetaTitle`,`Product`.`AllowCustomerReviews` AS `AllowCustomerReviews`,`Product`.`ApprovedRatingSum` AS `ApprovedRatingSum`,`Product`.`NotApprovedRatingSum` AS `NotApprovedRatingSum`,`Product`.`ApprovedTotalReviews` AS `ApprovedTotalReviews`,`Product`.`NotApprovedTotalReviews` AS `NotApprovedTotalReviews`,`Product`.`SubjectToAcl` AS `SubjectToAcl`,`Product`.`LimitedToStores` AS `LimitedToStores`,`Product`.`Sku` AS `Sku`,`Product`.`ManufacturerPartNumber` AS `ManufacturerPartNumber`,`Product`.`Gtin` AS `Gtin`,`Product`.`IsGiftCard` AS `IsGiftCard`,`Product`.`GiftCardTypeId` AS `GiftCardTypeId`,`Product`.`OverriddenGiftCardAmount` AS `OverriddenGiftCardAmount`,`Product`.`RequireOtherProducts` AS `RequireOtherProducts`,`Product`.`RequiredProductIds` AS `RequiredProductIds`,`Product`.`AutomaticallyAddRequiredProducts` AS `AutomaticallyAddRequiredProducts`,`Product`.`IsDownload` AS `IsDownload`,`Product`.`DownloadId` AS `DownloadId`,`Product`.`UnlimitedDownloads` AS `UnlimitedDownloads`,`Product`.`MaxNumberOfDownloads` AS `MaxNumberOfDownloads`,`Product`.`DownloadExpirationDays` AS `DownloadExpirationDays`,`Product`.`DownloadActivationTypeId` AS `DownloadActivationTypeId`,`Product`.`HasSampleDownload` AS `HasSampleDownload`,`Product`.`SampleDownloadId` AS `SampleDownloadId`,`Product`.`HasUserAgreement` AS `HasUserAgreement`,`Product`.`UserAgreementText` AS `UserAgreementText`,`Product`.`IsRecurring` AS `IsRecurring`,`Product`.`RecurringCycleLength` AS `RecurringCycleLength`,`Product`.`RecurringCyclePeriodId` AS `RecurringCyclePeriodId`,`Product`.`RecurringTotalCycles` AS `RecurringTotalCycles`,`Product`.`IsRental` AS `IsRental`,`Product`.`RentalPriceLength` AS `RentalPriceLength`,`Product`.`RentalPricePeriodId` AS `RentalPricePeriodId`,`Product`.`IsShipEnabled` AS `IsShipEnabled`,`Product`.`IsFreeShipping` AS `IsFreeShipping`,`Product`.`ShipSeparately` AS `ShipSeparately`,`Product`.`AdditionalShippingCharge` AS `AdditionalShippingCharge`,`Product`.`DeliveryDateId` AS `DeliveryDateId`,`Product`.`IsTaxExempt` AS `IsTaxExempt`,`Product`.`TaxCategoryId` AS `TaxCategoryId`,`Product`.`IsTelecommunicationsOrBroadcastingOrElectronicServices` AS `IsTelecommunicationsOrBroadcastingOrElectronicServices`,`Product`.`ManageInventoryMethodId` AS `ManageInventoryMethodId`,`Product`.`ProductAvailabilityRangeId` AS `ProductAvailabilityRangeId`,`Product`.`UseMultipleWarehouses` AS `UseMultipleWarehouses`,`Product`.`WarehouseId` AS `WarehouseId`,`Product`.`StockQuantity` AS `StockQuantity`,`Product`.`DisplayStockAvailability` AS `DisplayStockAvailability`,`Product`.`DisplayStockQuantity` AS `DisplayStockQuantity`,`Product`.`MinStockQuantity` AS `MinStockQuantity`,`Product`.`LowStockActivityId` AS `LowStockActivityId`,`Product`.`NotifyAdminForQuantityBelow` AS `NotifyAdminForQuantityBelow`,`Product`.`BackorderModeId` AS `BackorderModeId`,`Product`.`AllowBackInStockSubscriptions` AS `AllowBackInStockSubscriptions`,`Product`.`OrderMinimumQuantity` AS `OrderMinimumQuantity`,`Product`.`OrderMaximumQuantity` AS `OrderMaximumQuantity`,`Product`.`AllowedQuantities` AS `AllowedQuantities`,`Product`.`AllowAddingOnlyExistingAttributeCombinations` AS `AllowAddingOnlyExistingAttributeCombinations`,`Product`.`NotReturnable` AS `NotReturnable`,`Product`.`DisableBuyButton` AS `DisableBuyButton`,`Product`.`DisableWishlistButton` AS `DisableWishlistButton`,`Product`.`AvailableForPreOrder` AS `AvailableForPreOrder`,`Product`.`PreOrderAvailabilityStartDateTimeUtc` AS `PreOrderAvailabilityStartDateTimeUtc`,`Product`.`CallForPrice` AS `CallForPrice`,`Product`.`Price` AS `Price`,`Product`.`OldPrice` AS `OldPrice`,`Product`.`ProductCost` AS `ProductCost`,`Product`.`CustomerEntersPrice` AS `CustomerEntersPrice`,`Product`.`MinimumCustomerEnteredPrice` AS `MinimumCustomerEnteredPrice`,`Product`.`MaximumCustomerEnteredPrice` AS `MaximumCustomerEnteredPrice`,`Product`.`BasepriceEnabled` AS `BasepriceEnabled`,`Product`.`BasepriceAmount` AS `BasepriceAmount`,`Product`.`BasepriceUnitId` AS `BasepriceUnitId`,`Product`.`BasepriceBaseAmount` AS `BasepriceBaseAmount`,`Product`.`BasepriceBaseUnitId` AS `BasepriceBaseUnitId`,`Product`.`MarkAsNew` AS `MarkAsNew`,`Product`.`MarkAsNewStartDateTimeUtc` AS `MarkAsNewStartDateTimeUtc`,`Product`.`MarkAsNewEndDateTimeUtc` AS `MarkAsNewEndDateTimeUtc`,`Product`.`HasTierPrices` AS `HasTierPrices`,`Product`.`HasDiscountsApplied` AS `HasDiscountsApplied`,`Product`.`Weight` AS `Weight`,`Product`.`Length` AS `Length`,`Product`.`Width` AS `Width`,`Product`.`Height` AS `Height`,`Product`.`AvailableStartDateTimeUtc` AS `AvailableStartDateTimeUtc`,`Product`.`AvailableEndDateTimeUtc` AS `AvailableEndDateTimeUtc`,`Product`.`DisplayOrder` AS `DisplayOrder`,`Product`.`Published` AS `Published`,`Product`.`Deleted` AS `Deleted`,`Product`.`CreatedOnUtc` AS `CreatedOnUtc`,`Product`.`UpdatedOnUtc` AS `UpdatedOnUtc`,`Product`.`Mf` AS `Mf`,`Product`.`MfAdet` AS `MfAdet`,`Product`.`MfAdetFazla` AS `MfAdetFazla`,`Product`.`Miad` AS `Miad`,`Product`.`MiadDate` AS `MiadDate`,`Product`.`KamuOdenen` AS `KamuOdenen`,`Product`.`FiyatFarki` AS `FiyatFarki` from `Product` where ((`Product`.`ProductTypeId` = 5) and (`Product`.`ParentGroupedProductId` <> 0) and (0 <> `Product`.`Published`) and (0 = `Product`.`Deleted`))) `p2` on((`p`.`Id` = `p2`.`ParentGroupedProductId`))) join `OrderItem` `oi` on((`p2`.`Id` = `oi`.`ProductId`))) join (select `Order`.`Id` AS `Id`,`Order`.`OrderGuid` AS `OrderGuid`,`Order`.`StoreId` AS `StoreId`,`Order`.`CustomerId` AS `CustomerId`,`Order`.`BillingAddressId` AS `BillingAddressId`,`Order`.`ShippingAddressId` AS `ShippingAddressId`,`Order`.`PickupAddressId` AS `PickupAddressId`,`Order`.`PickupInStore` AS `PickupInStore`,`Order`.`OrderStatusId` AS `OrderStatusId`,`Order`.`ShippingStatusId` AS `ShippingStatusId`,`Order`.`PaymentStatusId` AS `PaymentStatusId`,`Order`.`PaymentMethodSystemName` AS `PaymentMethodSystemName`,`Order`.`CustomerCurrencyCode` AS `CustomerCurrencyCode`,`Order`.`CurrencyRate` AS `CurrencyRate`,`Order`.`CustomerTaxDisplayTypeId` AS `CustomerTaxDisplayTypeId`,`Order`.`VatNumber` AS `VatNumber`,`Order`.`OrderSubtotalInclTax` AS `OrderSubtotalInclTax`,`Order`.`OrderSubtotalExclTax` AS `OrderSubtotalExclTax`,`Order`.`OrderSubTotalDiscountInclTax` AS `OrderSubTotalDiscountInclTax`,`Order`.`OrderSubTotalDiscountExclTax` AS `OrderSubTotalDiscountExclTax`,`Order`.`OrderShippingInclTax` AS `OrderShippingInclTax`,`Order`.`OrderShippingExclTax` AS `OrderShippingExclTax`,`Order`.`PaymentMethodAdditionalFeeInclTax` AS `PaymentMethodAdditionalFeeInclTax`,`Order`.`PaymentMethodAdditionalFeeExclTax` AS `PaymentMethodAdditionalFeeExclTax`,`Order`.`TaxRates` AS `TaxRates`,`Order`.`OrderTax` AS `OrderTax`,`Order`.`OrderDiscount` AS `OrderDiscount`,`Order`.`OrderTotal` AS `OrderTotal`,`Order`.`RefundedAmount` AS `RefundedAmount`,`Order`.`RewardPointsHistoryEntryId` AS `RewardPointsHistoryEntryId`,`Order`.`CheckoutAttributeDescription` AS `CheckoutAttributeDescription`,`Order`.`CheckoutAttributesXml` AS `CheckoutAttributesXml`,`Order`.`CustomerLanguageId` AS `CustomerLanguageId`,`Order`.`AffiliateId` AS `AffiliateId`,`Order`.`CustomerIp` AS `CustomerIp`,`Order`.`AllowStoringCreditCardNumber` AS `AllowStoringCreditCardNumber`,`Order`.`CardType` AS `CardType`,`Order`.`CardName` AS `CardName`,`Order`.`CardNumber` AS `CardNumber`,`Order`.`MaskedCreditCardNumber` AS `MaskedCreditCardNumber`,`Order`.`CardCvv2` AS `CardCvv2`,`Order`.`CardExpirationMonth` AS `CardExpirationMonth`,`Order`.`CardExpirationYear` AS `CardExpirationYear`,`Order`.`AuthorizationTransactionId` AS `AuthorizationTransactionId`,`Order`.`AuthorizationTransactionCode` AS `AuthorizationTransactionCode`,`Order`.`AuthorizationTransactionResult` AS `AuthorizationTransactionResult`,`Order`.`CaptureTransactionId` AS `CaptureTransactionId`,`Order`.`CaptureTransactionResult` AS `CaptureTransactionResult`,`Order`.`SubscriptionTransactionId` AS `SubscriptionTransactionId`,`Order`.`PaidDateUtc` AS `PaidDateUtc`,`Order`.`ShippingMethod` AS `ShippingMethod`,`Order`.`ShippingRateComputationMethodSystemName` AS `ShippingRateComputationMethodSystemName`,`Order`.`CustomValuesXml` AS `CustomValuesXml`,`Order`.`Deleted` AS `Deleted`,`Order`.`CreatedOnUtc` AS `CreatedOnUtc`,`Order`.`CustomOrderNumber` AS `CustomOrderNumber`,`Order`.`RedeemedRewardPointsEntryId` AS `RedeemedRewardPointsEntryId` from `Order` where ((`Order`.`OrderStatusId` <> 40) and (`Order`.`PaymentStatusId` <> 20) and (0 = `Order`.`Deleted`))) `o` on((`oi`.`OrderId` = `o`.`Id`))) where ((`p`.`ProductTypeId` = 10) and (`p`.`ParentGroupedProductId` = 0) and (0 <> `p`.`Published`) and (0 = `p`.`Deleted`) and (0 = `o`.`Deleted`) and (`o`.`CreatedOnUtc` >= '2020-10-24') and (`c`.`Name` = 'Reçeteli İlaç')) group by `Baslangic` order by `o`.`CreatedOnUtc` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Saglik`
--

/*!50001 DROP VIEW IF EXISTS `Saglik`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Saglik` AS select date_format((`o`.`CreatedOnUtc` + interval ((1 - dayofweek(`o`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Baslangic`,date_format((`o`.`CreatedOnUtc` + interval ((7 - dayofweek(`o`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Bitis`,`c`.`Name` AS `Name6`,count(distinct `p`.`Id`) AS `IlanSayisi6`,sum(`oi`.`Quantity`) AS `SatisMiktari6`,sum(`oi`.`PriceInclTax`) AS `SatisTutari6` from ((((((`AllCategoriesByParent` `mc` join `Category` `c` on((`mc`.`MainCategoryId` = `c`.`Id`))) join `Product_Category_Mapping` `pcm` on((find_in_set(`pcm`.`CategoryId`,`mc`.`Ids`) > 0))) join `Product` `p` on((`pcm`.`ProductId` = `p`.`Id`))) join (select `Product`.`Id` AS `Id`,`Product`.`ProductTypeId` AS `ProductTypeId`,`Product`.`ParentGroupedProductId` AS `ParentGroupedProductId`,`Product`.`VisibleIndividually` AS `VisibleIndividually`,`Product`.`Name` AS `Name`,`Product`.`ShortDescription` AS `ShortDescription`,`Product`.`FullDescription` AS `FullDescription`,`Product`.`AdminComment` AS `AdminComment`,`Product`.`ProductTemplateId` AS `ProductTemplateId`,`Product`.`VendorId` AS `VendorId`,`Product`.`ShowOnHomepage` AS `ShowOnHomepage`,`Product`.`MetaKeywords` AS `MetaKeywords`,`Product`.`MetaDescription` AS `MetaDescription`,`Product`.`MetaTitle` AS `MetaTitle`,`Product`.`AllowCustomerReviews` AS `AllowCustomerReviews`,`Product`.`ApprovedRatingSum` AS `ApprovedRatingSum`,`Product`.`NotApprovedRatingSum` AS `NotApprovedRatingSum`,`Product`.`ApprovedTotalReviews` AS `ApprovedTotalReviews`,`Product`.`NotApprovedTotalReviews` AS `NotApprovedTotalReviews`,`Product`.`SubjectToAcl` AS `SubjectToAcl`,`Product`.`LimitedToStores` AS `LimitedToStores`,`Product`.`Sku` AS `Sku`,`Product`.`ManufacturerPartNumber` AS `ManufacturerPartNumber`,`Product`.`Gtin` AS `Gtin`,`Product`.`IsGiftCard` AS `IsGiftCard`,`Product`.`GiftCardTypeId` AS `GiftCardTypeId`,`Product`.`OverriddenGiftCardAmount` AS `OverriddenGiftCardAmount`,`Product`.`RequireOtherProducts` AS `RequireOtherProducts`,`Product`.`RequiredProductIds` AS `RequiredProductIds`,`Product`.`AutomaticallyAddRequiredProducts` AS `AutomaticallyAddRequiredProducts`,`Product`.`IsDownload` AS `IsDownload`,`Product`.`DownloadId` AS `DownloadId`,`Product`.`UnlimitedDownloads` AS `UnlimitedDownloads`,`Product`.`MaxNumberOfDownloads` AS `MaxNumberOfDownloads`,`Product`.`DownloadExpirationDays` AS `DownloadExpirationDays`,`Product`.`DownloadActivationTypeId` AS `DownloadActivationTypeId`,`Product`.`HasSampleDownload` AS `HasSampleDownload`,`Product`.`SampleDownloadId` AS `SampleDownloadId`,`Product`.`HasUserAgreement` AS `HasUserAgreement`,`Product`.`UserAgreementText` AS `UserAgreementText`,`Product`.`IsRecurring` AS `IsRecurring`,`Product`.`RecurringCycleLength` AS `RecurringCycleLength`,`Product`.`RecurringCyclePeriodId` AS `RecurringCyclePeriodId`,`Product`.`RecurringTotalCycles` AS `RecurringTotalCycles`,`Product`.`IsRental` AS `IsRental`,`Product`.`RentalPriceLength` AS `RentalPriceLength`,`Product`.`RentalPricePeriodId` AS `RentalPricePeriodId`,`Product`.`IsShipEnabled` AS `IsShipEnabled`,`Product`.`IsFreeShipping` AS `IsFreeShipping`,`Product`.`ShipSeparately` AS `ShipSeparately`,`Product`.`AdditionalShippingCharge` AS `AdditionalShippingCharge`,`Product`.`DeliveryDateId` AS `DeliveryDateId`,`Product`.`IsTaxExempt` AS `IsTaxExempt`,`Product`.`TaxCategoryId` AS `TaxCategoryId`,`Product`.`IsTelecommunicationsOrBroadcastingOrElectronicServices` AS `IsTelecommunicationsOrBroadcastingOrElectronicServices`,`Product`.`ManageInventoryMethodId` AS `ManageInventoryMethodId`,`Product`.`ProductAvailabilityRangeId` AS `ProductAvailabilityRangeId`,`Product`.`UseMultipleWarehouses` AS `UseMultipleWarehouses`,`Product`.`WarehouseId` AS `WarehouseId`,`Product`.`StockQuantity` AS `StockQuantity`,`Product`.`DisplayStockAvailability` AS `DisplayStockAvailability`,`Product`.`DisplayStockQuantity` AS `DisplayStockQuantity`,`Product`.`MinStockQuantity` AS `MinStockQuantity`,`Product`.`LowStockActivityId` AS `LowStockActivityId`,`Product`.`NotifyAdminForQuantityBelow` AS `NotifyAdminForQuantityBelow`,`Product`.`BackorderModeId` AS `BackorderModeId`,`Product`.`AllowBackInStockSubscriptions` AS `AllowBackInStockSubscriptions`,`Product`.`OrderMinimumQuantity` AS `OrderMinimumQuantity`,`Product`.`OrderMaximumQuantity` AS `OrderMaximumQuantity`,`Product`.`AllowedQuantities` AS `AllowedQuantities`,`Product`.`AllowAddingOnlyExistingAttributeCombinations` AS `AllowAddingOnlyExistingAttributeCombinations`,`Product`.`NotReturnable` AS `NotReturnable`,`Product`.`DisableBuyButton` AS `DisableBuyButton`,`Product`.`DisableWishlistButton` AS `DisableWishlistButton`,`Product`.`AvailableForPreOrder` AS `AvailableForPreOrder`,`Product`.`PreOrderAvailabilityStartDateTimeUtc` AS `PreOrderAvailabilityStartDateTimeUtc`,`Product`.`CallForPrice` AS `CallForPrice`,`Product`.`Price` AS `Price`,`Product`.`OldPrice` AS `OldPrice`,`Product`.`ProductCost` AS `ProductCost`,`Product`.`CustomerEntersPrice` AS `CustomerEntersPrice`,`Product`.`MinimumCustomerEnteredPrice` AS `MinimumCustomerEnteredPrice`,`Product`.`MaximumCustomerEnteredPrice` AS `MaximumCustomerEnteredPrice`,`Product`.`BasepriceEnabled` AS `BasepriceEnabled`,`Product`.`BasepriceAmount` AS `BasepriceAmount`,`Product`.`BasepriceUnitId` AS `BasepriceUnitId`,`Product`.`BasepriceBaseAmount` AS `BasepriceBaseAmount`,`Product`.`BasepriceBaseUnitId` AS `BasepriceBaseUnitId`,`Product`.`MarkAsNew` AS `MarkAsNew`,`Product`.`MarkAsNewStartDateTimeUtc` AS `MarkAsNewStartDateTimeUtc`,`Product`.`MarkAsNewEndDateTimeUtc` AS `MarkAsNewEndDateTimeUtc`,`Product`.`HasTierPrices` AS `HasTierPrices`,`Product`.`HasDiscountsApplied` AS `HasDiscountsApplied`,`Product`.`Weight` AS `Weight`,`Product`.`Length` AS `Length`,`Product`.`Width` AS `Width`,`Product`.`Height` AS `Height`,`Product`.`AvailableStartDateTimeUtc` AS `AvailableStartDateTimeUtc`,`Product`.`AvailableEndDateTimeUtc` AS `AvailableEndDateTimeUtc`,`Product`.`DisplayOrder` AS `DisplayOrder`,`Product`.`Published` AS `Published`,`Product`.`Deleted` AS `Deleted`,`Product`.`CreatedOnUtc` AS `CreatedOnUtc`,`Product`.`UpdatedOnUtc` AS `UpdatedOnUtc`,`Product`.`Mf` AS `Mf`,`Product`.`MfAdet` AS `MfAdet`,`Product`.`MfAdetFazla` AS `MfAdetFazla`,`Product`.`Miad` AS `Miad`,`Product`.`MiadDate` AS `MiadDate`,`Product`.`KamuOdenen` AS `KamuOdenen`,`Product`.`FiyatFarki` AS `FiyatFarki` from `Product` where ((`Product`.`ProductTypeId` = 5) and (`Product`.`ParentGroupedProductId` <> 0) and (0 <> `Product`.`Published`) and (0 = `Product`.`Deleted`))) `p2` on((`p`.`Id` = `p2`.`ParentGroupedProductId`))) join `OrderItem` `oi` on((`p2`.`Id` = `oi`.`ProductId`))) join (select `Order`.`Id` AS `Id`,`Order`.`OrderGuid` AS `OrderGuid`,`Order`.`StoreId` AS `StoreId`,`Order`.`CustomerId` AS `CustomerId`,`Order`.`BillingAddressId` AS `BillingAddressId`,`Order`.`ShippingAddressId` AS `ShippingAddressId`,`Order`.`PickupAddressId` AS `PickupAddressId`,`Order`.`PickupInStore` AS `PickupInStore`,`Order`.`OrderStatusId` AS `OrderStatusId`,`Order`.`ShippingStatusId` AS `ShippingStatusId`,`Order`.`PaymentStatusId` AS `PaymentStatusId`,`Order`.`PaymentMethodSystemName` AS `PaymentMethodSystemName`,`Order`.`CustomerCurrencyCode` AS `CustomerCurrencyCode`,`Order`.`CurrencyRate` AS `CurrencyRate`,`Order`.`CustomerTaxDisplayTypeId` AS `CustomerTaxDisplayTypeId`,`Order`.`VatNumber` AS `VatNumber`,`Order`.`OrderSubtotalInclTax` AS `OrderSubtotalInclTax`,`Order`.`OrderSubtotalExclTax` AS `OrderSubtotalExclTax`,`Order`.`OrderSubTotalDiscountInclTax` AS `OrderSubTotalDiscountInclTax`,`Order`.`OrderSubTotalDiscountExclTax` AS `OrderSubTotalDiscountExclTax`,`Order`.`OrderShippingInclTax` AS `OrderShippingInclTax`,`Order`.`OrderShippingExclTax` AS `OrderShippingExclTax`,`Order`.`PaymentMethodAdditionalFeeInclTax` AS `PaymentMethodAdditionalFeeInclTax`,`Order`.`PaymentMethodAdditionalFeeExclTax` AS `PaymentMethodAdditionalFeeExclTax`,`Order`.`TaxRates` AS `TaxRates`,`Order`.`OrderTax` AS `OrderTax`,`Order`.`OrderDiscount` AS `OrderDiscount`,`Order`.`OrderTotal` AS `OrderTotal`,`Order`.`RefundedAmount` AS `RefundedAmount`,`Order`.`RewardPointsHistoryEntryId` AS `RewardPointsHistoryEntryId`,`Order`.`CheckoutAttributeDescription` AS `CheckoutAttributeDescription`,`Order`.`CheckoutAttributesXml` AS `CheckoutAttributesXml`,`Order`.`CustomerLanguageId` AS `CustomerLanguageId`,`Order`.`AffiliateId` AS `AffiliateId`,`Order`.`CustomerIp` AS `CustomerIp`,`Order`.`AllowStoringCreditCardNumber` AS `AllowStoringCreditCardNumber`,`Order`.`CardType` AS `CardType`,`Order`.`CardName` AS `CardName`,`Order`.`CardNumber` AS `CardNumber`,`Order`.`MaskedCreditCardNumber` AS `MaskedCreditCardNumber`,`Order`.`CardCvv2` AS `CardCvv2`,`Order`.`CardExpirationMonth` AS `CardExpirationMonth`,`Order`.`CardExpirationYear` AS `CardExpirationYear`,`Order`.`AuthorizationTransactionId` AS `AuthorizationTransactionId`,`Order`.`AuthorizationTransactionCode` AS `AuthorizationTransactionCode`,`Order`.`AuthorizationTransactionResult` AS `AuthorizationTransactionResult`,`Order`.`CaptureTransactionId` AS `CaptureTransactionId`,`Order`.`CaptureTransactionResult` AS `CaptureTransactionResult`,`Order`.`SubscriptionTransactionId` AS `SubscriptionTransactionId`,`Order`.`PaidDateUtc` AS `PaidDateUtc`,`Order`.`ShippingMethod` AS `ShippingMethod`,`Order`.`ShippingRateComputationMethodSystemName` AS `ShippingRateComputationMethodSystemName`,`Order`.`CustomValuesXml` AS `CustomValuesXml`,`Order`.`Deleted` AS `Deleted`,`Order`.`CreatedOnUtc` AS `CreatedOnUtc`,`Order`.`CustomOrderNumber` AS `CustomOrderNumber`,`Order`.`RedeemedRewardPointsEntryId` AS `RedeemedRewardPointsEntryId` from `Order` where ((`Order`.`OrderStatusId` <> 40) and (`Order`.`PaymentStatusId` <> 20) and (0 = `Order`.`Deleted`))) `o` on((`oi`.`OrderId` = `o`.`Id`))) where ((`p`.`ProductTypeId` = 10) and (`p`.`ParentGroupedProductId` = 0) and (0 <> `p`.`Published`) and (0 = `p`.`Deleted`) and (0 = `o`.`Deleted`) and (`o`.`CreatedOnUtc` >= '2020-10-24') and (`c`.`Name` = 'Sağlık')) group by `Baslangic` order by `o`.`CreatedOnUtc` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SarfMalzemeleri`
--

/*!50001 DROP VIEW IF EXISTS `SarfMalzemeleri`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `SarfMalzemeleri` AS select date_format((`o`.`CreatedOnUtc` + interval ((1 - dayofweek(`o`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Baslangic`,date_format((`o`.`CreatedOnUtc` + interval ((7 - dayofweek(`o`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Bitis`,`c`.`Name` AS `Name7`,count(distinct `p`.`Id`) AS `IlanSayisi7`,sum(`oi`.`Quantity`) AS `SatisMiktari7`,sum(`oi`.`PriceInclTax`) AS `SatisTutari7` from ((((((`AllCategoriesByParent` `mc` join `Category` `c` on((`mc`.`MainCategoryId` = `c`.`Id`))) join `Product_Category_Mapping` `pcm` on((find_in_set(`pcm`.`CategoryId`,`mc`.`Ids`) > 0))) join `Product` `p` on((`pcm`.`ProductId` = `p`.`Id`))) join (select `Product`.`Id` AS `Id`,`Product`.`ProductTypeId` AS `ProductTypeId`,`Product`.`ParentGroupedProductId` AS `ParentGroupedProductId`,`Product`.`VisibleIndividually` AS `VisibleIndividually`,`Product`.`Name` AS `Name`,`Product`.`ShortDescription` AS `ShortDescription`,`Product`.`FullDescription` AS `FullDescription`,`Product`.`AdminComment` AS `AdminComment`,`Product`.`ProductTemplateId` AS `ProductTemplateId`,`Product`.`VendorId` AS `VendorId`,`Product`.`ShowOnHomepage` AS `ShowOnHomepage`,`Product`.`MetaKeywords` AS `MetaKeywords`,`Product`.`MetaDescription` AS `MetaDescription`,`Product`.`MetaTitle` AS `MetaTitle`,`Product`.`AllowCustomerReviews` AS `AllowCustomerReviews`,`Product`.`ApprovedRatingSum` AS `ApprovedRatingSum`,`Product`.`NotApprovedRatingSum` AS `NotApprovedRatingSum`,`Product`.`ApprovedTotalReviews` AS `ApprovedTotalReviews`,`Product`.`NotApprovedTotalReviews` AS `NotApprovedTotalReviews`,`Product`.`SubjectToAcl` AS `SubjectToAcl`,`Product`.`LimitedToStores` AS `LimitedToStores`,`Product`.`Sku` AS `Sku`,`Product`.`ManufacturerPartNumber` AS `ManufacturerPartNumber`,`Product`.`Gtin` AS `Gtin`,`Product`.`IsGiftCard` AS `IsGiftCard`,`Product`.`GiftCardTypeId` AS `GiftCardTypeId`,`Product`.`OverriddenGiftCardAmount` AS `OverriddenGiftCardAmount`,`Product`.`RequireOtherProducts` AS `RequireOtherProducts`,`Product`.`RequiredProductIds` AS `RequiredProductIds`,`Product`.`AutomaticallyAddRequiredProducts` AS `AutomaticallyAddRequiredProducts`,`Product`.`IsDownload` AS `IsDownload`,`Product`.`DownloadId` AS `DownloadId`,`Product`.`UnlimitedDownloads` AS `UnlimitedDownloads`,`Product`.`MaxNumberOfDownloads` AS `MaxNumberOfDownloads`,`Product`.`DownloadExpirationDays` AS `DownloadExpirationDays`,`Product`.`DownloadActivationTypeId` AS `DownloadActivationTypeId`,`Product`.`HasSampleDownload` AS `HasSampleDownload`,`Product`.`SampleDownloadId` AS `SampleDownloadId`,`Product`.`HasUserAgreement` AS `HasUserAgreement`,`Product`.`UserAgreementText` AS `UserAgreementText`,`Product`.`IsRecurring` AS `IsRecurring`,`Product`.`RecurringCycleLength` AS `RecurringCycleLength`,`Product`.`RecurringCyclePeriodId` AS `RecurringCyclePeriodId`,`Product`.`RecurringTotalCycles` AS `RecurringTotalCycles`,`Product`.`IsRental` AS `IsRental`,`Product`.`RentalPriceLength` AS `RentalPriceLength`,`Product`.`RentalPricePeriodId` AS `RentalPricePeriodId`,`Product`.`IsShipEnabled` AS `IsShipEnabled`,`Product`.`IsFreeShipping` AS `IsFreeShipping`,`Product`.`ShipSeparately` AS `ShipSeparately`,`Product`.`AdditionalShippingCharge` AS `AdditionalShippingCharge`,`Product`.`DeliveryDateId` AS `DeliveryDateId`,`Product`.`IsTaxExempt` AS `IsTaxExempt`,`Product`.`TaxCategoryId` AS `TaxCategoryId`,`Product`.`IsTelecommunicationsOrBroadcastingOrElectronicServices` AS `IsTelecommunicationsOrBroadcastingOrElectronicServices`,`Product`.`ManageInventoryMethodId` AS `ManageInventoryMethodId`,`Product`.`ProductAvailabilityRangeId` AS `ProductAvailabilityRangeId`,`Product`.`UseMultipleWarehouses` AS `UseMultipleWarehouses`,`Product`.`WarehouseId` AS `WarehouseId`,`Product`.`StockQuantity` AS `StockQuantity`,`Product`.`DisplayStockAvailability` AS `DisplayStockAvailability`,`Product`.`DisplayStockQuantity` AS `DisplayStockQuantity`,`Product`.`MinStockQuantity` AS `MinStockQuantity`,`Product`.`LowStockActivityId` AS `LowStockActivityId`,`Product`.`NotifyAdminForQuantityBelow` AS `NotifyAdminForQuantityBelow`,`Product`.`BackorderModeId` AS `BackorderModeId`,`Product`.`AllowBackInStockSubscriptions` AS `AllowBackInStockSubscriptions`,`Product`.`OrderMinimumQuantity` AS `OrderMinimumQuantity`,`Product`.`OrderMaximumQuantity` AS `OrderMaximumQuantity`,`Product`.`AllowedQuantities` AS `AllowedQuantities`,`Product`.`AllowAddingOnlyExistingAttributeCombinations` AS `AllowAddingOnlyExistingAttributeCombinations`,`Product`.`NotReturnable` AS `NotReturnable`,`Product`.`DisableBuyButton` AS `DisableBuyButton`,`Product`.`DisableWishlistButton` AS `DisableWishlistButton`,`Product`.`AvailableForPreOrder` AS `AvailableForPreOrder`,`Product`.`PreOrderAvailabilityStartDateTimeUtc` AS `PreOrderAvailabilityStartDateTimeUtc`,`Product`.`CallForPrice` AS `CallForPrice`,`Product`.`Price` AS `Price`,`Product`.`OldPrice` AS `OldPrice`,`Product`.`ProductCost` AS `ProductCost`,`Product`.`CustomerEntersPrice` AS `CustomerEntersPrice`,`Product`.`MinimumCustomerEnteredPrice` AS `MinimumCustomerEnteredPrice`,`Product`.`MaximumCustomerEnteredPrice` AS `MaximumCustomerEnteredPrice`,`Product`.`BasepriceEnabled` AS `BasepriceEnabled`,`Product`.`BasepriceAmount` AS `BasepriceAmount`,`Product`.`BasepriceUnitId` AS `BasepriceUnitId`,`Product`.`BasepriceBaseAmount` AS `BasepriceBaseAmount`,`Product`.`BasepriceBaseUnitId` AS `BasepriceBaseUnitId`,`Product`.`MarkAsNew` AS `MarkAsNew`,`Product`.`MarkAsNewStartDateTimeUtc` AS `MarkAsNewStartDateTimeUtc`,`Product`.`MarkAsNewEndDateTimeUtc` AS `MarkAsNewEndDateTimeUtc`,`Product`.`HasTierPrices` AS `HasTierPrices`,`Product`.`HasDiscountsApplied` AS `HasDiscountsApplied`,`Product`.`Weight` AS `Weight`,`Product`.`Length` AS `Length`,`Product`.`Width` AS `Width`,`Product`.`Height` AS `Height`,`Product`.`AvailableStartDateTimeUtc` AS `AvailableStartDateTimeUtc`,`Product`.`AvailableEndDateTimeUtc` AS `AvailableEndDateTimeUtc`,`Product`.`DisplayOrder` AS `DisplayOrder`,`Product`.`Published` AS `Published`,`Product`.`Deleted` AS `Deleted`,`Product`.`CreatedOnUtc` AS `CreatedOnUtc`,`Product`.`UpdatedOnUtc` AS `UpdatedOnUtc`,`Product`.`Mf` AS `Mf`,`Product`.`MfAdet` AS `MfAdet`,`Product`.`MfAdetFazla` AS `MfAdetFazla`,`Product`.`Miad` AS `Miad`,`Product`.`MiadDate` AS `MiadDate`,`Product`.`KamuOdenen` AS `KamuOdenen`,`Product`.`FiyatFarki` AS `FiyatFarki` from `Product` where ((`Product`.`ProductTypeId` = 5) and (`Product`.`ParentGroupedProductId` <> 0) and (0 <> `Product`.`Published`) and (0 = `Product`.`Deleted`))) `p2` on((`p`.`Id` = `p2`.`ParentGroupedProductId`))) join `OrderItem` `oi` on((`p2`.`Id` = `oi`.`ProductId`))) join (select `Order`.`Id` AS `Id`,`Order`.`OrderGuid` AS `OrderGuid`,`Order`.`StoreId` AS `StoreId`,`Order`.`CustomerId` AS `CustomerId`,`Order`.`BillingAddressId` AS `BillingAddressId`,`Order`.`ShippingAddressId` AS `ShippingAddressId`,`Order`.`PickupAddressId` AS `PickupAddressId`,`Order`.`PickupInStore` AS `PickupInStore`,`Order`.`OrderStatusId` AS `OrderStatusId`,`Order`.`ShippingStatusId` AS `ShippingStatusId`,`Order`.`PaymentStatusId` AS `PaymentStatusId`,`Order`.`PaymentMethodSystemName` AS `PaymentMethodSystemName`,`Order`.`CustomerCurrencyCode` AS `CustomerCurrencyCode`,`Order`.`CurrencyRate` AS `CurrencyRate`,`Order`.`CustomerTaxDisplayTypeId` AS `CustomerTaxDisplayTypeId`,`Order`.`VatNumber` AS `VatNumber`,`Order`.`OrderSubtotalInclTax` AS `OrderSubtotalInclTax`,`Order`.`OrderSubtotalExclTax` AS `OrderSubtotalExclTax`,`Order`.`OrderSubTotalDiscountInclTax` AS `OrderSubTotalDiscountInclTax`,`Order`.`OrderSubTotalDiscountExclTax` AS `OrderSubTotalDiscountExclTax`,`Order`.`OrderShippingInclTax` AS `OrderShippingInclTax`,`Order`.`OrderShippingExclTax` AS `OrderShippingExclTax`,`Order`.`PaymentMethodAdditionalFeeInclTax` AS `PaymentMethodAdditionalFeeInclTax`,`Order`.`PaymentMethodAdditionalFeeExclTax` AS `PaymentMethodAdditionalFeeExclTax`,`Order`.`TaxRates` AS `TaxRates`,`Order`.`OrderTax` AS `OrderTax`,`Order`.`OrderDiscount` AS `OrderDiscount`,`Order`.`OrderTotal` AS `OrderTotal`,`Order`.`RefundedAmount` AS `RefundedAmount`,`Order`.`RewardPointsHistoryEntryId` AS `RewardPointsHistoryEntryId`,`Order`.`CheckoutAttributeDescription` AS `CheckoutAttributeDescription`,`Order`.`CheckoutAttributesXml` AS `CheckoutAttributesXml`,`Order`.`CustomerLanguageId` AS `CustomerLanguageId`,`Order`.`AffiliateId` AS `AffiliateId`,`Order`.`CustomerIp` AS `CustomerIp`,`Order`.`AllowStoringCreditCardNumber` AS `AllowStoringCreditCardNumber`,`Order`.`CardType` AS `CardType`,`Order`.`CardName` AS `CardName`,`Order`.`CardNumber` AS `CardNumber`,`Order`.`MaskedCreditCardNumber` AS `MaskedCreditCardNumber`,`Order`.`CardCvv2` AS `CardCvv2`,`Order`.`CardExpirationMonth` AS `CardExpirationMonth`,`Order`.`CardExpirationYear` AS `CardExpirationYear`,`Order`.`AuthorizationTransactionId` AS `AuthorizationTransactionId`,`Order`.`AuthorizationTransactionCode` AS `AuthorizationTransactionCode`,`Order`.`AuthorizationTransactionResult` AS `AuthorizationTransactionResult`,`Order`.`CaptureTransactionId` AS `CaptureTransactionId`,`Order`.`CaptureTransactionResult` AS `CaptureTransactionResult`,`Order`.`SubscriptionTransactionId` AS `SubscriptionTransactionId`,`Order`.`PaidDateUtc` AS `PaidDateUtc`,`Order`.`ShippingMethod` AS `ShippingMethod`,`Order`.`ShippingRateComputationMethodSystemName` AS `ShippingRateComputationMethodSystemName`,`Order`.`CustomValuesXml` AS `CustomValuesXml`,`Order`.`Deleted` AS `Deleted`,`Order`.`CreatedOnUtc` AS `CreatedOnUtc`,`Order`.`CustomOrderNumber` AS `CustomOrderNumber`,`Order`.`RedeemedRewardPointsEntryId` AS `RedeemedRewardPointsEntryId` from `Order` where ((`Order`.`OrderStatusId` <> 40) and (`Order`.`PaymentStatusId` <> 20) and (0 = `Order`.`Deleted`))) `o` on((`oi`.`OrderId` = `o`.`Id`))) where ((`p`.`ProductTypeId` = 10) and (`p`.`ParentGroupedProductId` = 0) and (0 <> `p`.`Published`) and (0 = `p`.`Deleted`) and (0 = `o`.`Deleted`) and (`o`.`CreatedOnUtc` >= '2020-10-24') and (`c`.`Name` = 'Sarf Malzemeleri')) group by `Baslangic` order by `o`.`CreatedOnUtc` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SiparisVerenEczane`
--

/*!50001 DROP VIEW IF EXISTS `SiparisVerenEczane`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `SiparisVerenEczane` AS select date_format((`o`.`CreatedOnUtc` + interval ((1 - dayofweek(`o`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Baslangic`,date_format((`o`.`CreatedOnUtc` + interval ((7 - dayofweek(`o`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Bitis`,count(distinct `o`.`CustomerId`) AS `SiparisVerenEczane` from `Order` `o` where ((`o`.`CreatedOnUtc` >= '2020-10-24') and (`o`.`PaymentStatusId` <> 20) and (`o`.`OrderStatusId` <> 40)) group by `Baslangic` order by `o`.`CreatedOnUtc` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SiparisVermemis`
--

/*!50001 DROP VIEW IF EXISTS `SiparisVermemis`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `SiparisVermemis` AS select date_format((`c`.`CreatedOnUtc` + interval ((1 - dayofweek(`c`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Baslangic`,date_format((`c`.`CreatedOnUtc` + interval ((7 - dayofweek(`c`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Bitis`,sum(count(0)) OVER (ORDER BY `c`.`CreatedOnUtc` )  AS `SiparisVermemisler` from `Customer` `c` where ((`c`.`Deleted` = 0) and (`c`.`CreatedOnUtc` >= '2020-10-24') and (`c`.`Active` = 1) and `c`.`Id` in (select `Customer`.`Id` from `Customer` where ((`Customer`.`Id` >= 1078412) and (`Customer`.`Id` <= 1078648))) is false and (`c`.`Email` is not null) and (`c`.`Email` <> '') and (`c`.`VendorId` = 0) and `c`.`Id` in (select `Order`.`CustomerId` from `Order` where ((`Order`.`Deleted` = 0) and (`Order`.`PaymentStatusId` <> 20))) is false) group by `Baslangic` order by `c`.`CreatedOnUtc` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `YorumvePuan`
--

/*!50001 DROP VIEW IF EXISTS `YorumvePuan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `YorumvePuan` AS select date_format((`ovr`.`CreatedOnUtc` + interval ((1 - dayofweek(`ovr`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Baslangic`,date_format((`ovr`.`CreatedOnUtc` + interval ((7 - dayofweek(`ovr`.`CreatedOnUtc`)) - 1) day),'%Y-%m-%e') AS `Bitis`,count(`ovr`.`ReviewText`) AS `YorumSayisi`,count(`ovr`.`DeliveryRating`) AS `Puanlama` from `OrderVendorReview` `ovr` where (`ovr`.`CreatedOnUtc` >= '2020-10-24') group by `Baslangic` order by `ovr`.`CreatedOnUtc` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-09 13:35:07
