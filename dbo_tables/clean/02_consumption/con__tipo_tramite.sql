{{ config(materialized='table') }}

with mst_tipo_tramite_vw as (
    select
        clatipotramite as CLA_TIPO_TRAMITE,
        nomtipotramite as NOM_TIPO_TRAMITE
    from {{ ref('stg__con_cat_tipo_tramite') }}
)

select * from mst_tipo_tramite_vw
