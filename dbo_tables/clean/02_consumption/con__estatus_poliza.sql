{{ config(materialized='table') }}

WITH MST_ESTATUS_POLIZA_VW AS (
    SELECT
        CLAESTATUSPOLIZA AS CLA_ESTATUS_POLIZA,
        NOMESTATUSPOLIZA AS NOM_ESTATUS_POLIZA
    FROM {{ ref('stg__con_cat_estatus_poliza') }}
)

SELECT * FROM MST_ESTATUS_POLIZA_VW
