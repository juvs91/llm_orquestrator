with stg_nomcatdepartamento as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_nomcatdepartamento,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`estatus` as INT64) as estatus,
		safe_cast(`clanomina` as INT64) as clanomina,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`claempresa` as INT64) as claempresa,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`claubicacion` as INT64) as claubicacion,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`cladepartamento` as INT64) as cladepartamento,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`nomdepartamento` as STRING) as nomdepartamento,
		safe_cast(`departamentodesc` as STRING) as departamentodesc,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','dbo_NomCatDepartamento')}}
)
select * from stg_nomcatdepartamento