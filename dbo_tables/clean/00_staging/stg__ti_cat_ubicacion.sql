with stg_ticatubicacion as (
    select
    	--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_ticatubicacion,
        safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
        safe_cast(`_airbyte_extracted_at` as TIMESTAMP)
            as _airbyte_extracted_at,
        safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
        safe_cast(`fax` as STRING) as fax,
        safe_cast(`clapais` as INT64) as clapais,
        safe_cast(`colonia` as STRING) as colonia,
        safe_cast(`fechains` as DATETIME) as fechains,
        safe_cast(`claestado` as INT64) as claestado,
        safe_cast(`direccion` as STRING) as direccion,
        safe_cast(`poblacion` as STRING) as poblacion,
        safe_cast(`telefonos` as STRING) as telefonos,
        safe_cast(`bajalogica` as INT64) as bajalogica,
        safe_cast(`clacliente` as INT64) as clacliente,
        safe_cast(`claempresa` as INT64) as claempresa,
        safe_cast(`nombrecorto` as STRING) as nombrecorto,
        safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
        safe_cast(`claubicacion` as INT64) as claubicacion,
        safe_cast(`codigopostal` as STRING) as codigopostal,
        safe_cast(`claciudadbase` as INT64) as claciudadbase,
        safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
        safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
        safe_cast(`empresafacturar` as STRING) as empresafacturar,
        safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
        upper(safe_cast(`nombreubicacion` as STRING)) as nombreubicacion,
        safe_cast(`clatipoubicacion` as INT64) as clatipoubicacion,
        safe_cast(`pcttoleranciaemb` as FLOAT64) as pcttoleranciaemb,
        safe_cast(`claubicacionventas` as INT64) as claubicacionventas,
        safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
        safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
        safe_cast(`aplicafactorcubicaje` as INT64) as aplicafactorcubicaje,
        safe_cast(`clatipoubicacionventas` as INT64) as clatipoubicacionventas,
        safe_cast(`_ab_cdc_event_serial_no` as STRING)
            as _ab_cdc_event_serial_no
    from {{ source('src_prod_kraken_abt','dbo_TiCatUbicacion') }}
)

select * from stg_ticatubicacion
