with stg_concatestatuspoliza as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_concatestatuspoliza,
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
		safe_cast(`claestatuspoliza` as INT64) as claestatuspoliza,
		upper(safe_cast(`nomestatuspoliza` as STRING)) as nomestatuspoliza,
		safe_cast(`nomestatuspoliza2` as STRING) as nomestatuspoliza2,
		safe_cast(`nomestatuspoliza3` as STRING) as nomestatuspoliza3,
		safe_cast(`nomestatuspoliza4` as STRING) as nomestatuspoliza4,
		safe_cast(`nomestatuspoliza5` as STRING) as nomestatuspoliza5,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','ConSch_ConCatEstatusPoliza')}}
)
select * from stg_concatestatuspoliza