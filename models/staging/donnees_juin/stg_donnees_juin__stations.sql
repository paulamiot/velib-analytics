with 

source as (

    select * from {{ source('donnees_juin', 'stations') }}

),

renamed as (

    select
        id_station,
        nom_station,
        en_fonctionnement,
        capacite_station,
        bornes_paiement_dispo,
        nom_commune,
        code_postal,
        nb_stations_a_350m,
        nb_stations_a_500m,
        nb_stations_a_800m,
        ids_stations_a_350m,
        ids_stations_a_500m,
        ids_stations_a_800m,
        coordonnees_geos

    from source

)

select * from renamed
