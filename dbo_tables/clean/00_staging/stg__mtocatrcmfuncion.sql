with stg_mtocatrcmfuncion as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_mtocatrcmfuncion,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`claequipo` as INT64) as claequipo,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`clasistema` as INT64) as clasistema,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`claubicacion` as INT64) as claubicacion,
		safe_cast(`clarcmfuncion` as INT64) as clarcmfuncion,
		safe_cast(`clasubsistema` as INT64) as clasubsistema,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`nomrcmfuncion` as STRING) as nomrcmfuncion,
		safe_cast(`clatipofuncion` as INT64) as clatipofuncion,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`clavercmfuncion` as INT64) as clavercmfuncion,
		safe_cast(`escopiagenerico` as INT64) as escopiagenerico,
		safe_cast(`esgenericopadre` as INT64) as esgenericopadre,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`clarcmfuncionpadre` as INT64) as clarcmfuncionpadre,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','MtoSch_MtoCatRcmFuncion')}}
)
select * from stg_mtocatrcmfuncion