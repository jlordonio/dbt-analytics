with staged as (
    select
        ecosystem_croptype,
        geolocation,
        period_column,
        production_area_hectares
    from {{ ref('stg_psa_crop_production') }}
),

parsed_periods as (
    select
        ecosystem_croptype,
        geolocation,
        period_column,
        production_area_hectares,
        -- Halimbawa, kinukuha natin ang taon at quarter mula sa period_column (e.g., "1987 Quarter 1")
        regexp_extract(period_column, r'(\d{4})') as production_year,
        regexp_extract(period_column, r'(Quarter \d)') as production_quarter
    from staged
)

select
    ecosystem_croptype,
    geolocation,
    period_column,
    safe_cast(production_year as int64) as production_year,
    production_quarter,
    production_area_hectares
from parsed_periods