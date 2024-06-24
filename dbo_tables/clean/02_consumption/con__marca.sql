{{ config(materialized='table') }}

WITH MARCA AS (
    SELECT
        CLAMARCA AS CLA_MARCA,
        NOMMARCA AS NOM_MARCA
    FROM {{ ref('stg__vta_cat_marca') }}
)

SELECT * FROM MARCA
