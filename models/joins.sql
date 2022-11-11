with
    prod as (
        select 
            c.category_name, s.company_name supplier, p.product_name, 
            p.unit_price, p.product_id
        from {{source('sources', 'products')}} p
            left join {{source('sources', 'suppliers')}} s on s.supplier_id = p.supplier_id
            left join {{source('sources', 'categories')}} c on c.category_id = p.category_id ),
    orddetail as (
        select pd.*, od.order_id, od.quantity, od.discount
        from {{ref('order_details')}} od
            left join prod pd on pd.product_id = od.product_id
    ), 
    ordrs as (
        select
            o.order_date, o.order_id, c.company_name customer, e.name employee, 
            e.age, e.length_of_service

        from {{source('sources', 'orders')}} o
            left join {{ref('customers')}} c on c.customer_id = o.customer_id
            left join {{ref('employees')}} e on e.employee_id = o.employee_id
            left join {{source('sources', 'shippers')}} s on s.shipper_id = o.ship_via
    ),
    nominal as (
        select
            od.*, o.order_date, o.customer, o.employee, o.age, o.length_of_service

        from orddetail od
            inner join ordrs o on o.order_id = od.order_id
    )

select * from nominal