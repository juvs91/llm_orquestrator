with stg_vtacatpais as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_vtacatpais,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`clapais` as INT64) as clapais,
		upper(safe_cast(`nompais` as STRING)) as nompais,
		safe_cast(`prefijo` as STRING) as prefijo,
		safe_cast(`fechains` as DATETIME) as fechains,
		safe_cast(`clamoneda` as INT64) as clamoneda,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`nompaisesp` as STRING) as nompaisesp,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`nomcortopais` as STRING) as nomcortopais,
		safe_cast(`clapaislegacy` as INT64) as clapaislegacy,
		safe_cast(`clausuarioins` as INT64) as clausuarioins,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`claidiomalegacy` as INT64) as claidiomalegacy,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`nompaiscortosat` as STRING) as nompaiscortosat,
		safe_cast(`tipoestadistica` as INT64) as tipoestadistica,
		safe_cast(`clamedioembarque` as INT64) as clamedioembarque,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','dbo_VtaCatPais')}}
)
select * from stg_vtacatpais