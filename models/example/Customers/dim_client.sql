with customers as (
select c_custkey, c_name,c_address, c_phone, c_nationkey 

from {{source('ODS','DIM_CUST')}}
)

select * from customers 
----where c_phone like '31%'