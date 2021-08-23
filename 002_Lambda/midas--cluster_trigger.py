# -*- coding: UTF-8 -*-
# @author =__Uluç Furkan Vardar__
# @version: 1.0.0

from datetime import datetime
import boto3
import math
import json

from my_Database_Controller import Database_Controller
import copy
import uuid

states = { 
    "dev" : {"sqs" : "https://sqs.eu-central-1.amazonaws.com/027534141241/SG_Fetch_Sqs_Dev", "sql" : "SELECT  (CASE exists ( select Machine_Status from System_Bet_DB.machine_logs where Region = 'eu-central-1' and State = 'dev' order by Action_Time desc limit 1 )  WHEN FALSE THEN 'terminated' WHEN TRUE THEN  (select Machine_Status from System_Bet_DB.machine_logs where Region = 'eu-central-1' and State = 'dev' order by Action_Time desc limit 1) END) AS Machine_Status;"},
    "prod" : {"sqs" : "https://sqs.eu-central-1.amazonaws.com/027534141241/SG_Fetch_Sqs_Prod", "sql" : "SELECT  (CASE exists ( select Machine_Status from System_Bet_DB.machine_logs where Region = 'eu-central-1' and State = 'prod' order by Action_Time desc limit 1 )  WHEN FALSE THEN 'terminated' WHEN TRUE THEN  (select Machine_Status from System_Bet_DB.machine_logs where Region = 'eu-central-1' and State = 'prod' order by Action_Time desc limit 1) END) AS Machine_Status;"}
}
connection = {
            'host' : 'news-crawler.cynsz1ewwmpr.eu-west-1.rds.amazonaws.com', 
            'user' : 'master'   ,
            'password' : 'huramazon',
            'db' : 'System_Bet_DB'}

def check_how_may_item_in_sqs(sqs_url):
    client = boto3.client('sqs')    
    response = client.get_queue_attributes(
                    QueueUrl=sqs_url,
                    AttributeNames=['ApproximateNumberOfMessages'] )
    return int( response['Attributes']['ApproximateNumberOfMessages'] )

def give_info_2_slack(text, key_value_data, stack , state, file_id = "Unknown", LOG_TYPE = "debug"):
    
    key_value_data1 = copy.deepcopy(key_value_data)
    '''
    LOG_TYPE can be 
    info debug error warning
    '''

    #attributes = {}
    attributes= { k : { 'DataType': 'String', 'StringValue': str(v) } for k, v in key_value_data1.items()}
    #for k, v in key_value_data:

        #attributes[k] = { 'DataType': 'String', 'StringValue': str(v) }
    attributes['File_ID'] = { 'DataType': 'String', 'StringValue': str(file_id) }
    attributes['LOG_TYPE'] = { 'DataType': 'String', 'StringValue': str(LOG_TYPE) }
    attributes['State'] = { 'DataType': 'String', 'StringValue': str(state) }
    attributes['Stack'] = { 'DataType': 'String', 'StringValue': str(stack) }
    

    #print json.dumps(attributes)            
    sqs = boto3.client( 'sqs', 'eu-central-1'  )
    queue_url = 'https://sqs.eu-central-1.amazonaws.com/027534141241/Bet_System_QSQ.fifo'
    response = sqs.send_message(
        QueueUrl=queue_url,
        MessageGroupId='msggpid1',
        MessageDeduplicationId = str(uuid.uuid4()),
        MessageBody = json.dumps({"text" : text, "fields" : attributes})
    )     
    
def lambda_handler(event, context):
    #return 0
    if event.get("check", None) != None:
        state = event["check"]
        print ("event check bos gelmedi. -- ",  state )
    
        n_q = check_how_may_item_in_sqs(states[state]["sqs"])
        if n_q >0:
        #if True:
            print "Makine acilmali."
            
            print "sql check"
            print states[state]["sql"]
            
            
            db_c = Database_Controller(**connection)
            resp, msg = db_c.execute_and_return(states[state]["sql"])
            db_c.close_connection()
            if msg != None:
                return {'status': msg }
            
            if str(resp["Machine_Status"]) != "terminated":
                return {'status': "hali hazirda acik makine var" }
                
            print 'makine acilacak. sql kontorl gecti'
            n_m = int(math.ceil(n_q/8.0))
            ttl = 45
            if n_m>5:
                ttl = 250
            machine_json = {
              "inf": {
                "eu-central-1": {
                  "ImageId": "ami-09104bac8ced0e6e4",
                  "IamInstanceProfile": "arn:aws:iam::027534141241:instance-profile/admin_for_test_ec2",
                  "InstanceType": "c5.4xlarge",
                  "key_pair_name": "Uluc_frankfurt_key",
                  "SecurityGroup": "Public_Security_Group"
                }
              },
              "instance_names": "SG-%s_SG_FARMAPI_Cluster"%(state),
              "fail_behavior": "stop",
              "number_of_nodes": n_m,
              "number_of_ignored_nodes": 2,
              "workingDirectory": "/home/ec2-user",
              "Tags": {
                "SG": "%s_SG_FARMAPI_Cluster"%(state),
                "State": state
              },
              "working_type": {
                "like_Lambda": {
                  "generation_ttl": ttl,
                  "command_for_each": [
                    "export LANG=tr_TR.UTF-8"  ,
                    "aws s3 cp s3://sg.bet.data/git-prod-scripts-do-not-touch/000_sg_midas/ ./ --recursive",
                    "aws s3 cp s3://sg.bet.data/git-prod-scripts-do-not-touch/001_dependents/ ./ --recursive",
                    "mkdir ./data/",
                    "python36 ./midas_1_manager.py -ws %s -wjf ALL"%(state)
                  ],
                  "Args": {
                  }
                }
              }
            }
            
            lambda_client = boto3.client('lambda', 'eu-west-1')
            lambda_response = lambda_client.invoke(
                                    	FunctionName = 'FarmAPI--Create_Cluster',
                                    	InvocationType = 'Event',
                                    	Payload = json.dumps(machine_json) )
            
            print "acma talebi attim"
            give_info_2_slack(text = "System Decided Open an Instance", key_value_data= {},LOG_TYPE = "system_log", stack = "sg.bet.data", state = state)

        else:
            print "Makine acilmamali"