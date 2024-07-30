with stg_calcatindicador as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_calcatindicador,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`formula` as STRING) as formula,
		safe_cast(`esglobal` as INT64) as esglobal,
		safe_cast(`espublico` as INT64) as espublico,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`vistaorigen` as STRING) as vistaorigen,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`claindicador` as INT64) as claindicador,
		safe_cast(`nomindicador` as STRING) as nomindicador,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`indicadordesc` as STRING) as indicadordesc,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`clagrupoindicador` as INT64) as clagrupoindicador,
		safe_cast(`claunidadindicador` as INT64) as claunidadindicador,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`clatipocalculoindicador` as INT64) as clatipocalculoindicador,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no,
		safe_cast(`clagrupoindicadorreporte` as INT64) as clagrupoindicadorreporte,
		safe_cast(`clatipoprogramarecalculo` as INT64) as clatipoprogramarecalculo
	from {{source('src_prod_kraken_abt','CalSch_CalCatIndicador')}}
)
select * from stg_calcatindicador