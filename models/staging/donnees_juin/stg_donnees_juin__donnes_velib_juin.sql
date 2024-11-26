with 

source as (

    select * from {{ source('donnees_juin', 'donnes_velib_juin') }}

),

renamed as (

    select
        bike,
        departure_station,
        departure_station_name,
        departure_time,
        departure_latitude,
        departure_longitude,
        electric,
        arrival_station,
        arrival_station_name,
        arrival_time,
        arrival_latitude,
        arrival_longitude,
        length,
        duration

    from source

)

select * from renamed
