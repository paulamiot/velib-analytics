with 

source as (

    select * from {{ source('donnees_juin', 'info_arrondissement_2') }}

),

renamed as (

    select
        commune_arrondissement,
        zip_code,
        nb_stations_arr,
        nbre_bornettes_arr,
        longitude_arr,
        latitude_arr

    from source

)

select * from renamed
