{{
    config(
        materialized='table'
    )
}}

select
    ecosystem_croptype,
    geolocation,
    production_year,
    production_quarter,
    sum(production_area_hectares) as total_production_area_hectares
from {{ ref('int_psa_crop_production_transformed') }}
group by 1, 2, 3, 4