with stg_agcattecnologiaexclusivatotal as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_agcattecnologiaexclusivatotal,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`multiplo` as INT64) as multiplo,
		safe_cast(`prioridad` as INT64) as prioridad,
		safe_cast(`clafamilia` as INT64) as clafamilia,
		safe_cast(`claproducto` as INT64) as claproducto,
		safe_cast(`minimopedir` as INT64) as minimopedir,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`diastransito` as INT64) as diastransito,
		safe_cast(`claubicacion` as INT64) as claubicacion,
		safe_cast(`clasubfamilia` as INT64) as clasubfamilia,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`clagpotransporte` as INT64) as clagpotransporte,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`claubicacionelabora` as INT64) as claubicacionelabora,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','dbo_AgCatTecnologiaExclusivaTotal')}}
)
select * from stg_agcattecnologiaexclusivatotal