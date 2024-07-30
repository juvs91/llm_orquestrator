with stg__cnt_rel_tipo_gasto_sub_bloque as (
    select
        --{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) } as pk_cnt_rel_tipo_gasto_sub_bloque,
        safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
        safe_cast(`_airbyte_extracted_at` as TIMESTAMP)
            as _airbyte_extracted_at,
        safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
        safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
        safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
        safe_cast(`clasubbloque` as INT64) as clasubbloque,
        safe_cast(`clatipogasto` as INT64) as clatipogasto,
        safe_cast(`clausuariomod` as INT64) as clausuariomod,
        safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
        safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
        safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
        safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
        safe_cast(`_ab_cdc_event_serial_no` as STRING)
            as _ab_cdc_event_serial_no
    from {{ source('src_prod_kraken_abt','CntSch_CntRelTipoGastoSubBloque') }}
)

select * from stg__cnt_rel_tipo_gasto_sub_bloque
