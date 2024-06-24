{{ config(materialized='table') }}

WITH
MST_TIPO_FLETE_VW AS (
    SELECT
        clatipoflete AS CLA_TIPO_FLETE,
        nombretipoflete AS NOM_TIPO_FLETE
    FROM {{ ref('stg__vta_cat_tipo_flete') }}
)

SELECT * FROM MST_TIPO_FLETE_VW
