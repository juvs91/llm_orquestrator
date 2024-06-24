{{ config(materialized='table') }}

WITH MST_ESTATUS_PROYECTO_VW AS (
    SELECT
        CLAESTATUSPROYECTO AS CLA_ESTATUS_PROYECTO,
        NOMESTATUSPROYECTO AS NOM_ESTATUS_PROYECTO
    FROM {{ ref('stg__af_cat_estatus_proyecto') }}
)

SELECT * FROM MST_ESTATUS_PROYECTO_VW
