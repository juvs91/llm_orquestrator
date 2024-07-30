{{ config(materialized='table') }}

with mst_tipo_poliza_vw as (
    select
        clatipopoliza as CLA_TIPO_POLIZA,
        nomtipopoliza as NOM_TIPO_POLIZA
    from {{ ref('stg__con_cat_tipo_poliza') }}
)

select * from mst_tipo_poliza_vw
