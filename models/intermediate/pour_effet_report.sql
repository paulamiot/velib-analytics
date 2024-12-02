WITH sub1 AS (

    SELECT
        a.*,
        CONCAT(station_id,"-", heure) AS cle_unique, 
    FROM {{ ref("stg_donnees_juin__etats_stations_par_heure_v2") }} as a
)

SELECT 
    sub1.cle_unique, 
    sub1.* EXCEPT (cle_unique),
    nb_depart_moyen,
    ratio_tension,
    nb_stations_arr,
    nbre_bornettes_arr,
    commune_arrondissement,
    ratio_category_depart
FROM sub1
LEFT JOIN {{ ref("station_ratio_horaire_arrondissement") }} as b
    USING (cle_unique)