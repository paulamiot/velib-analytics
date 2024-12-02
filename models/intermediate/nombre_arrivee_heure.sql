SELECT 
zip_code_arrival,
arrival_hour,
coordonnee_arrival,
COUNT (arrival_station_name)AS count_arrival_station
FROM {{ ref('table_avec_arrondissement') }}
GROUP BY zip_code_arrival, arrival_hour, coordonnee_arrival
ORDER BY  arrival_hour desc,(COUNT (arrival_station_name))desc