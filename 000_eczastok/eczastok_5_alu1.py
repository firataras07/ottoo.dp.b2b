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
import math

#############################################################################################################

def report_3_Daily_Product_1_metrics(dfs, table_export_operation_rule, my_record = None):    
    df = dfs[0]

    df = df[['P_CreatedOnUtc_asDate', 'P_Name', 'OI_Quantity', 'P_Deleted']]
    df = df.rename(columns={'P_CreatedOnUtc_asDate': 'Date', 'P_Name' :'Product_Name'})


    df = df[df['P_Deleted'] == 0]
    df_result = df.groupby(['Date', 'Product_Name']).agg(Quantity=('OI_Quantity', 'sum')).fillna(0).reset_index()


    df_result['Period'] = 'Daily'      
    df_result.sort_values(by=['Date'], inplace=True, ascending=False)


    df_result = df_result[['Date', 'Period', 'Product_Name', 'Quantity']]


    df_result.fillna(0, inplace = True) 
    df_result['Quantity'] = df_result['Quantity'].astype('int') 
    return df_result 

def report_1_Daily_Customer_11_metrics(dfs, table_export_operation_rule, my_record = None):    
    df = dfs[0]

    df = df[['C_Id', 'C_LastLoginDateUtc_asDate', 'C_CreatedOnUtc_asDate', 'C_CannotLoginUntilDateUtc_asDate', 'C_LastActivityDateUtc_asDate', 'CR_Id', 'C_Deleted']]
    df = df[df['C_Deleted'] == 0]
    df = df[df['CR_Id'] == 3]

    df_result_1 = df.groupby(['C_LastLoginDateUtc_asDate']).agg(Log_In_Count=('C_Id', 'nunique')).fillna(0).reset_index()
    df_result_1 = df_result_1.rename(columns={'C_LastLoginDateUtc_asDate': 'Date'})


    df_result_2 = df.groupby(['C_CreatedOnUtc_asDate']).agg(Sign_In_Count=('C_Id', 'nunique')).fillna(0).reset_index()
    df_result_2 = df_result_2.rename(columns={'C_CreatedOnUtc_asDate': 'Date'})

        
    df_result_3 = df.groupby(['C_CannotLoginUntilDateUtc_asDate']).agg(Cannot_Log_In_Count=('C_Id', 'nunique')).fillna(0).reset_index()
    df_result_3 = df_result_3.rename(columns={'C_CannotLoginUntilDateUtc_asDate': 'Date'})

        
    df_result_4 = df.groupby(['C_LastActivityDateUtc_asDate']).agg(Last_Activity_Count=('C_Id', 'nunique')).fillna(0).reset_index()
    df_result_4 = df_result_4.rename(columns={'C_LastActivityDateUtc_asDate': 'Date'})
        

    df_result = pd.merge(pd.merge(df_result_1, df_result_2, on = 'Date', how = 'outer'),  pd.merge(df_result_3, df_result_4, on = 'Date',how = 'outer'), on = 'Date',how = 'outer')
                                
    df_result['Period'] = 'Daily'
    df_result.sort_values(by=['Date'], inplace=True, ascending=False)
    df_result = df_result[['Date', 'Period', 'Last_Activity_Count', 'Cannot_Log_In_Count', 'Sign_In_Count', 'Log_In_Count']]
    df_result.fillna(0, inplace = True) 
    df_result['Last_Activity_Count'] = df_result['Last_Activity_Count'].astype('int') 
    df_result['Cannot_Log_In_Count'] = df_result['Cannot_Log_In_Count'].astype('int') 
    df_result['Sign_In_Count'] = df_result['Sign_In_Count'].astype('int') 
    df_result['Log_In_Count'] = df_result['Log_In_Count'].astype('int') 
    return df_result    

def report_5_Daily_Order_City_Summary_1_metrics(dfs, table_export_operation_rule, my_record = None):    
    df = dfs[0]

    df = df[['O_Id', 'CR_Name', 'O_CreatedOnUtc_asDate', 'CRM_CustomerRole_Id' ]]
    df = df.rename(columns={'O_CreatedOnUtc_asDate': 'Date', 'CR_Name' : 'City_Name'})

    df_result = df.groupby(['Date', 'City_Name', 'CRM_CustomerRole_Id']).agg(Order_Count=('O_Id', 'count')).fillna(0).reset_index()


    df_result['Period'] = 'Daily'
    df_result = df_result[['Date', 'Period', 'City_Name', 'Order_Count' ]]
    df_result.sort_values(by=['Date'], inplace=True, ascending=False)
    df_result['Order_Count'] = df_result['Order_Count'].astype('int') 
    return df_result  



def report_4_Daily_Active_Customer_Summary_view(dfs, table_export_operation_rule, my_record = None):    
    '''
                    "parquet_data/daily/{state}/vendor/{data_date}/enriched_vendor--latest.parquet",
                    "parquet_data/daily/{state}/customer/{data_date}/enriched_customer--latest.parquet",        
                    "parquet_data/daily/{state}/product/{data_date}/enriched_product--latest.parquet",              
                    "parquet_data/daily/{state}/customer_customerRole_mapping/{data_date}/enriched_customer_customerRole_mapping--latest.parquet",        
                    "parquet_data/daily/{state}/customer_role/{data_date}/enriched_customer_role--latest.parquet"
    '''
    
    df = dfs[0]

    df = df[['P_Deleted', 'P_Published', 'P_VendorId', 'C_Active', 'CRM_CustomerRole_Id', 'V_Id', 'P_UpdatedOnUtc_asDate', 'P_ProductTypeId', 'CR_Name']]
    df = df.rename(columns={'P_UpdatedOnUtc_asDate': 'Date', 'CR_Name' : 'Customer_Type_Name'})

    df = df[df['P_Deleted'] == 0]
    df = df[df['P_Published'] != 0]
    df = df[df['P_VendorId'] > 0]
    df = df[df['P_ProductTypeId'] == 5]
    #P_ProductTypeId kirsam gene çizilir mi birsuru?
    
    df = df[df['C_Active'] == 1]
    #df = df[df['CRM_CustomerRole_Id'] == 91]
    #CRM_CustomerRole_Id kirsam gene çizilir mi birsuru?
    

    df_result = df.groupby(['Date', 'Customer_Type_Name']).agg(Active_Count=('V_Id', 'count')).fillna(0).reset_index()
    df_result = df_result.pivot_table(index=['Date'],  columns=['Customer_Type_Name'], values=['Active_Count']).fillna(0).reset_index()    

        
    df_result['Period'] = 'Daily'
    df_result.sort_values(by=['Date'], inplace=True, ascending=False)
    df_result['Active_Count'] = df_result['Active_Count'].astype('int') 
    return df_result  




############################## Report 2 #############################