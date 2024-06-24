with stg_vtacattransportista as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_vtacattransportista,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`contacto` as STRING) as contacto,
		safe_cast(`telefono` as STRING) as telefono,
		safe_cast(`direccion` as STRING) as direccion,
		safe_cast(`poblacion` as STRING) as poblacion,
		safe_cast(`idubicacion` as INT64) as idubicacion,
		safe_cast(`razonsocial` as STRING) as razonsocial,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`clatransportista` as INT64) as clatransportista,
		safe_cast(`nomtransportista` as STRING) as nomtransportista,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','VtaSch_VtaCatTransportista')}}
)
select * from stg_vtacattransportista