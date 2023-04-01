with customers as (
select c_custkey, c_name,c_address, c_phone, c_nationkey 

from REF_CLIENT.ODS.DIM_CUST
),

orders as (
select * from REF_CLIENT.ODS.O_ORDER o
),

cutomers_order as (
select c.c_custkey as id,  o_orderkey, sum(o_totalprice) totalprice

from REF_CLIENT.ODS.DIM_CUST c join REF_CLIENT.ODS.O_ORDER o on c.c_custkey=o.o_custkey
group by c.c_custkey,o_orderkey
),

final as (
select c_custkey, c_name, count(distinct o_orderkey) nb_commande,sum(totalprice) totalprice

from customers c 
left outer join cutomers_order o on c_custkey=o.id

group by c_custkey, c_name
)

select * from final limit 500