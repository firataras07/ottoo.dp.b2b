# -*- coding: UTF-8 -*-
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
import json
import datetime
import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq
import pandasql as pdsql
import re
import numpy as np

from libs import arc_functions as arc_functions

####### Fetch 1 #######
def standart_transform(dfs, table_export_operation_rule, my_record = None):    
    table_columns = table_export_operation_rule['table_columns']    
    table_columns_types = table_export_operation_rule['table_columns_types']
    date_col_format = table_export_operation_rule['date_col_format']
    
    print ('------- Standart Transform Starts-------')
    print ('input dfs len : ', len(dfs))
    df = dfs[0]
    #col names update
    print (df.columns)
    #df.columns = table_columns
    
    a_f = arc_functions()
    #col type update
    for col_name, col_type in zip(table_columns, table_columns_types):
        #print (col_name, col_type) 
        try:
            if 'date' == col_type:            
                df[col_name].fillna("", inplace = True) 
                df[col_name] = pd.to_datetime(df[col_name], format= date_col_format) 
                df[col_name+'_asDate'] = [d.date() for d in df[col_name]]
                df[col_name+'_asDate'] = df[col_name+'_asDate'].astype('str')  
                
                df[col_name+'_asDate_BeginWeek'] = [a_f.get_start_end_days_of_weekday(date_ = d ,day_shift=2 )[0]  for d in df[col_name+'_asDate']]
                df[col_name+'_asDate_EndWeek'] = [a_f.get_start_end_days_of_weekday(date_ = d , day_shift=2 )[1]  for d in df[col_name+'_asDate']]
                
                df[col_name+'_day_number'] = df[col_name].dt.strftime('%w')     
                df[col_name+'_day_name'] = df[col_name].dt.strftime('%A')                     
                df[col_name+'_week_of_year'] = df[col_name].dt.strftime('%U')
                df[col_name+'_year'] = df[col_name].dt.strftime('%Y')
                
                
                
                #df[col_name+'_day_number'] = df[col_name+'_day_number'].astype('int') 
                #df[col_name+'_year'] = df[col_name+'_year'].astype('int') 
                #df[col_name+'_week_of_year'] = df[col_name+'_week_of_year'].astype('int') 
                
                
                
            elif 'int' == col_type:
                df[col_name].fillna(0, inplace = True) 
                df[col_name] = df[col_name].astype(col_type) 
            elif 'str' == col_type:
                df[col_name].fillna("", inplace = True) 
                df[col_name] = df[col_name].astype(col_type) 
                df[col_name] = df[col_name].str.strip()
            elif 'float' == col_type:
                try:
                    df[col_name].fillna(0.0, inplace = True) 
                    df[col_name] = df[col_name].astype(col_type) 
                except Exception as e:
                    df[col_name].fillna(0.0, inplace = True) 
                    df[col_name] = df[col_name].str.replace(',', '.').astype(col_type)                     
            else:
                pass
        except Exception as e:
            print ("Kolon hata;", e)      
            print(col_name, col_type)
    #df.index = pd.Index(df.index.values-1)    
    print ('------- Standart Transform Ends -------')    
    #print (df.info())
    
    return df

def standart_transform_for_betSlips(dfs, table_export_operation_rule, my_record = None):
    
    table_columns = table_export_operation_rule['table_columns']    
    table_columns_types = table_export_operation_rule['table_columns_types']
    date_col_format = table_export_operation_rule['date_col_format']    
    df = standart_transform(dfs, table_export_operation_rule)
    try:
        print ('!!! date_fix execution start !!!')    
        #df['CreateDate']      
        df['Betting_Date'] = [d.date() for d in df['CreateDate']]
        df['Betting_Date'] = df['Betting_Date'].astype('str') 
        df = df[df['Betting_Date'] == my_record['data_date'].replace('/','-')]
        df['Hour'] = df['CreateDate'].dt.hour
        df['Hour'] = df['Hour'].astype('int')          
        df['Year'] = df['CreateDate'].dt.year
        df['Month'] = df['CreateDate'].dt.month    
        
        df['WEEKDAY'] = df['CreateDate'].dt.strftime('%w')     
        df['is_weekend'] = 0
        df.loc[df['WEEKDAY'].isin([5, 6]), 'is_weekend'] = 1         
        df['week_of_year'] = df['CreateDate'].dt.strftime('%U')
        
        #df['week_of_year'] = df['CreateDate'].apply(lambda x: x.weekofyear)
        #del df['CreateDate']      
        print ('!!! date_fix execution end !!!')
        
        print ('!!! betSlips_enrich_1 execution starts !!!')

        def betSlips_enrich_1(status):
            if status == 'Paid':
                return 1, 0
            elif status == 'PaidatRetailer':
                return 0, 1
            else:
                return 0, 0

        df['is_Paid'], df['is_PaidatRetailer'] = zip( *df.apply(lambda row: betSlips_enrich_1(row['Status']),axis=1))
        print ('!!! betSlips_enrich_1 execution end !!!')
        
        print ('!!! df[MaxWin] - df[Stake] execution start !!!')
        df['Value'] = df['MaxWin'] - df['Stake']
        print ('!!! df[MaxWin] - df[Stake] execution end !!!')        
    except Exception as e:
        print (e)
    return df    
    

