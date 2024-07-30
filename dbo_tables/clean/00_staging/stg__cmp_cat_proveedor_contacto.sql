with stg_cmpcatproveedorcontacto as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_cmpcatproveedorcontacto,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`fax` as STRING) as fax,
		safe_cast(`email` as STRING) as email,
		safe_cast(`radio` as STRING) as radio,
		safe_cast(`clacup` as INT64) as clacup,
		safe_cast(`puesto` as STRING) as puesto,
		safe_cast(`telefono` as STRING) as telefono,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`idcontacto` as INT64) as idcontacto,
		safe_cast(`nomcontacto` as STRING) as nomcontacto,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`claproveedor` as INT64) as claproveedor,
		safe_cast(`claubicacion` as INT64) as claubicacion,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`telefonomovil` as STRING) as telefonomovil,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`clatipoproveedor` as INT64) as clatipoproveedor,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','dbo_CmpCatProveedorContacto')}}
)
select * from stg_cmpcatproveedorcontacto