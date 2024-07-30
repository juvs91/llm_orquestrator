with stg_concattipopoliza as (
    select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_concattipopoliza,
        safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
        safe_cast(`_airbyte_extracted_at` as TIMESTAMP)
            as _airbyte_extracted_at,
        safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
        safe_cast(`bajalogica` as INT64) as bajalogica,
        safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
        safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
        safe_cast(`clatipopoliza` as INT64) as clatipopoliza,
        safe_cast(`clausuariomod` as INT64) as clausuariomod,
        upper(safe_cast(`nomtipopoliza` as STRING)) as nomtipopoliza,
        safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
        safe_cast(`nomtipopoliza2` as STRING) as nomtipopoliza2,
        safe_cast(`nomtipopoliza3` as STRING) as nomtipopoliza3,
        safe_cast(`nomtipopoliza4` as STRING) as nomtipopoliza4,
        safe_cast(`nomtipopoliza5` as STRING) as nomtipopoliza5,
        safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
        safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
        safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
        safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
        safe_cast(`_ab_cdc_event_serial_no` as STRING)
            as _ab_cdc_event_serial_no
    from {{ source('src_prod_kraken_abt','dbo_ConCatTipoPoliza') }}
)

select * from stg_concattipopoliza
