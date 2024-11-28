with 

source as (

    select * from {{ source('donnees_juin', 'etats_stations_par_heure') }}

),

renamed as (

    select
        datetime_log,
        date_jour,
        date_heure,
        EXTRACT(HOUR FROM date_heure) AS heure, 
        duedate,
        station_id,
        station_nom,
        station_statut,
        station_capacite,
        nb_bornettes_libres,
        nb_velo_meca,
        nb_velo_elec,
        retour_possible,
        coordonnees_geos,
        commune_nom,
        commune_code_insee,
        nb_stations_a_350m,
        ids_stations_a_350m,
        nb_stations_a_500m,
        ids_stations_a_500m,
        nb_stations_a_800m,
        ids_stations_a_800m

    from source

)

select * from renamed
