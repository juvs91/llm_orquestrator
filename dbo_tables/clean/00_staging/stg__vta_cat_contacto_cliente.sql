with stg_vtacatcontactocliente as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_vtacatcontactocliente,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`fax` as STRING) as fax,
		safe_cast(`lada` as STRING) as lada,
		safe_cast(`radio` as STRING) as radio,
		safe_cast(`correo` as STRING) as correo,
		safe_cast(`cucsfid` as STRING) as cucsfid,
		safe_cast(`ladafax` as STRING) as ladafax,
		safe_cast(`telefono` as STRING) as telefono,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`contactosfid` as STRING) as contactosfid,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`claclienteunico` as INT64) as claclienteunico,
		safe_cast(`clatipocontacto` as INT64) as clatipocontacto,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`clacontactocliente` as INT64) as clacontactocliente,
		safe_cast(`claveinternacional` as STRING) as claveinternacional,
		safe_cast(`nomcontactocliente` as STRING) as nomcontactocliente,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`claveinternacionalfax` as STRING) as claveinternacionalfax,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','dbo_VtaCatContactoCliente')}}
)
select * from stg_vtacatcontactocliente