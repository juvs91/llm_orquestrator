with stg_mswcfgbscgpoestsegmento as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_mswcfgbscgpoestsegmento,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`clasegmento` as INT64) as clasegmento,
		safe_cast(`nomsegmento` as STRING) as nomsegmento,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`nomgrupomismonombre` as STRING) as nomgrupomismonombre,
		safe_cast(`clagrupoestadistico1` as INT64) as clagrupoestadistico1,
		safe_cast(`clagrupoestadistico2` as INT64) as clagrupoestadistico2,
		safe_cast(`clagrupoestadistico3` as INT64) as clagrupoestadistico3,
		safe_cast(`clasegmentomanufactura` as INT64) as clasegmentomanufactura,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','MSWSch_MSWCfgBSCGpoEstSegmento')}}
)
select * from stg_mswcfgbscgpoestsegmento