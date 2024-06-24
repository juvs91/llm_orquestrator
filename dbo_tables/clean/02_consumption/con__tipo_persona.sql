{{ config(materialized='table') }}

with mst_tipo_persona_vw as (
    select
        clatipopersona as CLA_TIPO_PERSONA,
        nomtipopersona as NOM_TIPO_PERSONA,
        nomtipopersonaen as NOM_TIPO_PERSONA_EN
    from {{ ref('stg__fis_cat_tipo_persona') }}
)

select * from mst_tipo_persona_vw