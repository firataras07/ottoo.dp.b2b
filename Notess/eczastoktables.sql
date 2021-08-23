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
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Category` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CategoryTemplateId` int NOT NULL,
  `MetaKeywords` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `MetaDescription` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `MetaTitle` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ParentCategoryId` int NOT NULL,
  `PictureId` int NOT NULL,
  `PageSize` int NOT NULL,
  `AllowCustomersToSelectPageSize` tinyint(1) NOT NULL,
  `PageSizeOptions` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PriceRanges` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ShowOnHomepage` tinyint(1) NOT NULL,
  `IncludeInTopMenu` tinyint(1) NOT NULL,
  `SubjectToAcl` tinyint(1) NOT NULL,
  `LimitedToStores` tinyint(1) NOT NULL,
  `Published` tinyint(1) NOT NULL,
  `Deleted` tinyint(1) NOT NULL,
  `DisplayOrder` int NOT NULL,
  `CreatedOnUtc` datetime(6) NOT NULL,
  `UpdatedOnUtc` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_Category_Deleted_Extended` (`Deleted`,`Id`,`Name`(255),`SubjectToAcl`,`LimitedToStores`,`Published`),
  KEY `IX_Category_DisplayOrder` (`DisplayOrder`),
  KEY `IX_Category_LimitedToStores` (`LimitedToStores`),
  KEY `IX_Category_ParentCategoryId` (`ParentCategoryId`),
  KEY `IX_Category_SubjectToAcl` (`SubjectToAcl`)
) ENGINE=InnoDB AUTO_INCREMENT=5272 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Customer_CustomerRole_Mapping`
--

DROP TABLE IF EXISTS `Customer_CustomerRole_Mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer_CustomerRole_Mapping` (
  `Customer_Id` int NOT NULL,
  `CustomerRole_Id` int NOT NULL,
  PRIMARY KEY (`Customer_Id`,`CustomerRole_Id`),
  KEY `IX_Customer_CustomerRole_Mapping_Customer_Id` (`Customer_Id`),
  KEY `IX_Customer_CustomerRole_Mapping_CustomerRole_Id` (`CustomerRole_Id`),
  CONSTRAINT `FK_Customer_CustomerRole_Mapping_Customer_Customer_Id` FOREIGN KEY (`Customer_Id`) REFERENCES `Customer` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Customer_CustomerRole_Mapping_CustomerRole_CustomerRole_Id` FOREIGN KEY (`CustomerRole_Id`) REFERENCES `CustomerRole` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GenericAttribute`
--

DROP TABLE IF EXISTS `GenericAttribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GenericAttribute` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `EntityId` int NOT NULL,
  `KeyGroup` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Key` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `StoreId` int NOT NULL,
  `CreatedOrUpdatedDateUTC` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_GenericAttribute_EntityId_and_KeyGroup` (`EntityId`,`KeyGroup`(255))
) ENGINE=InnoDB AUTO_INCREMENT=1623324 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderGuid` varchar(64) NOT NULL,
  `StoreId` int NOT NULL,
  `CustomerId` int NOT NULL,
  `BillingAddressId` int NOT NULL,
  `ShippingAddressId` int DEFAULT NULL,
  `PickupAddressId` int DEFAULT NULL,
  `PickupInStore` tinyint(1) NOT NULL,
  `OrderStatusId` int NOT NULL,
  `ShippingStatusId` int NOT NULL,
  `PaymentStatusId` int NOT NULL,
  `PaymentMethodSystemName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CustomerCurrencyCode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CurrencyRate` decimal(18,8) NOT NULL,
  `CustomerTaxDisplayTypeId` int NOT NULL,
  `VatNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `OrderSubtotalInclTax` decimal(18,4) NOT NULL,
  `OrderSubtotalExclTax` decimal(18,4) NOT NULL,
  `OrderSubTotalDiscountInclTax` decimal(18,4) NOT NULL,
  `OrderSubTotalDiscountExclTax` decimal(18,4) NOT NULL,
  `OrderShippingInclTax` decimal(18,4) NOT NULL,
  `OrderShippingExclTax` decimal(18,4) NOT NULL,
  `PaymentMethodAdditionalFeeInclTax` decimal(18,4) NOT NULL,
  `PaymentMethodAdditionalFeeExclTax` decimal(18,4) NOT NULL,
  `TaxRates` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `OrderTax` decimal(18,4) NOT NULL,
  `OrderDiscount` decimal(18,4) NOT NULL,
  `OrderTotal` decimal(18,4) NOT NULL,
  `RefundedAmount` decimal(18,4) NOT NULL,
  `RewardPointsHistoryEntryId` int DEFAULT NULL,
  `CheckoutAttributeDescription` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CheckoutAttributesXml` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CustomerLanguageId` int NOT NULL,
  `AffiliateId` int NOT NULL,
  `CustomerIp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `AllowStoringCreditCardNumber` tinyint(1) NOT NULL,
  `CardType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CardName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CardNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `MaskedCreditCardNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CardCvv2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CardExpirationMonth` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CardExpirationYear` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `AuthorizationTransactionId` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `AuthorizationTransactionCode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `AuthorizationTransactionResult` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CaptureTransactionId` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CaptureTransactionResult` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `SubscriptionTransactionId` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PaidDateUtc` datetime(6) DEFAULT NULL,
  `ShippingMethod` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ShippingRateComputationMethodSystemName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CustomValuesXml` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Deleted` tinyint(1) NOT NULL,
  `CreatedOnUtc` datetime(6) NOT NULL,
  `CustomOrderNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RedeemedRewardPointsEntryId` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_Order_RewardPointsHistoryEntryId` (`RewardPointsHistoryEntryId`),
  KEY `IX_Order_BillingAddressId` (`BillingAddressId`),
  KEY `IX_Order_CreatedOnUtc` (`CreatedOnUtc` DESC),
  KEY `IX_Order_CustomerId` (`CustomerId`),
  KEY `IX_Order_PickupAddressId` (`PickupAddressId`),
  KEY `IX_Order_ShippingAddressId` (`ShippingAddressId`),
  CONSTRAINT `FK_Order_Address_BillingAddressId` FOREIGN KEY (`BillingAddressId`) REFERENCES `Address` (`Id`),
  CONSTRAINT `FK_Order_Address_PickupAddressId` FOREIGN KEY (`PickupAddressId`) REFERENCES `Address` (`Id`),
  CONSTRAINT `FK_Order_Address_ShippingAddressId` FOREIGN KEY (`ShippingAddressId`) REFERENCES `Address` (`Id`),
  CONSTRAINT `FK_Order_Customer_CustomerId` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Order_RewardPointsHistory_RewardPointsHistoryEntryId` FOREIGN KEY (`RewardPointsHistoryEntryId`) REFERENCES `RewardPointsHistory` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12596 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OrderItem`
--

DROP TABLE IF EXISTS `OrderItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderItem` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderItemGuid` varchar(64) NOT NULL,
  `OrderId` int NOT NULL,
  `ProductId` int NOT NULL,
  `Quantity` int NOT NULL,
  `UnitPriceInclTax` decimal(18,4) NOT NULL,
  `UnitPriceExclTax` decimal(18,4) NOT NULL,
  `PriceInclTax` decimal(18,4) NOT NULL,
  `PriceExclTax` decimal(18,4) NOT NULL,
  `DiscountAmountInclTax` decimal(18,4) NOT NULL,
  `DiscountAmountExclTax` decimal(18,4) NOT NULL,
  `OriginalProductCost` decimal(18,4) NOT NULL,
  `AttributeDescription` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `AttributesXml` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `DownloadCount` int NOT NULL,
  `IsDownloadActivated` tinyint(1) NOT NULL,
  `LicenseDownloadId` int DEFAULT NULL,
  `ItemWeight` decimal(18,4) DEFAULT NULL,
  `RentalStartDateUtc` datetime(6) DEFAULT NULL,
  `RentalEndDateUtc` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `OrderItemGuid` (`OrderItemGuid`),
  KEY `IX_OrderItem_OrderId` (`OrderId`),
  KEY `IX_OrderItem_ProductId` (`ProductId`),
  CONSTRAINT `FK_OrderItem_Order_OrderId` FOREIGN KEY (`OrderId`) REFERENCES `Order` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_OrderItem_Product_ProductId` FOREIGN KEY (`ProductId`) REFERENCES `Product` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60760 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OrderVendorReview`
--

DROP TABLE IF EXISTS `OrderVendorReview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderVendorReview` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderVendorId` int NOT NULL,
  `CustomerId` int NOT NULL,
  `VendorId` int NOT NULL,
  `CommunicationRating` int DEFAULT NULL,
  `CreatedOnUtc` datetime NOT NULL,
  `DeliveryRating` int DEFAULT NULL,
  `GeneralRating` decimal(18,4) DEFAULT NULL,
  `ReplyText` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `ReplyTextApproved` tinyint(1) NOT NULL,
  `ReviewText` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `ReviewTextApproved` tinyint(1) NOT NULL,
  `ShippingRating` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_CA109281AA1F969E20071F583A32A7F883A4E511` (`OrderVendorId`),
  KEY `IX_569AFCE5D9C7CC179471987459D4AF75C7F26F47` (`CustomerId`),
  KEY `IX_0B1B59841BB9365BBF046C34D25191A50368DDC7` (`VendorId`),
  CONSTRAINT `FK_50C84C0887746A1062398464C2C70952D04B00FD` FOREIGN KEY (`VendorId`) REFERENCES `Vendor` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_9C11906F576F7AD0112291FDC54A88B2F5370425` FOREIGN KEY (`OrderVendorId`) REFERENCES `OrderVendor` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DBEC64B1A8F2723F4AE0658775061959756ACFE9` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ProductTypeId` int NOT NULL,
  `ParentGroupedProductId` int NOT NULL,
  `VisibleIndividually` tinyint(1) NOT NULL,
  `Name` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'isimsiz',
  `ShortDescription` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `FullDescription` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `AdminComment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ProductTemplateId` int NOT NULL,
  `VendorId` int NOT NULL,
  `ShowOnHomepage` tinyint(1) NOT NULL,
  `MetaKeywords` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `MetaDescription` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `MetaTitle` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `AllowCustomerReviews` tinyint(1) NOT NULL,
  `ApprovedRatingSum` int NOT NULL,
  `NotApprovedRatingSum` int NOT NULL,
  `ApprovedTotalReviews` int NOT NULL,
  `NotApprovedTotalReviews` int NOT NULL,
  `SubjectToAcl` tinyint(1) NOT NULL,
  `LimitedToStores` tinyint(1) NOT NULL,
  `Sku` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ManufacturerPartNumber` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Gtin` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `IsGiftCard` tinyint(1) NOT NULL,
  `GiftCardTypeId` int NOT NULL,
  `OverriddenGiftCardAmount` decimal(18,4) DEFAULT NULL,
  `RequireOtherProducts` tinyint(1) NOT NULL,
  `RequiredProductIds` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `AutomaticallyAddRequiredProducts` tinyint(1) NOT NULL,
  `IsDownload` tinyint(1) NOT NULL,
  `DownloadId` int NOT NULL,
  `UnlimitedDownloads` tinyint(1) NOT NULL,
  `MaxNumberOfDownloads` int NOT NULL,
  `DownloadExpirationDays` int DEFAULT NULL,
  `DownloadActivationTypeId` int NOT NULL,
  `HasSampleDownload` tinyint(1) NOT NULL,
  `SampleDownloadId` int NOT NULL,
  `HasUserAgreement` tinyint(1) NOT NULL,
  `UserAgreementText` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `IsRecurring` tinyint(1) NOT NULL,
  `RecurringCycleLength` int NOT NULL,
  `RecurringCyclePeriodId` int NOT NULL,
  `RecurringTotalCycles` int NOT NULL,
  `IsRental` tinyint(1) NOT NULL,
  `RentalPriceLength` int NOT NULL,
  `RentalPricePeriodId` int NOT NULL,
  `IsShipEnabled` tinyint(1) NOT NULL,
  `IsFreeShipping` tinyint(1) NOT NULL,
  `ShipSeparately` tinyint(1) NOT NULL,
  `AdditionalShippingCharge` decimal(18,4) NOT NULL,
  `DeliveryDateId` int NOT NULL,
  `IsTaxExempt` tinyint(1) NOT NULL,
  `TaxCategoryId` int NOT NULL,
  `IsTelecommunicationsOrBroadcastingOrElectronicServices` tinyint(1) NOT NULL,
  `ManageInventoryMethodId` int NOT NULL,
  `ProductAvailabilityRangeId` int NOT NULL,
  `UseMultipleWarehouses` tinyint(1) NOT NULL,
  `WarehouseId` int NOT NULL,
  `StockQuantity` int NOT NULL,
  `DisplayStockAvailability` tinyint(1) NOT NULL,
  `DisplayStockQuantity` tinyint(1) NOT NULL,
  `MinStockQuantity` int NOT NULL,
  `LowStockActivityId` int NOT NULL,
  `NotifyAdminForQuantityBelow` int NOT NULL,
  `BackorderModeId` int NOT NULL,
  `AllowBackInStockSubscriptions` tinyint(1) NOT NULL,
  `OrderMinimumQuantity` int NOT NULL,
  `OrderMaximumQuantity` int NOT NULL,
  `AllowedQuantities` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `AllowAddingOnlyExistingAttributeCombinations` tinyint(1) NOT NULL,
  `NotReturnable` tinyint(1) NOT NULL,
  `DisableBuyButton` tinyint(1) NOT NULL,
  `DisableWishlistButton` tinyint(1) NOT NULL,
  `AvailableForPreOrder` tinyint(1) NOT NULL,
  `PreOrderAvailabilityStartDateTimeUtc` datetime(6) DEFAULT NULL,
  `CallForPrice` tinyint(1) NOT NULL,
  `Price` decimal(18,4) NOT NULL,
  `OldPrice` decimal(18,4) NOT NULL,
  `ProductCost` decimal(18,4) NOT NULL,
  `CustomerEntersPrice` tinyint(1) NOT NULL,
  `MinimumCustomerEnteredPrice` decimal(18,4) NOT NULL,
  `MaximumCustomerEnteredPrice` decimal(18,4) NOT NULL,
  `BasepriceEnabled` tinyint(1) NOT NULL,
  `BasepriceAmount` decimal(18,4) NOT NULL,
  `BasepriceUnitId` int NOT NULL,
  `BasepriceBaseAmount` decimal(18,4) NOT NULL,
  `BasepriceBaseUnitId` int NOT NULL,
  `MarkAsNew` tinyint(1) NOT NULL,
  `MarkAsNewStartDateTimeUtc` datetime(6) DEFAULT NULL,
  `MarkAsNewEndDateTimeUtc` datetime(6) DEFAULT NULL,
  `HasTierPrices` tinyint(1) NOT NULL,
  `HasDiscountsApplied` tinyint(1) NOT NULL,
  `Weight` decimal(18,4) NOT NULL,
  `Length` decimal(18,4) NOT NULL,
  `Width` decimal(18,4) NOT NULL,
  `Height` decimal(18,4) NOT NULL,
  `AvailableStartDateTimeUtc` datetime(6) DEFAULT NULL,
  `AvailableEndDateTimeUtc` datetime(6) DEFAULT NULL,
  `DisplayOrder` int NOT NULL,
  `Published` tinyint(1) NOT NULL,
  `Deleted` tinyint(1) NOT NULL,
  `CreatedOnUtc` datetime(6) NOT NULL,
  `UpdatedOnUtc` datetime(6) NOT NULL,
  `Mf` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `MfAdet` int NOT NULL DEFAULT '0',
  `MfAdetFazla` int NOT NULL DEFAULT '0',
  `Miad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `MiadDate` datetime(6) DEFAULT NULL,
  `KamuOdenen` decimal(19,5) DEFAULT NULL,
  `FiyatFarki` decimal(19,5) DEFAULT NULL,
  `WebPrim` decimal(19,5) DEFAULT '0.00000',
  `CiroPrim` decimal(19,5) DEFAULT '0.00000',
  `IsHighlighted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `IX_GetLowStockProducts` (`Deleted`,`VendorId`,`ProductTypeId`,`ManageInventoryMethodId`,`MinStockQuantity`,`UseMultipleWarehouses`),
  KEY `IX_Product_Delete_Id` (`Deleted`,`Id`),
  KEY `IX_Product_Deleted_and_Published` (`Published`,`Deleted`),
  KEY `IX_Product_LimitedToStores` (`LimitedToStores`),
  KEY `IX_Product_ParentGroupedProductId` (`ParentGroupedProductId`),
  KEY `IX_Product_PriceDatesEtc` (`Price`,`AvailableStartDateTimeUtc`,`AvailableEndDateTimeUtc`,`Published`,`Deleted`),
  KEY `IX_Product_Published` (`Published`),
  KEY `IX_Product_ShowOnHomepage` (`ShowOnHomepage`),
  KEY `IX_Product_SubjectToAcl` (`SubjectToAcl`),
  KEY `IX_Product_VisibleIndividually` (`VisibleIndividually`),
  KEY `IX_Product_VisibleIndividually_Published_Deleted_Extended` (`VisibleIndividually`,`Published`,`Deleted`,`Id`,`AvailableStartDateTimeUtc`,`AvailableEndDateTimeUtc`)
) ENGINE=InnoDB AUTO_INCREMENT=153098 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Product_Category_Mapping`
--

DROP TABLE IF EXISTS `Product_Category_Mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product_Category_Mapping` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ProductId` int NOT NULL,
  `CategoryId` int NOT NULL,
  `IsFeaturedProduct` tinyint(1) NOT NULL,
  `DisplayOrder` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_PCM_Product_and_Category` (`CategoryId`,`ProductId`),
  KEY `IX_PCM_ProductId_Extended` (`ProductId`,`IsFeaturedProduct`,`CategoryId`),
  KEY `IX_Product_Category_Mapping_CategoryId` (`CategoryId`),
  KEY `IX_Product_Category_Mapping_IsFeaturedProduct` (`IsFeaturedProduct`),
  KEY `IX_Product_Category_Mapping_ProductId` (`ProductId`,`CategoryId`),
  CONSTRAINT `FK_Product_Category_Mapping_Category_CategoryId` FOREIGN KEY (`CategoryId`) REFERENCES `Category` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Product_Category_Mapping_Product_ProductId` FOREIGN KEY (`ProductId`) REFERENCES `Product` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=119259 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Vendor`
--

DROP TABLE IF EXISTS `Vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vendor` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PictureId` int NOT NULL,
  `AddressId` int NOT NULL,
  `AdminComment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Active` tinyint(1) NOT NULL,
  `Deleted` tinyint(1) NOT NULL,
  `DisplayOrder` int NOT NULL,
  `MetaKeywords` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `MetaDescription` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `MetaTitle` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PageSize` int NOT NULL,
  `AllowCustomersToSelectPageSize` tinyint(1) NOT NULL,
  `PageSizeOptions` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `FullDescription` longtext,
  `BannerPictureId` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-10 15:46:47
