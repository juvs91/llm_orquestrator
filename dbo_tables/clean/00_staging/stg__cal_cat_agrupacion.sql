with stg_calcatagrupacion as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_calcatagrupacion,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`claagrupacion` as INT64) as claagrupacion,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`esreportepeso` as INT64) as esreportepeso,
		safe_cast(`nomagrupacion` as STRING) as nomagrupacion,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`clatipoagrupacionnivel1` as INT64) as clatipoagrupacionnivel1,
		safe_cast(`clatipoagrupacionnivel2` as INT64) as clatipoagrupacionnivel2,
		safe_cast(`clatipoagrupacionnivel3` as INT64) as clatipoagrupacionnivel3,
		safe_cast(`clatipoagrupacionnivel4` as INT64) as clatipoagrupacionnivel4,
		safe_cast(`clatipoagrupacionnivel5` as INT64) as clatipoagrupacionnivel5,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','CalSch_CalCatAgrupacion')}}
)
select * from stg_calcatagrupacion