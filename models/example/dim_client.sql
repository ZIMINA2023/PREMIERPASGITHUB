{{config (
    materialized="table"
)}}

with customers as (
select c_custkey, c_name,c_address, c_phone, c_nationkey 

from REF_CLIENT.ODS.DIM_CUST
)

select * from customers