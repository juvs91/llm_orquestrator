with stg_expcatincoterm as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_expcatincoterm,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`claincoterm` as INT64) as claincoterm,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`descincoterm` as STRING) as descincoterm,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`contienepedido` as INT64) as contienepedido,
		safe_cast(`enviaragrupado` as INT64) as enviaragrupado,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`nombreincoterm` as STRING) as nombreincoterm,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`contienetrafico` as INT64) as contienetrafico,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`contieneembarque` as INT64) as contieneembarque,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','dbo_ExpCatIncoterm')}}
)
select * from stg_expcatincoterm