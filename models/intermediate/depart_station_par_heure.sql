WITH hour_depart AS (
SELECT 
    *,
EXTRACT(HOUR FROM departure_time) AS depart_hour
FROM {{ ref("stg_donnees_juin__donnes_velib_juin") }}

)
  SELECT 
    Departure_Station_Name AS station_depart_nom,
    depart_hour,
    COUNT (Departure_Station_Name) AS nb_depart,
    COUNT (Arrival_Station_Name) AS nb_arrival
  FROM hour_depart
GROUP BY ALL
ORDER BY station_depart_nom, depart_hour