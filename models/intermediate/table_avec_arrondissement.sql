WITH y AS (
SELECT 
sdj.*,
djs.zip_code AS zip_code_departure,
EXTRACT(HOUR from departure_time)AS departure_hour,
EXTRACT (HOUR from arrival_time)AS arrival_hour,
CONCAT (departure_latitude, ",", departure_longitude)AS coordonnee_departure,
CONCAT(arrival_latitude, ",", arrival_longitude)AS coordonnee_arrival,
FROM {{ ref('stg_donnees_juin__donnes_velib_juin') }}AS sdj
LEFT JOIN {{ ref('stg_donnees_juin__station_arrondissement') }}AS djs 
ON sdj.departure_station_name = djs.station_nom
)
SELECT 
*,
arron.zip_code AS zip_code_arrival
FROM y
LEFT JOIN {{ ref('stg_donnees_juin__station_arrondissement') }} AS arron 
ON y.arrival_station_name = arron.station_nom