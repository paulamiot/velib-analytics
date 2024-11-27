SELECT
    Bike,
    Departure_Station_Name,
    Departure_Latitude,
    Departure_Longitude,
    Arrival_Station_Name,
    Arrival_Latitude,
   Arrival_Longitude,
  
    ST_GEOGFROMTEXT(CONCAT('POINT(', CAST(Departure_Longitude AS STRING), ' ', CAST(Departure_Latitude AS STRING), ')')) AS departure_geo,
    ST_GEOGFROMTEXT(CONCAT('POINT(', CAST(Arrival_Longitude AS STRING), ' ', CAST(Arrival_Latitude AS STRING), ')')) AS arrival_geo,
    FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', departure_time) AS departure_time_formatted,
    COUNT(Bike) AS nb_trajet,
    CONCAT(
        Departure_Station_Name, ' - ', 
        Arrival_Station_Name
    ) AS trajet_stations,
    SUM(CASE  
        WHEN Electric = TRUE THEN 1
        ELSE 0
    END) AS nb_electric,
    SUM(CASE  
        WHEN Electric = FALSE THEN 1
        ELSE 0
    END) AS nb_manual
FROM {{ ref('stg_donnees_juin__donnes_velib_juin') }}
    
GROUP BY
    Departure_Station_Name,
    Departure_Latitude,
    Departure_Longitude,
    Arrival_Station_Name,
    Arrival_Latitude,
    Arrival_Longitude,
    departure_time,
    Bike


