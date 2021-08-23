# -*- coding: UTF-8 -*-
from datetime import date
import re
import json
import time
import os
import sys
import copy
import uuid
import datetime
import boto3

from dateutil.relativedelta import *

class arc_functions():
    # Use this class as globaly in manager
    def __init__(self, manifest_file_path='./manifest.json'):
        print ("YARATILAN A_F OBJESIIII")
        self.manifest_json = json.loads(open(manifest_file_path, 'r').read())
        self.time_tracker_json = {}

    def get_system_constans(self):
        return self.manifest_json['Constants']

    def check_how_may_item_in_sqs( self, sqs_region , sqs_url):
        client = boto3.client('sqs', sqs_region)    
        response = client.get_queue_attributes(
                        QueueUrl=sqs_url,
                        AttributeNames=['ApproximateNumberOfMessages'] )
        return int( response['Attributes']['ApproximateNumberOfMessages'] )


    def get_manifest_part(self, layer_name, triggered_file_name=None, record=None):
        '''
        Fetch_1
        Decode_1
        Decode_2
        Alu_1    
        '''
        if triggered_file_name == None and record != None:
            triggered_file_name = record['table_name'] + \
                '.' + record['file_type']

        elif triggered_file_name == None and record == None:
            return self.manifest_json[layer_name]

        part_of_manifest = {}
        if layer_name == 'Fetch_1':
            part_of_manifest = self.manifest_json[layer_name].get(
                triggered_file_name, None)
        if layer_name == 'Decode_1':
            # aslında birden fazla kural gelir
            part_of_manifest = self.manifest_json[layer_name].get(
                triggered_file_name, None)
        if layer_name == 'Decode_2':
            # aslında birden fazla kural gelir
            part_of_manifest = self.manifest_json[layer_name].get(
                triggered_file_name, None)
        if layer_name == 'Alu_1':
            # aslında birden fazla kural gelir
            part_of_manifest = self.manifest_json[layer_name].get(
                triggered_file_name, None)
        return part_of_manifest

    def parse_given_objcet_key(self, object_key):
        #import ast
        result = None, None

        for regex_name, regex_rule in self.get_system_constans()['regexes'].items():
            # for regex_name, regex_rule in regexes.items():
            try:
                #print ("regex" , regex_name, regex_rule)
                #regex_rule = re.compile(regex_rule)
                formatted_gorups_names = self.get_system_constans()["regex_keys"]
                #print (object_key)
                match = re.search(regex_rule, object_key)

                formatted_json = {}
                for k in formatted_gorups_names:
                    try:
                        formatted_json[k] = match.group(k)
                    except Exception as e:                        
                        # print e
                        pass
                # print formatted_json
                if len(formatted_json.keys()) == 0:
                    continue

                formatted_json['Is_Formatted'] = True
                return regex_name, formatted_json

            except Exception as e:
                print("HATA VAR : ", str(e))
                

        return result

    def deliver_object_2_sqs(self, regex_name, record):                
        # own_date_last_rnd_str
        sqs_name = self.get_system_constans()['regex_sqs_relation'].get(regex_name, None)
        record["layer_name"] = sqs_name
        if sqs_name == None:
            print("No relation for file and SQS")
            return 0
        if "Write_Back" not in regex_name :    
            #incoming table_name_and_format
            tb_f = "{table_name}.{file_type}".format(**record)
            if record["layer_name"] != "Decode_2":
                layer_dependents = self.get_manifest_part(layer_name = sqs_name)['imports_of_layer'].keys()
                layer_dependents_files = [x.split('+')[1] for x in layer_dependents]
                for import_key, table_name_w_type in zip(layer_dependents, layer_dependents_files):
                    if tb_f == table_name_w_type:
                        record['dependent_table_key'] = import_key
                if record.get("dependent_table_key" , None) == None:
                    print ("This file isn't a depend file. no need to delivered next sqs.".format(state = record['state']))
                    return 200                                
            else:
                pass
            
        
        state_sqses = self.get_system_constans()['Sqses'].get(record['state'], None)
        if state_sqses == None:
            print ("No sqs for state : {state}".format(state = record['state']))
            return 200
        if sqs_name == 'Write_Back' and int(record['file_size'])>= 5000000:
            sqs_name = 'Big_Write_Back'            
        sqs_url = state_sqses[sqs_name]        
        try:            
            self.to_sqs(
                queue_url=sqs_url,
                message_body=record,
                queue_region=self.get_system_constans()['Sqses']['regions'],
            )
        except Exception as e:
            error_str = "File Clould't Delivered to SQS, " + str(e)
            print(error_str)
            raise Exception(error_str)
        return 200

    def get_exact_object_key_from_db(self, dependent):
        from uluc_db_controller import mySQL_db_controller 
        
        connection = self.get_system_constans()['bet_system_params']['db_connection']
        sql = "select s3_f.Key as object_key FROM data_platform_b2b_log_db.S3_Files as s3_f WHERE Stack = 'sg.bet.data' and s3_f.Key like '%s' order by Inserted_Time desc limit 1;" % (dependent)
        #print ("Own Date latest file get\n", sql)
        db_c = mySQL_db_controller(connection)
        resp, msg = db_c.execute_and_return(sql)
        
        if resp == False:
            return ""
        return resp['object_key']

    def get_parquet(self, region, bucket, object_key):
        import pandas as pd
        import pyarrow as pa
        import pyarrow.parquet as pq
        import pandasql as pdsql

        if not os.path.exists('./data'):
            os.makedirs('./data')
        os.system("rm ./data/asd.parquet")
        command = "aws s3 cp s3://%s/%s ./data/asd.parquet" % (bucket, object_key)
        a = os.system(command)
        if str(a) != "0":
            raise Exception("File Cloudn't Downloanded %s"%(object_key))
        df = pd.read_parquet('./data/asd.parquet')
        return df

    def get_csv(self, region, bucket, object_key, default_delimiter = '@', default_header = None):
        import pandas as pd
        import pyarrow as pa
        import pyarrow.parquet as pq
        import pandasql as pdsql
        # downloand csv file
        s3_client = boto3.client('s3', region_name=region)
        obj = s3_client.get_object(Bucket=bucket, Key=object_key)
        df = None
        if 'rlf_retailer_info' in object_key :
            df = pd.read_csv(obj['Body'], delimiter='#', header=None)    
        else:
            df = pd.read_csv(obj['Body'], delimiter=default_delimiter , header = default_header)
        return df

    def fix_col_names(self, df):
        new_cols = []
        colomns_maps = self.manifest_json['Write_Back']['target_db']['colomns']
        colomns_types_maps = self.manifest_json['Write_Back']['target_db']['colomns_types']
        for maybe_tuple in df.columns:        
            if type(maybe_tuple) == tuple:
                tmp_name = list(maybe_tuple)[::-1]
                tmp_name = [x for x in tmp_name if len(x)>0]
                #print (len(tmp_name))                    
                t = '_'.join(tmp_name)  
            else:
                #print ("Different col type", type(maybe_tuple))
                t = str(maybe_tuple).title()
            for x in ['OI_','P_']:
                t = t.replace(x, '')     
                       
            
            new_cols.append(colomns_maps.get(t.title(), t.title()))            
        df.columns = new_cols      
        
        types_ = {}
        for c in new_cols:
            if colomns_types_maps.get(c, None) !=None:
                types_[c]= colomns_types_maps.get(c, None)
        df = df.astype(types_)
        return df
        
    def save_df(self, out_file_format, region_name, bucket_name, object_key, df):
        import pandas as pd
        import pyarrow as pa
        import pyarrow.parquet as pq
        import pandasql as pdsql
                
        
        if not os.path.exists('./data'):
            os.makedirs('./data')
        if out_file_format == "parquet":
            local_file_path = "./data/upload_now.parquet"
            df.to_parquet(local_file_path)
        else:
            local_file_path = "./data/upload_now.csv"
            df = self.fix_col_names(df)
            ###drop emty cols.
                        
            try:
                stay = []
                for col_name in df.columns :
                    if (df[col_name] == 0.0).all() == False:
                        stay.append(col_name)    
                df = df[stay]   
            except Exception as e:
                print ("0 col clean error.", e)

            if 'final_csv' in object_key:
                df.to_csv(local_file_path, index = False, sep = ';')
            else:    
                df.to_csv(local_file_path, index = False)
            

            

        latest_key = object_key.split('--')[0]+"--latest."+out_file_format        
        try:
            s3_client = boto3.client('s3', region_name=region_name)
            response = s3_client.upload_file( local_file_path, bucket_name, object_key)
            response = s3_client.upload_file( local_file_path, bucket_name, latest_key)
            print('[Uploaded] S3 File : ', object_key)
        except Exception as e:
            print("Upload to S3 Error : ", str(e))
            return 205
        return 200



    def get_start_end_days_of_weekday(self, date_, date_format = '%Y-%m-%d', day_shift=0 ):            
        try:            
            dt = datetime.datetime.strptime(date_, date_format)
            start = dt - datetime.timedelta(days=dt.weekday()+day_shift) 
            end = start + datetime.timedelta(days=6)
            return str(start.date()), str(end.date())
        except Exception as e:
            #print (e)
            return None, None 
    
    def get_week_dates(self, year, week_count):         
        d = str(year) + "-W" + str(week_count)
        start_date = datetime.datetime.strptime(d + '-1', "%Y-W%W-%w")
        end_date = start_date + datetime.timedelta(days = 7)
        date_list = [str(d.date()).replace('-','/') for d in self.dates_bwn_twodates(start_date,end_date)]
        return date_list
    
    def fixed_object_keys(self, my_record=None, object_key=None):
        if my_record == None:
            my_record = {}
            
        if my_record.get('month', None) !=None:
            my_record['month'] = str( my_record['month'] ).zfill(2)

        if my_record.get('day', None) !=None:
            my_record['day'] = str( my_record['day'] ).zfill(2)
            
        
        my_record['new_rnd_str'] = str(uuid.uuid4()).replace('-', '')[:10]+'-'+str(uuid.uuid4()).replace('-', '')[:5]

            
        if "{own_date_last_rnd_str}" in object_key:
            object_key = object_key.replace("{own_date_last_rnd_str}", "%")
        if "{data_date-1}" in object_key:
            data_date = my_record['data_date']
            data_date_datetime = datetime.datetime.strptime(data_date, "%Y/%m/%d") - datetime.timedelta(days = 1)
            previusday = data_date_datetime.strftime("%Y/%m/%d")
            object_key = object_key.replace("{data_date-1}", previusday)   
            
        if "{data_date+1}" in object_key:
            data_date = my_record['data_date']
            data_date_datetime = datetime.datetime.strptime(data_date, "%Y/%m/%d") + datetime.timedelta(days = 1)
            nextday = data_date_datetime.strftime("%Y/%m/%d")
            object_key = object_key.replace("{data_date+1}", nextday)                 

        if "{week_n}" in object_key:
            object_key = object_key.replace('{week_n}', '₺₺₺₺')
        if "{month_n}" in object_key:
            object_key = object_key.replace('{month_n}', '₺₺#₺₺')            
        if "{cumulative_n}" in object_key:
            object_key = object_key.replace('{cumulative_n}', '₺₺##₺₺')       
        if "{data_date_sell}" in object_key:
            object_key = object_key.replace('{data_date_sell}', '₺₺###₺₺')                    
        
        
        object_key = object_key.format(**my_record)
        if "%" in object_key:
            object_key = self.get_exact_object_key_from_db(object_key)
        
        if "₺₺₺₺" in object_key:
            week_dates = self.get_week_dates(int(my_record['year']), int(my_record['week_number'])-1)
            print ("week_dates", week_dates)
            object_keys = []
            for w_d in week_dates:
                object_keys.append( object_key.replace('₺₺₺₺', w_d) )
            object_key = object_keys[:-1]
                
        if "₺₺#₺₺" in object_key:
            month_dates = self.get_month_dates(int(my_record['year']), int(my_record['month']))
            print ("month_dates", month_dates)
            object_keys = []
            for m_d in month_dates:
                object_keys.append( object_key.replace('₺₺#₺₺', m_d) )
            object_key = object_keys            

        if "₺₺##₺₺" in object_key:
            #month_dates = self.get_month_dates(int(my_record['year']), int(my_record['month']))
            cumulative_dates = self.get_cumulative_dates(int(my_record['year']), int(my_record['month']), int(my_record['day']))
            print ("cumulative_dates", cumulative_dates)
            object_keys = []
            for m_d in cumulative_dates:
                object_keys.append( object_key.replace('₺₺##₺₺', m_d) )
            object_key = object_keys   
        
        #for sell_detail 
        if "₺₺###₺₺" in object_key:
            sell_detail_days = []
            data_date = my_record['data_date']
            data_date_date = datetime.datetime.strptime(data_date, "%Y/%m/%d")
            if data_date_date.weekday() == 0:# means monday                
                sell_detail_days = [str(d.date()).replace('-','/') for d in self.dates_bwn_twodates(data_date_date - datetime.timedelta( days = 7), data_date_date)                    ]                
            else:
                sell_detail_days.append(  str(data_date_date.date()).replace('-','/')  )
                sell_detail_days.append(     str( (data_date_date - datetime.timedelta( days = 1)).date()).replace('-','/')   )                                    
            print ("sell_detail_days : ", sell_detail_days)
            object_keys = []
            for m_d in sell_detail_days:
                object_keys.append( object_key.replace('₺₺###₺₺', m_d) )
            object_key = object_keys    

        return object_key

    def dates_bwn_twodates(self, start_date, end_date):
        for n in range(int ((end_date - start_date).days)+1):
            yield start_date + datetime.timedelta(n)  
    def get_cumulative_dates(self, year, month, day):
        
        d = str(year) +"-"+ str(int(month)) + '-1'
        dd = str(year) +"-"+ str(int(month)) + "-" + str(day)
        
        #print(d)
        start_date = datetime.datetime.strptime(d, "%Y-%m-%d")
        print(start_date)
        end_date = datetime.datetime.strptime(dd, "%Y-%m-%d")
        print(end_date)
        date_list = [str(d.date()).replace('-','/') for d in self.dates_bwn_twodates(start_date,end_date)]
        return date_list
    
    
                    
    
    def get_month_dates(self, year, month_count):        
        
        d = str(year) +"-"+ str(int(month_count)) + '-1'
        print(d)
        start_date = datetime.datetime.strptime(d, "%Y-%m-%d")
        print(start_date)
        end_date = start_date + relativedelta(months=+1)
        print(end_date)
        date_list = [str(d.date()).replace('-','/') for d in self.dates_bwn_twodates(start_date,end_date)]
        return date_list[:-1]

    



    def get_needed_dfs(self, region_name, bucket_name, dependents, default_delimiter = '@', default_header = None):
        import pandas as pd
        import pyarrow as pa
        import pyarrow.parquet as pq
        import pandasql as pdsql

        data_list = []
        print("Len Dependent Files : ", len(dependents))
        print("Dependent Files S3 Keys : ", json.dumps(dependents, indent  = 4))
        for dependent in dependents:
            #print("Dependent : ", dependent)
            if '.csv' in dependent[-10:]:
                print("CSV File is being tried to Read : ", dependent, )
                data_list.append(self.get_csv(
                    region_name, bucket_name, dependent, default_delimiter = default_delimiter, default_header = default_header))
                print(", Done")
            elif '.parquet' in dependent[-10:]:
                print("Parquet File is being tried to Read : ", dependent, )
                data_list.append(self.get_parquet(
                    region_name, bucket_name, dependent))
                print(", Done")
        return data_list

    def mess_2_slack(self, text, key_value_data, stack="Unknown", state="Unknown", file_id="Unknown", LOG_TYPE="debug"):
        body = copy.deepcopy(key_value_data)
        body['text'] = str(text)
        if file_id==None or file_id == "Unknown":
            file_id = key_value_data.get("S3_Files_PKID", "Unknown")                        
        body['File_ID'] = str(file_id)
        body['LOG_TYPE'] = str(LOG_TYPE)
        body['State'] = str(state)
        body['Stack'] = str(stack)

        self.to_sqs(
            queue_url=self.get_system_constans(
            )['bet_system_params']['sqs']['log_sqs'],
            message_body=body,
            queue_region=self.get_system_constans(
            )['bet_system_params']['sqs']['log_sqs_region'],
        )

    def to_sqs(self, queue_url, message_attributes=None, message_body=None, queue_region='eu-central-1', MessageDeduplicationId =None):
        MessageAttributes = {}
        MessageBody = {}
        if message_attributes != None:
            for attribute_name, attribute_value in message_attributes.items():
                try:
                    MessageAttributes[attribute_name] = {
                        'DataType': 'String',
                        'StringValue': str(attribute_value)
                    }
                except Exception as e:
                    error_str = "Message Attributes Fixing Error: " + str(e)
                    print(error_str)
                    #raise Exception(error_str)

        if message_body != None:
            if type(message_body) == type(""):
                MessageBody = message_body
            elif type(message_body) == type({"a": 4}):
                for k, v in message_body.items():
                    MessageBody[str(k)] = str(v)

                MessageBody = json.dumps(MessageBody, indent=4)
            else:
                error_str = "Message Body Error : RealType is : " + \
                    type(MessageBody) + "\nError : " + str(e)

                print(error_str)
                raise Exception(error_str)

        #print ("Slack Message Body\n" ,MessageBody)

        sqs = boto3.client('sqs', queue_region)
        if '.fifo' in queue_url:
            id = str(uuid.uuid4())
            if MessageDeduplicationId != None:
                id = MessageDeduplicationId   
                
                         
            response = sqs.send_message(
                QueueUrl=queue_url,
                MessageGroupId='msggpid1',
                MessageDeduplicationId=id,
                MessageBody=MessageBody
            )
        else:
            #sqs = boto3.client('sqs', queue_region)
            response = sqs.send_message(
                QueueUrl=queue_url,
                MessageAttributes=MessageAttributes,
                MessageBody=MessageBody
            )
        return response

    def insert_line_to_db(self, data):
        from uluc_db_controller import mySQL_db_controller 
        keys_for_sql = ''
        values_for_sql = ''
        sql_table_columns = ["pk_id", "Stack", "Region", "Bucket", "Key", "State", "Period", "Data_Date", "Table_Name", "File_Type", "File_Size",
                             "Source_IP", "Event_Time", "Inserted_Time", "Converted_Time", "Converted_by", "Is_Formatted", "Converted_Status", "uniq_code"]

        for key, value in data.items():
            if key.upper() not in map(str.upper, sql_table_columns):
                continue
            if key == "uniq_code" and 'latest' in data["key"]:
                #return -1, None
                value += str(uuid.uuid4()).replace('-','')[:10]
               

            keys_for_sql += "`%s`, " % key
            if type(unicode("s")) == type(value) or type("s") == type(value):
                values_for_sql += "'%s', " % (value)
            elif type(False) == type(value):
                if value == False:
                    values_for_sql += "0, "
                else:
                    values_for_sql += "1, "
            else:
                values_for_sql += "%s, " % (str(value))

        keys_for_sql += '`Inserted_Time`'
        values_for_sql += 'now()'
        sql = "Insert Into data_platform_b2b_log_db.S3_Files (%s) values(%s)" % ( keys_for_sql, values_for_sql)
        #print(sql)

        connection = self.get_system_constans()['bet_system_params']['db_connection']
        db_c = mySQL_db_controller(connection)
        resp, msg = db_c.execute_only(sql)
        

        return db_c.lastrowid, msg

    def get_all_latest_files_of(self, state, stack, data_date):
        from uluc_db_controller import mySQL_db_controller 
        sql = "SELECT s.Key FROM data_platform_b2b_log_db.S3_Files as s where s.Stack = '{stack}' and s.Data_Date = '{data_date}' and s.State = '{state}' and s.Key like 'parquet_data%--latest.parquet'".format(data_date = data_date, stack = stack, state = state)                    
        #print(sql)

        connection = self.get_system_constans()['bet_system_params']['db_connection']
        db_c = mySQL_db_controller(connection)
        resp, msg = db_c.execute_and_return_all(sql)
        

        return resp, msg
        
    def run_sql_in_system_db(self, sql, operation_chosee ):
        ### WORK TO DOO VERY MUCH        
        from uluc_db_controller import mySQL_db_controller 
        
        connection = self.get_system_constans()['bet_system_params']['db_connection']
        db_c = mySQL_db_controller(connection)
        if operation_chosee == 'execute_and_return_all':
            resp, msg = db_c.execute_and_return_all(sql)
        elif operation_chosee == 'execute_and_return':
            resp, msg = db_c.execute_and_return(sql)
        elif operation_chosee == 'execute_only':
            resp, msg = db_c.execute_only(sql)
        else:
            return None, 'Wrong operation choosee'

        return resp, msg        
         
    def close_your_self(self, state='dev'):
        if state == 'dev':
            print("State is 'DEV I will not close this machine :)")
        else:
            region = self.get_system_constans()['Sqses']['regions']
            instance_id = os.popen(
                "curl http://169.254.169.254/latest/meta-data/instance-id").read()
            ec2 = boto3.resource('ec2', region)
            ec2.instances.filter(InstanceIds=[instance_id]).terminate()

    def update_convert_status_of_file(self, pk_id, Converted_by):
        if pk_id=="Unknown" or pk_id==None:
            return 200
        from uluc_db_controller import mySQL_db_controller 
        map_ = {"Decode_1": 3, "Deceode_2": 4, "Fetch_1": 2, "Alu_1" : 5,  "Write_Back" : 6}
        data = {
            "S3_Files_PKID": pk_id,
            "Converted_Status": map_[Converted_by],
            "Converted_by": Converted_by
        }
        connection = self.get_system_constans()['bet_system_params']['db_connection']
        sql = "UPDATE data_platform_b2b_log_db.S3_Files SET Converted_Time = now(), Converted_by = '{Converted_by}', Converted_Status = {Converted_Status} WHERE pk_id = {S3_Files_PKID}".format(
            **data)
        #print ( sql )
        db_c = mySQL_db_controller(connection)
        resp, msg = db_c.execute_only(sql)
        
        if msg != None:
            print("=== CLOUND'T UPDATE CONVERT INFO ====")
            print(msg)
            return 205
        return 200

    def time_tracker(self, tracker_id=None, state="Unknown", stack="Unknown", is_end=False, is_mid_point= False, operation_text="No Operation text Setted", layer_name="No Layer Name Setted", data_date="Unknown", file_id="Unknown", send_now=False, additional_info = None):
        if tracker_id != None:
            if self.time_tracker_json.get(tracker_id, None) != None and is_end == True:
                traccker_end = self.time_tracker_json.get(tracker_id, None)
                traccker_end['end_time'] = datetime.datetime.now()
                traccker_end['operation_time'] = traccker_end['end_time'] - traccker_end['start_time']
                if additional_info !=None:
                    traccker_end.update(additional_info)
                
                self.mess_2_slack(
                    text=traccker_end['operation_text'],
                    key_value_data=traccker_end,
                    stack=traccker_end['stack'],
                    state=traccker_end['state'],
                    file_id=traccker_end['file_id'],
                    LOG_TYPE="debug"
                )
                del self.time_tracker_json[tracker_id]
                return 200, tracker_id
            elif self.time_tracker_json.get(tracker_id, None) != None and is_mid_point == True:
                traccker_end = self.time_tracker_json.get(tracker_id, None)
                traccker_end['mid_point'] = datetime.datetime.now()            
                traccker_end['operation_text'] += '\n' + operation_text
                self.time_tracker_json[tracker_id] = traccker_end           
            else:
                raise Exception("Error in time_tracker Unknown tracker_id {tracker_id}!!".format(
                    tracker_id=tracker_id))
        else:
            if is_end == False:
                tmp_time_tracker_json = {
                    "tracker_id": "TRC_"+str(uuid.uuid4()).replace("-", "")[:10],
                    "start_time": datetime.datetime.now(),
                    "state": state,
                    "data_date": data_date,
                    "stack": stack,
                    "operation_text": operation_text,
                    "layer_name": layer_name,
                    "file_id": file_id
                }
                self.time_tracker_json[tmp_time_tracker_json['tracker_id']] = tmp_time_tracker_json
                return 200, tmp_time_tracker_json['tracker_id']
            else:
                raise Exception("Error in time_tracker new key create, Error: tracker and is_end wrong initialsed!!")
        if send_now == True:
            log_type = "debug"
            if send_now and is_mid_point:
                log_type = "error"
            traccker_end = self.time_tracker_json.get(tracker_id, None)
            if additional_info !=None:
                traccker_end.update(additional_info)                
            self.mess_2_slack(
                text=traccker_end['operation_text'] + '\n' + operation_text,
                key_value_data=traccker_end,
                stack=traccker_end['stack'],
                state=traccker_end['state'],
                file_id=traccker_end['file_id'],
                LOG_TYPE=log_type
            )
            del self.time_tracker_json[tracker_id]
            return 200, tracker_id            

    def get_operation_infos(self, layer_name, dependent_table_key):
        
        layer_rules = self.get_manifest_part(layer_name=layer_name)
        
        # Getting related info from manifes.
        imports_of_operations = layer_rules['imports_of_layer'].get( dependent_table_key, None )
        exports_of_operations = layer_rules['exports_of_layer'].get( dependent_table_key, None )        
        
        if imports_of_operations == None or exports_of_operations == None or len(exports_of_operations.keys()) == 0:
            msg = "{layer_name} Layer Get A File, THERE IS NO OPERATION RULE, for {table_name} in 'manifes.json'."          
            return 262, msg, None    
        
        return 200, imports_of_operations, exports_of_operations    
    
    def read_csv(self, s3_bucket, s3_key, region ):
        import boto3
        #session = boto3.Session(
        #    aws_access_key_id = "AKIAQM2JJU44TRMIWFGD",
        #    aws_secret_access_key = "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",
        #)
        s3 = boto3.client('s3', region)
        obj = s3.get_object(Bucket=s3_bucket, Key=s3_key)
        lines = obj['Body'].read().decode("utf-8")
        import csv
        import io

        buf = io.StringIO(lines)
        reader = csv.DictReader(buf)
        rows = list(reader)
        return rows

    
    def generate_sql(self, s3_bucket, s3_key, region,  table_name, data_date, period, db_table_name):   
        print ("generate_sql Start", datetime.datetime.now()) 
        # print(col_names)
        # Getting file from s3s
        BeginDate = None
        EndDate = None
        rows = self.read_csv(s3_bucket, s3_key, region)
        print ("generate_sql file_readed", datetime.datetime.now()) 
        
        comes_from_status = self.manifest_json["Write_Back"]["target_db"]['comes_from_status'][table_name]         
        colomns_names = self.manifest_json["Write_Back"]["target_db"]["colomns"]
        db_table_name = self.manifest_json["Write_Back"]["target_db"]["db_table_name"][db_table_name]
        """
        INSERT INTO {db_table_name} (columns) values (),
                                                    (),
                                                    ();
        """
        
        new_rows = []
        keys_of_data = []
        types_of_keys = {}
        for data_row in rows:            
            new_row_data = {}
            for k, v in data_row.items():
                if k =="" or "Unknown" in k:
                    continue
                db_key = colomns_names.get(k, None)                            
                if db_key == None:                    
                    print ("Nasil Key Yok Lan", k)
                    continue
                keys_of_data.append(db_key)
                try:
                    v = float(v)
                    if types_of_keys.get(db_key, "int") != "str":
                        types_of_keys[db_key] = "float"
                        #print ("burada", db_key)
                except Exception as e:
                    #print (e)
                    try:
                        v = int(v)
                        if types_of_keys.get(db_key, "int") != "str":
                            types_of_keys[db_key] = "int"                    
                    except Exception as e:
                        #print (e)
                        v = str(v).replace("'", "\"")
                        types_of_keys[db_key] = "str"                    
                new_row_data[db_key] = v
            #new_row_data['BeginDate'] = data_date.replace('/', '-')
            try:
                BeginDate = new_row_data['BeginDate']
            except Exception as e:
                pass
            
            try:
                EndDate = new_row_data['EndDate']
            except Exception as e:
                pass            
            
            
            new_row_data['InsertDate'] = "GETDATE()"        
            new_row_data['Status'] = comes_from_status
            new_rows.append(new_row_data)
        print ("generate_sql colnames", datetime.datetime.now())
        

        keys_of_data.append("InsertDate")
        keys_of_data.append("Status")
        
        types_of_keys["InsertDate"] ="str"    
        types_of_keys["Status"]     ="int"    
        values_strs = []    
        keys_of_data = list(set(keys_of_data))
        for row in new_rows:    
            ordered_list = []
            for x in keys_of_data:
                if types_of_keys[x] == "str":
                    a = "\'%s\'"%(row[x])
                else:                
                    a = "%s"%row[x]                
                ordered_list.append(a)                    
            value_str = ("(%s)"%(', '.join(ordered_list)))
            values_strs.append(value_str)
        
        used_cols_str = ', '.join( ['[%s]'%x for x in keys_of_data] )
        base_sql = "INSERT INTO {db_table_name} ({used_cols_str}) VALUES \n".format(db_table_name = db_table_name, used_cols_str = used_cols_str)                                            
        
        # #print (base_sql)
        n= 900
        a = [values_strs[i:i + n] for i in range(0, len(values_strs), n)]  
        
        insert_sqls = [ (base_sql + ',\n'.join(values_strs)  +';').replace("'GETDATE()'", "GETDATE()") for values_strs in a]
        
        print ("generate_sql finished", datetime.datetime.now())
        return insert_sqls, BeginDate, EndDate
        
    def generate_delete_sql(self, report_name, db_table_name, end_date):
        db_table_name_orjin = self.manifest_json["Write_Back"]["target_db"]["db_table_name"][db_table_name]
        table_status_code = self.manifest_json["Write_Back"]["target_db"]['comes_from_status'][report_name]
        sql = "DELETE FROM {db_table_name_orjin} WHERE EndDate = '{end_date}' and Status = {table_status_code};".format(
                                                                                                                              db_table_name_orjin = db_table_name_orjin
                                                                                                                            ,   end_date         =  end_date.replace('/','-')
                                                                                                                            ,   table_status_code = table_status_code)        
        return sql
    
    def send_email(self, subject, state, data_date, error_mess):
        template = {
                "to_list": self.get_system_constans()['bet_system_params']['email_list'][state],
                "subject": subject,
                "text_part": "{data_date} tarihinde bir hata oluşmuştur.\n\n Hata Mesajı: {error_mess} (Sorunun çözümüne kadar sistem kendini 04.30, 05.30 06.30, 07,30 da çalıştırmayı deneyecektir. Bu saate kadar sorunun giderilmeye çalışması önemle rica olunur. Aksi halde raporlar boş gönderilecektir.)".format(data_date = data_date, error_mess= error_mess),
                "html_part": "<h1>{data_date} tarihinde bir hata oluşmuştur. </h1> <h1> Hata Mesajı: {error_mess}</h1> <h1>(Sorunun çözümüne kadar sistem kendini 04.30, 05.30 06.30, 07,30 da çalıştırmayı deneyecektir. Bu saate kadar sorunun giderilmeye çalışması önemle rica olunur. Aksi halde raporlar boş gönderilecektir.)<\h1>".format(data_date = data_date, error_mess= error_mess)
            }
        
        self.to_sqs(
            queue_url=self.get_system_constans()['bet_system_params']['sqs']['email_sqs'],
            message_body=json.dumps( template ),
            queue_region=self.get_system_constans()['bet_system_params']['sqs']['log_sqs_region'],
        )        
