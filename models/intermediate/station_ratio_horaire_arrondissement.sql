SELECT 
  *,
  CASE 
    WHEN ratio_arrivee >1.8 THEN "Faible"
    WHEN ratio_arrivee >= 1.5 THEN "Moyen"
    ELSE "Fort"
    END AS ratio_category_arrivee,
  CASE 
    WHEN ratio_tension >0.6 THEN "Faible"
    WHEN ratio_tension >0 THEN "Moyen"
    ELSE "Fort"
    END AS ratio_category_depart
    
FROM {{ ref('ratio_tension_station_heure') }} as a
LEFT JOIN {{ ref('stg_donnees_juin__info_arrondissement_2') }} as b
  USING (zip_code)
ORDER BY station_nom, heure