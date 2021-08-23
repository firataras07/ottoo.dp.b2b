# -*- coding: UTF-8 -*-
import pandas as pd
import pyarrow as pa
import numpy as np
import pyarrow.parquet as pq
df = pd.read_parquet('./data/asd.parquet')
df
df = pd.read_csv('./data/upload_now.csv', delimiter=',', header=0) 


df = pd.read_csv("./b_data/20210101_20210105_betslips.csv", delimiter=';', header=0) 
df
aws s3 cp ./va7_data_split.py s3://va7.bet.data/va7_data_split.py --profile u.a.user

aws s3 cp s3://va7.bet.data/va7_data_split.py ./va7_data_split.py

df = pd.read_parquet('./aaaaa.parquet')
df = pd.read_parquet('./data/upload_now.parquet')
df
df['test'] = pd.to_datetime(df['CreateDate'], format= '%e.%m.%Y %H:%M:%S') 	
df['Betting_Date'] = [d.date() for d in df['test']]
aws s3 cp ./mini_fix.py s3://va7.bet.data/mini_fix.py

 
def get_needed_dfs(self, region_name, bucket_name, dependents):
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
            print("CSV File is being tried to Read : ", dependent)
            data_list.append(get_csv(
                region_name, bucket_name, dependent))
            print("Red")
        elif '.parquet' in dependent[-10:]:
            print("Parquet File is being tried to Read : ", dependent)
            data_list.append(get_parquet(
                region_name, bucket_name, dependent))
            print("Red")
    return data_list
def get_csv(region, bucket, object_key):
    import pandas as pd
    import pyarrow as pa
    import pyarrow.parquet as pq
    import pandasql as pdsql
    # downloand csv file
    s3_client = boto3.client('s3', region_name=region)
    obj = s3_client.get_object(Bucket=bucket, Key=object_key)
    df = pd.read_csv(obj['Body'], delimiter='@', header=None)
    return df

def get_parquet(region, bucket, object_key):
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

def standart_transform(dfs, table_export_operation_rule):    
    table_columns = table_export_operation_rule['table_columns']    
    table_columns_types = table_export_operation_rule['table_columns_types']
    date_col_format = table_export_operation_rule['date_col_format']
    
    print ("------- Standart Transform Starts-------")
    print ("input dfs len : ", len(dfs))
    df = dfs[0]
    
    #col names update
    df.columns = table_columns
    
    #col type update
    for col_name, col_type in zip(table_columns, table_columns_types):
        if 'date' == col_type:
            df[col_name] = pd.to_datetime(df[col_name], format= date_col_format) 	
        elif 'int' == col_type:
            df[col_name] = df[col_name].astype(col_type) 
        elif 'str' == col_type:
            df[col_name] = df[col_name].astype(col_type) 
            df[col_name] = df[col_name].str.strip()
        elif 'float' == col_type:
            df[col_name] = df[col_name].astype(col_type) 
        else:
            pass
    print ("------- Standart Transform Ends -------")    
    return df
aa = {'table_name': 'daily_sales', 'py_function_name': 'standart_transform_for_sales', 'file_format': 'csv', 'in_file_format': 'csv', 'out_file_format': 'parquet', 'date_col_format': '%Y-%m-%d %H:%M:%S.%f', 'table_columns': ['transaction_id', 'game_no', 'retailer_id', 'terminal_socket_no', 'stored_date', 'ticket_no', 'day_no', 'ticket_price', 'event_type', 'ticket_state'], 'table_columns_types': ['int', 'int', 'int', 'int', 'date', 'int', 'int', 'float', 'int', 'str'], 'dependen_tables': 'dependent+daily_sales.csv', 'location_meta': {'from_bucket': 'sg.bet.data', 'from_who': 'sg.team', 'to_bucket': 'sg.bet.data', 'from_region_name': 'eu-central-1', 'to_region_name': 'eu-central-1', 'to_path': 'parquet_data/daily/{state}/daily_sales/{data_date}/enriched_daily_sales--{its_rnd_str}.parquet', 'to_who': 'SG.Layer2'}, 'Execution_Description': 'SG ekipleri tarafindan s3 e yuklenen file, alinip zenginlestirilir ve parquet formatinda kayit edilir...'}

dfs = get_needed_dfs(None,"eu-central-1" , "sg.bet.data", ["parquet_data/daily/prod/daily_iddaa_ticket_detail/2021/02/02/enriched_daily_iddaa_ticket_detail--latest.parquet"])
df = standart_transform(dfs, aa)

df2 = pd.read_parquet("./df.parquet", engine='pyarrow')
df_tmp = pd.read_parquet("./df_temp.parquet", engine='pyarrow')
df = pd.read_parquet("./data/upload_now.parquet", engine='pyarrow')
df = pd.read_parquet("./data/upload_now.parquet", engine='pyarrow')
df = pd.read_parquet("./sales_test.parquet", engine='pyarrow')

df = pd.read_parquet("./sales.parquet", engine='pyarrow')
#df_sales = pd.read_parquet("./sales.parquet", engine='pyarrow')   
df1[df1["ticket_no"] == 4684162701276382]
df1[df1['row_num'] == 2]
df44[df44['is_valid2'] != True]

g1 = df1.groupby(['ticket_no', 'test_r'])
df1['test_r'] += g1['stored_date'].rank(ascending=False) - 1

df['RANK'].value_counts()
df[df['BS_MemberId'] == 446]
df[df['RANK'] == 4.0]
df[df["ticket_no"] == 4684162701276382]
                  
                  7594250
rank 1 olan sayi 7594250


N    7587769
C       6465
R         11
H          5

df_tmp['event_type'].value_counts()

df[df['RANK'] == 4.0]

df_tmp['is_valid'] = df_tmp['event_type'].isin([140001, 140002, 70804])     


df1["RANK"] = df1.groupby("ticket_no")["stored_date"].rank(method="first", ascending=False)

df44['is_valid'].fillna(False, inplace=True)

df = pd.read_parquet("/home/ec2-user/layer_scripts/Layer1-enriched/data/upload_now.parquet", engine='pyarrow')
df = df[['Betting_Date', 'group_by_col_names', 'ticket_price']]
df = df.groupby(['Betting_Date', 'group_by_col_names']).agg(Amount=('ticket_price', 'sum'), Count=('ticket_price', 'count'))
df2 = df2.groupby(['Betting_Date', 'group_by_col_names']).agg({'ticket_price': ['sum','count']})

aws s3 cp s3://sg.bet.data/data/daily/prod/daily_sales/2021/01/16/daily_sales--1610841601500984310-202101170300.csv ./sales.csv
get_needed_dfs(self, region_name, bucket_name, dependents)


after_bisiler control_logları

df['VA'].unique()
array([ True, False])
df['LRT'].unique()
array([False,  True])
df['Retailer'].unique()
array(['Nesine', 'Unknown', 'Bilyoner', 'Misli', 'Oley', 'Tuttur',
       'Birebin'], dtype=object)
df['group_by_col_names'].unique()
array(['sales_count', 'cancel_count', 'rollback_sales_count',
       'hotline_cancel_count', 'rollback_cancel_count'], dtype=object)
df['Game_Type'].unique()
array(['iddaa', 'Super Toto'], dtype=object)
df.info()
<class 'pandas.core.frame.DataFrame'>
RangeIndex: 4628264 entries, 0 to 4628263
Data columns (total 15 columns):
 #   Column              Dtype         
---  ------              -----         
 0   transaction_id      int64         
 1   game_no             int64         
 2   retailer_id         int64         
 3   terminal_socket_no  int64         
 4   stored_date         datetime64[ns]
 5   ticket_no           int64         
 6   day_no              int64         
 7   ticket_price        float64       
 8   event_type          int64         
 9   ticket_state        object        
 10  group_by_col_names  object        
 11  Retailer            object        
 12  LRT                 bool          
 13  VA                  bool          
 14  Game_Type           object        
dtypes: bool(2), datetime64[ns](1), float64(1), int64(7), object(4)
memory usage: 467.9+ MB
df.count()
transaction_id        4628264
game_no               4628264
retailer_id           4628264
terminal_socket_no    4628264
stored_date           4628264
ticket_no             4628264
day_no                4628264
ticket_price          4628264
event_type            4628264
ticket_state          4628264
group_by_col_names    4628264
Retailer              4628264
LRT                   4628264
VA                    4628264
Game_Type             4628264
dtype: int64
    
   
   
pd.set_option('display.float_format', lambda x: '%.3f' % x)   
pd.set_option("display.max_rows", 5)





aws s3 cp s3://sg.bet.data/data/daily/prod/daily_sales/2021/01/16/daily_sales--1610841601500984310-202101170300.csv s3://sg.bet.data/data/daily/dev/daily_sales/2021/01/16/daily_sales--1610841601500984310-202101170300.csv
aws s3 cp s3://sg.bet.data/data/daily/prod/daily_iddaa_ticket_detail/2021/01/16/daily_iddaa_ticket_detail--1610841601532728983-202101170300.csv s3://sg.bet.data/data/daily/dev/daily_iddaa_ticket_detail/2021/01/16/daily_iddaa_ticket_detail--1610841601532728983-202101170300.csv
aws s3 cp s3://sg.bet.data/data/daily/prod/sgpp_dd_competition/2021/01/16/sgpp_dd_competition--1610841609239422767-202101170300.csv s3://sg.bet.data/data/daily/dev/sgpp_dd_competition/2021/01/16/sgpp_dd_competition--1610841609239422767-202101170300.csv
aws s3 cp s3://sg.bet.data/data/daily/prod/sgpp_dd_comp_group/2021/01/16/sgpp_dd_comp_group--1610841603277970945-202101170300.csv s3://sg.bet.data/data/daily/dev/sgpp_dd_comp_group/2021/01/16/sgpp_dd_comp_group--1610841603277970945-202101170300.csv
aws s3 cp s3://sg.bet.data/data/daily/prod/sgpp_dd_market/2021/01/16/sgpp_dd_market--1610841621666475539-202101170300.csv s3://sg.bet.data/data/daily/dev/sgpp_dd_market/2021/01/16/sgpp_dd_market--1610841621666475539-202101170300.csv
aws s3 cp s3://sg.bet.data/data/daily/prod/sgpp_dd_event/2021/01/16/sgpp_dd_event--1610841615298596893-202101170300.csv s3://sg.bet.data/data/daily/dev/sgpp_dd_event/2021/01/16/sgpp_dd_event--1610841615298596893-202101170300.csv
aws s3 cp s3://sg.bet.data/data/daily/prod/sgpp_dd_market_outcome/2021/01/16/sgpp_dd_market_outcome--1610841634397145233-202101170300.csv s3://sg.bet.data/data/daily/dev/sgpp_dd_market_outcome/2021/01/16/sgpp_dd_market_outcome--1610841634397145233-202101170300.csv
aws s3 cp s3://sg.bet.data/data/daily/prod/sgpp_dd_sport/2021/01/16/sgpp_dd_sport--1610841601469574242-202101170300.csv s3://sg.bet.data/data/daily/dev/sgpp_dd_sport/2021/01/16/sgpp_dd_sport--1610841601469574242-202101170300.csv

aws s3 rm s3://sg.bet.data/data/daily/prod/daily_sales/2021/01/16/daily_sales--1610841601500984310-202101170300.csv
aws s3 rm s3://sg.bet.data/data/daily/prod/daily_iddaa_ticket_detail/2021/01/16/daily_iddaa_ticket_detail--1610841601532728983-202101170300.csv
aws s3 rm s3://sg.bet.data/data/daily/prod/sgpp_dd_competition/2021/01/16/sgpp_dd_competition--1610841609239422767-202101170300.csv
aws s3 rm s3://sg.bet.data/data/daily/prod/sgpp_dd_comp_group/2021/01/16/sgpp_dd_comp_group--1610841603277970945-202101170300.csv
aws s3 rm s3://sg.bet.data/data/daily/prod/sgpp_dd_market/2021/01/16/sgpp_dd_market--1610841621666475539-202101170300.csv
aws s3 rm s3://sg.bet.data/data/daily/prod/sgpp_dd_event/2021/01/16/sgpp_dd_event--1610841615298596893-202101170300.csv
aws s3 rm s3://sg.bet.data/data/daily/prod/sgpp_dd_market_outcome/2021/01/16/sgpp_dd_market_outcome--1610841634397145233-202101170300.csv
aws s3 rm s3://sg.bet.data/data/daily/prod/sgpp_dd_sport/2021/01/16/sgpp_dd_sport--1610841601469574242-202101170300.csv

aws s3 rm s3://sg.bet.data/parquet_data/daily/prod/daily_sales/2021/01/16/ --recursive
aws s3 rm s3://sg.bet.data/parquet_data/daily/prod/daily_iddaa_ticket_detail/2021/01/16/ --recursive
aws s3 rm s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_competition/2021/01/16/ --recursive
aws s3 rm s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_comp_group/2021/01/16/ --recursive
aws s3 rm s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_market/2021/01/16/ --recursive
aws s3 rm s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_event/2021/01/16/ --recursive
aws s3 rm s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_market_outcome/2021/01/16/ --recursive
aws s3 rm s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_sport/2021/01/16/ --recursive


aws s3 cp s3://sg.bet.data/data/daily/dev/daily_sales/2021/01/16/daily_sales--1610841601500984310-202101170300.csv s3://sg.bet.data/data/daily/prod/daily_sales/2021/01/16/daily_sales--1610841601500984310-202101170300.csv
aws s3 cp s3://sg.bet.data/data/daily/dev/daily_iddaa_ticket_detail/2021/01/16/daily_iddaa_ticket_detail--1610841601532728983-202101170300.csv s3://sg.bet.data/data/daily/prod/daily_iddaa_ticket_detail/2021/01/16/daily_iddaa_ticket_detail--1610841601532728983-202101170300.csv
aws s3 cp s3://sg.bet.data/data/daily/dev/sgpp_dd_competition/2021/01/16/sgpp_dd_competition--1610841609239422767-202101170300.csv s3://sg.bet.data/data/daily/prod/sgpp_dd_competition/2021/01/16/sgpp_dd_competition--1610841609239422767-202101170300.csv
aws s3 cp s3://sg.bet.data/data/daily/dev/sgpp_dd_comp_group/2021/01/16/sgpp_dd_comp_group--1610841603277970945-202101170300.csv s3://sg.bet.data/data/daily/prod/sgpp_dd_comp_group/2021/01/16/sgpp_dd_comp_group--1610841603277970945-202101170300.csv
aws s3 cp s3://sg.bet.data/data/daily/dev/sgpp_dd_market/2021/01/16/sgpp_dd_market--1610841621666475539-202101170300.csv s3://sg.bet.data/data/daily/prod/sgpp_dd_market/2021/01/16/sgpp_dd_market--1610841621666475539-202101170300.csv
aws s3 cp s3://sg.bet.data/data/daily/dev/sgpp_dd_event/2021/01/16/sgpp_dd_event--1610841615298596893-202101170300.csv s3://sg.bet.data/data/daily/prod/sgpp_dd_event/2021/01/16/sgpp_dd_event--1610841615298596893-202101170300.csv
aws s3 cp s3://sg.bet.data/data/daily/dev/sgpp_dd_market_outcome/2021/01/16/sgpp_dd_market_outcome--1610841634397145233-202101170300.csv s3://sg.bet.data/data/daily/prod/sgpp_dd_market_outcome/2021/01/16/sgpp_dd_market_outcome--1610841634397145233-202101170300.csv
aws s3 cp s3://sg.bet.data/data/daily/dev/sgpp_dd_sport/2021/01/16/sgpp_dd_sport--1610841601469574242-202101170300.csv s3://sg.bet.data/data/daily/prod/sgpp_dd_sport/2021/01/16/sgpp_dd_sport--1610841601469574242-202101170300.csv





#erichler
aws s3 cp s3://sg.bet.data/parquet_data/daily/dev/daily_sales/2021/01/16/enriched_daily_sales--1610841601500984310-202101170300.parquet s3://sg.bet.data/parquet_data/daily/prod/daily_sales/2021/01/16/enriched_daily_sales--1610841601500984310-202101170300.parquet
aws s3 cp s3://sg.bet.data/parquet_data/daily/dev/daily_iddaa_ticket_detail/2021/01/16/enriched_daily_iddaa_ticket_detail--1610841601532728983-202101170300.parquet s3://sg.bet.data/parquet_data/daily/prod/daily_iddaa_ticket_detail/2021/01/16/enriched_daily_iddaa_ticket_detail--1610841601532728983-202101170300.parquet
aws s3 cp s3://sg.bet.data/parquet_data/daily/dev/sgpp_dd_competition/2021/01/16/enriched_sgpp_dd_competition--1610841609239422767-202101170300.parquet s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_competition/2021/01/16/enriched_sgpp_dd_competition--1610841609239422767-202101170300.parquet
aws s3 cp s3://sg.bet.data/parquet_data/daily/dev/sgpp_dd_comp_group/2021/01/16/enriched_sgpp_dd_comp_group--1610841603277970945-202101170300.parquet s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_comp_group/2021/01/16/enriched_sgpp_dd_comp_group--1610841603277970945-202101170300.parquet
aws s3 cp s3://sg.bet.data/parquet_data/daily/dev/sgpp_dd_market/2021/01/16/enriched_sgpp_dd_market--1610841621666475539-202101170300.parquet s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_market/2021/01/16/enriched_sgpp_dd_market--1610841621666475539-202101170300.parquet
aws s3 cp s3://sg.bet.data/parquet_data/daily/dev/sgpp_dd_event/2021/01/16/enriched_sgpp_dd_event--1610841615298596893-202101170300.parquet s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_event/2021/01/16/enriched_sgpp_dd_event--1610841615298596893-202101170300.parquet
aws s3 cp s3://sg.bet.data/parquet_data/daily/dev/sgpp_dd_market_outcome/2021/01/16/enriched_sgpp_dd_market_outcome--1610841634397145233-202101170300.parquet s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_market_outcome/2021/01/16/enriched_sgpp_dd_market_outcome--1610841634397145233-202101170300.parquet
aws s3 cp s3://sg.bet.data/parquet_data/daily/dev/sgpp_dd_sport/2021/01/16/enriched_sgpp_dd_sport--1610841601469574242-202101170300.parquet s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_sport/2021/01/16/enriched_sgpp_dd_sport--1610841601469574242-202101170300.parquet



aws s3 cp s3://sg.bet.data/parquet_data/daily/dev/daily_sales/2021/01/16/enriched_daily_sales--1610841601500984310-202101170300.parquet s3://sg.bet.data/parquet_data/daily/prod/daily_sales/2021/01/16/enriched_daily_sales--latest.parquet
aws s3 cp s3://sg.bet.data/parquet_data/daily/dev/daily_iddaa_ticket_detail/2021/01/16/enriched_daily_iddaa_ticket_detail--1610841601532728983-202101170300.parquet s3://sg.bet.data/parquet_data/daily/prod/daily_iddaa_ticket_detail/2021/01/16/enriched_daily_iddaa_ticket_detail--latest.parquet
aws s3 cp s3://sg.bet.data/parquet_data/daily/dev/sgpp_dd_competition/2021/01/16/enriched_sgpp_dd_competition--1610841609239422767-202101170300.parquet s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_competition/2021/01/16/enriched_sgpp_dd_competition--latest.parquet
aws s3 cp s3://sg.bet.data/parquet_data/daily/dev/sgpp_dd_comp_group/2021/01/16/enriched_sgpp_dd_comp_group--1610841603277970945-202101170300.parquet s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_comp_group/2021/01/16/enriched_sgpp_dd_comp_group--latest.parquet
aws s3 cp s3://sg.bet.data/parquet_data/daily/dev/sgpp_dd_market/2021/01/16/enriched_sgpp_dd_market--1610841621666475539-202101170300.parquet s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_market/2021/01/16/enriched_sgpp_dd_market--latest.parquet
aws s3 cp s3://sg.bet.data/parquet_data/daily/dev/sgpp_dd_event/2021/01/16/enriched_sgpp_dd_event--1610841615298596893-202101170300.parquet s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_event/2021/01/16/enriched_sgpp_dd_event--latest.parquet
aws s3 cp s3://sg.bet.data/parquet_data/daily/dev/sgpp_dd_market_outcome/2021/01/16/enriched_sgpp_dd_market_outcome--1610841634397145233-202101170300.parquet s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_market_outcome/2021/01/16/enriched_sgpp_dd_market_outcome--latest.parquet
aws s3 cp s3://sg.bet.data/parquet_data/daily/dev/sgpp_dd_sport/2021/01/16/enriched_sgpp_dd_sport--1610841601469574242-202101170300.parquet s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_sport/2021/01/16/enriched_sgpp_dd_sport--latest.parquet




aws s3 rm s3://sg.bet.data/parquet_data/daily/prod/daily_sales/2021/01/16/enriched_daily_sales--1610841601500984310-202101170300.parquet
aws s3 rm s3://sg.bet.data/parquet_data/daily/prod/daily_iddaa_ticket_detail/2021/01/16/enriched_daily_iddaa_ticket_detail--1610841601532728983-202101170300.parquet
aws s3 rm s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_competition/2021/01/16/enriched_sgpp_dd_competition--1610841609239422767-202101170300.parquet
aws s3 rm s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_comp_group/2021/01/16/enriched_sgpp_dd_comp_group--1610841603277970945-202101170300.parquet
aws s3 rm s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_market/2021/01/16/enriched_sgpp_dd_market--1610841621666475539-202101170300.parquet
aws s3 rm s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_event/2021/01/16/enriched_sgpp_dd_event--1610841615298596893-202101170300.parquet
aws s3 rm s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_market_outcome/2021/01/16/enriched_sgpp_dd_market_outcome--1610841634397145233-202101170300.parquet
aws s3 rm s3://sg.bet.data/parquet_data/daily/prod/sgpp_dd_sport/2021/01/16/enriched_sgpp_dd_sport--1610841601469574242-202101170300.parquet


aws s3 cp s3://sg.bet.data/data/daily/prod/daily_sales/ s3://sg.bet.data/simulate_again/daily_sales/ --recursive
aws s3 cp s3://sg.bet.data/data/daily/prod/daily_iddaa_ticket_detail/ s3://sg.bet.data/simulate_again/daily_iddaa_ticket_detail/ --recursive
aws s3 cp s3://sg.bet.data/data/daily/prod/sgpp_dd_competition/ s3://sg.bet.data/simulate_again/sgpp_dd_competition/ --recursive
aws s3 cp s3://sg.bet.data/data/daily/prod/sgpp_dd_comp_group/ s3://sg.bet.data/simulate_again/sgpp_dd_comp_group/ --recursive
aws s3 cp s3://sg.bet.data/data/daily/prod/sgpp_dd_market/ s3://sg.bet.data/simulate_again/sgpp_dd_market/ --recursive
aws s3 cp s3://sg.bet.data/data/daily/prod/sgpp_dd_event/ s3://sg.bet.data/simulate_again/sgpp_dd_event/ --recursive
aws s3 cp s3://sg.bet.data/data/daily/prod/sgpp_dd_market_outcome/ s3://sg.bet.data/simulate_again/sgpp_dd_market_outcome/ --recursive
aws s3 cp s3://sg.bet.data/data/daily/prod/sgpp_dd_sport/ s3://sg.bet.data/simulate_again/sgpp_dd_sport/ --recursive



aws s3 cp s3://sg.bet.data/simulate_again/daily_sales/ s3://sg.bet.data/data/daily/prod/daily_sales/ --recursive
aws s3 cp s3://sg.bet.data/simulate_again/daily_iddaa_ticket_detail/ s3://sg.bet.data/data/daily/prod/daily_iddaa_ticket_detail/ --recursive
aws s3 cp s3://sg.bet.data/simulate_again/sgpp_dd_competition/ s3://sg.bet.data/data/daily/prod/sgpp_dd_competition/ --recursive
aws s3 cp s3://sg.bet.data/simulate_again/sgpp_dd_comp_group/ s3://sg.bet.data/data/daily/prod/sgpp_dd_comp_group/ --recursive
aws s3 cp s3://sg.bet.data/simulate_again/sgpp_dd_market/ s3://sg.bet.data/data/daily/prod/sgpp_dd_market/ --recursive
aws s3 cp s3://sg.bet.data/simulate_again/sgpp_dd_event/ s3://sg.bet.data/data/daily/prod/sgpp_dd_event/ --recursive
aws s3 cp s3://sg.bet.data/simulate_again/sgpp_dd_market_outcome/ s3://sg.bet.data/data/daily/prod/sgpp_dd_market_outcome/ --recursive
aws s3 cp s3://sg.bet.data/simulate_again/sgpp_dd_sport/ s3://sg.bet.data/data/daily/prod/sgpp_dd_sport/ --recursive


ssh -i "Uluc_frankfurt_key.pem" -N -f -L 8888:localhost:8888 ec2-user@ec2-18-195-23-30.eu-central-1.compute.amazonaws.com

ssh -i "Uluc_frankfurt_key.pem" ec2-user@ec2-18-195-23-30.eu-central-1.compute.amazonaws.com


sudo pip-3.6 install jupyter
mkdir MyNotebooks
cd MyNotebooks/
jupyter notebook




aws s3 cp s3://sg.bet.data/data/daily/prod/sgpp_dd_sport/2021/01/30/ s3://sg.bet.data/simulate_again/sgpp_dd_sport/2021/01/30/ --recursive --profile u.a.user
aws s3 cp s3://sg.bet.data/data/daily/prod/daily_payout/2021/01/30/ s3://sg.bet.data/simulate_again/daily_payout/2021/01/30/ --recursive --profile u.a.user
aws s3 cp s3://sg.bet.data/data/daily/prod/sgpp_dd_comp_group/2021/01/30/ s3://sg.bet.data/simulate_again/sgpp_dd_comp_group/2021/01/30/ --recursive --profile u.a.user
aws s3 cp s3://sg.bet.data/data/daily/prod/sgpp_dd_competition/2021/01/30/ s3://sg.bet.data/simulate_again/sgpp_dd_competition/2021/01/30/ --recursive --profile u.a.user
aws s3 cp s3://sg.bet.data/data/daily/prod/daily_sales/2021/01/30/ s3://sg.bet.data/simulate_again/daily_sales/2021/01/30/ --recursive --profile u.a.user
aws s3 cp s3://sg.bet.data/data/daily/prod/sgpp_dd_event/2021/01/30/ s3://sg.bet.data/simulate_again/sgpp_dd_event/2021/01/30/ --recursive --profile u.a.user
aws s3 cp s3://sg.bet.data/data/daily/prod/sgpp_dd_market/2021/01/30/ s3://sg.bet.data/simulate_again/sgpp_dd_market/2021/01/30/ --recursive --profile u.a.user
aws s3 cp s3://sg.bet.data/data/daily/prod/sgpp_dd_market_outcome/2021/01/30/ s3://sg.bet.data/simulate_again/sgpp_dd_market_outcome/2021/01/30/ --recursive --profile u.a.user
aws s3 cp s3://sg.bet.data/data/daily/prod/daily_iddaa_ticket_detail/2021/01/30/ s3://sg.bet.data/simulate_again/daily_iddaa_ticket_detail/2021/01/30/ --recursive --profile u.a.user



aws s3 cp s3://sg.bet.data/simulate_again/sgpp_dd_sport/2021/01/30/ s3://sg.bet.data/data/daily/dev/sgpp_dd_sport/2021/01/30/ --recursive --profile u.a.user
aws s3 cp s3://sg.bet.data/simulate_again/daily_payout/2021/01/30/ s3://sg.bet.data/data/daily/dev/daily_payout/2021/01/30/ --recursive --profile u.a.user
aws s3 cp s3://sg.bet.data/simulate_again/sgpp_dd_comp_group/2021/01/30/ s3://sg.bet.data/data/daily/dev/sgpp_dd_comp_group/2021/01/30/ --recursive --profile u.a.user
aws s3 cp s3://sg.bet.data/simulate_again/sgpp_dd_competition/2021/01/30/ s3://sg.bet.data/data/daily/dev/sgpp_dd_competition/2021/01/30/ --recursive --profile u.a.user
aws s3 cp s3://sg.bet.data/simulate_again/daily_sales/2021/01/30/ s3://sg.bet.data/data/daily/dev/daily_sales/2021/01/30/ --recursive --profile u.a.user
aws s3 cp s3://sg.bet.data/simulate_again/sgpp_dd_event/2021/01/30/ s3://sg.bet.data/data/daily/dev/sgpp_dd_event/2021/01/30/ --recursive --profile u.a.user
aws s3 cp s3://sg.bet.data/simulate_again/sgpp_dd_market/2021/01/30/ s3://sg.bet.data/data/daily/dev/sgpp_dd_market/2021/01/30/ --recursive --profile u.a.user
aws s3 cp s3://sg.bet.data/simulate_again/sgpp_dd_market_outcome/2021/01/30/ s3://sg.bet.data/data/daily/dev/sgpp_dd_market_outcome/2021/01/30/ --recursive --profile u.a.user
aws s3 cp s3://sg.bet.data/simulate_again/daily_iddaa_ticket_detail/2021/01/30/ s3://sg.bet.data/data/daily/dev/daily_iddaa_ticket_detail/2021/01/30/ --recursive --profile u.a.user