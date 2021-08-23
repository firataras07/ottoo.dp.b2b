#####1 yapıldı
VIEW `aktifdeposayisi` ASSELECT date_format((Curdate() + Interval ((1 - Dayofweek(Curdate())) - 1) day),'%Y-%m-%e') AS `baslangic`,
       date_format((curdate() + interval ((7 - dayofweek(curdate())) - 1) day),'%Y-%m-%e') AS `bitis`,
       count(DISTINCT `product`.`vendorid`)                                                AS `aktifdeposayisi`
FROM   `product`
WHERE  ((
                     0 = `product`.`deleted`)
       AND    (
                     0 <> `product`.`published`)
       AND    (
                     `product`.`vendorid` > 0)
       AND    (
                     `product`.`producttypeid` = 5)) */;


--##################2
VIEW `aktifeczadeposu` ASSELECT date_format((Curdate() + Interval ((1 - Dayofweek(Curdate())) - 1) day),'%Y-%m-%e') AS `baslangic`,
       date_format((curdate() + interval ((7 - dayofweek(curdate())) - 1) day),'%Y-%m-%e') AS `bitis`,
       count(DISTINCT `v`.`id`)                                                            AS `aktifeczadeposu`
FROM   (((`vendor` `v`
JOIN   `product` `p`
ON    ((
                     `v`.`id` = `p`.`vendorid`)))
JOIN   `customer` `c`
ON    ((
                     `v`.`id` = `c`.`vendorid`)))
JOIN   `customer_customerrole_mapping` `cr`
ON    ((
                     `c`.`id` = `cr`.`customer_id`)))
WHERE  ((
                     0 = `p`.`deleted`)
       AND    (
                     0 <> `p`.`published`)
       AND    (
                     `p`.`vendorid` > 0)
       AND    (
                     `p`.`producttypeid` = 5)
       AND    (
                     `c`.`active` = 1)
       AND    (
                     `cr`.`customerrole_id` = 91)) */;


--##################3
VIEW `aktiffirma` ASSELECT date_format((Curdate() + Interval ((1 - Dayofweek(Curdate())) - 1) day),'%Y-%m-%e') AS `baslangic`,
       date_format((curdate() + interval ((7 - dayofweek(curdate())) - 1) day),'%Y-%m-%e') AS `bitis`,
       count(DISTINCT `v`.`id`)                                                            AS `aktiffirma`
FROM   (((`vendor` `v`
JOIN   `product` `p`
ON    ((
                     `v`.`id` = `p`.`vendorid`)))
JOIN   `customer` `c`
ON    ((
                     `v`.`id` = `c`.`vendorid`)))
JOIN   `customer_customerrole_mapping` `cr`
ON    ((
                     `c`.`id` = `cr`.`customer_id`)))
WHERE  ((
                     0 = `p`.`deleted`)
       AND    (
                     0 <> `p`.`published`)
       AND    (
                     `p`.`vendorid` > 0)
       AND    (
                     `p`.`producttypeid` = 5)
       AND    (
                     `c`.`active` = 1)
       AND    (
                     `cr`.`customerrole_id` = 92)) */;


--##################4
VIEW `aktifitriyatdeposu` ASSELECT date_format((Curdate() + Interval ((1 - Dayofweek(Curdate())) - 1) day),'%Y-%m-%e') AS `baslangic`,
       date_format((curdate() + interval ((7 - dayofweek(curdate())) - 1) day),'%Y-%m-%e') AS `bitis`,
       count(DISTINCT `v`.`id`)                                                            AS `aktifitriyatdeposu`
FROM   (((`vendor` `v`
JOIN   `product` `p`
ON    ((
                     `v`.`id` = `p`.`vendorid`)))
JOIN   `customer` `c`
ON    ((
                     `v`.`id` = `c`.`vendorid`)))
JOIN   `customer_customerrole_mapping` `cr`
ON    ((
                     `c`.`id` = `cr`.`customer_id`)))
WHERE  ((
                     0 = `p`.`deleted`)
       AND    (
                     0 <> `p`.`published`)
       AND    (
                     `p`.`vendorid` > 0)
       AND    (
                     `p`.`producttypeid` = 5)
       AND    (
                     `c`.`active` = 1)
       AND    (
                     `cr`.`customerrole_id` = 93)) */;


--##################5
VIEW `allcategoriesbyparent` ASSELECT `c`.`id` AS `maincategoryid`,
       (WITH recursive `cte` (`id`,`parentid`) AS
       (
              SELECT `category`.`id`               AS `id`,
                     `category`.`parentcategoryid` AS `parentcategoryid`
              FROM   `category`
              WHERE  ((
                                   `category`.`id` = `c`.`id`)
                     AND    (
                                   0 <> `category`.`published`)
                     AND    (
                                   0 = `category`.`deleted`))
              UNION ALL
              SELECT `c`.`id`               AS `id`,
                     `c`.`parentcategoryid` AS `parentcategoryid`
              FROM   (`category` `c`
              JOIN   `cte`
              ON    ((
                                   `c`.`parentcategoryid` = `cte`.`id`)))
              WHERE  ((
                                   0 <> `c`.`published`)
                     AND    (
                                   0 = `c`.`deleted`)))SELECT Group_concat(`cte`.`id` separator ',')
FROM   `cte`) AS `ids`
FROM   `category` `c`
WHERE  ((
                     `c`.`parentcategoryid` = 0)
       AND    (
                     0 <> `c`.`published`)
       AND    (
                     0 = `c`.`deleted`)) */;


--##################6
VIEW `annebebek` ASSELECT   date_format((`o`.`createdonutc` + Interval ((1 - Dayofweek(`o`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `baslangic`,
         date_format((`o`.`createdonutc` + interval ((7 - dayofweek(`o`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `bitis`,
         `c`.`NAME`                                                                                            AS `name2`,
         count(DISTINCT `p`.`id`)                                                                              AS `ilansayisi2`,
         sum(`oi`.`quantity`)                                                                                  AS `satismiktari2`,
         sum(`oi`.`priceincltax`)                                                                              AS `satistutari2`
FROM     ((((((`allcategoriesbyparent` `mc`
JOIN     `category` `c`
ON      ((
                           `mc`.`maincategoryid` = `c`.`id`)))
JOIN     `product_category_mapping` `pcm`
ON      ((
                           find_in_set(`pcm`.`categoryid`,`mc`.`ids`) > 0)))
JOIN     `product` `p`
ON      ((
                           `pcm`.`productid` = `p`.`id`)))
JOIN
         (
                SELECT `product`.`id`                                                     AS `id`,
                       `product`.`producttypeid`                                          AS `producttypeid`,
                       `product`.`parentgroupedproductid`                                 AS `parentgroupedproductid`,
                       `product`.`visibleindividually`                                    AS `visibleindividually`,
                       `product`.`NAME`                                                   AS `NAME`,
                       `product`.`shortdescription`                                       AS `shortdescription`,
                       `product`.`fulldescription`                                        AS `fulldescription`,
                       `product`.`admincomment`                                           AS `admincomment`,
                       `product`.`producttemplateid`                                      AS `producttemplateid`,
                       `product`.`vendorid`                                               AS `vendorid`,
                       `product`.`showonhomepage`                                         AS `showonhomepage`,
                       `product`.`metakeywords`                                           AS `metakeywords`,
                       `product`.`metadescription`                                        AS `metadescription`,
                       `product`.`metatitle`                                              AS `metatitle`,
                       `product`.`allowcustomerreviews`                                   AS `allowcustomerreviews`,
                       `product`.`approvedratingsum`                                      AS `approvedratingsum`,
                       `product`.`notapprovedratingsum`                                   AS `notapprovedratingsum`,
                       `product`.`approvedtotalreviews`                                   AS `approvedtotalreviews`,
                       `product`.`notapprovedtotalreviews`                                AS `notapprovedtotalreviews`,
                       `product`.`subjecttoacl`                                           AS `subjecttoacl`,
                       `product`.`limitedtostores`                                        AS `limitedtostores`,
                       `product`.`sku`                                                    AS `sku`,
                       `product`.`manufacturerpartnumber`                                 AS `manufacturerpartnumber`,
                       `product`.`gtin`                                                   AS `gtin`,
                       `product`.`isgiftcard`                                             AS `isgiftcard`,
                       `product`.`giftcardtypeid`                                         AS `giftcardtypeid`,
                       `product`.`overriddengiftcardamount`                               AS `overriddengiftcardamount`,
                       `product`.`requireotherproducts`                                   AS `requireotherproducts`,
                       `product`.`requiredproductids`                                     AS `requiredproductids`,
                       `product`.`automaticallyaddrequiredproducts`                       AS `automaticallyaddrequiredproducts`,
                       `product`.`isdownload`                                             AS `isdownload`,
                       `product`.`downloadid`                                             AS `downloadid`,
                       `product`.`unlimiteddownloads`                                     AS `unlimiteddownloads`,
                       `product`.`maxnumberofdownloads`                                   AS `maxnumberofdownloads`,
                       `product`.`downloadexpirationdays`                                 AS `downloadexpirationdays`,
                       `product`.`downloadactivationtypeid`                               AS `downloadactivationtypeid`,
                       `product`.`hassampledownload`                                      AS `hassampledownload`,
                       `product`.`sampledownloadid`                                       AS `sampledownloadid`,
                       `product`.`hasuseragreement`                                       AS `hasuseragreement`,
                       `product`.`useragreementtext`                                      AS `useragreementtext`,
                       `product`.`isrecurring`                                            AS `isrecurring`,
                       `product`.`recurringcyclelength`                                   AS `recurringcyclelength`,
                       `product`.`recurringcycleperiodid`                                 AS `recurringcycleperiodid`,
                       `product`.`recurringtotalcycles`                                   AS `recurringtotalcycles`,
                       `product`.`isrental`                                               AS `isrental`,
                       `product`.`rentalpricelength`                                      AS `rentalpricelength`,
                       `product`.`rentalpriceperiodid`                                    AS `rentalpriceperiodid`,
                       `product`.`isshipenabled`                                          AS `isshipenabled`,
                       `product`.`isfreeshipping`                                         AS `isfreeshipping`,
                       `product`.`shipseparately`                                         AS `shipseparately`,
                       `product`.`additionalshippingcharge`                               AS `additionalshippingcharge`,
                       `product`.`deliverydateid`                                         AS `deliverydateid`,
                       `product`.`istaxexempt`                                            AS `istaxexempt`,
                       `product`.`taxcategoryid`                                          AS `taxcategoryid`,
                       `product`.`istelecommunicationsorbroadcastingorelectronicservices` AS `istelecommunicationsorbroadcastingorelectronicservices`,
                       `product`.`manageinventorymethodid`                                AS `manageinventorymethodid`,
                       `product`.`productavailabilityrangeid`                             AS `productavailabilityrangeid`,
                       `product`.`usemultiplewarehouses`                                  AS `usemultiplewarehouses`,
                       `product`.`warehouseid`                                            AS `warehouseid`,
                       `product`.`stockquantity`                                          AS `stockquantity`,
                       `product`.`displaystockavailability`                               AS `displaystockavailability`,
                       `product`.`displaystockquantity`                                   AS `displaystockquantity`,
                       `product`.`minstockquantity`                                       AS `minstockquantity`,
                       `product`.`lowstockactivityid`                                     AS `lowstockactivityid`,
                       `product`.`notifyadminforquantitybelow`                            AS `notifyadminforquantitybelow`,
                       `product`.`backordermodeid`                                        AS `backordermodeid`,
                       `product`.`allowbackinstocksubscriptions`                          AS `allowbackinstocksubscriptions`,
                       `product`.`orderminimumquantity`                                   AS `orderminimumquantity`,
                       `product`.`ordermaximumquantity`                                   AS `ordermaximumquantity`,
                       `product`.`allowedquantities`                                      AS `allowedquantities`,
                       `product`.`allowaddingonlyexistingattributecombinations`           AS `allowaddingonlyexistingattributecombinations`,
                       `product`.`notreturnable`                                          AS `notreturnable`,
                       `product`.`disablebuybutton`                                       AS `disablebuybutton`,
                       `product`.`disablewishlistbutton`                                  AS `disablewishlistbutton`,
                       `product`.`availableforpreorder`                                   AS `availableforpreorder`,
                       `product`.`preorderavailabilitystartdatetimeutc`                   AS `preorderavailabilitystartdatetimeutc`,
                       `product`.`callforprice`                                           AS `callforprice`,
                       `product`.`price`                                                  AS `price`,
                       `product`.`oldprice`                                               AS `oldprice`,
                       `product`.`productcost`                                            AS `productcost`,
                       `product`.`customerentersprice`                                    AS `customerentersprice`,
                       `product`.`minimumcustomerenteredprice`                            AS `minimumcustomerenteredprice`,
                       `product`.`maximumcustomerenteredprice`                            AS `maximumcustomerenteredprice`,
                       `product`.`basepriceenabled`                                       AS `basepriceenabled`,
                       `product`.`basepriceamount`                                        AS `basepriceamount`,
                       `product`.`basepriceunitid`                                        AS `basepriceunitid`,
                       `product`.`basepricebaseamount`                                    AS `basepricebaseamount`,
                       `product`.`basepricebaseunitid`                                    AS `basepricebaseunitid`,
                       `product`.`markasnew`                                              AS `markasnew`,
                       `product`.`markasnewstartdatetimeutc`                              AS `markasnewstartdatetimeutc`,
                       `product`.`markasnewenddatetimeutc`                                AS `markasnewenddatetimeutc`,
                       `product`.`hastierprices`                                          AS `hastierprices`,
                       `product`.`hasdiscountsapplied`                                    AS `hasdiscountsapplied`,
                       `product`.`weight`                                                 AS `weight`,
                       `product`.`length`                                                 AS `length`,
                       `product`.`width`                                                  AS `width`,
                       `product`.`height`                                                 AS `height`,
                       `product`.`availablestartdatetimeutc`                              AS `availablestartdatetimeutc`,
                       `product`.`availableenddatetimeutc`                                AS `availableenddatetimeutc`,
                       `product`.`displayorder`                                           AS `displayorder`,
                       `product`.`published`                                              AS `published`,
                       `product`.`deleted`                                                AS `deleted`,
                       `product`.`createdonutc`                                           AS `createdonutc`,
                       `product`.`updatedonutc`                                           AS `updatedonutc`,
                       `product`.`mf`                                                     AS `mf`,
                       `product`.`mfadet`                                                 AS `mfadet`,
                       `product`.`mfadetfazla`                                            AS `mfadetfazla`,
                       `product`.`miad`                                                   AS `miad`,
                       `product`.`miaddate`                                               AS `miaddate`,
                       `product`.`kamuodenen`                                             AS `kamuodenen`,
                       `product`.`fiyatfarki`                                             AS `fiyatfarki`
                FROM   `product`
                WHERE  ((
                                     `product`.`producttypeid` = 5)
                       AND    (
                                     `product`.`parentgroupedproductid` <> 0)
                       AND    (
                                     0 <> `product`.`published`)
                       AND    (
                                     0 = `product`.`deleted`))) `p2`
ON      ((
                           `p`.`id` = `p2`.`parentgroupedproductid`)))
JOIN     `orderitem` `oi`
ON      ((
                           `p2`.`id` = `oi`.`productid`)))
JOIN
         (
                SELECT `ORDER`.`id`                                      AS `id`,
                       `ORDER`.`orderguid`                               AS `orderguid`,
                       `ORDER`.`storeid`                                 AS `storeid`,
                       `ORDER`.`customerid`                              AS `customerid`,
                       `ORDER`.`billingaddressid`                        AS `billingaddressid`,
                       `ORDER`.`shippingaddressid`                       AS `shippingaddressid`,
                       `ORDER`.`pickupaddressid`                         AS `pickupaddressid`,
                       `ORDER`.`pickupinstore`                           AS `pickupinstore`,
                       `ORDER`.`orderstatusid`                           AS `orderstatusid`,
                       `ORDER`.`shippingstatusid`                        AS `shippingstatusid`,
                       `ORDER`.`paymentstatusid`                         AS `paymentstatusid`,
                       `ORDER`.`paymentmethodsystemname`                 AS `paymentmethodsystemname`,
                       `ORDER`.`customercurrencycode`                    AS `customercurrencycode`,
                       `ORDER`.`currencyrate`                            AS `currencyrate`,
                       `ORDER`.`customertaxdisplaytypeid`                AS `customertaxdisplaytypeid`,
                       `ORDER`.`vatnumber`                               AS `vatnumber`,
                       `ORDER`.`ordersubtotalincltax`                    AS `ordersubtotalincltax`,
                       `ORDER`.`ordersubtotalexcltax`                    AS `ordersubtotalexcltax`,
                       `ORDER`.`ordersubtotaldiscountincltax`            AS `ordersubtotaldiscountincltax`,
                       `ORDER`.`ordersubtotaldiscountexcltax`            AS `ordersubtotaldiscountexcltax`,
                       `ORDER`.`ordershippingincltax`                    AS `ordershippingincltax`,
                       `ORDER`.`ordershippingexcltax`                    AS `ordershippingexcltax`,
                       `ORDER`.`paymentmethodadditionalfeeincltax`       AS `paymentmethodadditionalfeeincltax`,
                       `ORDER`.`paymentmethodadditionalfeeexcltax`       AS `paymentmethodadditionalfeeexcltax`,
                       `ORDER`.`taxrates`                                AS `taxrates`,
                       `ORDER`.`ordertax`                                AS `ordertax`,
                       `ORDER`.`orderdiscount`                           AS `orderdiscount`,
                       `ORDER`.`ordertotal`                              AS `ordertotal`,
                       `ORDER`.`refundedamount`                          AS `refundedamount`,
                       `ORDER`.`rewardpointshistoryentryid`              AS `rewardpointshistoryentryid`,
                       `ORDER`.`checkoutattributedescription`            AS `checkoutattributedescription`,
                       `ORDER`.`checkoutattributesxml`                   AS `checkoutattributesxml`,
                       `ORDER`.`customerlanguageid`                      AS `customerlanguageid`,
                       `ORDER`.`affiliateid`                             AS `affiliateid`,
                       `ORDER`.`customerip`                              AS `customerip`,
                       `ORDER`.`allowstoringcreditcardnumber`            AS `allowstoringcreditcardnumber`,
                       `ORDER`.`cardtype`                                AS `cardtype`,
                       `ORDER`.`cardname`                                AS `cardname`,
                       `ORDER`.`cardnumber`                              AS `cardnumber`,
                       `ORDER`.`maskedcreditcardnumber`                  AS `maskedcreditcardnumber`,
                       `ORDER`.`cardcvv2`                                AS `cardcvv2`,
                       `ORDER`.`cardexpirationmonth`                     AS `cardexpirationmonth`,
                       `ORDER`.`cardexpirationyear`                      AS `cardexpirationyear`,
                       `ORDER`.`authorizationtransactionid`              AS `authorizationtransactionid`,
                       `ORDER`.`authorizationtransactioncode`            AS `authorizationtransactioncode`,
                       `ORDER`.`authorizationtransactionresult`          AS `authorizationtransactionresult`,
                       `ORDER`.`capturetransactionid`                    AS `capturetransactionid`,
                       `ORDER`.`capturetransactionresult`                AS `capturetransactionresult`,
                       `ORDER`.`subscriptiontransactionid`               AS `subscriptiontransactionid`,
                       `ORDER`.`paiddateutc`                             AS `paiddateutc`,
                       `ORDER`.`shippingmethod`                          AS `shippingmethod`,
                       `ORDER`.`shippingratecomputationmethodsystemname` AS `shippingratecomputationmethodsystemname`,
                       `ORDER`.`customvaluesxml`                         AS `customvaluesxml`,
                       `ORDER`.`deleted`                                 AS `deleted`,
                       `ORDER`.`createdonutc`                            AS `createdonutc`,
                       `ORDER`.`customordernumber`                       AS `customordernumber`,
                       `ORDER`.`redeemedrewardpointsentryid`             AS `redeemedrewardpointsentryid`
                FROM   `ORDER`
                WHERE  ((
                                     `ORDER`.`orderstatusid` <> 40)
                       AND    (
                                     `ORDER`.`paymentstatusid` <> 20)
                       AND    (
                                     0 = `ORDER`.`deleted`))) `o`
ON      ((
                           `oi`.`orderid` = `o`.`id`)))
WHERE    ((
                           `p`.`producttypeid` = 10)
         AND      (
                           `p`.`parentgroupedproductid` = 0)
         AND      (
                           0 <> `p`.`published`)
         AND      (
                           0 = `p`.`deleted`)
         AND      (
                           0 = `o`.`deleted`)
         AND      (
                           `o`.`createdonutc` >= '2020-10-24')
         AND      (
                           `c`.`NAME` = 'Anne & Bebek'))
GROUP BY `baslangic`
ORDER BY `o`.`createdonutc` */;


--##################6
VIEW `besintakviyesi` ASSELECT   date_format((`o`.`createdonutc` + Interval ((1 - Dayofweek(`o`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `baslangic`,
         date_format((`o`.`createdonutc` + interval ((7 - dayofweek(`o`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `bitis`,
         `c`.`NAME`                                                                                            AS `name3`,
         count(DISTINCT `p`.`id`)                                                                              AS `ilansayisi3`,
         sum(`oi`.`quantity`)                                                                                  AS `satismiktari3`,
         sum(`oi`.`priceincltax`)                                                                              AS `satistutari3`
FROM     ((((((`allcategoriesbyparent` `mc`
JOIN     `category` `c`
ON      ((
                           `mc`.`maincategoryid` = `c`.`id`)))
JOIN     `product_category_mapping` `pcm`
ON      ((
                           find_in_set(`pcm`.`categoryid`,`mc`.`ids`) > 0)))
JOIN     `product` `p`
ON      ((
                           `pcm`.`productid` = `p`.`id`)))
JOIN
         (
                SELECT `product`.`id`                                                     AS `id`,
                       `product`.`producttypeid`                                          AS `producttypeid`,
                       `product`.`parentgroupedproductid`                                 AS `parentgroupedproductid`,
                       `product`.`visibleindividually`                                    AS `visibleindividually`,
                       `product`.`NAME`                                                   AS `NAME`,
                       `product`.`shortdescription`                                       AS `shortdescription`,
                       `product`.`fulldescription`                                        AS `fulldescription`,
                       `product`.`admincomment`                                           AS `admincomment`,
                       `product`.`producttemplateid`                                      AS `producttemplateid`,
                       `product`.`vendorid`                                               AS `vendorid`,
                       `product`.`showonhomepage`                                         AS `showonhomepage`,
                       `product`.`metakeywords`                                           AS `metakeywords`,
                       `product`.`metadescription`                                        AS `metadescription`,
                       `product`.`metatitle`                                              AS `metatitle`,
                       `product`.`allowcustomerreviews`                                   AS `allowcustomerreviews`,
                       `product`.`approvedratingsum`                                      AS `approvedratingsum`,
                       `product`.`notapprovedratingsum`                                   AS `notapprovedratingsum`,
                       `product`.`approvedtotalreviews`                                   AS `approvedtotalreviews`,
                       `product`.`notapprovedtotalreviews`                                AS `notapprovedtotalreviews`,
                       `product`.`subjecttoacl`                                           AS `subjecttoacl`,
                       `product`.`limitedtostores`                                        AS `limitedtostores`,
                       `product`.`sku`                                                    AS `sku`,
                       `product`.`manufacturerpartnumber`                                 AS `manufacturerpartnumber`,
                       `product`.`gtin`                                                   AS `gtin`,
                       `product`.`isgiftcard`                                             AS `isgiftcard`,
                       `product`.`giftcardtypeid`                                         AS `giftcardtypeid`,
                       `product`.`overriddengiftcardamount`                               AS `overriddengiftcardamount`,
                       `product`.`requireotherproducts`                                   AS `requireotherproducts`,
                       `product`.`requiredproductids`                                     AS `requiredproductids`,
                       `product`.`automaticallyaddrequiredproducts`                       AS `automaticallyaddrequiredproducts`,
                       `product`.`isdownload`                                             AS `isdownload`,
                       `product`.`downloadid`                                             AS `downloadid`,
                       `product`.`unlimiteddownloads`                                     AS `unlimiteddownloads`,
                       `product`.`maxnumberofdownloads`                                   AS `maxnumberofdownloads`,
                       `product`.`downloadexpirationdays`                                 AS `downloadexpirationdays`,
                       `product`.`downloadactivationtypeid`                               AS `downloadactivationtypeid`,
                       `product`.`hassampledownload`                                      AS `hassampledownload`,
                       `product`.`sampledownloadid`                                       AS `sampledownloadid`,
                       `product`.`hasuseragreement`                                       AS `hasuseragreement`,
                       `product`.`useragreementtext`                                      AS `useragreementtext`,
                       `product`.`isrecurring`                                            AS `isrecurring`,
                       `product`.`recurringcyclelength`                                   AS `recurringcyclelength`,
                       `product`.`recurringcycleperiodid`                                 AS `recurringcycleperiodid`,
                       `product`.`recurringtotalcycles`                                   AS `recurringtotalcycles`,
                       `product`.`isrental`                                               AS `isrental`,
                       `product`.`rentalpricelength`                                      AS `rentalpricelength`,
                       `product`.`rentalpriceperiodid`                                    AS `rentalpriceperiodid`,
                       `product`.`isshipenabled`                                          AS `isshipenabled`,
                       `product`.`isfreeshipping`                                         AS `isfreeshipping`,
                       `product`.`shipseparately`                                         AS `shipseparately`,
                       `product`.`additionalshippingcharge`                               AS `additionalshippingcharge`,
                       `product`.`deliverydateid`                                         AS `deliverydateid`,
                       `product`.`istaxexempt`                                            AS `istaxexempt`,
                       `product`.`taxcategoryid`                                          AS `taxcategoryid`,
                       `product`.`istelecommunicationsorbroadcastingorelectronicservices` AS `istelecommunicationsorbroadcastingorelectronicservices`,
                       `product`.`manageinventorymethodid`                                AS `manageinventorymethodid`,
                       `product`.`productavailabilityrangeid`                             AS `productavailabilityrangeid`,
                       `product`.`usemultiplewarehouses`                                  AS `usemultiplewarehouses`,
                       `product`.`warehouseid`                                            AS `warehouseid`,
                       `product`.`stockquantity`                                          AS `stockquantity`,
                       `product`.`displaystockavailability`                               AS `displaystockavailability`,
                       `product`.`displaystockquantity`                                   AS `displaystockquantity`,
                       `product`.`minstockquantity`                                       AS `minstockquantity`,
                       `product`.`lowstockactivityid`                                     AS `lowstockactivityid`,
                       `product`.`notifyadminforquantitybelow`                            AS `notifyadminforquantitybelow`,
                       `product`.`backordermodeid`                                        AS `backordermodeid`,
                       `product`.`allowbackinstocksubscriptions`                          AS `allowbackinstocksubscriptions`,
                       `product`.`orderminimumquantity`                                   AS `orderminimumquantity`,
                       `product`.`ordermaximumquantity`                                   AS `ordermaximumquantity`,
                       `product`.`allowedquantities`                                      AS `allowedquantities`,
                       `product`.`allowaddingonlyexistingattributecombinations`           AS `allowaddingonlyexistingattributecombinations`,
                       `product`.`notreturnable`                                          AS `notreturnable`,
                       `product`.`disablebuybutton`                                       AS `disablebuybutton`,
                       `product`.`disablewishlistbutton`                                  AS `disablewishlistbutton`,
                       `product`.`availableforpreorder`                                   AS `availableforpreorder`,
                       `product`.`preorderavailabilitystartdatetimeutc`                   AS `preorderavailabilitystartdatetimeutc`,
                       `product`.`callforprice`                                           AS `callforprice`,
                       `product`.`price`                                                  AS `price`,
                       `product`.`oldprice`                                               AS `oldprice`,
                       `product`.`productcost`                                            AS `productcost`,
                       `product`.`customerentersprice`                                    AS `customerentersprice`,
                       `product`.`minimumcustomerenteredprice`                            AS `minimumcustomerenteredprice`,
                       `product`.`maximumcustomerenteredprice`                            AS `maximumcustomerenteredprice`,
                       `product`.`basepriceenabled`                                       AS `basepriceenabled`,
                       `product`.`basepriceamount`                                        AS `basepriceamount`,
                       `product`.`basepriceunitid`                                        AS `basepriceunitid`,
                       `product`.`basepricebaseamount`                                    AS `basepricebaseamount`,
                       `product`.`basepricebaseunitid`                                    AS `basepricebaseunitid`,
                       `product`.`markasnew`                                              AS `markasnew`,
                       `product`.`markasnewstartdatetimeutc`                              AS `markasnewstartdatetimeutc`,
                       `product`.`markasnewenddatetimeutc`                                AS `markasnewenddatetimeutc`,
                       `product`.`hastierprices`                                          AS `hastierprices`,
                       `product`.`hasdiscountsapplied`                                    AS `hasdiscountsapplied`,
                       `product`.`weight`                                                 AS `weight`,
                       `product`.`length`                                                 AS `length`,
                       `product`.`width`                                                  AS `width`,
                       `product`.`height`                                                 AS `height`,
                       `product`.`availablestartdatetimeutc`                              AS `availablestartdatetimeutc`,
                       `product`.`availableenddatetimeutc`                                AS `availableenddatetimeutc`,
                       `product`.`displayorder`                                           AS `displayorder`,
                       `product`.`published`                                              AS `published`,
                       `product`.`deleted`                                                AS `deleted`,
                       `product`.`createdonutc`                                           AS `createdonutc`,
                       `product`.`updatedonutc`                                           AS `updatedonutc`,
                       `product`.`mf`                                                     AS `mf`,
                       `product`.`mfadet`                                                 AS `mfadet`,
                       `product`.`mfadetfazla`                                            AS `mfadetfazla`,
                       `product`.`miad`                                                   AS `miad`,
                       `product`.`miaddate`                                               AS `miaddate`,
                       `product`.`kamuodenen`                                             AS `kamuodenen`,
                       `product`.`fiyatfarki`                                             AS `fiyatfarki`
                FROM   `product`
                WHERE  ((
                                     `product`.`producttypeid` = 5)
                       AND    (
                                     `product`.`parentgroupedproductid` <> 0)
                       AND    (
                                     0 <> `product`.`published`)
                       AND    (
                                     0 = `product`.`deleted`))) `p2`
ON      ((
                           `p`.`id` = `p2`.`parentgroupedproductid`)))
JOIN     `orderitem` `oi`
ON      ((
                           `p2`.`id` = `oi`.`productid`)))
JOIN
         (
                SELECT `ORDER`.`id`                                      AS `id`,
                       `ORDER`.`orderguid`                               AS `orderguid`,
                       `ORDER`.`storeid`                                 AS `storeid`,
                       `ORDER`.`customerid`                              AS `customerid`,
                       `ORDER`.`billingaddressid`                        AS `billingaddressid`,
                       `ORDER`.`shippingaddressid`                       AS `shippingaddressid`,
                       `ORDER`.`pickupaddressid`                         AS `pickupaddressid`,
                       `ORDER`.`pickupinstore`                           AS `pickupinstore`,
                       `ORDER`.`orderstatusid`                           AS `orderstatusid`,
                       `ORDER`.`shippingstatusid`                        AS `shippingstatusid`,
                       `ORDER`.`paymentstatusid`                         AS `paymentstatusid`,
                       `ORDER`.`paymentmethodsystemname`                 AS `paymentmethodsystemname`,
                       `ORDER`.`customercurrencycode`                    AS `customercurrencycode`,
                       `ORDER`.`currencyrate`                            AS `currencyrate`,
                       `ORDER`.`customertaxdisplaytypeid`                AS `customertaxdisplaytypeid`,
                       `ORDER`.`vatnumber`                               AS `vatnumber`,
                       `ORDER`.`ordersubtotalincltax`                    AS `ordersubtotalincltax`,
                       `ORDER`.`ordersubtotalexcltax`                    AS `ordersubtotalexcltax`,
                       `ORDER`.`ordersubtotaldiscountincltax`            AS `ordersubtotaldiscountincltax`,
                       `ORDER`.`ordersubtotaldiscountexcltax`            AS `ordersubtotaldiscountexcltax`,
                       `ORDER`.`ordershippingincltax`                    AS `ordershippingincltax`,
                       `ORDER`.`ordershippingexcltax`                    AS `ordershippingexcltax`,
                       `ORDER`.`paymentmethodadditionalfeeincltax`       AS `paymentmethodadditionalfeeincltax`,
                       `ORDER`.`paymentmethodadditionalfeeexcltax`       AS `paymentmethodadditionalfeeexcltax`,
                       `ORDER`.`taxrates`                                AS `taxrates`,
                       `ORDER`.`ordertax`                                AS `ordertax`,
                       `ORDER`.`orderdiscount`                           AS `orderdiscount`,
                       `ORDER`.`ordertotal`                              AS `ordertotal`,
                       `ORDER`.`refundedamount`                          AS `refundedamount`,
                       `ORDER`.`rewardpointshistoryentryid`              AS `rewardpointshistoryentryid`,
                       `ORDER`.`checkoutattributedescription`            AS `checkoutattributedescription`,
                       `ORDER`.`checkoutattributesxml`                   AS `checkoutattributesxml`,
                       `ORDER`.`customerlanguageid`                      AS `customerlanguageid`,
                       `ORDER`.`affiliateid`                             AS `affiliateid`,
                       `ORDER`.`customerip`                              AS `customerip`,
                       `ORDER`.`allowstoringcreditcardnumber`            AS `allowstoringcreditcardnumber`,
                       `ORDER`.`cardtype`                                AS `cardtype`,
                       `ORDER`.`cardname`                                AS `cardname`,
                       `ORDER`.`cardnumber`                              AS `cardnumber`,
                       `ORDER`.`maskedcreditcardnumber`                  AS `maskedcreditcardnumber`,
                       `ORDER`.`cardcvv2`                                AS `cardcvv2`,
                       `ORDER`.`cardexpirationmonth`                     AS `cardexpirationmonth`,
                       `ORDER`.`cardexpirationyear`                      AS `cardexpirationyear`,
                       `ORDER`.`authorizationtransactionid`              AS `authorizationtransactionid`,
                       `ORDER`.`authorizationtransactioncode`            AS `authorizationtransactioncode`,
                       `ORDER`.`authorizationtransactionresult`          AS `authorizationtransactionresult`,
                       `ORDER`.`capturetransactionid`                    AS `capturetransactionid`,
                       `ORDER`.`capturetransactionresult`                AS `capturetransactionresult`,
                       `ORDER`.`subscriptiontransactionid`               AS `subscriptiontransactionid`,
                       `ORDER`.`paiddateutc`                             AS `paiddateutc`,
                       `ORDER`.`shippingmethod`                          AS `shippingmethod`,
                       `ORDER`.`shippingratecomputationmethodsystemname` AS `shippingratecomputationmethodsystemname`,
                       `ORDER`.`customvaluesxml`                         AS `customvaluesxml`,
                       `ORDER`.`deleted`                                 AS `deleted`,
                       `ORDER`.`createdonutc`                            AS `createdonutc`,
                       `ORDER`.`customordernumber`                       AS `customordernumber`,
                       `ORDER`.`redeemedrewardpointsentryid`             AS `redeemedrewardpointsentryid`
                FROM   `ORDER`
                WHERE  ((
                                     `ORDER`.`orderstatusid` <> 40)
                       AND    (
                                     `ORDER`.`paymentstatusid` <> 20)
                       AND    (
                                     0 = `ORDER`.`deleted`))) `o`
ON      ((
                           `oi`.`orderid` = `o`.`id`)))
WHERE    ((
                           `p`.`producttypeid` = 10)
         AND      (
                           `p`.`parentgroupedproductid` = 0)
         AND      (
                           0 <> `p`.`published`)
         AND      (
                           0 = `p`.`deleted`)
         AND      (
                           0 = `o`.`deleted`)
         AND      (
                           `o`.`createdonutc` >= '2020-10-24')
         AND      (
                           `c`.`NAME` = 'Besin Takviyesi'))
GROUP BY `baslangic`
ORDER BY `o`.`createdonutc` */;


--##################
VIEW `haftalikdepo` ASSELECT    date_format((`c`.`createdonutc` + Interval ((1 - Dayofweek(`c`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `baslangic`,
          date_format((`c`.`createdonutc` + interval ((7 - dayofweek(`c`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `bitis`,
          count(`c`.`vendorid`)                                                                                 AS `haftalikdepo`
FROM      (`customer` `c`
LEFT JOIN `vendor` `v`
ON       ((
                              `v`.`id` = `c`.`vendorid`)))
WHERE     ((
                              `c`.`vendorid` <> 0)
          AND       (
                              `c`.`active` = 1)
          AND       (
                              `c`.`createdonutc` >= '2020-10-24'))
GROUP BY  `baslangic`
ORDER BY  `c`.`createdonutc` */;


--##################
VIEW `haftalikeczadeposu` ASSELECT    date_format((`c`.`createdonutc` + Interval ((1 - Dayofweek(`c`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `baslangic`,
          date_format((`c`.`createdonutc` + interval ((7 - dayofweek(`c`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `bitis`,
          count(`c`.`vendorid`) OVER (ORDER BY `c`.`createdonutc` )                                             AS `haftalikeczadeposu`
FROM      ((`customer` `c`
LEFT JOIN `vendor` `v`
ON       ((
                              `v`.`id` = `c`.`vendorid`)))
JOIN      `customer_customerrole_mapping` `cr`
ON       ((
                              `c`.`id` = `cr`.`customer_id`)))
WHERE     ((
                              `c`.`vendorid` <> 0)
          AND       (
                              `c`.`active` = 1)
          AND       (
                              `c`.`createdonutc` >= '2020-10-24')
          AND       (
                              `cr`.`customerrole_id` = 91))
GROUP BY  `baslangic`
ORDER BY  `c`.`createdonutc` */;


--##################
VIEW `haftalikfirma` ASSELECT    date_format((`c`.`createdonutc` + Interval ((1 - Dayofweek(`c`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `baslangic`,
          date_format((`c`.`createdonutc` + interval ((7 - dayofweek(`c`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `bitis`,
          count(`c`.`vendorid`) OVER (ORDER BY `c`.`createdonutc` )                                             AS `haftalikfirma`
FROM      ((`customer` `c`
LEFT JOIN `vendor` `v`
ON       ((
                              `v`.`id` = `c`.`vendorid`)))
JOIN      `customer_customerrole_mapping` `cr`
ON       ((
                              `c`.`id` = `cr`.`customer_id`)))
WHERE     ((
                              `c`.`vendorid` <> 0)
          AND       (
                              `c`.`active` = 1)
          AND       (
                              `c`.`createdonutc` >= '2020-10-24')
          AND       (
                              `cr`.`customerrole_id` = 92))
GROUP BY  `baslangic`
ORDER BY  `c`.`createdonutc` */;


--##################
VIEW `haftalikitriyatdeposu` ASSELECT    date_format((`c`.`createdonutc` + Interval ((1 - Dayofweek(`c`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `baslangic`,
          date_format((`c`.`createdonutc` + interval ((7 - dayofweek(`c`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `bitis`,
          count(`c`.`vendorid`) OVER (ORDER BY `c`.`createdonutc` )                                             AS `haftalikitriyatdeposu`
FROM      ((`customer` `c`
LEFT JOIN `vendor` `v`
ON       ((
                              `v`.`id` = `c`.`vendorid`)))
JOIN      `customer_customerrole_mapping` `cr`
ON       ((
                              `c`.`id` = `cr`.`customer_id`)))
WHERE     ((
                              `c`.`vendorid` <> 0)
          AND       (
                              `c`.`active` = 1)
          AND       (
                              `c`.`createdonutc` >= '2020-10-24')
          AND       (
                              `cr`.`customerrole_id` = 93))
GROUP BY  `baslangic`
ORDER BY  `c`.`createdonutc` */;


--##################
VIEW `haftaliksatis` ASSELECT    date_format((`o`.`createdonutc` + Interval ((1 - Dayofweek(`o`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `baslangic`,
          date_format((`o`.`createdonutc` + interval ((7 - dayofweek(`o`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `bitis`,
          count(DISTINCT `o`.`id`)                                                                              AS `siparissayisi`,
          sum(`oi`.`quantity`)                                                                                  AS `miktar`,
          sum(`o`.`ordertotal`)                                                                                 AS `tutar`,
          count(DISTINCT `o2`.`id`)                                                                             AS `iptalsayisi`,
          sum(`oi2`.`quantity`)                                                                                 AS `iptalmiktar`,
          sum(`o2`.`ordertotal`)                                                                                AS `iptaltutar`,
          count(DISTINCT `o3`.`id`)                                                                             AS `netsiparis`,
          sum(`oi3`.`quantity`)                                                                                 AS `netmiktar`,
          sum(`o3`.`ordertotal`)                                                                                AS `nettutar`,
          (sum(`o3`.`ordertotal`) / count(DISTINCT `o3`.`id`))                                                  AS `ortalamasepettutari`
FROM      (((((`ORDER` `o`
LEFT JOIN
          (
                   SELECT   `orderitem`.`orderid`       AS `orderid`,
                            sum(`orderitem`.`quantity`) AS `quantity`
                   FROM     `orderitem`
                   GROUP BY `orderitem`.`orderid`) `oi`
ON       ((
                              `o`.`id` = `oi`.`orderid`)))
LEFT JOIN
          (
                 SELECT `ORDER`.`id`                                      AS `id`,
                        `ORDER`.`orderguid`                               AS `orderguid`,
                        `ORDER`.`storeid`                                 AS `storeid`,
                        `ORDER`.`customerid`                              AS `customerid`,
                        `ORDER`.`billingaddressid`                        AS `billingaddressid`,
                        `ORDER`.`shippingaddressid`                       AS `shippingaddressid`,
                        `ORDER`.`pickupaddressid`                         AS `pickupaddressid`,
                        `ORDER`.`pickupinstore`                           AS `pickupinstore`,
                        `ORDER`.`orderstatusid`                           AS `orderstatusid`,
                        `ORDER`.`shippingstatusid`                        AS `shippingstatusid`,
                        `ORDER`.`paymentstatusid`                         AS `paymentstatusid`,
                        `ORDER`.`paymentmethodsystemname`                 AS `paymentmethodsystemname`,
                        `ORDER`.`customercurrencycode`                    AS `customercurrencycode`,
                        `ORDER`.`currencyrate`                            AS `currencyrate`,
                        `ORDER`.`customertaxdisplaytypeid`                AS `customertaxdisplaytypeid`,
                        `ORDER`.`vatnumber`                               AS `vatnumber`,
                        `ORDER`.`ordersubtotalincltax`                    AS `ordersubtotalincltax`,
                        `ORDER`.`ordersubtotalexcltax`                    AS `ordersubtotalexcltax`,
                        `ORDER`.`ordersubtotaldiscountincltax`            AS `ordersubtotaldiscountincltax`,
                        `ORDER`.`ordersubtotaldiscountexcltax`            AS `ordersubtotaldiscountexcltax`,
                        `ORDER`.`ordershippingincltax`                    AS `ordershippingincltax`,
                        `ORDER`.`ordershippingexcltax`                    AS `ordershippingexcltax`,
                        `ORDER`.`paymentmethodadditionalfeeincltax`       AS `paymentmethodadditionalfeeincltax`,
                        `ORDER`.`paymentmethodadditionalfeeexcltax`       AS `paymentmethodadditionalfeeexcltax`,
                        `ORDER`.`taxrates`                                AS `taxrates`,
                        `ORDER`.`ordertax`                                AS `ordertax`,
                        `ORDER`.`orderdiscount`                           AS `orderdiscount`,
                        `ORDER`.`ordertotal`                              AS `ordertotal`,
                        `ORDER`.`refundedamount`                          AS `refundedamount`,
                        `ORDER`.`rewardpointshistoryentryid`              AS `rewardpointshistoryentryid`,
                        `ORDER`.`checkoutattributedescription`            AS `checkoutattributedescription`,
                        `ORDER`.`checkoutattributesxml`                   AS `checkoutattributesxml`,
                        `ORDER`.`customerlanguageid`                      AS `customerlanguageid`,
                        `ORDER`.`affiliateid`                             AS `affiliateid`,
                        `ORDER`.`customerip`                              AS `customerip`,
                        `ORDER`.`allowstoringcreditcardnumber`            AS `allowstoringcreditcardnumber`,
                        `ORDER`.`cardtype`                                AS `cardtype`,
                        `ORDER`.`cardname`                                AS `cardname`,
                        `ORDER`.`cardnumber`                              AS `cardnumber`,
                        `ORDER`.`maskedcreditcardnumber`                  AS `maskedcreditcardnumber`,
                        `ORDER`.`cardcvv2`                                AS `cardcvv2`,
                        `ORDER`.`cardexpirationmonth`                     AS `cardexpirationmonth`,
                        `ORDER`.`cardexpirationyear`                      AS `cardexpirationyear`,
                        `ORDER`.`authorizationtransactionid`              AS `authorizationtransactionid`,
                        `ORDER`.`authorizationtransactioncode`            AS `authorizationtransactioncode`,
                        `ORDER`.`authorizationtransactionresult`          AS `authorizationtransactionresult`,
                        `ORDER`.`capturetransactionid`                    AS `capturetransactionid`,
                        `ORDER`.`capturetransactionresult`                AS `capturetransactionresult`,
                        `ORDER`.`subscriptiontransactionid`               AS `subscriptiontransactionid`,
                        `ORDER`.`paiddateutc`                             AS `paiddateutc`,
                        `ORDER`.`shippingmethod`                          AS `shippingmethod`,
                        `ORDER`.`shippingratecomputationmethodsystemname` AS `shippingratecomputationmethodsystemname`,
                        `ORDER`.`customvaluesxml`                         AS `customvaluesxml`,
                        `ORDER`.`deleted`                                 AS `deleted`,
                        `ORDER`.`createdonutc`                            AS `createdonutc`,
                        `ORDER`.`customordernumber`                       AS `customordernumber`,
                        `ORDER`.`redeemedrewardpointsentryid`             AS `redeemedrewardpointsentryid`
                 FROM   `ORDER`
                 WHERE  (
                               `ORDER`.`orderstatusid` = 40)) `o2`
ON       ((
                              `o`.`id` = `o2`.`id`)))
LEFT JOIN
          (
                   SELECT   `orderitem`.`orderid`       AS `orderid`,
                            sum(`orderitem`.`quantity`) AS `quantity`
                   FROM     `orderitem`
                   GROUP BY `orderitem`.`orderid`) `oi2`
ON       ((
                              `o2`.`id` = `oi2`.`orderid`)))
LEFT JOIN
          (
                 SELECT `ORDER`.`id`                                      AS `id`,
                        `ORDER`.`orderguid`                               AS `orderguid`,
                        `ORDER`.`storeid`                                 AS `storeid`,
                        `ORDER`.`customerid`                              AS `customerid`,
                        `ORDER`.`billingaddressid`                        AS `billingaddressid`,
                        `ORDER`.`shippingaddressid`                       AS `shippingaddressid`,
                        `ORDER`.`pickupaddressid`                         AS `pickupaddressid`,
                        `ORDER`.`pickupinstore`                           AS `pickupinstore`,
                        `ORDER`.`orderstatusid`                           AS `orderstatusid`,
                        `ORDER`.`shippingstatusid`                        AS `shippingstatusid`,
                        `ORDER`.`paymentstatusid`                         AS `paymentstatusid`,
                        `ORDER`.`paymentmethodsystemname`                 AS `paymentmethodsystemname`,
                        `ORDER`.`customercurrencycode`                    AS `customercurrencycode`,
                        `ORDER`.`currencyrate`                            AS `currencyrate`,
                        `ORDER`.`customertaxdisplaytypeid`                AS `customertaxdisplaytypeid`,
                        `ORDER`.`vatnumber`                               AS `vatnumber`,
                        `ORDER`.`ordersubtotalincltax`                    AS `ordersubtotalincltax`,
                        `ORDER`.`ordersubtotalexcltax`                    AS `ordersubtotalexcltax`,
                        `ORDER`.`ordersubtotaldiscountincltax`            AS `ordersubtotaldiscountincltax`,
                        `ORDER`.`ordersubtotaldiscountexcltax`            AS `ordersubtotaldiscountexcltax`,
                        `ORDER`.`ordershippingincltax`                    AS `ordershippingincltax`,
                        `ORDER`.`ordershippingexcltax`                    AS `ordershippingexcltax`,
                        `ORDER`.`paymentmethodadditionalfeeincltax`       AS `paymentmethodadditionalfeeincltax`,
                        `ORDER`.`paymentmethodadditionalfeeexcltax`       AS `paymentmethodadditionalfeeexcltax`,
                        `ORDER`.`taxrates`                                AS `taxrates`,
                        `ORDER`.`ordertax`                                AS `ordertax`,
                        `ORDER`.`orderdiscount`                           AS `orderdiscount`,
                        `ORDER`.`ordertotal`                              AS `ordertotal`,
                        `ORDER`.`refundedamount`                          AS `refundedamount`,
                        `ORDER`.`rewardpointshistoryentryid`              AS `rewardpointshistoryentryid`,
                        `ORDER`.`checkoutattributedescription`            AS `checkoutattributedescription`,
                        `ORDER`.`checkoutattributesxml`                   AS `checkoutattributesxml`,
                        `ORDER`.`customerlanguageid`                      AS `customerlanguageid`,
                        `ORDER`.`affiliateid`                             AS `affiliateid`,
                        `ORDER`.`customerip`                              AS `customerip`,
                        `ORDER`.`allowstoringcreditcardnumber`            AS `allowstoringcreditcardnumber`,
                        `ORDER`.`cardtype`                                AS `cardtype`,
                        `ORDER`.`cardname`                                AS `cardname`,
                        `ORDER`.`cardnumber`                              AS `cardnumber`,
                        `ORDER`.`maskedcreditcardnumber`                  AS `maskedcreditcardnumber`,
                        `ORDER`.`cardcvv2`                                AS `cardcvv2`,
                        `ORDER`.`cardexpirationmonth`                     AS `cardexpirationmonth`,
                        `ORDER`.`cardexpirationyear`                      AS `cardexpirationyear`,
                        `ORDER`.`authorizationtransactionid`              AS `authorizationtransactionid`,
                        `ORDER`.`authorizationtransactioncode`            AS `authorizationtransactioncode`,
                        `ORDER`.`authorizationtransactionresult`          AS `authorizationtransactionresult`,
                        `ORDER`.`capturetransactionid`                    AS `capturetransactionid`,
                        `ORDER`.`capturetransactionresult`                AS `capturetransactionresult`,
                        `ORDER`.`subscriptiontransactionid`               AS `subscriptiontransactionid`,
                        `ORDER`.`paiddateutc`                             AS `paiddateutc`,
                        `ORDER`.`shippingmethod`                          AS `shippingmethod`,
                        `ORDER`.`shippingratecomputationmethodsystemname` AS `shippingratecomputationmethodsystemname`,
                        `ORDER`.`customvaluesxml`                         AS `customvaluesxml`,
                        `ORDER`.`deleted`                                 AS `deleted`,
                        `ORDER`.`createdonutc`                            AS `createdonutc`,
                        `ORDER`.`customordernumber`                       AS `customordernumber`,
                        `ORDER`.`redeemedrewardpointsentryid`             AS `redeemedrewardpointsentryid`
                 FROM   `ORDER`
                 WHERE  ((
                                      `ORDER`.`orderstatusid` = 30)
                        AND    ((
                                             `ORDER`.`paymentstatusid` = 30)
                               OR     (
                                             `ORDER`.`paymentstatusid` = 35)))) `o3`
ON       ((
                              `o`.`id` = `o3`.`id`)))
LEFT JOIN
          (
                   SELECT   `orderitem`.`orderid`       AS `orderid`,
                            sum(`orderitem`.`quantity`) AS `quantity`
                   FROM     `orderitem`
                   GROUP BY `orderitem`.`orderid`) `oi3`
ON       ((
                              `o3`.`id` = `oi3`.`orderid`)))
WHERE     ((
                              `o`.`createdonutc` >= '2020-10-24')
          AND       (
                              0 = `o`.`deleted`)
          AND       (
                              `o`.`paymentstatusid` <> 20))
GROUP BY  `baslangic`
ORDER BY  `o`.`createdonutc` */;


--##################
VIEW `kategorisiz` ASSELECT   date_format((`o`.`createdonutc` + Interval ((1 - Dayofweek(`o`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `baslangic`,
         date_format((`o`.`createdonutc` + interval ((7 - dayofweek(`o`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `bitis`,
         'Kategorisiz'                                                                                         AS `name8`,
         count(DISTINCT `p`.`id`)                                                                              AS `ilansayisi8`,
         sum(`oi`.`quantity`)                                                                                  AS `satismiktari8`,
         sum(`oi`.`priceincltax`)                                                                              AS `satistutari8`
FROM     (((`product` `p`
JOIN
         (
                SELECT `product`.`id`                                                     AS `id`,
                       `product`.`producttypeid`                                          AS `producttypeid`,
                       `product`.`parentgroupedproductid`                                 AS `parentgroupedproductid`,
                       `product`.`visibleindividually`                                    AS `visibleindividually`,
                       `product`.`NAME`                                                   AS `NAME`,
                       `product`.`shortdescription`                                       AS `shortdescription`,
                       `product`.`fulldescription`                                        AS `fulldescription`,
                       `product`.`admincomment`                                           AS `admincomment`,
                       `product`.`producttemplateid`                                      AS `producttemplateid`,
                       `product`.`vendorid`                                               AS `vendorid`,
                       `product`.`showonhomepage`                                         AS `showonhomepage`,
                       `product`.`metakeywords`                                           AS `metakeywords`,
                       `product`.`metadescription`                                        AS `metadescription`,
                       `product`.`metatitle`                                              AS `metatitle`,
                       `product`.`allowcustomerreviews`                                   AS `allowcustomerreviews`,
                       `product`.`approvedratingsum`                                      AS `approvedratingsum`,
                       `product`.`notapprovedratingsum`                                   AS `notapprovedratingsum`,
                       `product`.`approvedtotalreviews`                                   AS `approvedtotalreviews`,
                       `product`.`notapprovedtotalreviews`                                AS `notapprovedtotalreviews`,
                       `product`.`subjecttoacl`                                           AS `subjecttoacl`,
                       `product`.`limitedtostores`                                        AS `limitedtostores`,
                       `product`.`sku`                                                    AS `sku`,
                       `product`.`manufacturerpartnumber`                                 AS `manufacturerpartnumber`,
                       `product`.`gtin`                                                   AS `gtin`,
                       `product`.`isgiftcard`                                             AS `isgiftcard`,
                       `product`.`giftcardtypeid`                                         AS `giftcardtypeid`,
                       `product`.`overriddengiftcardamount`                               AS `overriddengiftcardamount`,
                       `product`.`requireotherproducts`                                   AS `requireotherproducts`,
                       `product`.`requiredproductids`                                     AS `requiredproductids`,
                       `product`.`automaticallyaddrequiredproducts`                       AS `automaticallyaddrequiredproducts`,
                       `product`.`isdownload`                                             AS `isdownload`,
                       `product`.`downloadid`                                             AS `downloadid`,
                       `product`.`unlimiteddownloads`                                     AS `unlimiteddownloads`,
                       `product`.`maxnumberofdownloads`                                   AS `maxnumberofdownloads`,
                       `product`.`downloadexpirationdays`                                 AS `downloadexpirationdays`,
                       `product`.`downloadactivationtypeid`                               AS `downloadactivationtypeid`,
                       `product`.`hassampledownload`                                      AS `hassampledownload`,
                       `product`.`sampledownloadid`                                       AS `sampledownloadid`,
                       `product`.`hasuseragreement`                                       AS `hasuseragreement`,
                       `product`.`useragreementtext`                                      AS `useragreementtext`,
                       `product`.`isrecurring`                                            AS `isrecurring`,
                       `product`.`recurringcyclelength`                                   AS `recurringcyclelength`,
                       `product`.`recurringcycleperiodid`                                 AS `recurringcycleperiodid`,
                       `product`.`recurringtotalcycles`                                   AS `recurringtotalcycles`,
                       `product`.`isrental`                                               AS `isrental`,
                       `product`.`rentalpricelength`                                      AS `rentalpricelength`,
                       `product`.`rentalpriceperiodid`                                    AS `rentalpriceperiodid`,
                       `product`.`isshipenabled`                                          AS `isshipenabled`,
                       `product`.`isfreeshipping`                                         AS `isfreeshipping`,
                       `product`.`shipseparately`                                         AS `shipseparately`,
                       `product`.`additionalshippingcharge`                               AS `additionalshippingcharge`,
                       `product`.`deliverydateid`                                         AS `deliverydateid`,
                       `product`.`istaxexempt`                                            AS `istaxexempt`,
                       `product`.`taxcategoryid`                                          AS `taxcategoryid`,
                       `product`.`istelecommunicationsorbroadcastingorelectronicservices` AS `istelecommunicationsorbroadcastingorelectronicservices`,
                       `product`.`manageinventorymethodid`                                AS `manageinventorymethodid`,
                       `product`.`productavailabilityrangeid`                             AS `productavailabilityrangeid`,
                       `product`.`usemultiplewarehouses`                                  AS `usemultiplewarehouses`,
                       `product`.`warehouseid`                                            AS `warehouseid`,
                       `product`.`stockquantity`                                          AS `stockquantity`,
                       `product`.`displaystockavailability`                               AS `displaystockavailability`,
                       `product`.`displaystockquantity`                                   AS `displaystockquantity`,
                       `product`.`minstockquantity`                                       AS `minstockquantity`,
                       `product`.`lowstockactivityid`                                     AS `lowstockactivityid`,
                       `product`.`notifyadminforquantitybelow`                            AS `notifyadminforquantitybelow`,
                       `product`.`backordermodeid`                                        AS `backordermodeid`,
                       `product`.`allowbackinstocksubscriptions`                          AS `allowbackinstocksubscriptions`,
                       `product`.`orderminimumquantity`                                   AS `orderminimumquantity`,
                       `product`.`ordermaximumquantity`                                   AS `ordermaximumquantity`,
                       `product`.`allowedquantities`                                      AS `allowedquantities`,
                       `product`.`allowaddingonlyexistingattributecombinations`           AS `allowaddingonlyexistingattributecombinations`,
                       `product`.`notreturnable`                                          AS `notreturnable`,
                       `product`.`disablebuybutton`                                       AS `disablebuybutton`,
                       `product`.`disablewishlistbutton`                                  AS `disablewishlistbutton`,
                       `product`.`availableforpreorder`                                   AS `availableforpreorder`,
                       `product`.`preorderavailabilitystartdatetimeutc`                   AS `preorderavailabilitystartdatetimeutc`,
                       `product`.`callforprice`                                           AS `callforprice`,
                       `product`.`price`                                                  AS `price`,
                       `product`.`oldprice`                                               AS `oldprice`,
                       `product`.`productcost`                                            AS `productcost`,
                       `product`.`customerentersprice`                                    AS `customerentersprice`,
                       `product`.`minimumcustomerenteredprice`                            AS `minimumcustomerenteredprice`,
                       `product`.`maximumcustomerenteredprice`                            AS `maximumcustomerenteredprice`,
                       `product`.`basepriceenabled`                                       AS `basepriceenabled`,
                       `product`.`basepriceamount`                                        AS `basepriceamount`,
                       `product`.`basepriceunitid`                                        AS `basepriceunitid`,
                       `product`.`basepricebaseamount`                                    AS `basepricebaseamount`,
                       `product`.`basepricebaseunitid`                                    AS `basepricebaseunitid`,
                       `product`.`markasnew`                                              AS `markasnew`,
                       `product`.`markasnewstartdatetimeutc`                              AS `markasnewstartdatetimeutc`,
                       `product`.`markasnewenddatetimeutc`                                AS `markasnewenddatetimeutc`,
                       `product`.`hastierprices`                                          AS `hastierprices`,
                       `product`.`hasdiscountsapplied`                                    AS `hasdiscountsapplied`,
                       `product`.`weight`                                                 AS `weight`,
                       `product`.`length`                                                 AS `length`,
                       `product`.`width`                                                  AS `width`,
                       `product`.`height`                                                 AS `height`,
                       `product`.`availablestartdatetimeutc`                              AS `availablestartdatetimeutc`,
                       `product`.`availableenddatetimeutc`                                AS `availableenddatetimeutc`,
                       `product`.`displayorder`                                           AS `displayorder`,
                       `product`.`published`                                              AS `published`,
                       `product`.`deleted`                                                AS `deleted`,
                       `product`.`createdonutc`                                           AS `createdonutc`,
                       `product`.`updatedonutc`                                           AS `updatedonutc`,
                       `product`.`mf`                                                     AS `mf`,
                       `product`.`mfadet`                                                 AS `mfadet`,
                       `product`.`mfadetfazla`                                            AS `mfadetfazla`,
                       `product`.`miad`                                                   AS `miad`,
                       `product`.`miaddate`                                               AS `miaddate`,
                       `product`.`kamuodenen`                                             AS `kamuodenen`,
                       `product`.`fiyatfarki`                                             AS `fiyatfarki`
                FROM   `product`
                WHERE  ((
                                     `product`.`producttypeid` = 5)
                       AND    (
                                     `product`.`parentgroupedproductid` <> 0)
                       AND    (
                                     0 <> `product`.`published`)
                       AND    (
                                     0 = `product`.`deleted`))) `p2`
ON      ((
                           `p`.`id` = `p2`.`parentgroupedproductid`)))
JOIN     `orderitem` `oi`
ON      ((
                           `p2`.`id` = `oi`.`productid`)))
JOIN
         (
                SELECT `ORDER`.`id`                                      AS `id`,
                       `ORDER`.`orderguid`                               AS `orderguid`,
                       `ORDER`.`storeid`                                 AS `storeid`,
                       `ORDER`.`customerid`                              AS `customerid`,
                       `ORDER`.`billingaddressid`                        AS `billingaddressid`,
                       `ORDER`.`shippingaddressid`                       AS `shippingaddressid`,
                       `ORDER`.`pickupaddressid`                         AS `pickupaddressid`,
                       `ORDER`.`pickupinstore`                           AS `pickupinstore`,
                       `ORDER`.`orderstatusid`                           AS `orderstatusid`,
                       `ORDER`.`shippingstatusid`                        AS `shippingstatusid`,
                       `ORDER`.`paymentstatusid`                         AS `paymentstatusid`,
                       `ORDER`.`paymentmethodsystemname`                 AS `paymentmethodsystemname`,
                       `ORDER`.`customercurrencycode`                    AS `customercurrencycode`,
                       `ORDER`.`currencyrate`                            AS `currencyrate`,
                       `ORDER`.`customertaxdisplaytypeid`                AS `customertaxdisplaytypeid`,
                       `ORDER`.`vatnumber`                               AS `vatnumber`,
                       `ORDER`.`ordersubtotalincltax`                    AS `ordersubtotalincltax`,
                       `ORDER`.`ordersubtotalexcltax`                    AS `ordersubtotalexcltax`,
                       `ORDER`.`ordersubtotaldiscountincltax`            AS `ordersubtotaldiscountincltax`,
                       `ORDER`.`ordersubtotaldiscountexcltax`            AS `ordersubtotaldiscountexcltax`,
                       `ORDER`.`ordershippingincltax`                    AS `ordershippingincltax`,
                       `ORDER`.`ordershippingexcltax`                    AS `ordershippingexcltax`,
                       `ORDER`.`paymentmethodadditionalfeeincltax`       AS `paymentmethodadditionalfeeincltax`,
                       `ORDER`.`paymentmethodadditionalfeeexcltax`       AS `paymentmethodadditionalfeeexcltax`,
                       `ORDER`.`taxrates`                                AS `taxrates`,
                       `ORDER`.`ordertax`                                AS `ordertax`,
                       `ORDER`.`orderdiscount`                           AS `orderdiscount`,
                       `ORDER`.`ordertotal`                              AS `ordertotal`,
                       `ORDER`.`refundedamount`                          AS `refundedamount`,
                       `ORDER`.`rewardpointshistoryentryid`              AS `rewardpointshistoryentryid`,
                       `ORDER`.`checkoutattributedescription`            AS `checkoutattributedescription`,
                       `ORDER`.`checkoutattributesxml`                   AS `checkoutattributesxml`,
                       `ORDER`.`customerlanguageid`                      AS `customerlanguageid`,
                       `ORDER`.`affiliateid`                             AS `affiliateid`,
                       `ORDER`.`customerip`                              AS `customerip`,
                       `ORDER`.`allowstoringcreditcardnumber`            AS `allowstoringcreditcardnumber`,
                       `ORDER`.`cardtype`                                AS `cardtype`,
                       `ORDER`.`cardname`                                AS `cardname`,
                       `ORDER`.`cardnumber`                              AS `cardnumber`,
                       `ORDER`.`maskedcreditcardnumber`                  AS `maskedcreditcardnumber`,
                       `ORDER`.`cardcvv2`                                AS `cardcvv2`,
                       `ORDER`.`cardexpirationmonth`                     AS `cardexpirationmonth`,
                       `ORDER`.`cardexpirationyear`                      AS `cardexpirationyear`,
                       `ORDER`.`authorizationtransactionid`              AS `authorizationtransactionid`,
                       `ORDER`.`authorizationtransactioncode`            AS `authorizationtransactioncode`,
                       `ORDER`.`authorizationtransactionresult`          AS `authorizationtransactionresult`,
                       `ORDER`.`capturetransactionid`                    AS `capturetransactionid`,
                       `ORDER`.`capturetransactionresult`                AS `capturetransactionresult`,
                       `ORDER`.`subscriptiontransactionid`               AS `subscriptiontransactionid`,
                       `ORDER`.`paiddateutc`                             AS `paiddateutc`,
                       `ORDER`.`shippingmethod`                          AS `shippingmethod`,
                       `ORDER`.`shippingratecomputationmethodsystemname` AS `shippingratecomputationmethodsystemname`,
                       `ORDER`.`customvaluesxml`                         AS `customvaluesxml`,
                       `ORDER`.`deleted`                                 AS `deleted`,
                       `ORDER`.`createdonutc`                            AS `createdonutc`,
                       `ORDER`.`customordernumber`                       AS `customordernumber`,
                       `ORDER`.`redeemedrewardpointsentryid`             AS `redeemedrewardpointsentryid`
                FROM   `ORDER`
                WHERE  ((
                                     `ORDER`.`orderstatusid` <> 40)
                       AND    (
                                     `ORDER`.`paymentstatusid` <> 20)
                       AND    (
                                     0 = `ORDER`.`deleted`))) `o`
ON      ((
                           `oi`.`orderid` = `o`.`id`)))
WHERE    ((
                           `p`.`producttypeid` = 10)
         AND      (
                           `p`.`parentgroupedproductid` = 0)
         AND      (
                           0 <> `p`.`published`)
         AND      (
                           0 = `p`.`deleted`)
         AND      (
                           0 = `o`.`deleted`)
         AND      (
                           `o`.`createdonutc` >= '2020-10-24')
         AND      `p`.`id` IN
                  (
                         SELECT `product_category_mapping`.`productid`
                         FROM   `product_category_mapping`) IS false)
GROUP BY `baslangic`
ORDER BY `o`.`createdonutc` */;


--##################
VIEW `kayitolaneczaneler` ASSELECT    date_format((`c`.`createdonutc` + Interval ((1 - Dayofweek(`c`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `baslangic`,
          date_format((`c`.`createdonutc` + interval ((7 - dayofweek(`c`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `bitis`,
          sum(count(DISTINCT `c`.`id`)) OVER (ORDER BY `c`.`createdonutc` )                                     AS `kayitolaneczane`,
          sum(count(DISTINCT `ga1`.`entityid`)) OVER (ORDER BY `c`.`createdonutc` )                             AS `avmeczanesi`,
          sum(count(DISTINCT `ga2`.`entityid`)) OVER (ORDER BY `c`.`createdonutc` )                             AS `caddeeczanesi`,
          sum(count(DISTINCT `ga3`.`entityid`)) OVER (ORDER BY `c`.`createdonutc` )                             AS `semteczanesi`,
          sum(count(DISTINCT `ga4`.`entityid`)) OVER (ORDER BY `c`.`createdonutc` )                             AS `asmcevresieczanesi`,
          sum(count(DISTINCT `ga5`.`entityid`)) OVER (ORDER BY `c`.`createdonutc` )                             AS `hastanecevresieczanesi`
FROM      (((((`customer` `c`
LEFT JOIN
          (
                 SELECT `ga`.`id`                      AS `id`,
                        `ga`.`entityid`                AS `entityid`,
                        `ga`.`keygroup`                AS `keygroup`,
                        `ga`.`KEY`                     AS `KEY`,
                        `ga`.`value`                   AS `value`,
                        `ga`.`storeid`                 AS `storeid`,
                        `ga`.`createdorupdateddateutc` AS `createdorupdateddateutc`
                 FROM   `genericattribute` `ga`
                 WHERE  ((
                                      `ga`.`KEY` = 'CustomCustomerAttributes')
                        AND    (
                                      `ga`.`value` LIKE '%ID="5"%')
                        AND    (
                                      `ga`.`value` LIKE '%<Value>1</Value>%'))) `ga1`
ON       ((
                              `c`.`id` = `ga1`.`entityid`)))
LEFT JOIN
          (
                 SELECT `ga`.`id`                      AS `id`,
                        `ga`.`entityid`                AS `entityid`,
                        `ga`.`keygroup`                AS `keygroup`,
                        `ga`.`KEY`                     AS `KEY`,
                        `ga`.`value`                   AS `value`,
                        `ga`.`storeid`                 AS `storeid`,
                        `ga`.`createdorupdateddateutc` AS `createdorupdateddateutc`
                 FROM   `genericattribute` `ga`
                 WHERE  ((
                                      `ga`.`KEY` = 'CustomCustomerAttributes')
                        AND    (
                                      `ga`.`value` LIKE '%ID="5"%')
                        AND    (
                                      `ga`.`value` LIKE '%<Value>2</Value>%'))) `ga2`
ON       ((
                              `c`.`id` = `ga2`.`entityid`)))
LEFT JOIN
          (
                 SELECT `ga`.`id`                      AS `id`,
                        `ga`.`entityid`                AS `entityid`,
                        `ga`.`keygroup`                AS `keygroup`,
                        `ga`.`KEY`                     AS `KEY`,
                        `ga`.`value`                   AS `value`,
                        `ga`.`storeid`                 AS `storeid`,
                        `ga`.`createdorupdateddateutc` AS `createdorupdateddateutc`
                 FROM   `genericattribute` `ga`
                 WHERE  ((
                                      `ga`.`KEY` = 'CustomCustomerAttributes')
                        AND    (
                                      `ga`.`value` LIKE '%ID="5"%')
                        AND    (
                                      `ga`.`value` LIKE '%<Value>3</Value>%'))) `ga3`
ON       ((
                              `c`.`id` = `ga3`.`entityid`)))
LEFT JOIN
          (
                 SELECT `ga`.`id`                      AS `id`,
                        `ga`.`entityid`                AS `entityid`,
                        `ga`.`keygroup`                AS `keygroup`,
                        `ga`.`KEY`                     AS `KEY`,
                        `ga`.`value`                   AS `value`,
                        `ga`.`storeid`                 AS `storeid`,
                        `ga`.`createdorupdateddateutc` AS `createdorupdateddateutc`
                 FROM   `genericattribute` `ga`
                 WHERE  ((
                                      `ga`.`KEY` = 'CustomCustomerAttributes')
                        AND    (
                                      `ga`.`value` LIKE '%ID="5"%')
                        AND    (
                                      `ga`.`value` LIKE '%<Value>4</Value>%'))) `ga4`
ON       ((
                              `c`.`id` = `ga4`.`entityid`)))
LEFT JOIN
          (
                 SELECT `ga`.`id`                      AS `id`,
                        `ga`.`entityid`                AS `entityid`,
                        `ga`.`keygroup`                AS `keygroup`,
                        `ga`.`KEY`                     AS `KEY`,
                        `ga`.`value`                   AS `value`,
                        `ga`.`storeid`                 AS `storeid`,
                        `ga`.`createdorupdateddateutc` AS `createdorupdateddateutc`
                 FROM   `genericattribute` `ga`
                 WHERE  ((
                                      `ga`.`KEY` = 'CustomCustomerAttributes')
                        AND    (
                                      `ga`.`value` LIKE '%ID="5"%')
                        AND    (
                                      `ga`.`value` LIKE '%<Value>5</Value>%'))) `ga5`
ON       ((
                              `c`.`id` = `ga5`.`entityid`)))
WHERE     ((
                              `c`.`createdonutc` >= '2020-10-24')
          AND       (
                              0 = `c`.`deleted`)
          AND       (
                              0 <> `c`.`active`)
          AND       (
                              `c`.`email` IS NOT NULL)
          AND       ((
                                        `c`.`id` < 1078412)
                    OR        (
                                        `c`.`id` > 1078648)))
GROUP BY  `baslangic`
ORDER BY  `c`.`createdonutc` */;


--##################
VIEW `kisiselbakim` ASSELECT   date_format((`o`.`createdonutc` + Interval ((1 - Dayofweek(`o`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `baslangic`,
         date_format((`o`.`createdonutc` + interval ((7 - dayofweek(`o`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `bitis`,
         `c`.`NAME`                                                                                            AS `name5`,
         count(DISTINCT `p`.`id`)                                                                              AS `ilansayisi5`,
         sum(`oi`.`quantity`)                                                                                  AS `satismiktari5`,
         sum(`oi`.`priceincltax`)                                                                              AS `satistutari5`
FROM     ((((((`allcategoriesbyparent` `mc`
JOIN     `category` `c`
ON      ((
                           `mc`.`maincategoryid` = `c`.`id`)))
JOIN     `product_category_mapping` `pcm`
ON      ((
                           find_in_set(`pcm`.`categoryid`,`mc`.`ids`) > 0)))
JOIN     `product` `p`
ON      ((
                           `pcm`.`productid` = `p`.`id`)))
JOIN
         (
                SELECT `product`.`id`                                                     AS `id`,
                       `product`.`producttypeid`                                          AS `producttypeid`,
                       `product`.`parentgroupedproductid`                                 AS `parentgroupedproductid`,
                       `product`.`visibleindividually`                                    AS `visibleindividually`,
                       `product`.`NAME`                                                   AS `NAME`,
                       `product`.`shortdescription`                                       AS `shortdescription`,
                       `product`.`fulldescription`                                        AS `fulldescription`,
                       `product`.`admincomment`                                           AS `admincomment`,
                       `product`.`producttemplateid`                                      AS `producttemplateid`,
                       `product`.`vendorid`                                               AS `vendorid`,
                       `product`.`showonhomepage`                                         AS `showonhomepage`,
                       `product`.`metakeywords`                                           AS `metakeywords`,
                       `product`.`metadescription`                                        AS `metadescription`,
                       `product`.`metatitle`                                              AS `metatitle`,
                       `product`.`allowcustomerreviews`                                   AS `allowcustomerreviews`,
                       `product`.`approvedratingsum`                                      AS `approvedratingsum`,
                       `product`.`notapprovedratingsum`                                   AS `notapprovedratingsum`,
                       `product`.`approvedtotalreviews`                                   AS `approvedtotalreviews`,
                       `product`.`notapprovedtotalreviews`                                AS `notapprovedtotalreviews`,
                       `product`.`subjecttoacl`                                           AS `subjecttoacl`,
                       `product`.`limitedtostores`                                        AS `limitedtostores`,
                       `product`.`sku`                                                    AS `sku`,
                       `product`.`manufacturerpartnumber`                                 AS `manufacturerpartnumber`,
                       `product`.`gtin`                                                   AS `gtin`,
                       `product`.`isgiftcard`                                             AS `isgiftcard`,
                       `product`.`giftcardtypeid`                                         AS `giftcardtypeid`,
                       `product`.`overriddengiftcardamount`                               AS `overriddengiftcardamount`,
                       `product`.`requireotherproducts`                                   AS `requireotherproducts`,
                       `product`.`requiredproductids`                                     AS `requiredproductids`,
                       `product`.`automaticallyaddrequiredproducts`                       AS `automaticallyaddrequiredproducts`,
                       `product`.`isdownload`                                             AS `isdownload`,
                       `product`.`downloadid`                                             AS `downloadid`,
                       `product`.`unlimiteddownloads`                                     AS `unlimiteddownloads`,
                       `product`.`maxnumberofdownloads`                                   AS `maxnumberofdownloads`,
                       `product`.`downloadexpirationdays`                                 AS `downloadexpirationdays`,
                       `product`.`downloadactivationtypeid`                               AS `downloadactivationtypeid`,
                       `product`.`hassampledownload`                                      AS `hassampledownload`,
                       `product`.`sampledownloadid`                                       AS `sampledownloadid`,
                       `product`.`hasuseragreement`                                       AS `hasuseragreement`,
                       `product`.`useragreementtext`                                      AS `useragreementtext`,
                       `product`.`isrecurring`                                            AS `isrecurring`,
                       `product`.`recurringcyclelength`                                   AS `recurringcyclelength`,
                       `product`.`recurringcycleperiodid`                                 AS `recurringcycleperiodid`,
                       `product`.`recurringtotalcycles`                                   AS `recurringtotalcycles`,
                       `product`.`isrental`                                               AS `isrental`,
                       `product`.`rentalpricelength`                                      AS `rentalpricelength`,
                       `product`.`rentalpriceperiodid`                                    AS `rentalpriceperiodid`,
                       `product`.`isshipenabled`                                          AS `isshipenabled`,
                       `product`.`isfreeshipping`                                         AS `isfreeshipping`,
                       `product`.`shipseparately`                                         AS `shipseparately`,
                       `product`.`additionalshippingcharge`                               AS `additionalshippingcharge`,
                       `product`.`deliverydateid`                                         AS `deliverydateid`,
                       `product`.`istaxexempt`                                            AS `istaxexempt`,
                       `product`.`taxcategoryid`                                          AS `taxcategoryid`,
                       `product`.`istelecommunicationsorbroadcastingorelectronicservices` AS `istelecommunicationsorbroadcastingorelectronicservices`,
                       `product`.`manageinventorymethodid`                                AS `manageinventorymethodid`,
                       `product`.`productavailabilityrangeid`                             AS `productavailabilityrangeid`,
                       `product`.`usemultiplewarehouses`                                  AS `usemultiplewarehouses`,
                       `product`.`warehouseid`                                            AS `warehouseid`,
                       `product`.`stockquantity`                                          AS `stockquantity`,
                       `product`.`displaystockavailability`                               AS `displaystockavailability`,
                       `product`.`displaystockquantity`                                   AS `displaystockquantity`,
                       `product`.`minstockquantity`                                       AS `minstockquantity`,
                       `product`.`lowstockactivityid`                                     AS `lowstockactivityid`,
                       `product`.`notifyadminforquantitybelow`                            AS `notifyadminforquantitybelow`,
                       `product`.`backordermodeid`                                        AS `backordermodeid`,
                       `product`.`allowbackinstocksubscriptions`                          AS `allowbackinstocksubscriptions`,
                       `product`.`orderminimumquantity`                                   AS `orderminimumquantity`,
                       `product`.`ordermaximumquantity`                                   AS `ordermaximumquantity`,
                       `product`.`allowedquantities`                                      AS `allowedquantities`,
                       `product`.`allowaddingonlyexistingattributecombinations`           AS `allowaddingonlyexistingattributecombinations`,
                       `product`.`notreturnable`                                          AS `notreturnable`,
                       `product`.`disablebuybutton`                                       AS `disablebuybutton`,
                       `product`.`disablewishlistbutton`                                  AS `disablewishlistbutton`,
                       `product`.`availableforpreorder`                                   AS `availableforpreorder`,
                       `product`.`preorderavailabilitystartdatetimeutc`                   AS `preorderavailabilitystartdatetimeutc`,
                       `product`.`callforprice`                                           AS `callforprice`,
                       `product`.`price`                                                  AS `price`,
                       `product`.`oldprice`                                               AS `oldprice`,
                       `product`.`productcost`                                            AS `productcost`,
                       `product`.`customerentersprice`                                    AS `customerentersprice`,
                       `product`.`minimumcustomerenteredprice`                            AS `minimumcustomerenteredprice`,
                       `product`.`maximumcustomerenteredprice`                            AS `maximumcustomerenteredprice`,
                       `product`.`basepriceenabled`                                       AS `basepriceenabled`,
                       `product`.`basepriceamount`                                        AS `basepriceamount`,
                       `product`.`basepriceunitid`                                        AS `basepriceunitid`,
                       `product`.`basepricebaseamount`                                    AS `basepricebaseamount`,
                       `product`.`basepricebaseunitid`                                    AS `basepricebaseunitid`,
                       `product`.`markasnew`                                              AS `markasnew`,
                       `product`.`markasnewstartdatetimeutc`                              AS `markasnewstartdatetimeutc`,
                       `product`.`markasnewenddatetimeutc`                                AS `markasnewenddatetimeutc`,
                       `product`.`hastierprices`                                          AS `hastierprices`,
                       `product`.`hasdiscountsapplied`                                    AS `hasdiscountsapplied`,
                       `product`.`weight`                                                 AS `weight`,
                       `product`.`length`                                                 AS `length`,
                       `product`.`width`                                                  AS `width`,
                       `product`.`height`                                                 AS `height`,
                       `product`.`availablestartdatetimeutc`                              AS `availablestartdatetimeutc`,
                       `product`.`availableenddatetimeutc`                                AS `availableenddatetimeutc`,
                       `product`.`displayorder`                                           AS `displayorder`,
                       `product`.`published`                                              AS `published`,
                       `product`.`deleted`                                                AS `deleted`,
                       `product`.`createdonutc`                                           AS `createdonutc`,
                       `product`.`updatedonutc`                                           AS `updatedonutc`,
                       `product`.`mf`                                                     AS `mf`,
                       `product`.`mfadet`                                                 AS `mfadet`,
                       `product`.`mfadetfazla`                                            AS `mfadetfazla`,
                       `product`.`miad`                                                   AS `miad`,
                       `product`.`miaddate`                                               AS `miaddate`,
                       `product`.`kamuodenen`                                             AS `kamuodenen`,
                       `product`.`fiyatfarki`                                             AS `fiyatfarki`
                FROM   `product`
                WHERE  ((
                                     `product`.`producttypeid` = 5)
                       AND    (
                                     `product`.`parentgroupedproductid` <> 0)
                       AND    (
                                     0 <> `product`.`published`)
                       AND    (
                                     0 = `product`.`deleted`))) `p2`
ON      ((
                           `p`.`id` = `p2`.`parentgroupedproductid`)))
JOIN     `orderitem` `oi`
ON      ((
                           `p2`.`id` = `oi`.`productid`)))
JOIN
         (
                SELECT `ORDER`.`id`                                      AS `id`,
                       `ORDER`.`orderguid`                               AS `orderguid`,
                       `ORDER`.`storeid`                                 AS `storeid`,
                       `ORDER`.`customerid`                              AS `customerid`,
                       `ORDER`.`billingaddressid`                        AS `billingaddressid`,
                       `ORDER`.`shippingaddressid`                       AS `shippingaddressid`,
                       `ORDER`.`pickupaddressid`                         AS `pickupaddressid`,
                       `ORDER`.`pickupinstore`                           AS `pickupinstore`,
                       `ORDER`.`orderstatusid`                           AS `orderstatusid`,
                       `ORDER`.`shippingstatusid`                        AS `shippingstatusid`,
                       `ORDER`.`paymentstatusid`                         AS `paymentstatusid`,
                       `ORDER`.`paymentmethodsystemname`                 AS `paymentmethodsystemname`,
                       `ORDER`.`customercurrencycode`                    AS `customercurrencycode`,
                       `ORDER`.`currencyrate`                            AS `currencyrate`,
                       `ORDER`.`customertaxdisplaytypeid`                AS `customertaxdisplaytypeid`,
                       `ORDER`.`vatnumber`                               AS `vatnumber`,
                       `ORDER`.`ordersubtotalincltax`                    AS `ordersubtotalincltax`,
                       `ORDER`.`ordersubtotalexcltax`                    AS `ordersubtotalexcltax`,
                       `ORDER`.`ordersubtotaldiscountincltax`            AS `ordersubtotaldiscountincltax`,
                       `ORDER`.`ordersubtotaldiscountexcltax`            AS `ordersubtotaldiscountexcltax`,
                       `ORDER`.`ordershippingincltax`                    AS `ordershippingincltax`,
                       `ORDER`.`ordershippingexcltax`                    AS `ordershippingexcltax`,
                       `ORDER`.`paymentmethodadditionalfeeincltax`       AS `paymentmethodadditionalfeeincltax`,
                       `ORDER`.`paymentmethodadditionalfeeexcltax`       AS `paymentmethodadditionalfeeexcltax`,
                       `ORDER`.`taxrates`                                AS `taxrates`,
                       `ORDER`.`ordertax`                                AS `ordertax`,
                       `ORDER`.`orderdiscount`                           AS `orderdiscount`,
                       `ORDER`.`ordertotal`                              AS `ordertotal`,
                       `ORDER`.`refundedamount`                          AS `refundedamount`,
                       `ORDER`.`rewardpointshistoryentryid`              AS `rewardpointshistoryentryid`,
                       `ORDER`.`checkoutattributedescription`            AS `checkoutattributedescription`,
                       `ORDER`.`checkoutattributesxml`                   AS `checkoutattributesxml`,
                       `ORDER`.`customerlanguageid`                      AS `customerlanguageid`,
                       `ORDER`.`affiliateid`                             AS `affiliateid`,
                       `ORDER`.`customerip`                              AS `customerip`,
                       `ORDER`.`allowstoringcreditcardnumber`            AS `allowstoringcreditcardnumber`,
                       `ORDER`.`cardtype`                                AS `cardtype`,
                       `ORDER`.`cardname`                                AS `cardname`,
                       `ORDER`.`cardnumber`                              AS `cardnumber`,
                       `ORDER`.`maskedcreditcardnumber`                  AS `maskedcreditcardnumber`,
                       `ORDER`.`cardcvv2`                                AS `cardcvv2`,
                       `ORDER`.`cardexpirationmonth`                     AS `cardexpirationmonth`,
                       `ORDER`.`cardexpirationyear`                      AS `cardexpirationyear`,
                       `ORDER`.`authorizationtransactionid`              AS `authorizationtransactionid`,
                       `ORDER`.`authorizationtransactioncode`            AS `authorizationtransactioncode`,
                       `ORDER`.`authorizationtransactionresult`          AS `authorizationtransactionresult`,
                       `ORDER`.`capturetransactionid`                    AS `capturetransactionid`,
                       `ORDER`.`capturetransactionresult`                AS `capturetransactionresult`,
                       `ORDER`.`subscriptiontransactionid`               AS `subscriptiontransactionid`,
                       `ORDER`.`paiddateutc`                             AS `paiddateutc`,
                       `ORDER`.`shippingmethod`                          AS `shippingmethod`,
                       `ORDER`.`shippingratecomputationmethodsystemname` AS `shippingratecomputationmethodsystemname`,
                       `ORDER`.`customvaluesxml`                         AS `customvaluesxml`,
                       `ORDER`.`deleted`                                 AS `deleted`,
                       `ORDER`.`createdonutc`                            AS `createdonutc`,
                       `ORDER`.`customordernumber`                       AS `customordernumber`,
                       `ORDER`.`redeemedrewardpointsentryid`             AS `redeemedrewardpointsentryid`
                FROM   `ORDER`
                WHERE  ((
                                     `ORDER`.`orderstatusid` <> 40)
                       AND    (
                                     `ORDER`.`paymentstatusid` <> 20)
                       AND    (
                                     0 = `ORDER`.`deleted`))) `o`
ON      ((
                           `oi`.`orderid` = `o`.`id`)))
WHERE    ((
                           `p`.`producttypeid` = 10)
         AND      (
                           `p`.`parentgroupedproductid` = 0)
         AND      (
                           0 <> `p`.`published`)
         AND      (
                           0 = `p`.`deleted`)
         AND      (
                           0 = `o`.`deleted`)
         AND      (
                           `o`.`createdonutc` >= '2020-10-24')
         AND      (
                           `c`.`NAME` = 'Kişisel Bakım'))
GROUP BY `baslangic`
ORDER BY `o`.`createdonutc` */;


--##################
VIEW `loginyapmamis` ASSELECT   date_format((`c`.`createdonutc` + Interval ((1 - Dayofweek(`c`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `baslangic`,
         date_format((`c`.`createdonutc` + interval ((7 - dayofweek(`c`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `bitis`,
         sum(count(0)) OVER (ORDER BY `c`.`createdonutc` )                                                     AS `loginolmamislar`
FROM     `customer` `c`
WHERE    ((
                           `c`.`deleted` = 0)
         AND      (
                           `c`.`createdonutc` >= '2020-10-24')
         AND      (
                           `c`.`active` = 1)
         AND      `c`.`id` IN
                  (
                         SELECT `customer`.`id`
                         FROM   `customer`
                         WHERE  ((
                                              `customer`.`id` >= 1078412)
                                AND    (
                                              `customer`.`id` <= 1078648))) IS false
         AND      (
                           `c`.`email` IS NOT NULL)
         AND      (
                           `c`.`email` <> '')
         AND      (
                           `c`.`vendorid` = 0))
GROUP BY `baslangic`
ORDER BY `c`.`createdonutc` */;


--##################
VIEW `medikal` ASSELECT   date_format((`o`.`createdonutc` + Interval ((1 - Dayofweek(`o`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `baslangic`,
         date_format((`o`.`createdonutc` + interval ((7 - dayofweek(`o`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `bitis`,
         `c`.`NAME`                                                                                            AS `name4`,
         count(DISTINCT `p`.`id`)                                                                              AS `ilansayisi4`,
         sum(`oi`.`quantity`)                                                                                  AS `satismiktari4`,
         sum(`oi`.`priceincltax`)                                                                              AS `satistutari4`
FROM     ((((((`allcategoriesbyparent` `mc`
JOIN     `category` `c`
ON      ((
                           `mc`.`maincategoryid` = `c`.`id`)))
JOIN     `product_category_mapping` `pcm`
ON      ((
                           find_in_set(`pcm`.`categoryid`,`mc`.`ids`) > 0)))
JOIN     `product` `p`
ON      ((
                           `pcm`.`productid` = `p`.`id`)))
JOIN
         (
                SELECT `product`.`id`                                                     AS `id`,
                       `product`.`producttypeid`                                          AS `producttypeid`,
                       `product`.`parentgroupedproductid`                                 AS `parentgroupedproductid`,
                       `product`.`visibleindividually`                                    AS `visibleindividually`,
                       `product`.`NAME`                                                   AS `NAME`,
                       `product`.`shortdescription`                                       AS `shortdescription`,
                       `product`.`fulldescription`                                        AS `fulldescription`,
                       `product`.`admincomment`                                           AS `admincomment`,
                       `product`.`producttemplateid`                                      AS `producttemplateid`,
                       `product`.`vendorid`                                               AS `vendorid`,
                       `product`.`showonhomepage`                                         AS `showonhomepage`,
                       `product`.`metakeywords`                                           AS `metakeywords`,
                       `product`.`metadescription`                                        AS `metadescription`,
                       `product`.`metatitle`                                              AS `metatitle`,
                       `product`.`allowcustomerreviews`                                   AS `allowcustomerreviews`,
                       `product`.`approvedratingsum`                                      AS `approvedratingsum`,
                       `product`.`notapprovedratingsum`                                   AS `notapprovedratingsum`,
                       `product`.`approvedtotalreviews`                                   AS `approvedtotalreviews`,
                       `product`.`notapprovedtotalreviews`                                AS `notapprovedtotalreviews`,
                       `product`.`subjecttoacl`                                           AS `subjecttoacl`,
                       `product`.`limitedtostores`                                        AS `limitedtostores`,
                       `product`.`sku`                                                    AS `sku`,
                       `product`.`manufacturerpartnumber`                                 AS `manufacturerpartnumber`,
                       `product`.`gtin`                                                   AS `gtin`,
                       `product`.`isgiftcard`                                             AS `isgiftcard`,
                       `product`.`giftcardtypeid`                                         AS `giftcardtypeid`,
                       `product`.`overriddengiftcardamount`                               AS `overriddengiftcardamount`,
                       `product`.`requireotherproducts`                                   AS `requireotherproducts`,
                       `product`.`requiredproductids`                                     AS `requiredproductids`,
                       `product`.`automaticallyaddrequiredproducts`                       AS `automaticallyaddrequiredproducts`,
                       `product`.`isdownload`                                             AS `isdownload`,
                       `product`.`downloadid`                                             AS `downloadid`,
                       `product`.`unlimiteddownloads`                                     AS `unlimiteddownloads`,
                       `product`.`maxnumberofdownloads`                                   AS `maxnumberofdownloads`,
                       `product`.`downloadexpirationdays`                                 AS `downloadexpirationdays`,
                       `product`.`downloadactivationtypeid`                               AS `downloadactivationtypeid`,
                       `product`.`hassampledownload`                                      AS `hassampledownload`,
                       `product`.`sampledownloadid`                                       AS `sampledownloadid`,
                       `product`.`hasuseragreement`                                       AS `hasuseragreement`,
                       `product`.`useragreementtext`                                      AS `useragreementtext`,
                       `product`.`isrecurring`                                            AS `isrecurring`,
                       `product`.`recurringcyclelength`                                   AS `recurringcyclelength`,
                       `product`.`recurringcycleperiodid`                                 AS `recurringcycleperiodid`,
                       `product`.`recurringtotalcycles`                                   AS `recurringtotalcycles`,
                       `product`.`isrental`                                               AS `isrental`,
                       `product`.`rentalpricelength`                                      AS `rentalpricelength`,
                       `product`.`rentalpriceperiodid`                                    AS `rentalpriceperiodid`,
                       `product`.`isshipenabled`                                          AS `isshipenabled`,
                       `product`.`isfreeshipping`                                         AS `isfreeshipping`,
                       `product`.`shipseparately`                                         AS `shipseparately`,
                       `product`.`additionalshippingcharge`                               AS `additionalshippingcharge`,
                       `product`.`deliverydateid`                                         AS `deliverydateid`,
                       `product`.`istaxexempt`                                            AS `istaxexempt`,
                       `product`.`taxcategoryid`                                          AS `taxcategoryid`,
                       `product`.`istelecommunicationsorbroadcastingorelectronicservices` AS `istelecommunicationsorbroadcastingorelectronicservices`,
                       `product`.`manageinventorymethodid`                                AS `manageinventorymethodid`,
                       `product`.`productavailabilityrangeid`                             AS `productavailabilityrangeid`,
                       `product`.`usemultiplewarehouses`                                  AS `usemultiplewarehouses`,
                       `product`.`warehouseid`                                            AS `warehouseid`,
                       `product`.`stockquantity`                                          AS `stockquantity`,
                       `product`.`displaystockavailability`                               AS `displaystockavailability`,
                       `product`.`displaystockquantity`                                   AS `displaystockquantity`,
                       `product`.`minstockquantity`                                       AS `minstockquantity`,
                       `product`.`lowstockactivityid`                                     AS `lowstockactivityid`,
                       `product`.`notifyadminforquantitybelow`                            AS `notifyadminforquantitybelow`,
                       `product`.`backordermodeid`                                        AS `backordermodeid`,
                       `product`.`allowbackinstocksubscriptions`                          AS `allowbackinstocksubscriptions`,
                       `product`.`orderminimumquantity`                                   AS `orderminimumquantity`,
                       `product`.`ordermaximumquantity`                                   AS `ordermaximumquantity`,
                       `product`.`allowedquantities`                                      AS `allowedquantities`,
                       `product`.`allowaddingonlyexistingattributecombinations`           AS `allowaddingonlyexistingattributecombinations`,
                       `product`.`notreturnable`                                          AS `notreturnable`,
                       `product`.`disablebuybutton`                                       AS `disablebuybutton`,
                       `product`.`disablewishlistbutton`                                  AS `disablewishlistbutton`,
                       `product`.`availableforpreorder`                                   AS `availableforpreorder`,
                       `product`.`preorderavailabilitystartdatetimeutc`                   AS `preorderavailabilitystartdatetimeutc`,
                       `product`.`callforprice`                                           AS `callforprice`,
                       `product`.`price`                                                  AS `price`,
                       `product`.`oldprice`                                               AS `oldprice`,
                       `product`.`productcost`                                            AS `productcost`,
                       `product`.`customerentersprice`                                    AS `customerentersprice`,
                       `product`.`minimumcustomerenteredprice`                            AS `minimumcustomerenteredprice`,
                       `product`.`maximumcustomerenteredprice`                            AS `maximumcustomerenteredprice`,
                       `product`.`basepriceenabled`                                       AS `basepriceenabled`,
                       `product`.`basepriceamount`                                        AS `basepriceamount`,
                       `product`.`basepriceunitid`                                        AS `basepriceunitid`,
                       `product`.`basepricebaseamount`                                    AS `basepricebaseamount`,
                       `product`.`basepricebaseunitid`                                    AS `basepricebaseunitid`,
                       `product`.`markasnew`                                              AS `markasnew`,
                       `product`.`markasnewstartdatetimeutc`                              AS `markasnewstartdatetimeutc`,
                       `product`.`markasnewenddatetimeutc`                                AS `markasnewenddatetimeutc`,
                       `product`.`hastierprices`                                          AS `hastierprices`,
                       `product`.`hasdiscountsapplied`                                    AS `hasdiscountsapplied`,
                       `product`.`weight`                                                 AS `weight`,
                       `product`.`length`                                                 AS `length`,
                       `product`.`width`                                                  AS `width`,
                       `product`.`height`                                                 AS `height`,
                       `product`.`availablestartdatetimeutc`                              AS `availablestartdatetimeutc`,
                       `product`.`availableenddatetimeutc`                                AS `availableenddatetimeutc`,
                       `product`.`displayorder`                                           AS `displayorder`,
                       `product`.`published`                                              AS `published`,
                       `product`.`deleted`                                                AS `deleted`,
                       `product`.`createdonutc`                                           AS `createdonutc`,
                       `product`.`updatedonutc`                                           AS `updatedonutc`,
                       `product`.`mf`                                                     AS `mf`,
                       `product`.`mfadet`                                                 AS `mfadet`,
                       `product`.`mfadetfazla`                                            AS `mfadetfazla`,
                       `product`.`miad`                                                   AS `miad`,
                       `product`.`miaddate`                                               AS `miaddate`,
                       `product`.`kamuodenen`                                             AS `kamuodenen`,
                       `product`.`fiyatfarki`                                             AS `fiyatfarki`
                FROM   `product`
                WHERE  ((
                                     `product`.`producttypeid` = 5)
                       AND    (
                                     `product`.`parentgroupedproductid` <> 0)
                       AND    (
                                     0 <> `product`.`published`)
                       AND    (
                                     0 = `product`.`deleted`))) `p2`
ON      ((
                           `p`.`id` = `p2`.`parentgroupedproductid`)))
JOIN     `orderitem` `oi`
ON      ((
                           `p2`.`id` = `oi`.`productid`)))
JOIN
         (
                SELECT `ORDER`.`id`                                      AS `id`,
                       `ORDER`.`orderguid`                               AS `orderguid`,
                       `ORDER`.`storeid`                                 AS `storeid`,
                       `ORDER`.`customerid`                              AS `customerid`,
                       `ORDER`.`billingaddressid`                        AS `billingaddressid`,
                       `ORDER`.`shippingaddressid`                       AS `shippingaddressid`,
                       `ORDER`.`pickupaddressid`                         AS `pickupaddressid`,
                       `ORDER`.`pickupinstore`                           AS `pickupinstore`,
                       `ORDER`.`orderstatusid`                           AS `orderstatusid`,
                       `ORDER`.`shippingstatusid`                        AS `shippingstatusid`,
                       `ORDER`.`paymentstatusid`                         AS `paymentstatusid`,
                       `ORDER`.`paymentmethodsystemname`                 AS `paymentmethodsystemname`,
                       `ORDER`.`customercurrencycode`                    AS `customercurrencycode`,
                       `ORDER`.`currencyrate`                            AS `currencyrate`,
                       `ORDER`.`customertaxdisplaytypeid`                AS `customertaxdisplaytypeid`,
                       `ORDER`.`vatnumber`                               AS `vatnumber`,
                       `ORDER`.`ordersubtotalincltax`                    AS `ordersubtotalincltax`,
                       `ORDER`.`ordersubtotalexcltax`                    AS `ordersubtotalexcltax`,
                       `ORDER`.`ordersubtotaldiscountincltax`            AS `ordersubtotaldiscountincltax`,
                       `ORDER`.`ordersubtotaldiscountexcltax`            AS `ordersubtotaldiscountexcltax`,
                       `ORDER`.`ordershippingincltax`                    AS `ordershippingincltax`,
                       `ORDER`.`ordershippingexcltax`                    AS `ordershippingexcltax`,
                       `ORDER`.`paymentmethodadditionalfeeincltax`       AS `paymentmethodadditionalfeeincltax`,
                       `ORDER`.`paymentmethodadditionalfeeexcltax`       AS `paymentmethodadditionalfeeexcltax`,
                       `ORDER`.`taxrates`                                AS `taxrates`,
                       `ORDER`.`ordertax`                                AS `ordertax`,
                       `ORDER`.`orderdiscount`                           AS `orderdiscount`,
                       `ORDER`.`ordertotal`                              AS `ordertotal`,
                       `ORDER`.`refundedamount`                          AS `refundedamount`,
                       `ORDER`.`rewardpointshistoryentryid`              AS `rewardpointshistoryentryid`,
                       `ORDER`.`checkoutattributedescription`            AS `checkoutattributedescription`,
                       `ORDER`.`checkoutattributesxml`                   AS `checkoutattributesxml`,
                       `ORDER`.`customerlanguageid`                      AS `customerlanguageid`,
                       `ORDER`.`affiliateid`                             AS `affiliateid`,
                       `ORDER`.`customerip`                              AS `customerip`,
                       `ORDER`.`allowstoringcreditcardnumber`            AS `allowstoringcreditcardnumber`,
                       `ORDER`.`cardtype`                                AS `cardtype`,
                       `ORDER`.`cardname`                                AS `cardname`,
                       `ORDER`.`cardnumber`                              AS `cardnumber`,
                       `ORDER`.`maskedcreditcardnumber`                  AS `maskedcreditcardnumber`,
                       `ORDER`.`cardcvv2`                                AS `cardcvv2`,
                       `ORDER`.`cardexpirationmonth`                     AS `cardexpirationmonth`,
                       `ORDER`.`cardexpirationyear`                      AS `cardexpirationyear`,
                       `ORDER`.`authorizationtransactionid`              AS `authorizationtransactionid`,
                       `ORDER`.`authorizationtransactioncode`            AS `authorizationtransactioncode`,
                       `ORDER`.`authorizationtransactionresult`          AS `authorizationtransactionresult`,
                       `ORDER`.`capturetransactionid`                    AS `capturetransactionid`,
                       `ORDER`.`capturetransactionresult`                AS `capturetransactionresult`,
                       `ORDER`.`subscriptiontransactionid`               AS `subscriptiontransactionid`,
                       `ORDER`.`paiddateutc`                             AS `paiddateutc`,
                       `ORDER`.`shippingmethod`                          AS `shippingmethod`,
                       `ORDER`.`shippingratecomputationmethodsystemname` AS `shippingratecomputationmethodsystemname`,
                       `ORDER`.`customvaluesxml`                         AS `customvaluesxml`,
                       `ORDER`.`deleted`                                 AS `deleted`,
                       `ORDER`.`createdonutc`                            AS `createdonutc`,
                       `ORDER`.`customordernumber`                       AS `customordernumber`,
                       `ORDER`.`redeemedrewardpointsentryid`             AS `redeemedrewardpointsentryid`
                FROM   `ORDER`
                WHERE  ((
                                     `ORDER`.`orderstatusid` <> 40)
                       AND    (
                                     `ORDER`.`paymentstatusid` <> 20)
                       AND    (
                                     0 = `ORDER`.`deleted`))) `o`
ON      ((
                           `oi`.`orderid` = `o`.`id`)))
WHERE    ((
                           `p`.`producttypeid` = 10)
         AND      (
                           `p`.`parentgroupedproductid` = 0)
         AND      (
                           0 <> `p`.`published`)
         AND      (
                           0 = `p`.`deleted`)
         AND      (
                           0 = `o`.`deleted`)
         AND      (
                           `o`.`createdonutc` >= '2020-10-24')
         AND      (
                           `c`.`NAME` = 'Medikal'))
GROUP BY `baslangic`
ORDER BY `o`.`createdonutc` */;


--##################
VIEW `receteliilac` ASSELECT   date_format((`o`.`createdonutc` + Interval ((1 - Dayofweek(`o`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `baslangic`,
         date_format((`o`.`createdonutc` + interval ((7 - dayofweek(`o`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `bitis`,
         `c`.`NAME`                                                                                            AS `name1`,
         count(DISTINCT `p`.`id`)                                                                              AS `ilansayisi1`,
         sum(`oi`.`quantity`)                                                                                  AS `satismiktari1`,
         sum(`oi`.`priceincltax`)                                                                              AS `satistutari1`
FROM     ((((((`allcategoriesbyparent` `mc`
JOIN     `category` `c`
ON      ((
                           `mc`.`maincategoryid` = `c`.`id`)))
JOIN     `product_category_mapping` `pcm`
ON      ((
                           find_in_set(`pcm`.`categoryid`,`mc`.`ids`) > 0)))
JOIN     `product` `p`
ON      ((
                           `pcm`.`productid` = `p`.`id`)))
JOIN
         (
                SELECT `product`.`id`                                                     AS `id`,
                       `product`.`producttypeid`                                          AS `producttypeid`,
                       `product`.`parentgroupedproductid`                                 AS `parentgroupedproductid`,
                       `product`.`visibleindividually`                                    AS `visibleindividually`,
                       `product`.`NAME`                                                   AS `NAME`,
                       `product`.`shortdescription`                                       AS `shortdescription`,
                       `product`.`fulldescription`                                        AS `fulldescription`,
                       `product`.`admincomment`                                           AS `admincomment`,
                       `product`.`producttemplateid`                                      AS `producttemplateid`,
                       `product`.`vendorid`                                               AS `vendorid`,
                       `product`.`showonhomepage`                                         AS `showonhomepage`,
                       `product`.`metakeywords`                                           AS `metakeywords`,
                       `product`.`metadescription`                                        AS `metadescription`,
                       `product`.`metatitle`                                              AS `metatitle`,
                       `product`.`allowcustomerreviews`                                   AS `allowcustomerreviews`,
                       `product`.`approvedratingsum`                                      AS `approvedratingsum`,
                       `product`.`notapprovedratingsum`                                   AS `notapprovedratingsum`,
                       `product`.`approvedtotalreviews`                                   AS `approvedtotalreviews`,
                       `product`.`notapprovedtotalreviews`                                AS `notapprovedtotalreviews`,
                       `product`.`subjecttoacl`                                           AS `subjecttoacl`,
                       `product`.`limitedtostores`                                        AS `limitedtostores`,
                       `product`.`sku`                                                    AS `sku`,
                       `product`.`manufacturerpartnumber`                                 AS `manufacturerpartnumber`,
                       `product`.`gtin`                                                   AS `gtin`,
                       `product`.`isgiftcard`                                             AS `isgiftcard`,
                       `product`.`giftcardtypeid`                                         AS `giftcardtypeid`,
                       `product`.`overriddengiftcardamount`                               AS `overriddengiftcardamount`,
                       `product`.`requireotherproducts`                                   AS `requireotherproducts`,
                       `product`.`requiredproductids`                                     AS `requiredproductids`,
                       `product`.`automaticallyaddrequiredproducts`                       AS `automaticallyaddrequiredproducts`,
                       `product`.`isdownload`                                             AS `isdownload`,
                       `product`.`downloadid`                                             AS `downloadid`,
                       `product`.`unlimiteddownloads`                                     AS `unlimiteddownloads`,
                       `product`.`maxnumberofdownloads`                                   AS `maxnumberofdownloads`,
                       `product`.`downloadexpirationdays`                                 AS `downloadexpirationdays`,
                       `product`.`downloadactivationtypeid`                               AS `downloadactivationtypeid`,
                       `product`.`hassampledownload`                                      AS `hassampledownload`,
                       `product`.`sampledownloadid`                                       AS `sampledownloadid`,
                       `product`.`hasuseragreement`                                       AS `hasuseragreement`,
                       `product`.`useragreementtext`                                      AS `useragreementtext`,
                       `product`.`isrecurring`                                            AS `isrecurring`,
                       `product`.`recurringcyclelength`                                   AS `recurringcyclelength`,
                       `product`.`recurringcycleperiodid`                                 AS `recurringcycleperiodid`,
                       `product`.`recurringtotalcycles`                                   AS `recurringtotalcycles`,
                       `product`.`isrental`                                               AS `isrental`,
                       `product`.`rentalpricelength`                                      AS `rentalpricelength`,
                       `product`.`rentalpriceperiodid`                                    AS `rentalpriceperiodid`,
                       `product`.`isshipenabled`                                          AS `isshipenabled`,
                       `product`.`isfreeshipping`                                         AS `isfreeshipping`,
                       `product`.`shipseparately`                                         AS `shipseparately`,
                       `product`.`additionalshippingcharge`                               AS `additionalshippingcharge`,
                       `product`.`deliverydateid`                                         AS `deliverydateid`,
                       `product`.`istaxexempt`                                            AS `istaxexempt`,
                       `product`.`taxcategoryid`                                          AS `taxcategoryid`,
                       `product`.`istelecommunicationsorbroadcastingorelectronicservices` AS `istelecommunicationsorbroadcastingorelectronicservices`,
                       `product`.`manageinventorymethodid`                                AS `manageinventorymethodid`,
                       `product`.`productavailabilityrangeid`                             AS `productavailabilityrangeid`,
                       `product`.`usemultiplewarehouses`                                  AS `usemultiplewarehouses`,
                       `product`.`warehouseid`                                            AS `warehouseid`,
                       `product`.`stockquantity`                                          AS `stockquantity`,
                       `product`.`displaystockavailability`                               AS `displaystockavailability`,
                       `product`.`displaystockquantity`                                   AS `displaystockquantity`,
                       `product`.`minstockquantity`                                       AS `minstockquantity`,
                       `product`.`lowstockactivityid`                                     AS `lowstockactivityid`,
                       `product`.`notifyadminforquantitybelow`                            AS `notifyadminforquantitybelow`,
                       `product`.`backordermodeid`                                        AS `backordermodeid`,
                       `product`.`allowbackinstocksubscriptions`                          AS `allowbackinstocksubscriptions`,
                       `product`.`orderminimumquantity`                                   AS `orderminimumquantity`,
                       `product`.`ordermaximumquantity`                                   AS `ordermaximumquantity`,
                       `product`.`allowedquantities`                                      AS `allowedquantities`,
                       `product`.`allowaddingonlyexistingattributecombinations`           AS `allowaddingonlyexistingattributecombinations`,
                       `product`.`notreturnable`                                          AS `notreturnable`,
                       `product`.`disablebuybutton`                                       AS `disablebuybutton`,
                       `product`.`disablewishlistbutton`                                  AS `disablewishlistbutton`,
                       `product`.`availableforpreorder`                                   AS `availableforpreorder`,
                       `product`.`preorderavailabilitystartdatetimeutc`                   AS `preorderavailabilitystartdatetimeutc`,
                       `product`.`callforprice`                                           AS `callforprice`,
                       `product`.`price`                                                  AS `price`,
                       `product`.`oldprice`                                               AS `oldprice`,
                       `product`.`productcost`                                            AS `productcost`,
                       `product`.`customerentersprice`                                    AS `customerentersprice`,
                       `product`.`minimumcustomerenteredprice`                            AS `minimumcustomerenteredprice`,
                       `product`.`maximumcustomerenteredprice`                            AS `maximumcustomerenteredprice`,
                       `product`.`basepriceenabled`                                       AS `basepriceenabled`,
                       `product`.`basepriceamount`                                        AS `basepriceamount`,
                       `product`.`basepriceunitid`                                        AS `basepriceunitid`,
                       `product`.`basepricebaseamount`                                    AS `basepricebaseamount`,
                       `product`.`basepricebaseunitid`                                    AS `basepricebaseunitid`,
                       `product`.`markasnew`                                              AS `markasnew`,
                       `product`.`markasnewstartdatetimeutc`                              AS `markasnewstartdatetimeutc`,
                       `product`.`markasnewenddatetimeutc`                                AS `markasnewenddatetimeutc`,
                       `product`.`hastierprices`                                          AS `hastierprices`,
                       `product`.`hasdiscountsapplied`                                    AS `hasdiscountsapplied`,
                       `product`.`weight`                                                 AS `weight`,
                       `product`.`length`                                                 AS `length`,
                       `product`.`width`                                                  AS `width`,
                       `product`.`height`                                                 AS `height`,
                       `product`.`availablestartdatetimeutc`                              AS `availablestartdatetimeutc`,
                       `product`.`availableenddatetimeutc`                                AS `availableenddatetimeutc`,
                       `product`.`displayorder`                                           AS `displayorder`,
                       `product`.`published`                                              AS `published`,
                       `product`.`deleted`                                                AS `deleted`,
                       `product`.`createdonutc`                                           AS `createdonutc`,
                       `product`.`updatedonutc`                                           AS `updatedonutc`,
                       `product`.`mf`                                                     AS `mf`,
                       `product`.`mfadet`                                                 AS `mfadet`,
                       `product`.`mfadetfazla`                                            AS `mfadetfazla`,
                       `product`.`miad`                                                   AS `miad`,
                       `product`.`miaddate`                                               AS `miaddate`,
                       `product`.`kamuodenen`                                             AS `kamuodenen`,
                       `product`.`fiyatfarki`                                             AS `fiyatfarki`
                FROM   `product`
                WHERE  ((
                                     `product`.`producttypeid` = 5)
                       AND    (
                                     `product`.`parentgroupedproductid` <> 0)
                       AND    (
                                     0 <> `product`.`published`)
                       AND    (
                                     0 = `product`.`deleted`))) `p2`
ON      ((
                           `p`.`id` = `p2`.`parentgroupedproductid`)))
JOIN     `orderitem` `oi`
ON      ((
                           `p2`.`id` = `oi`.`productid`)))
JOIN
         (
                SELECT `ORDER`.`id`                                      AS `id`,
                       `ORDER`.`orderguid`                               AS `orderguid`,
                       `ORDER`.`storeid`                                 AS `storeid`,
                       `ORDER`.`customerid`                              AS `customerid`,
                       `ORDER`.`billingaddressid`                        AS `billingaddressid`,
                       `ORDER`.`shippingaddressid`                       AS `shippingaddressid`,
                       `ORDER`.`pickupaddressid`                         AS `pickupaddressid`,
                       `ORDER`.`pickupinstore`                           AS `pickupinstore`,
                       `ORDER`.`orderstatusid`                           AS `orderstatusid`,
                       `ORDER`.`shippingstatusid`                        AS `shippingstatusid`,
                       `ORDER`.`paymentstatusid`                         AS `paymentstatusid`,
                       `ORDER`.`paymentmethodsystemname`                 AS `paymentmethodsystemname`,
                       `ORDER`.`customercurrencycode`                    AS `customercurrencycode`,
                       `ORDER`.`currencyrate`                            AS `currencyrate`,
                       `ORDER`.`customertaxdisplaytypeid`                AS `customertaxdisplaytypeid`,
                       `ORDER`.`vatnumber`                               AS `vatnumber`,
                       `ORDER`.`ordersubtotalincltax`                    AS `ordersubtotalincltax`,
                       `ORDER`.`ordersubtotalexcltax`                    AS `ordersubtotalexcltax`,
                       `ORDER`.`ordersubtotaldiscountincltax`            AS `ordersubtotaldiscountincltax`,
                       `ORDER`.`ordersubtotaldiscountexcltax`            AS `ordersubtotaldiscountexcltax`,
                       `ORDER`.`ordershippingincltax`                    AS `ordershippingincltax`,
                       `ORDER`.`ordershippingexcltax`                    AS `ordershippingexcltax`,
                       `ORDER`.`paymentmethodadditionalfeeincltax`       AS `paymentmethodadditionalfeeincltax`,
                       `ORDER`.`paymentmethodadditionalfeeexcltax`       AS `paymentmethodadditionalfeeexcltax`,
                       `ORDER`.`taxrates`                                AS `taxrates`,
                       `ORDER`.`ordertax`                                AS `ordertax`,
                       `ORDER`.`orderdiscount`                           AS `orderdiscount`,
                       `ORDER`.`ordertotal`                              AS `ordertotal`,
                       `ORDER`.`refundedamount`                          AS `refundedamount`,
                       `ORDER`.`rewardpointshistoryentryid`              AS `rewardpointshistoryentryid`,
                       `ORDER`.`checkoutattributedescription`            AS `checkoutattributedescription`,
                       `ORDER`.`checkoutattributesxml`                   AS `checkoutattributesxml`,
                       `ORDER`.`customerlanguageid`                      AS `customerlanguageid`,
                       `ORDER`.`affiliateid`                             AS `affiliateid`,
                       `ORDER`.`customerip`                              AS `customerip`,
                       `ORDER`.`allowstoringcreditcardnumber`            AS `allowstoringcreditcardnumber`,
                       `ORDER`.`cardtype`                                AS `cardtype`,
                       `ORDER`.`cardname`                                AS `cardname`,
                       `ORDER`.`cardnumber`                              AS `cardnumber`,
                       `ORDER`.`maskedcreditcardnumber`                  AS `maskedcreditcardnumber`,
                       `ORDER`.`cardcvv2`                                AS `cardcvv2`,
                       `ORDER`.`cardexpirationmonth`                     AS `cardexpirationmonth`,
                       `ORDER`.`cardexpirationyear`                      AS `cardexpirationyear`,
                       `ORDER`.`authorizationtransactionid`              AS `authorizationtransactionid`,
                       `ORDER`.`authorizationtransactioncode`            AS `authorizationtransactioncode`,
                       `ORDER`.`authorizationtransactionresult`          AS `authorizationtransactionresult`,
                       `ORDER`.`capturetransactionid`                    AS `capturetransactionid`,
                       `ORDER`.`capturetransactionresult`                AS `capturetransactionresult`,
                       `ORDER`.`subscriptiontransactionid`               AS `subscriptiontransactionid`,
                       `ORDER`.`paiddateutc`                             AS `paiddateutc`,
                       `ORDER`.`shippingmethod`                          AS `shippingmethod`,
                       `ORDER`.`shippingratecomputationmethodsystemname` AS `shippingratecomputationmethodsystemname`,
                       `ORDER`.`customvaluesxml`                         AS `customvaluesxml`,
                       `ORDER`.`deleted`                                 AS `deleted`,
                       `ORDER`.`createdonutc`                            AS `createdonutc`,
                       `ORDER`.`customordernumber`                       AS `customordernumber`,
                       `ORDER`.`redeemedrewardpointsentryid`             AS `redeemedrewardpointsentryid`
                FROM   `ORDER`
                WHERE  ((
                                     `ORDER`.`orderstatusid` <> 40)
                       AND    (
                                     `ORDER`.`paymentstatusid` <> 20)
                       AND    (
                                     0 = `ORDER`.`deleted`))) `o`
ON      ((
                           `oi`.`orderid` = `o`.`id`)))
WHERE    ((
                           `p`.`producttypeid` = 10)
         AND      (
                           `p`.`parentgroupedproductid` = 0)
         AND      (
                           0 <> `p`.`published`)
         AND      (
                           0 = `p`.`deleted`)
         AND      (
                           0 = `o`.`deleted`)
         AND      (
                           `o`.`createdonutc` >= '2020-10-24')
         AND      (
                           `c`.`NAME` = 'Reçeteli İlaç'))
GROUP BY `baslangic`
ORDER BY `o`.`createdonutc` */;


--##################
VIEW `saglik` ASSELECT   date_format((`o`.`createdonutc` + Interval ((1 - Dayofweek(`o`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `baslangic`,
         date_format((`o`.`createdonutc` + interval ((7 - dayofweek(`o`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `bitis`,
         `c`.`NAME`                                                                                            AS `name6`,
         count(DISTINCT `p`.`id`)                                                                              AS `ilansayisi6`,
         sum(`oi`.`quantity`)                                                                                  AS `satismiktari6`,
         sum(`oi`.`priceincltax`)                                                                              AS `satistutari6`
FROM     ((((((`allcategoriesbyparent` `mc`
JOIN     `category` `c`
ON      ((
                           `mc`.`maincategoryid` = `c`.`id`)))
JOIN     `product_category_mapping` `pcm`
ON      ((
                           find_in_set(`pcm`.`categoryid`,`mc`.`ids`) > 0)))
JOIN     `product` `p`
ON      ((
                           `pcm`.`productid` = `p`.`id`)))
JOIN
         (
                SELECT `product`.`id`                                                     AS `id`,
                       `product`.`producttypeid`                                          AS `producttypeid`,
                       `product`.`parentgroupedproductid`                                 AS `parentgroupedproductid`,
                       `product`.`visibleindividually`                                    AS `visibleindividually`,
                       `product`.`NAME`                                                   AS `NAME`,
                       `product`.`shortdescription`                                       AS `shortdescription`,
                       `product`.`fulldescription`                                        AS `fulldescription`,
                       `product`.`admincomment`                                           AS `admincomment`,
                       `product`.`producttemplateid`                                      AS `producttemplateid`,
                       `product`.`vendorid`                                               AS `vendorid`,
                       `product`.`showonhomepage`                                         AS `showonhomepage`,
                       `product`.`metakeywords`                                           AS `metakeywords`,
                       `product`.`metadescription`                                        AS `metadescription`,
                       `product`.`metatitle`                                              AS `metatitle`,
                       `product`.`allowcustomerreviews`                                   AS `allowcustomerreviews`,
                       `product`.`approvedratingsum`                                      AS `approvedratingsum`,
                       `product`.`notapprovedratingsum`                                   AS `notapprovedratingsum`,
                       `product`.`approvedtotalreviews`                                   AS `approvedtotalreviews`,
                       `product`.`notapprovedtotalreviews`                                AS `notapprovedtotalreviews`,
                       `product`.`subjecttoacl`                                           AS `subjecttoacl`,
                       `product`.`limitedtostores`                                        AS `limitedtostores`,
                       `product`.`sku`                                                    AS `sku`,
                       `product`.`manufacturerpartnumber`                                 AS `manufacturerpartnumber`,
                       `product`.`gtin`                                                   AS `gtin`,
                       `product`.`isgiftcard`                                             AS `isgiftcard`,
                       `product`.`giftcardtypeid`                                         AS `giftcardtypeid`,
                       `product`.`overriddengiftcardamount`                               AS `overriddengiftcardamount`,
                       `product`.`requireotherproducts`                                   AS `requireotherproducts`,
                       `product`.`requiredproductids`                                     AS `requiredproductids`,
                       `product`.`automaticallyaddrequiredproducts`                       AS `automaticallyaddrequiredproducts`,
                       `product`.`isdownload`                                             AS `isdownload`,
                       `product`.`downloadid`                                             AS `downloadid`,
                       `product`.`unlimiteddownloads`                                     AS `unlimiteddownloads`,
                       `product`.`maxnumberofdownloads`                                   AS `maxnumberofdownloads`,
                       `product`.`downloadexpirationdays`                                 AS `downloadexpirationdays`,
                       `product`.`downloadactivationtypeid`                               AS `downloadactivationtypeid`,
                       `product`.`hassampledownload`                                      AS `hassampledownload`,
                       `product`.`sampledownloadid`                                       AS `sampledownloadid`,
                       `product`.`hasuseragreement`                                       AS `hasuseragreement`,
                       `product`.`useragreementtext`                                      AS `useragreementtext`,
                       `product`.`isrecurring`                                            AS `isrecurring`,
                       `product`.`recurringcyclelength`                                   AS `recurringcyclelength`,
                       `product`.`recurringcycleperiodid`                                 AS `recurringcycleperiodid`,
                       `product`.`recurringtotalcycles`                                   AS `recurringtotalcycles`,
                       `product`.`isrental`                                               AS `isrental`,
                       `product`.`rentalpricelength`                                      AS `rentalpricelength`,
                       `product`.`rentalpriceperiodid`                                    AS `rentalpriceperiodid`,
                       `product`.`isshipenabled`                                          AS `isshipenabled`,
                       `product`.`isfreeshipping`                                         AS `isfreeshipping`,
                       `product`.`shipseparately`                                         AS `shipseparately`,
                       `product`.`additionalshippingcharge`                               AS `additionalshippingcharge`,
                       `product`.`deliverydateid`                                         AS `deliverydateid`,
                       `product`.`istaxexempt`                                            AS `istaxexempt`,
                       `product`.`taxcategoryid`                                          AS `taxcategoryid`,
                       `product`.`istelecommunicationsorbroadcastingorelectronicservices` AS `istelecommunicationsorbroadcastingorelectronicservices`,
                       `product`.`manageinventorymethodid`                                AS `manageinventorymethodid`,
                       `product`.`productavailabilityrangeid`                             AS `productavailabilityrangeid`,
                       `product`.`usemultiplewarehouses`                                  AS `usemultiplewarehouses`,
                       `product`.`warehouseid`                                            AS `warehouseid`,
                       `product`.`stockquantity`                                          AS `stockquantity`,
                       `product`.`displaystockavailability`                               AS `displaystockavailability`,
                       `product`.`displaystockquantity`                                   AS `displaystockquantity`,
                       `product`.`minstockquantity`                                       AS `minstockquantity`,
                       `product`.`lowstockactivityid`                                     AS `lowstockactivityid`,
                       `product`.`notifyadminforquantitybelow`                            AS `notifyadminforquantitybelow`,
                       `product`.`backordermodeid`                                        AS `backordermodeid`,
                       `product`.`allowbackinstocksubscriptions`                          AS `allowbackinstocksubscriptions`,
                       `product`.`orderminimumquantity`                                   AS `orderminimumquantity`,
                       `product`.`ordermaximumquantity`                                   AS `ordermaximumquantity`,
                       `product`.`allowedquantities`                                      AS `allowedquantities`,
                       `product`.`allowaddingonlyexistingattributecombinations`           AS `allowaddingonlyexistingattributecombinations`,
                       `product`.`notreturnable`                                          AS `notreturnable`,
                       `product`.`disablebuybutton`                                       AS `disablebuybutton`,
                       `product`.`disablewishlistbutton`                                  AS `disablewishlistbutton`,
                       `product`.`availableforpreorder`                                   AS `availableforpreorder`,
                       `product`.`preorderavailabilitystartdatetimeutc`                   AS `preorderavailabilitystartdatetimeutc`,
                       `product`.`callforprice`                                           AS `callforprice`,
                       `product`.`price`                                                  AS `price`,
                       `product`.`oldprice`                                               AS `oldprice`,
                       `product`.`productcost`                                            AS `productcost`,
                       `product`.`customerentersprice`                                    AS `customerentersprice`,
                       `product`.`minimumcustomerenteredprice`                            AS `minimumcustomerenteredprice`,
                       `product`.`maximumcustomerenteredprice`                            AS `maximumcustomerenteredprice`,
                       `product`.`basepriceenabled`                                       AS `basepriceenabled`,
                       `product`.`basepriceamount`                                        AS `basepriceamount`,
                       `product`.`basepriceunitid`                                        AS `basepriceunitid`,
                       `product`.`basepricebaseamount`                                    AS `basepricebaseamount`,
                       `product`.`basepricebaseunitid`                                    AS `basepricebaseunitid`,
                       `product`.`markasnew`                                              AS `markasnew`,
                       `product`.`markasnewstartdatetimeutc`                              AS `markasnewstartdatetimeutc`,
                       `product`.`markasnewenddatetimeutc`                                AS `markasnewenddatetimeutc`,
                       `product`.`hastierprices`                                          AS `hastierprices`,
                       `product`.`hasdiscountsapplied`                                    AS `hasdiscountsapplied`,
                       `product`.`weight`                                                 AS `weight`,
                       `product`.`length`                                                 AS `length`,
                       `product`.`width`                                                  AS `width`,
                       `product`.`height`                                                 AS `height`,
                       `product`.`availablestartdatetimeutc`                              AS `availablestartdatetimeutc`,
                       `product`.`availableenddatetimeutc`                                AS `availableenddatetimeutc`,
                       `product`.`displayorder`                                           AS `displayorder`,
                       `product`.`published`                                              AS `published`,
                       `product`.`deleted`                                                AS `deleted`,
                       `product`.`createdonutc`                                           AS `createdonutc`,
                       `product`.`updatedonutc`                                           AS `updatedonutc`,
                       `product`.`mf`                                                     AS `mf`,
                       `product`.`mfadet`                                                 AS `mfadet`,
                       `product`.`mfadetfazla`                                            AS `mfadetfazla`,
                       `product`.`miad`                                                   AS `miad`,
                       `product`.`miaddate`                                               AS `miaddate`,
                       `product`.`kamuodenen`                                             AS `kamuodenen`,
                       `product`.`fiyatfarki`                                             AS `fiyatfarki`
                FROM   `product`
                WHERE  ((
                                     `product`.`producttypeid` = 5)
                       AND    (
                                     `product`.`parentgroupedproductid` <> 0)
                       AND    (
                                     0 <> `product`.`published`)
                       AND    (
                                     0 = `product`.`deleted`))) `p2`
ON      ((
                           `p`.`id` = `p2`.`parentgroupedproductid`)))
JOIN     `orderitem` `oi`
ON      ((
                           `p2`.`id` = `oi`.`productid`)))
JOIN
         (
                SELECT `ORDER`.`id`                                      AS `id`,
                       `ORDER`.`orderguid`                               AS `orderguid`,
                       `ORDER`.`storeid`                                 AS `storeid`,
                       `ORDER`.`customerid`                              AS `customerid`,
                       `ORDER`.`billingaddressid`                        AS `billingaddressid`,
                       `ORDER`.`shippingaddressid`                       AS `shippingaddressid`,
                       `ORDER`.`pickupaddressid`                         AS `pickupaddressid`,
                       `ORDER`.`pickupinstore`                           AS `pickupinstore`,
                       `ORDER`.`orderstatusid`                           AS `orderstatusid`,
                       `ORDER`.`shippingstatusid`                        AS `shippingstatusid`,
                       `ORDER`.`paymentstatusid`                         AS `paymentstatusid`,
                       `ORDER`.`paymentmethodsystemname`                 AS `paymentmethodsystemname`,
                       `ORDER`.`customercurrencycode`                    AS `customercurrencycode`,
                       `ORDER`.`currencyrate`                            AS `currencyrate`,
                       `ORDER`.`customertaxdisplaytypeid`                AS `customertaxdisplaytypeid`,
                       `ORDER`.`vatnumber`                               AS `vatnumber`,
                       `ORDER`.`ordersubtotalincltax`                    AS `ordersubtotalincltax`,
                       `ORDER`.`ordersubtotalexcltax`                    AS `ordersubtotalexcltax`,
                       `ORDER`.`ordersubtotaldiscountincltax`            AS `ordersubtotaldiscountincltax`,
                       `ORDER`.`ordersubtotaldiscountexcltax`            AS `ordersubtotaldiscountexcltax`,
                       `ORDER`.`ordershippingincltax`                    AS `ordershippingincltax`,
                       `ORDER`.`ordershippingexcltax`                    AS `ordershippingexcltax`,
                       `ORDER`.`paymentmethodadditionalfeeincltax`       AS `paymentmethodadditionalfeeincltax`,
                       `ORDER`.`paymentmethodadditionalfeeexcltax`       AS `paymentmethodadditionalfeeexcltax`,
                       `ORDER`.`taxrates`                                AS `taxrates`,
                       `ORDER`.`ordertax`                                AS `ordertax`,
                       `ORDER`.`orderdiscount`                           AS `orderdiscount`,
                       `ORDER`.`ordertotal`                              AS `ordertotal`,
                       `ORDER`.`refundedamount`                          AS `refundedamount`,
                       `ORDER`.`rewardpointshistoryentryid`              AS `rewardpointshistoryentryid`,
                       `ORDER`.`checkoutattributedescription`            AS `checkoutattributedescription`,
                       `ORDER`.`checkoutattributesxml`                   AS `checkoutattributesxml`,
                       `ORDER`.`customerlanguageid`                      AS `customerlanguageid`,
                       `ORDER`.`affiliateid`                             AS `affiliateid`,
                       `ORDER`.`customerip`                              AS `customerip`,
                       `ORDER`.`allowstoringcreditcardnumber`            AS `allowstoringcreditcardnumber`,
                       `ORDER`.`cardtype`                                AS `cardtype`,
                       `ORDER`.`cardname`                                AS `cardname`,
                       `ORDER`.`cardnumber`                              AS `cardnumber`,
                       `ORDER`.`maskedcreditcardnumber`                  AS `maskedcreditcardnumber`,
                       `ORDER`.`cardcvv2`                                AS `cardcvv2`,
                       `ORDER`.`cardexpirationmonth`                     AS `cardexpirationmonth`,
                       `ORDER`.`cardexpirationyear`                      AS `cardexpirationyear`,
                       `ORDER`.`authorizationtransactionid`              AS `authorizationtransactionid`,
                       `ORDER`.`authorizationtransactioncode`            AS `authorizationtransactioncode`,
                       `ORDER`.`authorizationtransactionresult`          AS `authorizationtransactionresult`,
                       `ORDER`.`capturetransactionid`                    AS `capturetransactionid`,
                       `ORDER`.`capturetransactionresult`                AS `capturetransactionresult`,
                       `ORDER`.`subscriptiontransactionid`               AS `subscriptiontransactionid`,
                       `ORDER`.`paiddateutc`                             AS `paiddateutc`,
                       `ORDER`.`shippingmethod`                          AS `shippingmethod`,
                       `ORDER`.`shippingratecomputationmethodsystemname` AS `shippingratecomputationmethodsystemname`,
                       `ORDER`.`customvaluesxml`                         AS `customvaluesxml`,
                       `ORDER`.`deleted`                                 AS `deleted`,
                       `ORDER`.`createdonutc`                            AS `createdonutc`,
                       `ORDER`.`customordernumber`                       AS `customordernumber`,
                       `ORDER`.`redeemedrewardpointsentryid`             AS `redeemedrewardpointsentryid`
                FROM   `ORDER`
                WHERE  ((
                                     `ORDER`.`orderstatusid` <> 40)
                       AND    (
                                     `ORDER`.`paymentstatusid` <> 20)
                       AND    (
                                     0 = `ORDER`.`deleted`))) `o`
ON      ((
                           `oi`.`orderid` = `o`.`id`)))
WHERE    ((
                           `p`.`producttypeid` = 10)
         AND      (
                           `p`.`parentgroupedproductid` = 0)
         AND      (
                           0 <> `p`.`published`)
         AND      (
                           0 = `p`.`deleted`)
         AND      (
                           0 = `o`.`deleted`)
         AND      (
                           `o`.`createdonutc` >= '2020-10-24')
         AND      (
                           `c`.`NAME` = 'Sağlık'))
GROUP BY `baslangic`
ORDER BY `o`.`createdonutc` */;


--##################
VIEW `sarfmalzemeleri` ASSELECT   date_format((`o`.`createdonutc` + Interval ((1 - Dayofweek(`o`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `baslangic`,
         date_format((`o`.`createdonutc` + interval ((7 - dayofweek(`o`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `bitis`,
         `c`.`NAME`                                                                                            AS `name7`,
         count(DISTINCT `p`.`id`)                                                                              AS `ilansayisi7`,
         sum(`oi`.`quantity`)                                                                                  AS `satismiktari7`,
         sum(`oi`.`priceincltax`)                                                                              AS `satistutari7`
FROM     ((((((`allcategoriesbyparent` `mc`
JOIN     `category` `c`
ON      ((
                           `mc`.`maincategoryid` = `c`.`id`)))
JOIN     `product_category_mapping` `pcm`
ON      ((
                           find_in_set(`pcm`.`categoryid`,`mc`.`ids`) > 0)))
JOIN     `product` `p`
ON      ((
                           `pcm`.`productid` = `p`.`id`)))
JOIN
         (
                SELECT `product`.`id`                                                     AS `id`,
                       `product`.`producttypeid`                                          AS `producttypeid`,
                       `product`.`parentgroupedproductid`                                 AS `parentgroupedproductid`,
                       `product`.`visibleindividually`                                    AS `visibleindividually`,
                       `product`.`NAME`                                                   AS `NAME`,
                       `product`.`shortdescription`                                       AS `shortdescription`,
                       `product`.`fulldescription`                                        AS `fulldescription`,
                       `product`.`admincomment`                                           AS `admincomment`,
                       `product`.`producttemplateid`                                      AS `producttemplateid`,
                       `product`.`vendorid`                                               AS `vendorid`,
                       `product`.`showonhomepage`                                         AS `showonhomepage`,
                       `product`.`metakeywords`                                           AS `metakeywords`,
                       `product`.`metadescription`                                        AS `metadescription`,
                       `product`.`metatitle`                                              AS `metatitle`,
                       `product`.`allowcustomerreviews`                                   AS `allowcustomerreviews`,
                       `product`.`approvedratingsum`                                      AS `approvedratingsum`,
                       `product`.`notapprovedratingsum`                                   AS `notapprovedratingsum`,
                       `product`.`approvedtotalreviews`                                   AS `approvedtotalreviews`,
                       `product`.`notapprovedtotalreviews`                                AS `notapprovedtotalreviews`,
                       `product`.`subjecttoacl`                                           AS `subjecttoacl`,
                       `product`.`limitedtostores`                                        AS `limitedtostores`,
                       `product`.`sku`                                                    AS `sku`,
                       `product`.`manufacturerpartnumber`                                 AS `manufacturerpartnumber`,
                       `product`.`gtin`                                                   AS `gtin`,
                       `product`.`isgiftcard`                                             AS `isgiftcard`,
                       `product`.`giftcardtypeid`                                         AS `giftcardtypeid`,
                       `product`.`overriddengiftcardamount`                               AS `overriddengiftcardamount`,
                       `product`.`requireotherproducts`                                   AS `requireotherproducts`,
                       `product`.`requiredproductids`                                     AS `requiredproductids`,
                       `product`.`automaticallyaddrequiredproducts`                       AS `automaticallyaddrequiredproducts`,
                       `product`.`isdownload`                                             AS `isdownload`,
                       `product`.`downloadid`                                             AS `downloadid`,
                       `product`.`unlimiteddownloads`                                     AS `unlimiteddownloads`,
                       `product`.`maxnumberofdownloads`                                   AS `maxnumberofdownloads`,
                       `product`.`downloadexpirationdays`                                 AS `downloadexpirationdays`,
                       `product`.`downloadactivationtypeid`                               AS `downloadactivationtypeid`,
                       `product`.`hassampledownload`                                      AS `hassampledownload`,
                       `product`.`sampledownloadid`                                       AS `sampledownloadid`,
                       `product`.`hasuseragreement`                                       AS `hasuseragreement`,
                       `product`.`useragreementtext`                                      AS `useragreementtext`,
                       `product`.`isrecurring`                                            AS `isrecurring`,
                       `product`.`recurringcyclelength`                                   AS `recurringcyclelength`,
                       `product`.`recurringcycleperiodid`                                 AS `recurringcycleperiodid`,
                       `product`.`recurringtotalcycles`                                   AS `recurringtotalcycles`,
                       `product`.`isrental`                                               AS `isrental`,
                       `product`.`rentalpricelength`                                      AS `rentalpricelength`,
                       `product`.`rentalpriceperiodid`                                    AS `rentalpriceperiodid`,
                       `product`.`isshipenabled`                                          AS `isshipenabled`,
                       `product`.`isfreeshipping`                                         AS `isfreeshipping`,
                       `product`.`shipseparately`                                         AS `shipseparately`,
                       `product`.`additionalshippingcharge`                               AS `additionalshippingcharge`,
                       `product`.`deliverydateid`                                         AS `deliverydateid`,
                       `product`.`istaxexempt`                                            AS `istaxexempt`,
                       `product`.`taxcategoryid`                                          AS `taxcategoryid`,
                       `product`.`istelecommunicationsorbroadcastingorelectronicservices` AS `istelecommunicationsorbroadcastingorelectronicservices`,
                       `product`.`manageinventorymethodid`                                AS `manageinventorymethodid`,
                       `product`.`productavailabilityrangeid`                             AS `productavailabilityrangeid`,
                       `product`.`usemultiplewarehouses`                                  AS `usemultiplewarehouses`,
                       `product`.`warehouseid`                                            AS `warehouseid`,
                       `product`.`stockquantity`                                          AS `stockquantity`,
                       `product`.`displaystockavailability`                               AS `displaystockavailability`,
                       `product`.`displaystockquantity`                                   AS `displaystockquantity`,
                       `product`.`minstockquantity`                                       AS `minstockquantity`,
                       `product`.`lowstockactivityid`                                     AS `lowstockactivityid`,
                       `product`.`notifyadminforquantitybelow`                            AS `notifyadminforquantitybelow`,
                       `product`.`backordermodeid`                                        AS `backordermodeid`,
                       `product`.`allowbackinstocksubscriptions`                          AS `allowbackinstocksubscriptions`,
                       `product`.`orderminimumquantity`                                   AS `orderminimumquantity`,
                       `product`.`ordermaximumquantity`                                   AS `ordermaximumquantity`,
                       `product`.`allowedquantities`                                      AS `allowedquantities`,
                       `product`.`allowaddingonlyexistingattributecombinations`           AS `allowaddingonlyexistingattributecombinations`,
                       `product`.`notreturnable`                                          AS `notreturnable`,
                       `product`.`disablebuybutton`                                       AS `disablebuybutton`,
                       `product`.`disablewishlistbutton`                                  AS `disablewishlistbutton`,
                       `product`.`availableforpreorder`                                   AS `availableforpreorder`,
                       `product`.`preorderavailabilitystartdatetimeutc`                   AS `preorderavailabilitystartdatetimeutc`,
                       `product`.`callforprice`                                           AS `callforprice`,
                       `product`.`price`                                                  AS `price`,
                       `product`.`oldprice`                                               AS `oldprice`,
                       `product`.`productcost`                                            AS `productcost`,
                       `product`.`customerentersprice`                                    AS `customerentersprice`,
                       `product`.`minimumcustomerenteredprice`                            AS `minimumcustomerenteredprice`,
                       `product`.`maximumcustomerenteredprice`                            AS `maximumcustomerenteredprice`,
                       `product`.`basepriceenabled`                                       AS `basepriceenabled`,
                       `product`.`basepriceamount`                                        AS `basepriceamount`,
                       `product`.`basepriceunitid`                                        AS `basepriceunitid`,
                       `product`.`basepricebaseamount`                                    AS `basepricebaseamount`,
                       `product`.`basepricebaseunitid`                                    AS `basepricebaseunitid`,
                       `product`.`markasnew`                                              AS `markasnew`,
                       `product`.`markasnewstartdatetimeutc`                              AS `markasnewstartdatetimeutc`,
                       `product`.`markasnewenddatetimeutc`                                AS `markasnewenddatetimeutc`,
                       `product`.`hastierprices`                                          AS `hastierprices`,
                       `product`.`hasdiscountsapplied`                                    AS `hasdiscountsapplied`,
                       `product`.`weight`                                                 AS `weight`,
                       `product`.`length`                                                 AS `length`,
                       `product`.`width`                                                  AS `width`,
                       `product`.`height`                                                 AS `height`,
                       `product`.`availablestartdatetimeutc`                              AS `availablestartdatetimeutc`,
                       `product`.`availableenddatetimeutc`                                AS `availableenddatetimeutc`,
                       `product`.`displayorder`                                           AS `displayorder`,
                       `product`.`published`                                              AS `published`,
                       `product`.`deleted`                                                AS `deleted`,
                       `product`.`createdonutc`                                           AS `createdonutc`,
                       `product`.`updatedonutc`                                           AS `updatedonutc`,
                       `product`.`mf`                                                     AS `mf`,
                       `product`.`mfadet`                                                 AS `mfadet`,
                       `product`.`mfadetfazla`                                            AS `mfadetfazla`,
                       `product`.`miad`                                                   AS `miad`,
                       `product`.`miaddate`                                               AS `miaddate`,
                       `product`.`kamuodenen`                                             AS `kamuodenen`,
                       `product`.`fiyatfarki`                                             AS `fiyatfarki`
                FROM   `product`
                WHERE  ((
                                     `product`.`producttypeid` = 5)
                       AND    (
                                     `product`.`parentgroupedproductid` <> 0)
                       AND    (
                                     0 <> `product`.`published`)
                       AND    (
                                     0 = `product`.`deleted`))) `p2`
ON      ((
                           `p`.`id` = `p2`.`parentgroupedproductid`)))
JOIN     `orderitem` `oi`
ON      ((
                           `p2`.`id` = `oi`.`productid`)))
JOIN
         (
                SELECT `ORDER`.`id`                                      AS `id`,
                       `ORDER`.`orderguid`                               AS `orderguid`,
                       `ORDER`.`storeid`                                 AS `storeid`,
                       `ORDER`.`customerid`                              AS `customerid`,
                       `ORDER`.`billingaddressid`                        AS `billingaddressid`,
                       `ORDER`.`shippingaddressid`                       AS `shippingaddressid`,
                       `ORDER`.`pickupaddressid`                         AS `pickupaddressid`,
                       `ORDER`.`pickupinstore`                           AS `pickupinstore`,
                       `ORDER`.`orderstatusid`                           AS `orderstatusid`,
                       `ORDER`.`shippingstatusid`                        AS `shippingstatusid`,
                       `ORDER`.`paymentstatusid`                         AS `paymentstatusid`,
                       `ORDER`.`paymentmethodsystemname`                 AS `paymentmethodsystemname`,
                       `ORDER`.`customercurrencycode`                    AS `customercurrencycode`,
                       `ORDER`.`currencyrate`                            AS `currencyrate`,
                       `ORDER`.`customertaxdisplaytypeid`                AS `customertaxdisplaytypeid`,
                       `ORDER`.`vatnumber`                               AS `vatnumber`,
                       `ORDER`.`ordersubtotalincltax`                    AS `ordersubtotalincltax`,
                       `ORDER`.`ordersubtotalexcltax`                    AS `ordersubtotalexcltax`,
                       `ORDER`.`ordersubtotaldiscountincltax`            AS `ordersubtotaldiscountincltax`,
                       `ORDER`.`ordersubtotaldiscountexcltax`            AS `ordersubtotaldiscountexcltax`,
                       `ORDER`.`ordershippingincltax`                    AS `ordershippingincltax`,
                       `ORDER`.`ordershippingexcltax`                    AS `ordershippingexcltax`,
                       `ORDER`.`paymentmethodadditionalfeeincltax`       AS `paymentmethodadditionalfeeincltax`,
                       `ORDER`.`paymentmethodadditionalfeeexcltax`       AS `paymentmethodadditionalfeeexcltax`,
                       `ORDER`.`taxrates`                                AS `taxrates`,
                       `ORDER`.`ordertax`                                AS `ordertax`,
                       `ORDER`.`orderdiscount`                           AS `orderdiscount`,
                       `ORDER`.`ordertotal`                              AS `ordertotal`,
                       `ORDER`.`refundedamount`                          AS `refundedamount`,
                       `ORDER`.`rewardpointshistoryentryid`              AS `rewardpointshistoryentryid`,
                       `ORDER`.`checkoutattributedescription`            AS `checkoutattributedescription`,
                       `ORDER`.`checkoutattributesxml`                   AS `checkoutattributesxml`,
                       `ORDER`.`customerlanguageid`                      AS `customerlanguageid`,
                       `ORDER`.`affiliateid`                             AS `affiliateid`,
                       `ORDER`.`customerip`                              AS `customerip`,
                       `ORDER`.`allowstoringcreditcardnumber`            AS `allowstoringcreditcardnumber`,
                       `ORDER`.`cardtype`                                AS `cardtype`,
                       `ORDER`.`cardname`                                AS `cardname`,
                       `ORDER`.`cardnumber`                              AS `cardnumber`,
                       `ORDER`.`maskedcreditcardnumber`                  AS `maskedcreditcardnumber`,
                       `ORDER`.`cardcvv2`                                AS `cardcvv2`,
                       `ORDER`.`cardexpirationmonth`                     AS `cardexpirationmonth`,
                       `ORDER`.`cardexpirationyear`                      AS `cardexpirationyear`,
                       `ORDER`.`authorizationtransactionid`              AS `authorizationtransactionid`,
                       `ORDER`.`authorizationtransactioncode`            AS `authorizationtransactioncode`,
                       `ORDER`.`authorizationtransactionresult`          AS `authorizationtransactionresult`,
                       `ORDER`.`capturetransactionid`                    AS `capturetransactionid`,
                       `ORDER`.`capturetransactionresult`                AS `capturetransactionresult`,
                       `ORDER`.`subscriptiontransactionid`               AS `subscriptiontransactionid`,
                       `ORDER`.`paiddateutc`                             AS `paiddateutc`,
                       `ORDER`.`shippingmethod`                          AS `shippingmethod`,
                       `ORDER`.`shippingratecomputationmethodsystemname` AS `shippingratecomputationmethodsystemname`,
                       `ORDER`.`customvaluesxml`                         AS `customvaluesxml`,
                       `ORDER`.`deleted`                                 AS `deleted`,
                       `ORDER`.`createdonutc`                            AS `createdonutc`,
                       `ORDER`.`customordernumber`                       AS `customordernumber`,
                       `ORDER`.`redeemedrewardpointsentryid`             AS `redeemedrewardpointsentryid`
                FROM   `ORDER`
                WHERE  ((
                                     `ORDER`.`orderstatusid` <> 40)
                       AND    (
                                     `ORDER`.`paymentstatusid` <> 20)
                       AND    (
                                     0 = `ORDER`.`deleted`))) `o`
ON      ((
                           `oi`.`orderid` = `o`.`id`)))
WHERE    ((
                           `p`.`producttypeid` = 10)
         AND      (
                           `p`.`parentgroupedproductid` = 0)
         AND      (
                           0 <> `p`.`published`)
         AND      (
                           0 = `p`.`deleted`)
         AND      (
                           0 = `o`.`deleted`)
         AND      (
                           `o`.`createdonutc` >= '2020-10-24')
         AND      (
                           `c`.`NAME` = 'Sarf Malzemeleri'))
GROUP BY `baslangic`
ORDER BY `o`.`createdonutc` */;


--##################
VIEW `siparisvereneczane` ASSELECT   date_format((`o`.`createdonutc` + Interval ((1 - Dayofweek(`o`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `baslangic`,
         date_format((`o`.`createdonutc` + interval ((7 - dayofweek(`o`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `bitis`,
         count(DISTINCT `o`.`customerid`)                                                                      AS `siparisvereneczane`
FROM     `ORDER` `o`
WHERE    ((
                           `o`.`createdonutc` >= '2020-10-24')
         AND      (
                           `o`.`paymentstatusid` <> 20)
         AND      (
                           `o`.`orderstatusid` <> 40))
GROUP BY `baslangic`
ORDER BY `o`.`createdonutc` */;


--##################
VIEW `siparisvermemis` ASSELECT   date_format((`c`.`createdonutc` + Interval ((1 - Dayofweek(`c`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `baslangic`,
         date_format((`c`.`createdonutc` + interval ((7 - dayofweek(`c`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `bitis`,
         sum(count(0)) OVER (ORDER BY `c`.`createdonutc` )                                                     AS `siparisvermemisler`
FROM     `customer` `c`
WHERE    ((
                           `c`.`deleted` = 0)
         AND      (
                           `c`.`createdonutc` >= '2020-10-24')
         AND      (
                           `c`.`active` = 1)
         AND      `c`.`id` IN
                  (
                         SELECT `customer`.`id`
                         FROM   `customer`
                         WHERE  ((
                                              `customer`.`id` >= 1078412)
                                AND    (
                                              `customer`.`id` <= 1078648))) IS false
         AND      (
                           `c`.`email` IS NOT NULL)
         AND      (
                           `c`.`email` <> '')
         AND      (
                           `c`.`vendorid` = 0)
         AND      `c`.`id` IN
                  (
                         SELECT `ORDER`.`customerid`
                         FROM   `ORDER`
                         WHERE  ((
                                              `ORDER`.`deleted` = 0)
                                AND    (
                                              `ORDER`.`paymentstatusid` <> 20))) IS false)
GROUP BY `baslangic`
ORDER BY `c`.`createdonutc` */;


--##################
VIEW `yorumvepuan` ASSELECT   date_format((`ovr`.`createdonutc` + Interval ((1 - Dayofweek(`ovr`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `baslangic`,
         date_format((`ovr`.`createdonutc` + interval ((7 - dayofweek(`ovr`.`createdonutc`)) - 1) day),'%Y-%m-%e') AS `bitis`,
         count(`ovr`.`reviewtext`)                                                                                 AS `yorumsayisi`,
         count(`ovr`.`deliveryrating`)                                                                             AS `puanlama`
FROM     `ordervendorreview` `ovr`
WHERE    (
                  `ovr`.`createdonutc` >= '2020-10-24')
GROUP BY `baslangic`
ORDER BY `ovr`.`createdonutc` */;