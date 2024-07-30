with stg_palcatareaege as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_palcatareaege,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`clacrc` as INT64) as clacrc,
		safe_cast(`claarea` as INT64) as claarea,
		safe_cast(`espncarea` as INT64) as espncarea,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`claarticulo` as INT64) as claarticulo,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`claubicacion` as INT64) as claubicacion,
		safe_cast(`escapturaege` as INT64) as escapturaege,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`mineficiencia` as FLOAT64) as mineficiencia,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`clausuarioresponsable` as INT64) as clausuarioresponsable,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','PALSch_PalCatAreaEGE')}}
)
select * from stg_palcatareaege