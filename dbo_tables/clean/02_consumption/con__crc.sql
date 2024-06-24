{{ config(materialized='table') }}

WITH MST_CRC_VW AS
(
    SELECT
            CLACRC AS CLA_CRC,
            NUMCRC || ' - '|| NOMCRCIDIOMA1 AS NOM_CRC,
            NUMCRC AS NUM_CRC
    FROM {{source('src_prod_kraken_abt','dbo_ConCatCRC')}}
)

SELECT * FROM MST_CRC_VW