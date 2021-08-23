# -*- coding: UTF-8 -*-
# @author =__Uluç Furkan Vardar__
# @version: 3.0.0
# This function runs in FrankFurt region. (the center of the System_Bet )
# mail system alerts
# 3 invocations at night

from datetime import datetime,timedelta
import boto3
import math
import json
from libs import arc_functions as arc_functions

from uluc_db_controller import mySQL_db_controller
import copy
import uuid

a_f = None

 
def lambda_handler(event, context):  
    #return 0

    ### params control
    state = event.get('check', None)
    if state == None : 
        print ("Not setted control state!!!")
        return{'status': "Not setted control state!!!" }      
    
    stack = event.get('stack', None)            
    if stack == None : 
        print ("Not setted stack!!!")
        return{'status': "Not setted stack!!!" }      
    
    is_test = event.get('is_test', None)            
    
    if is_test != None : 
        print ("This is a TEST!!!")        
        
        
    data_date_dif = event.get('data_date_dif', None)            
    data_date = None
    if data_date_dif != None :         
        data_date = ( datetime.now() + timedelta(days=data_date_dif) ) .strftime("%Y/%m/%d")
    
    print( "data_date : ",data_date )

    ## Constants
    global a_f
    a_f = arc_functions("{stack}_manifest.json".format(stack = stack.replace('.','_')) )
    system_constants = a_f.get_system_constans()    
    alu_trigger_config = system_constants['alu_trigger_config']
    
    
    ### Is there any new file in fetch states
    working_sqs_name = alu_trigger_config['which_sqs']
    sqs_url = system_constants['Sqses'][state][working_sqs_name]
    print (sqs_url)
    
    sqs_region = system_constants['Sqses']['regions']    
    print (sqs_region)
    
    
    number_of_item = a_f.check_how_may_item_in_sqs( sqs_region , sqs_url )
    if is_test !=None:
        number_of_item = event.get("number_of_item", 100)
        
    if number_of_item == 0 :
        print ("Any File Fetch!!!")
        #return{'status': "Any File Fetch!!!" }      

    print ("number_of_item : ", number_of_item )
    ##################################################################
    ###### CHECK Stack Wants For Starting, then Create YAYGARAA ######
    min_number_of_file = alu_trigger_config['what_is_expected']['min_number_of_file']
    is_yaygara = False
    if number_of_item < min_number_of_file and data_date != None:
        ##### VELVERE, YAYGARAA YARAT #####
        
        # first look, is there any report generated if yess, means previus execution is succes but no there is an error :)
        db_report_control = alu_trigger_config['what_is_expected']['db_report_control'].format(stack = stack, state = state, data_date = data_date) 
        print ('db_report_control : ' + db_report_control)
        resp, msg = a_f.run_sql_in_system_db(sql = db_report_control, operation_chosee = 'execute_and_return')        
        print (resp)
        if msg != None:
            if msg == 'No returned row!':
                ## Yaygara timeee, here means missing files.
                is_yaygara = True
        else:
            if int(resp['count']) == 0:
                is_yaygara = True
        print ("is_yaygara :" , is_yaygara)
                
        if is_yaygara == True:
            # Which files are not exist, Find them
            db_control_sql = alu_trigger_config['what_is_expected']['db_control_sql'].format(stack = stack, state = state, data_date = data_date) 
            print ('db_control_sql : ' + db_control_sql)
            resp, msg = a_f.run_sql_in_system_db(sql = db_control_sql, operation_chosee = 'execute_and_return_all')        
            if msg != None:
                if msg == 'No returned row!':
                    resp = []
                else:
                    return {'status': msg }    
            
            exist_table_names = [x.get('Table_Name',None) for x in resp]
            exist_table_names_len = len(exist_table_names)
            print ("exist_table_names_len : " , exist_table_names_len )
            expected_files_names = alu_trigger_config['what_is_expected']['files_names']
            if exist_table_names_len != len(expected_files_names):
                missing_tables = [x for x in expected_files_names if x not in exist_table_names]
                    
                missing_tables_info = { "Missing File {number}".format( number = i +1) : table_name for i, table_name in enumerate(missing_tables)   }
                a_f.mess_2_slack(
                                text            = "!!!MISSING FILES EXIST!! \n PLEASE CHECK LISTED FILES.", 
                                key_value_data  = missing_tables_info,                             
                                LOG_TYPE        = "missing_files_alert", 
                                stack           = stack, 
                                state           = state
                            )       
                error_mess = [ k+" : "+v for k,v in missing_tables_info.items()]
                error_mess = "\n".join(error_mess)
                
                a_f.send_email(subject = "!!!MISSING FILES EXIST!!!", state = state, data_date = data_date, error_mess = error_mess)       
        return 0
    ##################################################################
    
    
    ### Is there any open machine 
    sql = alu_trigger_config['db_machine_check_sql']
    resp, msg = a_f.run_sql_in_system_db(sql.format(stack = stack, state = state), operation_chosee = 'execute_and_return')    
    if msg != None:
        return {'status': msg }        
        
        

    
    #BURAAA IKLAY
    if str(resp["Machine_Status"]) != "terminated":
        #youmu kaldır alltakileri yorumla
        #pass
        print ("Already Open Machines Exist!")
        return {'status': "Already Open Machines Exist!" }        


    
    ## All checks are okey, lets open machines
    number_of_node = int(math.ceil(float(number_of_item)/alu_trigger_config['divide'] ))
    ttl = 90
    if number_of_node>5:
        ttl = 250    
    if number_of_node>100:
        number_of_node = 60

    payload = alu_trigger_config["FarmAPI"].replace('{ttl}', str(ttl) ).replace('{state}', state).replace('{stack}', stack).replace('{number_of_node}', str(number_of_node)) 
    payload = json.loads(payload)
    print (json.dumps(payload, indent = 4))

    lambda_client = boto3.client('lambda', 'eu-west-1')
    lambda_response = lambda_client.invoke(
                                            FunctionName = 'FarmAPI--Create_Cluster',
                                            InvocationType = 'Event',
                                            Payload = json.dumps(payload) )
            
    print ( "Cluster Open Request is Sended")
    
    
    a_f.mess_2_slack(text = "System Decided Open an Instance", key_value_data= { "number_of_machine" : number_of_node},LOG_TYPE = "system_log", stack = stack, state = state)
