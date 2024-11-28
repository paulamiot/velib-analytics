with 

source as (

    select * from {{ source('pistes cyclables', 'comptage_pistes_cyclables') }}

),

renamed as (

    select
        id_compteur,
        horodatage_comptage,
        mois_annee_comptage,
        nom_du_compteur,
        coordonnees_geo,
        nb_comptage,
        date_heure_comptage,
        date_installation_compteur

    from source

)

select * from renamed
