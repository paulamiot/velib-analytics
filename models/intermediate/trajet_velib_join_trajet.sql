SELECT
    table_trajet.Departure_Station_Name,
    table_trajet.Departure_Latitude,
    table_trajet.Departure_Longitude,
    table_trajet.Arrival_Station_Name,
    table_trajet.Arrival_Latitude,
    table_trajet.Arrival_Longitude,
    table_trajet.nb_trajet,
    table_trajet.trajet_stations,
    table_trajet.nb_electric,
    table_trajet.nb_manual,
    trajet_velib.Bike,
    trajet_velib.departure_geo,
    trajet_velib.arrival_geo,
    trajet_velib.departure_time_formatted
  FROM
    `projet-velibanalytics.dbt_vghassoul.table_trajet` AS table_trajet
    INNER JOIN `projet-velibanalytics.dbt_vghassoul.trajet_velib` AS trajet_velib ON table_trajet.Departure_Station_Name = trajet_velib.Departure_Station_Name
     AND table_trajet.Arrival_Station_Name = trajet_velib.Arrival_Station_Name;