SELECT 
  *
FROM {{ ref('ratio_tension_station_heure') }} as a
LEFT JOIN {{ ref('stg_donnees_juin__info_arrondissement_2') }} as b
  USING (zip_code)
ORDER BY station_nom, heure