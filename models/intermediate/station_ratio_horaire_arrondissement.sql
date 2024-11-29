SELECT 
  *,
  CASE 
    WHEN ratio_tension >0.6 THEN "Faible"
    WHEN ratio_tension >0 THEN "Moyen"
    ELSE "Fort"
    END AS ratio_category
FROM {{ ref('ratio_tension_station_heure') }} as a
LEFT JOIN {{ ref('stg_donnees_juin__info_arrondissement_2') }} as b
  USING (zip_code)
ORDER BY station_nom, heure