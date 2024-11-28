with s as (SELECT*,
CASE 
    WHEN (formatted_duration<"00:01:16")
    THEN 1
    
ELSE 0 
END AS trajet_defectueux

FROM {{ ref('stg_donnees_juin__donnes_velib_juin') }}
) 
SELECT *
FROM s 
ORDER BY trajet_defectueux desc, formatted_duration desc
--formatted_duration < "00:01:15" AND arrival_latitude = departure_latitude