with stg_mtocatauditoriabase as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_mtocatauditoriabase,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`codigo` as INT64) as codigo,
		safe_cast(`nvalor` as INT64) as nvalor,
		safe_cast(`version` as INT64) as version,
		safe_cast(`claequipo` as INT64) as claequipo,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`claubicacion` as INT64) as claubicacion,
		safe_cast(`clafrecuencia` as INT64) as clafrecuencia,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`claauditoriabase` as INT64) as claauditoriabase,
		safe_cast(`clatipoauditoria` as INT64) as clatipoauditoria,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`clanominaresponsable` as INT64) as clanominaresponsable,
		safe_cast(`claestatusauditoriabase` as INT64) as claestatusauditoriabase,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no,
		safe_cast(`clatrabajadorresponsable` as INT64) as clatrabajadorresponsable
	from {{source('src_prod_kraken_abt','MtoSch_MtoCatAuditoriaBase')}}
)
select * from stg_mtocatauditoriabase