with stg_concatcategoria as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_concatcategoria,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`esafectable` as INT64) as esafectable,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`clacategoria` as INT64) as clacategoria,
		safe_cast(`clacategoria1` as INT64) as clacategoria1,
		safe_cast(`clacategoria2` as INT64) as clacategoria2,
		safe_cast(`clacategoria3` as INT64) as clacategoria3,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`clanivelactual` as INT64) as clanivelactual,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		upper(safe_cast(`nomcategoriaidioma1` as STRING)) as nomcategoriaidioma1,
		upper(safe_cast(`nomcategoriaidioma2` as STRING)) as nomcategoriaidioma2,
		upper(safe_cast(`nomcategoriaidioma3` as STRING)) as nomcategoriaidioma3,
		upper(safe_cast(`nomcategoriaidioma4` as STRING)) as nomcategoriaidioma4,
		upper(safe_cast(`nomcategoriaidioma5` as STRING)) as nomcategoriaidioma5,
		safe_cast(`claagrupadorfinanciero` as INT64) as claagrupadorfinanciero,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','ConSch_ConCatCategoria')}}
)
select * from stg_concatcategoria