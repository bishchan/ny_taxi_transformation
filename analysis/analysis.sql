SELECT zone , count(*) as c  FROM {{source('nyc_taxi_data', 'zones')}}  
GROUP BY zone
having c > 1

