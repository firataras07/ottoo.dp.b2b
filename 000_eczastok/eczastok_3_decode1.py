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

def report_1_Daily_Customer_1_metrics(dfs, table_export_operation_rule, my_record = None):    
    df = dfs[0]

    df = df[['Id', 'LastLoginDateUtc_asDate', 'CreatedOnUtc_asDate', 'CannotLoginUntilDateUtc_asDate', 'LastActivityDateUtc_asDate']]

    df_result_1 = df.groupby(['LastLoginDateUtc_asDate']).agg(Log_In_Count=('Id', 'nunique')).fillna(0).reset_index()
    df_result_1 = df_result_1.rename(columns={'LastLoginDateUtc_asDate': 'Date'})


    df_result_2 = df.groupby(['CreatedOnUtc_asDate']).agg(Sign_In_Count=('Id', 'nunique')).fillna(0).reset_index()
    df_result_2 = df_result_2.rename(columns={'CreatedOnUtc_asDate': 'Date'})

        
    df_result_3 = df.groupby(['CannotLoginUntilDateUtc_asDate']).agg(Cannot_Log_In_Count=('Id', 'nunique')).fillna(0).reset_index()
    df_result_3 = df_result_3.rename(columns={'CannotLoginUntilDateUtc_asDate': 'Date'})

        
    df_result_4 = df.groupby(['LastActivityDateUtc_asDate']).agg(Last_Activity_Count=('Id', 'nunique')).fillna(0).reset_index()
    df_result_4 = df_result_4.rename(columns={'LastActivityDateUtc_asDate': 'Date'})
        

    df_result = pd.merge(pd.merge(df_result_1, df_result_2, on = 'Date', how = 'outer'),  pd.merge(df_result_3, df_result_4, on = 'Date',how = 'outer'), on = 'Date',how = 'outer')
                                
    df_result['Period'] = 'Daily'
    df_result.sort_values(by=['Date'], inplace=True, ascending=False)

    df_result = df_result[['Date', 'Period', 'Last_Activity_Count', 'Cannot_Log_In_Count', 'Sign_In_Count', 'Log_In_Count']]    
    df_result['Last_Activity_Count'] = df_result['Last_Activity_Count'].astype('int') 
    df_result['Cannot_Log_In_Count'] = df_result['Cannot_Log_In_Count'].astype('int') 
    df_result['Sign_In_Count'] = df_result['Sign_In_Count'].astype('int') 
    df_result['Log_In_Count'] = df_result['Log_In_Count'].astype('int') 
    df_result=df_result.reset_index()
    df_result.fillna(0, inplace = True)     
    return df_result    

def report_1_Daily_Customer_3_marketing(dfs, table_export_operation_rule, my_record = None):    
    df = dfs[0]

    df = df[['Id', 'LastLoginDateUtc_asDate', 'CreatedOnUtc_asDate', 'CannotLoginUntilDateUtc_asDate', 'LastActivityDateUtc_asDate']]
    
    df_result_1 = df.groupby(['LastLoginDateUtc_asDate']).agg(Log_In_Count=('Id', 'nunique')).fillna(0).reset_index()
    df_result_1 = df_result_1.rename(columns={'LastLoginDateUtc_asDate': 'Date'})



    df_result = pd.merge(pd.merge(df_result_1, df_result_2, on = 'Date', how = 'outer'),  pd.merge(df_result_3, df_result_4, on = 'Date',how = 'outer'), on = 'Date',how = 'outer')
                                
    df_result['Period'] = 'Daily'
    df_result.sort_values(by=['Date'], inplace=True, ascending=False)
    df_result = df_result[['Date', 'Period', 'Last_Activity_Count', 'Cannot_Log_In_Count', 'Sign_In_Count', 'Log_In_Count']]
    df_result.fillna(0, inplace = True) 
    df_result['Last_Activity_Count'] = df_result['Last_Activity_Count'].astype('int') 
    df_result['Cannot_Log_In_Count'] = df_result['Cannot_Log_In_Count'].astype('int') 
    df_result['Sign_In_Count'] = df_result['Sign_In_Count'].astype('int') 
    df_result['Log_In_Count'] = df_result['Log_In_Count'].astype('int') 
    df_result=df_result.reset_index()
    return df_result  

def report_2_Daily_Order_1_metrics(dfs, table_export_operation_rule, my_record = None):    
    df = dfs[0]

    df = df[['Id', 'OrderStatusId', 'OrderTotal', 'CreatedOnUtc_asDate']]
    df = df.rename(columns={'CreatedOnUtc_asDate': 'Date'})

    df_result_1 = df.groupby(['Date']).agg(Total_Order_Count=('Id', 'nunique'),
                                                            Total_Order_Amount=('OrderTotal', 'sum'),
                                                            ).fillna(0).reset_index()
    df_result_1["Average_Basket_Amount"] = df_result_1["Total_Order_Amount"]/df_result_1["Total_Order_Count"]

    df_result_2 = df[df['OrderStatusId'] == 40]
    df_result_2 = df_result_2.groupby(['Date']).agg(
                                                Total_Refund_Count=('Id', 'nunique'),
                                                Total_Refund_Amount=('OrderTotal', 'sum'),
                                                ).fillna(0).reset_index()

    df_result = pd.merge(df_result_1, df_result_2, on = 'Date', how = 'outer')
    df_result.sort_values(by=['Date'], inplace=True, ascending=False)
    df_result['Period'] = 'Daily'


    df_result = df_result[['Date', 'Period', 'Total_Order_Count', 'Total_Order_Amount', 'Average_Basket_Amount', 'Total_Refund_Count', 'Total_Refund_Amount']]
    df_result.fillna(0, inplace = True) 
    df_result['Total_Order_Count'] = df_result['Total_Order_Count'].astype('int') 
    df_result['Total_Refund_Count'] = df_result['Total_Refund_Count'].astype('int') 

    df_result['Total_Order_Amount'] = df_result['Total_Order_Amount'].astype('float') 
    df_result['Average_Basket_Amount'] = df_result['Average_Basket_Amount'].astype('float') 
    df_result['Total_Refund_Amount'] = df_result['Total_Refund_Amount'].astype('float') 
    df_result=df_result.reset_index()


    return df_result 


def report_1_Daily_Product_Summary_1_view(dfs, table_export_operation_rule, my_record = None):    
    df = dfs[0]

    df = df[['Id', 'Deleted', 'Published', 'VendorId', 'ProductTypeId', 'UpdatedOnUtc_asDate', 'UpdatedOnUtc_asDate_BeginWeek', 'UpdatedOnUtc_asDate_EndWeek', 'UpdatedOnUtc_day_number', 'UpdatedOnUtc_day_name' ]]
    df = df.rename(columns={'UpdatedOnUtc_asDate': 'Date', 'UpdatedOnUtc_asDate_BeginWeek': 'BeginDate', 'UpdatedOnUtc_asDate_EndWeek' : 'EndDate', 'UpdatedOnUtc_day_number' : 'day_number', 'UpdatedOnUtc_day_name': 'day_name'})
    
    df = df[df['Deleted'] == 0]
    df = df[df['Published'] != 0]
    df = df[df['VendorId'] > 0]
        

    df_result = df.groupby(['Date','BeginDate','EndDate','day_number' ,'ProductTypeId','day_name']).agg(Active_Store_Count=('VendorId', 'nunique')
                                                            ).fillna(0).reset_index()
    
    
        
    df_result.sort_values(by=['ProductTypeId','Date','BeginDate','EndDate', 'day_number','day_name', 'Active_Store_Count'], inplace=True, ascending=False)
    df_result['Period'] = 'Daily'
    
    df_result['Week_text'] = [ d1 + " " + d2 for d1,d2 in zip( df_result['BeginDate'], df_result['EndDate']) ]
    

    df_result = df_result[['Date', 'Period', 'ProductTypeId', 'Active_Store_Count','Week_text', 'day_number', 'day_name']]
    df_result.fillna(0, inplace = True) 
    df_result['ProductTypeId'] = df_result['ProductTypeId'].astype('int') 
    df_result['day_number'] = df_result['day_number'].astype('int') 
    df_result['Active_Store_Count'] = df_result['Active_Store_Count'].astype('int') 

    return df_result 


#hata
def report_1_Weekly_Product_Summary_1_view(dfs, table_export_operation_rule, my_record = None):    
    df = dfs[0]

    df = df[['Id', 'Deleted', 'Published', 'VendorId', 'ProductTypeId', 'UpdatedOnUtc_asDate', 'UpdatedOnUtc_asDate_BeginWeek', 'UpdatedOnUtc_asDate_EndWeek', 'UpdatedOnUtc_day_number', 'UpdatedOnUtc_day_name', 'UpdatedOnUtc_week_of_year','UpdatedOnUtc_year'  ]]
    df = df.rename(columns={'UpdatedOnUtc_asDate': 'Date', 'UpdatedOnUtc_asDate_BeginWeek': 'BeginDate', 'UpdatedOnUtc_asDate_EndWeek' : 'EndDate', 'UpdatedOnUtc_day_number' : 'day_number', 'UpdatedOnUtc_day_name': 'day_name', 'UpdatedOnUtc_week_of_year': 'week_of_year', 'UpdatedOnUtc_year' : 'year'})

    df = df[df['Deleted'] == 0]
    df = df[df['Published'] != 0]
    df = df[df['VendorId'] > 0]
    
    years = list(df['year'].unique())
    years = sorted(years)[-1:]
    df['is_valid'] = df['year'].isin(years)     
    df = df[df['is_valid'] == True]
    
    week_of_years = list(df['week_of_year'].unique())
    week_numbers_ineed = sorted(week_of_years)[-4:]
    df['is_valid'] = df['week_of_year'].isin(week_numbers_ineed)     
    df = df[df['is_valid'] == True]

    df['Week_text'] = [ d1 + " " + d2 for d1,d2 in zip( df['BeginDate'], df['EndDate']) ]    

    df_result = df.groupby(['ProductTypeId','day_name', 'BeginDate', 'EndDate','day_number']).agg(Active_Store_Count=('VendorId', 'nunique')
                                                        ).fillna(0).reset_index()

    df_result['Week_text'] = [ d1 + " " + d2 for d1,d2 in zip( df_result['BeginDate'], df_result['EndDate']) ]    
    df_result = df_result[[ 'ProductTypeId', 'Active_Store_Count','Week_text', 'day_name','day_number']]    

    df_result['ProductTypeId'] = df_result['ProductTypeId'].astype('int') 
    df_result['Active_Store_Count'] = df_result['Active_Store_Count'].astype('int') 


    df_result = df_result.pivot_table(index=['ProductTypeId', 'day_name','day_number'],  columns=['Week_text'], values=['Active_Store_Count']).fillna(0).reset_index()    
    df_result.sort_values(by=['day_number'], inplace=True, ascending=False)    


    df_result['Period'] = 'Daily'  

    return df_result 

def report_1_Daily_Product_Summary_2_view(dfs, table_export_operation_rule, my_record = None):    
    df = dfs[0]

    df = df[['Id', 'Deleted', 'Published', 'VendorId', 'ProductTypeId', 'UpdatedOnUtc_asDate_BeginWeek', 'UpdatedOnUtc_asDate_EndWeek']]
    df = df.rename(columns={'UpdatedOnUtc_asDate_BeginWeek': 'BeginDate', 'UpdatedOnUtc_asDate_EndWeek' : "EndDate"})
    
    df = df[df['Deleted'] == 0]
    df = df[df['Published'] != 0]
    df = df[df['VendorId'] > 0]
        
    

    df_result = df.groupby(['BeginDate','EndDate', 'ProductTypeId']).agg(Active_Store_Count=('VendorId', 'nunique')
                                                            ).fillna(0).reset_index()
    
    
        
    df_result.sort_values(by=['ProductTypeId','BeginDate','Active_Store_Count'], inplace=True, ascending=False)
    df_result['Period'] = 'Weekly'


    df_result = df_result[['BeginDate','EndDate', 'Period', 'ProductTypeId', 'Active_Store_Count']]
    df_result.fillna(0, inplace = True) 
    df_result['ProductTypeId'] = df_result['ProductTypeId'].astype('int') 
    df_result['Active_Store_Count'] = df_result['Active_Store_Count'].astype('int') 



    return df_result 