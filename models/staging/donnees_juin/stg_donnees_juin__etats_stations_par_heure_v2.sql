WITH sub1 AS (
SELECT *,
  ST_Y(coordonnees_geos) AS long,
  ST_X(coordonnees_geos) AS lat
FROM {{ ref('stg_donnees_juin__etats_stations_par_heure') }}
)

SELECT * EXCEPT (coordonnees_geos),
  ST_GEOGPOINT(long, lat) AS coordonnees_geos
FROM sub1
