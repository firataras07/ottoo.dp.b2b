## TUM KOPYA YEDEK
aws s3 rm s3://sg.bet.data/DEV_Scripts_v4/ --recursive --profile u.a.user
aws s3 rm s3://misli.bet.data/DEV_Scripts_v4/ --recursive --profile u.a.user
aws s3 cp /Users/ulucfurkanvardar/Desktop/m/ALL/GitHub/all.bet/ s3://sg.bet.data/DEV_Scripts_v4/ --recursive --profile u.a.user
aws s3 cp /Users/ulucfurkanvardar/Desktop/m/ALL/GitHub/all.bet/ s3://misli.bet.data/DEV_Scripts_v4/ --recursive --profile u.a.user


## DEV ORAMI 
aws s3 cp /Users/ulucfurkanvardar/Desktop/m/ALL/Ottoo/git/data.platform.b2b/000_eczastok/ s3://data.platform.b2b.eczastok/DEV_Scripts_v1/000_eczastok/ --recursive --profile ottoo.u.a.user
aws s3 cp /Users/ulucfurkanvardar/Desktop/m/ALL/Ottoo/git/data.platform.b2b/001_dependents/ s3://data.platform.b2b.eczastok/DEV_Scripts_v1/001_dependents/ --recursive --profile ottoo.u.a.user



# Download and run FOR SANS GIRISIM - MIDAS

 
echo """
shopt -s extglob 
rm -r !(down_eczastok.sh)
aws s3 cp s3://data.platform.b2b.eczastok/DEV_Scripts_v1/000_eczastok/ ./ --recursive
aws s3 cp s3://data.platform.b2b.eczastok/DEV_Scripts_v1/001_dependents/ ./ --recursive
mkdir ./data/
clear
python36 ./eczastok_1_manager.py -ws prod -wjf Fetch_1,Decode_1""" > down_eczastok.sh




aws s3 cp s3://sg.bet.data/delete_me/1656561sef/data/daily/prod/rlf_retailer_info/2021/06/08/rlf_retailer_info--1623200101119820330-202106090355.csv s3://sg.bet.data/data/daily/prod/rlf_retailer_info/2021/06/08/rlf_retailer_info--1623200101119820330-202106090w.csv --profile u.a.user



# SQS MOVES
move-sqs --sourceQueueUrl "https://sqs.eu-central-1.amazonaws.com/027534141241/SG_Decode1_Sqs_Prod_Dead-letter" --destination-queue-url "https://sqs.eu-central-1.amazonaws.com/027534141241/SG_Decode1_Sqs_Prod" --region "eu-central-1" -k "AKIAQM2JJU44V5B2HJM5" -S "4/h4TAwt318VekH+KsERsfiRqYIpdmC3jcgxIsHJ"

### JUPİTER
sudo pip-3.6 install jupyter
mkdir MyNotebooks
cd MyNotebooks/
jupyter notebook

aws s3 cp s3://sg.bet.data/data/daily/prod/daily_pbc_detail/2021/06/09/daily_pbc_detail--1623285001226404836-202106100330.csv s3://sg.bet.data/data/daily/prod/daily_pbc_detail/2021/06/09/daily_pbc_detail--1623285001226404836-test.csv --profile u.a.user

### BAGLANMA
cd /Users/ulucfurkanvardar/Desktop/m/ALL/Hurriyet/workSpace/Access

ssh -i "tekhnelogos_frankfurt.pem" ec2-user@ec2-35-158-102-107.eu-central-1.compute.amazonaws.com
ssh -i "Uluc_frankfurt_key.pem" root@ec2-3-66-232-250.eu-central-1.compute.amazonaws.com
ssh -i "Uluc_frankfurt_key.pem" ec2-user@ec2-3-66-232-250.eu-central-1.compute.amazonaws.com
ssh -i "Uluc_frankfurt_key.pem" ec2-user@ec2-18-193-68-209.eu-central-1.compute.amazonaws.com



ssh -i "Uluc_frankfurt_key.pem" ec2-user@ec2-18-184-218-49.eu-central-1.compute.amazonaws.com

ssh -i "Uluc_London_Key.pem" ec2-user@ec2-18-130-87-67.eu-west-2.compute.amazonaws.com

ssh -i "Uluc_frankfurt_key.pem" root@ec2-52-59-167-116.eu-central-1.compute.amazonaws.com

ssh -i "Uluc_frankfurt_key.pem" ec2-user@ec2-52-59-167-116.eu-central-1.compute.amazonaws.com

ssh -i "Uluc_frankfurt_key.pem" -N -f -L 8888:localhost:8888 ec2-user@ec2-35-158-102-107.eu-central-1.compute.amazonaws.com

ssh -i "Uluc_frankfurt_key.pem" root@ec2-18-130-216-5.eu-west-2.compute.amazonaws.com

ssh -i "Uluc_frankfurt_key.pem" ec2-user@ec2-18-130-216-5.eu-west-2.compute.amazonaws.com


###### HEPSİNİ KOPYALAMA

###PARQUET KOPYALAMA

###PARQUET SİLME


#SİLMEEE

# SQLS
####### DATA SAYIMI #######
	#PROD
	SELECT Data_Date , count(DISTINCT(Table_Name))  FROM System_Bet_DB.S3_Files where Stack = 'sg.bet.data' and  S3_Files.Key like"data%" AND S3_Files.State = 'prod' group by Data_Date;
    SELECT Data_Date , Table_Name, count(DISTINCT(Table_Name))  FROM System_Bet_DB.S3_Files where Stack = 'sg.bet.data' and  S3_Files.Key like"data%" AND S3_Files.State = 'prod' group by Data_Date, Table_Name;    
	SELECT Data_Date, Table_Name, count(Table_Name) FROM System_Bet_DB.S3_Files WHERE Stack = 'sg.bet.data' AND  S3_Files.State = 'prod' AND S3_Files.Key like 'parquet_data%.parquet' GROUP BY Data_Date, Table_Name;
	SELECT Data_Date , count(DISTINCT(Table_Name))  FROM System_Bet_DB.S3_Files where Stack = 'sg.bet.data' and  S3_Files.Key like"%report%--latest.csv" AND S3_Files.State = 'prod' group by Data_Date;
	SELECT s.Data_Date, count(*),Converted_Status FROM System_Bet_DB.S3_Files as s where s.Stack = 'sg.bet.data' and s.Key like "%report%--latest.csv" AND s.State = 'prod' group by s.Data_Date, Converted_Status order by Data_Date, count(*);

	# DEV
	SELECT Data_Date , count(DISTINCT(Table_Name))  FROM System_Bet_DB.S3_Files where Stack = 'sg.bet.data' and  S3_Files.Key like"data%" AND S3_Files.State = 'dev' group by Data_Date;
    SELECT Data_Date , Table_Name, count(DISTINCT(Table_Name))  FROM System_Bet_DB.S3_Files where Stack = 'sg.bet.data' and  S3_Files.Key like"data%" AND S3_Files.State = 'dev' group by Data_Date, Table_Name;
	SELECT Data_Date, Table_Name, count(Table_Name) FROM System_Bet_DB.S3_Files WHERE Stack = 'sg.bet.data' AND S3_Files.Key like 'parquet_data%.parquet' AND  S3_Files.State = 'dev' GROUP BY Data_Date, Table_Name;
	SELECT Data_Date , count(DISTINCT(Table_Name))  FROM System_Bet_DB.S3_Files where Stack = 'sg.bet.data' and  S3_Files.Key like"%report%--latest.csv" AND S3_Files.State = 'dev' group by Data_Date;
	SELECT s.Data_Date, count(*),Converted_Status FROM System_Bet_DB.S3_Files as s where s.Stack = 'sg.bet.data' and s.Key like "%report%--latest.csv" AND s.State = 'dev' group by s.Data_Date, Converted_Status order by Data_Date, count(*);

####### DATA BAKIŞ #######
	#PROD
	SELECT * FROM System_Bet_DB.S3_Files where Stack = 'sg.bet.data' AND Data_Date = '2021/01/14' AND S3_Files.Key like "data%" 				AND S3_Files.State = 'prod' ;
	SELECT * FROM System_Bet_DB.S3_Files where Stack = 'sg.bet.data' AND Data_Date = '2021/01/16' AND S3_Files.Key like "parquet_data%.parquet" AND S3_Files.State = 'prod' ;
	SELECT * FROM System_Bet_DB.S3_Files where Stack = 'sg.bet.data' AND Data_Date = '2021/02/14' AND S3_Files.Key like "%report%--latest.csv"  AND S3_Files.State = 'prod' ;

	# DEV
	SELECT * FROM System_Bet_DB.S3_Files where Stack = 'sg.bet.data' AND Data_Date = '2021/01/14' AND S3_Files.Key like "data%" 				AND S3_Files.State = 'dev' ;
	SELECT * FROM System_Bet_DB.S3_Files where Stack = 'sg.bet.data' AND Data_Date = '2021/01/16' AND S3_Files.Key like "parquet_data%.parquet" AND S3_Files.State = 'dev' ;
	SELECT * FROM System_Bet_DB.S3_Files where Stack = 'sg.bet.data' AND Data_Date = '2021/02/14' AND S3_Files.Key like "%report%--latest.csv"  AND S3_Files.State = 'dev' ;




move-sqs --sourceQueueUrl "https://sqs.eu-central-1.amazonaws.com/027534141241/SG_Decode1_Sqs_Prod_Dead-letter" --destination-queue-url "https://sqs.eu-central-1.amazonaws.com/027534141241/SG_Decode1_Sqs_Prod" --region "eu-central-1" -k "AKIAQM2JJU44V5B2HJM5" -S "4/h4TAwt318VekH+KsERsfiRqYIpdmC3jcgxIsHJ"

move-sqs --sourceQueueUrl "https://sqs.eu-central-1.amazonaws.com/027534141241/SG_Fetch_Sqs_Prod" --destination-queue-url "https://sqs.eu-central-1.amazonaws.com/027534141241/SG_Fetch_Sqs_Prod_Dead-letter" --region "eu-central-1" -k "AKIAQM2JJU44V5B2HJM5" -S "4/h4TAwt318VekH+KsERsfiRqYIpdmC3jcgxIsHJ"

move-sqs --sourceQueueUrl  "https://sqs.eu-central-1.amazonaws.com/027534141241/SG_Write_Back_Sqs_Prod_Dead-letter" --destination-queue-url "https://sqs.eu-central-1.amazonaws.com/027534141241/SG_Write_Back_Sqs_Prod" --region "eu-central-1" -k "AKIAQM2JJU44V5B2HJM5" -S "4/h4TAwt318VekH+KsERsfiRqYIpdmC3jcgxIsHJ"

move-sqs --sourceQueueUrl "https://sqs.eu-west-2.amazonaws.com/027534141241/Misli_Write_Back_Sqs_Prod_Dead-letter" --destination-queue-url "https://sqs.eu-west-2.amazonaws.com/027534141241/Misli_Write_Back_Sqs_Prod" --region "eu-west-2" -k "AKIAQM2JJU44V5B2HJM5" -S "4/h4TAwt318VekH+KsERsfiRqYIpdmC3jcgxIsHJ"

SG_Fetch_Sqs_Prod
SG_Decode1_Sqs_Prod	
SG_Decode1_Sqs_Dev	
SG_Write_Back_Sqs_Dev	
SG_Decode2_Sqs_Prod_dlq.fifo

move-sqs --sourceQueueUrl "https://sqs.eu-central-1.amazonaws.com/027534141241/SG_Write_Back_Sqs_Dev_Dead-letter" --destination-queue-url "https://sqs.eu-central-1.amazonaws.com/027534141241/SG_Write_Back_Sqs_Prod" --region "eu-central-1" -k "AKIAQM2JJU44V5B2HJM5" -S "4/h4TAwt318VekH+KsERsfiRqYIpdmC3jcgxIsHJ"

move-sqs --sourceQueueUrl "https://sqs.eu-central-1.amazonaws.com/027534141241/SG_Write_Back_Sqs_Dev_Dead-letter" --destination-queue-url "https://sqs.eu-central-1.amazonaws.com/027534141241/SG_Write_Back_Sqs_Dev" --region "eu-central-1" -k "AKIAQM2JJU44V5B2HJM5" -S "4/h4TAwt318VekH+KsERsfiRqYIpdmC3jcgxIsHJ"


move-sqs --sourceQueueUrl "https://sqs.eu-west-2.amazonaws.com/027534141241/Misli_Prod_Cumulative_Fetch_1.fifo" --destination-queue-url "https://sqs.eu-west-2.amazonaws.com/027534141241/Misli_Prod_Cumulative_Fetch_1" --region "eu-west-2" -k "AKIAQM2JJU44V5B2HJM5" -S "4/h4TAwt318VekH+KsERsfiRqYIpdmC3jcgxIsHJ"

move-sqs --sourceQueueUrl "https://sqs.eu-central-1.amazonaws.com/027534141241/SG_Decode2_Sqs_Prod_dlq.fifo" --destination-queue-url "https://sqs.eu-central-1.amazonaws.com/027534141241/SSG_Decode2_Sqs_Prod.fifo" --region "eu-central-1" -k "AKIAQM2JJU44V5B2HJM5" -S "4/h4TAwt318VekH+KsERsfiRqYIpdmC3jcgxIsHJ"

sudo pip-3.6 install jupyter
mkdir MyNotebooks
cd MyNotebooks/
jupyter notebook


ssh -i "tekhnelogos_frankfurt.pem" ec2-user@ec2-3-127-21-222.eu-central-1.compute.amazonaws.com

ssh -i "tekhnelogos_frankfurt.pem" -N -f -L 8888:localhost:8888 ec2-user@ec2-3-127-21-222.eu-central-1.compute.amazonaws.com

cd /Users/ulucfurkanvardar/Desktop/m/ALL/Hurriyet/workSpace/Access

ssh -i "Uluc_frankfurt_key.pem" ec2-user@ec2-54-93-82-105.eu-central-1.compute.amazonaws.com


ssh -i "Uluc_frankfurt_key.pem" -N -f -L 8888:localhost:8888 ec2-user@ec2-35-157-213-250.eu-central-1.compute.amazonaws.com


ssh -i "Uluc_frankfurt_key.pem" root@ec2-18-130-216-5.eu-west-2.compute.amazonaws.com


ssh -i "Uluc_frankfurt_key.pem" ec2-user@ec2-18-130-216-5.eu-west-2.compute.amazonaws.com
grep -oh -E "'[^']*'"  -r . | sort -u






aws s3 cp s3://sg.bet.data/data/daily/dev/daily_iddaa_ticket_detail/2021/04/05/daily_iddaa_ticket_detail--1617670801608432014-202104060400.csv s3://sg.bet.data/data/daily/prod/daily_iddaa_ticket_detail/2021/04/05/daily_iddaa_ticket_detail--1617670801608432014-202104060400.csv --profile u.a.user



aws s3 ls s3://sg.bet.data/parquet_data/daily/prod/multi_file_dependent/2021/04 --recursive --profile u.a.user




aws s3 cp s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_market/2021/04/26/enriched_sgpp_dd_market--latest.parquet s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_market/2021/04/__number__/enriched_sgpp_dd_market--latest.parquet








aws s3 cp s3://va7.bet.data/data/daily/prod/betSlipDetail/2021/08/01/betSlipDetail--132723396348761362-20210802040034.csv s3://va7.bet.data/data/daily/prod/betSlipDetail/2021/08/01/betSlipDetail--132723396348761362-20210802040034.csv --profile u.a.user
aws s3 cp s3://va7.bet.data/data/daily/prod/betSlips/2021/06/05/betSlips--132673284163059147-20210605040016.csv s3://va7.bet.data/data/daily/prod/betSlips/2021/06/05/betSlips--132673284163059147-20210605040016.csv --profile u.a.user




aws s3 cp s3://va7.bet.data/parquet_data/daily/prod/multi_file_dependent/2021/06/05/enriched_betSlips_and_betSlipDetail_join--18ec432b86-d9c59.parquet s3://va7.bet.data/parquet_data/daily/prod/multi_file_dependent/2021/06/05/enriched_betSlips_and_betSlipDetail_join--18ec432b86-d9c59w.parquet --profile u.a.user



s3://va7.bet.data/data/daily/prod/betSlipDetail/2021/08/05/betSlipDetail--132726852259129758-20210806040025.csv
s3://va7.bet.data/data/daily/prod/betSlips/2021/08/05/betSlips--132726852226330213-20210806040022.csv

************************************************************************************************************************************************************************************************************************************************
************************************************************************************************************************************************************************************************************************************************


aws s3 cp s3://data.platform.b2b.eczastok/temp_data/CategoryTable.csv                  s3://data.platform.b2b.eczastok/data/daily/prod/category/2021/08/20/category--asda5sd1asd6518616-a156d56asd.csv --profile ottoo.u.a.user
aws s3 cp s3://data.platform.b2b.eczastok/temp_data/Customer-CustomerRole-Mapping.csv  s3://data.platform.b2b.eczastok/data/daily/prod/customer_customerRole_mapping/2021/08/20/customer_customerRole_mapping--asda5sd1asd6518616-a156d56asd.csv --profile ottoo.u.a.user
aws s3 cp s3://data.platform.b2b.eczastok/temp_data/OrderVendorReviewTable.csv         s3://data.platform.b2b.eczastok/data/daily/prod/order_vendor_review/2021/08/20/order_vendor_review--asda5sd1asd6518616-a156d56asd.csv --profile ottoo.u.a.user
aws s3 cp s3://data.platform.b2b.eczastok/temp_data/PCMTable.csv                       s3://data.platform.b2b.eczastok/data/daily/prod/product_category_mapping/2021/08/20/product_category_mapping--asda5sd1asd6518616-a156d56asd.csv --profile ottoo.u.a.user
aws s3 cp s3://data.platform.b2b.eczastok/temp_data/VendorTable.csv                    s3://data.platform.b2b.eczastok/data/daily/prod/vendor/2021/08/20/vendor--asda5sd1asd6518616-a156d56asd.csv --profile ottoo.u.a.user
aws s3 cp s3://data.platform.b2b.eczastok/temp_data/OrderTable2.csv                    s3://data.platform.b2b.eczastok/data/daily/prod/order/2021/08/20/order--asda5sd1asd6518616-a156d56asd.csv --profile ottoo.u.a.user
aws s3 cp s3://data.platform.b2b.eczastok/temp_data/CustomerTable.csv                  s3://data.platform.b2b.eczastok/data/daily/prod/customer/2021/08/20/customer--asda5sd1asd6518616-a156d56asd.csv --profile ottoo.u.a.user
aws s3 cp s3://data.platform.b2b.eczastok/temp_data/ProductTable2.csv                  s3://data.platform.b2b.eczastok/data/daily/prod/product/2021/08/20/product--asda5sd1asd6518616-a156d56asd.csv --profile ottoo.u.a.user
aws s3 cp s3://data.platform.b2b.eczastok/temp_data/OrderItemTable.csv                 s3://data.platform.b2b.eczastok/data/daily/prod/order_item/2021/08/20/order_item--asda5sd1asd6518616-a156d56asd.csv --profile ottoo.u.a.user
aws s3 cp s3://data.platform.b2b.eczastok/temp_data/CustomerRoleTable.csv              s3://data.platform.b2b.eczastok/data/daily/prod/customer_role/2021/08/20/customer_role--asda5sd1asd6518616-a156d56asd.csv --profile ottoo.u.a.user



## DEV ORAMI 
aws s3 cp /Users/ulucfurkanvardar/Desktop/m/ALL/Ottoo/git/data.platform.b2b/000_eczastok/ s3://data.platform.b2b.eczastok/DEV_Scripts_v1/000_eczastok/ --recursive --profile ottoo.u.a.user
aws s3 cp /Users/ulucfurkanvardar/Desktop/m/ALL/Ottoo/git/data.platform.b2b/001_dependents/ s3://data.platform.b2b.eczastok/DEV_Scripts_v1/001_dependents/ --recursive --profile ottoo.u.a.user


aws s3 cp s3://data.platform.b2b.eczastok/data/daily/prod/product/2021/08/13/product--asda5sd1asd6518616-a156d56asd.csv ./temp_data/product.csv --profile ottoo.u.a.user  

aws s3 cp ./temp_data/order_uluc.csv s3://data.platform.b2b.eczastok/data/daily/prod/order/2021/08/13/order--asda5sd1asd6518616-a156d56asd.csv  --profile ottoo.u.a.user  
aws s3 cp ./temp_data/order_uluc.csv s3://data.platform.b2b.eczastok/temp_data/OrderTable2.csv --profile ottoo.u.a.user  

aws s3 cp s3://data.platform.b2b.eczastok/final_csv_data/daily/prod/export_files/2021/08/16/ ./reports --recursive --profile ottoo.u.a.user

aws s3 cp ./temp_data/Customer_Role_uluc.csv s3://data.platform.b2b.eczastok/temp_data/CustomerRoleTable.csv --profile ottoo.u.a.user  

parquet_data/daily/prod/multi_file_dependent/2021/08/15/enriched_customer_customer_customerRole_mapping_customer_role_join--latest.parquet



aws s3 cp s3://data.platform.b2b.eczastok/parquet_data/daily/prod/multi_file_dependent/2021/08/15/enriched_customer_customer_customerRole_mapping_customer_role_join--latest.parquet ./data/enriched_customer_customer_customerRole_mapping_customer_role_join.parquet