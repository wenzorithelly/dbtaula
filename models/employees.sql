with
    calc_employees as (
        select 
            employee_id,
            date_part(year, current_date) - date_part(year, birth_date) as age,
            date_part(year, current_date) - date_part(year, hire_date) length_of_service,
            first_name || ' ' || last_name name

        from {{source('sources', 'employees')}} )

select * from calc_employees