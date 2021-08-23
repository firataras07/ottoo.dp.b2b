#!/usr/bin/env python
# -*- coding: UTF-8 -*-
import json
import requests
import time
import datetime
import boto3

colors = {
            "info": "36a64f", #yesil
            "debug" :"6ecadc" ,#mavi
            "error" :"e01563" ,#kırmızı
            "warning": "e9a820", #sarı
            "missing_files_alert" :"e01563" ,#kırmızı
        }
def to_Dynamo( json_data ):


    
    dynamodb = boto3.resource('dynamodb',region_name='eu-central-1') 
    table = dynamodb.Table( 'BetSystem_DynamoDB' )
    
    cur_min = (datetime.datetime.now()+datetime.timedelta(hours=3)).strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    expire = (datetime.datetime.now()) + datetime.timedelta(hours=120)
    File_ID = json_data['File_ID']
    del json_data['File_ID']
    
    
    Event_Time = cur_min

    data={  'File_ID' : str(File_ID),
            'TableTime' : cur_min,
            'expire_on' : int(time.mktime(expire.timetuple())),
        }
        
    data.update(json_data)
    a = table.put_item( Item = data )   
    return a
    

def lambda_handler(event, context):
    color = ""
    state = ""
    stack = ""
    LOG_TYPE = ""
    file_id = ""
    for record in event['Records']:
        #print json.dumps(record)
        fields = []
        event = json.loads(record['body'])
        dyno_json = {}
        
        #for attribute_name, attribute_info  in event['fields'].items():
        for attribute_name, attribute_info  in event.items():
            slack_attributes = { "title" : attribute_name, "value" : attribute_info, "short" : "true" }
            
            if attribute_name == "LOG_TYPE":
                color = colors.get(slack_attributes['value'],'6ecadc')
                LOG_TYPE = slack_attributes['value']
                dyno_json[attribute_name] = attribute_info
                continue
            if attribute_name in ['uniq_code', 'Bucket']:
                continue
            if attribute_name == "Key":
                slack_attributes = { "title" : attribute_name, "value" : attribute_info }
                fields = [slack_attributes] + fields
                continue
            if attribute_name == "State":
                state = slack_attributes['value']
                dyno_json[attribute_name] = attribute_info
            if attribute_name == "Stack":
                stack = slack_attributes['value']
                dyno_json[attribute_name] = attribute_info
            if attribute_name == "File_ID":
                file_id = slack_attributes['value']        
                dyno_json[attribute_name] = attribute_info
                continue
            dyno_json[attribute_name] = attribute_info
            fields.append(slack_attributes)    
        
        
        hh = {
            "sansgirisim" : "Bearer xoxb-1567216941312-1545061991781-69pIFfRRg1jJwVAm0UFVabAE",
            "misli" : "Bearer xoxb-1643884111813-1640202122662-B1DHEws53PwpxThxZSQ5BTxC"
        }    
        access_ = ""
        channel = ""
        if stack == 'sg.bet.data':
            channel = 'sansgirisim_'+state
            access_ = hh["sansgirisim"]
        elif stack == 'misli.bet.data':
            channel = 'misli_'+state
            access_ = hh["misli"]
        
        
        title =  'File ID : '+file_id +"\n"+ dyno_json['text']
        if file_id == 'Unknown':
            title = dyno_json['text']
        
        if LOG_TYPE == 'system_log':
            payload = {  "channel": channel, "attachments": [{ "title" : dyno_json['text'], "fields" : fields, "color" : color}] }
        else:    
            payload = {  "channel": channel, "attachments": [{ "title" : title, "fields" : fields, "color" : color}] }
        #print json.dumps(payload, indent = 4)
        
        

        
        headers = {
          'Content-Type': 'application/json',
          'Authorization': access_
        }

        try:
            
            response = requests.request("POST","https://slack.com/api/chat.postMessage", headers=headers, data=json.dumps(payload))
            print(response.text)
        except Exception as e:
            print ( e)
        
        
        
        try:
            if LOG_TYPE == 'system_log':
                payload = {  "channel": channel+'_'+ LOG_TYPE, "attachments": [{ "title" : dyno_json['text'], "fields" : fields, "color" : color}] }
            else:   
                payload = {  "channel": channel+'_'+ LOG_TYPE, "attachments": [{ "title" : title, "fields" : fields, "color" : color}] }
            print (payload)
            response = requests.request("POST", "https://slack.com/api/chat.postMessage", headers=headers, data=json.dumps(payload))
            print(response.text)        
        except Exception as e:
            print (e)


        try:
            resp = to_Dynamo( dyno_json )
            print( 'Dydno resp : ', resp)        
        except Exception as e:
            print ('to_DynamoTimeSeries - ', e)
            print ('DynamoDB Insert Error ')  
