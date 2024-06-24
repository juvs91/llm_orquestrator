{{ config(materialized='table') }}

WITH MST_CLASIFICACION_VW AS (
    SELECT
        claclasificacion AS CLA_CLASIFICACION,
        nomclasificacion AS NOM_CLASIFICACION
    FROM {{ref('stg__af_cat_clasificacion')}}
)

SELECT * FROM MST_CLASIFICACION_VW
