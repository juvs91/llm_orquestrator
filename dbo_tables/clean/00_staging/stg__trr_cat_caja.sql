with stg_trrcatcaja as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_trrcatcaja,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`clacaja` as INT64) as clacaja,
		safe_cast(`claestado` as INT64) as claestado,
		safe_cast(`clamedida` as INT64) as clamedida,
		safe_cast(`clavecaja` as STRING) as clavecaja,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`clacliente` as INT64) as clacliente,
		safe_cast(`esespecial` as INT64) as esespecial,
		safe_cast(`clarodillo1` as INT64) as clarodillo1,
		safe_cast(`clarodillo2` as INT64) as clarodillo2,
		safe_cast(`clarodillo3` as INT64) as clarodillo3,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`fechadesecho` as DATETIME) as fechadesecho,
		safe_cast(`fechaingreso` as DATETIME) as fechaingreso,
		safe_cast(`obserdesecho` as STRING) as obserdesecho,
		safe_cast(`clafabricante` as INT64) as clafabricante,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`clamedidadestino` as INT64) as clamedidadestino,
		safe_cast(`clamotivodesecho` as INT64) as clamotivodesecho,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','dbo_TrrCatCaja')}}
)
select * from stg_trrcatcaja