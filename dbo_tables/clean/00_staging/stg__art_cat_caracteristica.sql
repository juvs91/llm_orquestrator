with stg_artcatcaracteristica as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_artcatcaracteristica,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`separador` as STRING) as separador,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`observaciones` as STRING) as observaciones,
		safe_cast(`esporubicacion` as INT64) as esporubicacion,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`clacaracteristica` as INT64) as clacaracteristica,
		safe_cast(`clatipoinventario` as INT64) as clatipoinventario,
		safe_cast(`nomcaracteristica` as STRING) as nomcaracteristica,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`clatipocaracteristica` as INT64) as clatipocaracteristica,
		safe_cast(`clagrupocaracteristica` as INT64) as clagrupocaracteristica,
		safe_cast(`nomcaracteristicaingles` as STRING) as nomcaracteristicaingles,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no,
		safe_cast(`nomcaracteristicaotroidioma` as STRING) as nomcaracteristicaotroidioma
	from {{source('src_prod_kraken_abt','dbo_ArtCatCaracteristica')}}
)
select * from stg_artcatcaracteristica