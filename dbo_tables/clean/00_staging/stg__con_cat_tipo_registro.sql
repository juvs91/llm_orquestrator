with stg_concattiporegistro as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_concattiporegistro,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`esiva` as INT64) as esiva,
		safe_cast(`claflujo` as INT64) as claflujo,
		safe_cast(`escontrol` as BOOL) as escontrol,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`esproveedor` as BOOL) as esproveedor,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`clatiporegistro` as INT64) as clatiporegistro,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`nomtiporegistro` as STRING) as nomtiporegistro,
		safe_cast(`nomtiporegistro2` as STRING) as nomtiporegistro2,
		safe_cast(`nomtiporegistro3` as STRING) as nomtiporegistro3,
		safe_cast(`nomtiporegistro4` as STRING) as nomtiporegistro4,
		safe_cast(`nomtiporegistro5` as STRING) as nomtiporegistro5,
		safe_cast(`esenlineaencierre` as BOOL) as esenlineaencierre,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','dbo_ConCatTipoRegistro')}}
)
select * from stg_concattiporegistro