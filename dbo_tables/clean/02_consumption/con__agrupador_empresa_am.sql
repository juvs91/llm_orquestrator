{{config(materialized='table')}}
WITH
MST_AGRUPADOR_EMPRESA_VW
AS
(
    SELECT
            CLAANIOMES AS CLA_ANIO_MES,
            CLAAGRUPADOREMPRESA AS CLA_AGRUPADOR_EMPRESA,
            NOMAGRUPADOREMPRESA AS NOM_AGRUPADOR_EMPRESA--,
            --{{dbt_utils.generate_surrogate_key(['CLAANIOMES','CLAAGRUPADOREMPRESA'])}} as pk_periodo_agrupador
    FROM {{ref('int__dcp_cnt_cat_agrupadores_empresa')}}
)

SELECT * FROM MST_AGRUPADOR_EMPRESA_VW