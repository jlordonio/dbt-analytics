SELECT
    trip_id,
    subscriber_type,
    start_date,
    EXTRACT(HOUR FROM start_date) AS rental_hour
FROM `bigquery-public-data.san_francisco_bikeshare.bikeshare_trips`