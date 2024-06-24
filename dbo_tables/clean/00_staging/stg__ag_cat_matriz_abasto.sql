with stg_agcatmatrizabasto as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_agcatmatrizabasto,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`clapais` as INT64) as clapais,
		safe_cast(`fechains` as DATETIME) as fechains,
		safe_cast(`tonelaje` as INT64) as tonelaje,
		safe_cast(`claciudad` as INT64) as claciudad,
		safe_cast(`claestado` as INT64) as claestado,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`clacliente` as INT64) as clacliente,
		safe_cast(`clafamilia` as INT64) as clafamilia,
		safe_cast(`claarticulo` as INT64) as claarticulo,
		safe_cast(`esbloqueado` as INT64) as esbloqueado,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`preferencia` as INT64) as preferencia,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`claubicacion` as INT64) as claubicacion,
		safe_cast(`clasubfamilia` as INT64) as clasubfamilia,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`operadorlogico` as INT64) as operadorlogico,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`clagrupoestadistico1` as INT64) as clagrupoestadistico1,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','AGSch_AgCatMatrizAbasto')}}
)
select * from stg_agcatmatrizabasto