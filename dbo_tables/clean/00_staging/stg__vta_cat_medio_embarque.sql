with stg_vtacatmedioembarque as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_vtacatmedioembarque,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`zonainfluencia` as INT64) as zonainfluencia,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`tipoestadistica` as INT64) as tipoestadistica,
		safe_cast(`clamedioembarque` as INT64) as clamedioembarque,
		safe_cast(`nommedioembarque` as STRING) as nommedioembarque,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`nommedioembarqueing` as STRING) as nommedioembarqueing,
		safe_cast(`clatipomedioembarque` as INT64) as clatipomedioembarque,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no,
		safe_cast(`clatipomedioembarquelegacy` as INT64) as clatipomedioembarquelegacy
	from {{source('src_prod_kraken_abt','dbo_VtaCatMedioEmbarque')}}
)
select * from stg_vtacatmedioembarque