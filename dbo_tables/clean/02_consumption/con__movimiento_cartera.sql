{{ config(materialized='table') }}

WITH MST_MOVIMIENTO_CARTERA_VW AS (
    SELECT
             CLA_MOV_CARTERA
            ,RIGHT('00' || CAST(CLA_MOV_CARTERA AS string),3)
                    || ' - '||  UPPER(DESCRIPCION) || 
                    (CASE WHEN BAJA_LOGICA=1 THEN ' (BAJA)' ELSE '' END)           AS NOM_MOV_CARTERA
            ,CLA_GPO_MOV_CARTERA                                                   AS CLA_GPO_MOV_CARTERA
            ,NOM_GPO_MOV_CARTERA                                                   AS NOM_GPO_MOV_CARTERA
            ,CLA_TIPO_MOV                                                          AS CLA_TIPO_MOVIMIENTO
            ,NOM_TIPO_MOV                                                          AS NOM_TIPO_MOVIMIENTO
            ,(CASE WHEN IFNULL(ES_APLICA_CARGO_VENTAS,0)
                        + IFNULL(ES_APLICA_CREDITO_VENTAS,0)>=1 
                   THEN 'SI' 
                   ELSE 'NO' 
              END)                                                                 AS APLICA_INGRESOS_SN
            ,(CASE WHEN IFNULL(ES_APLICA_CARGO_CARTERA,0)
                        + IFNULL(ES_APLICA_CREDITO_CARTERA,0)>=1 
                   THEN 'SI' 
                   ELSE 'NO'
              END)                                                                 AS APLICA_CARTERA_SN
            ,(CASE WHEN IFNULL(ES_APLICA_CARGO_COSTO_INTEGRAL,0)
                        + IFNULL(ES_APLICA_CREDITO_COSTO_INTEGRAL,0)>=1
                   THEN 'SI' 
                   ELSE 'NO' 
              END)                                                                 AS APLICA_COSTO_INTEGRAL_SN
            ,(CASE WHEN IFNULL(ES_APLICA_CARGO_OTROS_INGRESOS,0)
                        + IFNULL(ES_APLICA_CREDITO_OTROS_INGRESOS,0)>=1 
                   THEN 'SI' 
                   ELSE 'NO' 
              END)                                                                 AS APLICA_OTROS_INGRESOS_SN
            ,(CASE WHEN IFNULL(ES_FACTURA_EMBARQUE,0)=1 
                   THEN 'SI'
                   ELSE 'NO' 
              END)                                                                 AS FILIAL_EMBARQUE_SN
    FROM {{ ref('con__fin_movimiento_cartera') }}
)

SELECT * FROM MST_MOVIMIENTO_CARTERA_VW
