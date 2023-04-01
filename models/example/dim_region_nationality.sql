with l_nation as (
select * from REF_CLIENT.ODS.NATION
),

l_region as (
select * from REF_CLIENT.ODS.REGION
),

region_nation as (
select r_regionkey, r_name, n_nationkey, n_name

from l_region as r  join l_nation as n on r.r_regionkey=n.n_regionkey
),

final as (

select * from region_nation
)

select * from final order by 1,2,3,4;