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

from libs import arc_functions as arc_functions


def main(event, context):
    print event
    a_f = arc_functions( manifest_file_path = "./manifest.json")
    for record in event['Records']:
        print ('='*10)
        print ('New File Uploaded')

        my_record = {
            "stack"          : record['s3']['bucket']['name']                   ,
            "bucket"         : record['s3']['bucket']['name']                   ,
            "key"            : record['s3']['object']['key']                    ,
            "event_time"     : record['eventTime']                              ,
            "region"         : record['awsRegion']                              ,
            "file_size"      : record['s3']['object']['size']                   ,
            "source_IP"      : record['requestParameters']['sourceIPAddress']   ,
            "uniq_code"      : record['s3']['bucket']['name'] +'/'+ record['s3']['object']['key']+'/'+record['eventTime']
        }        
        #layer_name must be added
        
        
        regex_name, parsed_info = a_f.parse_given_objcet_key( object_key = my_record['key'] )
        my_record.update(parsed_info)
        

        
            
        #print (json.dumps(my_record, indent = 4))
           
        #print ("burda1")
        S3_Files_PKID, msg = a_f.insert_line_to_db(my_record)
        if msg != None:
            print(  "=== THIS EVENT COULNT SAVE To DB ====\n", msg)
            a_f.mess_2_slack(
                            text = msg, 
                            key_value_data= my_record, 
                            LOG_TYPE = "error",
                            stack = my_record['stack'], 
                            state = my_record['state']
                            )
            continue
        
        print ("Inserted row id : ", S3_Files_PKID)
        my_record['S3_Files_PKID'] = S3_Files_PKID
        
        #Incoming File Info Mess
        if my_record['Is_Formatted'] == True:
            #give_info_2_slack(text = "New .{File_Type} File Came!".format(File_Type = my_record['File_Type']), key_value_data= my_record, file_id = S3_Files_PKID, LOG_TYPE = "fetch_parquet_print", stack = my_record['Stack'], state = my_record['State'])
            status = a_f.deliver_object_2_sqs( regex_name, my_record)            
            if status == 200 or status == 0:                                                 
                a_f.mess_2_slack(
                                text            = a_f.get_system_constans()['regexes_and_s3_trigger_texts'][regex_name].format(**my_record), 
                                key_value_data  = my_record, 
                                file_id         = S3_Files_PKID, 
                                LOG_TYPE        = a_f.get_system_constans()['regexes_and_log_types'][regex_name], 
                                stack           = my_record['stack'], 
                                state           = my_record['state']
                            )
            else:
                a_f.mess_2_slack(
                                text            = status, 
                                key_value_data  = my_record, 
                                file_id         = S3_Files_PKID, 
                                LOG_TYPE        = "error", 
                                stack           = my_record['stack'], 
                                state           = my_record['state']
                            )                
                        
    
        if regex_name == 'my_latest_regex':
            client = boto3.client("lambda")
            response = client.invoke(
                FunctionName = 'arn:aws:lambda:eu-central-1:027534141241:function:Midas--Sg_S3_File_Trigger_for_Decode2',
                InvocationType = 'Event',
                Payload = json.dumps(event)
            )

