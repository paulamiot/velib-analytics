SELECT *,
 CASE WHEN (formatted_duration>"03:00:00")
    THEN 1
    
ELSE 0 
END AS trajet_long

FROM {{ ref('colonne_velos_casses') }}
ORDER BY trajet_long desc, formatted_duration desc

