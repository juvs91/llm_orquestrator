{{ config(materialized='table') }}

WITH MST_SISTEMA_ORIGEN_VW AS (
    SELECT
        CLASISTEMAORIGEN AS CLA_SISTEMA_ORIGEN,
        NOMSISTEMAORIGEN AS NOM_SISTEMA_ORIGEN
    FROM {{ ref('stg__con_cat_sistema_origen') }}
)

SELECT * FROM MST_SISTEMA_ORIGEN_VW
