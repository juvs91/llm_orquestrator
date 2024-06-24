with stg_mancatgpomaquina as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_mancatgpomaquina,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`claplanta` as INT64) as claplanta,
		safe_cast(`velocidad` as FLOAT64) as velocidad,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`clatipovtvel` as INT64) as clatipovtvel,
		safe_cast(`clagpomaquina` as STRING) as clagpomaquina,
		safe_cast(`clatecnologia` as INT64) as clatecnologia,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`nomgpomaquina` as STRING) as nomgpomaquina,
		safe_cast(`claunidadvtvel` as INT64) as claunidadvtvel,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`clatipovttiempo` as INT64) as clatipovttiempo,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`tiempoinherente` as FLOAT64) as tiempoinherente,
		safe_cast(`claunidadvttiempo` as INT64) as claunidadvttiempo,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','dbo_ManCatGpoMaquina')}}
)
select * from stg_mancatgpomaquina