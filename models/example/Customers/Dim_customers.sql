with customers as (
select * from {{ref('dim_client')}}
),

orders as (
select * from {{ref('dim_commande')}}
),

cutomers_order as (
select o_custkey as id,  o_orderkey, sum(o_totalprice) totalprice

from orders 
group by o_custkey, o_orderkey
),

final as (
select c_custkey, c_name, count(distinct o_orderkey) nb_commande,sum(totalprice) totalprice

from customers c 
left outer join cutomers_order o on c_custkey=o.id

group by c_custkey, c_name
)

select * from final limit 500