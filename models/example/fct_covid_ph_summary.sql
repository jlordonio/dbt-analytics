{{ config(materialized='table') }}

with weekly_data as (
    select * from {{ ref('int_covid_ph_weekly') }}
)

select
    country_name,
    year_month,
    monthly_confirmed_cases,
    monthly_deceased_cases,
    population,
    -- Pagkalkula ng Mortality Rate (Deceased / Confirmed cases)
    SAFE_DIVIDE(monthly_deceased_cases, monthly_confirmed_cases) as mortality_rate,
    -- Pagkalkula ng Infection Rate batay sa populasyon
    SAFE_DIVIDE(monthly_confirmed_cases, population) as infection_rate
from weekly_data
order by year_month desc