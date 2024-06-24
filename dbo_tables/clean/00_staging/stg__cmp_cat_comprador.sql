with stg_cmpcatcomprador as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_cmpcatcomprador,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`email` as STRING) as email,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`clausuario` as INT64) as clausuario,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`clacomprador` as INT64) as clacomprador,
		safe_cast(`nomcomprador` as STRING) as nomcomprador,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`esnegociadoracu` as INT64) as esnegociadoracu,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`claubicacionbase` as INT64) as claubicacionbase,
		safe_cast(`esmultiubicacion` as INT64) as esmultiubicacion,
		--safe_cast(`firmaelectronica` as STRING) as firmaelectronica,
		safe_cast(`recibecopiapedido` as INT64) as recibecopiapedido,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','dbo_CmpCatComprador')}}
)
select * from stg_cmpcatcomprador