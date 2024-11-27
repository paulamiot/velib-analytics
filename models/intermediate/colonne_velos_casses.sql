SELECT*,
CASE 
    WHEN (duration_minute < 2 AND departure_latitude=arrival_latitude)
    THEN 1
    
ELSE 0 
END AS trajet_defectueux

FROM {{ ref('stg_donnees_juin__donnes_velib_juin') }}
