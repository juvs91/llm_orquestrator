with stg_fin_grupo_movimiento as (
SELECT 
safe_cast(cla_grupo_movimiento as INT64) AS cla_grupo_movimiento,
UPPER(safe_cast(nom_grupo_movimiento as string)) AS nom_grupo_movimiento
FROM {{ ref('fin_grupo_movimiento') }}
)
select * from stg_fin_grupo_movimiento