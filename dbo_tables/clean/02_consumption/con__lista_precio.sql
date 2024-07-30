{{ config(materialized='table') }}

WITH MST_LISTA_PRECIO_VW AS (
    SELECT
        IDLISTAPRECIO AS CLA_LISTA_PRECIO,
        NOMLISTAPRECIO AS NOM_LISTA_PRECIO
    FROM {{ ref('stg__vta_tra_lista_precio') }}
)

SELECT * FROM MST_LISTA_PRECIO_VW
