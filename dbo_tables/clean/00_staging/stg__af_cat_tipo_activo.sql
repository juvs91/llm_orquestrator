with stg_afcattipoactivo as (
    select

        safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
        safe_cast(`_airbyte_extracted_at` as TIMESTAMP)
            as _airbyte_extracted_at,
        safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
        safe_cast(`bajalogica` as INT64) as bajalogica,
        safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
        safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
        safe_cast(`clatipogasto` as INT64) as clatipogasto,
        safe_cast(`porcvalorres` as INT64) as porcvalorres,
        safe_cast(`clatipoactivo` as INT64) as clatipoactivo,
        safe_cast(`clausuariomod` as INT64) as clausuariomod,
        upper(safe_cast(`nomtipoactivo` as STRING)) as nomtipoactivo,
        safe_cast(`numtipoactivo` as STRING) as numtipoactivo,
        safe_cast(`usaetiquetasn` as INT64) as usaetiquetasn,
        safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
        safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
        safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
        safe_cast(`clagrupoasignacion` as INT64) as clagrupoasignacion,
        safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
        safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
        safe_cast(`aniosvidautilfiscal` as INT64) as aniosvidautilfiscal,
        safe_cast(`_ab_cdc_event_serial_no` as STRING)
            as _ab_cdc_event_serial_no
    from {{ source('src_prod_kraken_abt','AFSch_AfCatTipoActivo') }}
)

select * from stg_afcattipoactivo
