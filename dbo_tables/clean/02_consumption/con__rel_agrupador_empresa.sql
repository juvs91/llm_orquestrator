{{ config(materialized='table') }}

WITH MST_REL_AGRUPADOR_EMPRESA_VW AS (
    SELECT
        claagrupadorempresa AS CLA_AGRUPADOR_EMPRESA,
        claempresa AS CLA_EMPRESA
    FROM {{ ref('stg__cnt_rel_agrupador_empresas') }}
)

SELECT * FROM MST_REL_AGRUPADOR_EMPRESA_VW
