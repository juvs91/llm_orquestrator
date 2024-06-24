{{ config(materialized='table') }}
WITH RAW_MOV_CARTERA AS (
    SELECT
        CLAMOVCARTERA,
        CLAGPOMOVCARTERA,
        TIPOMOV,
        DESCRIPCION,
        DESCRIPCIONINGLES,
        DESCCORTA,
        DESCCORTAINGLES,
        LETREROREF1,
        LETREROREF2,
        LETREROREF3,
        LETREROREF4,
        LETREROREF5,
        ESAPLICACARGOVENTAS,
        ESAPLICACREDITOVENTAS,
        ESAPLICACARGOCARTERA,
        ESAPLICACREDITOCARTERA,
        ESAPLICACARGOCOSTOINTEGRAL,
        ESAPLICACREDITOCOSTOINTEGRAL,
        ESAPLICACARGOOTROSINGRESOS,
        ESAPLICACREDITOOTROSINGRESOS,
        FECHAULTIMAMOD,
        NOMBREPCMOD,
        CLAUSUARIOMOD,
        BAJALOGICA,
        FECHABAJALOGICA
    FROM {{ ref('stg__car_cat_mov_cartera') }}
),

RAW_GPO_MOV_CARTERA AS (
    SELECT
        CLAGPOMOVCARTERA,
        DESCRIPCION,
        PAGOSN,
        BONIFICACIONSN,
        PRONTOPAGOSN,
        CODSN,
        FLETESN,
        CARGOFINANCIEROSN,
        EXCLUSIONSN,
        RETIENEIVASN
    FROM {{ ref('stg__car_cat_gpo_mov_cartera') }}
),

RAW_ENFOQUE_MOV AS (
    SELECT
        CLAMOVCARTERA,
        CLAENFOQUE
    FROM {{ ref('stg__car_cat_enfoque_mov') }}
),

MOV_CARTERA AS (
    SELECT
        T.CLAMOVCARTERA AS CLA_MOV_CARTERA,
        T.CLAGPOMOVCARTERA AS CLA_GPO_MOV_CARTERA,
        G.DESCRIPCION AS NOM_GPO_MOV_CARTERA,
        G.PAGOSN AS PAGO_SN,
        G.BONIFICACIONSN AS BONIFICACION_SN,
        G.PRONTOPAGOSN AS PRONTO_PAGO_SN,
        G.CODSN AS COD_SN,
        G.FLETESN AS FLETE_SN,
        G.CARGOFINANCIEROSN AS CARGO_FINANCIERO_SN,
        G.EXCLUSIONSN AS EXCLUSION_SN,
        G.RETIENEIVASN AS RETIENE_IVA_SN,
        T.TIPOMOV AS CLA_TIPO_MOV,
        T.DESCRIPCION,
        T.DESCRIPCIONINGLES AS DESCRIPCION_INGLES,
        T.DESCCORTA AS DESC_CORTA,
        T.DESCCORTAINGLES AS DESC_CORTA_INGLES,
        T.LETREROREF1 AS LETRERO_REF1,
        T.LETREROREF2 AS LETRERO_REF2,
        T.LETREROREF3 AS LETRERO_REF3,
        T.LETREROREF4 AS LETRERO_REF4,
        T.LETREROREF5 AS LETRERO_REF5,
        T.ESAPLICACARGOVENTAS AS ES_APLICA_CARGO_VENTAS,
        T.ESAPLICACREDITOVENTAS AS ES_APLICA_CREDITO_VENTAS,
        T.ESAPLICACARGOCARTERA AS ES_APLICA_CARGO_CARTERA,
        T.ESAPLICACREDITOCARTERA AS ES_APLICA_CREDITO_CARTERA,
        T.ESAPLICACARGOCOSTOINTEGRAL AS ES_APLICA_CARGO_COSTO_INTEGRAL,
        T.ESAPLICACREDITOCOSTOINTEGRAL AS ES_APLICA_CREDITO_COSTO_INTEGRAL,
        T.ESAPLICACARGOOTROSINGRESOS AS ES_APLICA_CARGO_OTROS_INGRESOS,
        T.ESAPLICACREDITOOTROSINGRESOS AS ES_APLICA_CREDITO_OTROS_INGRESOS,
        T.FECHAULTIMAMOD AS FECHA_ULTIMA_MOD,
        T.NOMBREPCMOD AS NOMBRE_PC_MOD,
        T.CLAUSUARIOMOD AS CLA_USUARIO_MOD,
        T.BAJALOGICA AS BAJA_LOGICA,
        T.FECHABAJALOGICA AS FECHA_BAJA_LOGICA,
        CASE
            WHEN T.TIPOMOV = 1 THEN 'CARGO'
            WHEN T.TIPOMOV = 2 THEN 'CREDITO'
            WHEN T.TIPOMOV = 3 THEN 'ANTICIPO'
            ELSE 'POR DEFINIR'
        END AS NOM_TIPO_MOV,
        CASE
            WHEN EMB.CLAMOVCARTERA IS NULL
                THEN 0
            ELSE 1
        END AS ES_FACTURA_EMBARQUE
    FROM RAW_MOV_CARTERA AS T
    INNER JOIN
        RAW_GPO_MOV_CARTERA AS G
        ON T.CLAGPOMOVCARTERA = G.CLAGPOMOVCARTERA
    LEFT JOIN RAW_ENFOQUE_MOV AS EMB
        ON EMB.CLAENFOQUE = 56 AND T.CLAMOVCARTERA = EMB.CLAMOVCARTERA
)

SELECT * FROM MOV_CARTERA
