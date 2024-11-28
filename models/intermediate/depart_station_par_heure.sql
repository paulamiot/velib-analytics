WITH hour_depart AS (
SELECT 
    *,
EXTRACT(HOUR FROM departure_time) AS hour
FROM {{ ref("stg_donnees_juin__donnes_velib_juin") }}

)
  SELECT 
    Departure_Station_Name,
    hour,
    COUNT (Departure_Station_Name) AS nb_depart
    
  FROM hour_depart
GROUP BY ALL
ORDER BY Departure_Station_Name, hour