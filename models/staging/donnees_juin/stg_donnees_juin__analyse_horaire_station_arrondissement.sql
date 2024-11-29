with 

source as (

    select * from {{ source('donnees_juin', 'analyse_horaire_station_arrondissement') }}

),

renamed as (

    select
        cle_unique,
        station_id,
        heure,
        station_nom,
        station_statut,
        nb_velo_elec,
        nb_velo_meca,
        station_capacite,
        nb_velo_dispo,
        nb_depart_moyen,
        nb_depart_cumule,
        zip_code,
        ratio_tension,
        latitude_station,
        longitude_station,
        geoloc_station,
        geoloc_arrondissement,
        string_field_17

    from source

)

select * from renamed
