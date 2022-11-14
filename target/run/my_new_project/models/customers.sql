

  create view "northwind"."dbt_wfranca"."customers__dbt_tmp" as (
    with
    markup as (
        select *,
            first_value(customer_id) over(partition by company_name, contact_name order by company_name
            rows between unbounded preceding and unbounded following) as result

        from "northwind"."public"."customers" ),
    removed as (
        select distinct result from markup
    )

select * from "northwind"."public"."customers" where customer_id in (select * from removed)
  ) ;
