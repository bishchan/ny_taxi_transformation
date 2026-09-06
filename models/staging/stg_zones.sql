SELECT * 
FROM {{ source('nyc_taxi_data', 'zones') }} 