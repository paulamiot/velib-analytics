SELECT
    b.station_id,
    a.station_depart_nom,
    b.zip_code,
    b.commune_arrondissement,
    a.hour,
    a.nb_depart AS nb_depart_cumule,
    ROUND ((a.nb_depart / 60),2) AS nb_depart_moyen,
    b.station_capacity,
    b.station_status
FROM {{ ref('depart_station_par_heure') }} AS a
LEFT JOIN {{ ref('stg_donnees_juin__station_arrondissement') }} as b
    ON a.station_depart_nom = b.station_nom