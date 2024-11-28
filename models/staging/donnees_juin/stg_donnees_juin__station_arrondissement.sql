with 

source as (

    select * from {{ source('donnees_juin', 'station_arrondissement') }}

),

renamed as (

    select
        station_id,
        station_nom,
        station_status,
        station_capacity,
        station_geoloc,
        commune_nom,
        latitude,
        longitude,
        surface,
        zip_code,
        commune_arrondissement

    from source

)

select * from renamed
