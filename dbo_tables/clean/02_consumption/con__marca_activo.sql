{{ config(materialized='table') }}

WITH MST_MARCA_ACTIVO_VW AS (
    SELECT
        CLAMARCAACTIVO AS CLA_MARCA_ACTIVO,
        NOMMARCAACTIVO AS NOM_MARCA_ACTIVO
    FROM {{ref('stg__af_cat_marca_activo')}}
)

SELECT * FROM MST_MARCA_ACTIVO_VW
