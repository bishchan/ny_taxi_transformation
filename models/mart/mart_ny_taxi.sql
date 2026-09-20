With green_taxi as (
    SELECT green_taxi.* ,  Extract(year FROM pickup_datetime) as year, Extract(month FROM pickup_datetime) as month, 
pg_zones.borough as pickup_borough, pg_zones.zone as pickup_zone, pg_zones.service_zone as pickup_service_zone, 
dg_zones.borough as dropoff_borough, dg_zones.zone as dropoff_zone, dg_zones.service_zone as dropoff_service_zone
FROM {{ref('nyc_taxi_data','stg_green_taxi')}} as green_taxi 
LEFT JOIN  {{ref('nyc_taxi_data', 'stg_zones')}} as pg_zones
ON green_taxi.pickup_location_id = pg_zones.location_id
LEFT JOIN  {{ref('nyc_taxi_data', 'stg_zones')}} as dg_zones
ON green_taxi.dropoff_location_id = dg_zones.location_id
WHERE Extract(year FROM pickup_datetime)  = 2025
),


yellow_taxi as (
    SELECT yellow_taxi.* , Extract(year FROM pickup_datetime) as year, Extract(month FROM pickup_datetime) as month,
py_zones.borough as pickup_borough, py_zones.zone as pickup_zone, py_zones.service_zone as pickup_service_zone, 
dy_zones.borough as dropoff_borough, dy_zones.zone as dropoff_zone, dy_zones.service_zone as dropoff_service_zone
FROM {{ref('nyc_taxi_data','stg_yellow_taxi')}} as yellow_taxi 
LEFT JOIN  {{ref('nyc_taxi_data', 'stg_zones')}} as py_zones
ON yellow_taxi.pickup_location_id = py_zones.location_id
LEFT JOIN  {{ref('nyc_taxi_data', 'stg_zones')}} as dy_zones
ON yellow_taxi.dropoff_location_id = dy_zones.location_id
WHERE Extract(year FROM pickup_datetime) = 2025
)


SELECT * FROM green_taxi
UNION ALL
SELECT * FROM yellow_taxi
