{{ config(materialized='table') }}

WITH trabajador_cte AS (
    SELECT
        t.clatrabajadoreun AS cla_trabajador,
        t.nomtrabajador AS nom_trabajador,
        u.nomusuario AS nom_usuario
    FROM {{ ref('int__dcp_nom_cat_trabajador') }} AS t
    INNER JOIN {{ ref('int__dcp_ti_tra_usuario') }} AS u
        ON t.clatrabajadoreun = u.claempleado
),

coalesce_cte AS (
    SELECT
        cla_trabajador,
        coalesce(nom_trabajador, nom_usuario) AS nom_trabajador
    FROM trabajador_cte
),

mst_trabajador AS (
    select *
    from coalesce_cte
    where nom_trabajador is not null
)

SELECT * FROM mst_trabajador


