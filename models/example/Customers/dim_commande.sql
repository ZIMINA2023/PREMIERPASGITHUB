with orders as (
select * from {{source ('ODS','O_ORDER')}}
)

select * from orders