with stg_artcatvalor as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_artcatvalor,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`clavalor` as INT64) as clavalor,
		safe_cast(`nomvalor` as STRING) as nomvalor,
		safe_cast(`numvalor` as FLOAT64) as numvalor,
		safe_cast(`claunidad` as INT64) as claunidad,
		safe_cast(`numvalor2` as FLOAT64) as numvalor2,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`rutaimagen` as STRING) as rutaimagen,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`carcodigoart` as STRING) as carcodigoart,
		safe_cast(`etiquetadesc` as STRING) as etiquetadesc,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`ordenconsulta` as INT64) as ordenconsulta,
		safe_cast(`etiquetacertif` as STRING) as etiquetacertif,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`clacaracteristica` as INT64) as clacaracteristica,
		safe_cast(`clatipoinventario` as INT64) as clatipoinventario,
		safe_cast(`etiquetacertifing` as STRING) as etiquetacertifing,
		safe_cast(`etiquetadescingles` as STRING) as etiquetadescingles,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`etiquetadescotroidioma` as STRING) as etiquetadescotroidioma,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','dbo_ArtCatValor')}}
)
select * from stg_artcatvalor