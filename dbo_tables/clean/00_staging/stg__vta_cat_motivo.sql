with stg_vtacatmotivo as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_vtacatmotivo,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`estatus` as INT64) as estatus,
		safe_cast(`fechains` as DATETIME) as fechains,
		safe_cast(`clamotivo` as INT64) as clamotivo,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`tiporechazo` as INT64) as tiporechazo,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		upper(safe_cast(`nombremotivo` as STRING)) as nombremotivo,
		safe_cast(`clatipomotivo` as INT64) as clatipomotivo,
		safe_cast(`clausuarioins` as INT64) as clausuarioins,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`clatipocancelacion` as INT64) as clatipocancelacion,
		safe_cast(`nombremotivoingles` as STRING) as nombremotivoingles,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`claorigencancelacion` as INT64) as claorigencancelacion,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','dbo_VtaCatMotivo')}}
)
select * from stg_vtacatmotivo