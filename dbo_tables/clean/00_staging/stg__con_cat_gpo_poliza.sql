with stg_concatgpopoliza as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_concatgpopoliza,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`cladireccion` as INT64) as cladireccion,
		safe_cast(`clagpopoliza` as INT64) as clagpopoliza,
		upper(safe_cast(`nomgpopoliza` as STRING)) as nomgpopoliza,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`nomgpopoliza2` as STRING) as nomgpopoliza2,
		safe_cast(`nomgpopoliza3` as STRING) as nomgpopoliza3,
		safe_cast(`nomgpopoliza4` as STRING) as nomgpopoliza4,
		safe_cast(`nomgpopoliza5` as STRING) as nomgpopoliza5,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`clabeneficiario` as INT64) as clabeneficiario,
		safe_cast(`escontrapartida` as INT64) as escontrapartida,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no,
		safe_cast(`clagpopolizacontrapartida` as INT64) as clagpopolizacontrapartida,
		safe_cast(`esporconfirmarresponsable` as INT64) as esporconfirmarresponsable,
		safe_cast(`clatrabajadoreunresponsable` as INT64) as clatrabajadoreunresponsable
	from {{source('src_prod_kraken_abt','dbo_ConCatGpoPoliza')}}
)
select * from stg_concatgpopoliza