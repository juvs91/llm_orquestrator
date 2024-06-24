with stg_mtocatfrecuencia as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_mtocatfrecuencia,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`factordg` as FLOAT64) as factordg,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`diasgracia` as INT64) as diasgracia,
		safe_cast(`mesdefault` as INT64) as mesdefault,
		safe_cast(`diasdefault` as INT64) as diasdefault,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`claubicacion` as INT64) as claubicacion,
		safe_cast(`equivaledias` as INT64) as equivaledias,
		safe_cast(`clafrecuencia` as INT64) as clafrecuencia,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`nomfrecuencia` as STRING) as nomfrecuencia,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','MtoSch_MtoCatFrecuencia')}}
)
select * from stg_mtocatfrecuencia