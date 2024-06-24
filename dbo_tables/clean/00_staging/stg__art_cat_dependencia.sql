with stg_artcatdependencia as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_artcatdependencia,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`cladependencia` as INT64) as cladependencia,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`nomdependencia` as STRING) as nomdependencia,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`clatipoinventario` as INT64) as clatipoinventario,
		safe_cast(`clacaracteristica1` as INT64) as clacaracteristica1,
		safe_cast(`clacaracteristica2` as INT64) as clacaracteristica2,
		safe_cast(`clacaracteristica3` as INT64) as clacaracteristica3,
		safe_cast(`clacaracteristica4` as INT64) as clacaracteristica4,
		safe_cast(`clacaracteristica5` as INT64) as clacaracteristica5,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`clacaracteristicadep1` as INT64) as clacaracteristicadep1,
		safe_cast(`clacaracteristicadep2` as INT64) as clacaracteristicadep2,
		safe_cast(`clacaracteristicadep3` as INT64) as clacaracteristicadep3,
		safe_cast(`clacaracteristicadep4` as INT64) as clacaracteristicadep4,
		safe_cast(`clacaracteristicadep5` as INT64) as clacaracteristicadep5,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','dbo_ArtCatDependencia')}}
)
select * from stg_artcatdependencia