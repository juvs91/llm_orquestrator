{{ config(materialized='table') }}

WITH MST_ESTATUS_ACTIVO_VW AS (
    SELECT
        CLAESTATUSACTIVO AS CLA_ESTATUS_ACTIVO,
        NOMESTATUSACTIVO AS NOM_ESTATUS_ACTIVO
    FROM {{ref('stg__af_cat_estatus_activo')}}
)

SELECT * FROM MST_ESTATUS_ACTIVO_VW
