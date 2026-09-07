SELECT 
    LocationID as location_id,
    Borough as borough,
    Zone as zone,
    service_zone as service_zone
FROM {{ source('nyc_taxi_data', 'zones') }}