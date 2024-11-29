SELECT
   nb_electric,
   count(distinct Bike) AS nb
  FROM
    {{ ref('trajet_velib') }}
group by nb_electric