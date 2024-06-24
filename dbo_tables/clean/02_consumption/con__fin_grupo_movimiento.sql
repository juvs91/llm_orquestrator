{{config(materialized='table')}}
with fin_grupo_movimiento as (
SELECT 
cla_grupo_movimiento,
nom_grupo_movimiento
FROM {{ ref('stg__fin_grupo_movimiento') }}
)
select * from fin_grupo_movimiento