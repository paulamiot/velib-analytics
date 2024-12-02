WITH hour_arrival AS (
SELECT 
    *,
EXTRACT(HOUR FROM arrival_time) AS arrival_hour
FROM {{ ref("stg_donnees_juin__donnes_velib_juin") }}

)
  SELECT 
    Arrival_Station_Name AS station_nom,
    arrival_station AS station_id,
    arrival_hour,
    COUNT (Arrival_Station_Name) AS nb_arrival
  FROM hour_arrival
GROUP BY ALL
ORDER BY Arrival_Station_Name, arrival_hour