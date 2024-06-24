with stg__vta_cat_marca as (
    select
        --{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) } as pk_vta_cat_marca,
        safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
        safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
        safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
        safe_cast(`path` as STRING) as path,
        safe_cast(`clapais` as INT64) as clapais,
        safe_cast(`prefijo` as STRING) as prefijo,
        safe_cast(`clamarca` as INT64) as clamarca,
        safe_cast(`logotipo` as STRING) as logotipo,
        upper(safe_cast(`nommarca` as STRING)) as nommarca,
        safe_cast(`bajalogica` as INT64) as bajalogica,
        safe_cast(`claempresa` as INT64) as claempresa,
        safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
        safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
        safe_cast(`clausuariomod` as INT64) as clausuariomod,
        safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
        safe_cast(`nommarcafiscal` as STRING) as nommarcafiscal,
        safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
        safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
        safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
        safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
        safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
    from {{ source('src_prod_kraken_abt','VtaSch_VtaCatMarca') }}
)

select * from stg__vta_cat_marca
