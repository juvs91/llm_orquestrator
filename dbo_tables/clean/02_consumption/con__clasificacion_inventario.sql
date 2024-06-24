{{config(materialized='table')}}
WITH
RAW_STR_P_PLD_PLDCATCLASIFICACIONINVENTARIO AS(
    SELECT
       CLACLASIFICACIONINVENTARIO AS CLA_CLASIFICACION_INVENTARIO,
       NOMCLASIFICACIONINVENTARIO AS NOM_CLASIFICACION_INVENTARIO,
       BAJALOGICA AS BAJA_LOGICA
    FROM {{ref('stg__pld_cat_clasificacion_inventario')}}
)

SELECT * FROM RAW_STR_P_PLD_PLDCATCLASIFICACIONINVENTARIO