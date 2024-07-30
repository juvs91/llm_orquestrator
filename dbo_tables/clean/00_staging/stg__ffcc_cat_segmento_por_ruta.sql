with stg_ffcccatsegmentoporruta as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_ffcccatsegmentoporruta,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`kms` as FLOAT64) as kms,
		safe_cast(`orden` as INT64) as orden,
		safe_cast(`claruta` as INT64) as claruta,
		safe_cast(`pagable` as INT64) as pagable,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`clasegmento` as INT64) as clasegmento,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`clapaisorigen` as INT64) as clapaisorigen,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`claferroviaria` as INT64) as claferroviaria,
		safe_cast(`clapaisdestino` as INT64) as clapaisdestino,
		safe_cast(`clasegmentorel` as INT64) as clasegmentorel,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`claciudadorigen` as INT64) as claciudadorigen,
		safe_cast(`claestadoorigen` as INT64) as claestadoorigen,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`claciudaddestino` as INT64) as claciudaddestino,
		safe_cast(`claestadodestino` as INT64) as claestadodestino,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','FFCCSch_FFCCCatSegmentoPorRuta')}}
)
select * from stg_ffcccatsegmentoporruta