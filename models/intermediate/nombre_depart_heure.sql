SELECT 
zip_code_departure,
departure_hour,
coordonnee_departure,
COUNT (departure_station_name)AS count_departure_station
FROM {{ ref('table_avec_arrondissement') }}
GROUP BY zip_code_departure, departure_hour, coordonnee_departure
ORDER BY  departure_hour desc,(COUNT (departure_station_name))desc
