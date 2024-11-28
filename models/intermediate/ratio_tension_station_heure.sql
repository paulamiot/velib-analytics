WITH uid_etats AS (
  SELECT 
    station_id,
    heure,
    station_id,
    station_nom,
    station_statut,
    station_capacite,
    nb_velo_elec,
    nb_velo_meca,
    CONCAT(station_id,heure) AS unique_id_heure
  FROM {{ ref('stg_donnees_juin__etats_stations_par_heure') }}
  ),
uid_depart AS (
  SELECT
    station_id,
    hour,
    CONCAT(station_id,hour) AS unique_id_heure,
    nb_depart_cumule,
    nb_depart_moyen,
    zip_code
  FROM {{ ref('depart_station_heure_arrondissement') }}
)
SELECT 
    unique_id_heure AS cle_unique,
    uid_depart.station_id,
    heure,
    station_nom,
    station_statut,
    nb_velo_elec,
    nb_velo_meca,
    station_capacite,
    (nb_velo_elec + nb_velo_meca) AS nb_velo_dispo,
    nb_depart_moyen,
    nb_depart_cumule,
    zip_code,
    ROUND ((1 - (SAFE_DIVIDE(nb_depart_moyen, (nb_velo_elec + nb_velo_meca)))),2)AS ratio_tension
FROM uid_etats 
LEFT JOIN uid_depart
  USING (unique_id_heure)

#TEST
