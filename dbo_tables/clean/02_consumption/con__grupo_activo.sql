{{ config(materialized='table') }}

WITH MST_GRUPO_ACTIVO_VW AS (
    SELECT
        CLAGRUPOACTIVO AS CLA_GRUPO_ACTIVO,
        NOMGRUPOACTIVO AS NOM_GRUPO_ACTIVO
    FROM {{ref('stg__af_cat_grupo_activo')}}
)

SELECT * FROM MST_GRUPO_ACTIVO_VW
