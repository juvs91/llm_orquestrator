with stg_fiscatimpuesto as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_fiscatimpuesto,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`clapaiscon` as INT64) as clapaiscon,
		safe_cast(`claimpuesto` as INT64) as claimpuesto,
		safe_cast(`nomimpuesto` as STRING) as nomimpuesto,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`esaplicanexu` as INT64) as esaplicanexu,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`esparasfanual` as INT64) as esparasfanual,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`idreporterubros` as INT64) as idreporterubros,
		safe_cast(`fechafinvigencia` as DATETIME) as fechafinvigencia,
		safe_cast(`nomimpuestocorto` as STRING) as nomimpuestocorto,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`fechainiciovigencia` as DATETIME) as fechainiciovigencia,
		safe_cast(`espararesultadofiscal` as INT64) as espararesultadofiscal,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','FISSch_FisCatImpuesto')}}
)
select * from stg_fiscatimpuesto