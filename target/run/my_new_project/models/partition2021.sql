

  create view "northwind"."dbt_wfranca"."partition2021__dbt_tmp" as (
    select * from "northwind"."dbt_wfranca"."joins"
where date_part(year, order_date) = 2021
  ) ;
