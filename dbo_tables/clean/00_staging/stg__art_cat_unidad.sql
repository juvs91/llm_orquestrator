with stg_artcatunidad as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_artcatunidad,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`claunidad` as INT64) as claunidad,
		safe_cast(`esunibase` as INT64) as esunibase,
		safe_cast(`esuniprod` as INT64) as esuniprod,
		upper(safe_cast(`nomunidad` as STRING)) as nomunidad,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`esunicaract` as INT64) as esunicaract,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`clagpounidad` as INT64) as clagpounidad,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`nomcortounidad` as STRING) as nomcortounidad,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`esuniconversion` as INT64) as esuniconversion,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`clatipoinventario` as INT64) as clatipoinventario,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`nomcortounidadingles` as STRING) as nomcortounidadingles,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no,
		safe_cast(`nomcortounidadotroidioma` as STRING) as nomcortounidadotroidioma
	from {{source('src_prod_kraken_abt','dbo_ArtCatUnidad')}}
)
select * from stg_artcatunidad