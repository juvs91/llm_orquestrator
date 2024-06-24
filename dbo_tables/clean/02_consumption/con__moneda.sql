{{config(materialized='table')}}

WITH MST_MONEDA_VW AS
(
    SELECT
            CLAMONEDA AS CLA_MONEDA,
            NOMBREMONEDA AS NOM_MONEDA
    FROM {{source('src_prod_kraken_abt','dbo_TesCatMoneda')}}
)

SELECT * FROM MST_MONEDA_VW