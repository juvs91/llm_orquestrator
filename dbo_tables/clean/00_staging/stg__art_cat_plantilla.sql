with stg_artcatplantilla as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_artcatplantilla,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`prefijo` as STRING) as prefijo,
		safe_cast(`claunspc1` as INT64) as claunspc1,
		safe_cast(`claunspc2` as INT64) as claunspc2,
		safe_cast(`claunspc3` as INT64) as claunspc3,
		safe_cast(`claunspc4` as INT64) as claunspc4,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`claplantilla` as INT64) as claplantilla,
		safe_cast(`nomplantilla` as STRING) as nomplantilla,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`prefijoingles` as STRING) as prefijoingles,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`esdisponibleuso` as INT64) as esdisponibleuso,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`clatipoinventario` as INT64) as clatipoinventario,
		safe_cast(`prefijootroidioma` as STRING) as prefijootroidioma,
		safe_cast(`nomplantillaingles` as STRING) as nomplantillaingles,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`nomplantillaotroidioma` as STRING) as nomplantillaotroidioma,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','dbo_ArtCatPlantilla')}}
)
select * from stg_artcatplantilla