{{ config(materialized='table') }}

with raw_customers as (
    select 1 as customer_id, 'Juan' as first_name, 'Cruz' as last_name, 'Active' as status
    union all
    select 2 as customer_id, 'Maria' as first_name, 'Santos' as last_name, 'Active' as status
    union all
    select 3 as customer_id, 'Pedro' as first_name, 'Reyes' as last_name, 'Inactive' as status
),

final as (
    select 
        customer_id,
        concat(first_name, ' ', last_name) as full_name,
        status,
        current_timestamp() as created_at
    from raw_customers
    where status = 'Active'
)

select * from final
