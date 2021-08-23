#!/usr/bin/env python
# -*- coding: UTF-8 -*-
import uuid
import json
from collections import defaultdict 
import boto3
import os
import sys
import uuid
import re
import copy

from uluc_db_controller import mySQL_db_controller    
    
from libs import arc_functions as arc_functions

def lambda_handler2(event, context):
    a_f = arc_functions( manifest_file_path = "./manifest.json")
    a = {   
    	"dependent_table_key" : "m_dependent+daily_sales_detail_enriched",
    	"layer_name" : "Decode_2",
    	"S3_Files_PKID" : "Unknown",
    	"stack" : "sg.bet.data",
    	"state" : "prod",
    	"data_date"  : "2020/12/21"
    }
    
    
    b = {   
    	"dependent_table_key" : "m_dependent+all_enriched",
    	"layer_name" : "Decode_2",
    	"S3_Files_PKID" : "Unknown",
    	"stack" : "sg.bet.data",
    	"state" : "prod",
    	"data_date"  : "2020/12/21"
    }
    
    ddd = ['2020/12/21',
        '2020/12/22',
        '2020/12/23',
        '2020/12/24',
        '2020/12/25',
        '2020/12/26',
        '2020/12/27',
        '2020/12/28',
        '2020/12/29',
        '2020/12/30',
        '2020/12/31',
        '2021/01/01',
        '2021/01/02',
        '2021/01/03',
        '2021/01/04',
        '2021/01/05',
        '2021/01/06',
        '2021/01/07',
        '2021/01/08',
        '2021/01/09',
        '2021/01/10',
        '2021/01/11',
        '2021/01/12',
        '2021/01/13',
        '2021/01/14',
        '2021/01/15',
        '2021/01/16',
        '2021/01/17']
        
    for d in ddd:
        a["data_date"] = d
        b["data_date"] = d
        a_f.to_sqs(
        	queue_url="https://sqs.eu-central-1.amazonaws.com/027534141241/SG_Decode2_Sqs_Prod",
        	message_body=a,
        	queue_region="eu-central-1",
        )         
        a_f.to_sqs(
        	queue_url="https://sqs.eu-central-1.amazonaws.com/027534141241/SG_Decode2_Sqs_Prod",
        	message_body=b,
        	queue_region="eu-central-1",
        )                         

            
def check_all_latest_files(bucket, depentents):
    s3 = boto3.client('s3')    
    for key in depentents:
        #### FOR OLD VERSION
        #if 'daily_payable_detail' in key:
        #    continue
        try:
            response = s3.get_object(Bucket=bucket, Key=key)
        except Exception as e:
            print(e)
            print('Error getting object {} from bucket {}. Make sure they exist and your bucket is in the same region as this function.'.format(key, bucket))
            return False
    return True
    
def lambda_handler(event, context):
    #print event
    a_f = arc_functions( manifest_file_path = "./manifest.json")
    for record in event['Records']:
        #print ('='*10)
        #print ('New File Uploaded')

        my_record = {
            "stack"          : record['s3']['bucket']['name']                   ,
            "bucket"         : record['s3']['bucket']['name']                   ,
            "key"            : record['s3']['object']['key']                    ,
            "event_time"     : record['eventTime']                              ,
            "region"         : record['awsRegion']                              ,
            "file_size"      : record['s3']['object']['size']                   ,
            "source_IP"      : record['requestParameters']['sourceIPAddress']   ,
            "uniq_code"      : record['s3']['bucket']['name'] + record['s3']['object']['key']
        }        
        #layer_name must be added
        
        
        regex_name, parsed_info = a_f.parse_given_objcet_key( object_key = my_record['key'] )
        my_record.update(parsed_info)
            
        print (json.dumps(my_record, indent = 4))
        if regex_name != 'my_latest_regex':
            return 206
            
        
        #Incoming File Info Mess
        if my_record['Is_Formatted'] == True:            
            imports_of_decode_2 = a_f.get_manifest_part(layer_name = "Decode_2")["imports_of_layer"]
            
            
            all_dependents_of_decode_part_values = [x['dependents'] for x in imports_of_decode_2.values()]
            all_dependents_of_decode2 = list(set([item for sublist in all_dependents_of_decode_part_values for item in sublist]))
            #print ("all_dependents_of_decode2" , len(all_dependents_of_decode2))
            
            #yeni dosya eklendiğinde buna tekrar bak.
            c = 0 
            for m_dependent, dependent_info  in imports_of_decode_2.items():
                flag = True
                my_record["data_date_sell"] = my_record["data_date"]
                other_dependents = [ x.format(**my_record) for x in dependent_info["dependents"]]
                
                if my_record['key'] in other_dependents:
                    print("yes iam a dependent file of the layer Decode2, dependent file key is : ", m_dependent)                    
                    #Decode a 1 tane key koy.
                    #m_dependent+daily_sales_detail_enriched, stack, data_date, state,
                    # all other ezist?
                    #print ("Kontrol ettiklerim :", other_dependents)
                    flag = check_all_latest_files(dependent_info['location_meta']['from_bucket'], other_dependents)
                    print (flag)
                    if flag == True:  
                        #print ("And all others exist, im the new key")
                        a_f.to_sqs(
                        	queue_url=a_f.get_system_constans()['Sqses'][my_record['state']]["Decode_2"],
                        	message_body={  "dependent_table_key" : m_dependent,
                        	                "layer_name" : "Decode_2",
                        	                "S3_Files_PKID" : "Unknown",
                        					"stack" : my_record['stack'],
                        					"state" : my_record['state'],
                        					"data_date"  : my_record['data_date']
                        	},
                        	queue_region=a_f.get_system_constans()['Sqses']['regions'],
                        	MessageDeduplicationId = "{data_date}_{state}_{dependent_table_key}".format(data_date = my_record['data_date'],  dependent_table_key = m_dependent, state = my_record['state'] )
                        )       
                        c+=1       
                    else:
                        print ("But others not exist")
            
            if c!= 0:              
                a =  {"data_date"  : my_record['data_date'] , "incoming_key" : my_record['key']}
                a_f.mess_2_slack(
                                text            = "Decode_2 layer has %s new task"%(str(c)), 
                                key_value_data  = a,         
                                LOG_TYPE        = "info", 
                                stack           = my_record['stack'], 
                                state           = my_record['state'],
                                
                            )

        
import copy
def lambda_handler2131(event, context):
    #print ("beni kim calistiriyor.", event)
    #return 0
    ba = ['2021/01/01', '2021/01/04']
    a = {
          "Records": [
            {
                  "eventTime": "2020-11-25T19:52:32.509Z",
                        "requestParameters": {
                "sourceIPAddress": "88.240.185.193"
              },
              "s3": {
                
                "object": {
                  "key": "parquet_data/daily/prod/daily_sales/{data_date}/enriched_daily_sales--latest.parquet",
                  "size": 5766851114
                },
                "bucket": {        
                  "name": "sg.bet.data"     
                }       
              },
              "awsRegion": "eu-central-1",
              "eventName": "ObjectCreated:Put"         
            },
            {
                  "eventTime": "2020-11-25T19:52:32.509Z",
                        "requestParameters": {
                "sourceIPAddress": "88.240.185.193"
              },
              "s3": {
                
                "object": {
                  "key": "parquet_data/daily/prod/daily_payout/{data_date}/enriched_daily_payout--latest.parquet",
                  "size": 5766851114
                },
                "bucket": {        
                  "name": "sg.bet.data"        
                }        
              },
              "awsRegion": "eu-central-1",
              "eventName": "ObjectCreated:Put"         
            }    
          ]
        }
    for date_ in ba:
        li3 = copy.deepcopy(a)  
        li3["Records"][0]["s3"]["object"]["key"] = a["Records"][0]["s3"]["object"]["key"].format(data_date = date_)
        li3["Records"][1]["s3"]["object"]["key"] = a["Records"][1]["s3"]["object"]["key"].format(data_date = date_)
        lambda_handler223(li3,None)
        print (date_)