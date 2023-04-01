{{config (
    materialized="table"
)}}

with orders as (
select * from REF_CLIENT.ODS.O_ORDER o
)

select * from orders