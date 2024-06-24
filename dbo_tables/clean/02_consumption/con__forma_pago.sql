{{ config(materialized='table') }}

WITH MST_FORMA_PAGO_VW AS (
    SELECT
        CLAFORMAPAGO AS CLA_FORMA_PAGO,
        NOMFORMAPAGO AS NOM_FORMA_PAGO
    FROM {{ ref('stg__car_cat_forma_pago') }}
)

SELECT * FROM MST_FORMA_PAGO_VW
