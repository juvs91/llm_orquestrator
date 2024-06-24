with stg_concatdetalle as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_concatdetalle,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`cladetalle` as INT64) as cladetalle,
		safe_cast(`comentario` as STRING) as comentario,
		safe_cast(`numdetalle` as STRING) as numdetalle,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`clausuariocaptura` as INT64) as clausuariocaptura,
		upper(safe_cast(`nomdetalleidioma1` as STRING)) as nomdetalleidioma1,
		upper(safe_cast(`nomdetalleidioma2` as STRING)) as nomdetalleidioma2,
		safe_cast(`nomdetalleidioma3` as STRING) as nomdetalleidioma3,
		safe_cast(`nomdetalleidioma4` as STRING) as nomdetalleidioma4,
		safe_cast(`nomdetalleidioma5` as STRING) as nomdetalleidioma5,
		safe_cast(`clausuarioautoriza` as INT64) as clausuarioautoriza,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`claestatuscatalogoopc` as INT64) as claestatuscatalogoopc,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','dbo_ConCatDetalle')}}
)
select * from stg_concatdetalle