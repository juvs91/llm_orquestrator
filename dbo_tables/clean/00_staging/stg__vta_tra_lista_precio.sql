with stg__vta_tra_lista_precio as (
    select
        --{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) } as pk_vta_tra_lista_precio,
        safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
        safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
        safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
        safe_cast(`clamarca` as INT64) as clamarca,
        safe_cast(`clamoneda` as INT64) as clamoneda,
        safe_cast(`bajalogica` as INT64) as bajalogica,
        safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
        safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
        safe_cast(`cladireccion` as INT64) as cladireccion,
        safe_cast(`clausuariomod` as INT64) as clausuariomod,
        safe_cast(`fechacreacion` as DATETIME) as fechacreacion,
        safe_cast(`idlistaprecio` as INT64) as idlistaprecio,
        safe_cast(`observaciones` as STRING) as observaciones,
        safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
        safe_cast(`fechaultimouso` as DATETIME) as fechaultimouso,
        upper(safe_cast(`nomlistaprecio` as STRING)) as nomlistaprecio,
        safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
        safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
        safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
        safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
        safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
    from {{ source('src_prod_kraken_abt','VtaSch_VtaTraListaPrecio') }}
)

select * from stg__vta_tra_lista_precio
