{{ config(materialized='table') }}

WITH
MST_DIRECCION_VW AS (
    SELECT
        CLADIRECCION AS CLA_DIRECCION,
        NOMDIRECCION AS NOM_DIRECCION,
        NUMDIRECCION AS NUM_DIRECCION
    FROM {{ ref('stg__con_cat_direccion') }}
)

SELECT * FROM MST_DIRECCION_VW
