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










####### JOINS #######
def enriched_order_and_order_item_join(dfs, table_export_operation_rule, my_record = None):
    """
        "parquet_data/daily/{state}/order/{data_date}/enriched_order--latest.parquet",
        "parquet_data/daily/{state}/order_item/{data_date}/enriched_order_item--latest.parquet",        
    """
    print ("DFs Split STarts!!!!!!")
    enriched_order                = dfs[0]
    enriched_order_item	           = dfs[1]
    print ("DFs Split Done!!!!!!")
    
    
    enriched_order               = enriched_order.add_prefix('O_')
    enriched_order_item          = enriched_order_item.add_prefix('OI_')    
    
    print ("DF joins Starts!")
    df_merged = enriched_order.merge(
                                                    enriched_order_item,                                                 
                                                    left_on  ='O_Id',
                                                    right_on ='OI_OrderId',
                                                    how      ='inner', 
                                                    sort     =False
                                                )
    print ("DF joins Ends!")
    print (df_merged.info())
    return df_merged
def enriched_product_and_order_item_join(dfs, table_export_operation_rule, my_record = None):
    """
        "parquet_data/daily/{state}/product/{data_date}/enriched_product--latest.parquet",
        "parquet_data/daily/{state}/order_item/{data_date}/enriched_order_item--latest.parquet",        
    """
    print ("DFs Split STarts!!!!!!")
    enriched_product               = dfs[0]
    enriched_order_item	           = dfs[1]
    print ("DFs Split Done!!!!!!")
    
    
    enriched_product               = enriched_product.add_prefix('P_')
    enriched_order_item          = enriched_order_item.add_prefix('OI_')    
    
    print ("DF joins Starts!")
    df_merged = enriched_product.merge(
                                                    enriched_order_item,                                                 
                                                    left_on  ='P_Id',
                                                    right_on ='OI_ProductId',
                                                    how      ='inner', 
                                                    sort     =False
                                                )
    print ("DF joins Ends!")
    print (df_merged.info())
    return df_merged
def enriched_product_and_order_item_and_order_join(dfs, table_export_operation_rule, my_record = None):
    """
        "parquet_data/daily/{state}/product/{data_date}/enriched_product--latest.parquet",
        "parquet_data/daily/{state}/order_item/{data_date}/enriched_order_item--latest.parquet",        
        "parquet_data/daily/{state}/order/{data_date}/enriched_order--latest.parquet",        
    """
    print ("DFs Split STarts!!!!!!")
    enriched_product               = dfs[0]
    enriched_order_item	           = dfs[1]
    enriched_order	               = dfs[2]
    print ("DFs Split Done!!!!!!")
    
    
    enriched_product               = enriched_product.add_prefix('P_')
    enriched_order_item            = enriched_order_item.add_prefix('OI_')    
    enriched_order                 = enriched_order.add_prefix('O_')    
    
    print ("DF joins Starts!")
    df_merged = enriched_product.merge(
                                                    enriched_order_item,                                                 
                                                    left_on  ='P_Id',
                                                    right_on ='OI_ProductId',
                                                    how      ='inner', 
                                                    sort     =False
                                                )
    df_merged = df_merged.merge(
                                                    enriched_order,                                                 
                                                    left_on  ='OI_OrderId',
                                                    right_on ='O_Id',
                                                    how      ='inner', 
                                                    sort     =False
                                                )
        
    print ("DF joins Ends!")
    print (df_merged.info())
    return df_merged
def enriched_product_customer_vendor_product_category_mapping_join(dfs, table_export_operation_rule, my_record = None):
    """
    "parquet_data/daily/{state}/product/{data_date}/enriched_product--latest.parquet",              
    "parquet_data/daily/{state}/customer/{data_date}/enriched_customer--latest.parquet",        
    "parquet_data/daily/{state}/vendor/{data_date}/enriched_vendor--latest.parquet",
    "parquet_data/daily/{state}/product_category_mapping/{data_date}/enriched_product_category_mapping--latest.parquet"      
    """
    print ("DFs Split STarts!!!!!!")
    df_enriched_product                        = dfs[0]
    df_enriched_customer                       = dfs[1]
    df_enriched_vendor                         = dfs[2]
    df_enriched_product_category_mapping       = dfs[3]

    print ("DFs Split Done!!!!!!")
    

    df_enriched_product = df_enriched_product.add_prefix('P_')
    df_enriched_customer = df_enriched_customer.add_prefix('C_')
    df_enriched_vendor = df_enriched_vendor.add_prefix('V_')
    df_enriched_product_category_mapping = df_enriched_product_category_mapping.add_prefix('PCM_')
    
    
    print ("DF joins Starts!")
    df_merged = df_enriched_customer.merge(
                                                    df_enriched_vendor,                                                 
                                                    left_on  ='C_VendorId',
                                                    right_on ='V_Id',
                                                    how      ='inner', 
                                                    sort     =False
                                                )
    df_merged = df_merged.merge(
                                                    df_enriched_product,                                                 
                                                    left_on  ='V_Id',
                                                    right_on ='P_VendorId',
                                                    how      ='inner', 
                                                    sort     =False
                                                )    
    df_merged = df_merged.merge(
                                                    df_enriched_product_category_mapping,                                                 
                                                    left_on  ='P_Id',
                                                    right_on ='PCM_ProductId',
                                                    how      ='inner', 
                                                    sort     =False
                                                )
        
    print ("DF joins Ends!")
    print (df_merged.info())
    return df_merged
def enriched_customer_and_order_join(dfs, table_export_operation_rule, my_record = None):
    """
        "parquet_data/daily/{state}/customer/{data_date}/enriched_customer--latest.parquet",
        "parquet_data/daily/{state}/order/{data_date}/enriched_order--latest.parquet",        
    """
    print ("DFs Split STarts!!!!!!")
    enriched_customer                = dfs[0]
    enriched_order	                 = dfs[1]
    print ("DFs Split Done!!!!!!")
    
    
    enriched_customer               = enriched_customer.add_prefix('C_')
    enriched_order                  = enriched_order.add_prefix('O_')    
    
    print ("DF joins Starts!")
    df_merged = enriched_customer.merge(
                                                    enriched_order,                                                 
                                                    left_on  ='C_Id',
                                                    right_on ='O_CustomerId',
                                                    how      ='inner', 
                                                    sort     =False
                                                )
    print ("DF joins Ends!")
    print (df_merged.info())
    return df_merged
def enriched_customer_and_vendor_join(dfs, table_export_operation_rule, my_record = None):
    """
        "parquet_data/daily/{state}/vendor/{data_date}/enriched_vendor--latest.parquet",
        "parquet_data/daily/{state}/customer/{data_date}/enriched_customer--latest.parquet",        
    """
    print ("DFs Split STarts!!!!!!")
    df_enriched_vendor      = dfs[0]
    df_enriched_customer    = dfs[1]

    print ("DFs Split Done!!!!!!")
    
    

    df_enriched_vendor      = df_enriched_vendor.add_prefix('V_')
    df_enriched_customer    = df_enriched_customer.add_prefix('C_')

    
    
    print ("DF joins Starts!")
    df_merged = df_enriched_vendor.merge(
                                                    df_enriched_customer,                                                 
                                                    left_on  ='V_Id',
                                                    right_on ='C_VendorId',
                                                    how      ='inner', 
                                                    sort     =False
                                                )
     
    print ("DF joins Ends!")
    print (df_merged.info())
    return df_merged
def enriched_customer_vendor_ccrmapping_customer_role_join(dfs, table_export_operation_rule, my_record = None):
    """
        "parquet_data/daily/{state}/vendor/{data_date}/enriched_vendor--latest.parquet",
        "parquet_data/daily/{state}/customer/{data_date}/enriched_customer--latest.parquet",        
        "parquet_data/daily/{state}/customer_customerRole_mapping/{data_date}/enriched_customer_customerRole_mapping--latest.parquet",        
        "parquet_data/daily/{state}/customer_role/{data_date}/enriched_customer_role--latest.parquet",
    """
    print ("DFs Split STarts!!!!!!")
    df_enriched_vendor      = dfs[0]
    df_enriched_customer    = dfs[1]
    df_enriched_customer_customerRole_mapping       = dfs[2]
    df_enriched_customer_role       = dfs[3]
    print ("DFs Split Done!!!!!!")
    
    

    df_enriched_vendor      = df_enriched_vendor.add_prefix('V_')
    df_enriched_customer    = df_enriched_customer.add_prefix('C_')
    df_enriched_customer_customerRole_mapping       = df_enriched_customer_customerRole_mapping.add_prefix('CRM_')
    df_enriched_customer_role       = df_enriched_customer_role.add_prefix('CR_')
    
    
    print ("DF joins Starts!")
    df_merged = df_enriched_vendor.merge(
                                                    df_enriched_customer,                                                 
                                                    left_on  ='V_Id',
                                                    right_on ='C_VendorId',
                                                    how      ='inner', 
                                                    sort     =False
                                                )   
    df_merged = df_merged.merge(
                                                    df_enriched_customer_customerRole_mapping,                                                 
                                                    left_on  ='C_Id',
                                                    right_on ='CRM_Customer_Id',
                                                    how      ='inner', 
                                                    sort     =False
                                                )      
    df_merged = df_merged.merge(
                                                    df_enriched_customer_role,                                                 
                                                    left_on  ='CRM_CustomerRole_Id',
                                                    right_on ='CR_Id',
                                                    how      ='inner', 
                                                    sort     =False
                                                )         
    print ("DF joins Ends!")
    print (df_merged.info())
    return df_merged
def enriched_customer_vendor_product_ccrmapping_customer_role_join(dfs, table_export_operation_rule, my_record = None):
    """
        "parquet_data/daily/{state}/vendor/{data_date}/enriched_vendor--latest.parquet",
        "parquet_data/daily/{state}/customer/{data_date}/enriched_customer--latest.parquet",        
        "parquet_data/daily/{state}/product/{data_date}/enriched_product--latest.parquet",              
        "parquet_data/daily/{state}/customer_customerRole_mapping/{data_date}/enriched_customer_customerRole_mapping--latest.parquet",        
        "parquet_data/daily/{state}/customer_role/{data_date}/enriched_customer_role--latest.parquet",
    """
    print ("DFs Split STarts!!!!!!")
    df_enriched_vendor      = dfs[0]
    df_enriched_customer    = dfs[1]
    df_enriched_product     = dfs[2]
    df_enriched_customer_customerRole_mapping       = dfs[3]
    df_enriched_customer_role       = dfs[4]
    print ("DFs Split Done!!!!!!")
    
    

    df_enriched_vendor      = df_enriched_vendor.add_prefix('V_')
    df_enriched_customer    = df_enriched_customer.add_prefix('C_')
    df_enriched_product     = df_enriched_product.add_prefix('P_')
    df_enriched_customer_customerRole_mapping       = df_enriched_customer_customerRole_mapping.add_prefix('CRM_')
    df_enriched_customer_role       = df_enriched_customer_role.add_prefix('CR_')
    
    
    print ("DF joins Starts!")
    df_merged = df_enriched_vendor.merge(
                                                    df_enriched_customer,                                                 
                                                    left_on  ='V_Id',
                                                    right_on ='C_VendorId',
                                                    how      ='inner', 
                                                    sort     =False
                                                )
    df_merged = df_merged.merge(
                                                    df_enriched_product,                                                 
                                                    left_on  ='V_Id',
                                                    right_on ='P_VendorId',
                                                    how      ='inner', 
                                                    sort     =False
                                                )    
    df_merged = df_merged.merge(
                                                    df_enriched_customer_customerRole_mapping,                                                 
                                                    left_on  ='C_Id',
                                                    right_on ='CRM_Customer_Id',
                                                    how      ='inner', 
                                                    sort     =False
                                                )      
    df_merged = df_merged.merge(
                                                    df_enriched_customer_role,                                                 
                                                    left_on  ='CRM_CustomerRole_Id',
                                                    right_on ='CR_Id',
                                                    how      ='inner', 
                                                    sort     =False
                                                )         
    print ("DF joins Ends!")
    print (df_merged.info())
    return df_merged
def enriched_customer_customer_customerRole_mapping_customer_role_join(dfs, table_export_operation_rule, my_record = None):
    """        
        "parquet_data/daily/{state}/customer/{data_date}/enriched_customer--latest.parquet",                
        "parquet_data/daily/{state}/customer_customerRole_mapping/{data_date}/enriched_customer_customerRole_mapping--latest.parquet",        
        "parquet_data/daily/{state}/customer_role/{data_date}/enriched_customer_role--latest.parquet",
    """
    print ("DFs Split STarts!!!!!!")
    df_enriched_customer          = dfs[0]
    df_enriched_customer_customerRole_mapping    = dfs[1]
    df_enriched_customer_role     = dfs[2]
    print ("DFs Split Done!!!!!!")
    
    

    df_enriched_customer    = df_enriched_customer.add_prefix('C_')
    df_enriched_customer_customerRole_mapping       = df_enriched_customer_customerRole_mapping.add_prefix('CRM_')
    df_enriched_customer_role       = df_enriched_customer_role.add_prefix('CR_')
    
    
    print ("DF joins Starts!")
   
    df_merged = df_enriched_customer.merge(
                                                    df_enriched_customer_customerRole_mapping,                                                 
                                                    left_on  ='C_Id',
                                                    right_on ='CRM_Customer_Id',
                                                    how      ='inner', 
                                                    sort     =False
                                                )      
    df_merged = df_merged.merge(
                                                    df_enriched_customer_role,                                                 
                                                    left_on  ='CRM_CustomerRole_Id',
                                                    right_on ='CR_Id',
                                                    how      ='inner', 
                                                    sort     =False
                                                )         
    print ("DF joins Ends!")
    print (df_merged.info())
    return df_merged
def enriched_order_customer_customerRole_mapping_customer_role_join(dfs, table_export_operation_rule, my_record = None):
    """        
            "parquet_data/daily/{state}/order/{data_date}/enriched_order--latest.parquet",                
            "parquet_data/daily/{state}/customer_customerRole_mapping/{data_date}/enriched_customer_customerRole_mapping--latest.parquet",        
            "parquet_data/daily/{state}/customer_role/{data_date}/enriched_customer_role--latest.parquet"
    """
    print ("DFs Split STarts!!!!!!")
    df_enriched_order          = dfs[0]
    df_enriched_customer_customerRole_mapping    = dfs[1]
    df_enriched_customer_role     = dfs[2]
    print ("DFs Split Done!!!!!!")
    
    

    df_enriched_order    = df_enriched_order.add_prefix('O_')
    df_enriched_customer_customerRole_mapping       = df_enriched_customer_customerRole_mapping.add_prefix('CRM_')
    df_enriched_customer_role       = df_enriched_customer_role.add_prefix('CR_')
    
    
    print ("DF joins Starts!")
   
    df_merged = df_enriched_customer_role.merge(
                                                    df_enriched_customer_customerRole_mapping,                                                 
                                                    left_on  ='CR_Id',
                                                    right_on ='CRM_CustomerRole_Id',
                                                    how      ='inner', 
                                                    sort     = False
                                                )      
    df_merged = df_merged.merge(
                                                    df_enriched_order,                                                 
                                                    left_on  ='CRM_Customer_Id',
                                                    right_on ='O_CustomerId',
                                                    how      ='inner', 
                                                    sort     =False
                                                )         
    print ("DF joins Ends!")
    print (df_merged.info())
    return df_merged