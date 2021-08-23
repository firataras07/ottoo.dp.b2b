import json
import boto3
import datetime
import copy
import uuid
import pymysql
from uluc_db_controller import mySQL_db_controller    

def get_instance_tags( region, instance_id ):
    ec2 = boto3.resource('ec2', region)
    ec2instance = ec2.Instance(instance_id)
    return list(ec2instance.tags)

map_ = {"eu-central-1" : "sg.bet.data", "eu-west-2" : "misli.bet.data"}
connection = {
            'host' : 'news-crawler.cynsz1ewwmpr.eu-west-1.rds.amazonaws.com', 
            'user' : 'master'   ,
            'password' : 'huramazon',
            'database' : 'System_Bet_DB'}
            
            
            
def give_info_2_slack(text, key_value_data, stack , state, file_id = "Unknown", LOG_TYPE = "debug"):
    body = copy.deepcopy(key_value_data)
    body['text'] = str(text)
    if file_id==None or file_id == "Unknown":
        file_id = key_value_data.get("S3_Files_PKID", "Unknown")                        
    body['File_ID'] = str(file_id)
    body['LOG_TYPE'] = str(LOG_TYPE)
    body['State'] = str(state)
    body['Stack'] = str(stack)

    #print json.dumps(attributes)            
    sqs = boto3.client( 'sqs', 'eu-central-1'  )
    queue_url = 'https://sqs.eu-central-1.amazonaws.com/027534141241/Bet_System_QSQ.fifo'
    response = sqs.send_message(
        QueueUrl=queue_url,
        MessageGroupId='msggpid1',
        MessageDeduplicationId = str(uuid.uuid4()),
        MessageBody = json.dumps(body)
    )     
    
def lambda_handler(event, context):
    try:
        region = event['region']
        instance_id = event['detail']['instance-id']        
        data_of_instance = {}  
        tags = get_instance_tags( region, instance_id )
        for tag in tags:
            data_of_instance[tag['Key']] = tag['Value']
        if data_of_instance.get('Hera', None) == None:
            return 0

        m_state = event['detail']['state']
        time = event['time']
        
        
        

            
                
            
        sql_data = {
            "Machine_Status" : m_state,
            "Layer_Name" : data_of_instance.get('Hera', None),
            "State" : data_of_instance.get('State', None).lower(),
            "Region" : region,
            "Stack" : map_[region],
            "Instance_ID" : instance_id,
            "Action_Time" : time
            
        }
        
        sql = "INSERT INTO `System_Bet_DB`.`machine_logs` (`Stack`, `State`, `Layer_Name`, `Machine_Status`, `Inserted_Time`, `Region`, `Instance_ID` , `Action_Time`) VALUES ('{Stack}', '{State}', '{Layer_Name}', '{Machine_Status}', now(), '{Region}', '{Instance_ID}', '{Action_Time}');".format(**sql_data)
        print (sql) 
        
        try:
    
            db_c = mySQL_db_controller(connection)
            resp, msg = db_c.execute_only(sql)            
            give_info_2_slack(text = "System Instance Status Change!", key_value_data= sql_data, LOG_TYPE = "system_log", stack = map_[region], state = data_of_instance.get('State', 'dev'))
        except Exception as e:
            give_info_2_slack(text = "System Instance Status Change! Couldnt do! \n Exception :"+str(e), key_value_data= sql_data,LOG_TYPE = "system_log", stack = map_[region], state = data_of_instance.get('State', 'dev'))
            
    except Exception as e:
        give_info_2_slack(text = "System Instance Status Change! Couldnt Managed! \n Exception :"+str(e), key_value_data= event, LOG_TYPE = "system_log", stack = "misli.bet.data", state = 'dev')            
        give_info_2_slack(text = "System Instance Status Change! Couldnt Managed! \n Exception :"+str(e), key_value_data= event, LOG_TYPE = "system_log", stack = "misli.bet.data", state = 'test')            
        give_info_2_slack(text = "System Instance Status Change! Couldnt Managed! \n Exception :"+str(e), key_value_data= event, LOG_TYPE = "system_log", stack = "misli.bet.data", state = 'prod')            
        
        
        