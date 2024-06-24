{{ config(materialized='table') }}

WITH MST_REL_AGRUPADOR_EMPRESA_VW AS (
    SELECT
        claaniomes AS CLA_ANIO_MES,
        claagrupadorempresa AS CLA_AGRUPADOR_EMPRESA,
        claempresa AS CLA_EMPRESA
    FROM {{ ref('stg__cnt_rel_agrupadores_empresas') }}
)

SELECT * FROM MST_REL_AGRUPADOR_EMPRESA_VW
