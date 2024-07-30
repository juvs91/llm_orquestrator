{{ config(materialized='table') }}

WITH RAW_TIPO_GASTO AS (
    SELECT
        C.CLANIV4 AS CLA_TIPO_GASTO,
        D.NUMDETALLE AS NUM_DETALLE,
        MAX(D.NOMDETALLEIDIOMA1) AS NOM_TIPO_GASTO,
        MAX(D.NOMDETALLEIDIOMA2) AS NOM_TIPO_GASTO_EN,
        MAX(R.ESHABILITADO) AS ES_AUTORIZADO
    FROM {{ ref('stg__con_tra_cuenta_contable') }} AS C
    INNER JOIN
        {{ ref('stg__con_cat_detalle') }} AS D
        ON C.CLANIVEL4 = D.CLADETALLE
    INNER JOIN
        {{ ref('stg__con_rel_cta_contable_empresa') }} AS R
        ON
            C.IDCUENTACONTABLE = R.IDCUENTACONTABLE
            AND R.CLATIPOCUENTACONTABLE = 1
    WHERE
        C.NIVELCUENTA = 4
        AND C.CLANIV2 IN (5105, 5110, 5115, 5111)
        AND COALESCE(D.BAJALOGICA, 0) != 1
    GROUP BY C.CLANIV4, D.NUMDETALLE
),

RAW_REL_BLOQUE_TIPO_GASTO AS (
    SELECT
        R.CLATIPOGASTO AS CLA_TIPO_GASTO,
        S.CLABLOQUE AS CLA_BLOQUE,
        S.CLASUBBLOQUE AS CLA_SUBBLOQUE,
        B.NOMBLOQUE AS NOM_BLOQUE,
        B.NOMBLOQUEIDIOMA2 AS NOM_BLOQUE_EN,
        S.NOMSUBBLOQUE AS NOM_SUBBLOQUE,
        S.NOMSUBBLOQUEIDIOMA2 AS NOM_SUBBLOQUE_EN
    FROM
        {{ ref('stg__cnt_rel_tipo_gasto_sub_bloque') }}
            AS R
    LEFT JOIN
        {{ ref('stg__cnt_cat_sub_bloque') }} AS S
        ON R.CLASUBBLOQUE = S.CLASUBBLOQUE
    LEFT JOIN
        {{ ref('stg__cnt_cat_bloque') }} AS B
        ON S.CLABLOQUE = B.CLABLOQUE
),

MST_TIPO_GASTO_VW AS (
    SELECT
        A.CLA_TIPO_GASTO,
        A.NOM_TIPO_GASTO,
        A.NOM_TIPO_GASTO_EN,
        A.NUM_DETALLE,
        A.ES_AUTORIZADO,
        B.CLA_BLOQUE,
        B.NOM_BLOQUE,
        B.NOM_BLOQUE_EN,
        B.CLA_SUBBLOQUE,
        B.NOM_SUBBLOQUE,
        B.NOM_SUBBLOQUE_EN
    FROM RAW_TIPO_GASTO AS A
    LEFT JOIN
        RAW_REL_BLOQUE_TIPO_GASTO AS B
        ON A.CLA_TIPO_GASTO = B.CLA_TIPO_GASTO
)

SELECT * FROM MST_TIPO_GASTO_VW
