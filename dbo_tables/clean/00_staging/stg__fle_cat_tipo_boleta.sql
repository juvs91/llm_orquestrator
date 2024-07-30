with stg_flecattipoboleta as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_flecattipoboleta,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`loginsp` as INT64) as loginsp,
		safe_cast(`nombresp` as STRING) as nombresp,
		safe_cast(`systemid` as INT64) as systemid,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`claubicacion` as INT64) as claubicacion,
		safe_cast(`clatipoboleta` as INT64) as clatipoboleta,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`nomtipoboleta` as STRING) as nomtipoboleta,
		safe_cast(`esconfigurarsp` as INT64) as esconfigurarsp,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no,
		safe_cast(`escondiscrepanciadefault` as INT64) as escondiscrepanciadefault
	from {{source('src_prod_kraken_abt','FleSch_FLECatTipoBoleta')}}
)
select * from stg_flecattipoboleta