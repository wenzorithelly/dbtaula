
      
        
            delete from "northwind"."dbt_wfranca"."catreports"
            where (
                category_id) in (
                select (category_id)
                from "catreports__dbt_tmp005252290247"
            );

        
    

    insert into "northwind"."dbt_wfranca"."catreports" ("category_id", "category_name", "description")
    (
        select "category_id", "category_name", "description"
        from "catreports__dbt_tmp005252290247"
    )
  