
SELECT 
sdj.*,
dsh.zip_code,
EXTRACT(HOUR from departure_time)AS departure_hour,
EXTRACT (HOUR from arrival_time)AS arrival_hour,
CONCAT (departure_latitude, ",", departure_longitude)AS coordonnee_departure,
CONCAT(arrival_latitude, ",", arrival_longitude)AS coordonnee_arrival,
FROM {{ ref('stg_donnees_juin__donnes_velib_juin') }}AS sdj
LEFT JOIN {{ ref('depart_station_heure_arrondissement') }}AS dsh 
ON sdj.departure_station_name = dsh.station_depart_nom
