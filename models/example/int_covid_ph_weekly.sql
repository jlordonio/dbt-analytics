{{ config(materialized='table') }}

with source_data as (
    select * from {{ ref('stg_covid_ph') }}
)

select
    country_name,
    SUBSTR(date, 1, 7) as year_month, 
    sum(new_confirmed) as monthly_confirmed_cases,
    sum(new_deceased) as monthly_deceased_cases,
    any_value(population) as population
from source_data
group by country_name, year_month