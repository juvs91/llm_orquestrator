{{ config(materialized='table') }}

WITH MST_CUP_VW AS
(
    SELECT
            CLACUP AS CLA_CUP,
            LTRIM(RTRIM(NOMCUP) || ' ' || LTRIM(RTRIM(APPATERNO))|| ' ' || LTRIM(RTRIM(APMATERNO))) AS NOM_CUP,
            RFC
    FROM {{ref('stg__cup_cat_proveedor')}}
)

SELECT * FROM MST_CUP_VW