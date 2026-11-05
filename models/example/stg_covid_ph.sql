{{ config(materialized='table') }}

select 
    country_name,
    date,
    new_confirmed,
    new_deceased,
    population
from `bigquery-public-data.covid19_open_data.covid19_open_data`
where country_name = 'Philippines'
  and aggregation_level = 0
  and date is not null