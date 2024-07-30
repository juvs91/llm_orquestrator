with stg_mancatmaquina as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_mancatmaquina,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`claarea` as INT64) as claarea,
		safe_cast(`claplanta` as INT64) as claplanta,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`clamaquina` as STRING) as clamaquina,
		safe_cast(`nommaquina` as STRING) as nommaquina,
		safe_cast(`numlininst` as INT64) as numlininst,
		safe_cast(`comentarios` as STRING) as comentarios,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`porcmaxefic` as FLOAT64) as porcmaxefic,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`clagpomaquina` as STRING) as clagpomaquina,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`generaentautsn` as INT64) as generaentautsn,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`clatiporeporteprod` as INT64) as clatiporeporteprod,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','dbo_ManCatMaquina')}}
)
select * from stg_mancatmaquina