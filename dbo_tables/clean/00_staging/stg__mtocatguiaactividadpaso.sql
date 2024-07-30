with stg_mtocatguiaactividadpaso as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_mtocatguiaactividadpaso,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`paso` as STRING) as paso,
		safe_cast(`orden` as INT64) as orden,
		safe_cast(`claguia` as INT64) as claguia,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`predecesor` as INT64) as predecesor,
		safe_cast(`descripcion` as STRING) as descripcion,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`claubicacion` as INT64) as claubicacion,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`nombrearchivo` as STRING) as nombrearchivo,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`tiempoestimado` as FLOAT64) as tiempoestimado,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`claguiaactividad` as INT64) as claguiaactividad,
		safe_cast(`espuntocontrolsn` as BOOL) as espuntocontrolsn,
		safe_cast(`extensionarchivo` as STRING) as extensionarchivo,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`claguiaactividadpaso` as INT64) as claguiaactividadpaso,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','MtoSch_MtoCatGuiaActividadPaso')}}
)
select * from stg_mtocatguiaactividadpaso