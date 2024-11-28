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
        SUBSTR(Duration, 8)AS duration 
    from source

),final as(

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
        CAST(duration AS TIME) AS formatted_duration
    from renamed
), finalbis as (

SELECT 
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
        formatted_duration,
        length, 
        EXTRACT (MINUTE from formatted_duration) AS duration_minute
    from final
)
select * from finalbis
