with stg_ctsartcatarticuloacerias as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_ctsartcatarticuloacerias,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`clagrado` as INT64) as clagrado,
		safe_cast(`clacalibre` as INT64) as clacalibre,
		safe_cast(`clafamilia` as INT64) as clafamilia,
		safe_cast(`claarticulo` as INT64) as claarticulo,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`claagrupador` as INT64) as claagrupador,
		safe_cast(`claubicacion` as INT64) as claubicacion,
		safe_cast(`claagrupador2` as INT64) as claagrupador2,
		safe_cast(`clasubfamilia` as INT64) as clasubfamilia,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`claaniomesventa` as INT64) as claaniomesventa,
		safe_cast(`clacalibregrado` as INT64) as clacalibregrado,
		safe_cast(`clagradocalibre` as INT64) as clagradocalibre,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`claarticuloasociado` as INT64) as claarticuloasociado,
		safe_cast(`claarticulooriginal` as INT64) as claarticulooriginal,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','CTSSch_CtsArtCatArticuloAcerias')}}
)
select * from stg_ctsartcatarticuloacerias