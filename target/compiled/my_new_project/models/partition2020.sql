select * from "northwind"."dbt_wfranca"."joins"
where date_part(year, order_date) = 2020