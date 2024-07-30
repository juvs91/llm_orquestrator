{{config(materialized='table')}}
with fin_rel_grupo_movimiento as (
SELECT 
cla_grupo_movimiento,
cla_mov_cartera
FROM {{ ref('stg__fin_rel_grupo_movimiento') }}
)
select * from fin_rel_grupo_movimiento