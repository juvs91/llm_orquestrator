with stg_fin_rel_grupo_movimiento as (
SELECT 
safe_cast(cla_grupo_movimiento as INT64) as cla_grupo_movimiento,
safe_cast(cla_mov_cartera as INT64) as cla_mov_cartera
FROM {{ ref('fin_rel_grupo_movimiento') }}

)
select * from stg_fin_rel_grupo_movimiento