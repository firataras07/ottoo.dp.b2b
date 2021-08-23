 # -*- coding: UTF-8 -*-
#
# @author: Uluc Furkan Vardar
# @updatedDate: 17.01.2021
# @version: 1.0.0
# Misli Write Back
import boto3
import re
import datetime
import requests
import json





from uluc_db_controller import msSQL_db_controller
from libs import arc_functions as arc_functions

def lambda_handler2(event, content):    
    
    r = requests.get(r'http://jsonip.com')
    # r = requests.get(r'https://ifconfig.co/json')
    ip= r.json()['ip']
    print('Your IP is {}'.format(ip))
        
    #a_f = arc_functions( manifest_file_path = "./manifest.json")
    #db_c = msSQL_db_controller(a_f.get_manifest_part(layer_name="Write_Back")["target_db"]["mssql_config"] )
    #resp, msg = db_c.execute_and_return_all("SELECT * from [Hera].[Sell].[Summary]")
    #print (resp)

 
 
def lambda_handler(event, content):    
    #MS SQL
    print (event)

    a_f = arc_functions( manifest_file_path = "./manifest.json")
    db_c = msSQL_db_controller(a_f.get_manifest_part(layer_name="Write_Back")["target_db"]["mssql_config"] )
    for my_record in event["Records"]:
        try:
            my_record = json.loads(my_record["body"]) 
        except Exception as e:
            my_record = my_record["body"]
        print ("BURADAYIMM")
        #sqls = a_f.generate_sql(
        sqls, BeginDate, EndDate = a_f.generate_sql(
                                    s3_bucket         = my_record['bucket']
                                  , s3_key            = my_record['key']   
                                  , region            = my_record['region']   
                                  , table_name        = my_record['table_name'] 
                                  , data_date         = my_record['data_date']   
                                  , period            = my_record['period'].title() 
                                  , db_table_name     = my_record['db_table_name']   
                            )
        #print (sqls)
        #return 0
        #delete old lines.
        delete_sql = a_f.generate_delete_sql( db_table_name = my_record['db_table_name']   
                                             ,end_date     = EndDate
                                             #,data_date     = my_record['data_date']   
                                             ,report_name = my_record['table_name'] 
                                           )
        print (delete_sql)                                           
        resp, msg = db_c.execute_only(delete_sql)
        if msg != None:
            rsp = {
                    'status': 600,
                    'msg'   : msg,
                    'sql'   : delete_sql,
                    'my_record' : my_record,
                    'errored_sqsl_turn' : "delete sql",
                    'report' : my_record['key'] 
                    }            
            print (rsp)
            exit(-1)
            
        print ("Sira 126 insertte")
        for i, sql in enumerate(sqls):
            #print (sql)
            resp, msg = db_c.execute_only(sql)
            if msg != None:
                rsp = {
                        'status': 252,
                        'msg'   : msg,
                        'sql'   : sql,
                        'my_record' : my_record,
                        'errored_sqsl_turn' : i,
                        'report' : my_record['key'] 
                        }
                print (rsp)
                exit(-1)
        rsp = {
            'status': 200,
            'report' : my_record['key']
        }
        #sistem db inserted update.
        print ("Sira system_DB upd")
        a_f.update_convert_status_of_file(pk_id = my_record["S3_Files_PKID"], Converted_by = "Write_Back")
        print ("Insertler BITTI")