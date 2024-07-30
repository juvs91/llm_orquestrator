with stg_carcatgpomovcartera as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_carcatgpomovcartera,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`codsn` as BOOL) as codsn,
		safe_cast(`pagosn` as BOOL) as pagosn,
		safe_cast(`fletesn` as BOOL) as fletesn,
		safe_cast(`fechains` as DATETIME) as fechains,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		upper(safe_cast(`descripcion` as STRING)) as descripcion,
		safe_cast(`exclusionsn` as BOOL) as exclusionsn,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`prontopagosn` as BOOL) as prontopagosn,
		safe_cast(`retieneivasn` as BOOL) as retieneivasn,
		safe_cast(`clausuarioins` as INT64) as clausuarioins,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`bonificacionsn` as BOOL) as bonificacionsn,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`clagpomovcartera` as INT64) as clagpomovcartera,
		safe_cast(`cargofinancierosn` as BOOL) as cargofinancierosn,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','dbo_CarCatGpoMovCartera')}}
)
select * from stg_carcatgpomovcartera