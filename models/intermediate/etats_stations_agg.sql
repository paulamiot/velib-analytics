SELECT 
    *
FROM {{ ref('stg_donnees_juin__etats_stations_par_heure') }}
