with stg_vtacatbancodeposito as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_vtacatbancodeposito,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`clamarca` as INT64) as clamarca,
		safe_cast(`clamoneda` as INT64) as clamoneda,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`clabancoansa` as INT64) as clabancoansa,
		safe_cast(`bancodeposito` as STRING) as bancodeposito,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`clabancodeposito` as INT64) as clabancodeposito,
		safe_cast(`digitoverificador` as INT64) as digitoverificador,
		safe_cast(`fechaultimocambio` as DATETIME) as fechaultimocambio,
		safe_cast(`numcuentabancaria` as STRING) as numcuentabancaria,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','VtaSch_VtaCatBancoDeposito')}}
)
select * from stg_vtacatbancodeposito