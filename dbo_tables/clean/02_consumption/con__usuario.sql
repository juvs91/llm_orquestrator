{{ config(materialized='table') }}

WITH cte_con_usuario_vw AS (
    SELECT
        idusuario as CLA_USUARIO,
        email as EMAIL,
        dominio as DOMINIO,
        nomusuario as NOM_USUARIO
    FROM {{ ref('int__dcp_ti_tra_usuario') }}
)

SELECT * FROM cte_con_usuario_vw