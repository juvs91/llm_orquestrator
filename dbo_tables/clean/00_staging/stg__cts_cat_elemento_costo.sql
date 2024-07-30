with stg_ctscatelementocosto as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_ctscatelementocosto,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`fechains` as DATETIME) as fechains,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`claelementocosto` as INT64) as claelementocosto,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`nombreelementocosto` as STRING) as nombreelementocosto,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no,
		safe_cast(`nombreelementocostoidioma2` as STRING) as nombreelementocostoidioma2,
		safe_cast(`nombreelementocostoidioma3` as STRING) as nombreelementocostoidioma3,
		safe_cast(`nombreelementocostoidioma4` as STRING) as nombreelementocostoidioma4,
		safe_cast(`nombreelementocostoidioma5` as STRING) as nombreelementocostoidioma5
	from {{source('src_prod_kraken_abt','dbo_CtsCatElementoCosto')}}
)
select * from stg_ctscatelementocosto