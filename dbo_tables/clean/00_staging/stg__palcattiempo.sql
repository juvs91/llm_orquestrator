with stg_palcattiempo as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_palcattiempo,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`fecha` as DATETIME) as fecha,
		safe_cast(`claanio` as INT64) as claanio,
		safe_cast(`nomanio` as STRING) as nomanio,
		safe_cast(`clafecha` as INT64) as clafecha,
		safe_cast(`clasemana` as INT64) as clasemana,
		safe_cast(`numsemana` as STRING) as numsemana,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`claaniomes` as INT64) as claaniomes,
		safe_cast(`fechalunes` as DATETIME) as fechalunes,
		safe_cast(`nomaniomes` as STRING) as nomaniomes,
		safe_cast(`clabimestre` as FLOAT64) as clabimestre,
		safe_cast(`clasemestre` as INT64) as clasemestre,
		safe_cast(`nombimestre` as STRING) as nombimestre,
		safe_cast(`nomsemestre` as STRING) as nomsemestre,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`clatrimestre` as INT64) as clatrimestre,
		safe_cast(`nomtrimestre` as STRING) as nomtrimestre,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','PALSch_PalCatTiempo')}}
)
select * from stg_palcattiempo