with stg_mtocattipoindicador as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_mtocattipoindicador,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`orden` as INT64) as orden,
		safe_cast(`perfil` as STRING) as perfil,
		safe_cast(`proceso` as INT64) as proceso,
		safe_cast(`objetivo` as FLOAT64) as objetivo,
		safe_cast(`unidades` as STRING) as unidades,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`promediarsn` as BOOL) as promediarsn,
		safe_cast(`tipoperiodo` as INT64) as tipoperiodo,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`claubicacion` as INT64) as claubicacion,
		safe_cast(`recalcularsn` as BOOL) as recalcularsn,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`clasificacion` as INT64) as clasificacion,
		safe_cast(`ordenreportes` as INT64) as ordenreportes,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`clatipoindicador` as INT64) as clatipoindicador,
		safe_cast(`nomtipoindicador` as STRING) as nomtipoindicador,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','MtoSch_MtoCatTipoIndicador')}}
)
select * from stg_mtocattipoindicador