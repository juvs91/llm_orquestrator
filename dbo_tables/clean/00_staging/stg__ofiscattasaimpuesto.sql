with stg_ofiscattasaimpuesto as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_ofiscattasaimpuesto,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`porcentaje` as FLOAT64) as porcentaje,
		safe_cast(`claimpuesto` as INT64) as claimpuesto,
		safe_cast(`fechainicio` as DATETIME) as fechainicio,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`fechavigente` as DATETIME) as fechavigente,
		safe_cast(`nomdocumento` as STRING) as nomdocumento,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`claveimpuesto` as INT64) as claveimpuesto,
		safe_cast(`fechacreacion` as DATETIME) as fechacreacion,
		safe_cast(`tipodocumento` as STRING) as tipodocumento,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`clatipoimpuesto` as INT64) as clatipoimpuesto,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','dbo_OFISCatTasaImpuesto')}}
)
select * from stg_ofiscattasaimpuesto