with stg_artcatfamilia as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_artcatfamilia,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`clafamilia` as INT64) as clafamilia,
		safe_cast(`clafamilia` as STRING) as clafamilia_string,
		safe_cast(`esagrupado` as INT64) as esagrupado,
		upper(safe_cast(`nomfamilia` as STRING)) as nomfamilia,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`clavefamilia` as INT64) as clavefamilia,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		upper(safe_cast(`nomfamiliaingles` as STRING)) as nomfamiliaingles,
		safe_cast(`clatipoinventario` as INT64) as clatipoinventario,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		upper(safe_cast(`nomfamiliaotroidioma` as STRING)) as nomfamiliaotroidioma,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no,
		safe_cast(`clavefamiliaalfanumerica` as STRING) as clavefamiliaalfanumerica
	from {{source('src_prod_kraken_abt','dbo_ArtCatFamilia')}}
)
select * from stg_artcatfamilia