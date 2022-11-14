{{config(materialized='incremental', unique_key='category_id')}}

select * from {{source('sources', 'categories')}}
order by category_id asc 