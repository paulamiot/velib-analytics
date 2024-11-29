select
    b.*,
    nb_depart_moyen,
    ratio_tension,
    nb_stations_arr,
    nbre_bornettes_arr,
    commune_arrondissement,
    ratio_category
from {{ ref("station_ratio_horaire_arrondissement") }} as a
left join
    {{ ref("stg_donnees_juin__etats_stations_par_heure_v2") }} as b
    on a.station_id = b.station_id
