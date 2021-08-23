# -*- coding: UTF-8 -*-
from datetime import datetime,timedelta
import boto3
import json
import time
import os
import sys
import copy
import uuid
import os
import sys
import argparse
import os
import signal
import json
import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq
import pandasql as pdsql
import numpy as np
import re

from libs import arc_functions as arc_functions


################################################## Function Name Mapping ##################################################
import eczastok_2_fetch1 as fetch1
fetch1_functions_map = {
    "standart_transform": fetch1.standart_transform
}
import eczastok_3_decode1 as decode1
decode1_functions_map = {



"report_1_Daily_Customer_1_metrics" : decode1.report_1_Daily_Customer_1_metrics,
"report_1_Daily_Customer_3_marketing" : decode1.report_1_Daily_Customer_3_marketing,
"report_2_Daily_Order_1_metrics" : decode1.report_2_Daily_Order_1_metrics,
"report_1_Daily_Product_Summary_1_view" : decode1.report_1_Daily_Product_Summary_1_view,
"report_1_Weekly_Product_Summary_1_view" : decode1.report_1_Weekly_Product_Summary_1_view,
"report_1_Daily_Product_Summary_2_view" : decode1.report_1_Daily_Product_Summary_2_view

}
import eczastok_4_decode2 as decode2
decode2_functions_map = {
    "enriched_order_and_order_item_join" : decode2.enriched_order_and_order_item_join,
    "enriched_product_and_order_item_join" : decode2.enriched_product_and_order_item_join,
    "enriched_product_and_order_item_and_order_join" : decode2.enriched_product_and_order_item_and_order_join,
    "enriched_product_customer_vendor_product_category_mapping_join" : decode2.enriched_product_customer_vendor_product_category_mapping_join,
    "enriched_customer_and_order_join" : decode2.enriched_customer_and_order_join,
    "enriched_customer_and_vendor_join" : decode2.enriched_customer_and_vendor_join,
    "enriched_customer_vendor_ccrmapping_customer_role_join" : decode2.enriched_customer_vendor_ccrmapping_customer_role_join,
    "enriched_customer_vendor_product_ccrmapping_customer_role_join" : decode2.enriched_customer_vendor_product_ccrmapping_customer_role_join,
    "enriched_customer_customer_customerRole_mapping_customer_role_join" : decode2.enriched_customer_customer_customerRole_mapping_customer_role_join,
    "enriched_order_customer_customerRole_mapping_customer_role_join" : decode2.enriched_order_customer_customerRole_mapping_customer_role_join

}
import eczastok_5_alu1 as alu1
alu1_functions_map = {
    "report_3_Daily_Product_1_metrics" : alu1.report_3_Daily_Product_1_metrics,
    "report_1_Daily_Customer_11_metrics" : alu1.report_1_Daily_Customer_11_metrics,
    "report_5_Daily_Order_City_Summary_1_metrics" : alu1.report_5_Daily_Order_City_Summary_1_metrics,
    "report_4_Daily_Active_Customer_Summary_view" : alu1.report_4_Daily_Active_Customer_Summary_view
        
}

layer_map_map = {
    "Fetch_1" : fetch1_functions_map,
    "Decode_1" : decode1_functions_map,
    "Decode_2" : decode2_functions_map,
    "Alu_1" : alu1_functions_map
}
################################################## ##################### ##################################################


################################################## Layer Management ##################################################
def record_manager(my_record, layer_name):
    global a_f    

    try:
        dependent_table_key = my_record["dependent_table_key"]        
        status, imports, exports = a_f.get_operation_infos(layer_name, dependent_table_key)
    except Exception as e:
        print( "Error : ", e)
        a_f.mess_2_slack( 
                            text           = "{layer_name} Layer Clouldn't Read dependent operation!! Error : {e}".format(layer_name = layer_name , e = str(e)), 
                            key_value_data = my_record,  
                            stack          = my_record['stack'],
                            state          = my_record['state'],
                            file_id        = my_record['S3_Files_PKID'],
                            LOG_TYPE        = "error"
                        )
    
    #Means error
    if status != 200:
        msg = imports
        '''
        a_f.mess_2_slack(   
                        text = msg.format(**my_record),
                        key_value_data = my_record, 
                        LOG_TYPE="warning" ) 
        '''
        return status
        
    # print json.dumps(my_record, indent = 4)
    # print (json.dumps(my_rules, indent = 4))

    #debug print    
    '''
    a_f.mess_2_slack( 
                        text           = "{layer_name} Layer Get A File".format(**my_record), 
                        key_value_data = my_record,  
                        stack          = my_record['stack'],
                        state          = my_record['state'],
                        file_id        = my_record['S3_Files_PKID'],
                        LOG_TYPE        = "debug"
                    )     
    '''
    try:
        # downloand_dependent_files
        fiexed_dependent_tables = [ a_f.fixed_object_keys( my_record, dependent_object_key) for dependent_object_key in imports['dependents']]
        fiexed_dependent_tables_1 = []
        for f in fiexed_dependent_tables:
            if type(f) == type(list()):
                print ("F : ", f)
                fiexed_dependent_tables_1 += f
            else:
                fiexed_dependent_tables_1.append(f)        
        fiexed_dependent_tables = fiexed_dependent_tables_1
        # downloand_dependent_files
        #print ("DEPENDENT FILES:\n", json.dumps(fiexed_dependent_tables, indent = 4))
        
        dfs = a_f.get_needed_dfs(
                                    region_name = imports['location_meta']['from_region_name'],
                                    bucket_name = imports['location_meta']['from_bucket'],
                                    dependents  = fiexed_dependent_tables,
                                    default_delimiter = ',', default_header = 0
                                )
    except Exception as e:
        print( "Error : ", e)
        a_f.mess_2_slack( 
                            text           = "{layer_name} Layer Clouldn't Read dependent Files!! Error : {e}".format(layer_name = layer_name , e = str(e)), 
                            key_value_data = my_record,  
                            stack          = my_record['stack'],
                            state          = my_record['state'],
                            file_id        = my_record['S3_Files_PKID'],
                            LOG_TYPE        = "error"
                        )
        return 260        
        
        
        
    # iter operations    
    #ky = list(exports.keys())[-1]
    #for table_will_export_name, table_export_operation_rule in zip([ky], [exports[ky]]):
    for table_will_export_name, table_export_operation_rule in exports.items():
        # time tracker
        status, operation_tracker_id = a_f.time_tracker(
                                                        state=my_record['state'],
                                                        stack=my_record['stack'],
                                                        operation_text="Layer {layer_name}, Operation {table_will_export_name} Starts!".format(layer_name=layer_name, table_will_export_name = table_will_export_name))                    
    
        # call method
        which_function_must_be_call = table_export_operation_rule['py_function_name']
        #if 'report_8_Daily_Event_Summary_4_sales' in which_function_must_be_call:
        #    #if  ('Betting_Type_Event_Summary' in which_function_must_be_call) :
        #    pass
        #else:
        #        continue
        print("which_function_must_be_call : ", which_function_must_be_call)
        

        
        try:
            #Call                        
            df = layer_map_map[layer_name][which_function_must_be_call]( dfs = dfs , table_export_operation_rule = table_export_operation_rule, my_record = my_record)
            
                
            
            #time_mid
            a_f.time_tracker( is_mid_point=True ,operation_text = "Function returns with success.", tracker_id=operation_tracker_id) 
            
        except Exception as e:
            _str = "Function returns Error : %s"%(str(e))
            print (_str)
            a_f.time_tracker( is_mid_point=True ,operation_text = _str, tracker_id=operation_tracker_id, send_now=True) 
            continue
            
        try:
            # save returned df
            status = a_f.save_df(
                out_file_format=table_export_operation_rule['out_file_format'],
                region_name=table_export_operation_rule['location_meta']['to_region_name'],
                bucket_name=table_export_operation_rule['location_meta']['to_bucket'],
                object_key=a_f.fixed_object_keys( my_record, table_export_operation_rule['location_meta']['to_path']),                         
                df=df
            )
            my_record.update({'Upload to S3 Status': status})
            
            
            # ENd operation
            a_f.time_tracker( operation_text = "Operation Finished with Success.", tracker_id=operation_tracker_id, is_end=True, additional_info = my_record ) 
        except Exception as e:
            _str = "Report Saving Error : %s"%(str(e))
            print (_str)
            a_f.time_tracker( is_mid_point=True ,operation_text = _str, tracker_id=operation_tracker_id, send_now=True)
            continue
            
            
    try:
        if layer_name == 'Alu_1':
            report_info_give()
        else:
            pass
    except Exception as e:
        print ("opps", e)            
            
    return 200       
################################################## ################ ##################################################


################################################## Execution Management ##################################################
def timeout_handler(signum, frame):
    try:
        global time_out
        #raise UlucException(409, 'Crawler Timeout!')
        _str = "Layer Timeout (no task for {time_out} second)".format(time_out=time_out)
        print(_str)
        #give_info_2_slack(text = _str , key_value_data = {},  LOG_TYPE = "warning", stack = 'data.platform.b2b.eczastok', state = state)
    except Exception as e:
        print(e)
    global continue_listen_sqs
    continue_listen_sqs = False
  
        
def listen_sqs(sqs_url, region, layer_name, state='dev'):
    global time_out, continue_listen_sqs, a_f, working_days_states
    
    signal.signal(signal.SIGALRM, timeout_handler)
    signal.alarm(time_out)

    # Concetion to SQS for listening
    sqs = boto3.resource('sqs', region)
    queue = sqs.get_queue_by_name(QueueName=sqs_url.split('/')[-1])

    #while
    while continue_listen_sqs:
        #print ("BEKLIYORUMM")
        try:
            for message in queue.receive_messages(AttributeNames=['All']):                
                #signal.signal(signal.SIGALRM, timeout_handler)
                #signal.alarm(550)            
                signal.alarm(0)            
                my_record = json.loads(message.body)                
                
                working_days_states.append(my_record['state']+'_'+my_record['data_date'])
                #printing 
                print("\n\n\n","="*20, "New Job", "="*20)
                try:
                    print("Job Key : ", my_record['key'])
                except Exception as e:
                    pass
                    

                status = record_manager(
                                            my_record=my_record,                     
                                            layer_name=layer_name
                                        )
                print ("uluc_is_the_best1")
                if status == 200:
                    status = a_f.update_convert_status_of_file(my_record['S3_Files_PKID'], layer_name)
                    print ("uluc_is_the_best2")
                    '''
                    if status != 200:                    
                        a_f.mess_2_slack(
                            text="=== %s CLOUND'T UPDATE CONVERT INFO ====" % (
                                layer_name),
                            key_value_data=my_record,
                            stack=my_record['stack'],
                            state=my_record['state'],
                            file_id=my_record['S3_Files_PKID'],
                            LOG_TYPE="error"
                        )
                        continue
                        #return 600
                    '''
                else:
                    '''
                    a_f.mess_2_slack(
                        text="=== %s MANAGER FUNCTION FAILS ====\n%s" % (layer_name, status),
                        key_value_data=my_record,
                        stack=my_record['stack'],
                        state=my_record['state'],
                        file_id=my_record['S3_Files_PKID'],
                        LOG_TYPE="error"
                    )
                    print("== COULNDT DONE ==", '\n'*4)
                    continue
                    #return 622
                    '''
                    pass
                print ("uluc_is_the_best3")
                message.delete()
                print("Job Finished with Success!")

                signal.signal(signal.SIGALRM, timeout_handler)
                signal.alarm(time_out)            
                print("="*20, " DONE ", "="*20, '\n'*4)
                print("\nTimeout {time_out} updated".format(time_out=time_out))
        
        except Exception as e:
            a_f.mess_2_slack( 
                                text           = "=== %s Unknown Error ====\n%s"%(layer_name,str(e)), 
                                key_value_data = my_record,  
                                stack          = my_record['stack'],
                                state          = my_record['state'],
                                file_id        = my_record['S3_Files_PKID'],
                                LOG_TYPE        = "error"
                            )                                

execution_map = {
    "Fetch_1" : listen_sqs,
    "Decode_1" : listen_sqs,
    "Decode_2" : listen_sqs,
    "Alu_1" : listen_sqs
}
###################################################### ################ ##################################################

################################################## MAIN ##################################################
def give_arguments():
    # Parsing Arguments
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('-ws', '--working_state',help="Working State", type=str, default="dev")
    parser.add_argument('-wjf', '--work_just_for',help="A layer name that wanted to run only, default is all", type=str, default="ALL")
    args = parser.parse_args(sys.argv[1:])

    # Arguments info
    # print ('Argumenst that will be used;\n%s\n\n'%args)
    return args


def main():
    # Args
    args = give_arguments()

    # arc_functions
    global a_f, continue_listen_sqs
    #a_f = arc_functions()

    # Execution Steps Getting
    execution_steps = a_f.get_system_constans()['layer_execution_order']
    if args.work_just_for != "ALL":
        execution_steps = args.work_just_for.split(",")
    print (execution_steps)

    # State Choosing
    state = args.working_state

    # Sqs Data Getting
    sqses = a_f.get_system_constans()['Sqses'][state]
    region = a_f.get_system_constans()['resources_region']
    stack = a_f.get_system_constans()['stack']

    status, manager_tracker_id = a_f.time_tracker(
        state=state,
        stack=stack,
        operation_text="Manager.py Starts",
    )
    for execution_step in execution_steps:
        print(" Execution Steps that will run : ", execution_step)
        continue_listen_sqs = True
        try:
            status, execution_tracker_id = a_f.time_tracker(
                                                            state = state,
                                                            stack = stack,
                                                            layer_name = execution_step,
                                                            operation_text="Layer {execution} Starts!".format( execution=execution_step) )
            listen_sqs(
                            sqs_url=sqses.get(execution_step, None),
                            region=region,
                            layer_name=execution_step,
                            state=state                
                        )
            a_f.time_tracker( operation_text = "Execution Finished with Success.", tracker_id=execution_tracker_id, is_end=True )
        except Exception as e:
            _str = "Execution Step Error : "+ str(e)
            print(_str)
            a_f.time_tracker( is_mid_point=True ,operation_text = _str, tracker_id=execution_tracker_id, send_now=True) 

    a_f.time_tracker(operation_text = "Manage.py Finised Succesfully", tracker_id=manager_tracker_id,is_end=True)
    

        
        
def report_info_give():
    global a_f
    data_date = ( datetime.now() + timedelta(days=-1) ).strftime("%Y/%m/%d")

    sql = "SELECT count(*) as count FROM data_platform_b2b_log_db.S3_Files where Stack = 'data.platform.b2b.eczastok' and Data_Date = '{data_date}'   and  S3_Files.State = 'prod' and S3_Files.Key like '%report%.csv'".format(data_date = data_date)
    rsp , msg = a_f.run_sql_in_system_db(sql, 'execute_and_return')
    
    rsp['data_date'] = data_date
    a_f.mess_2_slack( 
                        text           = "Number of reports", 
                        key_value_data = rsp,  
                        stack          = 'data.platform.b2b.eczastok',
                        state          = 'prod',                            
                        LOG_TYPE        = "info"
                    )
    sql = "SELECT count(*) as count FROM data_platform_b2b_log_db.S3_Files where Stack = 'data.platform.b2b.eczastok' and Data_Date = '{data_date}'   and  S3_Files.State = 'prod' and S3_Files.Key like '%report%.csv' and Converted_Status is null;".format(data_date = data_date)
    rsp , msg = a_f.run_sql_in_system_db(sql, 'execute_and_return')
    rsp['data_date'] = data_date
    a_f.mess_2_slack( 
                        text           = "Number of non insetted report last day", 
                        key_value_data = rsp,  
                        stack          = 'data.platform.b2b.eczastok',
                        state          = 'prod',                            
                        LOG_TYPE        = "info"
                    )      

#global continue_listen_sqs, time_out, a_f
continue_listen_sqs = True
time_out = 10
a_f = arc_functions()
working_days_states = []
main()


