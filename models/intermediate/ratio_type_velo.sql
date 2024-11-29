SELECT*
FROM {{ ref('trajet_velib') }} AS tv
INNER JOIN {{ ref('ratio_tension_station_heure') }}AS rtsh
ON tv.Departure_Station_Name = rtsh.station_nom