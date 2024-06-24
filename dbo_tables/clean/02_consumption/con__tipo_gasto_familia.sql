{{ config(materialized='table') }}
WITH
MST_TIPO_GASTO_FAMILIA_VW AS (
    SELECT
        clatipogasto AS CLA_TIPO_GASTO_FAMILIA,
        nomtipogasto AS NOM_TIPO_GASTO_FAMILIA
    FROM
        {{ ref('stg__fle_cat_tipo_gasto') }}
)
SELECT * FROM MST_TIPO_GASTO_FAMILIA_VW
