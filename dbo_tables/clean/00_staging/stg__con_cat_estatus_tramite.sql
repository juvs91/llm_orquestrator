with stg_concatestatustramite as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_concatestatustramite,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`espagado` as INT64) as espagado,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`escancelado` as INT64) as escancelado,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`escancelable` as BOOL) as escancelable,
		safe_cast(`claestatustes` as INT64) as claestatustes,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`esentesoreria` as INT64) as esentesoreria,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`escontabilizado` as INT64) as escontabilizado,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`claestatustramite` as INT64) as claestatustramite,
		safe_cast(`nomestatusexterno` as STRING) as nomestatusexterno,
		safe_cast(`nomestatustramite` as STRING) as nomestatustramite,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','dbo_ConCatEstatusTramite')}}
)
select * from stg_concatestatustramite