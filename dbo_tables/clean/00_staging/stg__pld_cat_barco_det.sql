with stg_pldcatbarcodet as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_pldcatbarcodet,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`idbarco` as INT64) as idbarco,
		safe_cast(`renglon` as INT64) as renglon,
		safe_cast(`fechains` as DATETIME) as fechains,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`clacliente` as INT64) as clacliente,
		safe_cast(`folproducto` as INT64) as folproducto,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`renpedidocte` as INT64) as renpedidocte,
		safe_cast(`cantporsurtir` as FLOAT64) as cantporsurtir,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`clapedidocliente` as INT64) as clapedidocliente,
		safe_cast(`clapedidotraspaso` as INT64) as clapedidotraspaso,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`claubicaciontraspaso` as INT64) as claubicaciontraspaso,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','PLDSch_PldCatBarcoDet')}}
)
select * from stg_pldcatbarcodet