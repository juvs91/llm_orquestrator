{{ config(materialized='table') }}

WITH rel_elem_costo_tipo_gasto AS (
    SELECT
        relectg.claunidadnegocio AS cla_unidad_negocio,
        relectg.claelementocosto AS cla_elemento_costo,
        ec.nombreelementocosto AS nom_elemento_costo,
        relectg.clatipogasto AS cla_tipo_gasto
    FROM
        {{ ref('stg__cts_rel_elemento_costo_tipo_gasto') }}
            AS relectg
    INNER JOIN
        {{ ref('stg__cts_cat_elemento_costo') }} AS ec
        ON relectg.claelementocosto = ec.claelementocosto
)

SELECT *
FROM rel_elem_costo_tipo_gasto
