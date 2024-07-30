with stg__con_rel_cta_contable_empresa as (
    select
        --{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) } as pk_con_rel_cta_contable_empresa,
        safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
        safe_cast(`_airbyte_extracted_at` as TIMESTAMP)
            as _airbyte_extracted_at,
        safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
        safe_cast(`clamoneda` as INT64) as clamoneda,
        safe_cast(`bajalogica` as INT64) as bajalogica,
        safe_cast(`claempresa` as INT64) as claempresa,
        safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
        safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
        safe_cast(`eshabilitado` as INT64) as eshabilitado,
        safe_cast(`clausuariomod` as INT64) as clausuariomod,
        safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
        safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
        safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
        safe_cast(`idcuentacontable` as INT64) as idcuentacontable,
        safe_cast(`estienemovimientos` as INT64) as estienemovimientos,
        safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
        safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
        safe_cast(`clatipocuentacontable` as INT64) as clatipocuentacontable,
        safe_cast(`_ab_cdc_event_serial_no` as STRING)
            as _ab_cdc_event_serial_no
    from {{ source('src_prod_kraken_abt','ConSch_ConRelCtaContableEmpresa') }}
)

select * from stg__con_rel_cta_contable_empresa
