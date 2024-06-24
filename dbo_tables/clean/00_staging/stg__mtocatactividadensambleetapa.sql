with stg_mtocatactividadensambleetapa as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_mtocatactividadensambleetapa,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`orden` as INT64) as orden,
		safe_cast(`bajalogica` as BOOL) as bajalogica,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`claubicacion` as INT64) as claubicacion,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`esdocumentada` as INT64) as esdocumentada,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`esdefinicionalcance` as BOOL) as esdefinicionalcance,
		safe_cast(`claactividadensamble` as INT64) as claactividadensamble,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no,
		safe_cast(`claactividadensambleetapa` as INT64) as claactividadensambleetapa,
		safe_cast(`nomactividadensambleetapa` as STRING) as nomactividadensambleetapa,
		safe_cast(`claveactividadensambleetapa` as STRING) as claveactividadensambleetapa
	from {{source('src_prod_kraken_abt','MtoSch_MtoCatActividadEnsambleEtapa')}}
)
select * from stg_mtocatactividadensambleetapa