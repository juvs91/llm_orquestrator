with stg_mtocatarea as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_mtocatarea,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`orden` as INT64) as orden,
		safe_cast(`claarea` as INT64) as claarea,
		safe_cast(`nomarea` as STRING) as nomarea,
		safe_cast(`setpoint` as INT64) as setpoint,
		safe_cast(`clanomina` as INT64) as clanomina,
		safe_cast(`clavearea` as STRING) as clavearea,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`esensamble` as INT64) as esensamble,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`claubicacion` as INT64) as claubicacion,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`claresponsable` as INT64) as claresponsable,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`cladepartamento` as INT64) as cladepartamento,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`mailresponsable` as STRING) as mailresponsable,
		safe_cast(`activosestimados` as INT64) as activosestimados,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','MtoSch_MtoCatArea')}}
)
select * from stg_mtocatarea