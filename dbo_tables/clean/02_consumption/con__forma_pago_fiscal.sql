{{ config(materialized='table') }}

WITH MST_FORMA_PAGO_FISCAL_VW AS (
    SELECT
        CLAFORMAPAGOFISCAL AS CLA_FORMA_PAGO_FISCAL,
        CLAFORMAPAGOFISCAL
        || ' - '
        || NOMFORMAPAGOFISCAL AS NOM_FORMA_PAGO_FISCAL
    FROM {{ ref('stg__tes_cat_forma_pago_fiscal') }}
)

SELECT * FROM MST_FORMA_PAGO_FISCAL_VW
