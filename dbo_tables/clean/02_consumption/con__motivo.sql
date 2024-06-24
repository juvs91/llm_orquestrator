{{config(materialized='table')}}

WITH MST_MOTIVO_VW AS (
    SELECT
        CLAMOTIVO AS CLA_MOTIVO,
        NOMBREMOTIVO AS NOM_MOTIVO
    FROM {{ ref('stg__vta_cat_motivo') }}
)

SELECT * FROM MST_MOTIVO_VW
