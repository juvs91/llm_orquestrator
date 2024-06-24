{{ config(materialized='table') }}

WITH MST_TIPO_ACTIVO_VW AS (
    SELECT
        CLATIPOACTIVO AS CLA_TIPO_ACTIVO,
        NOMTIPOACTIVO AS NOM_TIPO_ACTIVO
    FROM {{ ref('stg__af_cat_tipo_activo') }}
)

SELECT * FROM MST_TIPO_ACTIVO_VW
