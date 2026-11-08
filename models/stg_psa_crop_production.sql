with source_data as (
    select * from {{ source('psa_raw', 'raw_psa_crop_area') }}
)

select
    ecosystem_croptype,
    geolocation,
    period_column,
    safe_cast(production_area_hectares as float64) as production_area_hectares
from source_data
unpivot(
    production_area_hectares for period_column in (
        {{ get_unpivot_columns(source('psa_raw', 'raw_psa_crop_area')) }}
    )
)