with stg_mtocatensamble as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_mtocatensamble,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`noserie` as STRING) as noserie,
		safe_cast(`claequipo` as INT64) as claequipo,
		safe_cast(`bajalogica` as BOOL) as bajalogica,
		safe_cast(`esgenerico` as BOOL) as esgenerico,
		safe_cast(`claensamble` as INT64) as claensamble,
		safe_cast(`nomensamble` as STRING) as nomensamble,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`claubicacion` as INT64) as claubicacion,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`claveensamble` as STRING) as claveensamble,
		safe_cast(`fechautimamod` as DATETIME) as fechautimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`claensamblepadre` as INT64) as claensamblepadre,
		safe_cast(`claestatusensamble` as INT64) as claestatusensamble,
		safe_cast(`clafamiliaensamble` as INT64) as clafamiliaensamble,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`clasubfamiliaensamble` as INT64) as clasubfamiliaensamble,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','MtoSch_MtoCatEnsamble')}}
)
select * from stg_mtocatensamble