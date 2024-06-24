with stg_vtacatciudad as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_vtacatciudad,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`clapais` as INT64) as clapais,
		safe_cast(`fechains` as DATETIME) as fechains,
		safe_cast(`claciudad` as INT64) as claciudad,
		safe_cast(`claestado` as INT64) as claestado,
		upper(safe_cast(`nomciudad` as STRING)) as nomciudad,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`fronterasn` as INT64) as fronterasn,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`clausuarioins` as INT64) as clausuarioins,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`porcentajeiva` as FLOAT64) as porcentajeiva,
		safe_cast(`claciudadunico` as INT64) as claciudadunico,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`claciudadlegacy` as INT64) as claciudadlegacy,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','dbo_VtaCatCiudad')}}
)
select * from stg_vtacatciudad