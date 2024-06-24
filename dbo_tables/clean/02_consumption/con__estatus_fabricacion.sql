{{ config(materialized='table') }}

WITH MST_ESTATUS_FABRICACION_VW AS (
    SELECT
        CLAESTATUS AS CLA_ESTATUS_FABRICACION,
        DESCRIPCION AS NOM_ESTATUS_FABRICACION
    FROM {{ ref('stg__vta_cat_estatus_fabricacion') }}
)

SELECT * FROM MST_ESTATUS_FABRICACION_VW
