{{ config(materialized='table') }}

WITH MST_TIPO_DESTINO_VW AS (
    SELECT
        CLATIPODESTINO AS CLA_TIPO_DESTINO,
        NOMTIPODESTINO AS NOM_TIPO_DESTINO
    FROM {{ ref('stg__fle_cat_tipo_destino') }}
)

SELECT * FROM MST_TIPO_DESTINO_VW
