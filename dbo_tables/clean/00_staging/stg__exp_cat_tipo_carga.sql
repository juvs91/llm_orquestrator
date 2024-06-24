with stg_expcattipocarga as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_expcattipocarga,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`nombre` as STRING) as nombre,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`descripcion` as STRING) as descripcion,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`clatipocarga` as INT64) as clatipocarga,
		safe_cast(`escontenedor` as INT64) as escontenedor,
		safe_cast(`nombreingles` as STRING) as nombreingles,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`considerarpeso` as INT64) as considerarpeso,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`considerardimension` as INT64) as considerardimension,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','dbo_ExpCatTipoCarga')}}
)
select * from stg_expcattipocarga