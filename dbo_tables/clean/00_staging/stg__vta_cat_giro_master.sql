with stg_vtacatgiromaster as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_vtacatgiromaster,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`clagiromaster` as INT64) as clagiromaster,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		upper(safe_cast(`nomgiromaster` as STRING)) as nomgiromaster,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`nomgiromastering` as STRING) as nomgiromastering,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','VtaSch_VtaCatGiroMaster')}}
)
select * from stg_vtacatgiromaster