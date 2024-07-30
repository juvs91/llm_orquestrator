with stg_tescatmoneda as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_tescatmoneda,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`orden` as INT64) as orden,
		safe_cast(`fechains` as DATETIME) as fechains,
		safe_cast(`clamoneda` as INT64) as clamoneda,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`nommonedaen` as STRING) as nommonedaen,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		upper(safe_cast(`nombremoneda` as STRING)) as nombremoneda,
		safe_cast(`clausuarioins` as INT64) as clausuarioins,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`nombreimprimir` as STRING) as nombreimprimir,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`clamonedaventas` as INT64) as clamonedaventas,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`nombrecortomoneda` as STRING) as nombrecortomoneda,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`nombrecortoblomberg` as STRING) as nombrecortoblomberg,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','dbo_TesCatMoneda')}}
)
select * from stg_tescatmoneda