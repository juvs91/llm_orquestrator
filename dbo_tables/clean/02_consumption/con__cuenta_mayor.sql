{{ config(materialized='table') }}

WITH MST_CUENTA_MAYOR_VW AS (
    SELECT
        CLACUENTAMAYOR AS CLA_CUENTA_MAYOR,
        NOMCUENTAMAYORIDIOMA1 AS NOM_CUENTA_MAYOR,
        NUMCUENTAMAYOR AS NUM_CUENTA_MAYOR
    FROM {{ ref('stg__con_cat_cuenta_mayor') }}
)

SELECT * FROM MST_CUENTA_MAYOR_VW
