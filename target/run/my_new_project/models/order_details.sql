

  create view "northwind"."dbt_wfranca"."order_details__dbt_tmp" as (
    select 
    od.order_id, od.product_id, od.unit_price, od.quantity, p.product_name, p.supplier_id, p.category_id,
    od.unit_price * od.quantity total,
    (p.unit_price * od.quantity) - total discount 

from "northwind"."public"."order_details" od 
    left join "northwind"."public"."products" p on p.product_id = od.product_id
  ) ;
