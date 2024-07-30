{{ config(materialized='table') }}

WITH
RAW_CON_TRA_CUENTA_CONTABLE AS (
    SELECT
        IDCUENTACONTABLE AS ID_CUENTA_CONTABLE,
        1 AS IDIOMA,
        NIVELCUENTA AS NIVEL_CUENTA,
        CLANIVEL1 AS CLA_NIVEL_1,
        CLANIVEL2 AS CLA_NIVEL_2,
        CLANIVEL3 AS CLA_NIVEL_3,
        CLANIVEL4 AS CLA_NIVEL_4,
        ESREPORTEBALANCE AS ES_REPORTE_BALANCE
    FROM {{ ref('stg__con_tra_cuenta_contable') }}
),

MST_DIRECCION AS (
    SELECT
        CLADIRECCION AS CLA_DIRECCION,
        NOMDIRECCION AS NOM_DIRECCION,
        NUMDIRECCION AS NUM_DIRECCION
    FROM {{ ref('stg__con_cat_direccion') }}
),

MST_CUENTA_MAYOR AS (
    SELECT
        CLACUENTAMAYOR AS CLA_CUENTA_MAYOR,
        NOMCUENTAMAYORIDIOMA1 AS NOM_CUENTA_MAYOR,
        NUMCUENTAMAYOR AS NUM_CUENTA_MAYOR
    FROM {{ ref('stg__con_cat_cuenta_mayor') }}
),

RAW_CAT_CRC AS (
    SELECT
        CLACRC AS CLA_CRC,
        NOMCRCIDIOMA1 AS NOM_SUBCUENTA,
        NUMCRC AS NUM_SUBCUENTA
    FROM {{ ref('stg__con_cat_crc') }}
),

RAW_CAT_DETALLE AS (
    SELECT
        CLADETALLE AS CLA_DETALLE,
        NOMDETALLEIDIOMA1 AS NOM_DETALLE,
        NUMDETALLE AS NUM_DETALLE
    FROM {{ ref('stg__con_cat_detalle') }}
),

MST_CUENTA_CONTABLE_VW AS (
    SELECT
        RAW_CON_TRA_CUENTA_CONTABLE.ID_CUENTA_CONTABLE,
        RAW_CON_TRA_CUENTA_CONTABLE.IDIOMA,
        MST_DIRECCION.NOM_DIRECCION,
        MST_CUENTA_MAYOR.NOM_CUENTA_MAYOR,
        RAW_CAT_CRC.NOM_SUBCUENTA,
        RAW_CAT_DETALLE.NOM_DETALLE,
        MST_DIRECCION.NUM_DIRECCION,
        MST_CUENTA_MAYOR.NUM_CUENTA_MAYOR,
        RAW_CAT_CRC.NUM_SUBCUENTA,
        RAW_CAT_DETALLE.NUM_DETALLE,
        ES_REPORTE_BALANCE
    FROM RAW_CON_TRA_CUENTA_CONTABLE
    INNER JOIN
	    MST_DIRECCION
	    ON RAW_CON_TRA_CUENTA_CONTABLE.CLA_NIVEL_1 = MST_DIRECCION.CLA_DIRECCION
    LEFT JOIN MST_CUENTA_MAYOR
	    ON RAW_CON_TRA_CUENTA_CONTABLE.CLA_NIVEL_2 = MST_CUENTA_MAYOR.CLA_CUENTA_MAYOR
    LEFT JOIN RAW_CAT_CRC
	    ON RAW_CON_TRA_CUENTA_CONTABLE.CLA_NIVEL_3 = RAW_CAT_CRC.CLA_CRC
    LEFT JOIN RAW_CAT_DETALLE
	    ON RAW_CON_TRA_CUENTA_CONTABLE.CLA_NIVEL_4 = RAW_CAT_DETALLE.CLA_DETALLE
    WHERE RAW_CON_TRA_CUENTA_CONTABLE.NIVEL_CUENTA = 4
)

SELECT * FROM MST_CUENTA_CONTABLE_VW
