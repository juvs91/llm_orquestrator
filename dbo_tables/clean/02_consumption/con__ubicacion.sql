{{ config(materialized='table') }}

with
raw_cat_ubicacion as (
    select
        claubicacion,
        clatipoubicacion,
        clacliente,
        bajalogica,
        nombreubicacion
    from {{ ref('stg__ti_cat_ubicacion') }}
),

raw_cat_tipo_ubicacion as (
    select
        clatipoubicacion,
        nombretipoubicacion
    from {{ ref('stg__ti_cat_tipo_ubicacion') }}
),

mst_cliente as (
    select
        cla_cliente as clacliente,
        cla_ciudad as claciudad,
        nom_ciudad as nomciudad,
        cla_estado as claestado,
        nom_estado as nomestado,
        cla_pais as clapais,
        nom_pais as nompais
    from {{ ref('con__cliente') }}
)
/*,
referencia a geolocalizaciones
)*/,

raw_rel_unidad_negocio_ubicacion as (
    select
        claubicacion,
        claunidadnegocio
    from {{ ref('stg__rnt_rel_unidad_negocio_ubicacion') }}
),

raw_cat_unidad_negocio as (
    select
        claunidadnegocio,
        nomunidadnegocio
    from {{ ref('stg__rnt_cat_unidad_negocio') }}
),

mst_ubicacion_vw as (
    select
        u.claubicacion as cla_ubicacion,
        u.nombreubicacion as nom_ubicacion,
        u.clatipoubicacion as cla_tipo_ubicacion,
        u.bajalogica as baja_logica,
        tu.nombretipoubicacion as nom_tipo_ubicacion,
        c.claciudad as cla_ciudad,
        c.nomciudad as nom_ciudad,
        c.claestado as cla_estado,
        c.nomestado as nom_estado,
        c.clapais as cla_pais,
        c.nompais as nom_pais,
        --cor.latitud as latitud,
        --cor.longitud as longitud,
       -- cor.coordenadas as coordenadas,
        relu.claunidadnegocio as cla_unidad_negocio,
        un.nomunidadnegocio as nom_unidad_negocio
    from raw_cat_ubicacion as u
    left join
        raw_cat_tipo_ubicacion as tu
        on u.clatipoubicacion = tu.clatipoubicacion
    left join mst_cliente as c on u.clacliente = c.clacliente
    --left join
     --   geolocalizacion_ubicaciones_deacero_dataiku as cor
      --  on u.claubicacion = cor.claubicacion
    left join
        raw_rel_unidad_negocio_ubicacion as relu
        on u.claubicacion = relu.claubicacion
    left join
        raw_cat_unidad_negocio as un
        on relu.claunidadnegocio = un.claunidadnegocio
)

select * from mst_ubicacion_vw
