with stg_palcatdiasinproduccion as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_palcatdiasinproduccion,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`fecha` as DATETIME) as fecha,
		safe_cast(`claarea` as INT64) as claarea,
		safe_cast(`eshabil` as INT64) as eshabil,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`listaturnos` as STRING) as listaturnos,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`claubicacion` as INT64) as claubicacion,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`cladepartamento` as INT64) as cladepartamento,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`cladiasinproduccion` as INT64) as cladiasinproduccion,
		safe_cast(`nomdiasinproduccion` as STRING) as nomdiasinproduccion,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','PALSch_PALCatDiaSinProduccion')}}
)
select * from stg_palcatdiasinproduccion