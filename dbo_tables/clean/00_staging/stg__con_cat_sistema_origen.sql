with stg_concatsistemaorigen as (
    select
        
        safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
        safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
        safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
        safe_cast(`bajalogica` as INT64) as bajalogica,
        safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
        safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
        safe_cast(`clausuariomod` as INT64) as clausuariomod,
        safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
        safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
        safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
        safe_cast(`clasistemaorigen` as INT64) as clasistemaorigen,
        upper(safe_cast(`nomsistemaorigen` as STRING)) as nomsistemaorigen,
        safe_cast(`noesreplicalegacy` as INT64) as noesreplicalegacy,
        safe_cast(`nomsistemaorigen2` as STRING) as nomsistemaorigen2,
        safe_cast(`nomsistemaorigen3` as STRING) as nomsistemaorigen3,
        safe_cast(`nomsistemaorigen4` as STRING) as nomsistemaorigen4,
        safe_cast(`nomsistemaorigen5` as STRING) as nomsistemaorigen5,
        safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
        safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
        safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no,
        safe_cast(`esporconfirmarresponsable` as INT64) as esporconfirmarresponsable,
        safe_cast(`clatrabajadoreunresponsable` as INT64)
		    as clatrabajadoreunresponsable
    from {{ source('src_prod_kraken_abt','dbo_ConCatSistemaOrigen') }}
)

select * from stg_concatsistemaorigen
