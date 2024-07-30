with stg_opecattipomaterial as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_opecattipomaterial,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`pesokgs` as INT64) as pesokgs,
		safe_cast(`bloqueado` as INT64) as bloqueado,
		safe_cast(`claunidad` as INT64) as claunidad,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`claarticulo` as INT64) as claarticulo,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`claubicacion` as INT64) as claubicacion,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`costounitario` as FLOAT64) as costounitario,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`clatipomaterial` as INT64) as clatipomaterial,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`nomtipomaterial` as STRING) as nomtipomaterial,
		safe_cast(`clagrupomaterial` as INT64) as clagrupomaterial,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','OpeSch_OpeCatTipoMaterial')}}
)
select * from stg_opecattipomaterial