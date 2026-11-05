WITH source_data AS (
    SELECT * 
    FROM {{ ref('stg_bikeshare_trips') }}
)

SELECT
    rental_hour,
    subscriber_type,
    COUNT(trip_id) AS total_trips
FROM source_data
WHERE start_date IS NOT NULL
GROUP BY 1, 2
ORDER BY total_trips DESC